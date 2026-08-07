// ============================================================================
// Kraefegg M.O. — MongoDB (telemetria) — schema/índices
// Híbrido: PostgreSQL = fonte de verdade transacional (CRM, projetos, financeiro);
// MongoDB = armazenamento de séries temporais (leituras, NDVI, clima) + eventos.
// Roda automaticamente no docker-entrypoint-initdb.d (primeira subida do container).
// Reexecutável: recria as coleções (limpa tudo).
// ============================================================================

const db = db.getSiblingDB('kraefegg_telemetry');

// --- limpa coleções (idempotente) ---
db.sites.drop();
db.sensores.drop();
db.focos.drop();
db.alertas.drop();
db.leituras.drop();
db.ndvi.drop();
db.clima.drop();

// ============================================================================
// COLEÇÕES TIME-SERIES (MongoDB 5.0+; imagem mongo:7)
// ============================================================================

// Leituras brutas dos sensores (mesma métrica da tabela leituras do PG)
db.createCollection('leituras', {
  timeseries: {
    timeField: 'instante',
    metaField: 'sensorId',
    granularity: 'hours'
  }
});

// Séries de índices espectrais (NDVI real Sentinel-2 + índices modelo)
db.createCollection('ndvi', {
  timeseries: {
    timeField: 'data',
    metaField: 'parcela',
    granularity: 'hours'
  }
});

// Previsão Open-Meteo por estação
db.createCollection('clima', {
  timeseries: {
    timeField: 'horario',
    metaField: 'siteId',
    granularity: 'hours'
  }
});

// ============================================================================
// COLEÇÕES REGULARES (catálogo denormalizado + eventos)
// Fonte de verdade do catálogo é o PG; aqui é espelho para consulta geo/hot path.
// ============================================================================

db.createCollection('sites', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['codigo', 'nome', 'tipo', 'loc', 'municipio', 'uf', 'status'],
      properties: {
        codigo:      { bsonType: 'string' },
        nome:        { bsonType: 'string' },
        tipo:        { enum: ['estacao_meteorologica', 'parcela_ndvi', 'umidade_solo', 'datalogger_rio'] },
        cliente:     { bsonType: 'string' },
        contrato:    { bsonType: 'string' },
        loc: {
          bsonType: 'object',
          required: ['type', 'coordinates'],
          properties: {
            type:        { enum: ['Point'] },
            coordinates: { bsonType: ['array'], items: { bsonType: 'double' }, minItems: 2, maxItems: 2 }
          }
        },
        municipio:   { bsonType: 'string' },
        uf:          { bsonType: 'string' },
        status:      { enum: ['ativo', 'manutencao', 'inativo'] },
        instaladoEm: { bsonType: 'date' }
      }
    }
  }
});
db.sites.createIndex({ codigo: 1 }, { unique: true });
db.sites.createIndex({ loc: '2dsphere' });

db.createCollection('sensores', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['codigo', 'siteId', 'grandeza', 'unidade'],
      properties: {
        codigo:     { bsonType: 'string' },
        siteId:     { bsonType: 'string' },
        nome:       { bsonType: 'string' },
        grandeza:   { bsonType: 'string' },
        unidade:    { bsonType: 'string' },
        modelo:     { bsonType: 'string' },
        fabricante: { bsonType: 'string' }
      }
    }
  }
});
db.sensores.createIndex({ siteId: 1, codigo: 1 }, { unique: true });

// Focos de queimada INPE (BDQueimadas) — geo + TTL 60 dias
db.createCollection('focos', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['data_hora', 'loc', 'frp', 'bioma', 'municipio', 'uf'],
      properties: {
        data_hora: { bsonType: 'date' },
        loc: {
          bsonType: 'object',
          required: ['type', 'coordinates'],
          properties: {
            type:        { enum: ['Point'] },
            coordinates: { bsonType: ['array'], items: { bsonType: 'double' }, minItems: 2, maxItems: 2 }
          }
        },
        frp:       { bsonType: 'double' },
        bioma:     { bsonType: 'string' },
        municipio: { bsonType: 'string' },
        uf:        { bsonType: 'string' }
      }
    }
  }
});
db.focos.createIndex({ loc: '2dsphere' });
db.focos.createIndex({ data_hora: 1 }, { expireAfterSeconds: 60 * 24 * 3600 });

db.createCollection('alertas', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['siteId', 'tipo', 'severidade', 'mensagem'],
      properties: {
        siteId:      { bsonType: 'string' },
        tipo:        { enum: ['queimada', 'seca', 'cheia', 'qualidade_ar'] },
        severidade:  { enum: ['critica', 'alta', 'media', 'baixa'] },
        mensagem:    { bsonType: 'string' },
        acao:        { bsonType: 'string' },
        criadoEm:    { bsonType: 'date' }
      }
    }
  }
});
db.alertas.createIndex({ siteId: 1, criadoEm: -1 });
db.alertas.createIndex({ severidade: 1, criadoEm: -1 });
