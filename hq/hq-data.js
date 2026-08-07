// ============ HQ KRAEFEGG M.O. — BASE DE DADOS DA EQUIPE ============
// Consumida por hq/corporate-hq.html (painel 3D de gestão/supervisão).
// Fonte de verdade do quadro: AGENTS.md (estrutura corporativa).

const ORG = {
  nome: "Kraefegg M.O.",
  subtitulo: "MINERAÇÃO · ENERGIA · ENGENHARIA AMBIENTAL · SISTEMA MULTIAGENTE",
  modelo: "ECONOMIA DE MERCADO · OFERTA E DEMANDA",
  metaReceita90d: "R$ 15–40 mil (1ª rodada)",
  pipeline: "3 propostas · 8 reuniões · 40 contatos",
  areas: [
    { id: "exec", nome: "Executivos",             cor: 0xf2c94c },
    { id: "orc",  nome: "Orquestração",           cor: 0xff6b6b },
    { id: "eng",  nome: "Engenharia & Dados",     cor: 0x4dabf7 },
    { id: "amb",  nome: "Ambiental & Segurança",  cor: 0x51cf66 },
    { id: "min",  nome: "Mineração & Civil",      cor: 0xffa94d },
    { id: "ene",  nome: "Energia & Offshore",     cor: 0x22d3ee },
    { id: "com",  nome: "Comercial & Suporte",    cor: 0x94d82d },
    { id: "pes",  nome: "Pesquisa & Inovação",    cor: 0xb197fc },
    { id: "seg",  nome: "Cybersegurança & Consultoria", cor: 0xf06595 }
  ],
  staff: [
    // ---- EXECUTIVOS ----
    { id: "ceo",              nome: "CEO",              role: "Diretor Executivo — estratégia e decisão final", area: "exec", especialidade: "Gestão, receita, governança" },
    { id: "cto",              nome: "CTO",              role: "Diretor de Tecnologia — arquitetura e produtos técnicos", area: "exec", especialidade: "Arquitetura, IoT, dados, segurança" },
    { id: "market-segment",   nome: "Segmento de Mercado", role: "Diretor de Segmento — posicionamento, preço e funil", area: "exec", especialidade: "Comercial, precificação, prospecção" },
    // ---- ORQUESTRAÇÃO ----
    { id: "orchestrator",     nome: "Orquestrador",     role: "Coordenação executiva — roteia e consolida entregas", area: "orc", especialidade: "Gestão multiagente" },
    // ---- ENGENHARIA & DADOS ----
    { id: "engineering-dev",  nome: "Engenharia & Dev", role: "Software, automação, infra, integrações, DevOps", area: "eng", especialidade: "Web, APIs, GitHub, CI/CD" },
    { id: "data-analytics",   nome: "Data & Analytics", role: "Oracle, SQL, BI, pipelines e Databricks", area: "eng", especialidade: "SQL, BI, Spark" },
    { id: "ai-ml",            nome: "IA & Machine Learning", role: "Modelos, prompts, RAG e agentes via OmniRoute", area: "eng", especialidade: "ML, LLM, RAG" },
    { id: "fullstack-dev",    nome: "Fullstack",        role: "Python, Angular, Java, JavaScript, HTML5, PyScript", area: "eng", especialidade: "Produtos digitais, APIs" },
    { id: "data-engineering", nome: "Data Engineering", role: "ETL/ELT, qualidade e camadas bronze/silver/gold", area: "eng", especialidade: "Pipelines, modelagem" },
    { id: "iot-embedded",     nome: "IoT · Edge · Embedded", role: "MicroPython, ESP32, firmware, sensores, LoRa/MQTT", area: "eng", especialidade: "Hardware, edge AI, telemetria" },
    { id: "automation",       nome: "Automação & RPA",  role: "Automação de processos, scripts e CI/CD", area: "eng", especialidade: "Python, RPA, integrações" },
    { id: "cloud-infrastructure", nome: "Cloud Azure/AWS", role: "DevOps, IaC, Kubernetes, FinOps", area: "eng", especialidade: "Terraform, Docker, nuvem" },
    // ---- AMBIENTAL & SEGURANÇA ----
    { id: "environmental-engineering", nome: "Engenharia Ambiental", role: "Licenciamento, RAD/PRAD, monitoramento geoambiental", area: "amb", especialidade: "EIA/RIMA, sensoriamento remoto" },
    { id: "environmental-forensic-audit", nome: "Perícia & Auditoria", role: "Perícia e auditoria ambiental, datação de danos", area: "amb", especialidade: "NDVI forense, laudos" },
    { id: "safety-engineering", nome: "Segurança do Trabalho", role: "NRs, PGR/LTCAT, telemetria de exposição", area: "amb", especialidade: "NR-15/16, IBUTG, SST" },
    // ---- MINERAÇÃO & CIVIL ----
    { id: "mining",           nome: "Mineração & Lavra", role: "Planejamento de mina, lavra e reservas", area: "min", especialidade: "Reservas, sequenciamento" },
    { id: "mineralogy",       nome: "Mineralogia",      role: "Caracterização de minérios e agregados", area: "min", especialidade: "DRX/FRX, espectroscopia" },
    { id: "civil-engineering",nome: "Civil & Geotecnia",role: "Estruturas, taludes, barragens e obras", area: "min", especialidade: "Geotecnia, SPT, contenções" },
    { id: "mechanical-engineering", nome: "Engenharia Mecânica", role: "Estruturas, máquinas, análise e manutenção", area: "min", especialidade: "Elementos finitos, vibração" },
    // ---- ENERGIA & OFFSHORE ----
    { id: "renewable-energy", nome: "Energias Renováveis", role: "Solar, eólica e eficiência energética", area: "ene", especialidade: "Previsão de geração, O&M" },
    { id: "energy-engineering", nome: "Engenharia de Energia", role: "Sistemas elétricos, armazenamento, GD", area: "ene", especialidade: "Subestações, baterias, NR-10" },
    { id: "offshore-specialists", nome: "Especialistas Offshore", role: "Operações, inspeção e HSE offshore", area: "ene", especialidade: "Corrosão, integridade" },
    { id: "naval-engineering", nome: "Engenharia Naval", role: "Projeto naval e estruturas marítimas", area: "ene", especialidade: "Embarcações, casco" },
    // ---- COMERCIAL & SUPORTE ----
    { id: "commercial",       nome: "Comercial & Marketing", role: "Conteúdo técnico-comercial e divulgação", area: "com", especialidade: "Copywriting, LinkedIn" },
    { id: "client-prospecting", nome: "Prospecção de Clientes", role: "Funil comercial e prospecção ativa", area: "com", especialidade: "40 alvos, campanhas" },
    { id: "contracts-business", nome: "Contratos & Negócios", role: "Minutas, negociação e fechamento", area: "com", especialidade: "Contratos de serviço/SaaS" },
    { id: "finance",          nome: "Finanças & Orçamento", role: "Precificação, fluxo de caixa e viabilidade", area: "com", especialidade: "Modelo de receita" },
    { id: "accounting",       nome: "Contabilidade & Tributos", role: "Contabilidade e obrigações fiscais", area: "com", especialidade: "CNPJ, tributos" },
    { id: "legal-compliance", nome: "Jurídico & LGPD",   role: "Jurídico, LGPD e conformidade", area: "com", especialidade: "Contratos, privacidade" },
    { id: "hr-ops",           nome: "RH & Operações",   role: "Pessoas e operações internas", area: "com", especialidade: "Gestão de equipe" },
    { id: "secretary",        nome: "Secretariado",     role: "Documentos e agenda administrativa", area: "com", especialidade: "Atas, documentos" },
    { id: "analysts",         nome: "Analistas",         role: "Estudos de mercado e análises", area: "com", especialidade: "Pesquisa de mercado" },
    { id: "project-developers", nome: "Gestão de Projetos", role: "Gestão multidisciplinar de projetos", area: "com", especialidade: "PMO, entregas" },
    // ---- PESQUISA & INOVAÇÃO ----
    { id: "research-scientist", nome: "Pesquisa Científica", role: "Métodos, artigos e P&D", area: "pes", especialidade: "Sensoriamento, estatística" },
    { id: "research-academic", nome: "Pesquisa Avançada", role: "PhDs, médicos e mestres — validação científica", area: "pes", especialidade: "Revisão por pares, laudos" },
    // ---- CYBERSEC & CONSULTORIA ----
    { id: "cybersecurity",    nome: "Cybersegurança",    role: "White Hat · Blue Team · Red Team", area: "seg", especialidade: "Pentest, SOC, LGPD/ISO 27001" },
    { id: "consultants",      nome: "Consultoria",       role: "Consultores seniores multidisciplinares", area: "seg", especialidade: "Diagnósticos e pareceres" }
  ]
};

ORG.headcount = ORG.staff.length;
