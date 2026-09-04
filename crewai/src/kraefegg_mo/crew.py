from crewai import Agent, Task, Crew, Process
from crewai.project import CrewBase, agent, task, crew
from litellm import completion

from .guardrails import (
    validate_decisao_ceo,
    validate_pesquisa,
    validate_proposta,
    validate_no_secrets,
    validate_documento_final,
)

# Modelo barato para tool calling / funções simples (otimização de custo)
# Troque pela sua config real do OmniRoute quando disponível
FUNCTION_CALLING_LLM = "omniroute/auto/best-fast"


def _with_function_llm(agent_config: dict) -> Agent:
    """Cria Agent com function_calling_llm otimizado."""
    return Agent(config=agent_config, function_calling_llm=FUNCTION_CALLING_LLM)


@CrewBase
class KraefeggDemandaCrew:
    """Crew para processamento de demandas da Kraefegg M.O."""

    agents_config = "config/agents.yaml"
    tasks_config = "config/tasks.yaml"

    # --- Agents ---

    @agent
    def ceo(self) -> Agent:
        return _with_function_llm(self.agents_config["ceo"])

    @agent
    def pesquisador_conselho(self) -> Agent:
        return Agent(config=self.agents_config["pesquisador_conselho"])

    @agent
    def engenheiro_ambiental(self) -> Agent:
        return Agent(config=self.agents_config["engenheiro_ambiental"])

    @agent
    def engenheiro_software(self) -> Agent:
        return Agent(config=self.agents_config["engenheiro_software"])

    @agent
    def comercial(self) -> Agent:
        return Agent(config=self.agents_config["comercial"])

    @agent
    def analista_financeiro(self) -> Agent:
        return Agent(config=self.agents_config["analista_financeiro"])

    @agent
    def juridico(self) -> Agent:
        return Agent(config=self.agents_config["juridico"])

    @agent
    def redator(self) -> Agent:
        return Agent(config=self.agents_config["redator"])

    # --- Tasks ---

    @task
    def analise_demanda_ceo(self) -> Task:
        return Task(
            config=self.tasks_config["analise_demanda_ceo"],
            guardrail=validate_decisao_ceo,
            guardrail_max_retries=2,
        )

    @task
    def pesquisa_demanda(self) -> Task:
        return Task(
            config=self.tasks_config["pesquisa_demanda"],
            context=[self.analise_demanda_ceo()],
            guardrail=validate_pesquisa,
            guardrail_max_retries=2,
        )

    @task
    def desenvolvimento_ambiental(self) -> Task:
        return Task(
            config=self.tasks_config["desenvolvimento_ambiental"],
            context=[self.pesquisa_demanda()],
            guardrail=validate_no_secrets,
        )

    @task
    def desenvolvimento_software(self) -> Task:
        return Task(
            config=self.tasks_config["desenvolvimento_software"],
            context=[self.pesquisa_demanda()],
            async_execution=True,
            guardrail=validate_no_secrets,
        )

    @task
    def proposta_comercial(self) -> Task:
        return Task(
            config=self.tasks_config["proposta_comercial"],
            context=[self.pesquisa_demanda(), self.desenvolvimento_ambiental()],
            guardrail=validate_proposta,
        )

    @task
    def analise_financeira(self) -> Task:
        return Task(
            config=self.tasks_config["analise_financeira"],
            context=[self.proposta_comercial(), self.desenvolvimento_ambiental()],
            guardrail=validate_no_secrets,
        )

    @task
    def revisao_juridica(self) -> Task:
        return Task(
            config=self.tasks_config["revisao_juridica"],
            context=[self.proposta_comercial()],
            guardrail=validate_no_secrets,
        )

    @task
    def redacao_documento(self) -> Task:
        return Task(
            config=self.tasks_config["redacao_documento"],
            context=[
                self.desenvolvimento_ambiental(),
                self.analise_financeira(),
                self.revisao_juridica(),
            ],
            output_file="output/{demanda_titulo}.md",
            guardrail=validate_documento_final,
        )

    # --- Crew ---

    @crew
    def crew(self) -> Crew:
        return Crew(
            agents=self.agents,
            tasks=self.tasks,
            process=Process.sequential,
            verbose=True,
        )
