#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Cofre ENIGMA — Kraefegg M.O.
----------------------------
Cofre local de credenciais com criptografia AES-256-GCM (NIST) vinculada à
identidade de hardware DESTA máquina (MachineGuid + MAC) + senha-mestra.

Isolamento ENIGMA: se os dados forem interceptados por outro IP/MAC e abertos
em outra máquina, o fingerprint de hardware diverge -> a chave derivada é outra
-> a autenticação GCM falha -> o conteúdo NÃO é revelado. Dados exfiltrados são
ruído inútil.

Derivação de chave (paridade com o cofre do HQ):
  k_machine = HMAC-SHA256(fp_maquina, salt)        # amarra ao hardware
  chave     = PBKDF2-HMAC-SHA256(senha, k_machine, 310000) -> 32 bytes

Uso:
    python security/cofre.py put <nome>            # cifra um segredo (lê do stdin)
    python security/cofre.py get <nome>            # decifra para o stdout
    python security/cofre.py list                  # lista nomes (nunca valores)
    python security/cofre.py check-host            # confirma que roda na máquina certa
    python security/cofre.py del <nome>            # remove um segredo

A senha-mestra é lida no prompt (nunca em disco nem histórico).
Pasta: security/segredos/cofre/  (ignorada pelo git)
"""
from __future__ import annotations

import argparse
import base64
import getpass
import hashlib
import hmac
import json
import os
import re
import sys
import uuid
from datetime import datetime, timezone
from pathlib import Path

try:
    from Crypto.Cipher import AES
except ImportError:
    sys.exit("ERRO: instale a dependência:  python -m pip install pycryptodome")

REPO_ROOT = Path(__file__).resolve().parent.parent
COFRE_DIR = REPO_ROOT / "security" / "segredos" / "cofre"
ITER = 310000
ALG = "AES-256-GCM"


# ---------------------------------------------------------------------------
# Identidade de hardware (fingerprint desta máquina)
# ---------------------------------------------------------------------------

def _machine_guid() -> str:
    try:
        import winreg
        with winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Cryptography") as k:
            val, _ = winreg.QueryValueEx(k, "MachineGuid")
            return str(val)
    except Exception:
        return str(uuid.getnode())


def _mac() -> str:
    try:
        return str(uuid.getnode())
    except Exception:
        return ""


def fingerprint_maquina() -> bytes:
    base = f"{_machine_guid()}|{_mac()}|{os.environ.get('COMPUTERNAME', '')}"
    return hashlib.sha256(base.encode("utf-8")).digest()


# ---------------------------------------------------------------------------
# Criptografia
# ---------------------------------------------------------------------------

def derivar_chave(senha: str, salt: bytes) -> bytes:
    return hashlib.pbkdf2_hmac("sha256", senha.encode("utf-8"), salt, ITER, dklen=32)


def cifrar(valor: str, senha: str) -> bytes:
    fp = fingerprint_maquina()
    salt = os.urandom(16)
    k_machine = hmac.new(fp, salt, "sha256").digest()
    chave = derivar_chave(senha, k_machine)
    iv = os.urandom(12)
    cipher = AES.new(chave, AES.MODE_GCM, nonce=iv)
    ct, tag = cipher.encrypt_and_digest(valor.encode("utf-8"))
    bloco = {
        "ver": 1, "alg": ALG, "iter": ITER,
        "salt": b64e(salt), "iv": b64e(iv),
        "fp": b64e(hashlib.sha256(fp).digest()),
        "ct": b64e(ct), "tag": b64e(tag),
        "criado": datetime.now(timezone.utc).isoformat(),
    }
    return json.dumps(bloco, ensure_ascii=False).encode("utf-8")


def decifrar(dados: bytes, senha: str) -> str:
    if dados[:3] == b"\xef\xbb\xbf":
        dados = dados[3:]
    bloco = json.loads(dados.decode("utf-8"))
    salt = b64d(bloco["salt"])
    iv = b64d(bloco["iv"])
    fp = fingerprint_maquina()
    esperado = b64e(hashlib.sha256(fp).digest())
    if not hmac.compare_digest(bloco.get("fp", ""), esperado):
        raise ValueError("Fingerprint de hardware diverge — dados não pertencem a esta máquina (isolamento ENIGMA ativo).")
    k_machine = hmac.new(fp, salt, "sha256").digest()
    chave = derivar_chave(senha, k_machine)
    cipher = AES.new(chave, AES.MODE_GCM, nonce=iv)
    try:
        pt = cipher.decrypt_and_verify(b64d(bloco["ct"]), b64d(bloco["tag"]))
    except ValueError:
        raise ValueError("Senha-mestra incorreta OU dados adulterados (GCM rejeitou).")
    return pt.decode("utf-8")


# ---------------------------------------------------------------------------
# Helpers base64
# ---------------------------------------------------------------------------

def b64e(b: bytes) -> str:
    return base64.b64encode(b).decode("ascii")


def b64d(s: str) -> bytes:
    return base64.b64decode(s.encode("ascii"))


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def _caminho(nome: str) -> Path:
    if not re.match(r"^[A-Za-z0-9._-]+$", nome):
        raise ValueError("Nome inválido (use letras, números, . _ -).")
    return COFRE_DIR / f"{nome}.enc"


def _ler_senha() -> str:
    """Senha via env (automação) ou prompt interativo (padrão)."""
    senha = os.environ.get("KRAEFEGG_COFRE_SENHA", "")
    if not senha:
        senha = getpass.getpass("Senha-mestra do cofre: ")
    if len(senha) < 12:
        sys.exit("ERRO: senha-mestra deve ter pelo menos 12 caracteres.")
    return senha


def cmd_put(nome: str) -> int:
    COFRE_DIR.mkdir(parents=True, exist_ok=True)
    valor = sys.stdin.read().rstrip("\n")
    if not valor:
        print("ERRO: nenhum valor no stdin.", file=sys.stderr)
        return 2
    senha = _ler_senha()
    _caminho(nome).write_bytes(cifrar(valor, senha))
    print(f"OK: '{nome}' cifrado (AES-256-GCM, PBKDF2 310k, hardware-bound) -> {_caminho(nome).name}")
    return 0


def cmd_get(nome: str) -> int:
    p = _caminho(nome)
    if not p.exists():
        print(f"ERRO: '{nome}' não existe.", file=sys.stderr)
        return 1
    senha = _ler_senha()
    try:
        print(decifrar(p.read_bytes(), senha))
    except ValueError as e:
        print(f"ERRO: {e}", file=sys.stderr)
        return 1
    return 0


def cmd_list() -> int:
    if not COFRE_DIR.exists():
        print("(cofre vazio)")
        return 0
    for p in sorted(COFRE_DIR.glob("*.enc")):
        try:
            bloco = json.loads(p.read_text("utf-8"))
            print(f"  {p.stem:32} {bloco.get('alg', '')}  criado={bloco.get('criado', '')[:19]}")
        except Exception:
            print(f"  {p.stem:32} (ilegível)")
    return 0


def cmd_check_host() -> int:
    fp = fingerprint_maquina()
    print(f"Máquina: {os.environ.get('COMPUTERNAME') or 'desconhecida'}")
    print(f"Fingerprint: {fp.hex()[:40]}...")
    if not COFRE_DIR.exists():
        print("Cofre ainda não criado.")
        return 0
    ok = True
    atual = b64e(hashlib.sha256(fp).digest())
    for p in sorted(COFRE_DIR.glob("*.enc")):
        try:
            bloco = json.loads(p.read_text("utf-8"))
        except Exception:
            continue
        st = "OK" if hmac.compare_digest(bloco.get("fp", ""), atual) else "DIVERGE"
        if st != "OK":
            ok = False
        print(f"  {p.stem:32} {st}")
    return 0 if ok else 1


def cmd_del(nome: str) -> int:
    p = _caminho(nome)
    if not p.exists():
        print(f"ERRO: '{nome}' não existe.", file=sys.stderr)
        return 1
    p.unlink()
    print(f"OK: '{nome}' removido.")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description="Cofre ENIGMA — Kraefegg M.O.")
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("list")
    sub.add_parser("check-host")
    p_put = sub.add_parser("put"); p_put.add_argument("nome")
    p_get = sub.add_parser("get"); p_get.add_argument("nome")
    p_del = sub.add_parser("del"); p_del.add_argument("nome")
    args = ap.parse_args()
    return {
        "list": cmd_list,
        "check-host": cmd_check_host,
        "put": lambda: cmd_put(args.nome),
        "get": lambda: cmd_get(args.nome),
        "del": lambda: cmd_del(args.nome),
    }[args.cmd]()


if __name__ == "__main__":
    sys.exit(main())
