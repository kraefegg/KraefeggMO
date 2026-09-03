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
    { id: "sketchup-ruby",     nome: "SketchUp Ruby API", role: "Extensões e automação 3D com a API Ruby do SketchUp", area: "eng", especialidade: "Plugins 3D, quantitativos, DXF/IFC" },
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
    { id: "research-development", nome: "Pesquisa & Desenvolvimento", role: "Análise de segmentos de mercado, estudo avançado de produto-serviço e deployments", area: "pes", especialidade: "Offshore, mineração, embedded, IoT, Edge AI" },
    // ---- CYBERSEC & CONSULTORIA ----
    { id: "cybersecurity",    nome: "Cybersegurança",    role: "White Hat · Blue Team · Red Team", area: "seg", especialidade: "Pentest, SOC, LGPD/ISO 27001" },
    { id: "consultants",      nome: "Consultoria",       role: "Consultores seniores multidisciplinares", area: "seg", especialidade: "Diagnósticos e pareceres" }
  ]
};

ORG.headcount = ORG.staff.length;

// ============ FASES DAS ATIVIDADES ============
const FASES = [
  { id: 'backlog',   nome: 'Backlog',     cor: '#8ea3c6' },
  { id: 'analise',   nome: 'Em análise',  cor: '#f2c94c' },
  { id: 'execucao',  nome: 'Em execução', cor: '#22d3ee' },
  { id: 'revisao',   nome: 'Em revisão',  cor: '#b197fc' },
  { id: 'concluida', nome: 'Concluída',   cor: '#51cf66' }
];

// ============ DEMANDAS & ATIVIDADES ============
// fase/status editáveis no painel; alterações persistem em localStorage.
// responsavel = id de um agente em ORG.staff.
const DEMANDAS = [
  { id: 'D-01', titulo: 'Proposta PRAD Caraúbas-PB (SUDEMA) — consolidação da oferta',
    area: 'amb', responsavel: 'environmental-engineering', fase: 'execucao', prioridade: 'Alta', prazo: '15/08', progresso: 60,
    descricao: 'Fechar escopo, preço e cronograma do PRAD para envio à SUDEMA; envolver finance e market-segment.' },
  { id: 'D-02', titulo: 'Laudo de passivo ambiental para instituição financeira',
    area: 'amb', responsavel: 'environmental-forensic-audit', fase: 'execucao', prioridade: 'Média', prazo: '18/08', progresso: 30,
    descricao: 'Diagnóstico de passivo com datação por NDVI; aplicável a financiamento/crédito rural.' },
  { id: 'D-03', titulo: 'Campanha de prospecção — 40 contatos do tracker (dias 0-30)',
    area: 'com', responsavel: 'client-prospecting', fase: 'execucao', prioridade: 'Alta', prazo: '12/08', progresso: 75,
    descricao: 'Sequenciar e-mails/WhatsApp, agendar reuniões e registrar desdobramentos no tracker-contatos.csv.' },
  { id: 'D-04', titulo: 'Minuta de contrato de assinatura de monitoramento contínuo',
    area: 'com', responsavel: 'contracts-business', fase: 'revisao', prioridade: 'Alta', prazo: '10/08', progresso: 90,
    descricao: 'Modelo SaaS de monitoramento geoambiental recorrente (mensal/trimestral) com SLAs e reajuste.' },
  { id: 'D-05', titulo: 'PoC M1 — telemetria IoT da estação meteorológica',
    area: 'eng', responsavel: 'iot-embedded', fase: 'concluida', prioridade: 'Alta', prazo: '05/08', progresso: 100,
    descricao: 'Contrato de telemetria, firmware MicroPython (ESP32-S3) e bridge MQTT→JSON integrados ao AIO Observatory.' },
  { id: 'D-06', titulo: 'Pipeline automático de NDVI (Zenodo/GitHub → dataset versionado)',
    area: 'eng', responsavel: 'data-engineering', fase: 'analise', prioridade: 'Média', prazo: '25/08', progresso: 0,
    descricao: 'Coleta programada das séries Sentinel-2 do repo kraefegg/AIO com validação e camada bronze/silver.' },
  { id: 'D-07', titulo: 'Precificação dos kits IoT e fluxo de caixa 90 dias',
    area: 'com', responsavel: 'finance', fase: 'execucao', prioridade: 'Alta', prazo: '14/08', progresso: 40,
    descricao: 'Custo de BOM + instalação + assinatura; modelar receita vs despesa e ponto de equilíbrio.' },
  { id: 'D-08', titulo: 'LGPD e minuta de NDA/confidencialidade',
    area: 'com', responsavel: 'legal-compliance', fase: 'revisao', prioridade: 'Média', prazo: '11/08', progresso: 80,
    descricao: 'Revisar fluxo de dados (Open-Meteo/INPE/GitHub) e modelo de NDA para reuniões com clientes.' },
  { id: 'D-09', titulo: 'Red Team — teste de segurança do HQ e do AIO Observatory',
    area: 'seg', responsavel: 'cybersecurity', fase: 'analise', prioridade: 'Média', prazo: '20/08', progresso: 0,
    descricao: 'Revisão de vetores: CDNs, telemetria, localStorage e headers; relatório White/Blue/Red.' },
  { id: 'D-10', titulo: 'Artigo técnico — monitoramento do PRAD por sensoriamento remoto',
    area: 'pes', responsavel: 'research-academic', fase: 'analise', prioridade: 'Baixa', prazo: '30/08', progresso: 20,
    descricao: 'Método NDVI/NDWI para restauração da Caatinga; candidato a preprint e dataset Zenodo.' },
  { id: 'D-11', titulo: 'HQ 3D — módulo de demandas e fases das atividades',
    area: 'eng', responsavel: 'engineering-dev', fase: 'execucao', prioridade: 'Alta', prazo: '09/08', progresso: 50,
    descricao: 'Painel de gestão no corporate-hq.html: lista por fase, detalhe editável, persistência em localStorage.' },
  { id: 'D-12', titulo: 'Dashboard de geração solar para cliente-piloto',
    area: 'ene', responsavel: 'renewable-energy', fase: 'analise', prioridade: 'Média', prazo: '22/08', progresso: 0,
    descricao: 'Séries de geração (Open-Meteo/energia) com economia em tarifa horária e relatório mensal.' },
  { id: 'D-13', titulo: 'P&D — Edge Sensor Ambiental (embedded · IoT · Edge AI) para offshore e mineração',
    area: 'pes', responsavel: 'research-development', fase: 'execucao', prioridade: 'Alta', prazo: '19/08', progresso: 60,
    descricao: 'Firmware MicroPython (ESP32) com detecção de anomalia on-device (z-score), simulado no Wokwi; análise de segmentos de mercado e estudo de produto-serviço para lançamento.' },
  { id: 'D-14', titulo: 'Cofre ENIGMA — isolamento de credenciais e rotação de tokens',
    area: 'seg', responsavel: 'cybersecurity', fase: 'concluida', prioridade: 'Alta', prazo: '07/08', progresso: 100,
    descricao: 'Cofre local AES-256-GCM hardware-bound (security/cofre.py), 8 segredos cifrados, backup em texto eliminado, conexão com Databricks OpenSharing validada.' },
  { id: 'D-15', titulo: 'Documentação do projeto — docs/, diagramas, schemas, linguagens e códigos',
    area: 'eng', responsavel: 'engineering-dev', fase: 'revisao', prioridade: 'Média', prazo: '08/08', progresso: 85,
    descricao: 'Estrutura docs/ com arquitetura (Mermaid), deployments, schemas (JSON/SQL) e referência de linguagens do projeto.' },
  { id: 'D-16', titulo: 'AIO Comercial — versão multi-projeto e assinatura',
    area: 'eng', responsavel: 'engineering-dev', fase: 'analise', prioridade: 'Alta', prazo: '15/09', progresso: 0,
    descricao: 'Release comercial do AIO Observatory: multi-site, dados por cliente, marca d\'água e permissões; integração com assinatura recorrente.' },
  { id: 'D-17', titulo: 'Página pública de M&V — demo para prospecção',
    area: 'com', responsavel: 'commercial', fase: 'analise', prioridade: 'Alta', prazo: '05/09', progresso: 0,
    descricao: 'Página pública com dados de demonstração, copy técnico-comercial e CTA de reunião; revisão de segurança antes do ar.' },
  { id: 'D-18', titulo: 'Kit Estação Meteo — calibração, BOM e manual de instalação',
    area: 'eng', responsavel: 'iot-embedded', fase: 'backlog', prioridade: 'Média', prazo: '20/09', progresso: 0,
    descricao: 'Firmware ESP32-S3 validado, contrato JSON de telemetria, BOM final e manual de instalação para entrega em campo.' },
  { id: 'D-19', titulo: 'Kit Comercial Digital — proposta, contrato de assinatura e precificação',
    area: 'com', responsavel: 'commercial', fase: 'analise', prioridade: 'Alta', prazo: '30/08', progresso: 0,
    descricao: 'Template de proposta PDF, contrato de assinatura de monitoramento (14.133) e planilha de precificação e fluxo de caixa.' }
];

