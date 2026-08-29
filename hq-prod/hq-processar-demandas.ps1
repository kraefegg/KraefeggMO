# ============================================================
# HQ KRAEFEGG M.O. — Agente de Produção
# Processa as demandas abertas do Supabase com motor de IA
# (OpenRouter, modelo gratuito) e grava a análise de volta no banco.
#
# Uso:
#   $env:OPENROUTER_API_KEY="sk-or-..."
#   .\hq-processar-demandas.ps1 [-Fase analise|backlog|todas] [-MaxN 5]
#
# Sempre seguro: NÃO grava a chave em arquivo; lê da env var.
# ============================================================
[CmdletBinding()]
param(
    [string]$Fase = "todas",
    [int]$MaxN = 5
)

$ErrorActionPreference = "Stop"

# ---------- Config (publishable, sem segredo) ----------
$API_BASE = "https://mrqjmdfulmnggozwjxlq.supabase.co/rest/v1"
$API_KEY  = "sb_publishable_PGW_hFT4bnzA_bIS8EPx6g_LvxWNP4Y"
$OR_KEY   = if ($env:OPENROUTER_API_KEY) { $env:OPENROUTER_API_KEY } else { $null }

if (-not $OR_KEY) {
    Write-Error "Defina a variavel de ambiente OPENROUTER_API_KEY antes de rodar."
    exit 1
}

$MODEL = "minimax/minimax-m3:free"   # motor gratuito confiável (validado)
$HDR   = @{ "apikey"=$API_KEY; "Authorization"="Bearer "+$API_KEY; "Content-Type"="application/json" }
$OHDR  = @{ "Authorization"="Bearer "+$OR_KEY; "Content-Type"="application/json" }

# ---------- 1) Busca demandas abertas no Supabase ----------
$filtro = if ($Fase -eq "todas") { "fase=neq.concluida" } else { "fase=eq.$Fase" }
Write-Host "`n==> Buscando demandas abertas (fase=$Fase)..." -ForegroundColor Cyan
$demandas = @()
try {
    $demandas = (Invoke-RestMethod -Uri "$API_BASE/demandas?$filtro&select=codigo,titulo,fase,prioridade,progresso,responsavel&order=id.asc&limit=$MaxN" -Headers $HDR -TimeoutSec 20)
} catch {
    Write-Error "Falha ao buscar demandas: $($_.Exception.Message)"
    exit 1
}
if ($demandas.Count -eq 0) { Write-Host "Nenhuma demanda aberta na fase '$Fase'." -ForegroundColor Yellow; exit 0 }
Write-Host "Encontradas: $($demandas.Count)" -ForegroundColor Cyan

$resultados = @()

# ---------- 2) Analisa cada demanda ----------
foreach ($d in $demandas) {
    $prompt = @"
Atue como agente de producao do porto-dashboard. Analise esta demanda e responda SOMENTE com JSON valido (sem texto extra), com as chaves:
- "sugestao": uma frase curta de acao
- "prioridade_nova": alta|media|baixa
- "proximo_passo": uma frase curta do proximo passo
- "risco": baixo|medio|alto

Demanda: {codigo:"$($d.codigo)", titulo:"$($d.titulo)", fase:"$($d.fase)", prioridade:"$($d.prioridade)", progresso:$($d.progresso)}
"@
    $body = @{ model=$MODEL; messages=@(@{role="user"; content=$prompt}); max_tokens=220 } | ConvertTo-Json -Depth 5

    Write-Host ("`n  -> Analisando " + $d.codigo + " (" + $d.titulo + ")...") -ForegroundColor DarkCyan
    $analise = $null
    try {
        $r = Invoke-RestMethod -Uri "https://openrouter.ai/api/v1/chat/completions" -Method Post -Headers $OHDR -Body $body -TimeoutSec 60
        $txt = $r.choices[0].message.content
        # extrai JSON (ignora ```json ... ``` se vier)
        $txt = ($txt -replace '(?s)^.*?```(?:json)?\s*', '') -replace '(?s)\s*```.*$', ''
        $j = $txt | ConvertFrom-Json
        $analise = [pscustomobject]@{
            codigo = $d.codigo
            sugestao = $j.sugestao
            prioridade_nova = $j.prioridade_nova
            proximo_passo = $j.proximo_passo
            risco = $j.risco
        }
    } catch {
        Write-Warning "Falha IA para $($d.codigo): $($_.Exception.Message). Info: $([Environment]::GetEnvironmentVariable('OPENROUTER_API_KEY').Length) chars key"
        continue
    }
    if (-not $analise) { continue }

    # ---------- 3) Grava análise no Supabase (preserva descrição original, anexa IA) ----------
    # recupera a descrição atual para não sobrescrever dados existentes
    $novaDesc = "IA: $($analise.sugestao) | Proximo: $($analise.proximo_passo) | Risco: $($analise.risco)"
    try {
        $atual = (Invoke-RestMethod -Uri "$API_BASE/demandas?codigo=eq.$($d.codigo)&select=descricao" -Headers $HDR -TimeoutSec 20)
        $orig = if ($atual.descricao) { [string]$atual.descricao } else { "" }
        # se já houver análise do agente marcada, substitui só o bloco [IA]; senão preserva a original e anexa
        if ($orig -match '(?s)\[IA AGENTE\].*') {
            $baseDesc = ($orig -replace '(?s)\s*\[IA AGENTE\].*', '').Trim()
        } else {
            $baseDesc = $orig.Trim()
        }
        if ($baseDesc -eq "") { $novaDesc = "[IA AGENTE] Sugestao: $($analise.sugestao) | Proximo: $($analise.proximo_passo) | Risco: $($analise.risco)" }
        else { $novaDesc = "$baseDesc | [IA AGENTE] Sugestao: $($analise.sugestao) | Proximo: $($analise.proximo_passo) | Risco: $($analise.risco)" }
    } catch { $novaDesc = $novaDesc }

    $patchBody = @{
        prioridade = $analise.prioridade_nova
        descricao  = $novaDesc
    } | ConvertTo-Json -Compress
    try {
        Invoke-RestMethod -Uri "$API_BASE/demandas?codigo=eq.$($d.codigo)" -Method Patch -Headers $HDR -Body $patchBody -TimeoutSec 20 | Out-Null
        Write-Host ("    OK -> sugestao: " + $analise.sugestao) -ForegroundColor Green
    } catch {
        Write-Warning "Falha ao gravar $($d.codigo): $($_.Exception.Message)"
    }
    $resultados += $analise
}

# ---------- 4) Resumo ----------
Write-Host "`n========== RESUMO DO AGENTE DE PRODUCAO ==========" -ForegroundColor Cyan
foreach ($x in $resultados) {
    Write-Host ("{0} | prio {1} | risco {2}" -f $x.codigo, $x.prioridade_nova, $x.risco) -ForegroundColor White
    Write-Host ("    sugestao : " + $x.sugestao)
    Write-Host ("    proximo  : " + $x.proximo_passo)
}
Write-Host ""
Write-Host ("Script concluido. " + $resultados.Count + "/" + $demandas.Count + " demandas processadas.") -ForegroundColor Green
