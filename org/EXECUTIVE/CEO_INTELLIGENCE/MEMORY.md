# CEO Intelligence Agent — Estrutura de Memória

## Tipos de Memória

### 1. Log de Decisões Estratégicas
**Localização:** `org/EXECUTIVE/CEO_INTELLIGENCE/memory/decisions/`
**Formato:** Arquivo por mês (`YYYY-MM.md`)

Cada registro contém:
```yaml
id: DEC-YYYY-MM-NNN
data: YYYY-MM-DD HH:MM
contexto: "[Descrição do contexto que levou à decisão]"
opcoes_avaliadas:
  - opcao: "Opção A"
    prons: ["..."]
    contras: ["..."]
    risco: "baixo/médio/alto"
  - opcao: "Opção B"
    ...
decisao: "[Decisão tomada]"
justificativa: "[Por que esta opção foi escolhida]"
responsavel: "CEO Intelligence Agent"
aprovado_por: "[CTO/Humano se aplicável]"
resultado: "[Pendente/Sucesso/Fracasso/Em andamento]"
data_revisao: "YYYY-MM-DD"
```

### 2. Histórico de Oportunidades
**Localização:** `org/EXECUTIVE/CEO_INTELLIGENCE/memory/opportunities/`

Cada oportunidade:
```yaml
id: OPP-YYYY-MM-NNN
data_deteccao: YYYY-MM-DD
fonte: "[Web Research / Agente / Humano]"
titulo: "[Nome da oportunidade]"
scoring:
  impacto: 1-10
  probabilidade: 1-10
  custo: 1-10
  total: "calculado"
classificacao: "quick_win / strategic / long_term / deprioritize"
status: "identificada / em_analise / aprovada / em_execucao / concluida / descartada"
decisao_associada: "DEC-..."
resultado_final: "[Quando concluída]"
```

### 3. Registro de Aprovações
**Localização:** `org/EXECUTIVE/CEO_INTELLIGENCE/memory/approvals/`

Registro de todas as aprovações emitidas:
```yaml
id: APP-YYYY-NNN
data: YYYY-MM-DD
tipo: "acao / publicacao / gasto / contratacao"
descricao: "[O que foi aprovado]"
solicitante: "[Divisão/Agente solicitante]"
nivel: "LEVEL 1-4"
condicoes: "[Condições da aprovação, se houver]"
validade: "YYYY-MM-DD"
```

### 4. Dashboard de KPIs
**Localização:** `org/EXECUTIVE/CEO_INTELLIGENCE/memory/kpi_snapshot.md`

Métricas atuais:
- Oportunidades no pipeline
- Taxa de conversão
- Decisões pendentes
- Ações em execução
- Incidentes abertos

### 5. Preferências do Proprietário
**Localização:** `org/EXECUTIVE/CEO_INTELLIGENCE/memory/owner_preferences.md`

Registro de preferências e padrões do proprietário humano observados ao longo do tempo:
- Preferências de formato de relatório
- Tolerância a risco
- Prioridades estratégicas recorrentes
- Estilo de comunicação preferido

## Regras de Memória
1. **Persistência:** Todas as decisões e aprovações são persistentes
2. **Imutabilidade:** Registros confirmados não são editados (apenas anexados)
3. **Retenção:** Memórias mantidas por mínimo de 12 meses
4. **Privacidade:** Dados sensíveis são mascarados em memória compartilhada
5. **Indexação:** Cada entrada tem ID único para referência cruzada
