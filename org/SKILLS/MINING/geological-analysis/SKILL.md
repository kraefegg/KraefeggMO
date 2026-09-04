# SKILL: Análise Geológica e Estimativa de Recursos/Reservas

## Versão
1.0.0 | Autor: Mining Department

## Propósito
Elaborar mapeamentos geológicos, estimativas de recursos e reservas minerais conforme normas internacionais (NI 43-101, JORC, CIM) para subsidiar decisões de investimento e licenciamento.

## Escopo
- Mapeamento geológico detalhado (litologia, estrutura, mineralização)
- Estimativa de recursos minerais (métodos geoestatísticos)
- Classificação de reservas (proveniente/indicado/inferido)
- Elaboração de relatórios técnicos para fins de listagem ou investimento

## Quando Usar
- Elaboração de Resource Estimate para projeto mineral
- Mapeamento geológico para prospecção e delimitação de corpo mineralizado
- Relatório técnico para listagem em bolsa (NI 43-101, JORC)
- Atualização de estimativas de recursos conforme dados novos de perfuração

## Quando NÃO Usar
- Análise mineralógica detalhada de amostras (usar mineralogy)
- Viabilidade econômica do projeto (usar mining-opportunity-analysis)
- Análise de mercado (usar mineral-intelligence)

## Entradas Necessárias
- Dados de perfuração (SPT, DD, HQ/NQ): profundidade, amostra, litologia
- Ensaios metalúrgicos (se disponíveis)
- Mapa geológico detalhado com unidades litológicas
- Dados topográficos e de altimetria da área

## Procedimento
1. Compilar dados de perfuração em banco de dados estruturado (Datamine, Leapfrog)
2. Modelar litologia e estrutura em 3D (wireframes)
3. Modelar valores de teores usando krigagem ou interpoladores robustos
4. Bloquear modelo de blocos (block model) com dimensões adequadas
5. Classificar recursos: Inferido → Indicado → Proveniente
6. Delimitar zonas economicamente viáveis (cutoff grade)
7. Estimar reservas considerando fatores de perda e diluição
8. Elaborar relatório técnico conforme padrão escolhido (NI 43-101/JORC)

## Ferramentas
- Leapfrog Geo para modelamento 3D
- Datamine ou Vulcan para geoestatística e block model
- Surpac para mapas geológicos e seções
- Software de auditoria de modelo geológico

## Requisitos de Fonte
- CIM Best Practice Guidelines (2019)
- NI 43-101 (Canadá) ou JORC Code (Austrália)
- AusIMM Guidelines para classificação de recursos
- NBR para mapeamento geológico em escala adequada

## Verificação
- Validação do modelo por QP (Qualified Person) independente
- Verificação cruzada de teores com ensaios de controle
- Auditoria do modelo geológico por segunda opinião
- Conferência de cutoff com análise econômica preliminar

## Formato de Saída
Relatório técnico: geologia, banco de dados, modelo 3D, estimativa de recursos/reservas, classificação, corte econômico, mapas, seções, anexos técnicos.

## Critérios de Qualidade
- block model validado por cross-validation
- Classificação conforme critérios NI 43-101/JORC
- Assinatura de QP para relatório oficial
- Dados de perfuração ≥80% com recovery adequado

## Condições de Falha
- Amostras de perfuração com recovery baixo (<90%)
- Estrutura geológica muito complexa impossibilita wireframes
- Ausência de dados de ensaio metalúrgico para estimar perdas
- Teores muito heterogêneos com alta variabilidade

## Regras de Escalação
- Descoberta de recurso significativo → Notificação a investidores
- Resultados divergentes de estimativas anteriores → Auditoria independente
- Necessidade de dados adicionais de perfuração → Orçamento adicional

## Segurança/Compliance
- Acesso a dados geológicos: classificação comercial confidencial
- QP deve ser independente (sem conflito de interesse)
- Documentação completa para auditoria regulatória (bolsa)
- Responsabilidade civil do QP conforme normas aplicáveis
