// ============================================================================
// Kraefegg M.O. — exemplos de consultas SQL no Atlas SQL (mongosh)
// Rode com:  .\db\mongodb\atlas-sql.ps1
// O Atlas SQL exige agregação a nível de banco: db.aggregate([{ $sql: ... }]).
// ============================================================================

function sql($statement) {
    print('\n> ' + $statement);
    const docs = db.aggregate([{ $sql: { statement: $statement, format: 'relaxed' } }]).toArray();
    print(JSON.stringify(docs, null, 2));
}

// 1) Leituras por sensor
sql('SELECT sensorId, COUNT(*) AS total FROM leituras GROUP BY sensorId');

// 2) Última leitura por sensor (01/08/2026)
sql(`SELECT sensorId, MAX(instante) AS ultima
     FROM leituras
     GROUP BY sensorId`);

// 3) Tendência NDVI real da parcela PAR-01 (Sentinel-2)
sql(`SELECT data, valor
     FROM ndvi
     WHERE parcela = 'PAR-01' AND indice = 'ndvi'
     ORDER BY data`);

// 4) Focos INPE por município
sql('SELECT municipio, COUNT(*) AS total FROM focos GROUP BY municipio');

// 5) Alertas por severidade
sql('SELECT severidade, COUNT(*) AS total FROM alertas GROUP BY severidade');

// 6) Previsão Open-Meteo para a estação M1
sql(`SELECT horario, temperatura, umidade, vento
     FROM clima
     WHERE siteId = 'STA-M1'
     ORDER BY horario`);

print('\nFIM — Atlas SQL conectado e consultando com sucesso.');
