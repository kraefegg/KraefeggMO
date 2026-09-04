# SKILL: Análise de Risco Ambiental

## Versão
1.0.0 | Autor: Environmental Department

## Propósito
Avaliar riscos ambientais de atividades, produtos ou projetos, quantificando probabilidade e consequência de impactos adversos para subsidiar decisões de gestão e mitigação.

## Escopo
- Avaliação de risco para licenciamento ambiental
- Mapeamento de vulnerabilidade e exposição ambiental
- Análise de risco para áreas contaminadas (CONAMA 420/2009)
- Estimativa de risco para ecossistemas e populações humanas

## Quando Usar
- Processo de licenciamento que exige Estudo de Risco
- Avaliação de riscos para plano de emergência ambiental
- Análise comparativa de alternativas de projeto
- Priorização de áreas para remediação ou conservação

## Quando NÃO Usar
- Auditoria ambiental pura de conformidade (usar environmental-audit)
- Planejamento de desastres naturais (usar geospatial-risk)
- Controle de qualidade de produto final

## Entradas Necessárias
- Inventário de perigos ambientais (emissões, efluentes, resíduos)
- Dados de exposição: população, ecossistemas, aquíferos
- Condições meteorológicas e topográficas da região
- Resultados de modelagem de dispersão (se disponíveis)

## Procedimento
1. Identificar perigos e cenários de risco (FMEA ou HAZOP ambiental)
2. Caracterizar fonte, via de transporte e receptor
3. Estimar magnitude de impacto usando modelos quantitativos
4. Avaliar vulnerabilidade do receptor (ecológico e humano)
5. Calcular risco residual (probabilidade × severidade)
6. Definir medidas de mitigação: eliminação, redução, controle, transferência
7. Monitorar indicadores de risco ao longo da vida do projeto
8. Documentar e comunicar resultados aos stakeholders

## Ferramentas
- Software ALOHA ou CAMEO para modelagem de dispersão atmosférica
- Matriz de risco qualitativa (5×5) para triagem
- Análise SWOT ambiental para contextualização
- Modelos de risco quantitativo (fault tree, event tree)

## Requisitos de Fonte
- ABNT NBR ISO 31000:2018 (gestão de riscos)
- ABNT NBR ISO 14001:2015 (sistema de gestão ambiental)
- Resolução CONAMA 235/94 (estudos ambientais)
- Protocolos USEPA de avaliação de risco

## Verificação
- Consistência dos parâmetros de entrada com literatura técnica
- Validade dos modelos de dispersão aplicados
- Sensibilidade da análise a variações nos parâmetros-chave
- Revisão por consultor independente quando aplicável

## Formato de Saída
Relatório de risco: inventário de perigos, cenários, análise de exposição, cálculo de risco, mapa de risco, plano de mitigação, monitoramento de indicadores.

## Critérios de Qualidade
- Uso de dados primários sempre que possível
- Modelos validados para o contexto local
- Transparência nos pressupostos e limitações
- Comunicação clara do nível de incerteza

## Condições de Falha
- Dados de emissão ou exposição indisponíveis ou imprecisos
- Modelo de dispersão incompatível com topografia local
- Ausência de valores-limite para o contaminante em questão
- Conflitos entre padrões federal e estadual

## Regras de Escalação
- Risco identificado como inaceitável → Suspensão parcial ou total da atividade
- Necessidade de emergência ambiental → Ativação do plano de contingência
- Divergência técnica significativa → Painel de especialistas independente

## Segurança/Compliance
- Dados de risco classificados como confidenciais
- Análise isenta sem conflito de interesse
- Comunicação de risco conforme NBR ISO 31000
- Retenção documental por 10 anos mínimo
