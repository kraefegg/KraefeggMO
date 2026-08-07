# ============================================================================
# Kraefegg M.O. — acesso SQL ao MongoDB Atlas (endpoint Atlas SQL, read-only)
# Lê credenciais de db/mongodb/.env e monta a URI de SQL a partir de
# MONGODB_SQL_URI (que NÃO contém credenciais).
#
# Uso:
#   .\db\mongodb\atlas-sql.ps1                             # valida conexão + exemplos
#   .\db\mongodb\atlas-sql.ps1 -File .\db\mongodb\sql\meu-arquivo.js   # arquivo próprio
#
# O arquivo .js roda no mongosh; consultas SQL são agregações a nível de
# banco:  db.aggregate([{ $sql: { statement: "SELECT ...", format: "relaxed" } }])
# ============================================================================

param([string]$File)

$ErrorActionPreference = 'Stop'

$dir = $PSScriptRoot
$envFile = Join-Path $dir '.env'

if (-not (Test-Path $envFile)) {
    Write-Error 'db/mongodb/.env não encontrado.'
    exit 1
}

$vars = @{}
Get-Content $envFile | ForEach-Object {
    if ($_ -match '^\s*([A-Z_]+)\s*=\s*"?(.+?)"?\s*$') { $vars[$matches[1]] = $matches[2] }
}

$hostUri = $vars['MONGODB_SQL_URI']
if (-not $hostUri) {
    Write-Error 'MONGODB_SQL_URI ausente em db/mongodb/.env'
    exit 1
}

# injeta usuário/senha no endpoint SQL
$user = $vars['MONGODB_USERNAME']
$pass = $vars['MONGODB_PASSWORD']
$sqlUri = $hostUri -replace '^mongodb(\+srv)?://', ("mongodb://{0}:{1}@" -f $user, $pass)

if (-not $File) { $File = Join-Path $dir 'sql-examples.js' }

Write-Host "Conectando ao Atlas SQL como $user..." -ForegroundColor Cyan
mongosh $sqlUri --file $File
exit $LASTEXITCODE
