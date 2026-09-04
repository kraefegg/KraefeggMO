# Workflow: Resposta a Emergências

> **ID:** WK-006
> **Versão:** 1.0
> **Autor:** CTO + safety_compliance (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo de detecção de incidente até implementação de ações corretivas com lições aprendidas.
> **Base legal:** NR-1, NR-29 (portuária), IBAMA/EIRA, Plano de Contingência.

---

## Visão Geral

```
Detecção do Incidente → Classificação → Escalation → Ativação da Equipe
    → Contenção → Investigação → Relatório → Ação Corretiva → Lições Aprendidas
```

---

## Níveis de Severidade

| Nível | Descrição | Exemplos | Tempo de resposta |
|---|---|---|---|
| **Nível 1 — Menor** | Sem dano significativo, sem parada operacional | Vazamento pequeno contido, near-miss | 4h para registro |
| **Nível 2 — Moderado** | Dano localizado, parada parcial | Vazamento moderado, falha de equipamento, lesão leve | 2h para resposta |
| **Nível 3 — Grave** | Dano significativo, parada operacional | Vazamento de óleo, incêndio localizado, lesão grave | 30 min para resposta |
| **Nível 4 — Crítico** | Dano ambiental extenso, risco à vida | Explosão, derramamento massivo, fatalidade | Imediato (15 min) |

---

## Fase 1 — Detecção do Incidente (Incident Detection)

| Campo | Detalhe |
|---|---|
| **Fontes de detecção** | Sensores IoT (WK-005), relatos de equipe, monitoramento ambiental, sistema de alarme, denúncias externas |
| **Agente responsável** | `iot-embedded` (sensores) + qualquer membro da equipe (relato) |
| **Input** | Sinal de alarme, leitura anômala, relato humano |
| **Processo** | Verificação imediata do sinal, confirmação do incidente, registro inicial |
| **Output** | `IncidentAlert` `{ alert_id, source, timestamp, location, initial_description, detector }` |
| **Gate de saída** | Incidente confirmado (não é falso alarme) |
| **Timeout** | 15 min para confirmação |
| **Falso alarme** | Se falso alarme → registrar como `near_miss` para análise |

---

## Fase 2 — Classificação (Classification)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` (orquestração) + `iot-embedded` (dados) |
| **Input** | `IncidentAlert` da Fase 1 |
| **Processo** | Avaliação de severidade, extensão, risco, vítimas |
| **Critérios de classificação** | |
| — Vítimas? | Sim → Nível 3 ou 4 |
| — Risco ambiental significativo? | Sim → Nível 3 ou 4 |
| — Parada operacional? | Parcial → Nível 2; Total → Nível 3 |
| — Dano material > R$ 100K? | Sim → Nível 3 |
| **Output** | `IncidentClassification` `{ incident_id, severity_level, category, victims, environmental_risk, operational_impact }` |
| **Categorias** | `ambiental`, `operacional`, `seguranca`, `estrutural`, `cybersecurity` |
| **Gate de saída** | Classificação aprovada por `safety_compliance` |
| **Timeout** | 30 min |
| **Escalation** | Nível 4 → CEO notificado imediatamente via todas as vias |

---

## Fase 3 — Escalation

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` |
| **Input** | `IncidentClassification` da Fase 2 |
| **Cadeia de notificação por nível** | |
| **Nível 1** | safety_compliance → equipe_local |
| **Nível 2** | safety_compliance → cto → equipe_local |
| **Nível 3** | safety_compliance → cto → ceo → corpo_bombeiros (se necessário) |
| **Nível 4** | safety_compliance → cto → ceo → corpo_bombeiros → IBAMA/órgão regulador → jurídico → comunidade (se necessário) |
| **Output** | `EscalationLog` `{ incident_id, notifications_sent[], channels[], escalation_timestamp }` |
| **Canais** | Interno: chat, email, phone. Externo: órgão regulador, corpo de bombeiros, SAMU |
| **Gate de saída** | Todos os notificados confirmaram recebimento |
| **Timeout** | Nível 3/4: 15 min para notificação completa |
| **Human-in-the-loop** | Nível 4 — CEO assume comando |

---

## Fase 4 — Ativação da Equipe de Resposta (Response Team Activation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` (orquestração) |
| **Input** | `IncidentClassification` + `EscalationLog` |
| **Processo** | Mobilização da equipe de resposta, designação de liderança, montagem do centro de comando |
| **Composição da equipe** | |
| — Nível 1-2 | Líder local + equipe técnica |
| — Nível 3 | Líder local + CTO + especialistas + comunicações |
| — Nível 4 | CEO (comandante) + CTO + todos departamentos + assessoria jurídica + comunicações externas |
| **Output** | `ResponseTeam` `{ team_id, leader, members[], roles[], assembly_point, communication_channel }` |
| **Gate de saída** | Equipe montada e comunicando |
| **Timeout** | 15 min (Nível 3-4); 30 min (Nível 1-2) |

---

## Fase 5 — Contenção (Containment)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | Equipe de resposta (execução) |
| **Input** | `ResponseTeam` + dados do incidente |
| **Processo** | Ações imediatas para conter o dano, isolar a área, proteger vidas e meio ambiente |
| **Ações por tipo** | |
| — Ambiental | Contenção de derramamento, barreiras, absorção, neutralização |
| — Segurança | Evacuação, isolamento, primeiros socorros |
| — Estrutural | Isolamento, contenção estrutural, corte de energia |
| — Operacional | Parada segura de equipamentos, transferência de carga |
| **Output** | `ContainmentLog` `{ actions[], timestamp, personnel, equipment_used, status }` |
| **Gate de saída** | Incidente contido (sem propagação) |
| **Timeout** | Conforme tipo: Ambiental 2h; Segurança 30min; Estrutural 1h |
| **Escalation** | Se contenção não viável → evacuação total + notificação externa |

---

## Fase 6 — Investigação (Investigation)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` (orquestração) + `perícia` (execução) |
| **Input** | Dados do incidente +ContainmentLog + testemunhos |
| **Processo** | Coleta de evidências, entrevistas, análise de causa raiz (5 Porquês, Ishikawa) |
| **Output** | `InvestigationReport` `{ root_cause, contributing_factors[], evidence[], timeline_reconstruction, immediate_causes }` |
| **Metodologia** | 5 Porquês + Ishikawa + Análise de Barreiras |
| **Gate de saída** | Causa raiz identificada com ≥ 2 evidências |
| **Timeout** | 72h para incidente Nível 1-2; 7 dias para Nível 3; 30 dias para Nível 4 |
| **Human-in-the-loop** | Nível 3 — Profissional qualificado assina laudo |
| **Escalation** | Se causa raiz for falha sistêmica → CEO implementa mudanças estruturais |

---

## Fase 7 — Relatório (Reporting)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` + `perícia` |
| **Input** | `InvestigationReport` |
| **Processo** | Geração de relatório formal, conforme exigências regulatórias |
| **Relatórios obrigatórios** | |
| — Interno | `IncidentReport` completo para knowledge base |
| — Regulatório | CAT (Comunicação de Acidente de Trabalho) para MTb; Relatório ambiental para IBAMA/órgão estadual |
| — Cliente | Se incidente afetou operação do cliente |
| **Output** | `OfficialReport` `{ report_id, internal_report, regulatory_report, client_report, published_at }` |
| **Prazos regulatórios** | CAT: 1 dia útil (NR-1); Relatório ambiental: 5 dias (IBAMA) |
| **Gate de saída** | Relatórios publicados e enviados |
| **Timeout** | 24h para CAT; 72h para relatório interno; 5 dias para órgão ambiental |
| **Audit trail** | Todos os relatórios versionados e com hash |

---

## Fase 8 — Ação Corretiva (Corrective Action)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` (orquestração) + departamentos relevantes |
| **Input** | `InvestigationReport` + `OfficialReport` |
| **Processo** | Definição e implementação de ações corretivas e preventivas |
| **Tipos de ação** | |
| — Imediata | Correção do problema identificado |
| — Preventiva | Medidas para evitar recorrência |
| — Sistêmica | Mudanças em processos, procedimentos, treinamento |
| **Output** | `CorrectiveActionPlan` `{ actions[], responsible[], deadlines[], priority, status }` |
| **Gate de saída** | Plano aprovado por CTO; ações críticas aprovadas por CEO |
| **Timeout** | 7 dias para plano; implementação conforme prioridade |
| **Human-in-the-loop** | Nível 2 — Revisão para ações significativas |

---

## Fase 9 — Lições Aprendidas (Lessons Learned)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `safety_compliance` + toda a equipe envolvida |
| **Input** | Investigação + Ações Corretivas implementadas |
| **Processo** | Sessão de retrospectiva, documentação de aprendizados, atualização de procedimentos |
| **Output** | `EmergencyLessons` `{ what_worked[], what_failed[], process_updates[], training_needs[] }` |
| **Gate de saída** | Lições publicadas no knowledge base; procedimentos atualizados |
| **Timeout** | 30 dias após implementação das ações corretivas |
| **Controle** | Atualização do plano de emergência conforme lições |

---

## Mapa de Decisões

```
     ┌──────────────────┐
     │   Incidente       │
     └────────┬─────────┘
              │
     ┌────────▼─────────┐
     │ Classificação     │
     └──┬────┬────┬────┬┘
     N1─┘  N2─┘  N3─┘  N4─┘
    ┌──▼─┐ ┌──▼─┐ ┌──▼─┐ ┌──▼──┐
    │4h  │ │2h  │ │30m │ │15m  │
    └─┬──┘ └─┬──┘ └─┬──┘ └─┬──┘
      │      │      │      │
      └──────┴──────┴──────┘
              │
     ┌────────▼─────────┐
     │ Containment       │
     └──┬───────────┬───┘
  Contido│           │Não contido
┌────────▼──┐  ┌─────▼──────┐
│Investigar │  │Evacuar +   │
└────┬──────┘  │Escalation  │
     │         └────────────┘
┌────▼──────┐
│Relatório  │
└────┬──────┘
     │
┌────▼──────────┐
│Ações Corretivas│
└────┬──────────┘
     │
┌────▼──────────┐
│Lições        │
│Aprendidas    │
└──────────────┘
```

---

## Tempos Máximos por Atividade

| Atividade | Nível 1 | Nível 2 | Nível 3 | Nível 4 |
|---|---|---|---|---|
| Detecção → Confirmação | 4h | 2h | 30min | 15min |
| Confirmação → Escalation | 4h | 2h | 15min | Imediato |
| Escalation → Equipe ativa | 2h | 1h | 30min | 15min |
| Equipe ativa → Containment | 4h | 2h | 1h | 30min |
| Containment → Investigação | 7d | 3d | 7d | 30d |
| Investigação → Relatório | 7d | 3d | 5d | 7d |
| Relatório → Ações corretivas | 14d | 7d | 7d | 30d |

---

## Notificação Regulatória Obrigatória

| Evento | Órgão | Prazo | Canal |
|---|---|---|---|
| Acidente de trabalho (CAT) | MTb/INSS | 1 dia útil | eSocial/SIST |
| Acidente grave (óbito/lesão grave) | Ministério Público + Sindicato | 24h | Ofício/Email |
| Incidente ambiental (derramamento) | IBAMA/Órgão estadual | 5 dias | Ofício/Email |
| Vazamento de substância perigosa | IBAMA + Defesa Civil | Imediato | Telefone + Ofício |
| Incêndio em instalação portuária | Capitania dos Portos | Imediato | Telefone |
