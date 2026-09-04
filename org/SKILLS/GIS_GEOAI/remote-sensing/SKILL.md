# SKILL: Sensoriamento Remoto e Análise de Imagens de Satélite

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Processar e analisar imagens de satélite para mapeamento, classificação de uso do solo, detecção de mudanças e monitoramento ambiental usando dados de sensores multiespectrais e radar.

## Escopo
- Pré-processamento: correção atmosférica, ortorretificação, mosaico
- Classificação supervisionada e não supervisionada
- Detecção de mudanças (post-classification, NDVI differencing)
- Análise temporal (time series) de imagens

## Quando Usar
- Mapeamento de uso e cobertura do solo
- Monitoramento de desmatamento e degradação
- Detecção de mudanças em áreas urbanas e rurais
- Mapeamento de áreas de risco e vulnerabilidade

## Quando NÃO Usar
- Cálculo e interpretação de NDVI (usar ndvi-analysis)
- Classificação com deep learning (usar geoai)
- Análise espacial estatística pura (usar spatial-analysis)

## Entradas Necessárias
- Imagens de satélite: Landsat, Sentinel-2, CBERS (gratuitas)
- Período de interesse e frequência temporal desejada
- Dados de treinamento (ROIs) para classificação supervisionada
- Modelo digital de elevação (MDE/DEM) quando necessário

## Procedimento
1. Selecionar imagens conforme data, cobertura de nuvens e resolução
2. Pré-processar: correção atmosférica (6S, FLAASH), ortorretificação
3. Segmentar/extrair áreas de interesse ( ROIs) para treinamento
4. Classificar: Maximum Likelihood, Random Forest, SVM
5. Avaliar acurácia: matriz de confusão, Kappa, F1-score
6. Detectar mudanças entre datas (NDVI diff, post-classification)
7. Gerar mapas temáticos e estatísticas por classe
8. Documentar processo e exportar resultados

## Ferramentas
- QGIS + Semi-Automatic Classification Plugin (SCP)
- Google Earth Engine (GEE) para processamento na nuvem
- ENVI ou ERDAS para análise avançada
- Python (rasterio, scikit-learn) para classificação

## Requisitos de Fonte
- Dados Landsat (USGS) — 30m, multiespectral
- Dados Sentinel-2 (ESA) — 10m, 13 bandas
- Dados CBERS (INPE) — resolução variável
- literatura de referência para classificação de cada bioma

## Verificação
- Acurácia geral ≥85% para classificação supervisionada
- Kappa ≥0,80 para concordância substancial
- Consistência temporal das classes entre épocas
- Validação em campo ou com dados de alta resolução

## Formato de Saída
Mapa de classificação (GeoTIFF, vetorial), matriz de confusão, estatísticas por classe, documentação do processo.

## Critérios de Qualidade
- Acurácia ≥85% geral, ≥80% por classe
- Resolução temporal adequada para detectar mudanças
- Processamento documentado e reprodutível
- Mapa com legenda padronizada (LULC classes)

## Condições de Falha
- Cobertura de nuvens >20% nas imagens selecionadas
- Dados de treinamento insuficientes para classe minoritária
- Confusão entre classes espectrais similares (pastagem vs floresta degradada)
- Resolução espacial inadequada para o objeto de estudo

## Regras de Escalação
- Detecção de desmatamento ilegal → Notificação ao IBAMA
- Divergência significativa com dados oficiais → Consultoria
- Necessidade de dados de alta resolução → Aquisição comercial

## Segurança/Compliance
- Imagens públicas (Landsat, Sentinel) usadas conforme licença
- Dados de treinamento verificados em campo quando possível
- Resultados comunicados com incerteza e limitações
- Citação correta das fontes de dados (USGS, ESA, INPE)