// ============ PESSOAS — DOSSIÊS & CURRÍCULOS ============
// Nome real de cada agente, nível profissional, formação e histórico (CV).
// Chave = id do agente em ORG.staff.
const PESSOAS = {
  // ---- EXECUTIVOS ----
  ceo: {
    nome: "Rai Arrda", cargo: "Diretor Executivo (CEO)", nat: "Brasileiro",
    nivel: "Executivo-C", nivelPct: 98,
    formacao: "MBA Executivo em Gestão Estratégica · Engenharia de Produção",
    resumo: "Visão de longo prazo, decisões finais e responsabilidade pelo resultado. Constrói a ponte entre engenharia, mercado e governança.",
    cv: [
      { ano: "2024–atual", papel: "CEO — Kraefegg M.O.", local: "João Pessoa/PB", desc: "Lidera o conglomerado multiagente; define estratégia, metas de receita e governança de segurança." },
      { ano: "2020–2024", papel: "Diretor de Operações", local: "Mineração BR", desc: "Estruturou plano de expansão e recuperação ambiental em empreendimentos minerários." },
      { ano: "2015–2020", papel: "Gerente de Projetos", local: "Engenharia & Consultoria", desc: "Gestão de obras e licenciamentos; carteira acima de R$ 8M/ano." }
    ]
  },
  cto: {
    nome: "Stian Berend J. Axon", cargo: "Diretor de Tecnologia (CTO)", nat: "Norueguês",
    nivel: "Executivo-C", nivelPct: 96,
    formacao: "PhD em Engenharia de Software · Especialização em Sistemas Distribuídos",
    resumo: "Arquiteto da plataforma: telemetria IoT, dados, segurança e o orquestrador multiagente OmniRoute.",
    cv: [
      { ano: "2024–atual", papel: "CTO — Kraefegg M.O.", local: "Oslo/NO", desc: "Projeta a arquitetura multiagente, Edge AI e os pipelines de dados geoespaciais." },
      { ano: "2019–2024", papel: "Arquiteto de Soluções Cloud", local: "Scandinavian Energy", desc: "IoT para parques eólicos; 4k sensores em operação." },
      { ano: "2013–2019", papel: "Engenheiro Sênior de Software", local: "Nordic Telecom", desc: "Sistemas distribuídos de alta disponibilidade." }
    ]
  },
  "market-segment": {
    nome: "Roxanna Yankova", cargo: "Diretora de Segmento de Mercado", nat: "Búlgara",
    nivel: "Executivo-C", nivelPct: 92,
    formacao: "M.Sc. em Marketing Estratégico · Certificação em Precificação",
    resumo: "Posiciona a Kraefegg M.O. em mineração, energia e ambiental; desenha preço e funil de prospecção.",
    cv: [
      { ano: "2024–atual", papel: "Diretora de Segmento — Kraefegg M.O.", local: "Sofia/BG", desc: "Define ofertas por segmento e modelo de receita SaaS." },
      { ano: "2018–2024", papel: "Head de Marketing B2B", local: "EnergyCorp", desc: "Funil de 40 contatos ativos por trimestre; 32% de conversão." },
      { ano: "2014–2018", papel: "Consultora de Negócios", local: "Consulting Partners", desc: "Estudos de mercado para energia renovável e mineração." }
    ]
  },
  // ---- ORQUESTRAÇÃO ----
  orchestrator: {
    nome: "Joachin Broesch", cargo: "Orquestrador Executivo", nat: "Alemão",
    nivel: "Especialista", nivelPct: 93,
    formacao: "Engenharia de Sistemas · Especialização em Gestão de Projetos Ágil",
    resumo: "Roteia demandas aos subagentes, consolida entregas e mantém o fluxo de trabalho em sincronia.",
    cv: [
      { ano: "2024–atual", papel: "Orquestrador — Kraefegg M.O.", local: "Berlim/DE", desc: "Coordena os 38 subagentes e o ciclo de demandas em 5 fases." },
      { ano: "2020–2024", papel: "Scrum Master & PMO", local: "Fintech Europe", desc: "Entrega de plataformas; lead time reduzido em 40%." },
      { ano: "2015–2020", papel: "Analista de Sistemas", local: "Indústria 4.0", desc: "Integração de automação industrial e MES." }
    ]
  },
  // ---- ENGENHARIA & DADOS ----
  "engineering-dev": {
    nome: "Allan Wilder", cargo: "Engenheiro de Software Líder", nat: "Britânico",
    nivel: "Especialista", nivelPct: 91,
    formacao: "B.Sc. Ciência da Computação · Certificado DevOps",
    resumo: "Software, automação, infra, integrações e CI/CD do ecossistema Kraefegg.",
    cv: [
      { ano: "2024–atual", papel: "Engenharia & Dev — Kraefegg M.O.", local: "Londres/UK", desc: "Desenvolve o HQ, integrações e pipelines de CI/CD." },
      { ano: "2019–2024", papel: "DevOps Engineer", local: "SaaS UK", desc: "Infra na nuvem e automação de entregas diárias." },
      { ano: "2015–2019", papel: "Desenvolvedor Fullstack", local: "Agencia Digital", desc: "Aplicações web de alto tráfego." }
    ]
  },
  "data-analytics": {
    nome: "Lars Nilmoesten", cargo: "Analista de Dados Sênior", nat: "Sueco",
    nivel: "Especialista", nivelPct: 89,
    formacao: "M.Sc. em Estatística Aplicada",
    resumo: "Oracle, SQL, BI e Spark; converte dados geoespaciais em decisão.",
    cv: [
      { ano: "2024–atual", papel: "Data & Analytics — Kraefegg M.O.", local: "Estocolmo/SE", desc: "Modelos de NDVI/NDWI e dashboards executivos." },
      { ano: "2018–2024", papel: "Analytics Engineer", local: "Retail Nordic", desc: "Camadas bronze/silver/gold e automação de BI." },
      { ano: "2013–2018", papel: "Analista de BI", local: "Banco Nórdico", desc: "Relatórios regulatórios e otimização de consultas." }
    ]
  },
  "ai-ml": {
    nome: "Brian Lucher", cargo: "Engenheiro de IA & ML", nat: "Irlandês",
    nivel: "Especialista", nivelPct: 90,
    formacao: "M.Sc. em Inteligência Artificial",
    resumo: "Modelos, prompts, RAG e agentes de IA via OmniRoute.",
    cv: [
      { ano: "2024–atual", papel: "IA & ML — Kraefegg M.O.", local: "Dublin/IE", desc: "Sistemas de recomendação de área de atuação e assistentes técnicos." },
      { ano: "2020–2024", papel: "ML Engineer", local: "Tech Hub IE", desc: "LLMs em produção e pipelines de inferência." },
      { ano: "2016–2020", papel: "Cientista de Dados Júnior", local: "Startup Dublin", desc: "Modelos preditivos de demanda." }
    ]
  },
  "fullstack-dev": {
    nome: "Lucca Loef", cargo: "Desenvolvedor Fullstack", nat: "Holandês",
    nivel: "Sênior", nivelPct: 85,
    formacao: "B.Sc. Engenharia de Software",
    resumo: "Python, JavaScript, HTML5 e APIs; produtos digitais ponta a ponta.",
    cv: [
      { ano: "2024–atual", papel: "Fullstack — Kraefegg M.O.", local: "Amsterdã/NL", desc: "Frontends do HQ e dashboards ambientais." },
      { ano: "2019–2024", papel: "Software Engineer", local: "Mercado Livre digital", desc: "Plataformas web com foco em performance." },
      { ano: "2015–2019", papel: "Desenvolvedor Web", local: "Agencia NL", desc: "Sites e sistemas sob medida." }
    ]
  },
  "data-engineering": {
    nome: "Arthur Klotschenisky", cargo: "Engenheiro de Dados", nat: "Polonês",
    nivel: "Sênior", nivelPct: 86,
    formacao: "M.Sc. em Engenharia de Dados",
    resumo: "ETL/ELT, qualidade e camadas bronze/silver/gold do dataset Sentinel-2.",
    cv: [
      { ano: "2024–atual", papel: "Data Engineering — Kraefegg M.O.", local: "Varsóvia/PL", desc: "Pipeline automático de NDVI (Zenodo/GitHub)." },
      { ano: "2019–2024", papel: "Data Engineer", local: "Logistics PL", desc: "Streaming e warehousing na nuvem." },
      { ano: "2016–2019", papel: "Desenvolvedor Python", local: "Fintech PL", desc: "Automações e integrações bancárias." }
    ]
  },
  "sketchup-ruby": {
    nome: "Nadia Voss", cargo: "Desenvolvedora SketchUp Ruby API", nat: "Alemã",
    nivel: "Especialista", nivelPct: 88,
    formacao: "B.Sc. Arquitetura · Especialização em Ruby/API SketchUp",
    resumo: "Extensões e automação 3D com a API Ruby do SketchUp; plugins paramétricos e extração de quantitativos de modelo.",
    cv: [
      { ano: "2024–atual", papel: "SketchUp Ruby API — Kraefegg M.O.", local: "Berlim/DE", desc: "Marcos de automação de modelagem 3D e quantitativos para os projetos de engenharia civil, naval e ambiental." },
      { ano: "2019–2024", papel: "Extension Developer", local: "AEC Studio DE", desc: "Plugins SketchUp para BIM-lite e interoperabilidade DXF/IFC; reduziu retrabalho de quantitativos em 60%." },
      { ano: "2015–2019", papel: "Modeladora Arquitetônica", local: "Arquitetura DE", desc: "Modelagem paramétrica e documentação técnica de projetos residenciais e industriais." }
    ]
  },
  "iot-embedded": {
    nome: "Anton Wienbohr", cargo: "Especialista IoT · Edge · Embedded", nat: "Austríaco",
    nivel: "Especialista", nivelPct: 92,
    formacao: "M.Sc. Engenharia Eletrônica · MicroPython/ESP32",
    resumo: "Firmware, sensores, LoRa/MQTT e Edge AI para o Edge Sensor ambiental.",
    cv: [
      { ano: "2024–atual", papel: "IoT · Edge · Embedded — Kraefegg M.O.", local: "Viena/AT", desc: "PoC M1 de telemetria da estação meteorológica e Edge Sensor offshore." },
      { ano: "2019–2024", papel: "Firmware Engineer", local: "Industrial AT", desc: "Sensores de vibração e temperatura com MQTT." },
      { ano: "2015–2019", papel: "Eletrônico de Protótipos", local: "R&D Lab", desc: "Hardware para agricultura de precisão." }
    ]
  },
  automation: {
    nome: "Kyle Henderson", cargo: "Automação & RPA", nat: "Americano",
    nivel: "Sênior", nivelPct: 83,
    formacao: "B.Sc. Sistemas de Informação",
    resumo: "Automatiza processos repetitivos, scripts e CI/CD.",
    cv: [
      { ano: "2024–atual", papel: "Automação & RPA — Kraefegg M.O.", local: "Boston/US", desc: "Rotinas de coleta de dados e geração de relatórios." },
      { ano: "2019–2024", papel: "RPA Developer", local: "FinServ US", desc: "Centros de robôs para back-office." },
      { ano: "2016–2019", papel: "Analista de Processos", local: "Consultoria US", desc: "Mapeamento e automação de fluxos." }
    ]
  },
  "cloud-infrastructure": {
    nome: "Michael Milstray", cargo: "Arquiteto de Nuvem", nat: "Australiano",
    nivel: "Especialista", nivelPct: 90,
    formacao: "Certificações Azure/AWS · Kubernetes",
    resumo: "DevOps, IaC e FinOps da infraestrutura em nuvem.",
    cv: [
      { ano: "2024–atual", papel: "Cloud — Kraefegg M.O.", local: "Sydney/AU", desc: "Deployments e custo otimizado dos serviços." },
      { ano: "2019–2024", papel: "Cloud Architect", local: "GovTech AU", desc: "Ambientes regulados com IaC (Terraform)." },
      { ano: "2015–2019", papel: "SysAdmin Sênior", local: "ISP AU", desc: "Infraestrutura de alta disponibilidade." }
    ]
  },
  // ---- AMBIENTAL & SEGURANÇA ----
  "environmental-engineering": {
    nome: "Martha Berger", cargo: "Engenheira Ambiental", nat: "Suíça",
    nivel: "Especialista", nivelPct: 91,
    formacao: "M.Sc. Engenharia Ambiental · Licenciamento (EIA/RIMA)",
    resumo: "Licenciamento, RAD/PRAD e monitoramento geoambiental da Caatinga.",
    cv: [
      { ano: "2024–atual", papel: "Engenharia Ambiental — Kraefegg M.O.", local: "Genebra/CH", desc: "PRAD Caraúbas-PB para a SUDEMA." },
      { ano: "2018–2024", papel: "Coordenadora Ambiental", local: "Mineração CH", desc: "EIA/RIMA de cava e pilha de estéril." },
      { ano: "2014–2018", papel: "Analista Ambiental", local: "Órgão estadual", desc: "Análise de estudos de impacto." }
    ]
  },
  "environmental-forensic-audit": {
    nome: "Adriene Vlaivik", cargo: "Perita Ambiental Forense", nat: "Letã",
    nivel: "Especialista", nivelPct: 94,
    formacao: "M.Sc. em Perícia Ambiental · Geotecnologias",
    resumo: "Perícia e datação de danos por NDVI forense; laudos para crédito e contencioso.",
    cv: [
      { ano: "2024–atual", papel: "Perícia & Auditoria — Kraefegg M.O.", local: "Riga/LV", desc: "Laudo de passivo ambiental para instituição financeira." },
      { ano: "2017–2024", papel: "Perita Independente", local: "Tribunais LV", desc: "Datação de desmatamento por séries temporais." },
      { ano: "2013–2017", papel: "Geógrafa Analista", local: "GIS Bureau", desc: "Sensoriamento remoto e cartografia de danos." }
    ]
  },
  "safety-engineering": {
    nome: "Alice Flavoian", cargo: "Engenheira de Segurança do Trabalho", nat: "Romena",
    nivel: "Sênior", nivelPct: 87,
    formacao: "Engenharia de Segurança · NR-15/16 · IBUTG",
    resumo: "NRs, PGR/LTCAT e telemetria de exposição ocupacional.",
    cv: [
      { ano: "2024–atual", papel: "Segurança do Trabalho — Kraefegg M.O.", local: "Bucareste/RO", desc: "Telemetria IBUTG para conforto térmico em minas." },
      { ano: "2018–2024", papel: "Engenheira SST", local: "Construção RO", desc: "PGR e LTCAT de obras de infraestrutura." },
      { ano: "2015–2018", papel: "Técnica de Segurança", local: "Indústria RO", desc: "Auditorias de NR-10 e NR-12." }
    ]
  },
  // ---- MINERAÇÃO & CIVIL ----
  mining: {
    nome: "Troy Melchin", cargo: "Engenheiro de Minas", nat: "Canadense",
    nivel: "Especialista", nivelPct: 92,
    formacao: "Engenharia de Minas · Reservas (JORC)",
    resumo: "Planejamento de mina, lavra, reservas e sequenciamento.",
    cv: [
      { ano: "2024–atual", papel: "Mineração & Lavra — Kraefegg M.O.", local: "Toronto/CA", desc: "Planejamento de lavra para agregados no Nordeste." },
      { ano: "2018–2024", papel: "Planejador de Mina", local: "Mineradora CA", desc: "Sequenciamento e desmonte otimizado." },
      { ano: "2013–2018", papel: "Geólogo de Mina", local: "Operação CA", desc: "Controle de teores e reservas." }
    ]
  },
  mineralogy: {
    nome: "Gerard Linous", cargo: "Mineralogista", nat: "Francês",
    nivel: "Sênior", nivelPct: 88,
    formacao: "PhD em Mineralogia · DRX/FRX",
    resumo: "Caracterização de minérios e agregados por espectroscopia.",
    cv: [
      { ano: "2024–atual", papel: "Mineralogia — Kraefegg M.O.", local: "Paris/FR", desc: "Laudos de caracterização para agregados da Caatinga." },
      { ano: "2017–2024", papel: "Pesquisador", local: "CNRS FR", desc: "Espectroscopia Raman e difração de raios X." },
      { ano: "2012–2017", papel: "Doutorando", local: "Universidade FR", desc: "Mineralogia de solos tropicais." }
    ]
  },
  "civil-engineering": {
    nome: "Armond Bayer", cargo: "Engenheiro Civil · Geotecnia", nat: "Brasileiro",
    nivel: "Especialista", nivelPct: 90,
    formacao: "Engenharia Civil · Geotecnia (SPT)",
    resumo: "Estruturas, taludes, barragens e contenções.",
    cv: [
      { ano: "2024–atual", papel: "Civil & Geotecnia — Kraefegg M.O.", local: "Recife/PE", desc: "Projetos de taludes e contenção em áreas de mineração." },
      { ano: "2018–2024", papel: "Geotécnico Sênior", local: "Construtora BR", desc: "Barragens de rejeito e fundações." },
      { ano: "2014–2018", papel: "Engenheiro de Obras", local: "Infra Nordeste", desc: "Rodovias e obras de drenagem." }
    ]
  },
  "mechanical-engineering": {
    nome: "John Felox", cargo: "Engenheiro Mecânico", nat: "Americano",
    nivel: "Sênior", nivelPct: 84,
    formacao: "Engenharia Mecânica · Elementos Finitos",
    resumo: "Estruturas, máquinas, análise e manutenção preditiva.",
    cv: [
      { ano: "2024–atual", papel: "Eng. Mecânica — Kraefegg M.O.", local: "Detroit/US", desc: "Análise de vibração de equipamentos de mina." },
      { ano: "2018–2024", papel: "Analista de Estruturas", local: "Offshore US", desc: "FEA de tubulações e estruturas marítimas." },
      { ano: "2014–2018", papel: "Manutenção Plena", local: "Fábrica US", desc: "Planos de manutenção preditiva." }
    ]
  },
  // ---- ENERGIA & OFFSHORE ----
  "renewable-energy": {
    nome: "Hugh Pawther", cargo: "Especialista em Energias Renováveis", nat: "Escocês",
    nivel: "Sênior", nivelPct: 88,
    formacao: "M.Sc. Energias Renováveis",
    resumo: "Solar, eólica, previsão de geração e O&M.",
    cv: [
      { ano: "2024–atual", papel: "Energias Renováveis — Kraefegg M.O.", local: "Edimburgo/UK", desc: "Dashboard de geração solar para cliente-piloto." },
      { ano: "2018–2024", papel: "Analista de Geração", local: "Solar Farm UK", desc: "Previsão e otimização de parques solares." },
      { ano: "2014–2018", papel: "Engenheiro Eólico", local: "Wind Ops", desc: "O&M de turbinas onshore." }
    ]
  },
  "energy-engineering": {
    nome: "Michael Hergt", cargo: "Engenheiro de Energia", nat: "Alemão",
    nivel: "Sênior", nivelPct: 85,
    formacao: "Engenharia Elétrica · NR-10",
    resumo: "Sistemas elétricos, armazenamento e geração distribuída.",
    cv: [
      { ano: "2024–atual", papel: "Eng. de Energia — Kraefegg M.O.", local: "Munique/DE", desc: "Estudos de GD e armazenamento para indústrias." },
      { ano: "2018–2024", papel: "Projetista Elétrico", local: "Utility DE", desc: "Subestações e redes de média tensão." },
      { ano: "2014–2018", papel: "Técnico Eletricista Sênior", local: "Indústria DE", desc: "Manutenção elétrica preditiva." }
    ]
  },
  "offshore-specialists": {
    nome: "Tyler Scott", cargo: "Especialista Offshore", nat: "Britânico",
    nivel: "Sênior", nivelPct: 86,
    formacao: "Engenharia Naval · HSE Offshore",
    resumo: "Operações, inspeção e HSE em ambiente offshore.",
    cv: [
      { ano: "2024–atual", papel: "Offshore — Kraefegg M.O.", local: "Aberdeen/UK", desc: "Inspeção de integridade e corrosão." },
      { ano: "2017–2024", papel: "Inspector de Integridade", local: "Plataforma NCS", desc: "Inspeções subaquáticas e UT/PMI." },
      { ano: "2013–2017", papel: "Oficial de Máquinas", local: "Frota Petroleira", desc: "Operação de sistemas de bordo." }
    ]
  },
  "naval-engineering": {
    nome: "Marcella Anccebaldi", cargo: "Engenheira Naval", nat: "Italiana",
    nivel: "Especialista", nivelPct: 89,
    formacao: "M.Sc. Engenharia Naval",
    resumo: "Projeto naval e estruturas marítimas.",
    cv: [
      { ano: "2024–atual", papel: "Eng. Naval — Kraefegg M.O.", local: "Gênova/IT", desc: "Projetos de embarcações de serviço costeiro." },
      { ano: "2018–2024", papel: "Projetista Naval", local: "Estaleiro IT", desc: "Estrutura de casco e estabilidade." },
      { ano: "2015–2018", papel: "Analista de Hidrodinâmica", local: "R&D Naval", desc: "Simulações CFD de casco." }
    ]
  },
  // ---- COMERCIAL & SUPORTE ----
  commercial: {
    nome: "Ashley Angiouni", cargo: "Comercial & Marketing", nat: "Grega",
    nivel: "Sênior", nivelPct: 84,
    formacao: "Marketing Digital · Copywriting",
    resumo: "Conteúdo técnico-comercial e divulgação.",
    cv: [
      { ano: "2024–atual", papel: "Comercial — Kraefegg M.O.", local: "Atenas/GR", desc: "Trilhas de conteúdo e presença LinkedIn." },
      { ano: "2018–2024", papel: "Content Strategist", local: "Agência GR", desc: "Funis B2B técnicos." },
      { ano: "2015–2018", papel: "Social Media Manager", local: "Startup GR", desc: "Growth e comunidade." }
    ]
  },
  "client-prospecting": {
    nome: "Adrian Smith", cargo: "Prospecção de Clientes", nat: "Brasileiro",
    nivel: "Sênior", nivelPct: 85,
    formacao: "Administração de Empresas · Vendas Consultivas",
    resumo: "Funil comercial e prospecção ativa (40 alvos).",
    cv: [
      { ano: "2024–atual", papel: "Prospecção — Kraefegg M.O.", local: "São Paulo/SP", desc: "Campanha de 40 contatos do tracker." },
      { ano: "2018–2024", papel: "Executivo de Contas", local: "SaaS BR", desc: "Novos negócios e onboarding." },
      { ano: "2014–2018", papel: "Consultor de Vendas", local: "Indústria BR", desc: "Contas-chave do setor mineral." }
    ]
  },
  "contracts-business": {
    nome: "Bengt Bornson", cargo: "Contratos & Negócios", nat: "Dinamarquês",
    nivel: "Sênior", nivelPct: 83,
    formacao: "Direito Empresarial · Negociação",
    resumo: "Minutas, negociação e fechamento de contratos de serviço/SaaS.",
    cv: [
      { ano: "2024–atual", papel: "Contratos — Kraefegg M.O.", local: "Copenhague/DK", desc: "Minuta de contrato de monitoramento contínuo." },
      { ano: "2018–2024", papel: "Negociador Comercial", local: "Telecom DK", desc: "Contratos B2B de alto valor." },
      { ano: "2014–2018", papel: "Analista Jurídico", local: "Firm DK", desc: "Revisão de cláusulas e SLAs." }
    ]
  },
  finance: {
    nome: "Tina Waldum", cargo: "Finanças & Orçamento", nat: "Islandesa",
    nivel: "Sênior", nivelPct: 86,
    formacao: "M.Sc. Finanças Corporativas",
    resumo: "Precificação, fluxo de caixa e viabilidade econômica.",
    cv: [
      { ano: "2024–atual", papel: "Finanças — Kraefegg M.O.", local: "Reykjavík/IS", desc: "Precificação dos kits IoT e fluxo de caixa 90 dias." },
      { ano: "2018–2024", papel: "Analista Financeiro", local: "Energy IS", desc: "Viabilidade de projetos renováveis." },
      { ano: "2014–2018", papel: "Controller Júnior", local: "Indústria IS", desc: "Orçamento e custos." }
    ]
  },
  accounting: {
    nome: "Werner Kessler", cargo: "Contabilidade & Tributos", nat: "Sul-africano",
    nivel: "Pleno", nivelPct: 74,
    formacao: "Ciências Contábeis",
    resumo: "Contabilidade e obrigações fiscais (CNPJ, tributos).",
    cv: [
      { ano: "2024–atual", papel: "Contabilidade — Kraefegg M.O.", local: "Joanesburgo/ZA", desc: "Obrigações acessórias e apuração." },
      { ano: "2018–2024", papel: "Contador", local: "Escritório ZA", desc: "Departamento fiscal completo." },
      { ano: "2015–2018", papel: "Auxiliar Contábil", local: "PME ZA", desc: "Lançamentos e conciliação." }
    ]
  },
  "legal-compliance": {
    nome: "Ingrid Falk", cargo: "Jurídico & LGPD", nat: "Sueca",
    nivel: "Especialista", nivelPct: 90,
    formacao: "Direito · Especialização em Privacidade (LGPD/GDPR)",
    resumo: "Jurídico, LGPD e conformidade regulatória.",
    cv: [
      { ano: "2024–atual", papel: "Jurídico & LGPD — Kraefegg M.O.", local: "Gotemburgo/SE", desc: "LGPD dos fluxos de dados e NDA." },
      { ano: "2018–2024", papel: "Advogada de Privacidade", local: "Tech SE", desc: "DPO de plataforma SaaS." },
      { ano: "2014–2018", papel: "Advogada Corporativa", local: "Law Firm SE", desc: "Contratos e compliance." }
    ]
  },
  "hr-ops": {
    nome: "Sofia Marengo", cargo: "RH & Operações", nat: "Portuguesa",
    nivel: "Sênior", nivelPct: 82,
    formacao: "Psicologia Organizacional · RH",
    resumo: "Gestão de pessoas e operações internas da equipe multiagente.",
    cv: [
      { ano: "2024–atual", papel: "RH & Operações — Kraefegg M.O.", local: "Lisboa/PT", desc: "Cultura, rotinas e onboarding." },
      { ano: "2018–2024", papel: "HR Business Partner", local: "Tech PT", desc: "Desenvolvimento de lideranças." },
      { ano: "2015–2018", papel: "Analista de RH", local: "Indústria PT", desc: "Recrutamento e treinamento." }
    ]
  },
  secretary: {
    nome: "Diana Pruett", cargo: "Secretariado Executivo", nat: "Americana",
    nivel: "Pleno", nivelPct: 70,
    formacao: "Secretariado Executivo",
    resumo: "Documentos, atas e agenda administrativa.",
    cv: [
      { ano: "2024–atual", papel: "Secretariado — Kraefegg M.O.", local: "Nova York/US", desc: "Atas e organização documental." },
      { ano: "2018–2024", papel: "Secretária Executiva", local: "Law Firm US", desc: "Agenda executiva e viagens." },
      { ano: "2016–2018", papel: "Assistente Administrativa", local: "Corp US", desc: "Suporte de escritório." }
    ]
  },
  analysts: {
    nome: "Grant Hollowell", cargo: "Analista de Mercado", nat: "Australiano",
    nivel: "Pleno", nivelPct: 72,
    formacao: "Economia Aplicada",
    resumo: "Estudos de mercado e análises setoriais.",
    cv: [
      { ano: "2024–atual", papel: "Analistas — Kraefegg M.O.", local: "Melbourne/AU", desc: "Pesquisa de segmentos de mineração e energia." },
      { ano: "2019–2024", papel: "Analista de Pesquisa", local: "Consultoria AU", desc: "Relatórios setoriais." },
      { ano: "2017–2019", papel: "Estagiário", local: "Banco AU", desc: "Base de dados econômicos." }
    ]
  },
  "project-developers": {
    nome: "Elias Vandermeer", cargo: "Gestão de Projetos", nat: "Belga",
    nivel: "Sênior", nivelPct: 87,
    formacao: "PMP · Engenharia de Produção",
    resumo: "Gestão multidisciplinar de projetos e entregas.",
    cv: [
      { ano: "2024–atual", papel: "Gestão de Projetos — Kraefegg M.O.", local: "Bruxelas/BE", desc: "PMO das demandas D-01 a D-15." },
      { ano: "2018–2024", papel: "Project Manager", local: "E&C BE", desc: "Obras de infraestrutura e energia." },
      { ano: "2014–2018", papel: "Engenheiro de Planejamento", local: "EPC BE", desc: "Cronogramas e controle de custos." }
    ]
  },
  // ---- PESQUISA & INOVAÇÃO ----
  "research-scientist": {
    nome: "Naomi Carradine", cargo: "Pesquisadora Científica", nat: "Britânica",
    nivel: "Especialista", nivelPct: 91,
    formacao: "PhD em Geotecnologias",
    resumo: "Métodos de sensoriamento remoto e estatística aplicada.",
    cv: [
      { ano: "2024–atual", papel: "Pesquisa Científica — Kraefegg M.O.", local: "Bristol/UK", desc: "Métodos NDVI/NDWI para a Caatinga." },
      { ano: "2018–2024", papel: "Pesquisadora Pós-doc", local: "Univ. Bristol", desc: "Séries temporais de vegetação." },
      { ano: "2013–2018", papel: "Doutoranda", local: "Univ. Cambridge", desc: "Análise de mudança de uso do solo." }
    ]
  },
  "research-academic": {
    nome: "Viktor Steinwall", cargo: "Pesquisador Acadêmico", nat: "Norueguês",
    nivel: "Especialista", nivelPct: 95,
    formacao: "PhD · Revisão por pares",
    resumo: "Validação científica, artigos e laudos técnicos.",
    cv: [
      { ano: "2024–atual", papel: "Pesquisa Avançada — Kraefegg M.O.", local: "Bergen/NO", desc: "Artigo técnico sobre monitoramento do PRAD." },
      { ano: "2015–2024", papel: "Professor Associado", local: "Univ. Bergen", desc: "Geoestatística e sensoriamento remoto." },
      { ano: "2010–2015", papel: "Pesquisador", local: "NIVA", desc: "Monitoramento ambiental de ecossistemas." }
    ]
  },
  "research-development": {
    nome: "Dorian Almeida", cargo: "Pesquisa & Desenvolvimento", nat: "Brasileiro",
    nivel: "Sênior", nivelPct: 86,
    formacao: "Engenharia de Controle e Automação · Edge AI",
    resumo: "Segmentos de mercado e produto-serviço: offshore, mineração, embedded, IoT e Edge AI.",
    cv: [
      { ano: "2024–atual", papel: "P&D — Kraefegg M.O.", local: "Natal/RN", desc: "Estudo avançado do Edge Sensor para offshore e mineração." },
      { ano: "2019–2024", papel: "Especialista em Automação", local: "Oil & Gas BR", desc: "Telemetria de instrumentação em plataformas." },
      { ano: "2015–2019", papel: "Engenheiro de Controle", local: "Indústria BR", desc: "Sistemas embarcados e SCADA." }
    ]
  },
  // ---- CYBERSEC & CONSULTORIA ----
  cybersecurity: {
    nome: "Riku Tanabe", cargo: "Analista de Cybersegurança", nat: "Japonês",
    nivel: "Especialista", nivelPct: 93,
    formacao: "Security+ · OSCP · ISO 27001 Lead Auditor",
    resumo: "White Hat · Blue Team · Red Team; pentest, SOC e LGPD/ISO.",
    cv: [
      { ano: "2024–atual", papel: "Cybersegurança — Kraefegg M.O.", local: "Tóquio/JP", desc: "Red Team do HQ/AIO e cofre ENIGMA." },
      { ano: "2018–2024", papel: "Pentester", local: "CyberLab JP", desc: "Pentest web e infraestrutura." },
      { ano: "2014–2018", papel: "Analista SOC", local: "CERT JP", desc: "Detecção e resposta a incidentes." }
    ]
  },
  consultants: {
    nome: "Solveig Hammer", cargo: "Consultora Sênior", nat: "Norueguesa",
    nivel: "Especialista", nivelPct: 92,
    formacao: "M.Sc. Engenharia · Consultoria Multidisciplinar",
    resumo: "Diagnósticos e pareceres técnicos em energia, mineração e meio ambiente.",
    cv: [
      { ano: "2024–atual", papel: "Consultoria — Kraefegg M.O.", local: "Oslo/NO", desc: "Pareceres para clientes de mineração e energia." },
      { ano: "2016–2024", papel: "Consultora Sênior", local: "Big4 NO", desc: "Due diligence e auditoria de ativos." },
      { ano: "2011–2016", papel: "Engenheira de Processos", local: "Indústria NO", desc: "Otimização e projetos de capex." }
    ]
  }
};

