from pydantic import BaseModel, Field
from enum import Enum
from datetime import datetime


class StatusDemanda(str, Enum):
    PENDENTE = "pendente"
    EM_ANALISE = "em_analise"
    APROVADA = "aprovada"
    REJEITADA = "rejeitada"
    EM_DESENVOLVIMENTO = "em_desenvolvimento"
    CONCLUIDA = "concluida"


class SegmentoMercado(str, Enum):
    MINERACAO = "mineração"
    ENERGIA = "energia"
    AMBIENTAL = "ambiental"
    HIBRIDO = "hibrido"


class Prioridade(str, Enum):
    BAIXA = "baixa"
    MEDIA = "media"
    ALTA = "alta"
    CRITICA = "critica"


class DecisaoCEO(str, Enum):
    APROVADA = "APROVADA"
    REJEITADA = "REJEITADA"
    MAIS_INFO = "MAIS_INFO_NECESSARIA"


class DemandaInput(BaseModel):
    """Entrada: demanda recebida do sistema."""
    id: str = Field(description="ID da demanda (ex: D-23)")
    titulo: str = Field(description="Título da demanda")
    descricao: str = Field(description="Descrição detalhada")
    segmento: SegmentoMercado = Field(description="Segmento de mercado")
    prioridade: Prioridade = Field(default=Prioridade.MEDIA)
    cliente: str = Field(default="", description="Nome do cliente")
    valor_estimado: float = Field(default=0.0, description="Valor estimado em R$")


class DecisaoExecutiva(BaseModel):
    """Saída: decisão do CEO sobre a demanda."""
    decisao: DecisaoCEO
    justificativa: str
    departamentos: list[str]
    prazo_sugerido: str = ""
    potencial_receita: str = ""


class PesquisaViabilidade(BaseModel):
    """Saída: relatório de pesquisa do conselho."""
    resumo: str
    viabilidade: str = Field(description="alto/médio/baixo")
    solucoes: list[str]
    riscos: list[str]
    oportunidades: list[str]
    recursos_necessarios: str
    referencias: list[str]


class PropostaComercial(BaseModel):
    """Saída: proposta comercial estruturada."""
    sumario_executivo: str
    escopo: str
    cronograma: str
    investimento: str
    condicoes: str
    proximos_passos: str


class AnaliseFinanceira(BaseModel):
    """Saída: análise financeira da demanda."""
    orcamento: str
    preco_sugerido: str
    roi_projetado: str
    payback: str
    risco_financeiro: str = Field(description="baixo/médio/alto")


class DocumentoFinal(BaseModel):
    """Saída: documento consolidado de entrega."""
    titulo: str
    sumario_executivo: str
    corpo_tecnico: str
    analise_financeira: str
    aspectos_juridicos: str
    cronograma: str
    proximos_passos: str
