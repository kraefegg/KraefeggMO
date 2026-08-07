# ============================================================================
# Kraefegg M.O. — inicializa o PostgreSQL local (instância instalada via serviço)
# PRECISA ser executado como ADMINISTRADOR (Direitos administrativos) porque:
#   - edita C:\Program Files\PostgreSQL\<ver>\data\pg_hba.conf
#   - reinicia o serviço postgresql-x64-*
#
# O que faz (idempotente):
#   1. Detecta a instalação/porta/serviço do PostgreSQL
#   2. Faz backup do pg_hba.conf e alterna para "trust" (temporário)
#   3. Reinicia o serviço
#   4. Cria ROLE kraefegg + DATABASE kraefegg (dedicados) se não existirem
#   5. Aplica db/schema.sql + db/seed.sql
#   6. Restaura o pg_hba.conf original e reinicia o serviço
#   7. Valida com algumas views executivas
#
# Uso:  clicar com o botão direito > "Executar com PowerShell (Admin)"
#       ou: Start-Process powershell -Verb RunAs -ArgumentList '-File db\init-postgres-local.ps1'
# ============================================================================

$ErrorActionPreference = 'Stop'

# --- pré-requisito: admin ---
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Warning 'Este script precisa de direitos de administrador.'
    $choice = Read-Host 'Reabrir elevado? [S/n]'
    if ($choice -notmatch '^(s|sim|y|yes)?$') { exit 1 }
    $repo = Split-Path -Parent $PSScriptRoot
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -WorkingDirectory $repo
    exit 0
}

# --- localiza a instalação do PostgreSQL ---
$pgBase = Get-ChildItem 'C:\Program Files\PostgreSQL' -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending | Select-Object -First 1
if (-not $pgBase) { Write-Error 'PostgreSQL não encontrado em C:\Program Files\PostgreSQL'; exit 1 }
$bin = Join-Path $pgBase.FullName 'bin'
$data = Join-Path $pgBase.FullName 'data'
if (-not (Test-Path (Join-Path $bin 'psql.exe'))) { Write-Error 'psql.exe não encontrado'; exit 1 }
if (-not (Test-Path (Join-Path $data 'pg_hba.conf'))) { Write-Error 'pg_hba.conf não encontrado'; exit 1 }
$svc = (Get-Service -Name 'postgresql*' -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'postgresql-x64-*' } | Select-Object -First 1).Name
if (-not $svc) { Write-Error 'Serviço postgresql-x64-* não encontrado'; exit 1 }
Write-Host "Instalação: $($pgBase.Name) | serviço: $svc | porta: 5432" -ForegroundColor Cyan

$psql  = Join-Path $bin 'psql.exe'
$pgCtl = Join-Path $bin 'pg_ctl.exe'
$hba   = Join-Path $data 'pg_hba.conf'
$hbaBak = "$hba.kraefegg-bak"
$hbaNew = "$hba.new"

function Restart-PgService {
    Restart-Service -Name $svc -Force -ErrorAction Stop
    Start-Sleep -Seconds 3
}

function Invoke-PsSql {
    param([string]$Sql)
    & $psql -h 127.0.0.1 -p 5432 -U postgres -d postgres -w -t -c $Sql 2>&1
    if ($LASTEXITCODE -ne 0) { throw "psql falhou: $Sql" }
}

Write-Host ''
Write-Host '>>> Passo 2/7 — backup + trust temporário no pg_hba.conf' -ForegroundColor Cyan
if (-not (Test-Path $hbaBak)) { Copy-Item $hba $hbaBak }
(Get-Content $hba) -replace '^(\s*(local\s|host\s).*)(scram-sha-256|md5)(.*)$', '$1trust$4' | Set-Content $hbaNew
Move-Item $hbaNew $hba -Force

try {
    Write-Host '>>> Passo 3/7 — reiniciando serviço' -ForegroundColor Cyan
    Restart-PgService

    Write-Host '>>> Passo 4/7 — criando ROLE kraefegg + DATABASE kraefegg' -ForegroundColor Cyan
    $role = & $psql -h 127.0.0.1 -p 5432 -U postgres -d postgres -w -t -A -c "SELECT 1 FROM pg_roles WHERE rolname='kraefegg';"
    if ("$role".Trim() -ne '1') {
        Invoke-PsSql "CREATE ROLE kraefegg LOGIN PASSWORD 'kraefegg_dev' CREATEDB;"
        Write-Host 'ROLE kraefegg criada (senha: kraefegg_dev).' -ForegroundColor Green
    } else { Write-Host 'ROLE kraefegg já existe.' -ForegroundColor Green }

    $db = & $psql -h 127.0.0.1 -p 5432 -U postgres -d postgres -w -t -A -c "SELECT 1 FROM pg_database WHERE datname='kraefegg';"
    if ("$db".Trim() -ne '1') {
        Invoke-PsSql 'CREATE DATABASE kraefegg OWNER kraefegg;'
        Write-Host 'DATABASE kraefegg criada.' -ForegroundColor Green
    } else { Write-Host 'DATABASE kraefegg já existe.' -ForegroundColor Green }

    Write-Host '>>> Passo 5/7 — aplicando schema.sql + seed.sql' -ForegroundColor Cyan
    $env:PGPASSWORD = 'kraefegg_dev'
    & $psql -h 127.0.0.1 -p 5432 -U kraefegg -d kraefegg -v ON_ERROR_STOP=1 -f (Join-Path $PSScriptRoot 'schema.sql')
    if ($LASTEXITCODE -ne 0) { throw 'schema.sql falhou' }
    & $psql -h 127.0.0.1 -p 5432 -U kraefegg -d kraefegg -v ON_ERROR_STOP=1 -f (Join-Path $PSScriptRoot 'seed.sql')
    if ($LASTEXITCODE -ne 0) { throw 'seed.sql falhou' }
    Remove-Item Env:\PGPASSWORD -ErrorAction SilentlyContinue
}
finally {
    Write-Host '>>> Passo 6/7 — restaurando pg_hba.conf original + reiniciando serviço' -ForegroundColor Cyan
    if (Test-Path $hbaBak) { Copy-Item $hbaBak $hba -Force }
    Restart-PgService
}

Write-Host '>>> Passo 7/7 — validação (conexão como kraefegg)' -ForegroundColor Cyan
$env:PGPASSWORD = 'kraefegg_dev'
& $psql -h 127.0.0.1 -p 5432 -U kraefegg -d kraefegg -w -c 'SELECT count(*) AS agentes FROM kraefegg.agentes;' -c 'SELECT codigo, nome, progresso FROM kraefegg.v_demandas_abertas ORDER BY prioridade DESC LIMIT 5;' -c 'SELECT * FROM kraefegg.v_painel_executivo;'
Remove-Item Env:\PGPASSWORD -ErrorAction SilentlyContinue
if ($LASTEXITCODE -ne 0) { Write-Error 'Validação falhou'; exit 1 }

Write-Host ''
Write-Host 'OK — PostgreSQL local da Kraefegg pronto.' -ForegroundColor Green
Write-Host 'Conexão: host localhost:5432 | user kraefegg | senha kraefegg_dev | db kraefegg' -ForegroundColor Green
