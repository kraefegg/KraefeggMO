# ============================================================
# HQ KRAEFEGG M.O. — Agente de Produção (gera documentos reais)
# Processa demandas abertas do Supabase com motor de IA e, além da
# análise textual, GERA um Documento de Requisitos (.md) real em pasta
# local durável, registrando o caminho de volta no banco.
#
# Uso:
#   $env:OPENROUTER_API_KEY="sk-or-..."
#   .\hq-processar-demandas.ps1 [-Fase analise|backlog|todas] [-MaxN 5]
#
# Seguro: NÃO grava a chave em arquivo; lê da env var do usuário.
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

$MODEL   = "minimax/minimax-m3:free"
$ENTREGAS = "C:\hq-prod\entregas"   # pasta durável de documentos reais
$HDR   = @{ "apikey"=$API_KEY; "Authorization"="Bearer "+$API_KEY; "Content-Type"="application/json" }
$OHDR  = @{ "Authorization"="Bearer "+$OR_KEY; "Content-Type"="application/json" }

if (-not (Test-Path $ENTREGAS)) { New-Item -ItemType Directory -Path $ENTREGAS -Force | Out-Null }

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
$indice = @()

# ---------- 2) Analisa e gera documento real para cada demanda ----------
foreach ($d in $demandas) {
    Write-Host ("`n  -> Processando " + $d.codigo + " (" + $d.titulo + ")...") -ForegroundColor DarkCyan

    # --- 2a) Análise resumida (sugestão/prioridade/proximo passo/risco) ---
    $prompt_analise = @"
Atue como agente de producao do porto-dashboard. Analise esta demanda e responda SOMENTE com JSON valido (sem texto extra), chaves:
- "sugestao": uma frase curta de acao
- "prioridade_nova": alta|media|baixa
- "proximo_passo": uma frase curta do proximo passo
- "risco": baixo|medio|alto

Demanda: {codigo:"$($d.codigo)", titulo:"$($d.titulo)", fase:"$($d.fase)", prioridade:"$($d.prioridade)", progresso:$($d.progresso)}
"@
    $analise = $null
    try {
        $bodyA = @{ model=$MODEL; messages=@(@{role="user"; content=$prompt_analise}); max_tokens=220 } | ConvertTo-Json -Depth 5
        $rA = Invoke-RestMethod -Uri "https://openrouter.ai/api/v1/chat/completions" -Method Post -Headers $OHDR -Body $bodyA -TimeoutSec 60
        $txtA = [string]$rA.choices[0].message.content
        $txtA = $txtA -replace '(?s)```json\s*', '' -replace '(?s)```', '' -replace '^\s+|\s+$', ''
        $jA = $txtA | ConvertFrom-Json
        $analise = [pscustomobject]@{
            codigo = $d.codigo; sugestao = $jA.sugestao
            prioridade_nova = $jA.prioridade_nova; proximo_passo = $jA.proximo_passo; risco = $jA.risco
        }
    } catch {
        Write-Warning "Falha IA (análise) para $($d.codigo): $($_.Exception.Message)"
        continue
    }
    if (-not $analise) { continue }

    # --- 2b) Gera o DOCUMENTO DE REQUISITOS (conteúdo estruturado .md) ---
    $prompt_doc = @"
Voce e especificador de requisitos. Escreva um DOCUMENTO DE REQUISITOS completo em Markdown (pt-BR) para a demanda abaixo. IMPORTANTE: use SOMENTE caracteres ASCII (NAO use acentos, cedilha ou til: escreva "acao", "nao", "projeto", "tecnicos", etc). Estruture com MARKDOWN limpo, usando apenas o conteudo (nao inclua a palavra MARKDOWN nem blocos de codigo):
# Documento de Requisitos - {titulo}
1. Contexto e Objetivo
2. Escopo (inclui / nao inclui)
3. Requisitos Funcionais (lista RF-01, RF-02, ... com descricao)
4. Requisitos Nao Funcionais (RNF-01, ... desempenho, seguranca, usabilidade)
5. Premissas e Dependencias
6. Criterios de Aceitacao
7. Proximos Passos

Demanda: codigo={codigo}, titulo={titulo}, fase={fase}, prioridade={prioridade}, responsavel={responsavel}. Analise sugerida: {sugestao}. Risco: {risco}.
"@
    $prompt_doc = $prompt_doc.Replace("{titulo}", $d.titulo).Replace("{codigo}", $d.codigo).Replace("{fase}", $d.fase).Replace("{prioridade}", $analise.prioridade_nova).Replace("{responsavel}", $d.responsavel).Replace("{sugestao}", $analise.sugestao).Replace("{risco}", $analise.risco)

    $docPath = $null
    try {
        $bodyD = @{ model=$MODEL; messages=@(@{role="user"; content=$prompt_doc}); max_tokens=1500 } | ConvertTo-Json -Depth 5
        $rD = Invoke-RestMethod -Uri "https://openrouter.ai/api/v1/chat/completions" -Method Post -Headers $OHDR -Body $bodyD -TimeoutSec 90
        $docText = [string]$rD.choices[0].message.content
        $docText = $docText -replace '(?s)```(markdown|md|x)?\s*', '' -replace '(?s)```', ''
        $dir = Join-Path $ENTREGAS ("demanda-" + $d.codigo)
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
        $docPath = Join-Path $dir ("requisitos-" + $d.codigo + ".md")
        [System.IO.File]::WriteAllText($docPath, $docText, (New-Object System.Text.UTF8Encoding($false)))
        Write-Host ("    DOC gerado: " + $docPath) -ForegroundColor Green
    } catch {
        Write-Warning "Falha IA (documento) para $($d.codigo): $($_.Exception.Message)"
    }

    # --- 3) Grava análise + caminho do documento no Supabase (preserva original) ---
    $novaDesc = "IA: $($analise.sugestao) | Proximo: $($analise.proximo_passo) | Risco: $($analise.risco)"
    try {
        $atual = (Invoke-RestMethod -Uri "$API_BASE/demandas?codigo=eq.$($d.codigo)&select=descricao" -Headers $HDR -TimeoutSec 20)
        $orig = if ($atual.descricao) { [string]$atual.descricao } else { "" }
        if ($orig -match '(?s)\[IA AGENTE\].*') {
            $baseDesc = ($orig -replace '(?s)\s*\[IA AGENTE\].*', '').Trim()
        } else { $baseDesc = $orig.Trim() }
        $blocoIA = "Sugestao: $($analise.sugestao) | Proximo: $($analise.proximo_passo) | Risco: $($analise.risco)"
        if ($docPath) { $blocoIA += " | DOC: $docPath" }
        if ($baseDesc -eq "") { $novaDesc = "[IA AGENTE] $blocoIA" }
        else { $novaDesc = "$baseDesc | [IA AGENTE] $blocoIA" }
    } catch { }

    $patchBody = @{ prioridade = $analise.prioridade_nova; descricao = $novaDesc } | ConvertTo-Json -Compress
    try {
        Invoke-RestMethod -Uri "$API_BASE/demandas?codigo=eq.$($d.codigo)" -Method Patch -Headers $HDR -Body $patchBody -TimeoutSec 20 | Out-Null
        Write-Host ("    OK -> " + $analise.sugestao) -ForegroundColor Green
    } catch { Write-Warning "Falha ao gravar $($d.codigo): $($_.Exception.Message)" }

    $resultados += $analise
    $indice += [pscustomobject]@{ codigo=$d.codigo; titulo=$d.titulo; doc=$docPath }
}

