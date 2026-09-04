# Catálogo de Workflows — KRAEFEGG M.O.

**Versão:** 1.0.0  
**Última revisão:** 2026-09-04  
**Total de workflows:** 6 + 7 cenários de teste

---

## 1. Workflows de Negócio

| Workflow ID | Nome | Trigger | Agentes Principais | Output Principal | Duração Estimada |
|---|---|---|---|---|---|
| `WK-001` | Oportunidade → Proposta Comercial | Sinal de mercado detectado | market-segment, data-analytics, ceo, commercial, cto | CommercialProposal | 15-30 dias |
| `WK-002` | Entrega Técnica de Projeto | Contrato assinado / demanda cliente | cto, project-management, engineering-dev, quality | DeliveryPackage + AcceptanceForm | Conforme escopo |
| `WK-003` | Pesquisa → Relatório | Pergunta de pesquisa formulada | data-analytics, cto, research-scientist, research-academic | PublishedReport | 15-30 dias |
| `WK-004` | Funil de Vendas | Lead gerado ou recebido | commercial, market-segment, client-prospecting, cto, ceo | ClosedDeal + OnboardingComplete | 30-90 dias |
| `WK-005` | Licenciamento Ambiental | Projeto com impacto ambiental | environmental-engineering, environmental-forensic-audit, iot-embedded | LO Issued | 6-24 meses |
| `WK-006` | Resposta a Emergências | Incidente detectado | safety-engineering, iot-embedded, cto, ceo, pericia | EmergencyLessons + CorrectiveActionPlan | 24h-30 dias |

---

## 2. Detalhamento por Workflow

### WK-001 — Oportunidade → Proposta Comercial
**11 fases:** Market Intelligence → Opportunity Intelligence → Score KOS → Research → Evidence Validation → Strategic Intelligence → Executive Decision → BD → Qualification → Proposal Strategy → Commercial Proposal

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Market Intelligence | market-segment | Sinal classificado como relevant/strategic | 24h |
| F2 — Opportunity Intelligence | market-segment + data-analytics | Oportunidade mapeada ≥ 3 fontes | 48h |
| F3 — Score KOS | ceo + market-segment | KOS ≥ 61 para prosseguir | 24h |
| F4 — Research | data-analytics + specialists | Pacote ≥ 5 fontes validadas | 72-120h |
| F5 — Evidence Validation | cto | ≥ 80% evidências high/medium | 24h |
| F6 — Strategic Intelligence | ceo + departamentos | Brief aprovado por CEO | 48h |
| F7 — Executive Decision | ceo | APROVAR com ≥ 70% confiança | 48h |
| F8 — Business Development | commercial + ceo | Plano aprovado | 5 dias |
| F9 — Qualification | commercial | BANT ≥ 3/4 | 10 dias |
| F10 — Proposal Strategy | cto + commercial + data-analytics | Margem ≥ 25% | 5 dias |
| F11 — Commercial Proposal | commercial + cto | Aprovação CEO + CTO | 4 dias |

**Níveis HITL:** F1-F2 (Nível 1), F3-F4 (Nível 2), F6 (Nível 4), F10 (Nível 2), F11 (Nível 4)

---

### WK-002 — Entrega Técnica de Projeto
**10 fases:** Client Request → Scope Definition → Resource Allocation → Execution → Quality Review → CTO Approval → Delivery → Client Acceptance → Lessons Learned → Knowledge Base

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Client Request | commercial + ceo | Request registrada e classificada | 4h |
| F2 — Scope Definition | cto + departamentos | Escopo aprovado CTO + cliente | 5-10 dias |
| F3 — Resource Allocation | cto + ceo | ≥ 90% recursos alocados | 3 dias |
| F4 — Execution | Equipe designada | Tasks completed | Conforme cronograma |
| F5 — Quality Review | cto + peer review | Zero critical findings | 3 dias |
| F6 — CTO Approval | cto | Aprovação com hash SHA-256 | 24h |
| F7 — Delivery | cto + commercial | Cliente confirma recebimento | 48h |
| F8 — Client Acceptance | commercial + equipe | Aceite formal | 15 dias úteis |
| F9 — Lessons Learned | cto + equipe | Documento publicado | 5 dias |
| F10 — Knowledge Base | data-analytics | Entradas publicadas | 3 dias |

**Níveis HITL:** F2 (Nível 2), F4 (Nível 3), F5 (Nível 3), F8 (Nível 3)

---

### WK-003 — Pesquisa → Relatório
**9 fases:** Question Formulation → Source Identification → Data Collection → Verification → Analysis → Evidence Classification → Report Generation → Quality Review → Publication

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Question Formulation | data-analytics + ceo | Pergunta aprovada | 4-24h |
| F2 — Source Identification | data-analytics | SourceMap com fontes suficientes | 8h |
| F3 — Data Collection | data-analytics + specialists | ≥ 80% fontes coletadas | 24-72h |
| F4 — Verification | cto | ≥ 70% dados high/medium | 12h |
| F5 — Analysis | data-analytics + departamentos | Análise completa | 24-72h |
| F6 — Evidence Classification | cto + data-analytics | Todos findings classificados | 8h |
| F7 — Report Generation | data-analytics + departamentos | Draft completo | 24h |
| F8 — Quality Review | cto + peer review | Zero erros factuais | 2 dias |
| F9 — Publication | data-analytics + commercial | Relatório publicado | 24h |

**Níveis HITL:** F1 (Nível 1-2), F5 (Nível 2), F6 (Nível 4 para estratégicos), F8 (Nível 3)

---

