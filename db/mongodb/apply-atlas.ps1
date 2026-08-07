# ============================================================================
# Kraefegg M.O. — aplica schema + seed no MongoDB Atlas (remoto)
# Lê as credenciais de db/mongodb/.env e roda mongosh contra o MONGODB_URI.
# Uso:  .\db\mongodb\apply-atlas.ps1
# Pré-requisito: mongosh instalado localmente (https://www.mongodb.com/try/download/shell)
# ============================================================================

$ErrorActionPreference = 'Stop'

$envFile = Join-Path $PSScriptRoot '.env'
if (-not (Test-Path $envFile)) {
    Write-Error 'db/mongodb/.env não encontrado. Crie a partir das credenciais do Atlas.'
    exit 1
}

$vars = @{}
Get-Content $envFile | ForEach-Object {
    if ($_ -match '^\s*([A-Z_]+)\s*=\s*"?(.+?)"?\s*$') {
        $vars[$matches[1]] = $matches[2]
    }
}

$uri = $vars['MONGODB_URI']
if (-not $uri) {
    Write-Error 'MONGODB_URI ausente em db/mongodb/.env'
    exit 1
}

Write-Host "Aplicando schema contra Atlas: $($vars['MONGODB_USERNAME'])@cluster0..." -ForegroundColor Cyan
mongosh $uri --file (Join-Path $PSScriptRoot '01-schema.js')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host 'Aplicando seed...' -ForegroundColor Cyan
mongosh $uri --file (Join-Path $PSScriptRoot '02-seed.js')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host 'OK: schema + seed aplicados no Atlas.' -ForegroundColor Green
