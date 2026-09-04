"""
Guardrails para validação de output das tasks do CrewAI.
"""

import re
from typing import Any


def validate_decisao_ceo(output) -> tuple[bool, Any]:
    """Valida se a decisão do CEO contém os campos obrigatórios."""
    raw = output.raw if hasattr(output, "raw") else str(output)

    required = ["APROVADA", "REJEITADA", "MAIS_INFO"]
    has_decisao = any(d in raw.upper() for d in required)

    if not has_decisao:
        return (False, "Output não contém decisão válida (APROVADA/REJEITADA/MAIS_INFO).")

    if len(raw) < 100:
        return (False, "Justificativa muito curta. Mínimo de 100 caracteres.")

    return (True, output)


def validate_pesquisa(output) -> tuple[bool, Any]:
    """Valida se a pesquisa tem conteúdo substancial."""
    raw = output.raw if hasattr(output, "raw") else str(output)

    if len(raw) < 300:
        return (False, f"Pesquisa muito curta ({len(raw)} chars). Mínimo 300.")

    # Verifica se tem alguma menção de viabilidade
    viab = ["alto", "médio", "baixo", "alta", "media"]
    if not any(v in raw.lower() for v in viab):
        return (False, "Pesquisa não contém avaliação de viabilidade (alto/médio/baixo).")

    return (True, output)


def validate_proposta(output) -> tuple[bool, Any]:
    """Valida se a proposta tem seções essenciais."""
    raw = output.raw if hasattr(output, "raw") else str(output)

    if len(raw) < 500:
        return (False, f"Proposta muito curta ({len(raw)} chars). Mínimo 500.")

    return (True, output)


def validate_documento_final(output) -> tuple[bool, Any]:
    """Valida se o documento final tem estrutura executiva."""
    raw = output.raw if hasattr(output, "raw") else str(output)

    if len(raw) < 1000:
        return (False, f"Documento muito curto ({len(raw)} chars). Mínimo 1000.")

    return (True, output)


def validate_no_secrets(output) -> tuple[bool, Any]:
    """Valida que o output não contém segredos/chaves."""
    raw = output.raw if hasattr(output, "raw") else str(output)

    patterns = [
        r"(?:api[_-]?key|token|secret|password|senha|chave)\s*[:=]\s*\S+",
        r"sb_publishable_[a-zA-Z0-9_-]+",
        r"gho_[a-zA-Z0-9]+",
        r"pat_[a-zA-Z0-9]+",
    ]

    for pattern in patterns:
        if re.search(pattern, raw, re.IGNORECASE):
            return (False, f"Output contém possível segredo (match: {pattern}). Revise.")

    return (True, output)
