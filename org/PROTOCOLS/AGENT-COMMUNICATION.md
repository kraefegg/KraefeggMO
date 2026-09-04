# Protocolo: Comunicação entre Agentes

> **ID:** PT-001
> **Versão:** 1.0
> **Autor:** CTO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Padronizar o formato e fluxo de comunicação entre agentes do sistema.

---

## Formato Padrão de Mensagem

```
FROM: [agent_id]
TO: [agent_id | broadcast]
TASK: [task_id]
CONTEXT: [breve contexto da solicitação]
OBJECTIVE: [o que se espera como resultado]
INPUTS: [dados fornecidos para execução]
ASSUMPTIONS: [premissas que o receptor deve considerar]
DEADLINE: [prazo para resposta/entrega]
PRIORITY: [low | medium | high | critical]
```

### Campos obrigatórios

| Campo | Formato | Descrição |
|---|---|---|
| `FROM` | `agent_id` | Identificador único do agente remetente |
| `TO` | `agent_id` ou `broadcast` | Identificador do destinatário ou todos |
| `TASK` | `WK-XXX-FY-TZ` | ID da tarefa conforme workflow (Fase Y, Tarefa Z) |
| `CONTEXT` | texto livre (≤ 500 chars) | Resumo da situação que motivou a comunicação |
| `OBJECTIVE` | texto livre (≤ 300 chars) | Resultado esperado de forma clara e mensurável |
| `INPUTS` | JSON ou referência | Dados necessários para execução |
| `ASSUMPTIONS` | lista | Premissas que o receptor deve aceitar |
| `DEADLINE` | ISO 8601 | Data/hora limite para resposta |
| `PRIORITY` | enum | Nível de prioridade |

---

## Formato de Resposta

```
FROM: [agent_id]
TO: [agent_id original]
TASK: [task_id original]
STATUS: [accepted | rejected | partial | escalated]
OUTPUT: [resultado produzido]
NOTES: [observações, dificuldades, descobertas]
ESTIMATED_COMPLETION: [ISO 8601]
NEXT_ACTIONS: [ações subsequentes sugeridas]
```

---

## Formato de Acknowledgment (Recebimento)

```
FROM: [agent_id]
TO: [agent_id original]
TASK: [task_id]
ACK: [received | reading | started | completed]
TIMESTAMP: [ISO 8601]
```

### Regras de Acknowledgment

| Regra | Detalhe |
|---|---|
| **Tempo máximo para ACK** | 15 min para `critical`; 1h para `high`; 4h para `medium`; 24h para `low` |
| **Sem ACK** | Após timeout: re-notificar; após 2× timeout: escalar para supervisor |
| **Status de progresso** | A cada 25% de progresso para tarefas > 4h; ou conforme acordado |

---

## Categorias de Mensagem

### 1. Solicitação (Request)

```yaml
type: request
FROM: market-segment
TO: data-analytics
TASK: WK-001-F4-T1
CONTEXT: Oportunidade de usina solar 50MW no Ceará identificada
OBJECTIVE: Realizar pesquisa profunda sobre viabilidade e regulamentação
INPUTS:
  opportunity_id: "OPP-2026-042"
  sector: "energia_solar"
  region: "CE"
  estimated_value: "R$ 200M"
ASSUMPTIONS:
  - ANEEL como regulador principal
  - Licenciamento IBAMA (projeto > 40MW)
DEADLINE: "2026-09-11T18:00:00-03:00"
PRIORITY: high
```

### 2. Resposta (Response)

```yaml
type: response
FROM: data-analytics
TO: market-segment
TASK: WK-001-F4-T1
STATUS: accepted
OUTPUT:
  research_package_id: "RP-2026-042"
  sources_found: 8
  confidence_level: "high"
  estimated_value_validated: true
NOTES: Regulamentação ANEEL favourável; licenciamento estimado em 18 meses
ESTIMATED_COMPLETION: "2026-09-11T15:00:00-03:00"
NEXT_ACTIONS: ["Validar evidências (F5)", "Briefing estratégico (F6)"]
```

