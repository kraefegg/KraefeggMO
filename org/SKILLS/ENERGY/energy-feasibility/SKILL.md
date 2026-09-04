# SKILL: Viabilidade de Projetos de Energia

## Versão
1.0.0 | Autor: Energy Department

## Propósito
Realizar estudos de viabilidade técnico-econômica para projetos de geração, distribuição e uso de energia em diversas fontes, subsidiando decisões de investimento e planejamento energético.

## Escopo
- Análise de viabilidade para projetos de geração (solar, eólica, biomassa, hidrelétrica)
- Modelagem financeira: VPL, TIR, payback simples e descontado, LCOE
- Avaliação de riscos técnicos e regulatórios
- Comparação de cenários e alternativas de projeto

## Quando Usar
- Decisão de investimento em projeto de geração de energia
- Planejamento energético corporativo ou municipal
- Análise comparativa de fontes de energia para processo industrial
- Subsídio para captação de recursos (BNDES, FINEM, PRODIST)

## Quando NÃO Usar
- Detalhamento técnico de projeto fotovoltaico (usar solar-pv)
- Auditoria energética de edifício (usar energy-efficiency)
- Projeto de infraestrutura elétrica (usar power-infrastructure)

## Entradas Necessárias
- Dados de demanda de energia: perfil, previsão de crescimento
- Condições do local: recursos, infraestrutura disponível, custos
- Dados financeiros: custos de capital, inflação, câmbio
- Marco regulatório aplicável ao tipo de projeto

## Procedimento
1. Definir escopo e objetivos do estudo de viabilidade
2. Levantar dados técnicos: recurso energético, tecnologia, eficiência
3. Elaborar estimativas de CAPEX e OPEX detalhados por item
4. Construir modelo financeiro com fluxo de caixa projetado (20-25 anos)
5. Calcular indicadores: VPL, TIR, LCOE, payback, razão benefício/custo
6. Analisar sensibilidade: variação nos principais inputs (±30%)
7. Avaliar riscos: regulatório, tecnológico, mercado, ambiental
8. Elaborar parecer técnico conclusivo com recomendação

## Ferramentas
- Excel/Google Sheets com macros financeiras
- RETScreen ou SAM para projetos de energia renovável
- Software de análise de risco (Monte Carlo, árvores de decisão)
- Dados de mercado: BloombergNEF, IRENA, EPE

## Requisitos de Fonte
- Diretrizes EPE para planejamento energético
- Procedimentos ANEEL para projetos de geração
- Metodologia de análise financeira do BNDES (aplicável)
- Dados de mercado de commodities energéticas

## Verificação
- Consistência entre premissas e dados de mercado atualizados
- Viabilidade financeira positiva em cenário base
- Análise de sensibilidade completa (mínimo 3 variáveis)
- Revisão por consultor independente para projetos >R$10M

## Formato de Saída
Relatório de viabilidade: resumo executivo, dados técnicos, modelo financeiro, análise de riscos, sensibilidade, parecer conclusivo.

## Critérios de Qualidade
- Dados de entrada verificados com fontes primárias
- Modelo financeiro com premissas documentadas
- Análise de sensibilidade robusta (cenário otimista, base e pessimista)
- Parecer claro e fundamentado (recomendação de investimento ou não)

## Condições de Falha
- Dados de recurso energético indisponíveis ou incertos
- Mudanças regulatórias durante a análise comprometem premissas
- Custo de capital muito elevado inviabiliza projeto marginalmente viável
- Dados financeiros desatualizados comprometem análise

## Regras de Escalação
- Viabilidade marginal (TIR entre 10-15%) → Revisão estratégica
- Projeto com impacto regulatório significativo → Assessoria jurídica
- Riscos não mitigáveis → Recomendação de não investimento

## Segurança/Compliance
- Dados financeiros sensíveis em repositório seguro
- Conflito de intereste declarado antes da emissão do parecer
- Independência do avaliador em relação ao proponente do projeto
- Retenção documental por 10 anos para projetos aprovados
