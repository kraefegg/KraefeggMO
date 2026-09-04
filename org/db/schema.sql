-- KRAEFEGG M.O. — Organizational Memory Database Schema
-- Version: 1.0.0
-- Created: 2026-09-04
-- Engine: SQLite (dev) / PostgreSQL (prod)

-- ============================================================
-- AGENTS
-- ============================================================
CREATE TABLE IF NOT EXISTS agents (
    agent_id TEXT PRIMARY KEY,
    division TEXT NOT NULL,
    department TEXT,
    role TEXT NOT NULL,
    authority_level INTEGER DEFAULT 0,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- SKILLS
-- ============================================================
CREATE TABLE IF NOT EXISTS skills (
    skill_id TEXT PRIMARY KEY,
    category TEXT NOT NULL, -- shared, environmental, forestry, energy, mining, maritime, gis
    name TEXT NOT NULL,
    version TEXT DEFAULT '1.0.0',
    status TEXT DEFAULT 'active',
    purpose TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- AGENT-SKILL MAPPING
-- ============================================================
CREATE TABLE IF NOT EXISTS agent_skills (
    agent_id TEXT NOT NULL,
    skill_id TEXT NOT NULL,
    skill_type TEXT DEFAULT 'core', -- core, professional, optional, restricted
    proficiency INTEGER DEFAULT 3, -- 1-5
    PRIMARY KEY (agent_id, skill_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

-- ============================================================
-- TASKS
-- ============================================================
CREATE TABLE IF NOT EXISTS tasks (
    task_id TEXT PRIMARY KEY,
    from_agent TEXT NOT NULL,
    to_agent TEXT NOT NULL,
    task_type TEXT NOT NULL,
    priority TEXT DEFAULT 'medium',
    status TEXT DEFAULT 'created',
    context TEXT,
    objective TEXT,
    inputs TEXT, -- JSON
    outputs TEXT, -- JSON
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    FOREIGN KEY (from_agent) REFERENCES agents(agent_id),
    FOREIGN KEY (to_agent) REFERENCES agents(agent_id)
);

-- ============================================================
-- KNOWLEDGE BASE
-- ============================================================
CREATE TABLE IF NOT EXISTS knowledge (
    knowledge_id TEXT PRIMARY KEY,
    category TEXT NOT NULL, -- legislation, regulations, standards, scientific, technical, market, competitive, company, projects, lessons
    title TEXT NOT NULL,
    content TEXT,
    source TEXT,
    source_url TEXT,
    verification_status TEXT DEFAULT 'unverified', -- verified, unverified, disputed, outdated
    last_reviewed DATE,
    version TEXT DEFAULT '1.0.0',
    tags TEXT, -- JSON array
    created_by TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- OPPORTUNITIES
-- ============================================================
CREATE TABLE IF NOT EXISTS opportunities (
    opportunity_id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    sector TEXT,
    region TEXT,
    kos_score INTEGER, -- 0-100
    technical_fit INTEGER DEFAULT 0,
    market_demand INTEGER DEFAULT 0,
    revenue_potential INTEGER DEFAULT 0,
    strategic_fit INTEGER DEFAULT 0,
    urgency INTEGER DEFAULT 0,
    accessibility INTEGER DEFAULT 0,
    competition INTEGER DEFAULT 0,
    recurrence INTEGER DEFAULT 0,
    risk_inverse INTEGER DEFAULT 0,
    category TEXT, -- ignore, monitor, research, qualify, prospect, partner, propose, priority
    status TEXT DEFAULT 'detected',
    detected_by TEXT,
    assigned_to TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- MARKET SIGNALS
-- ============================================================
CREATE TABLE IF NOT EXISTS market_signals (
    signal_id TEXT PRIMARY KEY,
    signal_type TEXT NOT NULL,
    sector TEXT,
    region TEXT,
    title TEXT NOT NULL,
    description TEXT,
    relevance_score INTEGER DEFAULT 0,
    evidence TEXT,
    sources TEXT, -- JSON array
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    processed BOOLEAN DEFAULT 0,
    opportunity_id TEXT,
    FOREIGN KEY (opportunity_id) REFERENCES opportunities(opportunity_id)
);

-- ============================================================
-- PROJECTS
-- ============================================================
CREATE TABLE IF NOT EXISTS projects (
    project_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    client TEXT,
    sector TEXT,
    scope TEXT,
    status TEXT DEFAULT 'proposed',
    budget REAL,
    start_date DATE,
    end_date DATE,
    lead_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lead_agent) REFERENCES agents(agent_id)
);

-- ============================================================
-- AUDIT LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS audit_log (
    log_id INTEGER PRIMARY KEY AUTOINCREMENT,
    agent_id TEXT NOT NULL,
    action TEXT NOT NULL,
    target_type TEXT,
    target_id TEXT,
    details TEXT, -- JSON
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- ============================================================
-- WORKFLOW STATE
-- ============================================================
CREATE TABLE IF NOT EXISTS workflow_state (
    state_id TEXT PRIMARY KEY,
    workflow_name TEXT NOT NULL,
    current_stage TEXT,
    data TEXT, -- JSON blob with all workflow data
    status TEXT DEFAULT 'active',
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- MEMORY (Agent Long-term Memory)
-- ============================================================
CREATE TABLE IF NOT EXISTS agent_memory (
    memory_id TEXT PRIMARY KEY,
    agent_id TEXT NOT NULL,
    memory_type TEXT NOT NULL, -- episodic, semantic, procedural, strategic
    content TEXT NOT NULL,
    context TEXT,
    importance INTEGER DEFAULT 3, -- 1-5
    access_count INTEGER DEFAULT 0,
    last_accessed TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

-- ============================================================
-- SEED: Core Agents
-- ============================================================
INSERT OR IGNORE INTO agents (agent_id, division, department, role, authority_level) VALUES
('ceo', 'EXECUTIVE', 'CEO_INTELLIGENCE', 'Chief Executive Officer (AI)', 4),
('cto', 'EXECUTIVE', 'CTO_TECHNICAL_AUTHORITY', 'Technical Authority', 3),
('market-intelligence', 'INTELLIGENCE', 'MARKET_INTELLIGENCE', 'Market Intelligence Analyst', 1),
('opportunity-intelligence', 'INTELLIGENCE', 'OPPORTUNITY_INTELLIGENCE', 'Opportunity Intelligence Analyst', 1),
('competitive-intelligence', 'INTELLIGENCE', 'COMPETITIVE_INTELLIGENCE', 'Competitive Intelligence Analyst', 1),
('strategic-intelligence', 'INTELLIGENCE', 'STRATEGIC_INTELLIGENCE', 'Strategic Intelligence Analyst', 2),
('market-research', 'RESEARCH', 'MARKET_RESEARCH', 'Market Research Analyst', 1),
('regulatory-research', 'RESEARCH', 'REGULATORY_RESEARCH', 'Regulatory Research Analyst', 1),
('scientific-research', 'RESEARCH', 'SCIENTIFIC_RESEARCH', 'Scientific Research Analyst', 1),
('technical-research', 'RESEARCH', 'TECHNICAL_RESEARCH', 'Technical Research Analyst', 1),
('competitive-research', 'RESEARCH', 'COMPETITIVE_RESEARCH', 'Competitive Research Analyst', 1),
('technology-research', 'RESEARCH', 'TECHNOLOGY_RESEARCH', 'Technology Research Analyst', 1),
('environmental-engineer', 'ENGINEERING', 'ENVIRONMENTAL', 'Environmental Engineer', 2),
('forestry-engineer', 'ENGINEERING', 'FORESTRY', 'Forestry Engineer', 2),
('energy-engineer', 'ENGINEERING', 'ENERGY', 'Energy Engineer', 2),
('mining-engineer', 'ENGINEERING', 'MINING', 'Mining Engineer', 2),
('maritime-engineer', 'ENGINEERING', 'MARITIME_PORT', 'Maritime & Port Engineer', 2),
('safety-engineer', 'ENGINEERING', 'SAFETY', 'Safety Engineer', 2),
('gis-engineer', 'ENGINEERING', 'GIS_GEOAI', 'GIS & GeoAI Engineer', 2),
('infrastructure-engineer', 'ENGINEERING', 'INFRASTRUCTURE', 'Infrastructure Engineer', 2),
('lead-generation', 'BUSINESS_DEVELOPMENT', 'LEAD_GENERATION', 'Lead Generation Specialist', 1),
('account-intelligence', 'BUSINESS_DEVELOPMENT', 'ACCOUNT_INTELLIGENCE', 'Account Intelligence Analyst', 1),
('client-research', 'BUSINESS_DEVELOPMENT', 'CLIENT_RESEARCH', 'Client Research Analyst', 1),
('sales-strategy', 'BUSINESS_DEVELOPMENT', 'SALES_STRATEGY', 'Sales Strategy Analyst', 2),
('partnership-dev', 'BUSINESS_DEVELOPMENT', 'PARTNERSHIP_DEVELOPMENT', 'Partnership Development Manager', 2),
('proposal-strategy', 'BUSINESS_DEVELOPMENT', 'PROPOSAL_STRATEGY', 'Proposal Strategy Manager', 2),
('account-management', 'BUSINESS_DEVELOPMENT', 'ACCOUNT_MANAGEMENT', 'Account Manager', 2),
('project-manager', 'OPERATIONS', 'PROJECT_MANAGEMENT', 'Project Manager', 2),
('pmo', 'OPERATIONS', 'PMO', 'PMO Director', 3),
('scheduler', 'OPERATIONS', 'SCHEDULING', 'Scheduler', 1),
('resource-manager', 'OPERATIONS', 'RESOURCE_MANAGEMENT', 'Resource Manager', 2),
('document-controller', 'OPERATIONS', 'DOCUMENT_CONTROL', 'Document Controller', 1),
('delivery-manager', 'OPERATIONS', 'DELIVERY_MANAGEMENT', 'Delivery Manager', 2),
('software-engineer', 'TECHNOLOGY', 'SOFTWARE_ENGINEERING', 'Software Engineer', 2),
('ai-engineer', 'TECHNOLOGY', 'AI_ENGINEERING', 'AI Engineer', 2),
('llm-engineer', 'TECHNOLOGY', 'LLM', 'LLM Engineer', 2),
('agent-engineer', 'TECHNOLOGY', 'AGENT_ENGINEERING', 'Agent Engineer', 2),
('data-engineer', 'TECHNOLOGY', 'DATA_ENGINEERING', 'Data Engineer', 2),
('automation-engineer', 'TECHNOLOGY', 'AUTOMATION', 'Automation Engineer', 2),
('gis-technology', 'TECHNOLOGY', 'GIS_TECHNOLOGY', 'GIS Technology Specialist', 2),
('api-integration', 'TECHNOLOGY', 'API_INTEGRATION', 'API Integration Specialist', 2),
('cloud-engineer', 'TECHNOLOGY', 'CLOUD', 'Cloud Engineer', 2),
('cybersecurity-engineer', 'TECHNOLOGY', 'CYBERSECURITY', 'Cybersecurity Engineer', 2),
('financial-analyst', 'FINANCE', 'FINANCIAL_ANALYSIS', 'Financial Analyst', 2),
('cost-analyst', 'FINANCE', 'COST_ANALYSIS', 'Cost Analyst', 2),
('capex-opex-analyst', 'FINANCE', 'CAPEX_OPEX', 'CAPEX/OPEX Analyst', 2),
('pricing-analyst', 'FINANCE', 'PRICING', 'Pricing Analyst', 2),
('business-case-analyst', 'FINANCE', 'BUSINESS_CASE', 'Business Case Analyst', 2),
('commercial-analyst', 'FINANCE', 'COMMERCIAL_ANALYSIS', 'Commercial Analyst', 2),
('technical-review', 'QUALITY', 'TECHNICAL_REVIEW', 'Technical Reviewer', 3),
('fact-checker', 'QUALITY', 'FACT_CHECKING', 'Fact Checker', 2),
('source-verifier', 'QUALITY', 'SOURCE_VERIFICATION', 'Source Verifier', 2),
('regulatory-compliance', 'QUALITY', 'REGULATORY_COMPLIANCE', 'Regulatory Compliance Officer', 3),
('document-qa', 'QUALITY', 'DOCUMENT_QA', 'Document QA Specialist', 2),
('risk-controller', 'QUALITY', 'RISK_CONTROL', 'Risk Controller', 3);

-- ============================================================
-- SEED: Core Skills
-- ============================================================
INSERT OR IGNORE INTO skills (skill_id, category, name) VALUES
('web-research', 'shared', 'Web Research'),
('source-verification', 'shared', 'Source Verification'),
('fact-checking', 'shared', 'Fact Checking'),
('document-analysis', 'shared', 'Document Analysis'),
('data-analysis', 'shared', 'Data Analysis'),
('critical-analysis', 'shared', 'Critical Analysis'),
('technical-writing', 'shared', 'Technical Writing'),
('report-generation', 'shared', 'Report Generation'),
('regulatory-research', 'shared', 'Regulatory Research'),
('market-research', 'shared', 'Market Research'),
('competitive-intelligence', 'shared', 'Competitive Intelligence'),
('risk-analysis', 'shared', 'Risk Analysis'),
('opportunity-detection', 'shared', 'Opportunity Detection'),
('strategic-analysis', 'shared', 'Strategic Analysis'),
('project-analysis', 'shared', 'Project Analysis'),
('information-extraction', 'shared', 'Information Extraction'),
('summarization', 'shared', 'Summarization'),
('comparison-analysis', 'shared', 'Comparison Analysis'),
('evidence-analysis', 'shared', 'Evidence Analysis'),
('quality-control', 'shared', 'Quality Control'),
('environmental-licensing', 'environmental', 'Environmental Licensing'),
('environmental-audit', 'environmental', 'Environmental Audit'),
('environmental-forensics', 'environmental', 'Environmental Forensics'),
('prad', 'environmental', 'PRAD'),
('environmental-risk', 'environmental', 'Environmental Risk'),
('environmental-impact-analysis', 'environmental', 'Environmental Impact Analysis'),
('tree-assessment', 'forestry', 'Tree Assessment'),
('vegetation-inventory', 'forestry', 'Vegetation Inventory'),
('forest-restoration', 'forestry', 'Forest Restoration'),
('vegetation-suppression-analysis', 'forestry', 'Vegetation Suppression Analysis'),
('solar-pv', 'energy', 'Solar PV'),
('solar-thermal', 'energy', 'Solar Thermal'),
('energy-efficiency', 'energy', 'Energy Efficiency'),
('energy-feasibility', 'energy', 'Energy Feasibility'),
('power-infrastructure', 'energy', 'Power Infrastructure'),
('mineral-intelligence', 'mining', 'Mineral Intelligence'),
('mineralogy', 'mining', 'Mineralogy'),
('geological-analysis', 'mining', 'Geological Analysis'),
('mining-opportunity-analysis', 'mining', 'Mining Opportunity Analysis'),
('mining-regulatory-analysis', 'mining', 'Mining Regulatory Analysis'),
('imo-compliance', 'maritime', 'IMO Compliance'),
('marpol-compliance', 'maritime', 'MARPOL Compliance'),
('oprc-plan', 'maritime', 'OPRC Plan'),
('maritime-single-window', 'maritime', 'Maritime Single Window'),
('port-community-system', 'maritime', 'Port Community System'),
('maritime-intelligence', 'maritime', 'Maritime Intelligence'),
('port-analysis', 'maritime', 'Port Analysis'),
('qgis-operations', 'gis', 'QGIS Operations'),
('spatial-analysis', 'gis', 'Spatial Analysis'),
('remote-sensing', 'gis', 'Remote Sensing'),
('ndvi-analysis', 'gis', 'NDVI Analysis'),
('geospatial-risk', 'gis', 'Geospatial Risk'),
('geoai', 'gis', 'GeoAI');

-- ============================================================
-- SEED: Agent-Skill Mappings (key examples)
-- ============================================================
INSERT OR IGNORE INTO agent_skills (agent_id, skill_id, skill_type) VALUES
('ceo', 'strategic-analysis', 'core'),
('ceo', 'opportunity-detection', 'core'),
('ceo', 'risk-analysis', 'core'),
('ceo', 'critical-analysis', 'core'),
('ceo', 'market-research', 'professional'),
('cto', 'technical-writing', 'core'),
('cto', 'quality-control', 'core'),
('cto', 'source-verification', 'core'),
('cto', 'fact-checking', 'core'),
('cto', 'evidence-analysis', 'core'),
('environmental-engineer', 'web-research', 'core'),
('environmental-engineer', 'source-verification', 'core'),
('environmental-engineer', 'document-analysis', 'core'),
('environmental-engineer', 'technical-writing', 'core'),
('environmental-engineer', 'environmental-licensing', 'professional'),
('environmental-engineer', 'environmental-audit', 'professional'),
('environmental-engineer', 'prad', 'professional'),
('environmental-engineer', 'environmental-risk', 'professional'),
('energy-engineer', 'web-research', 'core'),
('energy-engineer', 'data-analysis', 'core'),
('energy-engineer', 'technical-writing', 'core'),
('energy-engineer', 'solar-pv', 'professional'),
('energy-engineer', 'solar-thermal', 'professional'),
('energy-engineer', 'energy-efficiency', 'professional'),
('energy-engineer', 'energy-feasibility', 'professional'),
('mining-engineer', 'web-research', 'core'),
('mining-engineer', 'data-analysis', 'core'),
('mining-engineer', 'technical-writing', 'core'),
('mining-engineer', 'mineral-intelligence', 'professional'),
('mining-engineer', 'mineralogy', 'professional'),
('mining-engineer', 'geological-analysis', 'professional'),
('mining-engineer', 'mining-opportunity-analysis', 'professional'),
('maritime-engineer', 'web-research', 'core'),
('maritime-engineer', 'document-analysis', 'core'),
('maritime-engineer', 'technical-writing', 'core'),
('maritime-engineer', 'imo-compliance', 'professional'),
('maritime-engineer', 'marpol-compliance', 'professional'),
('maritime-engineer', 'port-analysis', 'professional'),
('gis-engineer', 'data-analysis', 'core'),
('gis-engineer', 'document-analysis', 'core'),
('gis-engineer', 'qgis-operations', 'professional'),
('gis-engineer', 'spatial-analysis', 'professional'),
('gis-engineer', 'remote-sensing', 'professional'),
('gis-engineer', 'ndvi-analysis', 'professional'),
('gis-engineer', 'geoai', 'professional'),
('market-intelligence', 'web-research', 'core'),
('market-intelligence', 'market-research', 'core'),
('market-intelligence', 'competitive-intelligence', 'core'),
('market-intelligence', 'data-analysis', 'core'),
('opportunity-intelligence', 'opportunity-detection', 'core'),
('opportunity-intelligence', 'risk-analysis', 'core'),
('opportunity-intelligence', 'strategic-analysis', 'core'),
('proposal-strategy', 'strategic-analysis', 'core'),
('proposal-strategy', 'project-analysis', 'core'),
('proposal-strategy', 'technical-writing', 'professional'),
('technical-review', 'quality-control', 'core'),
('technical-review', 'fact-checking', 'core'),
('technical-review', 'source-verification', 'core'),
('technical-review', 'evidence-analysis', 'core');
