// ============================================================================
// Kraefegg M.O. — MongoDB (telemetria) — dados iniciais (dev/demo)
// Alinhado ao seed do PostgreSQL (mesmos sites, sensores, séries e eventos).
// Uso: mongosh <db> 02-seed.js   (ou automático no docker-entrypoint-initdb.d)
// ============================================================================

const db = db.getSiblingDB('kraefegg_telemetry');
const hora = 3600 * 1000;

// ============================================================================
// CATÁLOGO: sites e sensores (espelho denormalizado do PG)
// ============================================================================

db.sites.insertMany([
  { codigo: 'STA-M1', nome: 'Estação Meteorológica — PoC M1', tipo: 'estacao_meteorologica', cliente: null, contrato: null,
    loc: { type: 'Point', coordinates: [-37.809444, -6.979722] }, municipio: 'Caraúbas', uf: 'PB', status: 'ativo', instaladoEm: new Date('2026-07-20T00:00:00Z') },
  { codigo: 'PAR-01', nome: 'Parcela PRAD Norte', tipo: 'parcela_ndvi', cliente: 'Prefeitura de Caraúbas', contrato: 'C-2026-002',
    loc: { type: 'Point', coordinates: [-37.830000, -7.005000] }, municipio: 'Caraúbas', uf: 'PB', status: 'ativo', instaladoEm: new Date('2026-07-25T00:00:00Z') },
  { codigo: 'PAR-02', nome: 'Parcela PRAD Sul', tipo: 'parcela_ndvi', cliente: 'Prefeitura de Caraúbas', contrato: 'C-2026-002',
    loc: { type: 'Point', coordinates: [-37.795000, -7.022000] }, municipio: 'Caraúbas', uf: 'PB', status: 'ativo', instaladoEm: new Date('2026-07-25T00:00:00Z') },
  { codigo: 'SOL-01', nome: 'Umidade de Solo — Agro Vale', tipo: 'umidade_solo', cliente: 'Agro Vale', contrato: 'C-2026-001',
    loc: { type: 'Point', coordinates: [-37.455000, -6.501000] }, municipio: 'São Bento', uf: 'PB', status: 'ativo', instaladoEm: new Date('2026-08-01T00:00:00Z') },
  { codigo: 'RIO-01', nome: 'Datalogger Rio Piranhas', tipo: 'datalogger_rio', cliente: null, contrato: null,
    loc: { type: 'Point', coordinates: [-37.920000, -6.887000] }, municipio: 'Caraúbas', uf: 'PB', status: 'manutencao', instaladoEm: new Date('2026-06-10T00:00:00Z') }
]);

db.sensores.insertMany([
  { codigo: 'TEMP-01', siteId: 'STA-M1', nome: 'Temperatura do ar',    grandeza: 'temperatura',      unidade: '°C',   modelo: 'SHT31',          fabricante: 'Sensirion' },
  { codigo: 'UMID-01', siteId: 'STA-M1', nome: 'Umidade relativa',     grandeza: 'umidade_rel',      unidade: '%',    modelo: 'SHT31',          fabricante: 'Sensirion' },
  { codigo: 'PRESS-01', siteId: 'STA-M1', nome: 'Pressão atmosférica', grandeza: 'pressao',          unidade: 'hPa',  modelo: 'BMP280',         fabricante: 'Bosch' },
  { codigo: 'VENT-01', siteId: 'STA-M1', nome: 'Velocidade do vento',  grandeza: 'velocidade_vento', unidade: 'm/s',  modelo: 'Anemômetro de copo', fabricante: 'GENERIC' },
  { codigo: 'CHUV-01', siteId: 'STA-M1', nome: 'Precipitação',         grandeza: 'precipitacao',     unidade: 'mm',   modelo: 'Báscula 0,2mm',  fabricante: 'GENERIC' },
  { codigo: 'RAD-01', siteId: 'STA-M1', nome: 'Radiação solar',        grandeza: 'radiacao',         unidade: 'W/m²', modelo: 'Piranômetro',     fabricante: 'GENERIC' },
  { codigo: 'SOLO-01', siteId: 'SOL-01', nome: 'Umidade do solo',      grandeza: 'umidade_solo',     unidade: '%',    modelo: 'Capacitivo',     fabricante: 'GENERIC' },
  { codigo: 'NIV-01', siteId: 'RIO-01', nome: 'Nível do rio',          grandeza: 'nivel_rio',        unidade: 'cm',   modelo: 'Ultrassônico',   fabricante: 'GENERIC' }
]);

