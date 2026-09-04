# Workflow: Entrega Técnica de Projeto

> **ID:** WK-002
> **Versão:** 1.0
> **Autor:** CTO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo completo de recebimento de demanda técnica até entrega ao cliente com lições aprendidas.

---

## Visão Geral

```
Solicitação do Cliente → Definição de Escopo → Alocação de Recursos → Execução
    → Revisão de Qualidade → Aprovação CTO → Entrega → Aceite do Cliente
    → Lições Aprendidas → Base de Conhecimento
```

---

## Fase 1 — Solicitação do Cliente (Client Request)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (recebimento) + `ceo` (triagem) |
| **Input** | Briefing do cliente (escopo, prazo, orçamento, restrições) |
| **Processo** | Registro da demanda, classificação por tipo e urgência, triagem inicial |
| **Output** | `ProjectRequest` `{ request_id, client, description, type, urgency, received_at }` |
| **Tipos** | `consultoria`, `desenvolvimento`, `auditoria`, `monitoramento`, `treinamento` |
| **Urgência** | `critica` (24h), `alta` (3 dias), `normal` (7 dias), `baixa` (15 dias) |
| **Gate de saída** | Request registrada e classificada no sistema |
| **Timeout** | 4h para classificação desde recebimento |
| **Escalation** | Urgência `critica` → CEO + CTO notificados imediatamente |

---

## Fase 2 — Definição de Escopo (Scope Definition)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração) + departamentos relevantes |
| **Input** | `ProjectRequest` da Fase 1 |
| **Processo** | Levantamento detalhado de requisitos, definição de entregáveis, identificação de dependências e riscos |
| **Output** | `ProjectScope` — documento de escopo formal |
| **Output format** | Markdown: Visão Geral, Objetivos, Entregáveis, Restrições, Premissas, Cronograma Preliminar, Riscos |
| **Gate de saída** | Escopo aprovado por CTO + cliente (sign-off) |
| **Timeout** | 5 dias úteis para projetos padrão; 10 dias para projetos > R$ 500K |
| **Human-in-the-loop** | Nível 2 — Revisão humana obrigatória para escopo |
| **Escalation** | Se escopo excede capacidade interna → CTO decide: subcontratar ou recusar |
| **Controle de versão** | v1.0 (draft) → v1.1 (revisado) → v2.0 (aprovado) |

---

## Fase 3 — Alocação de Recursos (Resource Allocation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` + `ceo` (aprovação orçamentária) |
| **Input** | `ProjectScope` aprovado + `available_resources` |
| **Processo** | Mapeamento de skills necessárias vs. disponíveis, estimativa de horas, definição de equipe |
| **Output** | `ResourcePlan` — plano de alocação com timeline |
| **Output format** | Tabela: `{ role, agent, hours_estimated, hours_available, start_date, end_date }` |
| **Gate de saída** | ≥ 90% dos recursos alocados confirmados; orçamento aprovado |
| **Timeout** | 3 dias |
| **Escalation** | Se conflito de recursos → CTO prioriza; se orçamento insuficiente → CEO decide |
| **Controle** | Utilização de capacidade por departamento; alerta se > 85% capacity |

---

## Fase 4 — Execução (Execution)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | Equipe designada no `ResourcePlan` |
| **Input** | `ProjectScope` + `ResourcePlan` |
| **Processo** | Desenvolvimento/trabalho conforme escopo, com checkpoints regulares |
| **Checkpoints** | Semanal (status update), quinzenal (revisão de progresso), mensal (review executivo) |
| **Output** | Entregáveis parciais + `ProgressReport` semanal |
| **Output format** | `ProgressReport` `{ report_id, period, tasks_completed, tasks_pending, blockers, risk_status }` |
| **Gate de saída** | Todas as tasks do scope marcadas como `completed` ou `deferred` com justificativa |
| **Timeout** | Conforme cronograma do `ProjectScope`; alerta se atraso > 10% |
| **Controle de versão** | Todo output versionado com tag `project_id-vX.Y`; branches Git por feature |
| **Quality gates intermediários** | Cada entregável parcial passa por revisão antes de commit |
| **Escalation** | Bloqueador não resolvido em 48h → CTO; atraso > 20% → CEO |

---

## Fase 5 — Revisão de Qualidade (Quality Review)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração) + peer review por outro departamento |
| **Input** | Todos os entregáveis da Fase 4 |
| **Processo** | Checklist de qualidade, revisão por pares, teste funcional (quando aplicável), validação contra escopo |
| **Critérios** | 1) Conformidade com escopo 2) Ausência de erros críticos 3) Performance 4) Documentação 5) Segurança |
| **Output** | `QualityReport` `{ pass/fail, findings[], severity, recommendation }` |
| **Gate de saída** | Zero finding `critical`; findings `major` ≤ 2 com plano de correção; findings `minor` documentados |
| **Timeout** | 3 dias para revisão padrão |
| **Human-in-the-loop** | Nível 3 — Validação técnica profissional obrigatória |
| **Escalation** | Finding `critical` → CTO decide: corrigir (prazo adicional) ou aceitar com waiver documentado |
| **Controle de versão** | Review registrada com hash do estado dos entregáveis |

---

