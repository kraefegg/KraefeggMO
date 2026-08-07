-- ============================================================================
-- Kraefegg M.O. — dados iniciais (dev/demo) alinhados ao HQ e ao plano
-- operacional. Reexecutável: limpa o schema e reinsere tudo.
-- Uso: psql -f seed.sql
-- ============================================================================

BEGIN;

SET search_path TO kraefegg, public;

-- limpa todas as tabelas do schema (identities reiniciam em 1)
DO $$
DECLARE r record;
BEGIN
    FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'kraefegg'
    LOOP
        EXECUTE format('TRUNCATE TABLE kraefegg.%I RESTART IDENTITY CASCADE', r.tablename);
    END LOOP;
END $$;

-- ============================================================================
-- NÚCLEO: áreas, agentes, fases
-- ============================================================================

INSERT INTO areas_departamento (id, codigo, nome, cor, descricao) VALUES
    (1, 'exec', 'Executivos',                     '#f2c94c', 'Direção e estratégia'),
    (2, 'orc',  'Orquestração',                   '#ff6b6b', 'Coordenação executiva multiagente'),
    (3, 'eng',  'Engenharia & Dados',             '#4dabf7', 'Software, dados, IoT, nuvem'),
    (4, 'amb',  'Ambiental & Segurança',          '#51cf66', 'Licenciamento, perícia, SST'),
    (5, 'min',  'Mineração & Civil',              '#ffa94d', 'Lavra, mineralogia, geotecnia, mecânica'),
    (6, 'ene',  'Energia & Offshore',             '#22d3ee', 'Renováveis, elétrica, offshore, naval'),
    (7, 'com',  'Comercial & Suporte',            '#94d82d', 'Vendas, finanças, jurídico, RH'),
    (8, 'pes',  'Pesquisa & Inovação',            '#b197fc', 'Acadêmico, P&D, validação científica'),
    (9, 'seg',  'Cybersegurança & Consultoria',   '#f06595', 'Segurança da informação e consultoria');