### 3. Escalação (Escalation)

```yaml
type: escalation
FROM: data-analytics
TO: cto
TASK: WK-001-F4-T1
CONTEXT: Pesquisa revelou risco regulatório significativo
OBJECTIVE: Decisão sobre prosseguimento da oportunidade
INPUTS:
  risk_level: "high"
  regulatory_risk: "Projeto em área de proteção ambiental; IBAMA pode negar LP"
  alternatives: ["Mudar localização", "Obter autorização especial"]
ASSUMPTIONS: []
DEADLINE: "2026-09-08T12:00:00-03:00"
PRIORITY: critical
```

### 4. Broadcast (Notificação Geral)

```yaml
type: broadcast
FROM: ceo
TO: broadcast
TASK: WK-001-F6-T1
CONTEXT: Decisão executiva sobre oportunidade OPP-2026-042
OBJECTIVE: Notificar todos sobre decisão tomada
INPUTS:
  decision: "APROVAR"
  koss_score: 82
  next_phase: "Business Development"
ASSUMPTIONS: []
DEADLINE: N/A
PRIORITY: medium
```

---

## Resolução de Conflitos

### Quando dois agentes produzem resultados conflitantes

| Passo | Ação | Responsável |
|---|---|---|
| 1 | Identificar natureza do conflito (dado, método, conclusão) | Agentes envolvidos |
| 2 | Solicitar terceira opinião de agente neutro | Agentes envolvidos |
| 3 | Se conflito persistir → escalar para CTO | CTO |
| 4 | Se conflito envolver decisão estratégica → escalar para CEO | CEO |
| 5 | Registrar conflito e resolução no knowledge base | CTO |

### Registro de Conflito

```yaml
type: conflict_resolution
conflict_id: "CON-2026-003"
agents: ["data-analytics", "mining"]
task: "WK-003-F5-T1"
nature: "conclusion_disagreement"
description: "Data-analytics avalia risco ambiental como moderado; mining avalia como alto"
resolution: "CTO decidiu: classificar como alto (princípio da precaução)"
resolved_by: "cto"
resolved_at: "2026-09-06T14:30:00-03:00"
lesson: "Quando há divergência sobre risco ambiental, sempre classificar pelo nível mais conservador"
```

---

## Regras de Comunicação

| Regra | Detalhe |
|---|---|
| **Idioma** | pt-BR para todas as comunicações |
| **Tom** | Profissional, direto, sem ambiguidades |
| **Dados sensíveis** | Nunca incluir chaves, tokens ou credenciais em mensagens |
| **Referências** | Sempre incluir task_id para rastreabilidade |
| **Tamanho máximo** | Mensagem ≤ 2000 chars; se maior, anexar como arquivo referenciado |
| **Histórico** | Todas as mensagens registradas no knowledge base com hash |
| **Frequência de sync** | Agentes em tarefa compartilhada: status a cada 4h; agentes em tarefa independente: 1×/dia |

---

## Prioridades e SLA

| Prioridade | ACK máximo | Resposta máxima | Escalation automático |
|---|---|---|---|
| `critical` | 15 min | 4h | 30 min sem ACK |
| `high` | 1h | 24h | 2h sem ACK |
| `medium` | 4h | 72h | 8h sem ACK |
| `low` | 24h | 7 dias | 48h sem ACK |

---

## Padrão de Logging

Toda comunicação é logada automaticamente:

```json
{
  "log_id": "LOG-2026-0042",
  "timestamp": "2026-09-05T10:30:00-03:00",
  "from": "market-segment",
  "to": "data-analytics",
  "task": "WK-001-F4-T1",
  "type": "request",
  "priority": "high",
  "hash": "sha256:abc123...",
  "size_bytes": 1247
}
```