### WK-004 — Funil de Vendas
**10 fases:** Lead Generation → Account Research → Decision Maker ID → Approach → Qualification → Needs Analysis → Proposal → Negotiation → Close → Onboarding

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Lead Generation | market-segment + commercial | Lead válido | 24h |
| F2 — Account Research | market-segment + data-analytics | ≥ 2 pain points + 1 decisor | 48h |
| F3 — Decision Maker ID | commercial | Economic Buyer identificado | 24h |
| F4 — Approach | commercial + ceo (C-level) | Contato estabelecido | 7 dias |
| F5 — Qualification | commercial | BANT ≥ 3/4 | 10 dias |
| F6 — Needs Analysis | commercial + cto | Documento validado | 10 dias |
| F7 — Proposal | commercial + cto + data-analytics | Proposta aprovada | 7 dias |
| F8 — Negotiation | commercial + ceo | Termos aceitos | 30 dias |
| F9 — Close | commercial + ceo | Contrato assinado | 10 dias |
| F10 — Onboarding | cto + commercial | Kick-off realizado | 5 dias |

**Níveis HITL:** F4 (Nível 2 — CEO C-level), F6 (Nível 2 — CTO), F7 (Nível 2), F8 (Nível 4 — CEO)

---

### WK-005 — Licenciamento Ambiental
**7 fases:** Project Screening → LP → EIA/RIMA → Licensing Review → LI → LO → Monitoring

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Screening | environmental-engineering + data-analytics | Lista de licenças definida | 48h |
| F2 — LP | environmental-engineering | LP emitida | 30-60 dias |
| F3 — EIA/RIMA | environmental-engineering + pericia + iot-embedded | EIA completo | 6-18 meses |
| F4 — Licensing Review | environmental-engineering | Parecer favorável | 12-24 meses |
| F5 — LI | environmental-engineering | LI emitida | 30 dias |
| F6 — LO | environmental-engineering + iot-embedded | LO emitida | 60-120 dias |
| F7 — Monitoring | iot-embedded + environmental-engineering | Relatórios entregues | Contínuo |

**Níveis HITL:** F3 (Nível 3 — profissional habilitado), F4 (Nível 3), F6 (Nível 3)

---

### WK-006 — Resposta a Emergências
**9 fases:** Detection → Classification → Escalation → Response Team → Containment → Investigation → Reporting → Corrective Action → Lessons Learned

| Fase | Responsável | Gate | Timeout |
|---|---|---|---|
| F1 — Detection | iot-embedded + qualquer | Incidente confirmado | 15 min |
| F2 — Classification | safety-engineering + iot-embedded | Classificação aprovada | 30 min |
| F3 — Escalation | safety-engineering | Todos notificados | 15 min (N3-4) |
| F4 — Response Team | safety-engineering | Equipe montada | 15-30 min |
| F5 — Containment | Equipe de resposta | Incidente contido | 30min-2h |
| F6 — Investigation | safety-engineering + pericia | Causa raiz identificada | 72h-30d |
| F7 — Reporting | safety-engineering + pericia | Relatórios publicados | 24h-5d |
| F8 — Corrective Action | safety-engineering + departamentos | Plano aprovado | 7 dias |
| F9 — Lessons Learned | safety-engineering + equipe | Lições publicadas | 30 dias |

**Níveis HITL:** F2-F3 (Nível 4 para Nível 4), F5 (Nível 3-4), F6 (Nível 3), F8 (Nível 2-4)

---

## 3. Integração entre Workflows

| Workflow | Alimenta | Alimentado por |
|---|---|---|
| WK-001 (Oportunidade → Proposta) | WK-002 (quando aprovado) | — |
| WK-002 (Entrega Técnica) | WK-003 (dados de projeto) | WK-001 |
| WK-003 (Pesquisa → Relatório) | WK-001 (evidências), WK-005 (EIA) | WK-002 |
| WK-004 (Funil de Vendas) | WK-001 (leads), WK-002 (clientes) | — |
| WK-005 (Licenciamento) | WK-002 (condicionantes) | WK-001 |
| WK-006 (Emergências) | WK-005 (monitoramento) | Qualquer |

---

## 4. Cenários de Teste

| Teste | Cenário | Workflow | Arquivo |
|---|---|---|---|
| TEST-A | Projeto Solar 50MW Ceará | WK-001 | `TESTS/TEST-A-SOLAR.md` |
| TEST-B | Mineração Sudeste | WK-001/WK-002 | `TESTS/TEST-B-MINING.md` |
| TEST-C | Porto Marítimo | WK-002 | `TESTS/TEST-C-PORT.md` |
| TEST-D | PRAD Ambiental | WK-005 | `TESTS/TEST-D-PRAD.md` |
| TEST-E | Auditoria SNURSE | WK-003 | `TESTS/TEST-E-AUDIT.md` |
| TEST-F | Software Delivery | WK-002 | `TESTS/TEST-F-SOFTWARE.md` |
| TEST-M | Master Trace (todos) | Todos | `TESTS/TEST-MASTER-TRACE.md` |

---

## 5. Métricas de Performance por Workflow

| Métrica | WK-001 | WK-002 | WK-003 | WK-004 | WK-005 | WK-006 |
|---|---|---|---|---|---|---|
| Tempo total | ≤ 30d | Conforme escopo | ≤ 30d | ≤ 90d | 6-24m | ≤ 30d |
| Taxa aprovação 1ª revisão | ≥ 80% | ≥ 85% | ≥ 85% | — | — | — |
| Quality gate pass rate | ≥ 90% | ≥ 90% | ≥ 90% | — | — | — |
| Achados CRITICAL | ≤ 1 | ≤ 2 | ≤ 1 | — | — | ≤ 1 |

---

**Novos workflows devem seguir o template dos existentes e ser adicionados a este catálogo.**
