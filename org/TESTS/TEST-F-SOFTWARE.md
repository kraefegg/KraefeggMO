# Teste F — Desenvolvimento de Software

> **ID:** TEST-F-SOFTWARE
> **Workflow:** WK-001 (Oportunidade → Proposta) + WK-002 (Entrega Técnica)
> **Versão:** 1.0
> **Última atualização:** 2026-09-04

---

## Input

```
Cliente solicita plataforma de monitoramento ambiental.
Cliente: "EcoMonitor Tecnologia Ltda." — CNPJ: XX.XXX.XXX/0001-XX
Objetivo: Plataforma web + mobile para monitoramento ambiental em tempo real
Funcionalidades: dashboard, alertas, relatórios, gestão de sensores, compliance
Investimento estimado: R$ 600K (desenvolvimento) + R$ 120K/ano (manutenção)
Prazo: MVP em 4 meses; plataforma completa em 8 meses
```

---

## Trace Completo — Fase de Proposta (WK-001)

### Fase 1 — Market Intelligence

| Campo | Resultado esperado |
|---|---|
| **Agente** | `market-segment` |
| **Sinal detectado** | Demanda crescente por plataformas ESG; empresas precisam de monitoramento ambiental para compliance; mercado PropTech/EnvTech em expansão |
| **Classificação** | `strategic` (tecnologia = sinergia; mercado em crescimento) |
| **Output** | `MarketSignal { signal_id: "MS-2026-SW-001", sector: "envtech", region: "BR", classification: "strategic" }` |
| **Gate** | QG-001.1 PASS |

### Fase 2 — Opportunity Intelligence

| Campo | Resultado esperado |
|---|---|
| **Fontes** | ABIPLAST, ABES, relatórios Gartner (Mercado Ambiental), notícias ESG Brasil, legislação ambiental |
| **TAM** | R$ 2B (monitoramento ambiental Brasil); R$ 200M (software ambiental); SOM R$ 5M |
| **Competidores** | 5 plataformas existentes; nenhuma com foco em PME nordestinas |
| **Output** | `OpportunityIntelligence { estimated_value: "R$ 600K", competitors: 5, client_profile: "envtech_startup" }` |
| **Gate** | QG-001.2 PASS |

### Fase 3 — Score KOS

| Campo | Resultado esperado |
|---|---|
| **Critérios** | Ajuste 8/10 (tech+ambiental); Financeiro 6/10 (R$ 600K + recorrente); Sinergia 9/10 (portfólio); Regulatório 7/10; Urgência 6/10 |
| **Score** | **KOS = 72** (Avançar) |
| **Gate** | QG-001.3 PASS |

### Fase 4 — Pesquisa

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `data-analytics` + `cto` (tecnologia) + `iot-embedded` (hardware) |
| **Fontes** | Stack tecnológico (React, Python, PostgreSQL), cases de plataformas similares, documentação de APIs de sensores |
| **Pesquisa técnica** | Arquitetura: React/Vite frontend, Python/FastAPI backend, PostgreSQL, Redis, Docker, MQTT para sensores |
| **Pesquisa de mercado** | Benchmarking com plataformas existentes; gaps identificados: foco PME nordestina, integração IoT nativa |
| **Output** | `ResearchPackage { sources: 8, primary: 4, confidence: "high", tech_stack: "confirmed" }` |
| **Gate** | QG-001.4 PASS |

### Fases 5-11 — (resumidas)

| Fase | Resultado |
|---|---|
| 5. Validação | PASS — 87% high/medium |
| 6. Estratégica | PASS — Recomendar; margem 35% |
| 7. Decisão | PASS — CEO aprova; confiança 80% |
| 8. BD | PASS — Cliente procura ativamente |
| 9. Qualificação | PASS — BANT 4/4 |
| 10. Estratégia | PASS — Escopo: MVP + full; margem 35%; cronograma 8 meses |
| 11. Proposta | PASS — v2.0 aprovada |

---

## Trace Completo — Fase de Entrega (WK-002)

### Fase 1 — Solicitação do Cliente

| Campo | Resultado esperado |
|---|---|
| **Input** | Contrato assinado + kickoff |
| **Classificação** | Tipo: `desenvolvimento`; Urgência: `normal` |
| **Output** | `ProjectRequest { request_id: "PR-2026-042", type: "desenvolvimento", urgency: "normal" }` |

### Fase 2 — Definição de Escopo

