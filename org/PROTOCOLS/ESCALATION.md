# Protocolo: Matriz de Escalação

> **ID:** PT-002
> **Versão:** 1.0
> **Autor:** CEO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Definir níveis de decisão, responsabilidades e procedimentos de escalação.

---

## Níveis de Escalação

### Nível 0 — Autônomo

| Campo | Detalhe |
|---|---|
| **Quando** | Tarefas rotineiras, repetitivas, sem impacto financeiro ou estratégico |
| **Responsável** | Qualquer agente |
| **Exemplos** | Consulta a base de conhecimento, formatação de dados, busca de referências, atualização de status, organização de arquivos |
| **Aprovação necessária** | Nenhuma |
| **Tempo de resposta** | Imediato |
| **Override** | N/A |

---

### Nível 1 — Assisted by AI

| Campo | Detalhe |
|---|---|
| **Quando** | Análise padrão, geração de conteúdo, pesquisa, síntese de dados, recomendações |
| **Responsável** | Agente especializado (execução) com supervisão do departamento |
| **Exemplos** | Pesquisa de mercado, análise de dados, redação de relatórios, geração de propostas, qualificação de leads |
| **Aprovação necessária** | Revisão automática por agente supervisor; aprovação humana opcional |
| **Tempo de resposta** | Conforme SLA do workflow |
| **Override** | Supervisor pode solicitar revisão; CEO pode intervir |
| **Audit** | Log automático de execução |

#### Decisões que cabem ao Nível 1

- Análise de dados históricos
- Geração de relatórios periódicos
- Classificação de leads
- Pesquisa de fontes públicas
- Elaboração de rascunhos
- Atualização de knowledge base
- Busca e indexação de documentos
- Cálculos financeiros padrão
- Tradução de documentos

---

### Nível 2 — Revisão Humana

| Campo | Detalhe |
|---|---|
| **Quando** | Decisões significativas que afetam projeto, cliente ou reputação |
| **Responsável** | Departamento (CTO para técnico, commercial para comercial) |
| **Exemplos** | Definição de escopo, pricing, aprovação de entrega, qualificação avançada, estratégia de proposta |
| **Aprovação necessária** | Humana obrigatória antes de executar |
| **Tempo de resposta** | 24-72h |
| **Override** | CTO pode override de gestores; CEO pode override de CTO |
| **Audit** | Registro completo: quem aprovou, quando, justificativa, opções apresentadas |

#### Decisões que cabem ao Nível 2

- Definição de escopo de projeto
- Precificação e margens
- Aprovação de entregas ao cliente
- Alocação de recursos entre projetos
- Escolha de metodologia
- Aprovação de relatórios externos
- Estratégia de negociação
- Alteração de cronograma (> 10%)

---

### Nível 3 — Validação Profissional

| Campo | Detalhe |
|---|---|
| **Quando** | Decisões técnicas, regulatórias ou de compliance que requerem habilitação profissional |
| **Responsável** | Profissional habilitado (Engenheiro, Advogado, Biólogo, etc.) |
| **Exemplos** | Assinatura de EIA/RIMA, laudos técnicos, pareceres regulatórios, aprovação de projetos de engenharia, validação de modelos |
| **Aprovação necessária** | Assinatura profissional com registro (CAF, CREA, OAB, etc.) |
| **Tempo de resposta** | 3-7 dias |
| **Override** | N/A — profissional é pessoalmente responsável |
| **Audit** | Registro com: habilitação profissional, número de registro, data, parecer |

#### Decisões que cabem ao Nível 3

- Assinatura de EIA/RIMA
- Laudo de avaliação de risco ambiental
- Parecer técnico de engenharia
- Certificação de conformidade regulatória
- Validação de modelos preditivos
- Parecer sobre licenciamento
- Laudo de perícia técnica
- Aprovação de plano de emergência

---

### Nível 4 — Aprovação Executiva

| Campo | Detalhe |
|---|---|
| **Quando** | Decisões estratégicas, financeiras, legais ou com impacto reputacional significativo |
| **Responsável** | CEO (decisão final) |
| **Exemplos** | Investimentos > R$ 500K, parcerias estratégicas, novos mercados, ações judiciais, mudanças de estratégia |
| **Aprovação necessária** | CEO aprova pessoalmente |
| **Tempo de resposta** | 24-48h; imediato para emergências |
| **Override** | CEO é autoridade final; conselho (se existente) para decisões > R$ 5M |
| **Audit** | Registro completo: decisão, justificativa, opções avaliadas, confiança, data, hash SHA-256 |

