# Workflow: Oportunidade → Proposta Comercial

> **ID:** WK-001
> **Versão:** 1.0
> **Autor:** CEO / CTO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo completo de detecção de sinal de mercado até geração de proposta comercial qualificada.

---

## Visão Geral

```
Sinal de Mercado → Inteligência de Oportunidade → Score KOS → Pesquisa → Validação
    → Inteligência Estratégica → Decisão Executiva → BD → Qualificação →
    → Estratégia de Proposta → Proposta Comercial
```

---

## Fase 1 — Inteligência de Mercado (Market Intelligence)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `market-segment` |
| **Input** | Sinais brutos (notícias, licitações, editais, redes sociais, alertas regulatórios) |
| **Processo** | Coleta, normalização e classificação de sinais por setor, região e potencial |
| **Output** | `MarketSignal[]` — lista estruturada de sinais com metadata |
| **Output format** | JSON `{ signal_id, source, sector, region, detected_at, raw_text, classification }` |
| **Gate de saída** | Sinal classificado como `relevant` ou `strategic` (descartar `noise`) |
| **Timeout** | 24h desde detecção até classificação |
| **Escalation** | Se sinal > R$ 50M ou envolver governo → notificar CEO imediatamente |

---

## Fase 2 — Inteligência de Oportunidade (Opportunity Intelligence)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `market-segment` + `data-analytics` |
| **Input** | `MarketSignal[]` aprovado na Fase 1 |
| **Processo** | Enriquecimento com dados de mercado, mapeamento competitivo, estimativa de TAM/SAM/SOM |
| **Output** | `OpportunityIntelligence` — brief aprofundado da oportunidade |
| **Output format** | JSON `{ opportunity_id, description, sector, region, estimated_value, competitors[], client_profile }` |
| **Gate de saída** | Oportunidade mapeada com pelo menos 3 fontes independentes |
| **Timeout** | 48h desde aprovação até brief completo |
| **Human-in-the-loop** | Nível 1 — AI Assisted (análise padrão); Nível 2 se valor > R$ 10M |

---

## Fase 3 — Score KOS (Kraefegg Opportunity Score)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `ceo` (decisor final) + `market-segment` (cálculo) |
| **Input** | `OpportunityIntelligence` da Fase 2 |
| **Cálculo** | KOS = f(ajuste_setorial, potencial_financeiro, sinergia_portfolio, risco_regulatório, urgência) |
| **Faixas** | `0-40` Descartar · `41-60` Monitorar · `61-80` Avançar · `81-100` Prioritário |
| **Output** | `KOSReport` com score + justificativa + recommended_action |
| **Gate de saída** | KOS ≥ 61 → prosseguir; KOS 41-60 → monitorar mensalmente; KOS < 40 → arquivar |
| **Timeout** | 24h desde brief até score |
| **Escalation** | KOS ≥ 81 → briefing executivo imediato ao CEO; KOS entre 61-80 → agenda revisão semanal |
| **Override** | CEO pode aprovar qualquer oportunidade independentemente do KOS com justificativa |

---

## Fase 4 — Pesquisa (Research)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (primário) + `mining` / `renewable-energy` / `iot-embedded` (especialistas) |
| **Input** | `KOSReport` + `OpportunityIntelligence` |
| **Processo** | Pesquisa profunda: regulamentação aplicável, mapas de stakeholders, análise de viabilidade técnica, benchmarking competitivo |
| **Skills ativados** | `web-research`, `competitor-analysis`, `regulatory-mapping` |
| **Sources obrigatórias** |fontes primárias (gov, reguladores), fontes secundárias (relatórios setoriais), fontes terciárias (notícias) |
| **Output** | `ResearchPackage` — pacote consolidado de evidências |
| **Output format** | Markdown estruturado com tabelas + anexos JSON |
| **Gate de saída** | Pacote com ≥ 5 fontes validadas, sem contradições não resolvidas |
| **Timeout** | 72h para pesquisa padrão; 120h para projetos > R$ 20M |
| **Escalation** | Se encontrar risco regulatório crítico → pausar e notificar CTO + CEO |

---