// expõe como globais explícitas (const no topo não vira window.X)
window.ORG = ORG;
window.FASES = FASES;
window.DEMANDAS = DEMANDAS;
window.PESSOAS = PESSOAS;

// ============ API DAS DEMANDAS — CE-STRATEGIC (Supabase) ============
// Fonte viva das demandas: o backend estratégico (Code Engine) registra no
// Supabase. O corporate-hq.html puxa daqui e mescla com o seed local,
// degradando para o modo offline (seed + localStorage) se a API falhar.
const HQ_API = {
  suporte: true,
  ce_strategic: {
    url: 'https://ce-strategic.2e4s1hfdcw14.br-sao.codeengine.appdomain.cloud',
    token: 'kraefegg-mo-2026',
    demandas_path: '/demandas'
  }
};

window.HQ_API = HQ_API;

// ============ RELATÓRIOS & ANÁLISES (módulo Relatórios do HQ) ============
// Fonte local (seed). O HQ tenta carregar do banco (Supabase REST) e degrada
// graciosamente para este conjunto + localStorage quando o banco está offline.
// Para adicionar nova análise: inclua aqui e registre em db/seed.sql (o módulo
// do HQ também permite criar relatórios, salvando direto no banco).

const RELATORIOS = [
  {
    id: 'R-2026-001',
    codigo: 'R-2026-001',
    titulo: 'Análise de Mercado e Soluções 2026',
    tipo: 'analise',
    autores: ['ceo','orchestrator','market-segment','analysts','client-prospecting','commercial'],
    segmento: ['ambiental','energia','mineracao','sst','offshore','governo'],
    data_relatorio: '2026-08-09',
    versao: 1,
    resumo: 'Estudo consolidado de mercados e soluções fornecíveis pela Kraefegg M.O. para 2026: tamanho de mercado por segmento, portfólio, oportunidades, decisões do CEO e plano de 90 dias.',
    conteudo: [
      '# Análise de Mercado e Soluções 2026 — Kraefegg M.O.',
      '',
      '> Consolidado pelo orquestrador com insumos de analysts, commercial, client-prospecting e market-segment. Decisões executivas do CEO.',
      '',
      '**Data:** 2026-08-09 · **Versão:** 1 · **Código:** R-2026-001',
      '',
      '## 1. Panorama macro (2026)',
      '',
      '- Consultoria ambiental no Brasil: R$ 6–10 bi/ano (cerca de 2–3% do mercado global de US$ 49,3 bi; Mordor Intelligence).',
      '- Novo PAC com carteira de R$ 724 bi; Chamada Nordeste do BNDES de R$ 127,8 bi (245 projetos de transição energética, H2V e bioeconomia); desembolsos do BNDES no NE +184% no 1º sem/2026; FNE R$ 47 bi/2025.',
      '- Caatinga em alta: edital Recaatingar (BNDES + BNB, recuperação socioprodutiva; 2º ciclo 15/10–14/12/2026) e programa Sertão Vivo (cerca de R$ 1 bi) — restauração do bioma é nicho direto para a Kraefegg.',
      '- Marco regulatório: Lei 15.190/2025 (novo licenciamento ambiental), IN IBAMA 14/2024 (novo marco do PRAD), Lei 15.097/2025 (eólica offshore), SBCE/carbono (regras até dez/2026) e Taxonomia Sustentável Brasileira.',
      '',
      '## 2. Segmentos, mercado e prioridade',
      '',
      '| Segmento | SAM NE (ano) | Ticket típico | Risco | Prioridade |',
      '|---|---|---|---|---|',
      '| Geoambiental, PRAD e licenciamento (PB) | R$ 30–80 mi | R$ 15–60 mil | médio-baixo | 1 |',
      '| Energia eólica/solar (PB + NE) | R$ 300–600 mi | R$ 250 mil–1,5 mi | médio-alto | 1 |',
      '| Restauração + carbono (Caatinga) | Recaatingar R$ 55 mi | R$ 30–150 mil | médio | 1 |',
      '| Mineração (Seridó/Cariri) | R$ 15–40 mi | R$ 40–250 mil | médio-alto | 2 |',
      '| SST + perícia | R$ 20–50 mi | R$ 1,5–8 mil | médio | 3 |',
      '| Offshore NE | R$ 300–600 mi (5–10 anos) | bilionário (EIA/RIMA) | alto | 4 (leve) |',
      '',
      '## 3. Soluções que fornecemos',
      '',
      '1. Assessoria ambiental contínua para prefeituras (OMMA + licenciamento + captação) — assinatura mensal R$ 3–8 mil.',
      '2. Licenciamento e monitoramento de condicionantes para eólicas — projeto + assinatura AIO.',
      '3. PRAD + monitoramento e verificação de restauração (AIO Observatory, NDVI Sentinel-2 real) — projeto + assinatura trimestral.',
      '4. Due diligence e auditoria de parques eólicos/solares — R$ 30–120 mil por ativo.',
      '5. RFP, PAE, RAL, caracterização mineralógica e PRAD minerário — fixo + retainer anual.',
      '6. Linha IoT/Edge (estações meteorológicas, telemetria de talude/barragem, Res. ANM 95/2022) — kit R$ 8–25 mil + assinatura R$ 300–1.000/mês.',
      '7. SST integrada (PGR/LTCAT/NRs) e inventário de GEE + MRV (pré-SBCE) — pacote + mensalidade de gestão.',
      '',
      '## 4. Oportunidades e parcerias',
      '',
      '- Editais: Recaatingar (2º ciclo até 14/12/2026), Fundo Clima (PAAR 2026 reembolsável de R$ 27 bi), FNDCT/Finep (20% da carteira para N/NE/CO), SBCE (preparação para MRV).',
      '- Poder público: assessoria contínua via dispensa de licitação 14.133 (art. 75, II); implantação do licenciamento municipal (COPAM-PB); TACs MPPB/MPF (PRAD + monitoramento periódico).',
      '- Parcerias: SEBRAE-PB (SEBRAETEC), UFPB/UFCG/IFPB (FNDCT descentralizado), EMBRAPA Semiárido/INSA, BNB/BNDES/FBDS e CREA-PB.',
      '',
      '## 5. Decisões executivas (CEO)',
      '',
      '1. Aprovar priorização: prefeituras → eólicas PB → restauração/carbono.',
      '2. Assinatura como âncora de receita recorrente (AIO + monitoramento contínuo).',
      '3. Delegar: market-segment e client-prospecting (propostas Recaatingar antes de 15/10 e assessorias municipais em 90 dias); commercial e engineering-dev (página pública de M&V + template de proposta); contracts-business e legal-compliance (contrato de assinatura 14.133); finance (precificação e fluxo de caixa); research-academic (credenciais para EIA/RIMA offshore).',
      '4. Registrar todas as análises no banco de dados e disponibilizar download no HQ.',
      '',
      '## 6. Riscos e mitigação',
      '',
      '| Risco | Mitigação |',
      '|---|---|',
      '| PL 2.061/2024 (PB) — distanciamento de 1,5 km pode inviabilizar projetos eólicos | Monitorar com legal-compliance; diversificar carteira |',
      '| Curtailment e FNE suspenso para geração centralizada | Focar due diligence/M&A em vez de novos EIA/RIMA onshore |',
      '| Eleições 2026 — descontinuidade de contratos municipais | Diversificar carteira; contrato anual com cláusula de transição |',
      '| SBCE ainda em regulamentação | Oferecer preparação (inventário/MRV), não garantias |',
      '| Offshore apenas a partir de 2027 | Posicionamento leve: studies, credenciais e SST portuária |',
      '',
      '*Fontes: pesquisa de mercado 2026 (BNDES, MMA, IBAMA, SUDEMA, ANM, BNB, SEBRAE, Absolar, ABEEólica, EPE/MCTI). Estimativas de ordem de grandeza.*'
    ].join('\n'),
    metadados: {
      download_count: 0,
      fontes: ['BNDES','MMA','IBAMA','SUDEMA','ANM','BNB','SEBRAE','Absolar','ABEEólica','EPE/MCTI'],
      decisao: 'Priorizar prefeituras, eólicas PB e restauração/carbono nos próximos 90 dias'
    }
  }
];

