# Kraefegg M.O. — Banco de Dados (PostgreSQL)

Camada de dados de produção da empresa (CRM, demandas/projetos, monitoramento & telemetria e financeiro). Todo o modelo é **dinâmico**: triggers recalculam progresso, mantêm histórico de fases e geram trilha de auditoria; views executivas alimentam o painel.

## Estrutura

| Arquivo | Conteúdo |
|---|---|
| `schema.sql` | DDL completo (enums, 25+ tabelas, funções, triggers e views) no schema `kraefegg` |
| `seed.sql` | Dados iniciais (37 agentes, 9 áreas, CRM, 12 demandas do HQ, telemetria M1, financeiro) — reexecutável |

### Domínios modelados
- **Núcleo** — `areas_departamento`, `agentes`, `fases`
- **CRM** — `clientes`, `contatos`, `interacoes`, `propostas`, `itens_proposta`, `contratos`, `cobrancas`
- **Demandas & projetos** — `projetos`, `demandas`, `historico_demandas`, `etapas_projeto`
- **Monitoramento & telemetria** — `sites`, `sensores`, `leituras`, `series_indices`, `eventos_inpe`, `dados_climaticos`, `alertas`
- **Financeiro** — `lancamentos`, `cobrancas`, `kits`, `vendas_kits`, `itens_venda`, `custos_projeto`, `configuracoes`
- **Governança** — `auditoria`

### Views executivas
`v_funil_comercial`, `v_propostas_detalhe`, `v_demandas_abertas`, `v_telemetria_ultima`, `v_ndvi_serie`, `v_fluxo_caixa_mensal`, `v_resumo_financeiro`, `v_margem_proposta`, `v_painel_executivo`.

### Dinâmica automática (triggers)
- `concluida` ⇒ `progresso = 100`; cada mudança de fase/progresso grava em `historico_demandas`.
- Progresso do projeto = média das demandas (atualizado automaticamente).
- `atualizado_em` mantido em todas as tabelas de negócio.
- Auditoria (INSERT/UPDATE/DELETE) em `clientes`, `propostas` e `contratos`.

## Como rodar local (Docker)

```bash
docker compose up -d
```

Sobe um PostgreSQL 16 com schema+seed aplicados automaticamente na primeira inicialização.

**Conexão:** host `localhost:5432` · user `kraefegg` · password `kraefegg_dev` · db `kraefegg`.

## Como rodar manual (psql)

```bash
psql -h localhost -U kraefegg -d kraefegg -f db/schema.sql
psql -h localhost -U kraefegg -d kraefegg -f db/seed.sql
```

O `seed.sql` limpa e reinsere tudo (idempotente). Em dev, recriar o banco:

```sql
DROP SCHEMA kraefegg CASCADE;
-- rodar schema.sql + seed.sql novamente
```

## Consultas de exemplo

```sql
-- Painel executivo (uma linha com tudo)
SELECT * FROM kraefegg.v_painel_executivo;

-- Funil comercial
SELECT * FROM kraefegg.v_funil_comercial;

-- Demandas em aberto (com responsável, fase e cor)
SELECT * FROM kraefegg.v_demandas_abertas ORDER BY prioridade DESC, prazo;

-- Última telemetria de cada sensor
SELECT * FROM kraefegg.v_telemetria_ultima;

-- NDVI real das parcelas do PRAD
SELECT * FROM kraefegg.v_ndvi_serie WHERE indice = 'ndvi' AND origem = 'real';

-- Fluxo de caixa mensal (realizado × previsto)
SELECT * FROM kraefegg.v_fluxo_caixa_mensal;

-- Trilha de auditoria de clientes
SELECT tabela, registro_id, acao, em FROM kraefegg.auditoria ORDER BY em DESC LIMIT 20;
```

## Produção (próximos passos)

- **Séries temporais**: particionar `leituras` por `range(instante)` ou adotar TimescaleDB (hypertable + continuous aggregates).
- **Migrações**: versionar com Flyway/Liquibase em vez de reexecutar o DDL completo.
- **Backup**: `pg_dump` agendado + `pgBackRest`/PITR quando houver SLA.
- **Integração**: os agentes de dados (`data-analytics`, `data-engineering`) são os donos desta camada; a API futura expõe as views para o HQ e para o AIO Observatory.
- **Ambientes**: separar `dev`/`staging`/`prod` (nunca rodar seed em produção).