// ============================================================================
// LEITURAS: temperatura/umidade/pressão/vento/chuva/radiação horárias (01/08/2026)
// Mesma fórmula determinística do seed do PG.
// ============================================================================

const base = Date.UTC(2026, 7, 1, 0, 0, 0); // 01/08/2026 00:00 UTC
const leituras = [];
for (let gs = 0; gs < 24; gs++) {
  const t = new Date(base + gs * hora);
  leituras.push(
    { sensorId: 'TEMP-01', instante: t, valor: 22 + 6 * Math.sin(gs * 0.3) + (gs % 3) },
    { sensorId: 'UMID-01', instante: t, valor: 55 + 12 * Math.cos(gs * 0.25) },
    { sensorId: 'PRESS-01', instante: t, valor: 1012 + (gs % 5) },
    { sensorId: 'VENT-01', instante: t, valor: Math.round((3.2 + Math.abs(Math.sin(gs))) * 100) / 100 },
    { sensorId: 'CHUV-01', instante: t, valor: (gs === 14 || gs === 15) ? 8 : 0 },
    { sensorId: 'RAD-01', instante: t, valor: Math.round(Math.max(0, 700 * Math.sin((gs - 6) * 0.26)) * 100) / 100 }
  );
}
db.leituras.insertMany(leituras);

// solo (leituras diárias) e rio (3 amostras)
db.leituras.insertMany([
  { sensorId: 'SOLO-01', instante: new Date('2026-08-01T06:00:00Z'), valor: 24.5 },
  { sensorId: 'SOLO-01', instante: new Date('2026-08-01T12:00:00Z'), valor: 23.1 },
  { sensorId: 'SOLO-01', instante: new Date('2026-08-02T06:00:00Z'), valor: 24.8 },
  { sensorId: 'NIV-01', instante: new Date('2026-08-01T06:00:00Z'), valor: 45.0 },
  { sensorId: 'NIV-01', instante: new Date('2026-08-01T12:00:00Z'), valor: 47.2 },
  { sensorId: 'NIV-01', instante: new Date('2026-08-02T06:00:00Z'), valor: 46.0 },
  // amostras com qualidade ruim para exercitar o pipeline
  { sensorId: 'TEMP-01', instante: new Date('2026-08-02T03:00:00Z'), valor: -9.99, qualidade: 'invalida' },
  { sensorId: 'VENT-01', instante: new Date('2026-08-02T05:00:00Z'), valor: 41.20, qualidade: 'suspeita' }
]);

// ============================================================================
// NDVI: real (Sentinel-2) mensal 01/2025..07/2026 + índices modelo
// ============================================================================

const ndviDocs = [];
for (let m = 0; m < 19; m++) {
  const d = new Date(Date.UTC(2025, m, 1));
  ndviDocs.push(
    { parcela: 'PAR-01', indice: 'ndvi', data: d, valor: Math.round((0.25 + 0.12 * Math.sin(m + 1)) * 10000) / 10000, origem: 'real', fonte: 'Sentinel-2 (kraefegg/AIO)' },
    { parcela: 'PAR-02', indice: 'ndvi', data: d, valor: Math.round((0.20 + 0.10 * Math.sin(m + 1)) * 10000) / 10000, origem: 'real', fonte: 'Sentinel-2 (kraefegg/AIO)' }
  );
}
db.ndvi.insertMany(ndviDocs);