// ============ CONFIG DE BANCO DO HQ (Supabase REST — chave publishable) ============
// A chave anon/publishable é pública por design (proteção via RLS). O módulo
// Relatórios usa este endpoint e, se falhar, opera em modo offline (seed + localStorage).
const HQ_DB = {
  suporte: true,
  supabase: {
    url: 'https://mrqjmdfulmnggozwjxlq.supabase.co',
    key: 'sb_publishable_PGW_hFT4bnzA_bIS8EPx6g_LvxWNP4Y'
  }
};

window.RELATORIOS = RELATORIOS;
window.HQ_DB = HQ_DB;

// ============================================================================
// INTEGRAÇÃO REST COM O SUPABASE (entidades do HQ)
// Carrega agentes, projetos e demandas do banco (schema public) e os expõe em
// window.HQ_DB.dados, de forma ADITIVA (não sobrescreve os dados ricos locais).
// Usa o mesmo padrão do módulo Relatórios. Se o banco estiver offline, degrada
// silenciosamente (dados locais continuam valendo).
// ============================================================================

HQ_DB.dados = { agentes: [], projetos: [], demandas: [], carregado: false };

HQ_DB._req = function(path, opts){
  if(!HQ_DB.supabase || !HQ_DB.supabase.url || !HQ_DB.supabase.key) return Promise.resolve(null);
  var db = HQ_DB.supabase;
  var ctrl = new AbortController();
  var to = setTimeout(function(){ ctrl.abort(); }, 8000);
  var cfg = opts || {};
  var init = { signal: ctrl.signal, headers: { apikey: db.key, 'Authorization': 'Bearer '+db.key } };
  if(cfg.method){ init.method = cfg.method; }
  if(cfg.body){ init.headers['Content-Type'] = 'application/json'; init.body = JSON.stringify(cfg.body); }
  return fetch(db.url + '/rest/v1/' + path, init)
    .then(function(res){
      clearTimeout(to);
      if(cfg.method){ return res.ok; }
      if(!res.ok) throw new Error('HTTP '+res.status);
      return res.json();
    })
    .catch(function(){ clearTimeout(to); return null; });
};

