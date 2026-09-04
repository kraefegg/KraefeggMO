# SKILL: Avaliação de Risco Geoespacial

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Avaliar riscos geoespaciais usando modelagem multivariada para mapear perigo (hazard), vulnerabilidade e exposição, gerando mapas de risco para tomada de decisão.

## Escopo
- Mapeamento de perigo natural: inundação, deslizamento, erosão
- Avaliação de vulnerabilidade social e física
- Análise de exposição de populações e infraestrutura
- Modelagem de risco composto (perigo × vulnerabilidade × exposição)

## Quando Usar
- Planejamento de uso do solo em áreas de risco
- Mapeamento municipal de riscos para defesa civil
- Avaliação de risco para projetos de infraestrutura
- Plano de contingência e resposta a desastres

## Quando NÃO Usar
- Análise de risco ambiental de atividade industrial (usar environmental-risk)
- Análise espacial pura sem componente de risco (usar spatial-analysis)
- Monitoramento de vegetação (usar ndvi-analysis)

## Entradas Necessárias
- Modelo Digital de Elevação (MDE/DEM) de alta resolução
- Dados geológicos: litologia, estrutura, solo
- Dados climatológicos: precipitação, temperatura, vento
- Dados socioeconômicos: população, infraestrutura, serviços

## Procedimento
1. Mapear perigo natural: susceptibilidade a inundação, deslizamento
2. Caracterizar vulnerabilidade: física (edificações), social (população)
3. Mapear exposição: populações, infraestrutura, bens expostos
4. Integrar camadas: risco = perigo × vulnerabilidade × exposição
5. Classificar zonas de risco: baixo, médio, alto, muito alto
6. Validar modelo com eventos históricos
7. Elaborar mapas de risco com escalas adequadas
8. Documentar metodologia e recomendar medidas de mitigação

## Ferramentas
- QGIS com MDE (SRTM 30m, ASTER GDEM)
- HEC-RAS para modelagem de inundação
- Python (GeoPandas, Rasterio) para modelagem multivariada
- Software de análise de susceptibilidade (InfoSides, ZONARIS)

## Requisitos de Fonte
- MDE: SRTM (30m), ASTER GDEM, LiDAR quando disponível
- Dados geológicos: CPRM (Serviço Geológico do Brasil)
- Dados climatológicos: INMET, ANA, CHIRPS
- Dados socioeconômicos: IBGE Censo, PNAD

## Verificação
- Zonas de risco validadas com eventos históricos conhecidos
- Consistência com mapeamentos de risco existentes (defesa civil)
- Sensibilidade do modelo a variações nos inputs
- Revisão por especialista em cada tipo de perigo

## Formato de Saída
Mapas de risco: perigo, vulnerabilidade, exposição, risco composto. Relatório técnico com metodologia e recomendações.

## Critérios de Qualidade
- MDE com resolução ≤30m para análise de risco
- Validação com ≥5 eventos históricos quando disponíveis
- Classificação de risco com pelo menos 4 níveis
- Recomendações específicas por zona de risco

## Condições de Falha
- MDE com resolução inadequada (<30m) para análise de deslizamento
- Dados climatológicos insuficientes para modelagem de inundação
- Ausência de dados socioeconômicos atualizados
- Eventos históricos não documentados impossibilita validação

## Regras de Escalação
- Risco alto em área populacional → Notificação à defesa civil
- Necessidade de dados de alta resolução → Aquisição LiDAR
- Risco não mitiguizável → Recomendação de remoção de população

## Segurança/Compliance
- Dados de vulnerabilidade social protegidos (LGPD)
- Mapas de risco públicos quando solicitado por órgão governamental
- Metodologia baseada em normas técnicas (ABNT, USGS)
- Resultados comunicados com incerteza explícita