## Fase 5 — Validação de Evidências (Evidence Validation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (validação técnica) + `perícia` (quando aplicável) |
| **Input** | `ResearchPackage` da Fase 4 |
| **Processo** | Cross-reference de fontes, verificação de consistência, identificação de gaps |
| **Critérios de validação** | Fonte primária confirmada? Dados datados? Contradições resolvidas? |
| **Output** | `ValidatedEvidence` — evidências com grau de confiança (`high/medium/low`) |
| **Gate de saída** | ≥ 80% das evidências com grau `high` ou `medium` |
| **Timeout** | 24h |
| **Escalation** | Se < 50% high/medium → retornar à Fase 4 para pesquisa adicional |

---

## Fase 6 — Inteligência Estratégica (Strategic Intelligence)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `ceo` (orquestração) + todos departamentos relevantes |
| **Input** | `ValidatedEvidence` + `KOSReport` |
| **Processo** | Análise estratégica: posicionamento competitivo, valuation preliminar, riscos e oportunidades, modelo de receita |
| **Output** | `StrategicBrief` — documento executivo de decisão |
| **Output format** | Markdown com seções: Resumo Executivo, Análise, Recomendação, Riscos, Próximos Passos |
| **Gate de saída** | Brief aprovado por CEO com assinatura digital (hash do documento) |
| **Timeout** | 48h |
| **Human-in-the-loop** | Nível 4 — CEO Approval obrigatório (decisão estratégica/financeira) |
| **Escalation** | Se envolver parceria/joint venture → incluir assessores jurídicos |

---

## Fase 7 — Decisão Executiva (Executive Decision)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `ceo` |
| **Input** | `StrategicBrief` da Fase 6 |
| **Decisões possíveis** | `APROVAR` → Fase 8 · `REJEITAR` → Arquivar · `ADIA_REVISAO` → Agendar em 30 dias · `SOLICITAR_MAIS_INFO` → Retornar à Fase 4 |
| **Registro** | `DecisionRecord` `{ decision_id, timestamp, decision, rationale, confidence_level, override_kos }` |
| **Gate de saída** | Decisão `APROVAR` com ≥ 70% de confiança |
| **Timeout** | 48h para decisão; 7 dias se `ADIA_REVISAO` |
| **Audit trail** | Registro imutável no knowledge base com hash SHA-256 |

---

## Fase 8 — Business Development

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` + `ceo` (aprovação final) |
| **Input** | `StrategicBrief` + Decisão `APROVAR` |
| **Processo** | Mapeamento de tomadores de decisão, estratégia de aproximação, preparação de materiais |
| **Output** | `BDPlan` — plano de desenvolvimento comercial |
| **Output format** | Checklist + timeline + materiais necessários |
| **Gate de saída** | Plano aprovado com conta mapeada e primer contato agendado |
| **Timeout** | 5 dias úteis |
| **Escalation** | Se contato direto com C-level necessário → CEO participa pessoalmente |

---

## Fase 9 — Qualificação (Qualification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` |
| **Input** | `BDPlan` + feedback de primeiro contato |
| **Metodologia** | BANT (Budget, Authority, Need, Timeline) ou MEDDIC conforme tipo de venda |
| **Output** | `QualificationScore` com BANT breakdown |
| **Gate de saída** | BANT ≥ 3/4 para avançar; 2/4 para manter em pipeline; < 2/4 para descartar |
| **Timeout** | 10 dias para ciclo completo de qualificação |
| **Escalation** | Se BANT ≥ 3/4 mas budget não confirmado → escalar para commercial + ceo |

---

## Fase 10 — Estratégia de Proposta (Proposal Strategy)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (escopo técnico) + `commercial` (comercial) + `data-analytics` (valuation) |
| **Input** | `QualificationScore` + `StrategicBrief` |
| **Processo** | Definição de escopo, precificação, escopo/exclusões, cronograma, termos |
| **Output** | `ProposalStrategy` — documento de estratégia da proposta |
| **Output format** | Template estruturado: Escopo, Entregáveis, Cronograma, Investimento, Termos |
| **Gate de saída** | Margem alvo ≥ 25% (projetos) ou ≥ 40% (consultoria); aprovação CTO do escopo |
| **Timeout** | 5 dias |
| **Human-in-the-loop** | Nível 2 — Revisão humana para pricing e escopo |
| **Escalation** | Margem < 20% → CEO decide se prossegue com margem reduzida |

---

