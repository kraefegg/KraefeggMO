"""
Flow de processamento de demandas da Kraefegg M.O.
Usa Agent.kickoff() para cada etapa, seguindo o padrão 80/20 do CrewAI.
"""

from crewai import Agent, Task, Crew, Process
from crewai.flow import Flow, listen, start, router
from pydantic import BaseModel
from typing import Literal
import os
import json
from datetime import datetime

from .models import (
    DemandaInput,
    DecisaoExecutiva,
    PesquisaViabilidade,
    PropostaComercial,
    AnaliseFinanceira,
    DocumentoFinal,
    DecisaoCEO,
    StatusDemanda,
)


# --- Agent definitions (standalone for Flow pattern) ---

def create_agents():
    """Cria agentes standalone para uso com Agent.kickoff()."""
    return {
        "ceo": Agent(
            role="CEO da Kraefegg M.O.",
            goal=(
                "Tomar decisões estratégicas sobre demandas, aprovar/rejeitar projetos, "
                "definir prioridades e garantir que cada demanda gere valor mensurável."
            ),
            backstory=(
                "Você é o Chief Executive Officer da Kraefegg M.O., empresa de mineração, "
                "energia e engenharia ambiental operada como sistema multiagente de IA. "
                "Tem experiência consolidada em decisões executivas e segmentos nordestinos. "
                "Nunca execute trabalho especializado — delegue."
            ),
            llm="omniroute/auto/best-reasoning",
            verbose=True,
            allow_delegation=False,
        ),
        "pesquisador": Agent(
            role="Conselho de Pesquisa Técnica",
            goal=(
                "Pesquisar e analisar demandas do mercado, identificando viabilidade "
                "técnica, oportunidades, riscos e potencial de receita."
            ),
            backstory=(
                "Você é um conselho de pesquisa técnica que analisa cada demanda com "
                "base factual, consulta fontes confiáveis e produz relatórios "
                "estruturados com scores de viabilidade."
            ),
            llm="omniroute/auto/best-reasoning",
            verbose=True,
            allow_delegation=False,
        ),
        "eng_ambiental": Agent(
            role="Engenheiro Ambiental Sênior",
            goal=(
                "Desenvolver soluções técnicas para licenciamento ambiental, "
                "recuperação de áreas degradadas e estudos de impacto."
            ),
            backstory=(
                "Engenheiro ambiental com domínio de legislação brasileira (CONAMA, "
                "SISNAMA), sensoriamento remoto (NDVI), gestão hídrica e EIA/RIMA."
            ),
            llm="omniroute/auto/best-reasoning",
            verbose=True,
            allow_delegation=False,
        ),
        "eng_software": Agent(
            role="Engenheiro de Software e IoT",
            goal=(
                "Projetar soluções de software, automação e firmware IoT "
                "para os projetos digitais da Kraefegg M.O."
            ),
            backstory=(
                "Engenheiro fullstack com experiência em Python, JavaScript, APIs, "
                "Supabase, PostgreSQL, CI/CD e sistemas embarcados (ESP32, LoRa, MQTT)."
            ),
            llm="omniroute/auto/best-coding",
            verbose=True,
            allow_delegation=False,
        ),
        "comercial": Agent(
            role="Diretor Comercial",
            goal=(
                "Desenvolver propostas comerciais, estratégia de prospecção "
                "e contratos para maximizar pipeline de receita."
            ),
            backstory=(
                "Diretor comercial com experiência em B2B industrial nordestino. "
                "Domina prospecção (ABM, cold outreach), propostas e negociação."
            ),
            llm="omniroute/auto/best-chat",
            verbose=True,
            allow_delegation=False,
        ),
        "financeiro": Agent(
            role="Analista Financeiro",
            goal=(
                "Calcular orçamentos, precificação, ROI e viabilidade "
                "financeira para demandas e propostas."
            ),
            backstory=(
                "Analista financeiro com experiência em orçamento de projetos "
                "de engenharia. Dados precisos e sem erros de cálculo."
            ),
            llm="omniroute/auto/best-reasoning",
            verbose=True,
            allow_delegation=False,
        ),
        "juridico": Agent(
            role="Consultor Jurídico",
            goal=(
                "Verificar conformidade legal (LGPD, licenças, contratos) "
                "e redigir cláusulas protetivas."
            ),
            backstory=(
                "Consultor jurídico especializado em direito ambiental, regulação "
                "industrial, LGPD e contratos B2B."
            ),
            llm="omniroute/auto/best-reasoning",
            verbose=True,
            allow_delegation=False,
        ),
        "redator": Agent(
            role="Redator Técnico-Científico",
            goal=(
                "Transformar dados técnicos em relatórios e documentos "
                "de alta qualidade para entrega ao cliente."
            ),
            backstory=(
                "Redator técnico-científico com domínio de escrita corporativa "
                "em pt-BR. Transforma dados brutos em narrativas claras."
            ),
            llm="omniroute/auto/best-chat",
            verbose=True,
            allow_delegation=False,
        ),
    }


