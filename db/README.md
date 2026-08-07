# Kraefegg M.O. — Camada de Dados (PostgreSQL + MongoDB)

Camada de dados da empresa em arquitetura **híbrida**, toda **dinâmica** (triggers recalculam progresso, views alimentam o painel, time-series guardam a telemetria).

## Status — VALIDADO EM NUVEM ✅ (ago/2026)

| Sistema | Onde roda | Status |
|---|---|---|
| **PostgreSQL (transacional)** | **Supabase** `mrqjmdfulmnggozwjxlq` (db `postgres`, schema `kraefegg`) | ✅ schema+seed aplicados; views validadas (`v_painel_executivo`, `v_demandas_abertas`, 37 agentes, 11 demandas abertas, pipeline R$ 43.000) |
| **MongoDB (telemetria)** | **Atlas** `cluster0` (`kraefegg_telemetry`) | ✅ schema+seed aplicados (5 sites, 8 sensores, 152 leituras, 41 NDVI, 3 clima, 3 focos, 4 alertas) |
| **Atlas SQL (BI/read-only)** | Endpoint `atlas-sql-6a75669474243a1807eaaf38-ejwat6` | ✅ consultas SQL validadas (6 exemplos em `mongodb/sql-examples.js`) |
| **GitHub + Pages** | `kraefegg/KraefeggMO` (público) | ✅ deploy via `deploy-github-pages.ps1` |

> Bugs reais encontrados e corrigidos na validação: `seed.sql` (cast `text`→`indice_espectral` em `series_indices`) e `apply-supabase.ps1` (stderr do psql). Commit `c158e21`.

## Arquitetura

| Sistema | Papel | O que guarda |
|---|---|---|
| **PostgreSQL** | Fonte de verdade transacional | CRM, demandas/projetos, sites/sensores (catálogo), financeiro, auditoria |
| **MongoDB** | Telemetria (hot path) | Leituras de sensores, séries NDVI, clima, focos INPE, alertas |

## Estrutura

| Arquivo | Conteúdo |
|---|---|
| `schema.sql` | DDL PostgreSQL completo (enums, tabelas, triggers, views) no schema `kraefegg` |
| `seed.sql` | Dados iniciais do PostgreSQL (37 agentes, CRM, demandas, financeiro) — reexecutável |
| `init-postgres-local.ps1` | Inicializa o PostgreSQL local instalado (ROLE/DATABASE `kraefegg` + schema/seed). **Requer admin** |
| `apply-supabase.ps1` | Aplica schema + seed num PostgreSQL hospedado (Supabase/Neon) via `SUPABASE_URI` em `db/.env` |
| `mongodb/` | Camada MongoDB de telemetria: `01-schema.js`, `02-seed.js` e README |
| `docker-compose.yml` | Sobe PostgreSQL 16 + MongoDB 7 com schema/seed automáticos |

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
docker compose up -d                          # PostgreSQL 16 (schema+seed automáticos)
docker compose --profile local-mongo up -d    # + MongoDB local (opcional; só dev)
```

**PostgreSQL:** host `localhost:5432` · user `kraefegg` · password `kraefegg_dev` · db `kraefegg`

**MongoDB (produção):** usa o cluster **Atlas** (`cluster0`) — credenciais em `db/mongodb/.env` (não versionado) e aplicação via `db\mongodb\apply-atlas.ps1`. O Mongo local do compose é apenas para dev (`--profile local-mongo`).

## Como rodar manual (psql)

```bash
psql -h localhost -U kraefegg -d kraefegg -f db/schema.sql
psql -h localhost -U kraefegg -d kraefegg -f db/seed.sql
```

### Opção A — PostgreSQL local instalado (sem Docker)

Se o PostgreSQL já está instalado como serviço, rode **como Administrador**:

```powershell
.\db\init-postgres-local.ps1
```

Cria `ROLE`/`DATABASE kraefegg` (senha `kraefegg_dev`), aplica schema+seed e restaura a autenticação original.

### Opção B — PostgreSQL hospedado (Supabase/Neon) — JÁ VALIDADO ✅

O projeto Supabase atual (`mrqjmdfulmnggozwjxlq`) é o PostgreSQL de produção. A connection string vive em `db/.env` (não versionado):

```powershell
# db/.env (não versionado)
SUPABASE_URI="postgresql://postgres.XXXXX:senha@db.<ref>.supabase.co:5432/postgres"
```

Aplicar/revalidar (idempotente):

```powershell
.\db\apply-supabase.ps1
```

> O schema usa apenas recursos padrão do PostgreSQL (`pgcrypto` incluso, enums, triggers, views), compatível com Supabase.

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

- **Séries temporais**: no Mongo as leituras/NDVI/clima já usam time-series collections; definir política de retenção (TTL) conforme SLA.
- **Sincronização híbrida**: escrita de telemetria no Mongo (hot path); batch para o PG (relatórios/auditoria). Catálogo (sites/sensores) com fonte de verdade no PG e espelho no Mongo.
- **Migrações**: versionar com Flyway/Liquibase (PG) em vez de reexecutar o DDL completo.
- **Backup**: `pg_dump` + `mongodump` agendados; `pgBackRest`/PITR quando houver SLA.
- **Integração**: os agentes de dados (`data-analytics`, `data-engineering`) são os donos desta camada; a API futura expõe as views do PG e as agregações do Mongo para o HQ e para o AIO Observatory.
- **Ambientes**: separar `dev`/`staging`/`prod` (nunca rodar seed em produção).