INSERT INTO agentes (id, codigo, nome, cargo, area_id, funcao, especialidade, modelo_ia) VALUES
    (1,  'ceo',                    'CEO',                    'Diretor Executivo',         1, 'Gestão, receita, governança',                'Estratégia e decisão final',          'omniroute/auto/best-reasoning'),
    (2,  'cto',                    'CTO',                    'Diretor de Tecnologia',     1, 'Arquitetura, IoT, dados, segurança',         'Arquitetura e produtos técnicos',     'omniroute/auto/best-reasoning'),
    (3,  'market-segment',         'Segmento de Mercado',    'Diretor de Segmento',       1, 'Comercial, precificação, prospecção',        'Posicionamento, preço e funil',       'omniroute/auto/best-reasoning'),
    (4,  'orchestrator',           'Orquestrador',           'Coordenação Executiva',     2, 'Gestão multiagente',                        'Roteia e consolida entregas',         'omniroute/auto/best-reasoning'),
    (5,  'engineering-dev',        'Engenharia & Dev',       'Engenheiro de Software',    3, 'Web, APIs, GitHub, CI/CD',                  'Automação, infra, integrações',       'omniroute/auto/best-coding'),
    (6,  'data-analytics',         'Data & Analytics',       'Analista de Dados',         3, 'SQL, BI, Spark',                            'Oracle, pipelines, Databricks',       'omniroute/auto/best-coding'),
    (7,  'ai-ml',                  'IA & Machine Learning',  'Cientista de Dados',        3, 'ML, LLM, RAG',                              'Modelos, prompts, agentes',           'omniroute/auto/best-reasoning'),
    (8,  'fullstack-dev',          'Fullstack',              'Desenvolvedor Fullstack',   3, 'Produtos digitais, APIs',                   'Python, Angular, Java, JS, HTML5',    'omniroute/auto/best-coding'),
    (9,  'data-engineering',       'Data Engineering',       'Engenheiro de Dados',       3, 'Pipelines, modelagem',                      'ETL/ELT, qualidade, camadas',         'omniroute/auto/best-coding'),
    (10, 'iot-embedded',           'IoT · Edge · Embedded',  'Engenheiro Embarcado',      3, 'Hardware, edge AI, telemetria',             'MicroPython, ESP32, firmware, LoRa',  'omniroute/auto/best-coding'),
    (11, 'automation',             'Automação & RPA',        'Especialista em Automação', 3, 'Python, RPA, integrações',                  'Automação de processos, CI/CD',       'omniroute/auto/best-coding'),
    (12, 'cloud-infrastructure',   'Cloud Azure/AWS',        'Arquiteto de Nuvem',        3, 'Terraform, Docker, nuvem',                  'DevOps, IaC, Kubernetes, FinOps',     'omniroute/auto/best-coding'),
    (13, 'environmental-engineering', 'Engenharia Ambiental', 'Engenheiro Ambiental',     4, 'EIA/RIMA, sensoriamento remoto',            'Licenciamento, RAD/PRAD, monitoramento','omniroute/auto/best-reasoning'),
    (14, 'environmental-forensic-audit', 'Perícia & Auditoria', 'Perito Ambiental',       4, 'NDVI forense, laudos',                      'Perícia, auditoria, datação de danos', 'omniroute/auto/best-reasoning'),
    (15, 'safety-engineering',     'Segurança do Trabalho',  'Engenheiro de Segurança',   4, 'NR-15/16, IBUTG, SST',                      'NRs, PGR/LTCAT, telemetria',          'omniroute/auto/best-reasoning'),
    (16, 'mining',                 'Mineração & Lavra',      'Engenheiro de Minas',       5, 'Reservas, sequenciamento',                  'Planejamento de mina, lavra',         'omniroute/auto/best-reasoning'),
    (17, 'mineralogy',             'Mineralogia',            'Geólogo',                   5, 'DRX/FRX, espectroscopia',                   'Caracterização de minérios',          'omniroute/auto/best-reasoning'),
    (18, 'civil-engineering',      'Civil & Geotecnia',      'Engenheiro Civil',          5, 'Geotecnia, SPT, contenções',                'Estruturas, taludes, barragens',      'omniroute/auto/best-reasoning'),
    (19, 'mechanical-engineering', 'Engenharia Mecânica',    'Engenheiro Mecânico',       5, 'Elementos finitos, vibração',               'Estruturas, máquinas, manutenção',    'omniroute/auto/best-reasoning'),
    (20, 'renewable-energy',       'Energias Renováveis',    'Engenheiro de Energia',     6, 'Previsão de geração, O&M',                  'Solar, eólica, eficiência',           'omniroute/auto/best-reasoning'),
    (21, 'energy-engineering',     'Engenharia de Energia',  'Engenheiro Eletricista',    6, 'Subestações, baterias, NR-10',              'Sistemas elétricos, armazenamento',   'omniroute/auto/best-reasoning'),
    (22, 'offshore-specialists',   'Especialistas Offshore', 'Especialista Offshore',     6, 'Corrosão, integridade',                     'Operações, inspeção, HSE',            'omniroute/auto/best-reasoning'),
    (23, 'naval-engineering',      'Engenharia Naval',       'Engenheiro Naval',          6, 'Embarcações, casco',                        'Projeto naval e estruturas marítimas','omniroute/auto/best-reasoning'),
    (24, 'commercial',             'Comercial & Marketing',  'Analista Comercial',        7, 'Copywriting, LinkedIn',                     'Conteúdo técnico-comercial',          'omniroute/auto/best-reasoning'),
    (25, 'client-prospecting',     'Prospecção de Clientes', 'Prospector',                7, '40 alvos, campanhas',                       'Funil comercial, prospecção ativa',   'omniroute/auto/best-reasoning'),
    (26, 'contracts-business',     'Contratos & Negócios',   'Gestor de Contratos',       7, 'Contratos de serviço/SaaS',                 'Minutas, negociação, fechamento',     'omniroute/auto/best-reasoning'),
    (27, 'finance',                'Finanças & Orçamento',   'Analista Financeiro',       7, 'Modelo de receita',                         'Precificação, fluxo de caixa',        'omniroute/auto/best-reasoning'),
    (28, 'accounting',             'Contabilidade & Tributos','Contador',                 7, 'CNPJ, tributos',                            'Contabilidade, obrigações fiscais',   'omniroute/auto/best-reasoning'),
    (29, 'legal-compliance',       'Jurídico & LGPD',        'Advogado',                  7, 'Contratos, privacidade',                    'Jurídico, LGPD, conformidade',        'omniroute/auto/best-reasoning'),
    (30, 'hr-ops',                 'RH & Operações',         'Gestor de Pessoas',         7, 'Gestão de equipe',                          'Pessoas e operações internas',        'omniroute/auto/best-reasoning'),
    (31, 'secretary',              'Secretariado',           'Assistente Administrativo', 7, 'Atas, documentos',                          'Documentos e agenda administrativa',  'omniroute/auto/best-reasoning'),
    (32, 'analysts',               'Analistas',              'Analista',                  7, 'Pesquisa de mercado',                       'Estudos de mercado e análises',       'omniroute/auto/best-reasoning'),
    (33, 'project-developers',     'Gestão de Projetos',     'Gerente de Projetos',       7, 'PMO, entregas',                             'Gestão multidisciplinar de projetos', 'omniroute/auto/best-reasoning'),
    (34, 'research-scientist',     'Pesquisa Científica',    'Pesquisador',               8, 'Sensoriamento, estatística',                'Métodos, artigos e P&D',              'omniroute/auto/best-reasoning'),
    (35, 'research-academic',      'Pesquisa Avançada',      'Pesquisador Sênior',        8, 'Revisão por pares, laudos',                 'PhDs, médicos, mestres',              'omniroute/auto/best-reasoning'),
    (36, 'cybersecurity',          'Cybersegurança',         'Analista de Segurança',     9, 'Pentest, SOC, LGPD/ISO 27001',              'White Hat · Blue Team · Red Team',    'omniroute/auto/best-reasoning'),
    (37, 'consultants',            'Consultoria',            'Consultor Sênior',          9, 'Diagnósticos e pareceres',                  'Consultores seniores multidisciplinares','omniroute/auto/best-reasoning');

