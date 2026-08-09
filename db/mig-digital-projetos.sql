-- Migração idempotente: registro dos projetos digitais (decisão do CEO v1)
SET search_path TO kraefegg, public;

BEGIN;

INSERT INTO kraefegg.projetos (id, codigo, nome, descricao, cliente_id, contrato_id, responsavel_id, status, prioridade, progresso, data_fim) VALUES
    (6, 'PRJ-2026-006', 'AIO Observatory Comercial', 'SaaS multi-projeto de monitoramento geoambiental por assinatura (NDVI real, hidrologia, focos) — lançamento v1', NULL, NULL, 5, 'analise', 'alta', 0, '2026-10-31'),
    (7, 'PRJ-2026-007', 'Página pública de M&V (demonstração)', 'Demo pública de monitoramento & verificação para prospecção comercial', NULL, NULL, 24, 'analise', 'alta', 0, '2026-09-15'),
    (8, 'PRJ-2026-008', 'Kit Estação Meteo IoT', 'Produto IoT instalável: estação meteorológica ESP32→MQTT→CSV→AIO; calibração, BOM e manual', NULL, NULL, 10, 'backlog', 'media', 0, '2026-09-30'),
    (9, 'PRJ-2026-009', 'Kit Comercial Digital', 'Máquina de fechamento: proposta PDF, contrato de assinatura 14.133 e precificação', NULL, NULL, 24, 'analise', 'alta', 0, '2026-09-10')
ON CONFLICT (id) DO UPDATE SET
    codigo = EXCLUDED.codigo, nome = EXCLUDED.nome, descricao = EXCLUDED.descricao,
    responsavel_id = EXCLUDED.responsavel_id, status = EXCLUDED.status,
    prioridade = EXCLUDED.prioridade, progresso = EXCLUDED.progresso, data_fim = EXCLUDED.data_fim;

INSERT INTO kraefegg.demandas (id, projeto_id, codigo, titulo, descricao, area_id, responsavel_id, fase, prioridade, progresso, prazo) VALUES
    (16, 6, 'D-16', 'AIO Comercial — versão multi-projeto e assinatura', 'Release comercial: multi-site, dados por cliente, marca d''água e permissões; integração com assinatura recorrente.', 3, 5, 'analise', 'alta', 0, '2026-09-15'),
    (17, 7, 'D-17', 'Página pública de M&V — demo para prospecção', 'Página pública com dados de demonstração, copy técnico-comercial e CTA de reunião; revisão de segurança antes do ar.', 7, 24, 'analise', 'alta', 0, '2026-09-05'),
    (18, 8, 'D-18', 'Kit Estação Meteo — calibração, BOM e manual de instalação', 'Firmware ESP32-S3 validado, contrato JSON de telemetria, BOM final e manual de instalação para entrega em campo.', 3, 10, 'backlog', 'media', 0, '2026-09-20'),
    (19, 9, 'D-19', 'Kit Comercial Digital — proposta, contrato de assinatura e precificação', 'Template de proposta PDF, contrato de assinatura de monitoramento (14.133) e planilha de precificação e fluxo de caixa.', 7, 24, 'analise', 'alta', 0, '2026-08-30')
ON CONFLICT (id) DO UPDATE SET
    projeto_id = EXCLUDED.projeto_id, codigo = EXCLUDED.codigo, titulo = EXCLUDED.titulo,
    descricao = EXCLUDED.descricao, area_id = EXCLUDED.area_id, responsavel_id = EXCLUDED.responsavel_id,
    fase = EXCLUDED.fase, prioridade = EXCLUDED.prioridade, progresso = EXCLUDED.progresso, prazo = EXCLUDED.prazo;

COMMIT;