| Campo | Resultado esperado |
|---|---|
| **Agentes** | `cto` + equipe técnica |
| **Entregáveis MVP (4 meses)** | 1) Dashboard web (React) 2) App mobile (React Native) 3) API REST (FastAPI) 4) Integração MQTT sensores 5) Sistema de alertas 6) Relatórios básicos |
| **Entregáveis Full (8 meses)** | + 7) Gestão de sensores 8) Módulo de compliance 9) Analytics avançado 10) Multi-tenant 11) API pública |
| **Output** | `ProjectScope { milestones: ["MVP-4m", "Full-8m"], deliverables: 11, tech_stack: "React/FastAPI/PostgreSQL" }` |
| **Gate** | QG-002.2 PASS — escopo aprovado por CTO + cliente |

### Fase 3 — Alocação de Recursos

| Campo | Resultado esperado |
|---|---|
| **Equipe** | |
| — Tech Lead | 1 (CTO supervisão) |
| — Full-stack devs | 3 |
| — Mobile dev | 1 |
| — IoT engineer | 1 (part-time) |
| — Designer UX/UI | 1 |
| — QA | 1 |
| **Horas estimadas** | 2.400h (4 meses MVP) + 2.400h (4 meses full) |
| **Output** | `ResourcePlan { team_size: 8, hours: 4800, capacity: 92% }` |
| **Gate** | QG-002.3 PASS — ≥ 90% capacidade |

### Fase 4 — Execução

| Campo | Resultado esperado |
|---|---|
| **Metodologia** | Scrum (2-week sprints) |
| **Checkpoints** | Semanal (status), quinzenal (review), mensal (executivo) |
| **Sprint 1-4** | MVP: Dashboard + API + MQTT + Alertas |
| **Sprint 5-8** | Full: Gestão sensores + Compliance + Analytics |
| **Output** | `ProgressReport { sprint: "4/8", completion: "45%", blockers: 0 }` |
| **Gate** | QG-002.4 PASS — tasks ≤ 10% atraso |

### Fase 5 — Revisão de Qualidade

| Campo | Resultado esperado |
|---|---|
| **Checks** | 1) Code review (100% PRs) 2) Testes unitários (coverage ≥ 80%) 3) Testes E2E (fluxos críticos) 4) Security scan (zero critical) 5) Performance (API < 200ms) 6) Accessibility (WCAG 2.1) |
| **Output** | `QualityReport { pass: true, coverage: "82%", security: "clean", performance: "150ms avg" }` |
| **Gate** | QG-002.5 PASS — zero critical findings |

### Fases 6-10 — (resumidas)

| Fase | Resultado |
|---|---|
| 6. Aprovação CTO | PASS — hash SHA-256 registrado |
| 7. Entrega | PASS — repositório taggeado `release/v1.0.0` + docs |
| 8. Aceite | PASS — cliente aceita; satisfação 8/10 |
| 9. Lições | PASS — retrospectiva documentada |
| 10. Knowledge Base | PASS — entradas publicadas |

---

## Skills Activated

| Skill | Agente | Fase |
|---|---|---|
| `web-research` | data-analytics | 1, 2, 4 |
| `competitor-analysis` | market-segment | 2 |
| `software-architecture` | cto | 2, 3 |
| `frontend-development` | equipe técnica | 4 |
| `backend-development` | equipe técnica | 4 |
| `iot-integration` | iot-embedded | 4 |
| `code-review` | cto, equipe técnica | 5 |
| `security-audit` | cto | 5 |

---

## Subagentes Mobilizados

| Subagente | Responsabilidade |
|---|---|
| `cto` | Arquitetura, supervisão técnica, aprovação |
| `data-analytics` | Dados de mercado, analytics da plataforma |
| `iot-embedded` | Integração com sensores (MQTT, protocolos) |
| `commercial` | Proposta, interface com cliente |
| `perícia` | Compliance regulatório (se aplicável) |

---

## Escalation Points

| Ponto | Trigger | Nível |
|---|---|---|
| Mudança de escopo solicitada pelo cliente | Alteração > 10% | Nível 2 (CTO) |
| Atraso > 20% no cronograma | Risco de entrega | Nível 3 (CEO) |
| Vulnerabilidade de segurança | Risco reputacional | Nível 3 (CTO + CEO) |
| Contrato > R$ 500K | Aprovação | Nível 4 (CEO) |
| Tech debt significativo | Decisão de arquitetura | Nível 3 (CTO) |

---

## Controle de Versão

| Elemento | Versão | Tag |
|---|---|---|
| MVP | v1.0.0 | `release/mvp-v1.0.0` |
| Full | v2.0.0 | `release/full-v2.0.0` |
| Hotfixes | v1.0.x | `hotfix/v1.0.x` |
| Feature branches | v1.x.0 | `feature/*` |
