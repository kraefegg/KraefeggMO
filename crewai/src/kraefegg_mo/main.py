"""
Kraefegg M.O. — CrewAI Demand Processing Flow

Uso:
    python -m kraefegg_mo.main

Ou importar e usar:
    from kraefegg_mo import DemandaFlow

    flow = DemandaFlow()
    result = flow.kickoff(inputs={
        "titulo": "Estudo de Viabilidade - Parque Eólico",
        "descricao": "Análise de viabilidade para instalação de parque eólico...",
        "segmento": "energia",
        "prioridade": "alta",
    })
"""

import os
import json
from datetime import datetime
from dotenv import load_dotenv

from kraefegg_mo.flow import DemandaFlow


def main():
    load_dotenv()

    print("=" * 60)
    print("  KRAEFEGG M.O. — Processamento de Demandas (CrewAI)")
    print("=" * 60)

    # Exemplo de demanda
    demanda = {
        "titulo": "Estudo de Viabilidade - Parque Eólico Litoral Norte",
        "descricao": (
            "Desenvolver estudo de viabilidade técnica e ambiental para "
            "instalação de parque eólico de 50MW no litoral norte da "
            "Paraíba, incluindo EIA/RIMA, análise de vento, impacto "
            "visual e acústico, e proposta comercial para o empreendedor."
        ),
        "segmento": "energia",
        "prioridade": "alta",
    }

    print(f"\n📋 Demanda: {demanda['titulo']}")
    print(f"   Segmento: {demanda['segmento']}")
    print(f"   Prioridade: {demanda['prioridade']}")

    print("\n🔄 Iniciando processamento...")
    start_time = datetime.now()

    flow = DemandaFlow()
    resultado = flow.kickoff(inputs=demanda)

    elapsed = (datetime.now() - start_time).total_seconds()

    print(f"\n✅ Processamento concluído em {elapsed:.1f}s")
    print(f"📄 Documento salvo em output/{demanda['titulo'].replace(' ', '_').lower()}.md")

    return resultado


if __name__ == "__main__":
    main()
