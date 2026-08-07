# Kraefegg M.O. — MongoDB (camada de telemetria)

Camada de **séries temporais e eventos** do armazém de dados, em arquitetura **híbrida**:

| Sistema | Papel | O que guarda |
|---|---|---|
| **PostgreSQL** (`db/schema.sql`) | Fonte de verdade transacional | CRM, projetos/demandas, sites/sensores (catálogo), financeiro, auditoria |
| **MongoDB** (`db/mongodb/`) | Armazenamento de telemetria | Leituras de sensores, séries NDVI, previsão climática, focos INPE, alertas |

O catálogo (`sites`, `sensores`) existe em ambos: a fonte de verdade é o PG; o Mongo mantém um **espelho denormalizado** para consultas geo/hot-path (hot path não toca o banco transacional).

## Arquivos

| Arquivo | Conteúdo |
|---|---|
| `01-schema.js` | Cria o banco `kraefegg_telemetry`, coleções time-series + validadores `$jsonSchema` e índices |
| `02-seed.js` | Dados iniciais alinhados ao seed do PG (mesmos sites, sensores, séries e eventos) |
| `docker-compose.yml` (raiz de `db/`) | Sobe PostgreSQL + MongoDB juntos |

## Coleções

| Coleção | Tipo | Descrição |
|---|---|---|
| `leituras` | time-series | Leituras brutas por sensor (timeField `instante`, metaField `sensorId`, granularidade `hours`) |
| `ndvi` | time-series | Índices espectrais por parcela (timeField `data`, metaField `parcela`) |
| `clima` | time-series | Previsão Open-Meteo por estação (timeField `horario`, metaField `siteId`) |
| `sites` | regular | Catálogo espelho com GeoJSON + índice `2dsphere` |
| `sensores` | regular | Catálogo espelho com índice único `(siteId, codigo)` |
| `focos` | regular | Focos de queimada INPE (GeoJSON + TTL de 60 dias) |
| `alertas` | regular | Alertas com severidade (índice `(severidade, criadoEm)`) |

## Como rodar

Com o `docker-compose.yml` da raiz de `db/`:

```bash
docker compose up -d
# subiu também o MongoDB na porta 27017 (user kraefegg / senha kraefegg_dev)
```

Manual (mongosh):

```bash
mongosh --eval 'db.getSiblingDB("kraefegg_telemetry").dropDatabase()'
mongosh "mongodb://localhost:27017" 01-schema.js 02-seed.js
```

## Consultas de exemplo (agregações)

```js
const db = db.getSiblingDB('kraefegg_telemetry');

// Última leitura de cada sensor
db.leituras.aggregate([
  { $sort: { sensorId: 1, instante: -1 } },
  { $group: { _id: '$sensorId', ultima: { $first: '$$ROOT' } } }
]);

// Média de temperatura no dia (por hora)
db.leituras.aggregate([
  { $match: { sensorId: 'TEMP-01' } },
  { $group: { _id: { $dateToString: { format: '%Y-%m-%d %H', date: '$instante' } }, media: { $avg: '$valor' } } },
  { $sort: { _id: 1 } }
]);

// Tendência NDVI da parcela PAR-01
db.ndvi.find({ parcela: 'PAR-01', indice: 'ndvi' }).sort({ data: 1 });

// Focos de queimada num raio de 60 km da estação M1
db.focos.aggregate([
  { $geoNear: {
      near: { type: 'Point', coordinates: [-37.809444, -6.979722] },
      distanceField: 'distancia_m',
      maxDistance: 60000,
      spherical: true } }
]);

// Alertas por severidade
db.alertas.aggregate([{ $group: { _id: '$severidade', total: { $sum: 1 } } }]);
```

## Padrões

- Leituras com `qualidade` diferente de normal (ex.: `invalida`/`suspeita`) entram no pipeline de data quality — espelha o enum `qualidade_leitura` do PG.
- TTL: `focos` expira em 60 dias; em produção, definir política de retenção das time-series (`expireAfterSeconds` por meta) conforme SLA do contrato.
- A escrita do pipeline de telemetria vai direto no Mongo (hot path); o PG é atualizado em batch para relatórios/auditoria.
- Fonte de verdade do catálogo (sites/sensores) permanece no PostgreSQL.