## Fase 11 — Proposta Comercial (Commercial Proposal)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `commercial` (oratória) + `cto` (técnica) |
| **Input** | `ProposalStrategy` aprovada |
| **Processo** | Geração do documento formal, revisão final, aprovação executiva |
| **Output** | `CommercialProposal` — PDF/DOCX formal com: Sumário, Escopo, Cronograma, Investimento, Equipe, Casos de Sucesso, Termos |
| **Versão** | Controle de versão v1.0, v1.1, v2.0; cada versão com hash e timestamp |
| **Gate de saída** | Aprovação CEO + CTO antes de envio ao cliente |
| **Timeout** | 3 dias para geração; 1 dia para revisão final |
| **Audit trail** | Versão final com hash SHA-256 registrada no knowledge base |
| **Pós-envio** | Tracking de abertura, follow-up em 3 dias úteis, escalação em 7 dias sem resposta |

---

## Mapa de Decisões

```
                    ┌─────────────────┐
                    │ Sinal de Mercado │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │   Classificação  │
                    └───┬─────┬───────┘
                   noise│     │relevant/strategic
                ┌───────▼┐   ┌▼──────────────┐
                │Arquivar │   │Opportunity Intel│
                └────────┘   └───┬────────────┘
                                 │
                        ┌────────▼────────┐
                        │    Score KOS     │
                        └──┬──────┬───────┘
                  <40 ─────┘      │ ≥61
               ┌────▼────┐   ┌────▼────┐
               │Arquivar │   │ Pesquisa│
               └─────────┘   └────┬────┘
                                  │
                         ┌────────▼────────┐
                         │Validar Evidências│
                         └──┬──────────┬───┘
                    <50%high│          │≥80%high/med
                   ┌────────▼──┐  ┌────▼──────────┐
                   │Re-pesquisar│  │Intel Estratégica│
                   └───────────┘  └────┬──────────┘
                                       │
                              ┌────────▼────────┐
                              │ Decisão Executiva│
                              └──┬────┬────┬────┘
                        APROVAR─┘    │    └─REJEITAR
                    ┌────────▼────┐  │  ┌────▼────┐
                    │    BD       │  │  │Arquivar │
                    └──────┬──────┘  │  └─────────┘
                           │         │
                    ┌──────▼──────┐  │
                    │Qualificação │  │
                    └──┬──────┬───┘  │
                BANT≥3─┘      └─<2──┘
           ┌─────────▼──┐  ┌────▼────┐
           │Proposta    │  │Descartar│
           │Comercial   │  └─────────┘
           └────────────┘
```

---

## Caminhos Paralelos

| Caminho paralelo | Trigger | Agentes |
|---|---|---|
| **Due Diligence Jurídica** | Envolva contratos/regulação | `perícia` + consultoria jurídica externa |
| **Due Diligence Técnica** | Projeto de engenharia | `cto` + departamentos técnicos relevantes |
| **Análise Financeira** | Investimento > R$ 5M | `ceo` + `data-analytics` |
| **Benchmarking Competitivo** | Concorrência > 3 players | `market-segment` + `data-analytics` |
| **Parceria Estratégica** | Necessidade de JV/subcontratação | `ceo` + `commercial` |

---

## Níveis de Human-in-the-Loop

| Nível | Quando | Ação humana |
|---|---|---|
| **Nível 0** | Tarefas rotineiras | Nenhuma (agente executa autonomamente) |
| **Nível 1** | Análise padrão | Revisão opcional, sugestão de改进 |
| **Nível 2** | Decisões significativas | Aprovação antes de avançar de fase |
| **Nível 3** | Validação técnica/regulatória | Profissional qualificado assina |
| **Nível 4** | Decisão estratégica/financeira/legal | CEO aprova pessoalmente |

---

## Métricas de Performance

| Métrica | Target | Alerta |
|---|---|---|
| Tempo total (sinal → proposta) | ≤ 30 dias | > 45 dias |
| Taxa de conversão KOS ≥ 61 → proposta | ≥ 60% | < 40% |
| Qualificação BANT ≥ 3/4 | ≥ 70% das propostas | < 50% |
| Aprovação na primeira revisão | ≥ 80% | < 60% |
| Tempo de resposta a follow-up cliente | ≤ 24h | > 48h |
