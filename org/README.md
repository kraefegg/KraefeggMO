# KRAEFEGG M.O. — Documentação Organizacional

**Versão:** 1.0.0  
**Última atualização:** 2026-09-04  
**Empresa:** Kraefegg M.O. — Mineração, Energia e Engenharia Ambiental  
**Modelo:** Corporação Multiagente de IA

---

## Visão Geral

A **Kraefegg M.O.** é uma empresa de mineração, energia e engenharia ambiental estruturada como sistema multiagente de IA. Cada agente é um profissional virtual especializado, operando sob uma cadeia de comando clara, com processos documentados, controle de qualidade rigoroso e governança corporativa.

**Princípio Fundamental:** Estamos construindo uma **firma profissional**, não chatbots. Cada entrega tem qualidade de escritório de engenharia de elite.

---

## Início Rápido

1. **Novo agente?** Consulte `AGENT_CATALOG.md` para o catálogo completo
2. **Novo projeto?** Consulte `WORKFLOWS/` para o workflow adequado
3. **Skills disponíveis?** Consulte `SKILL_CATALOG.md` para habilidades por domínio
4. **Matriz de atribuições?** Consulte `AGENT_SKILL_MATRIX.md`
5. **Regras de governança?** Consulte `GOVERNANCE.md`
6. **Controle de qualidade?** Consulte `QUALITY_CONTROL.md`

---

## Estrutura de Diretórios

```
org/
├── ARCHITECTURE.md           # Documento de arquitetura completa
├── ORGANIZATION.md           # Organograma e estrutura
├── AGENT_CATALOG.md          # Catálogo completo de agentes
├── SKILL_CATALOG.md          # Catálogo completo de skills
├── AGENT_SKILL_MATRIX.md     # Matriz agente × skill
├── WORKFLOW_CATALOG.md       # Catálogo de workflows
├── GOVERNANCE.md             # Governança corporativa
├── QUALITY_CONTROL.md        # Framework de controle de qualidade
├── README.md                 # Este arquivo
│
├── EXECUTIVE/                # Divisão Executiva
│   ├── CEO_INTELLIGENCE/     # Inteligência do CEO
│   └── CTO_TECHNICAL_AUTHORITY/ # Autoridade Técnica do CTO
│
├── INTELLIGENCE/             # Inteligência Corporativa
│   ├── STRATEGIC_INTELLIGENCE/
│   ├── MARKET_INTELLIGENCE/
│   ├── COMPETITIVE_INTELLIGENCE/
│   └── OPPORTUNITY_INTELLIGENCE/
│
├── RESEARCH/                 # Pesquisa
│   ├── SCIENTIFIC_RESEARCH/
│   ├── TECHNICAL_RESEARCH/
│   ├── MARKET_RESEARCH/
│   ├── REGULATORY_RESEARCH/
│   ├── TECHNOLOGY_RESEARCH/
│   └── COMPETITIVE_RESEARCH/
│
├── ENGINEERING/              # Engenharia
│   ├── MINING/
│   ├── ENERGY/
│   ├── ENVIRONMENTAL/
│   ├── CIVIL/
│   ├── MARITIME_PORT/
│   ├── INFRASTRUCTURE/
│   ├── SAFETY/
│   └── FORESTRY/
│
├── TECHNOLOGY/               # Tecnologia
│   ├── SOFTWARE_ENGINEERING/
│   ├── AI_ENGINEERING/
│   ├── DATA_ENGINEERING/
│   ├── CLOUD/
│   ├── AUTOMATION/
│   ├── CYBERSECURITY/
│   ├── IOT_EMBEDDED/
│   ├── LLM/
│   ├── AGENT_ENGINEERING/
│   ├── API_INTEGRATION/
│   └── GIS_TECHNOLOGY/
│
├── BUSINESS_DEVELOPMENT/     # Desenvolvimento Comercial
│   ├── LEAD_GENERATION/
│   ├── CLIENT_RESEARCH/
│   ├── SALES_STRATEGY/
│   ├── PROPOSAL_STRATEGY/
│   ├── ACCOUNT_MANAGEMENT/
│   ├── PARTNERSHIP_DEVELOPMENT/
│   └── ACCOUNT_INTELLIGENCE/
│
├── FINANCE/                  # Financeiro
│   ├── FINANCIAL_ANALYSIS/
│   ├── COST_ANALYSIS/
│   ├── PRICING/
│   ├── CAPEX_OPEX/
│   ├── BUSINESS_CASE/
│   └── COMMERCIAL_ANALYSIS/
│
├── OPERATIONS/               # Operações
│   ├── PROJECT_MANAGEMENT/
│   ├── DELIVERY_MANAGEMENT/
│   ├── RESOURCE_MANAGEMENT/
│   ├── SCHEDULING/
│   ├── PMO/
│   └── DOCUMENT_CONTROL/
│
├── QUALITY/                  # Controle de Qualidade
│   ├── TECHNICAL_REVIEW/
│   ├── FACT_CHECKING/
│   ├── SOURCE_VERIFICATION/
│   ├── REGULATORY_COMPLIANCE/
│   ├── RISK_CONTROL/
│   └── DOCUMENT_QA/
│
├── KNOWLEDGE/                # Base de Conhecimento
│   ├── INDEX.md
│   ├── LEGISLATION/
│   ├── REGULATIONS/
│   ├── STANDARDS/
│   ├── SCIENTIFIC/
│   ├── TECHNICAL/
│   ├── MARKET/
│   ├── COMPETITIVE/
│   ├── COMPANY/
│   ├── PROJECTS/
│   └── LESSONS_LEARNED/
│
├── SKILLS/                   # Skills por domínio
│   ├── SHARED/               # 20 skills compartilhadas
│   ├── ENERGY/               # 5 skills de energia
│   ├── ENVIRONMENTAL/        # 6 skills ambientais
│   ├── MINING/               # 5 skills de mineração
│   ├── MARITIME/             # 7 skills marítimas
│   ├── GIS_GEOAI/            # 6 skills de georreferenciamento
│   └── FORESTRY/             # 4 skills florestais
│
├── PROTOCOLS/                # Protocolos operacionais
│   ├── AGENT-COMMUNICATION.md
│   ├── HUMAN-IN-THE-LOOP.md
│   ├── ESCALATION.md
│   └── QUALITY-GATES.md
│
├── WORKFLOWS/                # Workflows de negócio
│   ├── OPPORTUNITY-TO-PROPOSAL.md
│   ├── TECHNICAL-DELIVERY.md
│   ├── RESEARCH-TO-REPORT.md
│   ├── SALES-FUNNEL.md
│   ├── ENVIRONMENTAL-LICENSING.md
│   └── EMERGENCY-RESPONSE.md
│
├── GOVERNANCE/               # Governança
│   ├── ACCESS_CONTROL.md
│   ├── PERMISSIONS.md
│   ├── AUDIT.md
│   ├── COMPLIANCE.md
│   ├── SECURITY.md
│   └── VERSIONING.md
│
├── OUTPUTS/                  # Entregas geradas
│
└── TESTS/                    # Cenários de teste
    ├── TEST-A-SOLAR.md
    ├── TEST-B-MINING.md
    ├── TEST-C-PORT.md
    ├── TEST-D-PRAD.md
    ├── TEST-E-AUDIT.md
    ├── TEST-F-SOFTWARE.md
    └── TEST-MASTER-TRACE.md
```