HQ_DB.buscar = function(tabela, cols){
  return HQ_DB._req(tabela + '?select=' + (cols || '*'));
};
HQ_DB.salvar = function(tabela, objeto){
  return HQ_DB._req(tabela, { method: 'POST', body: objeto });
};
HQ_DB.atualizar = function(tabela, coluna, valor, dados){
  return HQ_DB._req(tabela + '?' + coluna + '=eq.' + encodeURIComponent(valor), { method: 'PATCH', body: dados });
};
HQ_DB.excluir = function(tabela, coluna, valor){
  return HQ_DB._req(tabela + '?' + coluna + '=eq.' + encodeURIComponent(valor), { method: 'DELETE' });
};

HQ_DB.carregar = function(){
  if(!window.fetch) return;
  var pAg = HQ_DB.buscar('agentes');
  var pPr = HQ_DB.buscar('projetos');
  var pDe = HQ_DB.buscar('demandas');
  Promise.all([pAg, pPr, pDe]).then(function(r){
    var ag = r[0], pr = r[1], de = r[2];
    HQ_DB.dados.agentes  = Array.isArray(ag) ? ag : [];
    HQ_DB.dados.projetos = Array.isArray(pr) ? pr : [];
    HQ_DB.dados.demandas = Array.isArray(de) ? de : [];
    HQ_DB.dados.carregado = true;
  });
};

// Dispara o carregamento — os dados ficam disponíveis em HQ_DB.dados.
HQ_DB.carregar();
