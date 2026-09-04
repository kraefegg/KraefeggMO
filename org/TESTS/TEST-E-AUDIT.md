# Teste E — Auditoria Ambiental

> **ID:** TEST-E-AUDIT
> **Workflow:** WK-001 (Oportunidade → Proposta)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Secretaria Municipal demanda auditoria ambiental de empresa.
Empresa auditada: "Agro Indústria Pernambuco S.A." — CNPJ: XX.XXX.XXX/0001-XX
Órgão demandante: Secretaria de Meio Ambiente de Olinda (PE)
Tipo: Auditoria ambiental anual (conforme Alvará de Funcionamento)
Área: 12.000 m² — processo industrial (beneficiamento de coco)
Investimento estimado: R$ 250K (auditoria + plano de ação)
Prazo: 60 dias para laudo; 90 dias para plano de ação
```

---

## Trace Completo

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Sinal detectado** | fiscalização municipal em Olinda; empresas do setor agroindustrial recebendo notificações para auditoria |
| **Classificação** | `relevant` (demanda regulatória; ticket menor mas recorrente) |
| **Output** | `MarketSignal { signal_id: "MS-2026-AUD-001", sector: "auditoria_ambiental", region: "PE", classification: "relevant" }` |
| **Gate** | QG-001.1 PASS |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Fontes** | SEMA/PE, CPRH, legislação ambiental PE, alvará municipal, notícias fiscalização |
| **TAM** | R$ 5M (auditoria ambiental PE); SOM R$ 250K (projeto específico) |
| **Competidores** | 4 consultoras ambientais em Recife/Olinda |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 250K", competitors: 4, client_profile: "mandatory_audit" }` |
| **Gate** | QG-001.2 PASS |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Critérios** | Ajuste 9/10 (ambiental = core); Financeiro 4/10 (R$ 250K); Sinergia 7/10; Regulatório 9/10 (obrigatório); Urgência 8/10 (prazo SEMA) |
| **Score** | **KOS = 74** (Avançar) |
| **Gate** | QG-001.3 PASS |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` + `mining` (ambiental) + `perícia` (auditoria) |
| **Fontes** | SEMA/PE, CPRH, CONAMA 311/2002 (auditoria), Res. 312/2002, legislação municipal Olinda, alvará |
| **Pesquisa regulatória** | Conforme Res. CONAMA 311/2002 e 312/2002; PGRS; PPCBMS; alvará ambiental municipal |
| **Pesquisa técnica** | Processo: beneficiamento de coco → resíduos: cascas, efluente oleoso, efluente orgânico; passivos ambientais potenciais |
| **Output** | `ResearchPackage { sources: 10, primary: 5, confidence: "high" }` |
| **Gate** | QG-001.4 PASS |

### Fase 5 — Validação

| Campo | Resultado esperado |
|---|---|
| **Evidências** | 8/10 (80%) high/medium |
| **Output** | `ValidatedEvidence { high: 5, medium: 3, low: 2 }` |
| **Gate** | QG-001.5 PASS |

### Fase 6 — Inteligência Estratégica

| Campo | Resultado esperado |
|---|---|
| **Análise** | Auditoria obrigatória; empresa sob fiscalização; potencial paraPlano de Ação e monitoramento contínuo |
| **Recomendação** | Avançar; pacote: auditoria + PGRS + monitoramento |
| **Margem** | 40% |
| **Output** | `StrategicBrief { recommendation: "APROVAR", margin: 0.40 }` |
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
| **Conta** | Agro Indústria PE; Diretor Industrial: nome; Responsável Ambiental: nome |
| **Abordagem** | Indicada pela SEMA; contato direto |
| **Output** | `BDPlan { approach: "indicacao_sema" }` |
| **Gate** | QG-001.8 PASS |

### Fase 9 — Qualificação

| Campo | Resultado esperado |
|---|---|
| **BANT** | |
| — Budget | ✅ R$ 250K disponível (obrigação legal) |
| — Authority | ✅ Diretor decide; SEMA determina |
| — Need | ✅ Auditoria obrigatória por alvará |
| — Timeline | ✅ 60 dias para laudo; SEMA exige |
| **Score** | **BANT = 4/4** |
| **Gate** | QG-001.9 PASS |

### Fase 10 — Estratégia de Proposta

| Campo | Resultado esperado |
|---|---|
| **Escopo** | 1) Auditoria ambiental in loco 2) Análise de resíduos e efluentes 3) Avaliação de passivos 4) Conformidade com PGRS 5) Laudo de auditoria 6) Plano de Ação corretivo 7) Relatório para SEMA |
| **Margem** | 40% |
| **Cronograma** | Auditoria 30 dias + Laudo 30 dias + Plano de Ação 30 dias |
| **Investimento** | R$ 250K |
| **Output** | `ProposalStrategy { scope: "auditoria_pgrs_plano_acao", margin: 0.40 }` |
| **Gate** | QG-001.10 PASS |

### Fase 11 — Proposta Comercial

| Campo | Resultado esperado |
|---|---|
| **Documento** | Proposta formal: 7 módulos, cronograma, investimento, equipe (3 especialistas: auditoria ambiental) |
| **Output** | `CommercialProposal { version: "2.0", modules: 7, approved: true }` |
| **Gate** | QG-001.11 PASS |

---

## Skills Activated

| Skill | Agente | Fase |
|---|---|---|
| `web-research` | data-analytics | 1, 2, 4 |
| `regulatory-mapping` | mining, data-analytics | 4 |
| `environmental-audit` | mining, perícia | 4, 5, 10 |
| `waste-management` | mining | 4 |
| `effluent-analysis` | mining | 4 |

---

## Subagentes Mobilizados

| Subagente | Responsabilidade |
|---|---|
| `mining` | Auditoria ambiental, análise de resíduos/efluentes |
| `perícia` | Laudo técnico, conformidade regulatória |
| `iot-embedded` | Sensores de monitoramento (se aplicável) |
| `commercial` | Proposta |
| `data-analytics` | Dados regulatórios, legislação |

---

## Escalation Points

| Ponto | Trigger | Nível |
|---|---|---|
| Passivo ambiental significativo | Não-conformidade grave | Nível 3 (CTO) |
| SEMA com processo ativo | Risco legal | Nível 3 (CTO + jurídico) |
| Efluente acima limites | Multa significativa | Nível 3 (CTO) |
| Proposta > R$ 500K | Aprovação | Nível 4 (CEO) |
