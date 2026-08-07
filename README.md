# Kraefegg M.O.

Empresa de mineração, energia e engenharia ambiental estruturada como sistema multiagente.

## Arquitetura
- **3 executivos**: `ceo` (estratégia), `cto` (tecnologia), `market-segment` (segmento de mercado).
- **1 agente orquestrador** que coordena as entregas.
- **22 subagentes** especialistas por departamento (engenharia, dados, IA, ambiental, mineração, energia, comercial, financeiro, jurídico, RH, etc.).
- Todos os agentes são roteados por modelos de IA através do **OmniRoute** (gateway local).

## Infraestrutura prevista
| Componente | Uso |
|---|---|
| OmniRoute | Gateway de modelos (local, port 20128) |
| GitHub | Versionamento do código dos agentes |
| Oracle Free Tier | Banco de dados da empresa |
| Databricks | Processamento de dados robusto |

## Uso
- Abra o projeto no opencode e chame o agente `orchestrator`.
- A config de agentes vive em `.opencode/agent/*.md`.
- Requer OmniRoute rodando em `http://localhost:20128` e `OMNIROUTE_API_KEY` definida.
