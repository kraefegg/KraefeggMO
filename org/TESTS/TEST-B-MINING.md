# Teste B — Oportunidade Mineração

> **ID:** TEST-B-MINING
> **Workflow:** WK-001 (Oportunidade → Proposta)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Empresa de mineração busca parceiro para projeto de lítio na Paraíba.
Empresa: "Mineradora Nordeste Ltda." — CNPJ: XX.XXX.XXX/0001-XX
Localização: Borborema, Paraíba
Investimento estimado: R$ 80M (fase 1)
Prazo desejado: Viabilidade técnica em 6 meses; licenciamento em 18 meses
```

---

## Trace Completo

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Skill ativado** | `web-research` |
| **Sinal detectado** | Demanda crescente por lítio (baterias EV); mapeamento geológico CBPM (PB) indica reservas em Borborema |
| **Classificação** | `strategic` (minério estratégico, região de atuação, demanda global) |
| **Output** | `MarketSignal { signal_id: "MS-2026-MIN-001", sector: "mineração", region: "PB", classification: "strategic" }` |
| **Gate** | QG-001.1 PASS |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `market-segment` + `data-analytics` |
| **Fontes** | ANM (reguladora), CBPM (geologia PB), notícias lítio Brasil, relatórios mineração |
| **TAM** | R$ 10B (lítio Brasil); SAM R$ 500M (Nordeste); SOM R$ 30M |
| **Competidores** | 2 players com CBPMs na região; mercado em expansão |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 80M", competitors: 2, client_profile: "mid_tier_miner" }` |
| **Gate** | QG-001.2 PASS |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Critérios KOS** | |
| — Ajuste setorial | 8/10 (mineração = expertise; lítio = high demand) |
| — Potencial financeiro | 7/10 (R$ 80M fase 1; potencial R$ 300M total) |
| — Sinergia portfolio | 8/10 (licenciamento + consultoria + monitoramento ambiental) |
| — Risco regulatório | 6/10 (ANM + IBAMA + comunidades; licenciamento complexo) |
| — Urgência | 8/10 (janela de lítio; concorrência global) |
| **Score** | **KOS = 74** (Avançar) |
| **Output** | `KOSReport { score: 74, action: "avancar", briefing: true }` |
| **Gate** | QG-001.3 PASS |
| **Nota** | KOS entre 61-80 → revisão semanal; não precisa de briefing imediato |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` (orquestração) + `mining` (especialista) |
| **Skills** | `web-research`, `regulatory-mapping` |
| **Fontes** | |
| — Primárias | ANM (regulamentação), IBAMA (licenciamento), ANP, legislação mineração, dados geológicos CBPM |
| — Secundárias | Relatórios lítio global, IRENA, bancos de investimento |
| — Terciárias | Notícias mineração NE, comunidades |
| **Pesquisa regulatória** | ANM: autorização de pesquisa + EFPM; IBAMA: licenciamento ambiental; ANP: se houver petróleo adjacente |
| **Pesquisa de viabilidade** | Geologia: confirmação de reservas; hidrologia: disponibilidade hídrica; comunidades: licença social |
| **Risco especial** | Comunidades tradicionais (quilombolas) na área → licenciamento pode ser mais complexo |
| **Output** | `ResearchPackage { sources: 15, primary: 8, confidence: "high", risk_flag: "comunidades_tradicionais" }` |
| **Gate** | QG-001.4 PASS |
| **Escalation** | Risco de comunidades tradicionais → pausar e notificar CTO |

### Fase 5 — Validação de Evidências

| Campo | Resultado esperado |
|---|---|
| **Evidências** | 12/15 (80%) com grau `high` ou `medium` |
| **Contradições** | Nenhuma significativa |
| **Nota especial** | Dados geológicos têm confidence `medium` (não há SondasConfirmadas pelo CBPM) |
| **Output** | `ValidatedEvidence { high: 8, medium: 4, low: 3 }` |
| **Gate** | QG-001.5 PASS — exatamente 80% |

### Fase 6 — Inteligência Estratégica

| Campo | Resultado esperado |
|---|---|
| **Análise** | Lítio = mineral estratégico global; Borborema com potencial confirmado; risco social significativo |
| **Recomendação** | Avançar com foco em: 1) Viabilidade técnica rigorosa 2) Consultoria social comunitária 3) Licenciamento IBAMA completo |
| **Margem estimada** | 28% (consultoria técnica + licenciamento + monitoramento) |
| **Output** | `StrategicBrief { recommendation: "APROVAR_CONDICIONAL", margin: 0.28, conditions: ["viabilidade_geologica_confirmada"] }` |
| **Gate** | QG-001.6 PASS |

### Fase 7 — Decisão Executiva

| Campo | Resultado esperado |
|---|---|
| **Decisão** | `APROVAR` |
| **Rationale** | "KOS 74; lítio mineral estratégico; 15 fontes validadas; risco social gerenciável com consultoria adequada; margem 28%" |
| **Confiança** | 75% (menor que solar devido a dados geológicos `medium`) |
| **Output** | `DecisionRecord { decision: "APROVAR", confidence: 0.75 }` |
| **Gate** | QG-001.7 PASS |

### Fase 8 — BD

| Campo | Resultado esperado |
|---|---|
| **Conta** | Mineradora Nordeste Ltda.; Diretor Industrial: nome; Gerente Ambiental: nome |
| **Abordagem** | Via evento setorial (ENASUL); apresentação técnica |
| **Output** | `BDPlan { account_mapped: true, approach: "evento_setorial" }` |
| **Gate** | QG-001.8 PASS |

### Fase 9 — Qualificação

| Campo | Resultado esperado |
|---|---|
| **BANT** | |
| — Budget | ✅ R$ 80M fase 1; financiamento parcial confirmado |
| — Authority | ✅ Diretor Industrial decide; Gerente Ambiental influencia |
| — Need | ✅ Precisa de consultoria técnica + licenciamento + apoio social |
| — Timeline | ⚠️ Prazo ambicioso (6m viabilidade); possível mas apertado |
| **Score** | **BANT = 3.5/4** |
| **Output** | `QualificationScore { score: 3.5 }` |
| **Gate** | QG-001.9 PASS |

### Fase 10 — Estratégia de Proposta

| Campo | Resultado esperado |
|---|---|
| **Escopo** | 1) Viabilidade técnica (geologia, hidrologia, ambiental) 2) Licenciamento IBAMA + ANM 3) Consultoria social comunitária 4) Monitoramento ambiental IoT 5) Plano de Fechamento de Mina |
| **Margem** | 28% |
| **Cronograma** | 24 meses (viabilidade 6m + licenciamento 18m) |
| **Investimento** | R$ 12M |
| **Output** | `ProposalStrategy { scope: "viabilidade_licenciamento_monitoramento", margin: 0.28 }` |
| **Gate** | QG-001.10 PASS |

### Fase 11 — Proposta Comercial

| Campo | Resultado esperado |
|---|---|
| **Documento** | Proposta formal: 5 módulos, cronograma, investimento, equipe (6 especialistas), cases mineração |
| **Versão** | v2.0 aprovada |
| **Output** | `CommercialProposal { version: "2.0", modules: 5, approved_by: ["cto", "ceo"] }` |
| **Gate** | QG-001.11 PASS |

---

## Skills Activated

| Skill | Agente | Fase |
|---|---|---|
| `web-research` | market-segment, data-analytics | 1, 2, 4 |
| `competitor-analysis` | market-segment, data-analytics | 2 |
| `regulatory-mapping` | data-analytics, mining | 4, 6 |
| `geological-assessment` | mining | 4, 5 |
| `social-impact` | mining + communitary | 4, 6 |

---

## Subagentes Mobilizados

| Subagente | Responsabilidade |
|---|---|
| `mining` | Viabilidade técnica, geologia, processamento mineral |
| `iot-embedded` | Sensores de monitoramento ambiental |
| `perícia` | Laudos técnicos, EIA/RIMA |
| `commercial` | Proposta, negociação |
| `data-analytics` | Dados de mercado, valuation |

---

## Escalation Points

| Ponto | Trigger | Nível | Agente |
|---|---|---|---|
| Comunidades tradicionais na área | Risco social significativo | Nível 3 | CTO |
| Dados geológicos `medium` | Viabilidade incerta | Nível 2 | mining + CTO |
| ANM + IBAMA | Licenciamento complexo | Nível 3 | CTO + jurídico |
| Contrato > R$ 500K | Aprovação | Nível 4 | CEO |
