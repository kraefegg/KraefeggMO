# Workflow: Pesquisa → Relatório

> **ID:** WK-003
> **Versão:** 1.0
> **Autor:** CTO / data-analytics (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo completo de formulação de pergunta de pesquisa até publicação de relatório qualificado.

---

## Visão Geral

```
Formulação da Pergunta → Identificação de Fontes → Coleta de Dados → Verificação
    → Análise → Classificação de Evidências → Geração do Relatório
    → Revisão de Qualidade → Publicação
```

---

## Fase 1 — Formulação da Pergunta (Question Formulation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (orquestração) + `ceo` (aprovação para temas estratégicos) |
| **Input** | Demanda interna (CEO/CTO), demanda externa (cliente), ou detecção automática (monitoramento) |
| **Processo** | Transformação da demanda em pergunta de pesquisa clara, mensurável e delimitada |
| **Output** | `ResearchQuestion` `{ question_id, question, scope, delimitations[], hypothesis[], deadline }` |
| **Critérios** | Pergunta deve ser: específica, mensurável, alcancável, relevante, temporal |
| **Gate de saída** | Pergunta aprovada com escopo definido |
| **Timeout** | 4h para perguntas padrão; 24h para perguntas estratégicas |
| **Human-in-the-loop** | Nível 1 — AI Assisted; Nível 2 se envolver decisão estratégica |

---

## Fase 2 — Identificação de Fontes (Source Identification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` |
| **Input** | `ResearchQuestion` da Fase 1 |
| **Processo** | Mapeamento de fontes potenciais, classificação por tipo e confiabilidade |
| **Categorias de fonte** | |
| — Primárias | Dados governamentais (IBAMA, ANP, ANEEL, IBGE), reguladores, dados abertos |
| — Secundárias | Relatórios setoriais, artigos científicos, bases de dados pagas |
| — Terciárias | Notícias, redes sociais, opiniões especializadas |
| **Output** | `SourceMap` `{ sources[], classification, coverage_analysis }` |
| **Critérios mínimos** | ≥ 3 fontes primárias ou secundárias; cobertura ≥ 80% do escopo |
| **Gate de saída** | SourceMap com fontes suficientes identificadas |
| **Timeout** | 8h |
| **Escalation** | Se fontes insuficientes → retornar à Fase 1 para refinar pergunta |

---

## Fase 3 — Coleta de Dados (Data Collection)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` + agents especializados (`mining`, `renewable-energy`, `iot-embedded`) |
| **Input** | `SourceMap` da Fase 2 |
| **Processo** | Extração estruturada de dados de cada fonte, padronização, registro de metadata |
| **Output** | `RawData` `{ dataset_id, source_refs[], collected_at, format, records_count }` |
| **Metadata obrigatória** | Fonte original, data de coleta, método de extração, dados faltantes |
| **Gate de saída** | Dados coletados de ≥ 80% das fontes mapeadas |
| **Timeout** | 24h para pesquisa padrão; 72h para dados de campo |
| **Controle** | Backup dos dados brutos em versionamento; hash de integridade |

---

## Fase 4 — Verificação (Verification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (validação técnica) + `perícia` (quando aplicável) |
| **Input** | `RawData` da Fase 3 |
| **Processo** | Cross-reference entre fontes, verificação de consistência temporal, detecção de anomalias |
| **Metodologia de verificação** | |
| — Triangulação | ≥ 2 fontes independentes confirmando o mesmo dado |
| — Consistência temporal | Dados coerentes com séries históricas |
| — Plausibilidade | Valores dentro de ranges esperados |
| — Fonte primária | Preferência absoluta para dados primários |
| **Output** | `VerifiedData` `{ dataset_id, verification_status, confidence_levels[], anomalies[] }` |
| **Confidence levels** | `high` (triangulado, primário), `medium` (1 fonte primária), `low` (apenas secundário), `unverified` (não verificado) |
| **Gate de saída** | ≥ 70% dos dados com confidence `high` ou `medium` |
| **Timeout** | 12h |
| **Escalation** | Anomalia crítica → pausar e notificar CTO; dados < 50% verificados → retornar à Fase 3 |

---

## Fase 5 — Análise (Analysis)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (orquestração) + departamentos especializados |
| **Input** | `VerifiedData` da Fase 4 |
| **Processo** | Análise estatística, qualitativa, comparativa conforme tipo de pesquisa |
| **Tipos de análise** | Descritiva, diagnóstica, preditiva, prescritiva |
| **Output** | `AnalysisResult` `{ findings[], methodology, limitations[], statistical_significance }` |
| **Gate de saída** | Análise completa com limitations documentadas |
| **Timeout** | 24h para análise padrão; 72h para modelagem complexa |
| **Human-in-the-loop** | Nível 2 — Revisão humana para conclusões significativas |

---

## Fase 6 — Classificação de Evidências (Evidence Classification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` + `data-analytics` |
| **Input** | `AnalysisResult` da Fase 5 |
| **Processo** | Cada achado classificado por grau de evidência e impacto |
| **Classificação** | |
| — Nível A | Evidência robusta (múltiplas fontes primárias, corroborada) |
| — Nível B | Evidência moderada (fonte primária única ou múltiplas secundárias) |
| — Nível C | Evidência preliminar (fonte única, não corroborada) |
| — Nível D | Especialista/Opinião (sem dados empíricos) |
| **Output** | `ClassifiedEvidence` `{ findings[], each_with: evidence_level, impact, confidence }` |
| **Gate de saída** | Todos os findings classificados; nenhum finding Nível A contradizido por findings de nível inferior |
| **Timeout** | 8h |
| **Escalation** | Conclusões Nível A com impacto estratégico → CEO aprova antes de incluir no relatório |

---

## Fase 7 — Geração do Relatório (Report Generation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (estrutura) + departamentos (conteúdo técnico) |
| **Input** | `ClassifiedEvidence` + `ResearchQuestion` |
| **Output** | `DraftReport` — relatório completo em formato padronizado |
| **Estrutura obrigatória** | 1) Sumário Executivo 2) Metodologia 3) Resultados 4) Discussão 5) Conclusões 6) Recomendações 7) Referências 8) Anexos |
| **Formato** | Markdown (master) → PDF (entrega) → HTML (publicação web) |
| **Controle de versão** | v1.0 (draft) → v1.1 (revisão interna) → v2.0 (aprovado) |
| **Gate de saída** | Draft completo com todas as seções preenchidas |
| **Timeout** | 24h |
| **Escalation** | Resultados sensíveis → CEO revisa antes de distribuição |

