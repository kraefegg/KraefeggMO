# KRAEFEGG M.O. Tech-AI & Engineering Solutions

Tech-AI & Engineering Solutions firm — mining, energy & environmental engineering — structured as a multi-agent corporate AI workforce.

## Arquitetura
- **3 executivos**: `ceo` (estratégia), `cto` (tecnologia), `market-segment` (segmento de mercado).
- **1 agente orquestrador** que coordena as entregas.
- **34 subagentes** especialistas por departamento (engenharia, dados, IA, ambiental, mineração, energia, comercial, financeiro, jurídico, RH, cibersegurança, automação, nuvem, IoT/Edge, naval, acadêmico, consultoria, etc.).
- Painel corporativo de gestão em **HQ 3D** (`hq/corporate-hq.html`) com visualização gráfica da empresa e funcionários.
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
