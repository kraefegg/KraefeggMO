# Kraefegg M.O. - Edge Sensor Ambiental (ESP32 / MicroPython)
# Firmware do nó de borda: monitoramento ambiental para offshore e mineração.
# Edge AI: média móvel + desvio padrão no próprio dispositivo e emite alerta
# de anomalia (vazamento, derramamento, deterioração de solo) sem nuvem.
# Envia payload JSON via UART (serial) para o gateway.
#
# Hardware simulado (Wokwi): ESP32 DevKit + DHT22 + buzzer + LED.
# Pinos: DHT22 GPIO4 | buzzer GPIO17 | LED GPIO2

import machine
import time
import math
import json
import dht

# --- Configuração -----------------------------------------------------------
JANELA = 10                 # amostras da média móvel
Z_LIMITE = 3.0              # limiar de anomalia (desvios padrão)
PERIODO_MS = 1000           # leitura a cada 1 s

# --- Hardware ---------------------------------------------------------------
dht_sensor = dht.DHT22(machine.Pin(4))
buzzer = machine.Pin(17, machine.Pin.OUT)
led = machine.Pin(2, machine.Pin.OUT)


def ler_amostra():
    dht_sensor.measure()
    return {"temp": dht_sensor.temperature(), "hum": dht_sensor.humidity()}


def media(xs):
    return sum(xs) / len(xs)


def desvio(xs):
    m = media(xs)
    return math.sqrt(sum((x - m) ** 2 for x in xs) / len(xs))


# --- Loop principal (Edge AI) ------------------------------------------------
print("KRAEFEGG-EDGE-01 iniciado")
print(json.dumps({"boot": "ok", "firmware": "0.1.0"}))

janela = []

while True:
    try:
        amostra = ler_amostra()
    except Exception as e:
        print(json.dumps({"erro": str(e)}))
        time.sleep_ms(PERIODO_MS)
        continue

    janela.append(amostra["temp"])
    if len(janela) > JANELA:
        janela.pop(0)

    anomalia = False
    z = 0.0
    if len(janela) >= 5:
        m = media(janela)
        s = desvio(janela)
        if s > 0:
            z = abs(amostra["temp"] - m) / s
            anomalia = z > Z_LIMITE

    payload = {
        "t": int(time.time()),
        "temp": round(amostra["temp"], 1),
        "hum": round(amostra["hum"], 1),
        "anomalia": anomalia,
        "z": round(z, 2),
        "amostras": len(janela),
    }
    print(json.dumps(payload))

    buzzer.value(1 if anomalia else 0)
    led.value(1 if anomalia else 0)
    time.sleep_ms(PERIODO_MS)
