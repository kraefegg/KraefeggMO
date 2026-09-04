# SKILL: Análise Espacial e Estatísticas Geográficas

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Realizar análises espaciais quantitativas: estatísticas espaciais, interpolação, overlay analysis, cluster espacial e modelagem para subsidiar decisões baseadas em dados georreferenciados.

## Escopo
- Estatísticas espaciais: Moran's I, Geary's C, LISA
- Interpolação: krigagem, IDW, splines
- Overlay analysis: soma ponderada, suitability analysis
- Análise de cluster: DBSCAN, Hot Spot Analysis (Getis-Ord Gi*)

## Quando Usar
- Mapeamento de padrões espaciais (distribuição de recursos, riscos)
- Interpolação de dados pontuais para superfícies contínuas
- Análise de suitability para localização de instalações
- Identificação de clusters de valores anômalos no espaço

## Quando NÃO Usar
- Processamento geoespacial básico (usar qgis-operations)
- Análise de NDVI ou vegetação (usar ndvi-analysis)
- Classificação de imagens de satélite (usar remote-sensing)

## Entradas Necessárias
- Dados espacializados: pontos, polígonos, rasters
- Variável de interesse: valores numéricos ou categóricos
- SRC correto e consistente entre camadas
- Definição de hipótese espacial a ser testada

## Procedimento
1. Explorar dados: distribuição, outliers, padrões visuais
2. Testar autocorrelação espacial (Moran's I global)
3. Identificar clusters locais (LISA, Hot Spot Analysis)
4. Realizar interpolação se aplicável (krigagem com semivariograma)
5. Executar overlay ponderado para análise de suitability
6. Validar modelo com dados de validação (holdout ou k-fold)
7. Interpretar resultados no contexto do problema
8. Documentar metodologia e produzir mapas de resultados

## Ferramentas
- QGIS + Plugin SCP para processamento avançado
- GeoDa para estatísticas espaciais (Moran, LISA, cluster)
- Python (PySAL, GeoPandas, Rasterio) para automação
- R (spdep, gstat) para interpolação ekrigagem

## Requisitos de Fonte
- Anselin (1996) — Spatial Econometrics
- Cressie (1993) — Statistics for Spatial Data
- PySAL documentation para métodos computacionais
- Dados públicos: IBGE, ANA, INPE para validação

## Verificação
- Autocorrelação espacial significativa (p<0,05)
- Interpolação validada com ponto de holdout (erro <15%)
- Análise de suitability com pesos justificados documentalmente
- Mapas de resultado com legendas claras e fontes

## Formato de Saída
Relatório técnico com mapas: autocorrelação, clusters, superfícies interpoladas, mapas de suitability. Dados de saída em GeoPackage/GeoTIFF.

## Critérios de Qualidade
- Métodos estatisticamente válidos (p-valor reportado)
- Validação cruzada para interpolação (RMSE <10% da variância)
- Justificativa para escolha do método de interpolação
- Resultados reprodutíveis (scripts documentados)

## Condições de Falha
- Dados espaciais com baixa densidade amostral
- Viço espacial (MAUP) afeta resultados da análise
- Semivariograma não converge na krigagem
- Autocorrelação espacial não significativa (dados aleatórios)

## Regras de Escalação
- Resultados contradizem hipótese → Revisão metodológica
- Necessidade de dados adicionais → Aprovação de coleta
- Análise com impacto regulatório → Revisão por estatístico sênior

## Segurança/Compliance
- Dados de indivíduos protegidos conforme LGPD
- Metodologia documentada para auditoria
- Uso de métodos validados pela literatura científica
- Resultados comunicados com limitações explícitas
