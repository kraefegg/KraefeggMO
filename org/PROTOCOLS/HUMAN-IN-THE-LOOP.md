# Protocolo: Interação Humano-Máquina (Human-in-the-Loop)

> **ID:** PT-003
> **Versão:** 1.0
> **Autor:** CTO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Definir quando, como e por que envolver humanos nas decisões automatizadas.

---

## Princípios Fundamentais

1. **Autonomia por padrão** — Agentes executam tarefas rotineiras sem intervenção humana
2. **Intervenção por necessidade** — Humanos são envolvidos apenas quando a decisão exige julgamento
3. **Transparência total** — Toda decisão automatizada pode ser auditada e contestada
4. **Rastreabilidade** — Todo envolvimento humano é registrado com timestamp e justificativa

---

## Quando Envolver Humanos

### Critérios Gerais

| Critério | Quando se aplica | Exemplo |
|---|---|---|
| **Impacto financeiro** | Transação > R$ 10K ou margem < 20% | Pricing de proposta |
| **Risco reputacional** | Qualquer decisão pública ou para cliente | Relatório externo |
| **Responsabilidade legal** | Assinatura profissional, contrato, compliance | Laudo técnico, contrato |
| **Decisão estratégica** | Afeta direção do negócio > 6 meses | Entrada em novo mercado |
| **Dados insuficientes** | Confiança do modelo < 70% | Análise com poucos dados |
| **Conflito ético** | Possível viés ou questão ética | Recomendação com conflito de interesse |
| **Exigência regulatória** | Lei ou norma exige aprovação humana | Licenciamento ambiental |

---

## Níveis de Intervention

### Nível 0 — Sem intervenção (Autônomo)

| Campo | Detalhe |
|---|---|
| **Quando** | Tarefas de baixo risco, repetitivas, com dados suficientes |
| **Exemplos** | Busca de dados, formatação, classificação automática, cálculos padrão, organização |
| **Agente executa** | 100% autonomamente |
| **Humano faz** | Revisão periódica (mensal ou por amostragem) |
| **Registro** | Log de execução com métricas de qualidade |

---

### Nível 1 — Notificação (Heads-up)

| Campo | Detalhe |
|---|---|
| **Quando** | Agente completa tarefa com resultado que pode precisar de atenção |
| **Exemplos** | Relatório gerado, anomalia detectada, lead qualificado, pesquisa concluída |
| **Agente faz** | Executa tarefa + notifica humano com resumo |
| **Humano faz** | Revisa e confirma; pode rejeitar ou solicitar ajuste |
| **Formato da notificação** | Mensagem PT-001 padronizada com `STATUS: completed` + link para resultado |
| **Timeout** | Humano tem 24h para rejeitar; caso contrário, resultado é confirmado automaticamente |
| **Registro** | Log de notificação + resposta (ou confirmação implícita) |

---

### Nível 2 — Aprovação antes de executar (Approval Gate)

| Campo | Detalhe |
|---|---|
| **Quando** | Decisão significativa que afeta projeto, cliente ou business |
| **Exemplos** | Escopo de proposta, pricing, alocação de recursos, entrega ao cliente, alteração de cronograma |
| **Agente faz** | Prepara análise com opções + recomendação |
| **Humano faz** | Revisa opções, seleciona opção ou modifica, aprova para execução |
| **Formato da apresentação** | Opções numeradas com prós/contras; recomendação destacada |
| **Timeout** | Conforme prioridade (PT-002); após timeout → lembrete → escalação |
| **Registro** | DecisionRecord completo: opções, seleção, justificativa |

#### Formato de Apresentação para Aprovação

```
═══════════════════════════════════════
DECISÃO NECESSÁRIA: [título]
Task: [task_id] | Prioridade: [priority]
═══════════════════════════════════════

CONTEXTO:
[Breve descrição da situação]

OPÇÕES:
───────────────────────────────────────
1️⃣  [Opção A]
    ✅ Prós: [...]
    ⚠️  Contras: [...]
    💰 Impacto financeiro: [estimativa]
    ⏱️  Impacto no prazo: [estimativa]

2️⃣  [Opção B]
    ✅ Prós: [...]
    ⚠️  Contras: [...]
    💰 Impacto financeiro: [estimativa]
    ⏱️  Impacto no prazo: [estimativa]

3️⃣  [Opção C] — RECOMENDADA
    ✅ Prós: [...]
    ⚠️  Contras: [...]
    💰 Impacto financeiro: [estimativa]
    ⏱️  Impacto no prazo: [estimativa]

CONFIDÊNCIA DO AGENTE: [XX%]
═══════════════════════════════════════
Responda: APROVAR [número] ou REJEITAR com justificativa
Deadline: [data/hora]
═══════════════════════════════════════
```

---

### Nível 3 — Participação ativa (Active Collaboration)

