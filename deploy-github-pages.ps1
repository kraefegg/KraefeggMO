# ============================================================================
# Kraefegg M.O. — ativa/garante o GitHub Pages para o repo e publica o HQ.
# Uso:
#   .\deploy-github-pages.ps1 -Token "github_pat_..."
#   $env:GITHUB_TOKEN = "github_pat_..."; .\deploy-github-pages.ps1
#
# O que faz:
#   1. (opcional) garante o repo PÚBLICO (necessário para Pages gratuito)
#   2. garante o GitHub Pages na branch/path escolhidos (cria se não existir)
#   3. aguarda o build terminar e imprime a URL do HQ
# ============================================================================

param(
    [string]$Owner   = 'kraefegg',
    [string]$Repo    = 'KraefeggMO',
    [string]$Branch  = 'main',
    [string]$Path    = '/',
    [string]$HqPath  = 'hq/corporate-hq.html',
    [string]$Token,
    [switch]$Public
)

$ErrorActionPreference = 'Stop'

if (-not $Token) { $Token = $env:GITHUB_TOKEN; if (-not $Token) { $Token = $env:GH_TOKEN } }
if (-not $Token) { Write-Error 'Informe -Token ou defina $env:GITHUB_TOKEN.'; exit 1 }

$headers = @{ Authorization = "Bearer $Token" }
$api = "https://api.github.com/repos/$Owner/$Repo"

# 1) Visibilidade pública (quando solicitado)
if ($Public) {
    $r = Invoke-RestMethod -Uri $api -Headers $headers -Method Get
    if ($r.private) {
        Write-Host 'Tornando o repo público...' -ForegroundColor Cyan
        Invoke-RestMethod -Uri $api -Headers $headers -Method Patch `
            -Body (@{ private = $false } | ConvertTo-Json) -ContentType 'application/json' | Out-Null
        Write-Host 'Repo agora é público.' -ForegroundColor Green
    } else {
        Write-Host 'Repo já está público.' -ForegroundColor Green
    }
}

# 2) Garante o GitHub Pages
try {
    $pages = Invoke-RestMethod -Uri "$api/pages" -Headers $headers -Method Get
    $source = "$($pages.source.branch)$($pages.source.path)"
    if ($source -ne "$Branch$Path") {
        Write-Host "Atualizando fonte do Pages para $Branch$Path..." -ForegroundColor Cyan
        Invoke-RestMethod -Uri "$api/pages" -Headers $headers -Method Put `
            -Body (@{ source = @{ branch = $Branch; path = $Path } } | ConvertTo-Json -Depth 5) -ContentType 'application/json' | Out-Null
    } else {
        Write-Host "Pages já ativo na fonte $Branch$Path." -ForegroundColor Green
    }
}
catch {
    if ($_.Exception.Response.StatusCode.value__ -eq 404) {
        Write-Host "Criando GitHub Pages ($Branch$Path)..." -ForegroundColor Cyan
        Invoke-RestMethod -Uri "$api/pages" -Headers $headers -Method Post `
            -Body (@{ source = @{ branch = $Branch; path = $Path } } | ConvertTo-Json -Depth 5) -ContentType 'application/json' | Out-Null
    } else { throw }
}

# 3) Aguarda o build concluir
Write-Host 'Aguardando build do Pages...' -ForegroundColor Cyan
for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Seconds 5
    $b = Invoke-RestMethod -Uri "$api/pages/builds/latest" -Headers $headers -Method Get
    if ($b.status -in 'built', 'deployed') { break }
    if ($b.status -eq 'errored') { Write-Error "Build do Pages falhou: $($b.error.message)"; exit 1 }
}
if ($b.status -notin 'built', 'deployed') { Write-Warning "Build ainda não concluiu (status: $($b.status)). Verifique depois." }

# 4) Imprime URLs
$root = "https://$Owner.github.io/$Repo"
Write-Host ''
Write-Host "Pages:     $root" -ForegroundColor Green
Write-Host "HQ:        $root/$HqPath" -ForegroundColor Green
Write-Host "Repo:      https://github.com/$Owner/$Repo" -ForegroundColor Green
