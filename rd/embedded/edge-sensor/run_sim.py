#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Simulação Wokwi — Edge Sensor Ambiental (Kraefegg M.O.)
-------------------------------------------------------
Roda o firmware MicroPython do nó de borda (ESP32) na nuvem Wokwi:
 1. Baixa o firmware MicroPython oficial para ESP32 (1x, cache local);
 2. Injeta rd/embedded/edge-sensor/main.py no filesystem LittleFS;
 3. Envia diagram.json + firmware para o simulador e inicia;
 4. Monitora o serial por N segundos e imprime o log.

Uso:
    set WOKWI_CLI_TOKEN=<token CI>        (ou do cofre ENIGMA)
    python rd/embedded/edge-sensor/run_sim.py [--segundos 8]
"""
from __future__ import annotations

import argparse
import asyncio
import os
import sys
from pathlib import Path

import requests
from littlefs import LittleFS

from wokwi_client import WokwiClient

REPO_ROOT = Path(__file__).resolve().parent.parent.parent.parent
PROJ = REPO_ROOT / "rd" / "embedded" / "edge-sensor"

FIRMWARE_NAME = "ESP32_GENERIC-20250415-v1.25.0.bin"
FIRMWARE_URL = f"https://micropython.org/resources/firmware/{FIRMWARE_NAME}"
FIRMWARE_OFFSET = 0x1000
FLASH_SIZE = 0x400000
FS_OFFSET = 0x200000
FS_SIZE = 0x200000

TOKEN_URL = "https://wokwi.com/dashboard/ci"


def montar_firmware() -> tuple[str, bytes]:
    """Baixa o firmware e injeta o main.py no LittleFS do ESP32."""
    cache = REPO_ROOT / "rd" / "embedded" / ".cache"
    cache.mkdir(parents=True, exist_ok=True)
    fir = cache / FIRMWARE_NAME

    if not fir.exists():
        print(f"[fw] baixando {FIRMWARE_NAME} ...")
        r = requests.get(FIRMWARE_URL, timeout=120)
        r.raise_for_status()
        fir.write_bytes(r.content)

    with fir.open("rb") as f:
        fw = bytearray(FLASH_SIZE)
        fw[FIRMWARE_OFFSET:FIRMWARE_OFFSET + f.tell()] = f.read()

    lfs = LittleFS(block_size=4096, block_count=512, prog_size=256)
    with lfs.open("main.py", "w") as m:
        m.write((PROJ / "main.py").read_text(encoding="utf-8"))
    fw[FS_OFFSET:FS_OFFSET + FS_SIZE] = lfs.context.buffer
    return FIRMWARE_NAME, bytes(fw)


async def main() -> int:
    ap = argparse.ArgumentParser(description="Simulação Wokwi do Edge Sensor Ambiental")
    ap.add_argument("--segundos", type=float, default=8.0)
    args = ap.parse_args()

    token = os.environ.get("WOKWI_CLI_TOKEN")
    if not token:
        print(f"ERRO: defina WOKWI_CLI_TOKEN (obtenha em {TOKEN_URL}).", file=sys.stderr)
        return 1

    nome_fw, firmware = montar_firmware()

    client = WokwiClient(token)
    hello = await client.connect()
    print(f"[sim] conectado ao simulador (server {hello['version']})")

    await client.upload_file("diagram.json", PROJ / "diagram.json")
    await client.upload(nome_fw, firmware)
    await client.start_simulation(firmware=nome_fw)

    serial = asyncio.create_task(client.serial_monitor_cat())
    print(f"[sim] simulação rodando por {args.segundos:.0f}s ...")
    await client.wait_until_simulation_time(args.segundos)
    serial.cancel()
    await client.disconnect()
    print("[sim] fim.")
    return 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
