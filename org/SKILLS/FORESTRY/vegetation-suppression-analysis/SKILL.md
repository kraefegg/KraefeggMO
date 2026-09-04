# SKILL: Análise para Autorização de Supressão de Vegetação

## Versão
1.0.0 | Autor: Forestry Department

## Propósito
Avaliar e instruir processos de autorização de supressão de vegetação, garantindo conformidade com o Código Florestal (APP/RL), legislação estadual e compensações ambientais obrigatórias.

## Escopo
- Classificação da área quanto à tipologia florestal e enquadramento legal
- Cálculo de compensação ambiental: área suprimida × fator de compensação
- Elaboração de projeto de restauração para áreas de compensação
- Acompanhamento do processo de autorização (SISFLORA/REPOFLORA)

## Quando Usar
- Projetos que exigem supressão de vegetação nativa (APP, RL ou residual)
- Processos de autorização para uso alternativo do solo
- Compensação ambiental por supressão (1:1 ou maior conforme estado)
- Planejamento de desmatamento com destinação de madeira

## Quando NÃO Usar
- Projetos de restauração florestal sem supressão (usar forest-restoration)
- Avaliação de vitalidade de árvores isoladas (usar tree-assessment)
- Monitoramento pós-supressão (usar vegetation-inventory para monitoramento)

## Entradas Necessárias
- Mapa de localização e cálculo da área a suprir (em hectares)
- Classificação da área: APP, RL ou residual remanescente
- Projeto de uso do solo que justifica a supressão
- Lista de espécies a serem suprimidas com volumes estimados

## Procedimento
1. Verificar enquadramento legal: é possível autorizar a supressão?
2. Calcular área efetivamente a suprir com mapeamento detalhado
3. Determinar fator de compensação conforme legislação estadual
4. Calcular área de compensação necessária (área suprimida × fator)
5. Verificar disponibilidade de área de compensação (se propriedade ou outsider)
6. Elaborar projeto de restauração para área de compensação
7. Submeter documentação ao órgão ambiental (SISFLORA/REPOFLORA)
8. Acompanhar análise e atender exigências

## Ferramentas
- QGIS para cálculo de áreas e sobreposição com mapas legais
- Planilha de cálculo de compensação ambiental (fórmula estadual)
- Base dados CAR (Cadastro Ambiental Rural) para verificar RL
- Software de volume madeireiro (cubagem de toras)

## Requisitos de Fonte
- Lei 12.651/2012 (Código Florestal) — Capítulo II (APP) e Capítulo III (RL)
- Legislação estadual do estado de ocorrência
- Resoluções estaduais (CONSEMA, CONAMA estadual)
- Normas SFB/SISFLORA para processos de autorização

## Verificação
- Consistência entre área suprimida e cálculos de compensação
- Adequação do fator de compensação à legislação vigente
- Viabilidade da área de compensação (tamanho, localização, solo)
- Conferência de madeira embarcada vs volume autorizado

## Formato de Saída
Relatório técnico: enquadramento legal, cálculo de áreas, compensação, projeto de restauração, documentação para órgão ambiental, cronograma.

## Critérios de Qualidade
- Cálculo de áreas com precisão de 95% (conferido com GPS)
- Compensação calculada conforme fator correto do estado
- Lista de madeira detalhada por espécie e destino
- Conformidade total com legislação vigente

## Condições de Falha
- Área classificada como APP em unidade de conservação (supressão proibida)
- Ausência de área de compensação disponível no raio legal
- Volume madeireiro divergente do projeto de desmatamento
- Objecção do IBAMA/ICMBio em áreas federais

## Regras de Escalação
- Supressão em UC → Necessidade de autorização federal (ICMBio)
- Água subterrânea comprometida → Consulta à ANA
- Oposição de comunidade tradicional → Consulta livre, prévia e informada

## Segurança/Compliance
- Responsabilidade técnica por engenheiro/engenheira florestal habilitado
- Verificação de inexistência de áreas prioritárias para conservação
- Cadeia de custódia para madeira autorizada
- Documentação completa para auditoria ambiental