# ---------- 4) Índice de entregáveis ----------
if ($indice.Count -gt 0) {
    $idxLines = @("# Entregáveis gerados pelo Agente de Produção", "", "| Demanda | Título | Documento |", "|---|---|---|")
    foreach ($it in $indice) {
        if ($it.doc) { $idxLines += ("| " + $it.codigo + " | " + $it.titulo + " | `"$($it.doc)`" |") }
    }
    [System.IO.File]::WriteAllText((Join-Path $ENTREGAS "INDICE.md"), ($idxLines -join "`n"), (New-Object System.Text.UTF8Encoding($false)))
}

# ---------- 5) Resumo ----------
Write-Host "`n========== RESUMO DO AGENTE DE PRODUCAO ==========" -ForegroundColor Cyan
foreach ($x in $resultados) {
    Write-Host ("{0} | prio {1} | risco {2}" -f $x.codigo, $x.prioridade_nova, $x.risco) -ForegroundColor White
    Write-Host ("    sugestao : " + $x.sugestao)
    Write-Host ("    proximo  : " + $x.proximo_passo)
}
Write-Host ""
Write-Host ("Script concluido. " + $resultados.Count + "/" + $demandas.Count + " processadas. Entregas em: " + $ENTREGAS) -ForegroundColor Green
