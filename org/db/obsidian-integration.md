# KRAEFEGG M.O. — Obsidian Memory Network

## Configuração do Vault

O vault do Obsidian para a KRAEFEGG M.O. deve ser configurado em:

```
C:\Users\MEU PC\OneDrive\Documents\Obsidian Vault\KRAEFEGG MO\
```

## Estrutura de Pastas do Vault

```
KRAEFEGG MO/
├── 00 - INBOX/                    # Entrada não processada
├── 01 - INTELLIGENCE/             # Sinais de mercado e oportunidades
│   ├── Market Signals/
│   ├── Opportunities/
│   └── Strategic Reports/
├── 02 - RESEARCH/                 # Pesquisas e evidências
│   ├── Market/
│   ├── Regulatory/
│   ├── Scientific/
│   └── Technical/
├── 03 - ENGINEERING/              # Relatórios técnicos
│   ├── Environmental/
│   ├── Forestry/
│   ├── Energy/
│   ├── Mining/
│   ├── Maritime/
│   ├── Safety/
│   └── GIS/
├── 04 - BUSINESS/                 # Propostas e negócios
│   ├── Proposals/
│   ├── Contracts/
│   └── Client Research/
├── 05 - PROJECTS/                 # Documentação de projetos
│   ├── Active/
│   ├── Completed/
│   └── Templates/
├── 06 - KNOWLEDGE/                # Base de conhecimento
│   ├── Legislation/
│   ├── Standards/
│   ├── Lessons Learned/
│   └── Best Practices/
├── 07 - AGENTS/                   # Perfis e memória dos agentes
│   ├── CEO/
│   ├── CTO/
│   ├── Engineering/
│   └── ...
├── 08 - DAILY/                    # Relatórios diários
├── 09 - TEMPLATES/                # Templates reutilizáveis
└── 10 - ARCHIVE/                  # Arquivo morto
```

## Propriedades Obligatórias (Frontmatter YAML)

### Para Market Signals:
```yaml
---
type: market-signal
sector: [energia|mineração|portos|ambiental|tecnologia]
region: [UF ou país]
relevance: [0-10]
sources: [url1, url2]
detected_by: market-intelligence
date: YYYY-MM-DD
status: [new|processed|archived]
---
```

### Para Opportunities:
```yaml
---
type: opportunity
kos_score: [0-100]
category: [ignore|monitor|research|qualify|prospect|partner|propose|priority]
sector: string
region: string
detected_by: opportunity-intelligence
date: YYYY-MM-DD
status: [detected|qualified|strategic_review|approved|proposed|won|lost]
---
```

### Para Technical Reports:
```yaml
---
type: technical-report
domain: [environmental|forestry|energy|mining|maritime|safety|gis]
author: [agent-id]
reviewed_by: [cto]
version: 1.0.0
date: YYYY-MM-DD
status: [draft|reviewed|approved|published]
client: string
project_id: string
---
```

### Para Knowledge Base:
```yaml
---
type: knowledge
category: [legislation|regulation|standard|scientific|technical|market|lesson]
source: string
source_url: string
verification: [verified|unverified|disputed|outdated]
last_reviewed: YYYY-MM-DD
tags: [tag1, tag2]
---
```

## Conexões Recomendadas (Wikilinks)

Usar wikilinks para conectar:
- `[[Sinal de Mercado]]` → `[[Oportunidade]]` → `[[Estratégia]]` → `[[Proposta]]`
- `[[Agente:CEO]]` → `[[Decisão:XXXX]]`
- `[[Pesquisa:YYYY]]` → `[[Evidência:ZZZZ]]`
- `[[Projeto:AAAA]]` → `[[Entrega:BBBB]]` → `[[Lição:CCCC]]`

## Templates do Obsidian

### Template de Oportunidade:
```markdown
# Oportunidade: {{title}}

## Score KOS: {{kos_score}}/100

| Critério | Score |
|----------|-------|
| Technical Fit | {{technical_fit}} |
| Market Demand | {{market_demand}} |
| Revenue Potential | {{revenue_potential}} |
| Strategic Fit | {{strategic_fit}} |
| Urgency | {{urgency}} |
| Accessibility | {{accessibility}} |
| Competition | {{competition}} |
| Recurrence | {{recurrence}} |
| Risk (inverse) | {{risk_inverse}} |

## Descrição
{{description}}

## Fontes
{{sources}}

## Próximos Passos
{{next_steps}}

## Status
{{status}}
```

### Template de Relatório Técnico:
```markdown
# {{title}}

**Autor:** {{author}}
**Revisor:** {{reviewer}}
**Versão:** {{version}}
**Data:** {{date}}
**Status:** {{status}}

## Resumo Executivo
{{executive_summary}}

## Contexto
{{context}}

## Metodologia
{{methodology}}

## Resultados
{{results}}

## Conclusões
{{conclusions}}

## Recomendações
{{recommendations}}

## Fontes
{{sources}}

## Anexos
{{attachments}}
```

## Plugins Recomendados

- **Dataview** — consultas dinâmicas de dados
- **Templater** — templates avançados
- **Calendar** — visualização temporal
- **Graph Analysis** — análise de conexões
- **Excalidraw** — diagramas
- **Kanban** — gestão de tarefas
- **Periodic Notes** — notas diárias/semanais
- **Tag Wrangler** — gestão de tags
- **Obsidian Git** — versionamento

## Integração com OpenCode

O Obsidian pode ser alimentado por:
1. **Scripts de export** — geram .md a partir de outputs dos agentes
2. **Webhooks** — notificações de novos sinais/oportunidades
3. **Sync manual** — exports periódicos de databases
4. **API local** — plugins que conectam ao SQLite local
