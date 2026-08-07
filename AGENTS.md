# Kraefegg M.O. — Estrutura Corporativa de Agentes

Empresa de **mineração, energia e engenharia ambiental** estruturada como sistema multiagente.

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
| `automation` | RPA, automação de processos, pipelines, CI/CD |
| `cloud-infrastructure` | Azure, AWS, DevOps, IaC, arquitetura cloud |
| `fullstack-dev` | Python, Angular, Java, JavaScript, HTML5, PyScript |
| `data-engineering` | Pipelines de dados, ETL, analytics, qualidade |
| `iot-embedded` | IoT, Edge, Embedded, MicroPython, firmware, hardware |
| `mechanical-engineering` | Engenharia mecânica, estruturas e máquinas |
| `energy-engineering` | Sistemas elétricos, armazenamento, eficiência |
| `naval-engineering` | Projeto naval e estruturas marítimas |
| `research-academic` | PhDs, médicos, mestres, validação científica |
| `consultants` | Consultores seniores multidisciplinares |

## Infraestrutura
- **OmniRoute**: gateway de modelos em `localhost:20128` (chave em `OMNIROUTE_API_KEY`).
- **GitHub**: versionamento e PRs (em configuração).
- **Oracle Free Tier**: banco de dados transacional (em configuração).
- **Databricks**: processamento robusto/Spark (em configuração).

## Regras gerais
- Chaves e segredos somente em variáveis de ambiente; nunca em código versionado.
- Toda entrega técnica deve ser clara, reproduzível e, quando aplicável, versionada.
- Todo processo e decisão é orientado à **economia de mercado capitalista**: geração de receita, eficiência, custo-benefício e valor ao cliente.
