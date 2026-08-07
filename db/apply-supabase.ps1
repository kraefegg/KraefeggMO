# ============================================================================
# Kraefegg M.O. — aplica schema + seed no PostgreSQL hospedado (Supabase/Neon)
# Lê SUPABASE_URI de db/.env (ou use -Uri) e roda psql com schema.sql + seed.sql.
# Uso:  .\db\apply-supabase.ps1
# Pré-requisito: psql no PATH ou em C:\Program Files\PostgreSQL\<ver>\bin
# ============================================================================

param([string]$Uri)

$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot

if (-not $Uri) {
    $envFile = Join-Path $dir '.env'
    if (-not (Test-Path $envFile)) { Write-Error 'db/.env não encontrado (com SUPABASE_URI).'; exit 1 }
    $Uri = (Get-Content $envFile | Where-Object { $_ -match '^SUPABASE_URI=' } | ForEach-Object { ($_ -split '=', 2)[1].Trim('"') })
    if (-not $Uri) { Write-Error 'SUPABASE_URI ausente em db/.env'; exit 1 }
}

# localiza psql (PATH ou instalação local)
$psql = Get-Command psql -ErrorAction SilentlyContinue
if (-not $psql) {
    $cand = Get-ChildItem 'C:\Program Files\PostgreSQL' -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending | Select-Object -First 1
    if ($cand) { $psql = Get-ChildItem (Join-Path $cand.FullName 'bin\psql.exe') -ErrorAction SilentlyContinue | Select-Object -First 1 }
}
if (-not $psql) { Write-Error 'psql não encontrado.'; exit 1 }
$psqlPath = if ($psql.Source) { $psql.Source } else { $psql.FullName }

Write-Host 'Aplicando schema.sql...' -ForegroundColor Cyan
& $psqlPath $Uri -v ON_ERROR_STOP=1 -f (Join-Path $dir 'schema.sql')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host 'Aplicando seed.sql...' -ForegroundColor Cyan
& $psqlPath $Uri -v ON_ERROR_STOP=1 -f (Join-Path $dir 'seed.sql')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host 'Validação...' -ForegroundColor Cyan
& $psqlPath $Uri -w -c 'SELECT count(*) AS agentes FROM kraefegg.agentes;' `
    -c 'SELECT codigo, titulo, fase FROM kraefegg.v_demandas_abertas ORDER BY prioridade DESC LIMIT 3;' `
    -c 'SELECT * FROM kraefegg.v_painel_executivo;'
if ($LASTEXITCODE -ne 0) { Write-Error 'Validação falhou'; exit 1 }

Write-Host 'OK — schema + seed aplicados no PostgreSQL hospedado.' -ForegroundColor Green
