# KRAEFEGG M.O. Tech-AI & Engineering Solutions — Corporate AI Workforce

Tech-AI & Engineering Solutions firm — **mining, energy & environmental engineering** — structured as a multi-agent corporate AI workforce.

## Executivos (agentes primários)
| Agente | Atribuição |
|---|---|
| `ceo` | Estratégia corporativa, metas de receita, decisões executivas |
| `cto` | Arquitetura de tecnologia, IoT/Edge/Embedded, dados, segurança |
| `market-segment` | Posicionamento, precificação e funil do segmento-alvo |

## Orquestração
- **Orquestrador** (`.opencode/agent/orchestrator.md`) — roteia cada pedido para o subagente especialista e consolida resultados.
- Todos os agentes rodam modelos do **OmniRoute** (`omniroute/...`) via gateway local `http://localhost:20128/v1`.

## Departamentos (subagentes)
| Agente | Atribuição |
|---|---|
| `engineering-dev` | Software, automação, infra, DevOps, GitHub |
| `data-analytics` | Oracle DB, pipelines, SQL, BI, Databricks |
| `ai-ml` | Modelos, prompts, RAG, agentes de IA via OmniRoute |
| `research-scientist` | Pesquisa científica, métodos, artigos |
| `commercial` | Marketing e conteúdo técnico-comercial |
| `client-prospecting` | Prospecção e funil comercial |
| `contracts-business` | Contratos e negócios |
| `finance` | Orçamento, custos, viabilidade |
| `accounting` | Contabilidade e tributos |
| `legal-compliance` | Jurídico, LGPD, licenciamento |
| `hr-ops` | RH e operações internas |
| `secretary` | Secretariado e documentos administrativos |
| `analysts` | Estudos de mercado e análises |
| `environmental-engineering` | Licenciamento, RAD/PRAD, monitoramento |
| `environmental-forensic-audit` | Perícia e auditoria ambiental |
| `safety-engineering` | Segurança do trabalho (NRs) |
| `mineralogy` | Caracterização de minérios |
| `mining` | Planejamento de mina, lavra, reservas |
| `renewable-energy` | Solar, eólica, eficiência energética |
| `civil-engineering` | Estruturas, geotecnia, obras |
| `project-developers` | Gestão multidisciplinar de projetos |
| `offshore-specialists` | Operações offshore |
| `cybersecurity` | White Hat, Blue Team e Red Team, LGPD, segurança IoT |
| `automation` | RPA, automação de processos, pipelines, CI/CD, self-healing da infra HQ |
| `cloud-infrastructure` | Azure, AWS, DevOps, IaC, arquitetura cloud |
| `network-infrastructure` | Conectividade de redes e SRE/Ops: mantém no ar as duas nuvens de produção (Code Engine + OCI/Oracle), bancos (PostgreSQL/MongoDB/Supabase), workflows, Google Drive, OmniRoute e GitHub |
| `fullstack-dev` | Python, Angular, Java, JavaScript, HTML5, PyScript |
| `data-engineering` | Pipelines de dados, ETL, analytics, qualidade |
| `iot-embedded` | IoT, Edge, Embedded, MicroPython, firmware, hardware |
| `mechanical-engineering` | Engenharia mecânica, estruturas e máquinas |
| `energy-engineering` | Sistemas elétricos, armazenamento, eficiência |
| `naval-engineering` | Projeto naval e estruturas marítimas |
| `sketchup-ruby` | Desenvolvimento de extensões e automação com a API Ruby do SketchUp |
| `research-academic` | PhDs, médicos, mestres, validação científica |
| `consultants` | Consultores seniores multidisciplinares |

## Infraestrutura
- **OmniRoute**: gateway de modelos em `localhost:20128` (chave em `OMNIROUTE_API_KEY`).
- **GitHub**: versionamento e PRs (em configuração).
- **PostgreSQL + MongoDB** (`db/`): banco transacional de produção (PostgreSQL, schema `kraefegg` — CRM, demandas/projetos, financeiro) + telemetria em time-series (MongoDB, `kraefegg_telemetry` — leituras, NDVI, clima, focos, alertas). Donos: `data-analytics` e `data-engineering`. Rodar local via `db/docker-compose.yml`.
- **Oracle Free Tier**: banco transacional alternativo/legado (em configuração).
- **Databricks**: processamento robusto/Spark (em configuração).

## Regras gerais
- Chaves e segredos somente em variáveis de ambiente; nunca em código versionado.
- Toda entrega técnica deve ser clara, reproduzível e, quando aplicável, versionada.
- Todo processo e decisão é orientado à **economia de mercado capitalista**: geração de receita, eficiência, custo-benefício e valor ao cliente.