---

## Contatos Principais (Agent IDs)

| Agente | Função | Divisão |
|---|---|---|
| `ceo` | Diretor Executivo, estratégia corporativa | EXECUTIVE |
| `cto` | Diretor Técnico, arquitetura e segurança | EXECUTIVE |
| `market-segment` | Segmentação e posicionamento de mercado | EXECUTIVE |
| `engineering-dev` | Engenharia de software e DevOps | TECHNOLOGY |
| `data-analytics` | Análise de dados e inteligência | INTELLIGENCE |
| `ai-ml` | Inteligência artificial e modelos | TECHNOLOGY |
| `environmental-engineering` | Licenciamento e monitoramento ambiental | ENGINEERING |
| `mining` | Planejamento de mina e lavra | ENGINEERING |
| `renewable-energy` | Energia solar, eólica e eficiência | ENGINEERING |
| `commercial` | Marketing e conteúdo técnico-comercial | BUSINESS_DEVELOPMENT |
| `cybersecurity` | Segurança da informação e cibersegurança | TECHNOLOGY |

---

## Como Usar

### Para um novo projeto técnico
1. Identificar o workflow adequado em `WORKFLOWS/`
2. Verificar skills necessárias em `SKILL_CATALOG.md`
3. Consultar `AGENT_SKILL_MATRIX.md` para atribuição de agentes
4. Seguir as Quality Gates definidas em `QUALITY_CONTROL.md`

### Para adicionar um novo agente
1. Definir skills necessárias em `SKILL_CATALOG.md`
2. Adicionar ao `AGENT_CATALOG.md`
3. Atualizar `AGENT_SKILL_MATRIX.md`
4. Configurar hierarquia em `ORGANIZATION.md`

### Para criar um novo workflow
1. Seguir o template dos workflows existentes em `WORKFLOWS/`
2. Definir fases, gates e responsible agents
3. Integrar com `PROTOCOLS/` para comunicação e HITL
4. Adicionar ao `WORKFLOW_CATALOG.md`

---

## Números-chave

| Métrica | Valor |
|---|---|
| Divisões | 10 |
| Agentes | ~61 |
| Skills compartilhadas | 20 |
| Skills profissionais | 33 |
| Workflows | 6 |
| Protocolos | 4 |
| Cenários de teste | 7 |
| Base de conhecimento | 11 categorias |

---

## Versionamento

| Versão | Data | Alteração |
|---|---|---|
| 1.0.0 | 2026-09-04 | Versão inicial — estrutura completa |

---

## Nota de Segurança

- Chaves e segredos **somente** em variáveis de ambiente
- Nunca versionar credenciais em código
- Acesso a dados sensíveis conforme `GOVERNANCE/ACCESS_CONTROL.md`
- Compliance com LGPD para dados pessoais