INSERT INTO fases (id, codigo, nome, ordem, cor) VALUES
    (1, 'backlog',   'Backlog',     1, '#8ea3c6'),
    (2, 'analise',   'Em análise',  2, '#f2c94c'),
    (3, 'execucao',  'Em execução', 3, '#22d3ee'),
    (4, 'revisao',   'Em revisão',  4, '#b197fc'),
    (5, 'concluida', 'Concluída',   5, '#51cf66');

-- ============================================================================
-- CATÁLOGO: segmentos, categorias, kits
-- ============================================================================

INSERT INTO segmentos_mercado (id, codigo, nome) VALUES
    (1, 'mineracao', 'Mineração'),
    (2, 'energia',   'Energias Renováveis'),
    (3, 'ambiental', 'Engenharia Ambiental'),
    (4, 'agro',      'Agronegócio'),
    (5, 'sst',       'Segurança do Trabalho'),
    (6, 'governo',   'Setor Público'),
    (7, 'offshore',  'Offshore');

INSERT INTO categorias_lancamento (id, codigo, nome, tipo) VALUES
    (1, 'servicos',       'Serviços de engenharia', 'receita'),
    (2, 'assinaturas',    'Assinaturas de monitoramento', 'receita'),
    (3, 'kits',           'Venda de kits IoT', 'receita'),
    (4, 'infraestrutura', 'Infraestrutura e ferramentas', 'despesa'),
    (5, 'pessoal',        'Pessoal', 'despesa'),
    (6, 'campo',          'Campo e logística', 'despesa'),
    (7, 'marketing',      'Marketing e prospecção', 'despesa'),
    (8, 'tributos',       'Tributos e contabilidade', 'despesa');

INSERT INTO kits (id, codigo, nome, descricao, custo_bom, preco_venda, recorrencia_servico) VALUES
    (1, 'KIT-EST', 'Estação Meteorológica', 'ESP32-S3 + sensores de clima, energia solar, LoRa/MQTT',     2100.00, 3500.00, 'mensal'),
    (2, 'KIT-SOLO', 'Umidade de Solo',      'Sensores capacitivos para parâmetros de solo (irrigação)',   800.00,  1500.00, 'mensal'),
    (3, 'KIT-RIO', 'Datalogger de Rio',     'Nível e qualidade d''água para monitoramento de rios',        950.00,  1800.00, 'mensal'),
    (4, 'KIT-AQI', 'Qualidade do Ar',       'Material particulado (PM2.5/PM10) e AQI',                   1300.00, 2400.00, 'mensal');

-- ============================================================================
-- CRM: clientes, contatos, interações
-- ============================================================================

