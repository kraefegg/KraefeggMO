# SKILL: Análise de Oportunidade Mineral

## Versão
1.0.0 | Autor: Mining Department

## Propósito
Avaliar projetos minerais do ponto de vista técnico e econômico, estimando DEM (Depósito Estimado Mineral), LOM (Life of Mine), CAPEX/OPEX e viabilidade financeira para decisões de investimento.

## Escopo
- Estimativa de DEM (JORC) ou RECURSO (NI 43-101)
- Modelagem financeira: fluxo de caixa, VPL, TIR, payback
- Dimensionamento de mina: taxa de produção, método de lavra
- Análise de sensibilidade e cenários de mercado

## Quando Usar
- Avaliação de aquisição de ativo mineral
- Decisão de investimento em fase de pré-viabilidade ou viabilidade
- Subsídio a captação de recursos (equity, dívida, royalties)
- Comparação de projetos minerais para alocação de capital

## Quando NÃO Usar
- Estimativa de recursos geológicos puros (usar geological-analysis)
- Detalhamento mineralógico (usar mineralogy)
- Análise de mercado de commodities (usar mineral-intelligence)

## Entradas Necessárias
- Resource estimate atualizado e classificado (geological-analysis)
- Dados metalúrgicos: recovery por tamanho de partícula
- Dados geotécnicos e hidrogeológicos da área
- Dados de mercado: preço da commodity, custos regionais, câmbio

## Procedimento
1. Avaliar qualidade e classificação do resource estimate disponível
2. Definir método de lavra: a céu aberto ou subterrâneo
3. Estimar CAPEX: infraestrutura, equipamentos, ramp-up
4. Estimar OPEX: mão-de-obra, energia, consumíveis, royalties
5. Modelar cronograma de produção (LOM): taxa, diluição, perdas
6. Construir modelo financeiro: fluxo de caixa livre (20-30 anos)
7. Calcular indicadores: VPL, TIR, payback, LCOE, C1 cash cost
8. Analisar sensibilidade: ±30% nos principais inputs

## Ferramentas
- Datamine/Vulcan para planejamento de mina
- Excel/Python para modelo financeiro
- Monte Carlo para análise de risco quantitativa
- Dados Wood Mackenzie/CRU para benchmarks de custo

## Requisitos de Fonte
- CIM/JORC para classificação de DEM
- Guidelines AMC para estimativa de recursos
- Metodologia de估值 de ativos minerais (DCF)
- Benchmarks de custos por commodity e região

## Verificação
- Consistência entre DEM e potencial de produção
- CAPEX/OPEX em linha com benchmarks regionais
- Payback <8 anos para projetos de commodity base
- VPL positivo em cenário base com margem ≥30%

## Formato de Saída
Relatório de viabilidade: DEM, cronograma de mina, CAPEX/OPEX, modelo financeiro, indicadores, análise de sensibilidade, mapas, gráficos.

## Critérios de Qualidade
- Resource estimate validado por QP independente
- CAPEX com acurácia de ±25% (estimativa de pré-viabilidade)
- Modelo financeiro com premissas documentadas
- Análise de sensibilidade completa (mínimo 3 variáveis)

## Condições de Falha
- Resource estimate não classificado adequadamente
- Dados metalúrgicos insuficientes para estimar recovery confiável
- Dados geotécnicos inadequados para definir método de lavra
- Previsão de commodity muito incerta (volatilidade >40%)

## Regras de Escalação
- VPL negativo em cenário base → Recomendação de não investimento
- Necessidade de dados adicionais de perfuração → Aprovação de orçamento
- Mudança significativa no preço da commodity → Revisão do modelo

## Segurança/Compliance
- Dados de DEM classificados como confidencial
- QP deve ser independente conforme NI 43-101
- Divulgação regulamentada para projetos listados em bolsa
- Due diligence completa antes de decisões de investimento