| Campo | Detalhe |
|---|---|
| **Quando** | Tarefa exige julgamento profissional contínuo |
| **Exemplos** | Elaboração de EIA/RIMA, negociação complexa, resposta a emergência Nível 3, auditoria |
| **Agente faz** | Suporte técnico, dados, análises, sugestões |
| **Humano faz** | Julgamento profissional, decisões técnicas, interação com stakeholders externos |
| **Interação** | Contínua durante a execução; não apenas no início/fim |
| **Registro** | Log de interações com timestamps |

---

### Nível 4 — Comando humano (Human Command)

| Campo | Detalhe |
|---|---|
| **Quando** | Decisão estratégica, legal ou de crise |
| **Exemplos** | Crise ambiental Nível 4, decisão de investimento > R$ 500K, litígios, mudanças estratégicas |
| **Agente faz** | Fornece dados, simula cenários, prepara documentos |
| **Humano decide** | CEO ou conselho decide diretamente |
| **Agente executa** | Somente após decisão formal registrada |
| **Registro** | DecisionRecord completo com hash SHA-256 |

---

## Como Apresentar Opções ao Humano

### Regras de Apresentação

| Regra | Detalhe |
|---|---|
| **Clareza** | Cada opção com título claro, prós, contras, impacto |
| **Comparabilidade** | Opções no mesmo formato para facilitar comparação |
| **Recomendação** | Sempre indicar opção recomendada com justificativa |
| **Dados** | Incluir números, fontes, confiança |
| **Tempo** | Indicar prazo para decisão |
| **Risco** | Destacar riscos de cada opção em vermelho/amarelo |
| **Máximo opções** | 3-4 opções; mais que isso → consolidar |

### Template de Resumo para CEO

```
RESUMO EXECUTIVO — DECISÃO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
O que: [1 frase]
Por que: [1 frase]
Opções: [resumo 1 linha cada]
Recomendação: [opção + razão principal]
Risco: [risco principal se não aprovar]
Deadline: [quando precisa de decisão]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Como Capturar Decisões Humanas

### Registro de Decisão

```yaml
decision_record:
  id: "DEC-2026-042"
  timestamp: "2026-09-07T14:30:00-03:00"
  task_id: "WK-001-F7-T1"
  workflow: "OPPORTUNITY-TO-PROPOSAL"
  phase: "F7 — Decisão Executiva"
  
  context:
    opportunity: "Usina solar 50MW no Ceará"
    koss_score: 82
    research_confidence: "high"
  
  options_presented:
    - id: "A"
      description: "Aprovar e avançar para BD"
      pros: ["KOS alto", "Mercado favorável"]
      cons: ["Prazo licenciamento longo"]
    - id: "B"
      description: "Aprovar condicionalmente"
      pros: ["Reduz risco inicial"]
      cons: ["Atrasa início"]
    - id: "C"
      description: "Rejeitar"
      pros: ["Evita investimento"]
      cons: ["Perde oportunidade"]
  
  decision:
    selected_option: "A"
    rationale: "KOS 82 validado; mercado solar CE em expansão; riscos gerenciáveis"
    confidence: 0.85
    conditions: []
  
  approver:
    role: "CEO"
    signature: "ceo_hash_abc123"
  
  audit:
    hash: "sha256:dec456..."
    version: "1.0"
```

---

## Audit Trail — Requisitos

| Requisito | Detalhe |
|---|---|
| **Imutabilidade** | Registros de decisão não podem ser alterados (append-only) |
| **Hash** | Cada registro com SHA-256 do conteúdo |
| **Chain** | Hash anterior referenciado para criar cadeia |
| **Retenção** | Mínimo 5 anos para decisões financeiras; 10 anos para regulatórias |
| **Acesso** | CEO e CTO podem ler todos; agentes somente seus registros |
| **Backup** | Diário em local separado |

---

## Fluxo de Interação — Exemplo

```
┌─────────────┐    ┌──────────────┐    ┌──────────────┐
│ Agente      │───►│Prepara Opções│───►│Apresenta ao  │
│ identifica  │    │com análise   │    │Humano        │
│ decisão     │    │              │    │              │
└─────────────┘    └──────────────┘    └──────┬───────┘
                                              │
                                     ┌────────▼────────┐
                                     │Humano revisa    │
                                     │e decide         │
                                     └────────┬────────┘
                                              │
                               ┌──────────────┼──────────────┐
                               │              │              │
                          ┌────▼───┐   ┌─────▼────┐  ┌──────▼─────┐
                          │Aprovar │   │Rejeitar  │  │Solicitar   │
                          │        │   │          │  │mais info   │
                          └────┬───┘   └─────┬────┘  └──────┬─────┘
                               │              │              │
                          ┌────▼──────────────▼──────────────▼────┐
                          │Registrar decisão com hash             │
                          └───────────────┬───────────────────────┘
                                          │
                                  ┌───────▼───────┐
                                  │Agente executa  │
                                  │ou arquiva      │
                                  └───────────────┘
```
