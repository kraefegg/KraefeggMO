# Workflow: Funil de Vendas

> **ID:** WK-004
> **Versão:** 1.0
> **Autor:** commercial (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo completo de geração de lead até onboarding do cliente.

---

## Visão Geral

```
Geração de Lead → Pesquisa de Conta → Identificação Decisor → Aproximação
    → Qualificação → Análise de Necessidades → Proposta → Negociação
    → Fechamento → Onboarding
```

---

## Estágios do CRM

| Estágio | Fase | Conversão esperada | Tempo máximo |
|---|---|---|---|
| `lead` | Geração | → qualified 30% | 30 dias |
| `qualified` | Qualificação | → needs_analysis 60% | 15 dias |
| `needs_analysis` | Análise | → proposal 70% | 20 dias |
| `proposal` | Proposta | → negotiation 50% | 30 dias |
| `negotiation` | Negociação | → closed_won 60% | 30 dias |
| `closed_won` | Fechamento | → onboarded 100% | 15 dias |
| `closed_lost` | Perdido | Arquivado | — |

---

## Fase 1 — Geração de Lead (Lead Generation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `market-segment` + `commercial` |
| **Fontes** | Sinais de mercado (WK-001), indicações, eventos, outbound, inbound, parcerias |
| **Processo** | Captura, deduplicação, enriquecimento básico, classificação |
| **Output** | `Lead` `{ lead_id, source, company, sector, region, captured_at, status: "lead" }` |
| **Enriquecimento** | CNPJ, porte, faturamento estimado, presença digital, notícias recentes |
| **Gate de saída** | Lead válido (empresa existe, contato identificado) |
| **Timeout** | 24h para enriquecimento |
| **Escalation** | Lead enterprise (faturamento > R$ 100M) → CEO notificado |

---

## Fase 2 — Pesquisa de Conta (Account Research)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `market-segment` + `data-analytics` |
| **Input** | `Lead` qualificado |
| **Processo** | Deep-dive na empresa: strutura, decisores, dores, histórico, oportunidades |
| **Skills ativados** | `web-research`, `competitor-analysis`, `linkedin-research` |
| **Output** | `AccountProfile` `{ company_overview, pain_points[], budget_indicators, decision_makers[], competitive_landscape }` |
| **Gate de saída** | Perfil com ≥ 2 pain points identificados e ≥ 1 decisor mapeado |
| **Timeout** | 48h |
| **Human-in-the-loop** | Nível 1 — AI Assisted |

---

## Fase 3 — Identificação de Decisor (Decision Maker ID)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` |
| **Input** | `AccountProfile` da Fase 2 |
| **Processo** | Mapeamento do org chart, identificação de: Economic Buyer, Champion, Gatekeeper, Influencers |
| **Output** | `StakeholderMap` `{ economic_buyer, champion, gatekeeper, influencers[], blockers[] }` |
| **Gate de saída** | ≥ Economic Buyer identificado com canal de contato |
| **Timeout** | 24h |
| **Escalation** | Se nenhum decisor acessível → `market-segment` busca via parcerias/eventos |

---

## Fase 4 — Aproximação (Approach)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (execução) + `ceo` (quando C-level) |
| **Input** | `StakeholderMap` + `AccountProfile` |
| **Processo** | Primeiro contato personalizado: email, LinkedIn, evento, indicação |
| **Materiais** | Apresentação institucional, cases do setor, one-pager personalizado |
| **Output** | `ContactLog` `{ contact_id, channel, date, response, next_action }` |
| **Gate de saída** | Contato estabelecido com resposta positiva ou neutral |
| **Timeout** | 7 dias para 3 tentativas |
| **Escalation** | Sem resposta após 3 tentativas → `market-segment` busca abordagem alternativa; 14 dias sem resposta → mover para `closed_lost` com tag `nurture` |
| **Human-in-the-loop** | Nível 2 — CEO participa de abordagem C-level |

---

## Fase 5 — Qualificação (Qualification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` |
| **Input** | `ContactLog` + feedback do contato |
| **Metodologia** | BANT (Budget, Authority, Need, Timeline) |
| **Output** | `QualificationScore` `{ B: bool, A: bool, N: bool, T: bool, score: 0-4, notes }` |
| **Gate de saída** | BANT ≥ 3/4 → `qualified`; 2/4 → manter em nurture; < 2/4 → `closed_lost` |
| **Timeout** | 10 dias |
| **Escalation** | BANT ≥ 3 mas sem budget confirmado → commercial + ceo revisam |

---

## Fase 6 — Análise de Necessidades (Needs Analysis)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (orquestração) + `cto` (técnico) |
| **Input** | `QualificationScore` BANT ≥ 3 |
| **Processo** | Discovery call: mapeamento de dores, requisitos, expectativas, restrições,成功 benchmarks |
| **Output** | `NeedsAssessment` `{ pain_points[], requirements[], success_criteria, constraints[], budget_range }` |
| **Gate de saída** | Documento validado pelo cliente (feedback positivo) |
| **Timeout** | 10 dias |
| **Human-in-the-loop** | Nível 2 — CTO participa de discovery técnica |

---

## Fase 7 — Proposta (Proposal)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` + `cto` + `data-analytics` |
| **Input** | `NeedsAssessment` aprovado |
| **Processo** | Geração de proposta comercial alinhada com WK-001 Fases 10-11 |
| **Output** | `Proposal` `{ proposal_id, scope, deliverables, timeline, investment, terms }` |
| **Gate de saída** | Proposta aprovada por CTO (escopo) + CEO (comercial) |
| **Timeout** | 7 dias |
| **Human-in-the-loop** | Nível 2 — Revisão de pricing e escopo |

---

## Fase 8 — Negociação (Negotiation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (orquestração) + `ceo` (aprovações) |
| **Input** | `Proposal` enviada + feedback do cliente |
| **Processo** | Rodadas de negociação: escopo, preço, prazo, termos |
| **Output** | `NegotiationLog` `{ rounds[], concessions[], final_terms, status }` |
| **Limites de concessão** | Desconto ≤ 15% (aprovação CTO); 15-25% (aprovação CEO); > 25% (reavaliar viabilidade) |
| **Gate de saída** | Termos finais aceitos por ambas as partes |
| **Timeout** | 30 dias para fechar negociação |
| **Escalation** | Impasse em 2 rodadas → CEO participa diretamente; pedidos de escopo sem custo adicional → CTO analisa |

---

## Fase 9 — Fechamento (Close)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` + `ceo` (contrato) |
| **Input** | `NegotiationLog` com termos finais |
| **Processo** | Geração de contrato, assinatura, recebimento inicial |
| **Output** | `ClosedDeal` `{ deal_id, contract_signed, payment_terms, start_date, project_id }` |
| **Gate de saída** | Contrato assinado + primeiro pagamento recebido (ou condições de pagamento acordadas) |
| **Timeout** | 10 dias para assinatura |
| **Audit trail** | Contrato versionado com hash; registro de assinatura com timestamp |

---

## Fase 10 — Onboarding

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração técnica) + `commercial` (interface) |
| **Input** | `ClosedDeal` |
| **Processo** | Kick-off meeting, definição de canais de comunicação, acesso a ferramentas, introdução à equipe |
| **Output** | `OnboardingComplete` `{ client_setup, access_granted, kickoff_done, first_checkpoint }` |
| **Gate de saída** | Kick-off realizado + primeiro checkpoint agendado |
| **Timeout** | 5 dias úteis após fechamento |
| **Pós-onboard** | Transição para WK-002 (Entrega Técnica) |

---

## Métricas do Funil

| Métrica | Target | Alerta |
|---|---|---|
| Lead → Qualified | ≥ 30% | < 15% |
| Qualified → Closed Won | ≥ 40% | < 20% |
| Ciclo total (lead → close) | ≤ 90 dias | > 150 dias |
| Ticket médio | ≥ R$ 100K | < R$ 50K |
| Margem média | ≥ 30% | < 20% |
| Taxa de retenção pós-12 meses | ≥ 85% | < 70% |
| Net Promoter Score | ≥ 8 | < 5 |