class DemandaFlow(Flow):
    """
    Flow principal de processamento de demandas.
    
    Etapas com Agent.kickoff():
    1. CEO analisa e decide
    2. Pesquisador analisa viabilidade
    3. Engenheiros desenvolvem soluções (paralelo)
    4. Comercial monta proposta
    5. Financeiro analisa
    6. Jurídico revisa
    7. Redator consolida documento final
    """

    @start()
    def receber_demanda(self) -> dict:
        """Ponto de entrada — recebe demanda do sistema."""
        # Em produção, viria do Supabase ou API
        # Por agora, retorna dict com dados da demanda
        return {
            "demanda_titulo": self.state.get("titulo", "Demanda não informada"),
            "demanda_descricao": self.state.get("descricao", ""),
            "demanda_segmento": self.state.get("segmento", "ambiental"),
            "demanda_prioridade": self.state.get("prioridade", "media"),
        }

    @listen(receber_demanda)
    def ceo_analisa(self, dados: dict) -> dict:
        """CEO analisa e decide sobre a demanda."""
        agents = create_agents()

        task = Task(
            description=(
                f"Analise a demanda e tome uma decisão executiva.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Descrição: {dados['demanda_descricao']}\n"
                f"Segmento: {dados['demanda_segmento']}\n"
                f"Prioridade: {dados['demanda_prioridade']}\n\n"
                "Avalie alinhamento estratégico, viabilidade e potencial de receita. "
                "Seja decisivo."
            ),
            expected_output=(
                "Decisão executiva com: DECISÃO (APROVADA/REJEITADA/MAIS_INFO), "
                "justificativa, departamentos envolvidos, prazo e potencial de receita."
            ),
            agent=agents["ceo"],
        )

        resultado = task.execute()
        return {**dados, "decisao_ceo": resultado}

    @router(ceo_analisa)
    def rotear_pos_decisao(self, dados: dict) -> Literal["aprovada", "rejeitada", "mais_info"]:
        """Roteamento baseado na decisão do CEO."""
        decisao = dados.get("decisao_ceo", "").upper()
        if "APROVADA" in decisao:
            return "aprovada"
        elif "REJEITADA" in decisao:
            return "rejeitada"
        return "mais_info"

    @listen(rotear_pos_decisao == "aprovada")
    def pesquisar_demanda(self, dados: dict) -> dict:
        """Pesquisa de viabilidade pela equipe técnica."""
        agents = create_agents()

        task = Task(
            description=(
                f"Pesquise e analise a viabilidade técnica da demanda.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Descrição: {dados['demanda_descricao']}\n"
                f"Segmento: {dados['demanda_segmento']}\n"
                f"Decisão do CEO: {dados['decisao_ceo']}\n\n"
                "Verifique dados de mercado, soluções similares, riscos, "
                "oportunidades e requisitos de recursos."
            ),
            expected_output=(
                "Relatório com: resumo executivo, viabilidade técnica, "
                "soluções identificadas, riscos/opportunidades, recursos necessários."
            ),
            agent=agents["pesquisador"],
        )

        resultado = task.execute()
        return {**dados, "pesquisa_resultado": resultado}

    @listen(pesquisar_demanda)
    def desenvolver_solucoes(self, dados: dict) -> dict:
        """Desenvolve soluções ambiental e de software em paralelo."""
        agents = create_agents()

        # Solução ambiental
        task_ambiental = Task(
            description=(
                f"Desenvolva a solução técnica ambiental.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Pesquisa: {dados['pesquisa_resultado']}\n\n"
                "Defina escopo, metodologia (EIA/RIMA, PCA/RCA, PRAD), "
                "cronograma, conformidade legal e estimativa de custos."
            ),
            expected_output=(
                "Documento técnico com: escopo, metodologia, cronograma, "
                "conformidade legal, estimativa de custos, indicadores de sucesso."
            ),
            agent=agents["eng_ambiental"],
            output_pydantic=None,
        )

        # Solução de software
        task_software = Task(
            description=(
                f"Projete a solução de software/IoT.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Pesquisa: {dados['pesquisa_resultado']}\n\n"
                "Defina arquitetura, stack, APIs, modelos de dados e estimativa de esforço."
            ),
            expected_output=(
                "Design técnico com: arquitetura, stack, endpoints, "
                "schema de dados, estimativa de esforço, dependências."
            ),
            agent=agents["eng_software"],
            output_pydantic=None,
        )

        # Executa ambiental primeiro (crítico), software em paralelo seria async
        resultado_ambiental = task_ambiental.execute()
        resultado_software = task_software.execute()

        return {
            **dados,
            "solucao_ambiental": resultado_ambiental,
            "solucao_software": resultado_software,
            "solucao_tecnica": f" Ambiental: {resultado_ambiental} | Software: {resultado_software}",
        }

    @listen(desenvolver_solucoes)
    def elaborar_proposta(self, dados: dict) -> dict:
        """Elabora proposta comercial."""
        agents = create_agents()

        task = Task(
            description=(
                f"Elabore a proposta comercial.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Segmento: {dados['demanda_segmento']}\n"
                f"Solução técnica: {dados['solucao_tecnica']}\n\n"
                "Inclua: sumário executivo, escopo, cronograma, investimento, "
                "condições comerciais, casos de sucesso referência."
            ),
            expected_output=(
                "Proposta comercial completa com: sumário executivo, "
                "escopo, cronograma, investimento, condições, próximos passos."
            ),
            agent=agents["comercial"],
        )

        resultado = task.execute()
        return {**dados, "proposta_comercial": resultado, "escopo_comercial": resultado}

    @listen(elaborar_proposta)
    def analise_financeira(self, dados: dict) -> dict:
        """Análise financeira da proposta."""
        agents = create_agents()

        task = Task(
            description=(
                f"Realize a análise financeira.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Solução técnica: {dados['solucao_tecnica']}\n"
                f"Proposta: {dados['proposta_comercial']}\n\n"
                "Inclua: orçamento, precificação, ROI, fluxo de caixa, payback, cenários."
            ),
            expected_output=(
                "Análise financeira com: orçamento, preço sugerido, ROI, "
                "fluxo de caixa, payback, nota de risco."
            ),
            agent=agents["financeiro"],
        )

        resultado = task.execute()
        return {**dados, "analise_financeira": resultado}

    @listen(elaborar_proposta)
    def revisao_juridica(self, dados: dict) -> dict:
        """Revisão jurídica da proposta."""
        agents = create_agents()

        task = Task(
            description=(
                f"Revisão jurídica da proposta.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Proposta: {dados['proposta_comercial']}\n\n"
                "Verifique LGPD, cláusulas contratuais, regulações, riscos legais."
            ),
            expected_output=(
                "Parecer jurídico com: conformidade LGPD, cláusulas essenciais, "
                "riscos, recomendações, aprovação condicional."
            ),
            agent=agents["juridico"],
        )

        resultado = task.execute()
        return {**dados, "parecer_juridico": resultado}

    @listen(analise_financeira)
    @listen(revisao_juridica)
    def redigir_documento_final(self, dados: dict) -> str:
        """Redige o documento final consolidado."""
        agents = create_agents()

        task = Task(
            description=(
                f"Redija o documento final de entrega.\n\n"
                f"Demanda: {dados['demanda_titulo']}\n"
                f"Solução técnica: {dados.get('solucao_tecnica', 'N/A')}\n"
                f"Análise financeira: {dados.get('analise_financeira', 'N/A')}\n"
                f"Parecer jurídico: {dados.get('parecer_juridico', 'N/A')}\n"
                f"Proposta: {dados.get('proposta_comercial', 'N/A')}\n\n"
                "Consolide tudo em documento executivo profissional com capa, "
                "sumário, corpo técnico e anexos."
            ),
            expected_output=(
                "Documento executivo com: capa, sumário executivo, introdução, "
                "corpo técnico, análise financeira, aspectos jurídicos, "
                "cronograma, próximos passos."
            ),
            agent=agents["redator"],
        )

        resultado = task.execute()

        # Salva output
        output_dir = os.path.join(os.path.dirname(__file__), "..", "output")
        os.makedirs(output_dir, exist_ok=True)
        filename = dados["demanda_titulo"].replace(" ", "_").lower()
        filepath = os.path.join(output_dir, f"{filename}.md")
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(resultado)

        return resultado
