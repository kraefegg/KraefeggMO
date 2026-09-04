# Kraefegg M.O. — CrewAI Agents

Arquitetura de agentes CrewAI para processamento de demandas da Kraefegg M.O.

## Arquitetura

```
Demanda recebida
       │
       ▼
   ┌───────┐
   │  CEO  │ ◄── Decide: APROVAR / REJEITAR / MAIS_INFO
   └───┬───┘
       │ (aprovada)
       ▼
  ┌──────────┐
  │ Pesquisador │ ◄── Analisa viabilidade técnica
  └─────┬────┘
        │
   ┌────┴────┐
   ▼         ▼
┌────────┐ ┌────────┐
│ Eng.   │ │ Eng.   │ ◄── Soluções técnicas (paralelo)
│ Ambient│ │ Softw. │
└───┬────┘ └───┬────┘
    │          │
    └────┬─────┘
         ▼
    ┌─────────┐
    │Comercial│ ◄── Proposta comercial
    └────┬────┘
    ┌────┴────┐
    ▼         ▼
┌────────┐ ┌────────┐
│Financei│ │Jurídic.│ ◄── Análise financeira + revisão jurídica
└───┬────┘ └───┬────┘
    └────┬─────┘
         ▼
    ┌─────────┐
    │ Redator │ ◄── Documento final consolidado
    └─────────┘
```

## Agentes (8 consolidados de 38 originais)

| Agente | Papel | LLM | Delega? |
|--------|-------|-----|---------|
| CEO | Decisões estratégicas | best-reasoning | Não |
| Pesquisador | Análise de viabilidade | best-reasoning | Não |
| Eng. Ambiental | Soluções ambientais | best-reasoning | Não |
| Eng. Software | Software/IoT | best-coding | Não |
| Comercial | Propostas e contratos | best-chat | Não |
| Financeiro | Orçamento e ROI | best-reasoning | Não |
| Jurídico | Conformidade legal | best-reasoning | Não |
| Redator | Documentos finais | best-chat | Não |

## Decisões de Design (80/20 Rule)

- **8 agentes** (não 38) — cada um cobre um domínio completo
- **Agent.kickoff()** em Flow — cada etapa é independente e rastreável
- **`allow_delegation: false`** — evita loops infinitos
- **Sem crew multi-agent** — usa Flow com `@listen` para sequenciamento
- **`function_calling_llm`** — usar modelo barato para tool calling (futuro)
- **Guardrails** — validação de output em cada etapa

## Setup

```bash
# Python 3.12 ou 3.13 (3.14 incompatível)
python -m venv .venv
.venv\Scripts\activate  # Windows
pip install -r requirements.txt

# Configurar
cp .env.example .env
# Editar .env com suas chaves

# Rodar
python -m kraefegg_mo.main
```

## Estrutura

```
crewai/
├── config/
│   ├── agents.yaml      # Definições de agentes
│   └── tasks.yaml       # Definições de tasks
├── src/
│   └── kraefegg_mo/
│       ├── __init__.py
│       ├── main.py       # Entry point
│       ├── flow.py       # Flow principal
│       ├── crew.py       # Crew (alternativa ao Flow)
│       └── models.py     # Modelos Pydantic
├── output/               # Documentos gerados
├── tests/
├── requirements.txt
├── pyproject.toml
└── .env.example
```

## Fluxo de Execução

1. **Demanda recebida** → `receber_demanda()`
2. **CEO analisa** → `ceo_analisa()` → APROVADA / REJEITADA / MAIS_INFO
3. **Pesquisa** → `pesquisar_demanda()` (se aprovada)
4. **Soluções** → `desenvolver_solucoes()` (ambiental + software)
5. **Proposta** → `elaborar_proposta()` (comercial)
6. **Análises** → `analise_financeira()` + `revisao_juridica()` (paralelo)
7. **Documento** → `redigir_documento_final()` → output/{titulo}.md

## LLM Provider

Usa OmniRoute (gateway local) por padrão. Configure no `.env`:

```
OMNIROUTE_API_KEY=sua_chave
OMNIROUTE_BASE_URL=http://localhost:20128/v1
```

Ou troque o `llm` em `agents.yaml` para `openrouter/anthropic/claude-sonnet-4-20250514` etc.
