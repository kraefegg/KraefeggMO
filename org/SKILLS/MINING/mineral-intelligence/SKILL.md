# SKILL: Inteligência Mineral de Mercado

## Versão
1.0.0 | Autor: Mining Department

## Propósito
Analisar mercados minerais, preços de commodities, tendências de demanda e ofertas globais para subsidiar decisões estratégicas de investimento e comercialização no setor mineral.

## Escopo
- Monitoramento de preços de commodities minerais (metais, minerais industriais)
- Análise de demanda global e regional por minerais estratégicos
- Forecasting de preços usando modelos econométricos
- Análise competitiva de produtores e cadeias de suprimento

## Quando Usar
- Decisão de investimento em projeto mineral
- Negociação contratos de longo prazo (of-take agreements)
- Planejamento estratégico de portfólio mineral
- Avaliação de ativos minerais em M&A

## Quando NÃO Usar
- Detalhamento técnico de análise mineralógica (usar mineralogy)
- Viabilidade de projeto mineral específico (usar mining-opportunity-analysis)
- Análise geológica regional (usar geological-analysis)

## Entradas Necessárias
- Commodity alvo e região geográfica
- Dados históricos de preços (últimos 10-20 anos)
- Dados de produção global: USGS, CRU, Wood Mackenzie
- Informações macroeconômicas: PIB, inflação, câmbio

## Procedimento
1. Coletar dados de preços de fontes confiáveis (LME, COMEX, Platts)
2. Analisar tendências de demanda por setor (construção, energia, tech)
3. Avaliar oferta global: novos projetos, closures, capacidade instalada
4. Modelar previsão de preços usando séries temporais e modelos econométricos
5. Identificar fatores de risco: geopolítica, regulatório, ambiental
6. Elaborar intelligence report com cenários e recomendações
7. Monitorar indicadores de mercado em tempo real
8. Atualizar previsões trimestralmente

## Ferramentas
- Bloomberg Terminal ou Metal Bulletin para dados de preços
- Python/R para modelagem econométrica (ARIMA, VAR)
- Power BI para dashboards de monitoramento
- Base de dados USGS, CRU, Wood Mackenzie

## Requisitos de Fonte
- Dados USGS Mineral Commodity Summaries
- LME (London Metal Exchange) para metais base
- Platts/S&P Global para minerais industriais
- Relatórios de mercado: Wood Mackenzie, CRU, BNEF

## Verificação
- Consistência entre fontes de dados de preços
- Validação do modelo de previsão com dados out-of-sample
- Verificação de tendências com analistas independentes
- Revisão trimestral das premissas de mercado

## Formato de Saída
Intelligence report: resumo executivo, análise de mercado, forecast de preços, cenários, riscos, oportunidades, dashboard atualizado.

## Critérios de Qualidade
- Erro de previsão ≤15% no horizon de 12 meses
- Dados verificados em pelo menos 2 fontes independentes
- Atualização trimestral com registro de alterações
- Análise qualitative complementar ao quantitative

## Condições de Falha
- Dados de preços históricos incompletos ou inconsistência entre fontes
- Evento geopolítico não modelado distorce previsões
- Mudança radical na política de commodities (sanções, quotas)
- Dados de demanda desatualizados comprometem forecast

## Regras de Escalação
- Queda de preço >30% em 3 meses → Revisão do projeto mineral
- Mudança regulatória significativa → Assessoria jurídica
- Divergência significativa entre fontes → Consultoria de mercado independente

## Segurança/Compliance
- Dados de mercado sensíveis em repositório seguro
- Conflitos de intereste declarados em relação a produtores/consumidores
- Uso de dados públicos e licenciados corretamente
- Conformidade com legislação de câmbio e repatriação de divisas