---

## Fase 8 — Revisão de Qualidade (Quality Review)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `cto` (orquestração) + peer review |
| **Input** | `DraftReport` da Fase 7 |
| **Processo** | Revisão de: precisão técnica, consistência, clareza, completude, compliance |
| **Critérios** | 1) Dados verificáveis 2) Metodologia documentada 3) Limitações declaradas 4) Referências completas 5) Sem erros factuais |
| **Output** | `ReviewReport` `{ approved, findings[], revision_needed: bool }` |
| **Gate de saída** | Zero erros factuais; todas as referências validadas |
| **Timeout** | 2 dias |
| **Human-in-the-loop** | Nível 3 — Validação técnica profissional obrigatória |
| **Escalation** | Erro factual identificado → corrigir e reenviar; dispute de conclusão → CTO decide |

---

## Fase 9 — Publicação (Publication)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `data-analytics` (publicação) + `commercial` (distribuição, se para cliente) |
| **Input** | `DraftReport` aprovado (v2.0+) |
| **Processo** | Geração de artefatos finais, publicação no knowledge base, distribuição conforme audiência |
| **Output** | `PublishedReport` `{ report_id, version, published_at, distribution_list[], access_level }` |
| **Canais de distribuição** | Knowledge base interno, portal do cliente (se aplicável), arquivo regulatório |
| **Gate de saída** | Relatório publicado e acessível aos destinatários |
| **Timeout** | 24h após aprovação |
| **Audit trail** | Registro de publicação: quem publicou, quando, para quem, versão |

---

## Mapa de Decisões

```
     ┌──────────────────┐
     │ Demanda/Pergunta  │
     └────────┬─────────┘
              │
     ┌────────▼─────────┐
     │Formulação Pergunta│
     └────────┬─────────┘
              │
     ┌────────▼─────────┐
     │Identificação     │
     │Fontes            │
     └──┬────────────┬──┘
  Insuf.│            │Suficiente
┌───────▼──┐  ┌──────▼───────┐
│Refinar   │  │Coleta Dados  │
│Pergunta  │  └──────┬───────┘
└──────────┘         │
              ┌──────▼───────┐
              │Verificação   │
              └──┬────────┬──┘
           Fail──┘        └──Pass
     ┌────────▼──┐  ┌──────▼───────┐
     │Re-coletar │  │Análise       │
     └───────────┘  └──────┬───────┘
                           │
                  ┌────────▼────────┐
                  │Classificação    │
                  │Evidências       │
                  └────────┬────────┘
                           │
                  ┌────────▼────────┐
                  │Geração          │
                  │Relatório        │
                  └────────┬────────┘
                           │
                  ┌────────▼────────┐
                  │Revisão          │
                  │Qualidade        │
                  └──┬──────────┬───┘
               Fail──┘          └──Pass
          ┌───────────┐  ┌──────────┐
          │Corrigir   │  │Publicar  │
          └───────────┘  └──────────┘
```

---

## Requisitos de Fontes por Tipo de Pesquisa

| Tipo de pesquisa | Fontes mínimas | Primárias obrigatórias | Secundárias | Terciárias |
|---|---|---|---|---|
| **Regulatória** | 5 | ≥ 2 (legislação, normas) | ≥ 2 | ≤ 1 |
| **Técnica** | 7 | ≥ 3 (papers, laudos) | ≥ 3 | ≤ 1 |
| **Mercado** | 5 | ≥ 2 (dados setoriais) | ≥ 2 | ≤ 1 |
| **Ambiental** | 6 | ≥ 3 (dados de campo, licenças) | ≥ 2 | ≤ 1 |
| **Due diligence** | 8 | ≥ 4 (documentos oficiais) | ≥ 3 | ≤ 1 |

---

## Metodologia de Verificação

| Método | Quando usar | Critério de sucesso |
|---|---|---|
| **Triangulação** | Dados factuais | ≥ 2 fontes independentes concordam |
| **Verificação temporal** | Séries de dados | Dados coerentes com tendência histórica |
| **Validação de fonte** | Qualquer dado | Fonte primária e confiável |
| **Plausibilidade** | Dados quantitativos | Valor dentro de range esperado |
| **Revisão por especialista** | Dados técnicos | Especialista confirma validade |
| **Auditoria de processo** | Dados de campo | Método documentado e reproduzível |
