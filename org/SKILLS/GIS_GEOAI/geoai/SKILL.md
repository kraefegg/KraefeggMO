# SKILL: GeoAI — Análise Geoespacial com Inteligência Artificial

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Aplicar técnicas de inteligência artificial e deep learning para análise de imagens geoespaciais: classificação automática, detecção de objetos, segmentação semântica e predição espacial.

## Escopo
- Classificação de imagens usando CNNs (U-Net, ResNet, DeepLab)
- Detecção de objetos: árvores, edificações, embarcações
- Segmentação semântica: uso do solo pixel-a-pixel
- Modelagem preditiva espacial com ML (Random Forest, XGBoost, GNN)

## Quando Usar
- Classificação de imagens de satélite com alta acurácia
- Detecção automática de mudanças ou objetos específicos
- Mapeamento detalhado de áreas urbanas ou rurais
- Integração de múltiplas fontes de dados para predição

## Quando NÃO Usar
- Classificação supervisionada convencional (usar remote-sensing)
- Análise de NDVI sem deep learning (usar ndvi-analysis)
- Análise espacial estatística (usar spatial-analysis)

## Entradas Necessárias
- Imagens de alta resolução: Sentinel-2 (10m), WorldView (<1m)
- Dados de treinamento rotulados (ROIs/labels)
- Infraestrutura computacional: GPU para treinamento
- Métrica de avaliação definida (accuracy, F1, IoU)

## Procedimento
1. Preparar dataset: recortes, normalização, augmentation
2. Arquitetura do modelo: selecionar arquitetura conforme tarefa
3. Treinar modelo: divisão treino/validação/teste (70/15/15)
4. Otimizar hiperparâmetros: learning rate, batch size, epochs
5. Avaliar: matriz de confusão, F1-score, IoU (segmentação)
6. Inferência em imagem completa (tiling e mosaic)
7. Pós-processamento: remoção de ruído, suavização de bordas
8. Documentar: métricas, arquitetura, dados de treinamento

## Ferramentas
- Python: TensorFlow/PyTorch para deep learning
- Google Colab/Kaggle para treinamento com GPU
- Rasterio + GeoPandas para processamento geoespacial
- QGIS para visualização e validação de resultados

## Requisitos de Fonte
- Sentinel-2 (ESA) ou Landsat (USGS) para imagens base
- Dados de treinamento: OpenStreetMap, lidar, rotulagem manual
- Literatura: LeCun (2015), Goodfellow (2016) — deep learning
- Artigos recentes de GeoAI (ISPRS, RSE journals)

## Verificação
- Acurácia ≥90% para classificação (dataset de teste)
- IoU ≥0,75 para segmentação semântica
- Validação cruzada k-fold para robustez
- Comparação com classificação convencional (baseline)

## Formato de Saída
Mapa classificado (GeoTIFF), modelo treinado (.h5/.pt), métricas de desempenho, documentação técnica.

## Critérios de Qualidade
- Acurácia ≥90% geral, F1 ≥0,85 por classe
- Modelo generalizável (testado em área não vista)
- Pipeline reprodutível (scripts versionados)
- Inferência processada em tempo aceitável (<1h para 1000 km²)

## Condições de Falha
- Dados de treinamento insuficientes (<500 amostras por classe)
- Overfitting: acurácia alta em treino, baixa em teste
- GPU indisponível limita tamanho do modelo
- Diferença de distribuição entre dados de treino e inferência

## Regras de Escalação
- Resultados com impacto regulatório → Validação humana obrigatória
- Modelo com vieses identificados → Revisão de dados de treinamento
- Necessidade de dados de treinamento maiores → Crowdsourcing ou parceria

## Segurança/Compliance
- Dados de treinamento verificados para evitar vieses
- Transparência: documentar limitações do modelo
- Resultados sempre validados por humano antes de uso decisório
- Uso responsável de IA conforme princípios éticos
