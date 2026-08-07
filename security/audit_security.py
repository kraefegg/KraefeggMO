#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Auditor de Segurança & Compliance — Kraefegg M.O.
--------------------------------------------------
Protocolo de segurança nível Hard: varre segredos vazados, valida a matriz de
acesso por pasta/subpasta, confirma conformidade LGPD/ISO 27001/GDPR e registra
trilha de auditoria imutável (append-only) em security/audit_log.jsonl.

Uso:
    python security/audit_security.py                 # auditoria completa (exit 0 = OK)
    python security/audit_security.py --scan-only     # só scan de segredos
    python security/audit_security.py --matrix-only   # só matriz de acesso
    python security/audit_security.py --json          # saída JSON (exit code continua semântico)

Exit codes:
    0 = aprovado | 1 = violações encontradas | 2 = erro de execução
"""
from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Saída UTF-8 independente do console (Windows cp1252 etc.)
for _stream in (sys.stdout, sys.stderr):
    if _stream and hasattr(_stream, "reconfigure"):
        try:
            _stream.reconfigure(encoding="utf-8", errors="replace")
        except (OSError, ValueError):
            pass

REPO_ROOT = Path(__file__).resolve().parent.parent
AUDIT_LOG = Path(__file__).resolve().parent / "audit_log.jsonl"

# ---------------------------------------------------------------------------
# Níveis de acesso (do menor para o maior sensibilidade)
# ---------------------------------------------------------------------------
NIVEIS = ["PUBLICO", "INTERNO", "RESTRITO", "CONFIDENCIAL", "SEGREDO_PRE_PATENTE"]

# ---------------------------------------------------------------------------
# Matriz de acesso: cada entrada mapeia um padrão de caminho a um nível.
# O primeiro padrão que casar (ordem de lista) define o nível do arquivo.
# ---------------------------------------------------------------------------
MATRIZ_ACESSO: List[Tuple[str, str]] = [
    # Segredo / pré-patente: nunca versionar
    ("security/segredos/", "SEGREDO_PRE_PATENTE"),
    ("patentes/", "SEGREDO_PRE_PATENTE"),
    ("pesquisa/pre-patente/", "SEGREDO_PRE_PATENTE"),
    # Confidencial: só com NDA / direção
    ("comercial/", "CONFIDENCIAL"),
    ("financeiro/", "CONFIDENCIAL"),
    ("legal/", "CONFIDENCIAL"),
    ("plano-operacional.md", "CONFIDENCIAL"),
    ("prospeccao-30-90.md", "CONFIDENCIAL"),
    # Restrito: credenciais em disco (nunca versionar)
    ("db/.env", "RESTRITO"),
    ("db/mongodb/.env", "RESTRITO"),
    (".env", "RESTRITO"),
    ("*.env", "RESTRITO"),
    ("*.local", "RESTRITO"),
    ("*.pem", "RESTRITO"),
    ("*.key", "RESTRITO"),
    # Público: divulgável (GitHub Pages, repo aberto)
    ("hq/", "PUBLICO"),
    ("db/", "PUBLICO"),
    ("docs/", "PUBLICO"),
    ("rd/", "PUBLICO"),
    (".opencode/", "PUBLICO"),
    (".github/", "PUBLICO"),
    ("AGENTS.md", "PUBLICO"),
    ("README.md", "PUBLICO"),
    ("deploy-github-pages.ps1", "PUBLICO"),
    ("opencode.json", "PUBLICO"),
    (".gitignore", "PUBLICO"),
    (".gitattributes", "PUBLICO"),
    ("security/audit_security.py", "PUBLICO"),
    ("security/audit_log.jsonl", "PUBLICO"),
    ("security/.env.template", "PUBLICO"),
    ("security/cofre.py", "PUBLICO"),
    ("security/databricks.py", "PUBLICO"),
    ("security/hooks/", "PUBLICO"),
]

# Nível máximo permitido versionado no repo público
NIVEL_MAX_VERSIONADO = "PUBLICO"

# ---------------------------------------------------------------------------
# Padrões de segredo (regex). Cada um tem: nome, regex, e se é bloqueante.
# ---------------------------------------------------------------------------
SEGREDO_PADROES: List[Dict[str, object]] = [
    {"nome": "GitHub PAT (ghp_)", "regex": r"\bghp_[A-Za-z0-9]{20,}\b", "bloqueante": True},
    {"nome": "GitHub PAT (github_pat_)", "regex": r"\bgithub_pat_[A-Za-z0-9_]{30,}\b", "bloqueante": True},
    {"nome": "GitHub OAuth token", "regex": r"\bgho_[A-Za-z0-9_]{30,}\b", "bloqueante": True},
    {"nome": "GitHub App token", "regex": r"\bghu_[A-Za-z0-9_]{30,}\b", "bloqueante": True},
    {"nome": "OpenAI key", "regex": r"\bsk-(?:proj-)?[A-Za-z0-9_-]{20,}\b", "bloqueante": True},
    {"nome": "Anthropic key", "regex": r"\bsk-ant-[A-Za-z0-9_-]{20,}\b", "bloqueante": True},
    {"nome": "Supabase anon/service key", "regex": r"\b(?:sbp_|eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp)[A-Za-z0-9_.-]{20,}\b", "bloqueante": True},
    {"nome": "AWS Access Key", "regex": r"\bAKIA[0-9A-Z]{16}\b", "bloqueante": True},
    {"nome": "MongoDB Atlas URI", "regex": r"\bmongodb(?:\+srv)?:\/\/[^\s\"'<>]{10,}@[^\s\"'<>]+\b", "bloqueante": True},
    {"nome": "PostgreSQL URI", "regex": r"\bpostgres(?:ql)?:\/\/[^\s\"'<>]+:[^\s\"'<>]+@[^\s\"'<>]+\b", "bloqueante": True},
    {"nome": "Chave privada RSA/EC", "regex": r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----", "bloqueante": True},
    {"nome": "Senha em URI genérica", "regex": r"://[\w.-]+:[\w@!$%&*+-]{8,}@", "bloqueante": True},
    {"nome": "Token OmniRoute/API", "regex": r"\b(?:OMNIROUTE|SUPABASE|ATLAS|GITHUB)_[A-Z0-9_]*KEY\s*=\s*.+", "bloqueante": False},
    {"nome": "JWT/secret genérico", "regex": r"\b(?:JWT|API_KEY|SECRET|PASSWORD|PASSWD)\s*=\s*.+", "bloqueante": False},
]

# Arquivos/caminhos sempre ignorados no scan de segredos
SCAN_IGNORA = {
    "security/audit_security.py",
    "security/audit_log.jsonl",
    "security/matriz_acesso.json",
    ".git/",
}

# Extensões binárias e artefatos que não devem ser varridos
EXTENSAO_IGNORA = {
    ".png", ".jpg", ".jpeg", ".gif", ".webp", ".ico", ".woff", ".woff2",
    ".ttf", ".eot", ".sqlite", ".db", ".zip", ".gz", ".exe", ".dll", ".pdf",
}

# ---------------------------------------------------------------------------
# Utilitários
# ---------------------------------------------------------------------------

def git(raiz: Path, *args: str) -> str:
    r = subprocess.run(["git", "-C", str(raiz), *args], capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} falhou: {r.stderr.strip()}")
    return r.stdout


def nivel_para(caminho: str) -> str:
    c = caminho.replace("\\", "/")
    for padrao, nivel in MATRIZ_ACESSO:
        p = padrao.replace("\\", "/")
        if p.endswith("/"):
            if c.startswith(p) or ("/" + p) in c:
                return nivel
        elif c == p or c.endswith("/" + p) or c.startswith(p + "/"):
            return nivel
    return "INTERNO"  # default conservador


def classificacao(nivel: str) -> int:
    return NIVEIS.index(nivel)


def nivel_max() -> int:
    return NIVEIS.index(NIVEL_MAX_VERSIONADO)


# ---------------------------------------------------------------------------
# Scan de segredos
# ---------------------------------------------------------------------------

def _caminhos_versionados() -> List[Path]:
    caminhos: List[Path] = []
    for rel in git(REPO_ROOT, "ls-files", "-z").split("\x00"):
        if rel:
            caminhos.append(REPO_ROOT / rel)
    return caminhos


def _caminhos_para_varredura(scan_only: bool = False) -> List[Path]:
    caminhos: List[Path] = _caminhos_versionados()
    # além disso, arquivos não versionados presentes em disco
    if not scan_only:
        for p in REPO_ROOT.rglob("*"):
            if p.is_file() and ".git" not in p.parts and p.suffix.lower() not in EXTENSAO_IGNORA:
                rel = p.relative_to(REPO_ROOT).as_posix()
                if rel not in {x for x in SCAN_IGNORA} and not any(
                    rel.startswith(i) for i in SCAN_IGNORA if i.endswith("/")
                ):
                    caminhos.append(p)
    # deduplica preservando ordem
    vistos: set = set()
    unicos: List[Path] = []
    for p in caminhos:
        rp = str(p.resolve())
        if rp not in vistos:
            vistos.add(rp)
            unicos.append(p)
    return unicos


def _ler_bytes(p: Path) -> Optional[bytes]:
    try:
        return p.read_bytes()
    except OSError:
        return None


def _decodificar(b: bytes) -> str:
    for enc in ("utf-8", "latin-1"):
        try:
            return b.decode(enc)
        except (UnicodeDecodeError, ValueError):
            continue
    return b.decode("utf-8", errors="replace")


def scan_segredos(caminhos: List[Path], versionados: Optional[set] = None) -> List[Dict[str, object]]:
    achados: List[Dict[str, object]] = []
    versionados = versionados or set()
    for p in caminhos:
        if p.suffix.lower() in EXTENSAO_IGNORA:
            continue
        raw = _ler_bytes(p)
        if raw is None:
            continue
        texto = _decodificar(raw)
        for padrao in SEGREDO_PADROES:
            for m in re.finditer(str(padrao["regex"]), texto, re.MULTILINE):
                # contexto da linha (trunca a parte do valor)
                linha_inicio = texto.rfind("\n", 0, m.start()) + 1
                linha_fim = texto.find("\n", m.end())
                if linha_fim == -1:
                    linha_fim = len(texto)
                contexto = texto[linha_inicio:linha_fim].strip()[:200]
                valor = m.group(0)
                # mascara o segredo na trilha
                valor_mascarado = (valor[:6] + "..." + valor[-4:]) if len(valor) > 12 else "***"
                # placeholders didaticos nao contam como segredo
                if _e_placeholder(valor):
                    continue
                eh_versionado = str(p.resolve()) in versionados
                achados.append({
                    "arquivo": p.relative_to(REPO_ROOT).as_posix(),
                    "padrao": padrao["nome"],
                    "valor": valor_mascarado,
                    "contexto": contexto,
                    "bloqueante": bool(padrao["bloqueante"]) and eh_versionado,
                    "versionado": eh_versionado,
                    "linha": texto.count("\n", 0, m.start()) + 1,
                })
    return achados


def _e_placeholder(v: str) -> bool:
    marca = re.compile(r"<(?:SENHA|PROJETO|REF|USUARIO|CLUSTER|PASSWORD|PASS|TOKEN|KEY|SECRET|\.\.\.)>|XXXX+|<ref>|CHANGEME|example|placeholder", re.IGNORECASE)
    return bool(marca.search(v))


# ---------------------------------------------------------------------------
# Matriz de acesso
# ---------------------------------------------------------------------------

def audit_matriz(caminhos: List[Path]) -> Tuple[List[Dict[str, object]], Dict[str, int]]:
    violacoes: List[Dict[str, object]] = []
    por_nivel: Dict[str, int] = {n: 0 for n in NIVEIS}
    for p in caminhos:
        rel = p.relative_to(REPO_ROOT).as_posix()
        if rel.startswith(".git/"):
            continue
        nivel = nivel_para(rel)
        por_nivel[nivel] = por_nivel.get(nivel, 0) + 1
        if classificacao(nivel) > nivel_max():
            violacoes.append({
                "arquivo": rel,
                "nivel": nivel,
                "acima_de": NIVEL_MAX_VERSIONADO,
                "motivo": f"Arquivo nível {nivel} versionado no repo público (máximo {NIVEL_MAX_VERSIONADO}).",
            })
    return violacoes, por_nivel


# ---------------------------------------------------------------------------
# Conformidade (LGPD / ISO 27001 / GDPR / patentes)
# ---------------------------------------------------------------------------

def audit_conformidade(caminhos: List[Path], por_nivel: Dict[str, int]) -> List[Dict[str, object]]:
    itens: List[Dict[str, object]] = []
    rels = {p.relative_to(REPO_ROOT).as_posix() for p in caminhos}

    # 1. .env nunca versionado
    envs = [r for r in rels if r.endswith(".env") or r.endswith(".env.local")]
    if envs:
        itens.append({"controle": "LGPD/ISO 27001 A.10 (criptografia)", "status": "FALHA",
                      "detalhe": f"Arquivos .env versionados: {envs}"})
    else:
        itens.append({"controle": "LGPD/ISO 27001 A.10 (criptografia)", "status": "OK",
                      "detalhe": "Nenhum .env versionado."})

    # 2. NDA obrigatório para pasta comercial
    nda = any("comercial/" in r for r in rels)
    if nda and not any("nda" in r.lower() for r in rels):
        itens.append({"controle": "LGPD Art. 5/6 + NDA", "status": "ALERTA",
                      "detalhe": "Pasta comercial contém arquivos mas não há NDA registrado."})
    elif not nda:
        itens.append({"controle": "LGPD Art. 5/6 + NDA", "status": "OK",
                      "detalhe": "Nenhum arquivo comercial versionado."})
    else:
        itens.append({"controle": "LGPD Art. 5/6 + NDA", "status": "OK",
                      "detalhe": "NDA presente."})

    # 3. Trilha de auditoria (trilha existe?)
    if AUDIT_LOG.exists():
        itens.append({"controle": "ISO 27001 A.12.4 (registro de auditoria)", "status": "OK",
                      "detalhe": f"Trilha de auditoria em {AUDIT_LOG.name}."})
    else:
        itens.append({"controle": "ISO 27001 A.12.4 (registro de auditoria)", "status": "ALERTA",
                      "detalhe": "Trilha de auditoria não criada ainda (será criada nesta execução)."})

    # 4. Pré/pós-patentes
    pat_segredo = por_nivel.get("SEGREDO_PRE_PATENTE", 0)
    if pat_segredo:
        itens.append({"controle": "Proteção de pré/pós-patentes", "status": "FALHA",
                      "detalhe": f"{pat_segredo} arquivo(s) nível SEGREDO_PRE_PATENTE detectado(s) em disco/versionados."})
    else:
        itens.append({"controle": "Proteção de pré/pós-patentes", "status": "OK",
                      "detalhe": "Nenhum artefato de pré-patente exposto."})

    return itens


# ---------------------------------------------------------------------------
# Trilha de auditoria (append-only)
# ---------------------------------------------------------------------------

def registrar_trilha(resumo: Dict[str, object]) -> None:
    AUDIT_LOG.parent.mkdir(parents=True, exist_ok=True)
    registro = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "usuario": os.environ.get("USERNAME") or os.environ.get("USER") or "desconhecido",
        "host": os.environ.get("COMPUTERNAME") or os.environ.get("HOSTNAME") or "local",
        **resumo,
    }
    with AUDIT_LOG.open("a", encoding="utf-8") as f:
        f.write(json.dumps(registro, ensure_ascii=False) + "\n")


# ---------------------------------------------------------------------------
# Relatório
# ---------------------------------------------------------------------------

def main() -> int:
    ap = argparse.ArgumentParser(description="Auditor de Segurança & Compliance Kraefegg M.O.")
    ap.add_argument("--scan-only", action="store_true", help="Apenas scan de segredos")
    ap.add_argument("--matrix-only", action="store_true", help="Apenas matriz de acesso")
    ap.add_argument("--json", action="store_true", help="Saída em JSON")
    ap.add_argument("--no-audit-log", action="store_true", help="Não gravar trilha de auditoria")
    args = ap.parse_args()

    try:
        caminhos = _caminhos_para_varredura(scan_only=args.scan_only)
    except RuntimeError as e:
        print(f"ERRO: {e}", file=sys.stderr)
        return 2

    report: Dict[str, object] = {
        "ts": datetime.now(timezone.utc).isoformat(),
        "repo": str(REPO_ROOT),
        "arquivos_varridos": len(caminhos),
    }

    segredos: List[Dict[str, object]] = []
    matriz_viol: List[Dict[str, object]] = []
    conformidade: List[Dict[str, object]] = []
    por_nivel: Dict[str, int] = {}

    versionados: List[Path] = _caminhos_versionados()
    versionados_resolvidos = {str(p.resolve()) for p in versionados}

    if not args.matrix_only:
        segredos = scan_segredos(caminhos, versionados_resolvidos)
        report["segredos"] = segredos
        report["segredos_bloqueantes"] = sum(1 for s in segredos if s["bloqueante"])

    if not args.scan_only:
        matriz_viol, por_nivel = audit_matriz(versionados)
        conformidade = audit_conformidade(versionados, por_nivel)
        report["matriz_violacoes"] = matriz_viol
        report["por_nivel"] = por_nivel
        report["conformidade"] = conformidade

    bloqueantes = report.get("segredos_bloqueantes", 0)
    total_viol = bloqueantes + len(matriz_viol)
    report["aprovado"] = total_viol == 0

    # saída
    if args.json:
        print(json.dumps(report, ensure_ascii=False, indent=2))
    else:
        print("=" * 70)
        print(f"AUDITOR DE SEGURANÇA — Kraefegg M.O.  ({report['ts'][:19]}Z)")
        print(f"Repo: {report['repo']}  |  Arquivos varridos: {report['arquivos_varridos']}")
        print("=" * 70)

        if not args.matrix_only:
            print(f"\n[1] SCAN DE SEGREDOS: {len(segredos)} achado(s), "
                  f"{report.get('segredos_bloqueantes', 0)} bloqueante(s)")
            for s in segredos:
                origem = "versionado" if s["versionado"] else "local/ignorado"
                print(f"  [{origem:15}] {s['arquivo']}:{s['linha']} - {s['padrao']} -> {s['valor']}")

        if not args.scan_only:
            print(f"\n[2] MATRIZ DE ACESSO: {len(matriz_viol)} violação(ões)")
            for v in matriz_viol:
                print(f"  [VIOLAÇÃO] {v['arquivo']} → nível {v['nivel']} (máx {NIVEL_MAX_VERSIONADO})")
            if por_nivel:
                dist = ", ".join(f"{k}={v}" for k, v in por_nivel.items() if v)
                print(f"  Distribuição: {dist}")

            print(f"\n[3] CONFORMIDADE (LGPD / ISO 27001 / GDPR / patentes):")
            for c in conformidade:
                print(f"  [{c['status']:6}] {c['controle']} — {c['detalhe']}")

        print("\n" + "=" * 70)
        print("RESULTADO:", "APROVADO" if report["aprovado"] else "REPROVADO")
        print("=" * 70)

    if not args.no_audit_log:
        registrar_trilha({k: report[k] for k in ("arquivos_varridos", "segredos_bloqueantes", "matriz_violacoes", "aprovado") if k in report})

    return 0 if report["aprovado"] else 1


if __name__ == "__main__":
    sys.exit(main())