// demais índices continuam modelo (sem export numérico ainda)
db.ndvi.insertMany([
  { parcela: 'PAR-01', indice: 'ndwi', data: new Date('2026-07-01T00:00:00Z'), valor: 0.1800, origem: 'modelo', fonte: 'Modelo Kraefegg (sem export numérico)' },
  { parcela: 'PAR-01', indice: 'umidade', data: new Date('2026-07-01T00:00:00Z'), valor: 0.2200, origem: 'modelo', fonte: 'Modelo Kraefegg (sem export numérico)' },
  { parcela: 'PAR-01', indice: 'bsi', data: new Date('2026-07-01T00:00:00Z'), valor: 0.3000, origem: 'modelo', fonte: 'Modelo Kraefegg (sem export numérico)' }
]);

// ============================================================================
// CLIMA: previsão Open-Meteo (now + 3/6/9h) — espelho de dados_climaticos do PG
// ============================================================================

const now = new Date();
db.clima.insertMany([
  { siteId: 'STA-M1', horario: new Date(now.getTime() + 3 * hora), temperatura: 31.5, umidade: 42.0, vento: { velocidade: 4.2, direcao: 120 }, precipitacao: 0.0, radiacao: 820.0 },
  { siteId: 'STA-M1', horario: new Date(now.getTime() + 6 * hora), temperatura: 33.1, umidade: 38.0, vento: { velocidade: 4.8, direcao: 130 }, precipitacao: 0.0, radiacao: 910.0 },
  { siteId: 'STA-M1', horario: new Date(now.getTime() + 9 * hora), temperatura: 34.0, umidade: 35.0, vento: { velocidade: 5.1, direcao: 135 }, precipitacao: 0.0, radiacao: 980.0 }
]);

// ============================================================================
// FOCOS INPE (BDQueimadas) e ALERTAS
// ============================================================================

db.focos.insertMany([
  { data_hora: new Date('2026-08-01T13:20:00Z'), loc: { type: 'Point', coordinates: [-37.855, -6.912] }, frp: 14.3, bioma: 'Caatinga', municipio: 'Caraúbas', uf: 'PB' },
  { data_hora: new Date('2026-08-01T14:05:00Z'), loc: { type: 'Point', coordinates: [-37.899, -6.931] }, frp: 9.8,  bioma: 'Caatinga', municipio: 'Caraúbas', uf: 'PB' },
  { data_hora: new Date('2026-07-29T11:40:00Z'), loc: { type: 'Point', coordinates: [-37.700, -7.050] }, frp: 22.1, bioma: 'Caatinga', municipio: 'Caraúbas', uf: 'PB' }
]);

db.alertas.insertMany([
  { siteId: 'STA-M1', tipo: 'queimada',     severidade: 'critica', mensagem: 'Foco de queimada a ~8 km da estação (FRP 14,3)', acao: 'Verificar focos INPE e acionar defesa civil se necessário', criadoEm: new Date('2026-08-01T14:10:00Z') },
  { siteId: 'PAR-01', tipo: 'seca',         severidade: 'alta',    mensagem: 'NDVI 3 meses abaixo do esperado para a estação', acao: 'Revisar plano de irrigação/plantio da parcela', criadoEm: new Date('2026-08-01T12:00:00Z') },
  { siteId: 'RIO-01', tipo: 'cheia',        severidade: 'media',   mensagem: 'Nível do rio subiu 22 cm em 12h', acao: 'Monitorar vazante e pluviometria', criadoEm: new Date('2026-08-01T15:00:00Z') },
  { siteId: 'SOL-01', tipo: 'qualidade_ar', severidade: 'baixa',   mensagem: 'Estação em manutenção — dados de vento suspeitos', acao: 'Concluir manutenção preventiva do anemômetro', criadoEm: new Date('2026-08-01T16:00:00Z') }
]);

print('=== Kraefegg M.O. — Mongo telemetria (seed aplicado) ===');
print('sites:    ' + db.sites.countDocuments());
print('sensores: ' + db.sensores.countDocuments());
print('leituras: ' + db.leituras.countDocuments());
print('ndvi:     ' + db.ndvi.countDocuments());
print('clima:    ' + db.clima.countDocuments());
print('focos:    ' + db.focos.countDocuments());
print('alertas:  ' + db.alertas.countDocuments());
