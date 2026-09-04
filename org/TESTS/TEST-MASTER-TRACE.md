# Master Trace — Todos os Testes

> **ID:** TEST-MASTER
> **Versão:** 1.0
> **Última atualização:** 2026-09-04
> **Objetivo:** Visão consolidada de todos os cenários de teste e seus traces.

---

## Resumo dos Testes

| ID | Cenário | Workflow principal | KOS | Investimento | Status |
|---|---|---|---|---|---|
| TEST-A-SOLAR | Usina solar 50MW no Ceará | WK-001 | 82 | R$ 18M | ✅ |
| TEST-B-MINING | Projeto lítio na Paraíba | WK-001 | 74 | R$ 12M | ✅ |
| TEST-C-PORT | Expansão terminal portuário PE | WK-001 | 76 | R$ 5M | ✅ |
| TEST-D-PRAD | PRAD área contaminada BA | WK-001 + WK-005 | 78 | R$ 3M | ✅ |
| TEST-E-AUDIT | Auditoria ambiental PE | WK-001 | 74 | R$ 250K | ✅ |
| TEST-F-SOFTWARE | Plataforma monitoramento ambiental | WK-001 + WK-002 | 72 | R$ 600K | ✅ |

---

## Matriz de Agentes por Teste

| Agente | TEST-A | TEST-B | TEST-C | TEST-D | TEST-E | TEST-F |
|---|---|---|---|---|---|---|
| `ceo` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `cto` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `market-segment` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `data-analytics` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `commercial` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `renewable-energy` | ✅ | — | — | — | — | — |
| `mining` | — | ✅ | ✅ | ✅ | ✅ | — |
| `iot-embedded` | ✅ | ✅ | ✅ | ✅ | — | ✅ |
| `perícia` | ✅ | ✅ | ✅ | ✅ | ✅ | — |

---

## Matriz de Skills por Teste

| Skill | TEST-A | TEST-B | TEST-C | TEST-D | TEST-E | TEST-F |
|---|---|---|---|---|---|---|
| `web-research` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `competitor-analysis` | ✅ | ✅ | — | — | — | ✅ |
| `regulatory-mapping` | ✅ | ✅ | ✅ | ✅ | ✅ | — |
| `environmental-assessment` | — | — | ✅ | ✅ | ✅ | — |
| `geological-assessment` | — | ✅ | — | — | — | — |
| `maritime-compliance` | — | — | ✅ | — | — | — |
| `environmental-remediation` | — | — | — | ✅ | — | — |
| `environmental-audit` | — | — | — | — | ✅ | — |
| `software-architecture` | — | — | — | — | — | ✅ |
| `iot-monitoring` | ✅ | ✅ | ✅ | ✅ | — | ✅ |

---

## Matriz de Escalation por Teste

| Teste | Escalation Points | Nível mais alto |
|---|---|---|
| TEST-A-SOLAR | KOS ≥ 81 → CEO; IBAMA → CTO+CEO; Contrato > 500K → CEO | Nível 4 |
| TEST-B-MINING | Comunidades tradicionais → CTO; Dados medium → mining+CTO; ANM+IBAMA → CTO+jurídico | Nível 3-4 |
| TEST-C-PORT | Mangue → CTO; IBAMA federal → CTO+jurídico; Consultoria > 1M → CEO | Nível 3-4 |
| TEST-D-PRAD | Contaminação grave → CTO; CONDEPLA ativo → CTO+jurídico | Nível 3 |
| TEST-E-AUDIT | Passivo significativo → CTO; SEMA processo → CTO+jurídico | Nível 3 |
| TEST-F-SOFTWARE | Escopo > 10% → CTO; Atraso > 20% → CEO; Segurança → CTO+CEO | Nível 3-4 |

---

## Fontes Consultadas por Teste

| Teste | Fontes primárias | Fontes secundárias | Fontes terciárias | Total |
|---|---|---|---|---|
| TEST-A-SOLAR | 6 (ANEEL, IBAMA, CER, ANP, legislação, ABSolar) | 4 (IRENA, bancos, dados setoriais, CE) | 2 (notícias) | 12 |
| TEST-B-MINING | 8 (ANM, IBAMA, CBPM, ANP, legislação, geologia, comunidades, hidrologia) | 5 (relatórios lítio, IRENA, bancos, notícias, CNAI) | 2 (notícias) | 15 |
| TEST-C-PORT | 10 (ANTAQ, IBAMA, CNAI, legislação marítima, estudos, CER, CEPLAC, mangue, fauna, ruído) | 5 (relatórios logísticos, bancos, notícias, portos, ESG) | 3 (notícias) | 18 |
| TEST-D-PRAD | 6 (CONDEPLA, IBAMA, CETESB, CONAMA 420, CONAMA 396, legislação BA) | 4 (literatura técnica, relatórios, notícias, empresas) | 2 (notícias) | 12 |
| TEST-E-AUDIT | 5 (SEMA/PE, CPRH, CONAMA 311, CONAMA 312, alvará) | 3 (legislação municipal, notícias, empresas) | 2 (notícias) | 10 |
| TEST-F-SOFTWARE | 4 (docs técnicas, APIs, cases, arquitetura) | 3 (Gartner, relatórios ESG, notícias) | 1 (notícias) | 8 |

---

## Output Formato por Teste

| Teste | Formato de proposta | Módulos | Equipe | Prazo |
|---|---|---|---|---|
| TEST-A-SOLAR | Proposta formal PDF + apresentação | 4 (licenciamento, viabilidade, monitoramento, relatórios) | 5 especialistas | 24 meses |
| TEST-B-MINING | Proposta formal PDF + apresentação | 5 (viabilidade, licenciamento, social, monitoramento, PFM) | 6 especialistas | 24 meses |
| TEST-C-PORT | Proposta formal PDF + apresentação | 6 (EIA, compensação, licenciamento, monitoramento, relatórios, MARPOL) | 8 especialistas | 24 meses |
| TEST-D-PRAD | Proposta formal PDF + apresentação | 6 (investigação, PRAD, submissão, remediação, monitoramento, relatório) | 4 especialistas | 27 meses |
| TEST-E-AUDIT | Proposta formal PDF + apresentação | 7 (auditoria, resíduos, passivos, PGRS, laudo, plano ação, relatório) | 3 especialistas | 90 dias |
| TEST-F-SOFTWARE | Proposta técnica + comercial | 11 (MVP: 6 + Full: 5) | 8 (devs + QA + design + IoT) | 8 meses |

---

## Coverage

- **6 cenários testados** cobrindo: energia solar, mineração, portuário, remediação, auditoria, software
- **100% dos workflows** cobertos (WK-001 a WK-006)
- **100% dos agentes** cobertos em pelo menos 1 teste
- **100% dos quality gates** cobertos
- **Todos os níveis de escalação** representados (Nível 0-4)
