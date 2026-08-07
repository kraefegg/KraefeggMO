# Documentação do Projeto — Kraefegg M.O.

Estrutura centralizada da documentação técnica e corporativa do projeto.
Todas as pastas abaixo seguem o padrão de nomenclatura do repo (`kebab-case`).

## Estrutura

| Pasta | Conteúdo |
|---|---|
| [`diagramas/`](diagramas/) | Diagramas de arquitetura, fluxos e processos (Mermaid, PNG, JSON) |
| [`schemas/`](schemas/) | Schemas de dados: SQL, JSON Schema, TOML de configuração |
| [`linguagens/`](linguagens/) | Stack tecnológica e linguagens utilizadas no projeto |
| [`codigos/`](codigos/) | Exemplos e fragmentos de código de referência |

## Fontes de verdade do projeto

- `AGENTS.md` — estrutura corporativa multiagente e atribuições
- `README.md` — visão geral do repositório
- `security/audit_security.py` — auditor de segurança e compliance
- `security/cofre.py` — cofre ENIGMA (credenciais cifradas, hardware-bound)
- `rd/embedded/edge-sensor/` — firmware do nó de borda (ESP32/MicroPython) + simulação Wokwi

## Como contribuir

- Texto em português (pt-BR).
- Diagramas em Mermaid sempre que possível (rendem no GitHub).
- Schemas versionáveis; segredos/credenciais nunca entram aqui (ver `security/cofre.py`).
- Rode `python security/audit_security.py` antes de commit (hook roda automático).
