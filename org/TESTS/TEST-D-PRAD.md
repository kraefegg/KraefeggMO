# Teste D — Demanda PRAD

> **ID:** TEST-D-PRAD
> **Workflow:** WK-001 (Oportunidade → Proposta) + WK-005 (Licenciamento)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Empresa solicita elaboração de PRAD (Plano de Recuperação de Área Degradada) para área contaminada.
Empresa: "Indústria Química Nordeste Ltda." — CNPJ: XX.XXX.XXX/0001-XX
Localização: Camaçari (BA) — Polo Petroquímico
Área: 5.000 m² contaminada por solventes clorados (TCE/PCE)
Investimento estimado: R$ 3M (PRAD + remediação)
Prazo: PRAD em 90 dias; remediação em 24 meses
```

---

## Trace Completo

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Sinal detectado** | Demanda crescente de PRADs no Polo Petroquímico de Camaçari; CONDEPLA multando empresas com áreas contaminadas não recuperadas |
| **Classificação** | `relevant` (demanda regulatória; mercado nichado mas lucrativo) |
| **Output** | `MarketSignal { signal_id: "MS-2026-PRAD-001", sector: "remediacao_ambiental", region: "BA", classification: "relevant" }` |
| **Gate** | QG-001.1 PASS |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Fontes** | CONDEPLA/BA, IBAMA, Cetesb (referência), CPRH (PE), legislação solo contaminado |
| **TAM** | R$ 50M (remediação BA); SOM R$ 3M (projeto específico) |
| **Competidores** | 2 consultoras especializadas em remediação em Camaçari |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 3M", competitors: 2, client_profile: "industrial" }` |
| **Gate** | QG-001.2 PASS |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Critérios** | Ajuste 8/10 (ambiental = core); Financeiro 5/10 (R$ 3M); Sinergia 8/10; Regulatório 9/10 (obrigatório); Urgência 9/10 (multa CONDEPLA) |
| **Score** | **KOS = 78** (Avançar) |
| **Gate** | QG-001.3 PASS |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` + `mining` (ambiental) + `perícia` (contaminação) |
| **Fontes** | CONDEPLA, IBAMA, CETESB (referência PRAD), Resolução 420/2009 (CONAMA), legislação BA, literatura técnica de remediação |
| **Pesquisa regulatória** | PRAD conforme Res. 420/2009; CETESB methodology; Valores orientadores CONAMA 396/2008; Res. 420/2009 (valores de referência) |
| **Pesquisa técnica** | Técnicas de remediação: SVE (Soil Vapor Extraction), bombeamento, bioremediação, estabilização |
| **Análise preliminar** | TCE/PCE: alta volatilidade → SVE viável; profundidade ~5m → acessível |
| **Output** | `ResearchPackage { sources: 12, primary: 6, confidence: "high", technical_feasibility: "high" }` |
| **Gate** | QG-001.4 PASS |

### Fase 5 — Validação

| Campo | Resultado esperado |
|---|---|
| **Evidências** | 10/12 (83%) high/medium |
| **Nota** | Dados de contaminação específicos (1,2,3-TCB) requerem amostragem in situ |
| **Output** | `ValidatedEvidence { high: 7, medium: 3, low: 2 }` |
| **Gate** | QG-001.5 PASS |

### Fase 6 — Inteligência Estratégica

| Campo | Resultado esperado |
|---|---|
| **Análise** | PRAD = obrigação legal (CONDEPLA); empresa sob pressão regulatória; alta urgência; mercado em expansão |
| **Recomendação** | Avançar; oferecer pacote PRAD + remediação + monitoramento |
| **Margem** | 38% |
| **Output** | `StrategicBrief { recommendation: "APROVAR", margin: 0.38 }` |
| **Gate** | QG-001.6 PASS |

### Fase 7 — Decisão Executiva

| Campo | Resultado esperado |
|---|---|
| **Decisão** | `APROVAR` |
| **Confiança** | 85% |
| **Output** | `DecisionRecord { decision: "APROVAR", confidence: 0.85 }` |
| **Gate** | QG-001.7 PASS |

### Fase 8 — BD

| Campo | Resultado esperado |
|---|---|
| **Conta** | Ind. Química NE; Diretor Industrial: nome; Assessor Ambiental: nome |
| **Abordagem** | Contato direto; empresa procura ativamente (regulação) |
| **Output** | `BDPlan { approach: "inbound_client" }` |
| **Gate** | QG-001.8 PASS |

### Fase 9 — Qualificação

| Campo | Resultado esperado |
|---|---|
| **BANT** | |
| — Budget | ✅ R$ 3M disponível; multa CONDEPLA > investimento |
| — Authority | ✅ Diretor Industrial decide |
| — Need | ✅ Obrigação legal; sem PRAD = multa |
| — Timeline | ✅ 90 dias para PRAD; urgência alta |
| **Score** | **BANT = 4/4** |
| **Gate** | QG-001.9 PASS |

### Fase 10 — Estratégia de Proposta

| Campo | Resultado esperado |
|---|---|
| **Escopo** | 1) Investigação preliminar (mistoring) 2) Elaboração do PRAD 3) Submissão a CONDEPLA/IBAMA 4) Execução da remediação 5) Monitoramento pós-remediação 6) Relatório final |
| **Margem** | 38% |
| **Cronograma** | PRAD 90 dias + Remediação 24 meses |
| **Investimento** | R$ 3M |
| **Output** | `ProposalStrategy { scope: "prad_remediacao_monitoramento", margin: 0.38 }` |
| **Gate** | QG-001.10 PASS |

### Fase 11 — Proposta Comercial

| Campo | Resultado esperado |
|---|---|
| **Documento** | Proposta formal: 6 módulos, cronograma, investimento, equipe (4 especialistas: solo contaminado) |
| **Output** | `CommercialProposal { version: "2.0", modules: 6, approved: true }` |
| **Gate** | QG-001.11 PASS |

---

## Skills Activated

| Skill | Agente | Fase |
|---|---|---|
| `web-research` | data-analytics | 1, 2, 4 |
| `regulatory-mapping` | mining, data-analytics | 4 |
| `environmental-remediation` | mining | 4, 5, 10 |
| `prad-development` | mining, data-analytics | 10 |
| `soil-contamination` | mining, perícia | 4, 5 |

---

## Subagentes Mobilizados

| Subagente | Responsabilidade |
|---|---|
| `mining` | Avaliação de contaminação, PRAD, remediação |
| `perícia` | Laudo técnico de contaminação, amostragem |
| `iot-embedded` | Sensores de monitoramento (solo, água subterrânea) |
| `commercial` | Proposta |
| `data-analytics` | Dados regulatórios, valores de referência |

---

## Escalation Points

| Ponto | Trigger | Nível |
|---|---|---|
| Contaminação > limites CONAMA 396 | Classificação como área de interesse | Nível 3 (CTO) |
| CONDEPLA com processo ativo | Urgência + risco legal | Nível 3 (CTO + jurídico) |
| Substância perigosa não mapeada | Risco à saúde | Nível 4 (CEO) |
| Contrato > R$ 500K | Aprovação | Nível 4 (CEO) |
