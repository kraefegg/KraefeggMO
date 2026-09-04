# SKILL: Análise de NDVI e Monitoramento de Vegetação

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Computar e interpretar o Índice de Vegetação por Diferença Normalizada (NDVI) para monitorar saúde da vegetação, produtividade primária e mudanças temporais na cobertura verde.

## Escopo
- Cálculo de NDVI: (NIR - RED) / (NIR + RED)
- Classificação de saúde vegetal por faixas de NDVI
- Análise temporal: séries temporais de NDVI (Savitzky-Golay, median)
- Integração com dados climáticos e de solo

## Quando Usar
- Monitoramento de estresse hídrico e nutricional em vegetação
- Detecção de queimadas, pragas e doenças florestais
- Análise sazonal de produtividade de culturas agrícolas
- Avaliação de projetos de restauração florestal

## Quando NÃO Usar
- Classificação de uso do solo multitemporal (usar remote-sensing)
- Análise estatística espacial avançada (usar spatial-analysis)
- Classificação com deep learning (usar geoai)

## Entradas Necessárias
- Imagens multiespectrais: Sentinel-2 (10m), Landsat (30m)
- Bandas NIR e RED calibradas e corrigidas atmosfericamente
- Período de análise e frequência temporal
- Dados de validação em campo (se disponíveis)

## Procedimento
1. Selecionar imagens com baixa cobertura de nuvens (<10%)
2. Pré-processar: correção atmosférica, recorte, mosaico
3. Calcular NDVI: raster algebra (band4/band3 para Sentinel-2)
4. Classificar NDVI: vegetação densa (>0,6), moderada (0,3-0,6), baixa (0,1-0,3), solo (0-0,1)
5. Gerar séries temporais: média mensal/anual por pixel ou região
6. Aplicar filtros: Savitzky-Golay para suavizar ruído
7. Analisar anomalias: valores abaixo da média histórica = estresse
8. Integrar com dados climáticos (CHIRPS, ERA5) para correlação

## Ferramentas
- Google Earth Engine (GEE) para processamento de séries temporais
- QGIS com Raster Calculator para cálculo de NDVI
- Python (rasterio, numpy) para processamento local
- Software TIMESAT para análise de séries temporais

## Requisitos de Fonte
- USGS NDVI documentation
- Sentinel-2 User Handbook (ESA)
- Artigos: Tucker (1979), Didan (2015)
- Dados de validação: Red de Monitoramento de Vegetação (INPE)

## Verificação
- NDVI dentro da faixa teórica [-1, +1]
- Consistência temporal: sem saltos entre imagens consecutivas
- Validação com dados de campo quando disponível
- Comparação com produto NDVI oficial (MODIS, PROBA-V)

## Formato de Saída
Raster de NDVI (GeoTIFF), séries temporais (CSV/Gráfico), mapas de saúde vegetal, relatório de interpretação.

## Critérios de Qualidade
- Precisão do NDVI: ±0,02 para vegetação densa
- Temporal resolution: ≤16 dias para monitoramento ativo
- Classificação de saúde vegetal com pelo menos 4 classes
- Análise temporal com cobertura mínima de 3 anos

## Condições de Falha
- Imagens com cobertura de nuvens >30% inviabiliza cálculo
- Banda NIR saturada em áreas de vegetação muito densa
- Ausência de dados de validação em campo
- Artefatos atmosféricos em imagens sem correção adequada

## Regras de Escalação
- Anomalia de NDVI em área protegida → Notificação ao órgão ambiental
- Desmatamento detectado → IBAMA/ICMBio
- Divergência com dados oficiais → Revisão por especialista em SR

## Segurança/Compliance
- Dados Landsat e Sentinel: uso gratuito conforme licença USGS/ESA
- Citação correta das fontes em todos os produtos
- Resultados comunicados com limitações (resolução, nuvens)
- NDVI como indicador complementar (não substitui campo)
