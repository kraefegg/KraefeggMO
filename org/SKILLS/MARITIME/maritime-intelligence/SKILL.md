# SKILL: Inteligência Marítima

## Versão
1.0.0 | Autor: Maritime Department

## Propósito
Coletar, analisar e disseminar informações marítimas para apoiar decisões operacionais e estratégicas, incluindo rastreamento de embarcações, estatísticas portuárias e fluxos comerciais.

## Escopo
- Rastreamento de embarcações via AIS (Automatic Identification System)
- Análise de estatísticas de movimentação portuária
- Monitoramento de fluxos comerciais por rota e commodity
- Análise de riscos marítimos: pirataria, clima, congestão

## Quando Usar
- Monitoramento de frota e operações em tempo real
- Planejamento logístico e otimização de rotas
- Análise de mercado portuário e competitividade
- Investigação de atividades marítimas suspeitas

## Quando NÃO Usar
- Rastreamento de carga dentro do terminal (usar port-community-system)
- Conformidade documental (usar maritime-single-window)
- Análise de capacidade física do porto (usar port-analysis)

## Entradas Necessárias
- Dados AIS: posição, rumo, velocidade, destino de embarcações
- Dados portuários: movimentações, tempos de atracação, queue
- Dados de mercado: preços de frete, taxas de câmbio, commodity prices
- Informações meteorológicas e oceanográficas

## Procedimento
1. Coletar dados AIS de fontes públicas (MarineTraffic, VesselFinder)
2. Processar dados: filtrar, georreferenciar, calcular distâncias
3. Analisar padrões de movimentação: rotas, frequências, anomalies
4. Integrar dados portuários para métricas de eficiência
5. Monitorar fluxos comerciais por commodity e rota
6. Identificar riscos: pirataria, sanções, clima, congestão
7. Elaborar intelligence reports periódicos (diário/semanal)
8. Disseminar informações via dashboard e alertas

## Ferramentas
- MarineTraffic ou VesselFinder para dados AIS em tempo real
- Python para processamento de dados (pandas, geopandas)
- Power BI para dashboards de monitoramento
- QGIS para mapeamento de rotas e heatmap de movimentação

## Requisitos de Fonte
- Dados AIS: MarineTraffic, VesselFinder, NOAA
- Dados portuários: ANTAQ, ANP, comércio exterior (SISCOMEX)
- Dados de frete: Baltic Exchange, Platts
- Dados meteorológicos: INMET, NOAA, ECMWF

## Verificação
- Precisão da posição AIS: ±10m (posicionamento GNSS)
- Consistência entre fontes AIS diferentes
- Atualização de dados: <15 min para monitoramento em tempo real
- Validação de dados estatísticos com fonte oficial (ANTAQ)

## Formato de Saída
Intelligence report: mapa de movimentação, análise de fluxos, métricas portuárias, alertas de risco, dashboard interativo.

## Critérios de Qualidade
- Cobertura AIS ≥95% das embarcações na área de interesse
- Latência de dados <15 minutos para monitoramento real
- Análise quantitativa fundamentada em dados primários
- Relatório semanal com atualização e análise de tendências

## Condições de Falha
- Falha de recepção AIS em área remota (sem cobertura)
- Dados AIS adulterados (spoofing) comprometem análise
- Indisponibilidade de dados portuários oficiais
- Volume de dados impossibilita processamento em tempo real

## Regras de Escalação
- Atividade suspeita detectada → Notificação à Capitania dos Portos
- Atraso significativo em movimentação portuária → Alerta à operação
- Dados de movimentação contradizem estimativas → Revisão de forecasting

## Segurança/Compliance
- Dados AIS públicos usados conforme regulamentação
- Informações de embarcações sensíveis (militares, nucleares) protegidas
- Conformidade com proteção de dados pessoais (LGPD)
- Uso responsável de inteligência marítima (sem vigilância indevida)
