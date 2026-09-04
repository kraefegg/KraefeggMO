# Teste C — Oportunidade Portuária

> **ID:** TEST-C-PORT
> **Workflow:** WK-001 (Oportunidade → Proposta)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Terminal portuário necessita de consultoria ambiental para expansão.
Empresa: "Porto Norte S.A." — CNPJ: XX.XXX.XXX/0001-XX
Terminal: Porto de Suape (PE) — expansão de capacity de 500K TEU para 1M TEU
Investimento estimado: R$ 800M (expansão total); consultoria ambiental ~R$ 5M
Prazo: Licenciamento em 24 meses; operação em 48 meses
```

---

## Trace Completo

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Sinal detectado** | Expansão portuária NE; crescimento de 15% no tráfego de contêineres; Suape com novos terminais |
| **Classificação** | `strategic` (porto = core do portfolio; valor significativo) |
| **Output** | `MarketSignal { signal_id: "MS-2026-PORT-001", sector: "portuario", region: "PE", classification: "strategic" }` |
| **Gate** | QG-001.1 PASS |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Fontes** | ANTAQ (reguladora), CNAI, estudos logísticos, notícias Suape, IBAMA (histórico licenciamento) |
| **TAM** | R$ 2B (expansão portuária NE); SOM R$ 20M (consultoria ambiental) |
| **Competidores** | 3 consultorias ambientais especializadas em portos |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 5M", competitors: 3, client_profile: "major_port_operator" }` |
| **Gate** | QG-001.2 PASS |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Critérios** | Ajuste 9/10 (porto = expertise); Financeiro 7/10; Sinergia 9/10 (marítimo+ambiental); Regulatório 6/10 (complexo); Urgência 7/10 |
| **Score** | **KOS = 76** (Avançar) |
| **Gate** | QG-001.3 PASS |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` + `mining` (ambiental) + `iot-embedded` (monitoramento) |
| **Fontes** | ANTAQ, IBAMA, CER/CEPLAC (expansão portuária), legislação marítima, estudos de impacto portuário |
| **Pesquisa regulatória** | IBAMA licenciamento federal; ANTAQ autorização; IN portuária; MARPOL; ISPS Code |
| **Pesquisa técnica** | Drenagem, sedimentação, qualidade da água, ruído, fauna marinha |
| **Risco especial** | Proximidade com área de mangue; zona de proteção ambiental |
| **Output** | `ResearchPackage { sources: 18, primary: 10, confidence: "high" }` |
| **Gate** | QG-001.4 PASS |

### Fase 5 — Validação

| Campo | Resultado esperado |
|---|---|
| **Evidências** | 15/18 (83%) high/medium |
| **Output** | `ValidatedEvidence { high: 10, medium: 5, low: 3 }` |
| **Gate** | QG-001.5 PASS |

### Fase 6 — Inteligência Estratégica

| Campo | Resultado esperado |
|---|---|
| **Análise** | Expansão portuária = projeto de infraestrutura nacional; licenciamento IBAMA obrigatório; mangue = restrição significativa |
| **Recomendação** | Avançar com abordagem: 1) Estudo de impacto ambiental completo 2) Plano de compensação de mangue 3) Monitoramento contínuo |
| **Margem estimada** | 35% |
| **Output** | `StrategicBrief { recommendation: "APROVAR", margin: 0.35, key_risk: "mangue" }` |
| **Gate** | QG-001.6 PASS |

### Fase 7 — Decisão Executiva

| Campo | Resultado esperado |
|---|---|
| **Decisão** | `APROVAR` |
| **Confiança** | 80% |
| **Output** | `DecisionRecord { decision: "APROVAR", confidence: 0.80 }` |
| **Gate** | QG-001.7 PASS |

### Fase 8 — BD

| Campo | Resultado esperado |
|---|---|
| **Conta** | Porto Norte S.A.; Diretor de Expansão: nome; Gerente Ambiental: nome |
| **Abordagem** | Reunião presencial em Suape; apresentação de cases portuários |
| **Output** | `BDPlan { approach: "reuniao_presencial" }` |
| **Gate** | QG-001.8 PASS |

### Fase 9 — Qualificação

| Campo | Resultado esperado |
|---|---|
| **BANT** | |
| — Budget | ✅ R$ 5M consultoria; parte do projeto de R$ 800M |
| — Authority | ✅ Diretor de Expansão decide |
| — Need | ✅ Licenciamento IBAMA obrigatório; experiência específica em portos |
| — Timeline | ✅ 24 meses; align com cronograma de expansão |
| **Score** | **BANT = 4/4** |
| **Gate** | QG-001.9 PASS |

### Fase 10 — Estratégia de Proposta

| Campo | Resultado esperado |
|---|---|
| **Escopo** | 1) Estudo de Impacto Ambiental (EIA/RIMA) 2) Plano de Compensação Ambiental (mangue) 3) Licenciamento IBAMA + ANTAQ 4) Monitoramento ambiental IoT 5) Relatórios periódicos 6) Consultoria MARPOL/ISPS |
| **Margem** | 35% |
| **Cronograma** | 24 meses |
| **Investimento** | R$ 5M |
| **Output** | `ProposalStrategy { scope: "eia_licenciamento_monitoramento_portuario", margin: 0.35 }` |
| **Gate** | QG-001.10 PASS |

### Fase 11 — Proposta Comercial

| Campo | Resultado esperado |
|---|---|
| **Documento** | Proposta formal: 6 módulos, cronograma, investimento, equipe (8 especialistas: marítimos + ambientais) |
| **Output** | `CommercialProposal { version: "2.0", modules: 6, approved: true }` |
| **Gate** | QG-001.11 PASS |

---

## Skills Activated

| Skill | Agente | Fase |
|---|---|---|
| `web-research` | market-segment, data-analytics | 1, 2, 4 |
| `regulatory-mapping` | data-analytics, mining | 4 |
| `maritime-compliance` | mining (especialista marítimo) | 4, 6 |
| `environmental-assessment` | mining | 4, 5, 6 |
| `iot-monitoring` | iot-embedded | 6 |

---

## Subagentes Mobilizados

| Subagente | Responsabilidade |
|---|---|
| `mining` | Avaliação ambiental, EIA/RIMA, compensação |
| `iot-embedded` | Sensores marinhos (qualidade da água, fauna, ruído) |
| `perícia` | Laudos técnicos, parecer regulatório |
| `commercial` | Proposta, negociação |
| `data-analytics` | Dados de mercado, logística |

---

## Escalation Points

| Ponto | Trigger | Nível |
|---|---|---|
| Mangue na área de influência | Restrição ambiental significativa | Nível 3 (CTO) |
| IBAMA licenciamento federal | Projeto de infraestrutura nacional | Nível 3 (CTO + jurídico) |
| Consultoria > R$ 1M | Aprovação | Nível 4 (CEO) |
| MARPOL/ISPS | Compliance marítimo internacional | Nível 3 (CTO + especialista) |
