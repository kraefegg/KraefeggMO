#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Conector Databricks — Kraefegg M.O.
-----------------------------------
Le as credenciais Databricks do Cofre ENIGMA (security/cofre.py) e provê
acesso por OpenSharing (Delta Sharing) para demandas de dados da empresa.

Credenciais esperadas no cofre (segredos cifrados):
  databricks_opensharing_id   -> OpenSharing ID (ex.: aws:us-east-2:<id>)
  databricks_github_token     -> token GitHub usado na integração Databricks<->GitHub
  databricks_pat              -> (opcional) PAT do workspace Databricks

Uso:
    set KRAEFEGG_COFRE_SENHA=<senha-mestra>   (ou prompt interativo)
    python security/databricks.py status          # checa credenciais no cofre
    python security/databricks.py shares <url>    # lista shares do endpoint OpenSharing
    python security/databricks.py query <url> <share> <schema.table> [--limit 50]

Sem um endpoint OpenSharing do provedor, os comandos shares/query não têm
para onde conectar — status e validacao de credenciais ainda funcionam.
"""
from __future__ import annotations

import argparse
import base64
import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO_ROOT / "security"))

import cofre  # noqa: E402

NOME_ID = "databricks_opensharing_id"
NOME_TOKEN = "databricks_github_token"
NOME_PAT = "databricks_pat"


def _ler_segredo(nome: str) -> str:
    p = cofre._caminho(nome)
    if not p.exists():
        return ""
    return cofre.decifrar(p.read_bytes(), cofre._ler_senha())


def _b64(s: str) -> str:
    return base64.b64encode(s.encode("utf-8")).decode("ascii")


def status() -> int:
    ok = True
    for nome, rotulo in ((NOME_ID, "OpenSharing ID"), (NOME_TOKEN, "Token GitHub (Databricks)"), (NOME_PAT, "PAT workspace (opcional)")):
        try:
            v = _ler_segredo(nome)
        except ValueError as e:
            print(f"  {rotulo:34} ERRO: {e}")
            ok = False
            continue
        if v:
            m = v if nome == NOME_ID else (v[:10] + "..." + v[-4:])
            print(f"  {rotulo:34} OK  ({m})")
        elif nome == NOME_PAT:
            print(f"  {rotulo:34} (não configurado — opcional)")
        else:
            print(f"  {rotulo:34} FALTANDO no cofre")
            ok = False
    return 0 if ok else 1


def _shares_endpoint(url: str) -> str:
    return url.rstrip("/") + "/delta-sharing/shares"


def _request(url: str, token: str) -> dict:
    req = urllib.request.Request(url, headers={
        "Authorization": f"Bearer {token}",
        "Accept": "application/json",
    })
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.loads(resp.read().decode("utf-8"))


def shares(url: str) -> int:
    id_ = _ler_segredo(NOME_ID)
    tok = _ler_segredo(NOME_TOKEN)
    if not id_:
        print("ERRO: OpenSharing ID não está no cofre.", file=sys.stderr)
        return 1
    ep = _shares_endpoint(url)
    print(f"Endpoint OpenSharing: {ep}")
    print(f"Share credential:     {id_}")
    try:
        dados = _request(ep, tok)
        for s in dados.get("shares", []):
            print(f"  share: {s.get('name')}  id={s.get('id')}")
        return 0
    except urllib.error.HTTPError as e:
        print(f"ERRO HTTP {e.code}: {e.reason}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"ERRO: {e}", file=sys.stderr)
        return 1


def query(url: str, share: str, tabela: str, limit: int) -> int:
    id_ = _ler_segredo(NOME_ID)
    tok = _ler_segredo(NOME_TOKEN)
    if not id_:
        print("ERRO: OpenSharing ID não está no cofre.", file=sys.stderr)
        return 1
    ep = f"{url.rstrip('/')}/delta-sharing/shares/{share}/query"
    body = json.dumps({
        "share": share,
        "schema": tabela.split(".")[0] if "." in tabela else "",
        "table": tabela.split(".")[-1],
        "maxFiles": 10,
    }).encode("utf-8")
    req = urllib.request.Request(ep, data=body, headers={
        "Authorization": f"Bearer {tok}",
        "Accept": "application/x-ndjson",
        "Content-Type": "application/json",
    })
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            for i, linha in enumerate(resp):
                if i >= limit:
                    break
                print(linha.decode("utf-8").rstrip())
        return 0
    except urllib.error.HTTPError as e:
        print(f"ERRO HTTP {e.code}: {e.reason}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"ERRO: {e}", file=sys.stderr)
        return 1


def main() -> int:
    ap = argparse.ArgumentParser(description="Conector Databricks (OpenSharing) — Kraefegg M.O.")
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("status")
    p_shares = sub.add_parser("shares"); p_shares.add_argument("url")
    p_query = sub.add_parser("query"); p_query.add_argument("url"); p_query.add_argument("share"); p_query.add_argument("tabela"); p_query.add_argument("--limit", type=int, default=50)
    args = ap.parse_args()
    try:
        if args.cmd == "status":
            return status()
        if args.cmd == "shares":
            return shares(args.url)
        if args.cmd == "query":
            return query(args.url, args.share, args.tabela, args.limit)
    except ValueError as e:
        print(f"ERRO do cofre: {e}", file=sys.stderr)
        return 1
    return 2


if __name__ == "__main__":
    sys.exit(main())