## Fase 6 — Aprovação CTO (CTO Approval)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` |
| **Input** | `QualityReport` + todos os entregáveis |
| **Processo** | Revisão executiva técnica, verificação de compliance, assinatura digital |
| **Output** | `ApprovalRecord` `{ approval_id, timestamp, cto_signature, conditions[], waived_findings[] }` |
| **Gate de saída** | Aprovação formal com registro hash SHA-256 |
| **Timeout** | 24h |
| **Override** | CTO pode aprovar com condições; CEO pode override com justificativa documentada |
| **Audit trail** | Registro imutável: quem, quando, o que, condições, waivers |

---

## Fase 7 — Entrega (Delivery)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração) + `commercial` (comunicação com cliente) |
| **Input** | `ApprovalRecord` + entregáveis finais |
| **Processo** | Empacotamento, transmissão ao cliente, documentação de entrega |
| **Output** | `DeliveryPackage` — pacote final com: entregáveis, documentação, guia de uso, suporte pós-entrega |
| **Formato de entrega** | Repositório Git (tag release) + relatório PDF + apresentação executiva |
| **Gate de saída** | Cliente confirma recebimento |
| **Timeout** | 48h após aprovação CTO |
| **Controle de versão** | Tag `release/vX.Y.Z` no Git; hash de cada artefato documentado |

---

## Fase 8 — Aceite do Cliente (Client Acceptance)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (interface) + equipe técnica (suporte) |
| **Input** | `DeliveryPackage` entregue |
| **Processo** | Revisão pelo cliente, sessão de demonstração, coleta de feedback, formalização de aceite |
| **Output** | `AcceptanceForm` `{ accepted: bool, feedback, change_requests[], sign_off_date }` |
| **Gate de saída** | Aceite formal documentado; change requests categorizados |
| **Timeout** | 15 dias úteis para cliente responder |
| **Escalation** | Sem resposta em 10 dias → follow-up CEO; 15 dias → notificação formal |
| **Pós-aceite** | Iniciar Fase 9 e transição para suporte/market-segment |

---

## Fase 9 — Lições Aprendidas (Lessons Learned)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração) + toda a equipe do projeto |
| **Input** | Projeto completo + `AcceptanceForm` + retrospectiva |
| **Processo** | Sessão de retrospectiva, documentação de o que funcionou/não funcionou, recomendações |
| **Output** | `LessonsLearned` `{ what_worked[], what_failed[], recommendations[], metrics }` |
| **Gate de saída** | Documento publicado na base de conhecimento |
| **Timeout** | 5 dias úteis após aceite do cliente |
| **Formato** | Markdown padronizado com tags para busca |

---

## Fase 10 — Base de Conhecimento (Knowledge Base)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (publicação) |
| **Input** | `LessonsLearned` + `DeliveryPackage` + `ResearchPackage` (se houver) |
| **Processo** | Indexação, categorização, publicação no knowledge base |
| **Output** | Entradas indexadas com tags: `projeto_id`, `setor`, `tecnologia`, `lição` |
| **Gate de saída** | Entradas publicadas e buscáveis |
| **Timeout** | 3 dias após lições aprendidas |
| **Controle** | Versionamento do knowledge base; deduplicação de entradas |

---

## Mapa de Decisões

```
         ┌───────────────────┐
         │ Solicitação Cliente│
         └─────────┬─────────┘
                   │
         ┌─────────▼─────────┐
         │ Definição Escopo   │
         └──┬─────────────┬──┘
     Aprovado│             │Recusado
    ┌────────▼───┐   ┌─────▼─────┐
    │Alocação    │   │Comunicar  │
    │Recursos    │   │ao Cliente │
    └─────┬──────┘   └───────────┘
          │
    ┌─────▼──────┐
    │  Execução   │◄─── checkpoint
    └─────┬──────┘
          │
    ┌─────▼──────┐
    │Revisão     │
    │Qualidade   │
    └──┬─────┬───┘
  Pass─┘     └─Fail
┌────▼────┐ ┌──▼──────────┐
│Aprovação│ │Corrigir     │
│CTO      │ │Findings     │
└────┬────┘ └─────────────┘
     │
┌────▼────┐
│ Entrega  │
└────┬────┘
     │
┌────▼────┐     ┌──────────┐
│Aceite   │────►│Lições    │
│Cliente  │     │Aprendidas│
└─────────┘     └────┬─────┘
                     │
                ┌────▼─────┐
                │Knowledge │
                │Base      │
                └──────────┘
```

---

## Controle de Versão — Regras

| Regra | Detalhe |
|---|---|
| **Branching** | `main` (produção) ← `develop` ← `feature/*` |
| **Tags** | `release/vX.Y.Z` em cada entrega |
| **Commits** | Mensagens em pt-BR, formato: `[tipo] descrição` (`[feat]`, `[fix]`, `[docs]`, `[refactor]`) |
| **Review** | Todo PR requer ≥ 1 review antes de merge |
| **Changelog** | Atualizado a cada release |

---

## Escalação por Tipo de Problema

| Problema | Nível | Tempo limite | Escala para |
|---|---|---|---|
| Bloqueador técnico | 2 | 48h | CTO |
| Conflito de recursos | 2 | 24h | CTO → CEO |
| Atraso > 10% cronograma | 2 | Imediato | CTO |
| Atraso > 20% cronograma | 3 | Imediato | CEO |
| Finding critical qualidade | 3 | 24h | CTO → CEO |
| Risco de perda de cliente | 4 | Imediato | CEO |
| Questão financeira > orçamento | 4 | 24h | CEO |
