# SKILL: Licenciamento Ambiental Brasileiro

## Versão
1.0.0 | Autor: Environmental Department

## Propósito
Planejar e conduzir processos de licenciamento ambiental no Brasil, incluindo Licença Prévia (LP), Licença de Instalação (LI) e Licença de Operação (LO), conforme Resolução CONAMA 235/1994 e normas estaduais.

## Escopo
- Elaboração de Estudo de Impacto Ambiental (EIA) e Relatório de Impacto (RIMA)
- Articulação com órgãos competentes: IBAMA, INPA, IMA, IGBE e agências estaduais
- Acompanhamento de exigências, condicionantes e prazos de renovação
- Gestão de certidões negativas e regularização pós-instalação

## Quando Usar
- Projetos de infraestrutura, mineração, energia e indústria que necessitem de licença
- Renovação de licenças existentes com mudanças operacionais
- Processos de regularização ambiental de empreendimentos irregulares

## Quando NÃO Usar
- Atividades isentas de licenciamento conforme legislação estadual
- Projetos com apenas impacto local de baixa potencialidade (pode bastar cadastro)
- Avaliações meramente preliminares sem demanda formal

## Entradas Necessárias
- Localização exata do empreendimento (coordenadas UTM)
- Memorial descritivo da atividade e etapas de implantação
- Diagnóstico ambiental (físico, biótico e socioeconômico)
- Cronograma de implantação e operação

## Procedimento
1. Classificar o empreendimento quanto à porte e potencial poluidor (LCA/NCA)
2. Identificar o órgão licenciador e a documentação exigida (tabla estadual)
3. Elaborar Estudo Preliminar ou EIA conforme enquadramento
4. Submeter documentação ao órgão licenciador e acompanhar análise técnica
5. Atender exigências e sanar inconsistências apontadas pela equipe técnica
6. Obter LP → elaborar projeto detalhado → obter LI → implantar → obter LO
7. Monitorar condicionantes e preparar renovações com antecedência mínima

## Ferramentas
- QGIS para mapeamento de áreas de restrição e zonesamento
- Modelo de cronograma de licenciamento (planilha de controle)
- Base de dados CONAMA/CONSEMA para consultas normativas

## Requisitos de Fonte
- Legislação federal (Lei 6.938/81, Res. CONAMA 235/94, 01/86, 369/05)
- Legislação estadual do estado onde se localiza o empreendimento
- Normas do IBAMA (IN 10/2019, IN 01/2021)
- Resoluções municipais quando aplicável (licenciamento complementar)

## Verificação
- Inconsistências no EIA/RIMA com o termo de referência
- Ausência de compromissos de monitoramento pós-instalação
- Conflito com zoneamento municipal ou planos diretores
- Emissão de parecer sem análise de riscos ambientais

## Formato de Saída
Documento estruturado: Resumo executivo, contexto normativo, etapas do processo, checklist de documentos, cronograma, matrix de stakeholders e riscos do licenciamento.

## Critérios de Qualidade
- Conformidade total com a legislação aplicável
- Clareza na descrição de condicionantes e prazos
- Rastreabilidade das decisões e pareceres técnicos
- Versão controlada com registro de alterações

## Condições de Falha
- Dados incompletos do empreendimento impossibilitam classificação
- Órgão licenciador identificou impacto não previsto, requerendo reestudo
- Mudança de escopo do projeto durante processo de licenciamento ativo
- Ausência de resposta do órgão dentro do prazo regulatório

## Regras de Escalação
- Divergências técnicas entre órgãos (IBAMA vs estadual) → Escalar para Diretoria Jurídica
- Exigências absurdas ou fora de escopo → Articulação institucional com Assessoria
- Atraso superior a 180 dias → Abertura de processo administrativo formal

## Segurança/Compliance
- Dados ambientais sensíveis (GPS, inventário biológico) em repositório seguro
- Acesso restrito por níveis de confidencialidade
- Registro completo de todas as interações com órgão licenciador
- Backup de documentação conforme política de retenção (mínimo 10 anos)