INSERT INTO clientes (id, razao_social, nome_fantasia, documento, segmento_id, cidade, uf, status, fonte, valor_estimado, observacoes) VALUES
    (1, 'Prefeitura Municipal de Caraúbas', 'Prefeitura de Caraúbas', '08.153.015/0001-26', 6, 'Caraúbas', 'PB', 'negociacao', 'Prospecção ativa (tracker)', 25000.00, 'PRAD/recuperação de áreas degradadas — condicionante SUDEMA'),
    (2, 'Usina Eólica Serra Branca S.A.',   'Serra Branca',           '12.344.887/0001-90', 2, 'Serra Branca', 'PB', 'contatado', 'Segmento energia', 40000.00, 'Compensação ambiental de parques eólicos'),
    (3, 'Pedreira São José LTDA',           'Pedreira São José',      '09.532.771/0001-45', 1, 'São José do Sabugi', 'PB', 'prospecto', 'Indicação', 15000.00, 'Licenciamento e condicionantes de lavra'),
    (4, 'CEREST Regional de Patos',         'CEREST Patos',           '10.298.550/0001-77', 5, 'Patos', 'PB', 'prospecto', 'Rede SST', 12000.00, 'Parceria PGR/LTCAT + NRs (tracker item 22)'),
    (5, 'Agro Vale do Piranhas Ltda.',      'Agro Vale',              '07.412.885/0001-32', 4, 'São Bento', 'PB', 'reuniao_marcada', 'Indicação', 18000.00, 'Irrigação/umidade de solo e clima'),
    (6, 'Banco do Nordeste do Brasil S.A.', 'BNB',                    '07.234.355/0001-45', 6, 'Campina Grande', 'PB', 'proposta', 'Rede', 18000.00, 'Laudo de passivo ambiental para financiamento rural');

INSERT INTO contatos (id, cliente_id, nome, cargo, email, whatsapp, canal_preferido) VALUES
    (1, 1, 'Maria das Graças',  'Secretária de Meio Ambiente', 'meioambiente@caráubas.pb.gov.br', '(83) 99600-0001', 'email'),
    (2, 1, 'João Batista',      'Secretário de Obras',         'obras@caráubas.pb.gov.br',        '(83) 99600-0002', 'whatsapp'),
    (3, 2, 'Fernanda Lopes',    'Gerente Ambiental',           'f.lopes@serrabranca.com.br',      '(83) 99800-0001', 'email'),
    (4, 3, 'Carlos Souza',      'Sócio-Gerente',               'carlos@pedreirasa.eng.br',        '(83) 99700-0001', 'whatsapp'),
    (5, 4, 'Dra. Antônia Reis', 'Coordenadora CEREST',         'cerest.patos@sespb.pb.gov.br',    '(83) 99500-0001', 'email'),
    (6, 5, 'Raimundo Neto',     'Proprietário',                'neto@agrovale.agr.br',            '(83) 99400-0001', 'whatsapp'),
    (7, 6, 'Paulo Henrique',    'Gerente de Crédito Rural',    'paulo.h@bnb.gov.br',              '(83) 99300-0001', 'email'),
    (8, 6, 'Luciana Martins',   'Analista Ambiental',          'luciana.m@bnb.gov.br',            '(83) 99300-0002', 'email');

INSERT INTO interacoes (id, contato_id, canal, sentido, descricao, proximo_passo, data_agendada, status) VALUES
    (1, 1, 'email', 'outbound', 'Apresentação institucional e proposta de PRAD', 'Reunião de escopo com secretaria', '2026-08-10 10:00', 'agendada'),
    (2, 3, 'email', 'outbound', 'Material de compensação ambiental de parques', 'Follow-up em 7 dias', NULL, 'aberto'),
    (3, 6, 'whatsapp', 'inbound', 'Interesse em umidade de solo para irrigação', 'Enviar proposta técnica', '2026-08-08 14:00', 'agendada'),
    (4, 7, 'email', 'outbound', 'Laudo de passivo ambiental com datação NDVI', 'Aguardando retorno do comitê de crédito', NULL, 'aberto');

-- ============================================================================
-- PROPOSTAS, ITENS, CONTRATOS, COBRANÇAS
-- ============================================================================

INSERT INTO propostas (id, numero, cliente_id, titulo, escopo, valor_total, status, data_envio, validade_dias, responsavel_id) VALUES
    (1, 'P-2026-001', 1, 'PRAD Caraúbas — recuperação de áreas degradadas',
     '{"servicos": ["Elaboração de PRAD (RAD + recuperação)", "Monitoramento NDVI trimestral"], "prazo": "90 dias"}',
     25000.00, 'em_negociacao', '2026-08-01', 15, 3),
    (2, 'P-2026-002', 6, 'Laudo de passivo ambiental — datação por NDVI',
     '{"servicos": ["Perícia de passivo", "Laudo técnico com anexos"]}', 18000.00, 'enviada', '2026-08-03', 20, 14),
    (3, 'P-2026-003', 5, 'Assinatura de monitoramento geoambiental + kit',
     '{"servicos": ["Kit estação meteorológica", "Monitoramento contínuo mensal"]}', 11900.00, 'aprovada', '2026-07-28', 15, 26);

