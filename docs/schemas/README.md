# Schemas de Dados — Kraefegg M.O.

Referência dos schemas utilizados no projeto. Schemas reais versionáveis ficam
em `db/` e `security/`; esta pasta centraliza a documentação e exemplos.

## Banco de dados (PostgreSQL / Supabase)

Fonte: [`db/schema.sql`](../../db/schema.sql)

- Tabelas qualificadas com o schema `kraefegg`.
- Trigger `kraefegg.fn_demanda_trigger` para atualização automática de demandas.
- Tabela de demandas corporativas vinculada aos agentes do HQ.

## Credenciais e ambiente

Fonte: [`security/.env.template`](../../security/.env.template)

Variáveis de ambiente documentadas para o gateway OmniRoute e serviços:

| Variável | Finalidade |
|---|---|
| `JWT_SECRET` | Assinatura de tokens do gateway |
| `API_KEY_SECRET` | Chave de API do gateway |
| `REQUIRE_API_KEY` | Exigir chave em toda requisição |
| `CORS_ALLOWED_ORIGINS` | Origens permitidas (localhost) |
| `DEFAULT_RATE_LIMIT_PER_DAY` | Limite de uso diário |

## Payload do Edge Sensor (JSON)

Gerado pelo firmware em `rd/embedded/edge-sensor/main.py`:

```json
{
  "t": 9,
  "temp": 27.4,
  "hum": 55.0,
  "anomalia": false,
  "z": 1.0,
  "amostras": 8
}
```

### JSON Schema

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "EdgeSensorReading",
  "type": "object",
  "required": ["t", "temp", "hum", "anomalia", "z", "amostras"],
  "properties": {
    "t": { "type": "integer", "description": "epoch seconds" },
    "temp": { "type": "number", "description": "temperatura °C" },
    "hum": { "type": "number", "description": "umidade %RH" },
    "anomalia": { "type": "boolean" },
    "z": { "type": "number", "description": "z-score da janela" },
    "amostras": { "type": "integer" }
  }
}
```

## Diagrama de simulação (Wokwi)

Fonte: [`rd/embedded/edge-sensor/diagram.json`](../../rd/embedded/edge-sensor/diagram.json)

- Board: `board-esp32-devkit-c-v4`
- Sensor: `wokwi-dht22` (GPIO4, pull-up 10 kΩ)
- Buzzer: `wokwi-buzzer` (GPIO17)
- LED: `wokwi-led` (GPIO2)
- Serial: `$serialMonitor` (TX/RX)
