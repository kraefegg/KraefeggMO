# Teste A — Oportunidade Solar

> **ID:** TEST-A-SOLAR
> **Workflow:** WK-001 (Oportunidade → Proposta)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Nova empresa pretende implantar usina solar de 50MW no Ceará.
Empresa: "Solarene Energia S.A." — CNPJ: XX.XXX.XXX/0001-XX
Localização: Região do Cariri, Ceará
Investimento estimado: R$ 250M
Prazo desejado: 18 meses para LP; 36 meses para operação
```

---

## Trace Completo

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Skill ativado** | `web-research` |
| **Sinal detectado** | Matérias sobre expansão solar no Nordeste + edital ANEEL de aproveitamento solar |
| **Classificação** | `strategic` (setor prioritário, região de atuação, valor significativo) |
| **Output** | `MarketSignal { signal_id: "MS-2026-SOL-001", sector: "energia_solar", region: "CE", classification: "strategic" }` |
| **Gate** | QG-001.1 PASS — sinal `strategic` com fonte primária (edital ANEEL) |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `market-segment` + `data-analytics` |
| **Skills** | `web-research`, `competitor-analysis` |
| **Fontes consultadas** | ANEEL (regulação), ABEEólica/ABSolar (dados setoriais),notícias CE, dados IBGE (Cariri) |
| **TAM estimado** | R$ 5B (solar NE); SAM R$ 500M (CE); SOM R$ 50M |
| **Competidores** | 3-4 players já atuando no CE (energéticas) |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 250M", competitors: 4, client_profile: "new_entrant" }` |
| **Gate** | QG-001.2 PASS — ≥ 3 fontes independentes |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `market-segment` (cálculo) + `ceo` (decisão) |
| **Critérios KOS** | |
| — Ajuste setorial | 9/10 (energia solar = core do portfolio) |
| — Potencial financeiro | 8/10 (R$ 250M) |
| — Sinergia portfolio | 8/10 (licenciamento ambiental + consultoria) |
| — Risco regulatório | 7/10 (ANEEL favorável, IBAMA rigoroso) |
| — Urgência | 7/10 (mercado aquecido, janela de oportunidade) |
| **Score** | **KOS = 82** (Prioritário) |
| **Ação recomendada** | Avançar imediatamente para pesquisa |
| **Output** | `KOSReport { score: 82, action: "prioritario", briefing_executivo: true }` |
| **Gate** | QG-001.3 PASS — score ≥ 61; briefing executivo agendado |
| **Escalation** | CEO recebe briefing imediato (KOS ≥ 81) |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` (orquestração) + `renewable-energy` (especialista) + `iot-embedded` (sensores) |
| **Skills** | `web-research`, `competitor-analysis`, `regulatory-mapping` |
| **Fontes consultadas** | |
| — Primárias | ANEEL (regulamentação), IBAMA (licenciamento), CER (CE), ANP, legislação federal |
| — Secundárias | ABSolar (relatório anual), IRENA (dados globais), relatórios bancários |
| — Terciárias | Notícias CE, Cariri |
| **Pesquisa regulatória** | Licenciamento IBAMA obrigatório (> 40MW); LP → EIA/RIMA → LI → LO |
| **Pesquisa de viabilidade** | Irradiância solar Cariri: 5.8 kWh/m²/dia (excelente); solo disponível |
| **Benchmarking** | Usinas similares CE: custo médio R$ 4-5M/MW; PPA médio R$ 150-200/MWh |
| **Output** | `ResearchPackage { sources: 12, primary: 6, confidence: "high" }` |
| **Gate** | QG-001.4 PASS — ≥ 5 fontes validadas |

### Fase 5 — Validação de Evidências

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `cto` (validação técnica) |
| **Evidências validadas** | 10/12 (83%) com grau `high` ou `medium` |
| **Contradições** | 1 (custo/MW variando entre fontes) — resolvida com média ponderada |
| **Output** | `ValidatedEvidence { high: 7, medium: 3, low: 2, contradictions_resolved: 1 }` |
| **Gate** | QG-001.5 PASS — 83% ≥ 80% |

### Fase 6 — Inteligência Estratégica

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `ceo` + todos departamentos relevantes |
| **Análise** | Posicionamento competitivo: entrante em mercado com 4 players; oportunidade de diferencial: licenciamento ágil + monitoramento IoT |
| **Valuation preliminar** | R$ 250M investimento; receita estimada R$ 35M/ano (consultoria + monitoramento) |
| **Riscos** | Licenciamento IBAMA pode levar 18-24 meses; competição por PPA |
| **Oportunidades** | Cariri com apoio governamental; energia solar com subsídio |
| **Output** | `StrategicBrief { recommendation: "APROVAR", margin_estimate: "32%", risk_level: "medium" }` |
| **Gate** | QG-001.6 PASS — Brief aprovado por CEO |

### Fase 7 — Decisão Executiva

| Campo | Resultado esperado |
|---|---|
| **Agente** | `ceo` |
| **Decisão** | `APROVAR` |
| **Rationale** | "KOS 82 validado; 12 fontes consultadas; margem estimada 32%; risco gerenciável com planejamento adequado" |
| **Confiança** | 85% |
| **Output** | `DecisionRecord { decision: "APROVAR", hash: "sha256:solar001..." }` |
| **Gate** | QG-001.7 PASS — hash registrado; confiança ≥ 70% |

### Fase 8 — Business Development

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `commercial` + `ceo` |
| **Conta mapeada** | Solarene Energia S.A.; CEO: nome; CFO: nome; engenheiro-chefe: nome |
| **Materiais** | Apresentação institucional (portfólio energia solar); one-pager personalizado; cases similares |
| **Contato** | Email para CEO + LinkedIn para engenheiro-chefe |
| **Output** | `BDPlan { account_mapped: true, materials_ready: true, contact_scheduled: true }` |
| **Gate** | QG-001.8 PASS |

### Fase 9 — Qualificação

| Campo | Resultado esperado |
|---|---|
| **Agente** | `commercial` |
| **BANT** | |
| — Budget | ✅ Investimento de R$ 250M confirmado (fundos próprios + financiamento BNDES) |
| — Authority | ✅ CEO com poder de decisão; engenheiro-chefe com influência |
| — Need | ✅ Precisa de licenciamento ambiental + consultoria técnica |
| — Timeline | ✅ 18 meses para LP; urgency alta |
| **Score** | **BANT = 4/4** |
| **Output** | `QualificationScore { B: true, A: true, N: true, T: true, score: 4 }` |
| **Gate** | QG-001.9 PASS — BANT ≥ 3/4 |

### Fase 10 — Estratégia de Proposta

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `cto` (escopo) + `commercial` (comercial) + `data-analytics` (valuation) |
| **Escopo proposto** | 1) Licenciamento ambiental completo (LP → LI → LO) 2) Consultoria de viabilidade 3) Monitoramento ambiental IoT 4) Relatórios periódicos |
| **Margem** | 32% (acima do target de 25%) |
| **Cronograma** | 24 meses (fase 1: LP 6m; fase 2: EIA 12m; fase 3: LI/LO 6m) |
| **Investimento proposto** | R$ 18M (consultoria + licenciamento + monitoramento) |
| **Output** | `ProposalStrategy { scope: "licenciamento_completo", margin: 0.32, timeline: "24m" }` |
| **Gate** | QG-001.10 PASS — margem ≥ 25% |

### Fase 11 — Proposta Comercial

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `commercial` + `cto` |
| **Documento** | Proposta formal: Sumário, Escopo (4 módulos), Cronograma, Investimento (R$ 18M), Equipe (5 especialistas), Cases, Termos |
| **Versão** | v1.0 → v1.1 (revisão) → v2.0 (aprovada CEO + CTO) |
| **Hash** | SHA-256 da versão final |
| **Output** | `CommercialProposal { version: "2.0", hash: "sha256:solar_prop_001...", approved_by: ["cto", "ceo"] }` |
| **Gate** | QG-001.11 PASS |

---

## Resumo do Trace

| Fase | Agente(s) | Output | Gate | Status |
|---|---|---|---|---|
| 1. Market Intelligence | market-segment | MarketSignal | QG-001.1 | ✅ PASS |
| 2. Opportunity Intel | market-segment + data-analytics | OpportunityIntelligence | QG-001.2 | ✅ PASS |
| 3. Score KOS | market-segment + ceo | KOSReport (82) | QG-001.3 | ✅ PASS |
| 4. Pesquisa | data-analytics + renewable-energy | ResearchPackage | QG-001.4 | ✅ PASS |
| 5. Validação | cto | ValidatedEvidence | QG-001.5 | ✅ PASS |
| 6. Intel Estratégica | ceo + departamentos | StrategicBrief | QG-001.6 | ✅ PASS |
| 7. Decisão Executiva | ceo | DecisionRecord | QG-001.7 | ✅ PASS |
| 8. BD | commercial + ceo | BDPlan | QG-001.8 | ✅ PASS |
| 9. Qualificação | commercial | QualificationScore (4/4) | QG-001.9 | ✅ PASS |
| 10. Estratégia | cto + commercial + data-analytics | ProposalStrategy | QG-001.10 | ✅ PASS |
| 11. Proposta | commercial + cto | CommercialProposal v2.0 | QG-001.11 | ✅ PASS |

---

## Escalation Points

| Ponto | Trigger | Nível | Agente |
|---|---|---|---|
| KOS ≥ 81 | Briefing executivo imediato | Nível 4 | CEO |
| Risco regulatório (IBAMA) | Pausar e notificar | Nível 3 | CTO + CEO |
| Margem < 20% | Decisão de prosseguir | Nível 4 | CEO |
| Contrato > R$ 500K | Aprovação | Nível 4 | CEO |