INSERT INTO itens_proposta (id, proposta_id, descricao, tipo, quantidade, valor_unitario, recorrencia) VALUES
    (1, 1, 'Elaboração do PRAD (RAD + projeto de recuperação)', 'servico', 1, 18000.00, 'unico'),
    (2, 1, 'Relatórios de monitoramento NDVI trimestrais',       'assinatura', 3, 2000.00, 'trimestral'),
    (3, 1, 'Acompanhamento técnico mensal',                      'assinatura', 12, 500.00, 'mensal'),
    (4, 2, 'Perícia de passivo ambiental (datação por NDVI)',    'servico', 1, 15000.00, 'unico'),
    (5, 2, 'Laudo técnico + anexos',                             'servico', 1, 3000.00, 'unico'),
    (6, 3, 'Kit Estação Meteorológica + instalação',             'kit', 1, 3500.00, 'unico'),
    (7, 3, 'Monitoramento contínuo (assinatura mensal)',         'assinatura', 12, 700.00, 'mensal');

INSERT INTO contratos (id, numero, proposta_id, cliente_id, data_inicio, data_fim, valor_total, recorrencia, sla) VALUES
    (1, 'C-2026-001', 3, 5, '2026-08-01', '2027-07-31', 11900.00, 'mensal',
     '{"disponibilidade": "99%", "latencia_alerta": "15 min", "manutencao": "preventiva trimestral"}'),
    (2, 'C-2026-002', 1, 1, '2026-08-15', '2026-11-30', 25000.00, 'unico',
     '{"entregaveis": ["RAD", "PRAD aprovado SUDEMA"], "marco": "30 dias"}');

INSERT INTO cobrancas (id, contrato_id, parcela, competencia, descricao, valor, vencimento, status, data_pagamento, metodo) VALUES
    (1, 1, 1, '2026-08-01', 'Kit estação meteorológica + instalação', 3500.00, '2026-08-10', 'paga', '2026-08-08', 'pix'),
    (2, 1, 2, '2026-09-01', 'Assinatura monitoramento — set/26',       700.00, '2026-09-10', 'aberta', NULL, NULL),
    (3, 2, 1, '2026-08-01', 'PRAD Caraúbas — entrada',               12500.00, '2026-09-15', 'aberta', NULL, NULL),
    (4, 2, 2, '2026-11-01', 'PRAD Caraúbas — saldo (marco SUDEMA)',  12500.00, '2026-11-15', 'aberta', NULL, NULL);

-- ============================================================================
-- PROJETOS, DEMANDAS, ETAPAS
-- ============================================================================

INSERT INTO projetos (id, codigo, nome, descricao, cliente_id, contrato_id, responsavel_id, status, prioridade, progresso, data_fim) VALUES
    (1, 'PRJ-2026-001', 'PRAD Caraúbas-PB', 'Recuperação de áreas degradadas — condicionante SUDEMA', 1, 2, 13, 'execucao', 'alta', 60, '2026-11-30'),
    (2, 'PRJ-2026-002', 'Prospecção 30-90 dias', 'Funil comercial: 40 contatos, reuniões e propostas', NULL, NULL, 25, 'execucao', 'alta', 75, '2026-09-30'),
    (3, 'PRJ-2026-003', 'PoC M1 — telemetria IoT', 'Estação meteorológica: firmware, bridge e integração', NULL, NULL, 10, 'concluido', 'alta', 100, '2026-08-05'),
    (4, 'PRJ-2026-004', 'Pipeline NDVI automático', 'Coleta programada Sentinel-2 (repo kraefegg/AIO)', NULL, NULL, 9, 'backlog', 'media', 0, '2026-08-25'),
    (5, 'PRJ-2026-005', 'Dashboard geração solar', 'Cliente-piloto: séries de geração e economia', 5, 1, 20, 'backlog', 'media', 0, '2026-08-22');

