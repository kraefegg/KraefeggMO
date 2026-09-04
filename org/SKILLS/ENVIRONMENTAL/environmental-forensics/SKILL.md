# SKILL: Perícia Ambiental

## Versão
1.0.0 | Autor: Environmental Department

## Propósito
Investigar e caracterizar contaminação ambiental, identificar fontes poluidoras, determinar responsabilidades e subsidiar ações judiciais ou administrativas com evidências técnicas robustas.

## Escopo
- Investigação de Passivo Ambiental (DNSAR - Diagnóstico de Necessidade de Remedição)
- Identificação de fonte, via de migração e receptor vulnerável
- Determinação de nexo causal entre atividade e dano ambiental
- Cálculo de danos ambientais e estimativas de remediação

## Quando Usar
- Litígios ambientais onde se requer prova técnica de contaminação
- Transação imobiliária com suspeita de passivo ambiental
- Acidentes ambientais (derramamentos, vazamentos, descartes ilegais)
- Responsabilidade civil por dano ambiental (Sodalidade dos Danos)

## Quando NÃO Usar
- Monitoramento rotineiro sem indicio de contaminação
- Plano de remediação sem diagnóstico preliminar (usar DNSAR)
- Avaliação de impacto para licenciamento (usar environmental-impact-analysis)

## Entradas Necessárias
- Histórico de uso do solo e atividades desenvolvidas
- Mapa de utilidades subterrâneas e construções existentes
- Dados de monitoramento anteriores (se disponíveis)
- Amostras de solo, água subterrânea e/ou superficial coletadas

## Procedimento
1. Revisão da história do sítio e levantamento bibliográfico
2. Levantamento topográfico e identificação de potentially affected media
3. Coleta de amostras com protocolo QA/QC (brancos, duplicatas)
4. Análises laboratoriais: hidrocarbonetos, metais, TPH, BTEX, PCBs
5. Interpretação dos resultados conforme padrões de investigação (USEPA)
6. Delimitação da mancha de contaminação em 3D
7. Identificação da fonte primária e cálculo de fluxo de massa
8. Elaboração de Relatório de Investigação com estimativa de custos

## Ferramentas
- Software MODFLOW ou Visual MODFLOW para modelagem de fluxo subterrâneo
- QGIS/ArcGIS para mapeamento da pluma de contaminação
- Sistema de coleta com bombeamento passivo (MIP, HPT)
- Laboratório acreditado (ISO 17025) para análises de solo e água

## Requisitos de Fonte
- CONAMA 420/2009 (critérios para área contaminada)
- CONAMA 404/2008 (passivo ambiental em transações imobiliárias)
- NBR 17.856/2021, NBR 17.857/2021, NBR 17.858/2021 (investigação)
- USEPA 823-B-02-005 (VADOSE Zone Guidance)

## Verificação
- Cruzamento de resultados laboratoriais com padrões CONAMA/USEPA
- Consistência da pluma com o fluxo hidrodinâmico regional
- Validação do modelo conceitual por profissional habilitado (CONFEA)
- Auditoria de cadeia de custódia das amostras

## Formato de Saída
Relatório técnico: contexto, objetivos, metodologia, resultados, modelo conceitual, estimativa de custos de remediação, mapas 3D da contaminação, laudos laboratoriais em anexo.

## Critérios de Qualidade
- Cadeia de custódia documentada para todas as amostras
- Taxa mínima de amostras duplicatas: 10% do total
- Análises em laboratório ISO 17025 acreditado
- Revisão por consultor sênior antes de submissão

## Condições de Falha
- Acesso negado a áreas críticas do sítio (necessidade judicial)
- Contaminação por múltiplas fontes com sobreposição de plumas
- Resultados laboratoriais incompatíveis com condições de campo
- Ausência de dados históricos impossibilita atribuição de fonte

## Regras de Escalação
- Indícios de crime ambiental (intencionalidade) → Ministério Público
- Contaminação de aquífero de abastecimento público → Vigilância Sanitária
- Valores excedentes em 100x os padrões → Notificação de risco à saúde

## Segurança/Compliance
- EPI completo durante trabalho em área contaminada
- Cadeia de custódia rigorosa (conforme NBR 15.849)
- Proteção de dados pessoais em investigações judiciais
- Registro forense: tudo deve ser admissível em juízo