#### Decisões que cabem ao Nível 4

- Investimentos > R$ 500K
- Contratos > R$ 1M
- Parcerias e joint ventures
- Entrada em novos mercados/setores
- Decisões de litigation
- Mudanças de estratégia corporativa
- Aprovação de propostas > R$ 500K
- Aquisições ou fusões
- Demissões de cargos de liderança
- Aprovação de orçamento anual
- Resposta a crises (Nível 4)

---

## Matriz de Escalação por Workflow

| Workflow | Decisão | Nível mínimo | Escala para |
|---|---|---|---|
| **WK-001** (Oportunidade) | Score KOS | Nível 1 | CEO se KOS ≥ 81 |
| | Decisão de prosseguir | Nível 4 | CEO |
| | Pricing da proposta | Nível 2 | CTO |
| **WK-002** (Entrega) | Escopo do projeto | Nível 2 | CTO |
| | Aprovação da entrega | Nível 3 | CTO |
| | Mudança de cronograma > 20% | Nível 4 | CEO |
| **WK-003** (Pesquisa) | Metodologia | Nível 1 | CTO |
| | Conclusão pública | Nível 3 | CTO + CEO |
| **WK-004** (Vendas) | Desconto > 15% | Nível 2 | CTO |
| | Desconto > 25% | Nível 4 | CEO |
| | Contrato > R$ 1M | Nível 4 | CEO |
| **WK-005** (Licenciamento) | Decisão de prosseguir com LP | Nível 2 | CTO |
| | EIA/RIMA | Nível 3 | Profissional habilitado |
| | Resposta a exigência | Nível 3 | CTO + jurídico |
| **WK-006** (Emergência) | Classificação Nível 1-2 | Nível 2 | CTO |
| | Classificação Nível 3-4 | Nível 4 | CEO |

---

## Procedimento de Escalação

### Passo 1 — Tentar resolver no nível atual
```
Agente identifica que decisão exige nível superior
→ Verificar se tem autorização para aquele nível
→ Se NÃO tem → escalar conforme matriz
```

### Passo 2 — Formatar mensagem de escalação
```yaml
type: escalation
FROM: [agent_id]
TO: [approver_id]
TASK: [task_id]
LEVEL_REQUIRED: [2|3|4]
DECISION_DESCRIPTION: "Descrição clara da decisão necessária"
OPTIONS:
  - option: "Opção A"
    pros: ["..."]
    cons: ["..."]
    impact: "financeiro/técnico/estratégico"
  - option: "Opção B"
    pros: ["..."]
    cons: ["..."]
    impact: "..."
RECOMMENDATION: "Recomendação do agente com justificativa"
DEADLINE: "2026-09-10T18:00:00-03:00"
PRIORITY: high
```

### Passo 3 — Aguardar decisão
- Monitorar status da escalação
- Enviar lembrete conforme SLA
- Se timeout → escalar para nível acima

### Passo 4 — Registrar decisão
```yaml
type: decision_record
decision_id: "DEC-2026-015"
task: "WK-001-F6-T1"
level: 4
approver: "ceo"
decision: "APROVAR"
rationale: "Oportunidade com KOS 82, validada por 8 fontes, margem estimada 35%"
confidence: 0.85
timestamp: "2026-09-07T10:00:00-03:00"
hash: "sha256:def456..."
```

---

## Override e Contestações

| Cenário | Procedimento |
|---|---|
| **Agente discorda de escalação** | Registrar objeção; prosseguir com escalação; CEO decide se objeção é válida |
| **Aprovador rejeita recomendação** | Registrar justificativa; agente pode solicitar revisão com novas evidências |
| **Conflito entre aprovadores** | CTO + CEO resolvem; se conflito CEO/conselho → conselho decide |
| **Urgência sem aprovador disponível** | Agente pode tomar ação de menor risco; registrar como `emergency_decision`; aprovação retroativa em 24h |

---

## Limites Financeiros

| Limite | Aprovação necessária |
|---|---|
| Até R$ 10K | Nível 1 (autônomo) |
| R$ 10K — R$ 100K | Nível 2 (CTO) |
| R$ 100K — R$ 500K | Nível 3 (CTO + CEO) |
| R$ 500K — R$ 5M | Nível 4 (CEO) |
| Acima de R$ 5M | Nível 4 + Conselho (se existir) |