-- fases/progresso seguem o HQ (fase 'concluida' força progresso=100 no trigger)
INSERT INTO demandas (id, projeto_id, codigo, titulo, descricao, area_id, responsavel_id, fase, prioridade, progresso, prazo) VALUES
    (1, 1, 'D-01', 'Proposta PRAD Caraúbas-PB (SUDEMA) — consolidação da oferta', 'Fechar escopo, preço e cronograma; envolver finance e market-segment.', 4, 13, 'execucao', 'alta', 60, '2026-08-15'),
    (2, NULL, 'D-02', 'Laudo de passivo ambiental para instituição financeira', 'Diagnóstico com datação por NDVI; aplicável a financiamento/crédito rural.', 4, 14, 'analise', 'media', 30, '2026-08-18'),
    (3, 2, 'D-03', 'Campanha de prospecção — 40 contatos do tracker (dias 0-30)', 'Sequenciar e-mails/WhatsApp, agendar reuniões, registrar no tracker.', 7, 25, 'execucao', 'alta', 75, '2026-08-12'),
    (4, NULL, 'D-04', 'Minuta de contrato de assinatura de monitoramento contínuo', 'Modelo SaaS recorrente com SLAs e reajuste.', 7, 26, 'revisao', 'alta', 90, '2026-08-10'),
    (5, 3, 'D-05', 'PoC M1 — telemetria IoT da estação meteorológica', 'Contrato de telemetria, firmware MicroPython (ESP32-S3) e bridge MQTT→JSON.', 3, 10, 'concluida', 'alta', 100, '2026-08-05'),
    (6, 4, 'D-06', 'Pipeline automático de NDVI (Zenodo/GitHub → dataset versionado)', 'Coleta programada das séries Sentinel-2 com validação e camadas.', 3, 9, 'backlog', 'media', 0, '2026-08-25'),
    (7, NULL, 'D-07', 'Precificação dos kits IoT e fluxo de caixa 90 dias', 'BOM + instalação + assinatura; modelo de receita e ponto de equilíbrio.', 7, 27, 'analise', 'alta', 40, '2026-08-14'),
    (8, NULL, 'D-08', 'LGPD e minuta de NDA/confidencialidade', 'Revisar fluxo de dados (Open-Meteo/INPE/GitHub) e NDA para reuniões.', 7, 29, 'revisao', 'media', 80, '2026-08-11'),
    (9, NULL, 'D-09', 'Red Team — teste de segurança do HQ e do AIO Observatory', 'Revisão de vetores: CDNs, telemetria, localStorage, headers.', 9, 36, 'backlog', 'media', 0, '2026-08-20'),
    (10, NULL, 'D-10', 'Artigo técnico — monitoramento do PRAD por sensoriamento remoto', 'Método NDVI/NDWI para restauração da Caatinga; preprint + dataset.', 8, 35, 'analise', 'baixa', 20, '2026-08-30'),
    (11, NULL, 'D-11', 'HQ 3D — módulo de demandas e fases das atividades', 'Painel de gestão no corporate-hq.html com persistência em localStorage.', 3, 5, 'execucao', 'alta', 50, '2026-08-09'),
    (12, 5, 'D-12', 'Dashboard de geração solar para cliente-piloto', 'Séries de geração com economia em tarifa horária e relatório mensal.', 6, 20, 'backlog', 'media', 0, '2026-08-22');

INSERT INTO etapas_projeto (id, projeto_id, nome, ordem, peso, status, data_prevista) VALUES
    (1, 1, 'Levantamento de campo e baseline',  1, 25, 'concluido', '2026-08-10'),
    (2, 1, 'Diagnóstico e mapeamento das áreas', 2, 25, 'execucao', '2026-08-25'),
    (3, 1, 'Projeto de recuperação (PRAD)',     3, 30, 'analise',  '2026-09-30'),
    (4, 1, 'Acompanhamento e relatórios',       4, 20, 'backlog',  '2026-11-15');

-- ============================================================================
-- MONITORAMENTO & TELEMETRIA
-- ============================================================================

INSERT INTO sites (id, codigo, nome, tipo, cliente_id, contrato_id, latitude, longitude, municipio, uf, status, data_instalacao) VALUES
    (1, 'STA-M1', 'Estação Meteorológica — PoC M1', 'estacao_meteorologica', NULL, NULL, -6.979722, -37.809444, 'Caraúbas', 'PB', 'ativo', '2026-07-20'),
    (2, 'PAR-01', 'Parcela PRAD Norte',              'parcela_ndvi', 1, 2, -7.005000, -37.830000, 'Caraúbas', 'PB', 'ativo', '2026-07-25'),
    (3, 'PAR-02', 'Parcela PRAD Sul',                'parcela_ndvi', 1, 2, -7.022000, -37.795000, 'Caraúbas', 'PB', 'ativo', '2026-07-25'),
    (4, 'SOL-01', 'Umidade de Solo — Agro Vale',     'umidade_solo', 5, 1, -6.501000, -37.455000, 'São Bento', 'PB', 'ativo', '2026-08-01'),
    (5, 'RIO-01', 'Datalogger Rio Piranhas',         'datalogger_rio', NULL, NULL, -6.887000, -37.920000, 'Caraúbas', 'PB', 'manutencao', '2026-06-10');

INSERT INTO sensores (id, site_id, codigo, nome, grandeza, unidade, modelo, fabricante) VALUES
    (1, 1, 'TEMP-01', 'Temperatura do ar',      'temperatura',      '°C',    'SHT31',    'Sensirion'),
    (2, 1, 'UMID-01', 'Umidade relativa',       'umidade_rel',      '%',     'SHT31',    'Sensirion'),
    (3, 1, 'PRESS-01','Pressão atmosférica',    'pressao',          'hPa',   'BMP280',   'Bosch'),
    (4, 1, 'VENT-01', 'Velocidade do vento',    'velocidade_vento', 'm/s',   'Anemômetro de copo', 'GENERIC'),
    (5, 1, 'CHUV-01', 'Precipitação',           'precipitacao',     'mm',    'Báscula 0,2mm', 'GENERIC'),
    (6, 1, 'RAD-01',  'Radiação solar',         'radiacao',         'W/m²',  'Piranômetro', 'GENERIC'),
    (7, 4, 'SOLO-01', 'Umidade do solo',        'umidade_solo',     '%',     'Capacitivo', 'GENERIC'),
    (8, 5, 'NIV-01',  'Nível do rio',           'nivel_rio',        'cm',    'Ultrassônico', 'GENERIC');

-- temperatura horária (01/08/2026) — ciclo diurno determinístico
INSERT INTO leituras (sensor_id, instante, valor)
SELECT 1, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       22 + 6 * sin(gs * 0.3) + (gs % 3)
FROM generate_series(0, 23) AS gs;

INSERT INTO leituras (sensor_id, instante, valor)
SELECT 2, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       55 + 12 * cos(gs * 0.25)
FROM generate_series(0, 23) AS gs;

INSERT INTO leituras (sensor_id, instante, valor)
SELECT 3, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       1012 + (gs % 5)
FROM generate_series(0, 23) AS gs;

INSERT INTO leituras (sensor_id, instante, valor)
SELECT 4, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       round((3.2 + abs(sin(gs)))::numeric, 2)
FROM generate_series(0, 23) AS gs;

INSERT INTO leituras (sensor_id, instante, valor)
SELECT 5, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       CASE WHEN gs IN (14, 15) THEN 8 ELSE 0 END
FROM generate_series(0, 23) AS gs;

INSERT INTO leituras (sensor_id, instante, valor)
SELECT 6, '2026-08-01 00:00'::timestamptz + gs * interval '1 hour',
       round(GREATEST(0, 700 * sin((gs - 6) * 0.26))::numeric, 2)
FROM generate_series(0, 23) AS gs;

-- solo (leituras diárias) e rio (3 amostras)
INSERT INTO leituras (sensor_id, instante, valor) VALUES
    (7, '2026-08-01 06:00', 24.5),
    (7, '2026-08-01 12:00', 23.1),
    (7, '2026-08-02 06:00', 24.8),
    (8, '2026-08-01 06:00', 45.0),
    (8, '2026-08-01 12:00', 47.2),
    (8, '2026-08-02 06:00', 46.0);

-- amostras com qualidade ruim para exercitar o pipeline
INSERT INTO leituras (sensor_id, instante, valor, qualidade) VALUES
    (1, '2026-08-02 03:00', -9.99, 'invalida'),
    (4, '2026-08-02 05:00', 41.20, 'suspeita');

-- séries NDVI mensais (real, Sentinel-2) com sazonalidade da Caatinga
INSERT INTO series_indices (site_id, indice, data, valor, origem, fonte)
SELECT 2, 'ndvi', gs::date, round((0.25 + 0.12 * sin(extract(month FROM gs)))::numeric, 4), 'real', 'Sentinel-2 (kraefegg/AIO)'
FROM generate_series('2025-01-01'::date, '2026-07-01'::date, interval '1 month') AS gs;

INSERT INTO series_indices (site_id, indice, data, valor, origem, fonte)
SELECT 3, 'ndvi', gs::date, round((0.20 + 0.10 * sin(extract(month FROM gs)))::numeric, 4), 'real', 'Sentinel-2 (kraefegg/AIO)'
FROM generate_series('2025-01-01'::date, '2026-07-01'::date, interval '1 month') AS gs;

-- demais índices continuam modelo (sem export numérico ainda)
INSERT INTO series_indices (site_id, indice, data, valor, origem, fonte)
SELECT 2, x.indice, '2026-07-01'::date, x.valor, 'modelo', 'Modelo Kraefegg (sem export numérico)'
FROM (VALUES ('ndwi', 0.1800), ('umidade', 0.2200), ('bsi', 0.3000)) AS x(indice, valor);

-- focos de queimada (INPE) e previsão (Open-Meteo)
INSERT INTO eventos_inpe (data_hora, latitude, longitude, frp, bioma, municipio, uf) VALUES
    ('2026-08-01 13:20', -6.912, -37.855, 14.3, 'Caatinga', 'Caraúbas', 'PB'),
    ('2026-08-01 14:05', -6.931, -37.899, 9.8,  'Caatinga', 'Caraúbas', 'PB'),
    ('2026-07-29 11:40', -7.050, -37.700, 22.1, 'Caatinga', 'Caraúbas', 'PB');

INSERT INTO dados_climaticos (site_id, instante_previsao, horario, temperatura, umidade, velocidade_vento, direcao_vento, precipitacao, radiacao) VALUES
    (1, now(), now() + interval '3 hours', 31.5, 42.0, 4.2, 120, 0.0, 820.0),
    (1, now(), now() + interval '6 hours', 33.1, 38.0, 4.8, 130, 0.0, 910.0),
    (1, now(), now() + interval '9 hours', 34.0, 35.0, 5.1, 135, 0.0, 980.0);

INSERT INTO alertas (site_id, tipo, severidade, mensagem, acao_recomendada) VALUES
    (1, 'queimada',    'critica', 'Foco de queimada a ~8 km da estação (FRP 14,3)', 'Verificar focos INPE e acionar defesa civil se necessário'),
    (2, 'seca',        'alta',    'NDVI 3 meses abaixo do esperado para a estação', 'Revisar plano de irrigação/plantio da parcela'),
    (5, 'cheia',       'media',   'Nível do rio subiu 22 cm em 12h',                'Monitorar vazante e pluviometria'),
    (4, 'qualidade_ar','baixa',   'Estação em manutenção — dados de vento suspeitos','Concluir manutenção preventiva do anemômetro');

-- ============================================================================
-- FINANCEIRO: lançamentos, vendas, custos
-- ============================================================================

INSERT INTO lancamentos (id, data, tipo, categoria_id, descricao, valor, forma_pagamento, contrato_id, projeto_id, status) VALUES
    (1, '2026-08-08', 'receita', 3, 'Venda kit estação (C-2026-001 / cobrança 1)', 3500.00, 'pix', 1, 3, 'realizado'),
    (2, '2026-09-10', 'receita', 2, 'Assinatura monitoramento — set/26',           700.00, NULL, 1, NULL, 'previsto'),
    (3, '2026-09-15', 'receita', 1, 'PRAD Caraúbas — entrada (C-2026-002)',      12500.00, NULL, 2, 1, 'previsto'),
    (4, '2026-11-15', 'receita', 1, 'PRAD Caraúbas — saldo marco SUDEMA',        12500.00, NULL, 2, 1, 'previsto'),
    (5, '2026-07-25', 'despesa', 3, 'Material kits (BOM) — estação M1',            900.00, 'pix', NULL, 3, 'realizado'),
    (6, '2026-07-28', 'despesa', 6, 'Campo — instalação estação e parcelas',       350.00, 'pix', NULL, 1, 'realizado'),
    (7, '2026-08-15', 'despesa', 4, 'Hospedagem, domínios e ferramentas',          120.00, NULL, NULL, NULL, 'previsto'),
    (8, '2026-08-20', 'despesa', 7, 'Campanha de prospecção (impulsionamento)',    200.00, NULL, NULL, 2, 'previsto');

INSERT INTO vendas_kits (id, numero, cliente_id, data, status) VALUES
    (1, 'VENDA-2026-001', 5, '2026-08-01', 'pago');

INSERT INTO itens_venda (id, venda_id, kit_id, quantidade, preco_unitario) VALUES
    (1, 1, 1, 1, 3500.00);

INSERT INTO custos_projeto (id, projeto_id, categoria_id, descricao, valor, data) VALUES
    (1, 1, 6, 'Levantamento de campo (baseline)', 600.00, '2026-08-05'),
    (2, 4, 4, 'Computação para pipeline NDVI', 80.00, '2026-08-10');

INSERT INTO configuracoes (chave, valor, descricao) VALUES
    ('meta_receita_90d',    '{"valor": 40000, "unidade": "BRL", "detalhe": "meta da 1ª rodada comercial 30-90 dias"}', 'Meta de receita dos primeiros 90 dias'),
    ('taxa_markup_kits',    '{"valor": 1.65}', 'Fator de markup sobre custo BOM dos kits'),
    ('modelo_precificacao', '{"nome": "custo_mais_markup", "observacao": "aplicar em kits; serviços por escopo"}', 'Modelo de precificação padrão'),
    ('regiao_foco',         '{"uf": "PB", "microrregiao": "Cariri Ocidental", "raio_km": 60}', 'Região prioritária (60 km de Caraúbas-PB)');

COMMIT;
