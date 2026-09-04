# SKILL: Infraestrutura Elétrica

## Versão
1.0.0 | Autor: Energy Department

## Propósito
Projetar e avaliar infraestrutura elétrica: subestações, linhas de transmissão e distribuição, garantindo confiabilidade, eficiência e conformidade com normas técnicas ABNT e regulamentação ANEEL.

## Escopo
- Projeto de subestações: dimensionamento, seleção de equipamentos
- Linhas de transmissão (subtransmissão) e distribuição
- Estudo de curto-circuito, fluxo de carga, coordenação de proteção
- Projeto de investimento em infraestrutura elétrica para concessionárias

## Quando Usar
- Planejamento de expansão de rede de distribuição
- Projeto de subestação para grande consumidor industrial
- Avaliação de viabilidade de infraestrutura elétrica
- Planejamento de manutenção e modernização de subestações

## Quando NÃO Usar
- Projeto de geração distribuída (usar solar-pv)
- Eficiência energética em edifícios (usar energy-efficiency)
- Viabilidade de projeto de geração (usar energy-feasibility)

## Entradas Necessárias
- Perfil de carga do consumidor: demanda, fator de carga, potência reativa
- Mapa topográfico com georeferenciamento da área
- Dados da rede existente: tensão, impedância, capacidade
- Normas técnicas aplicáveis: NBR, IN, PRODIST

## Procedimento
1. Definir necessidade de容量: demanda atual e previsão futura (10-20 anos)
2. Dimensionar subestação: transformador(es), barramentos, interruptores
3. Elaborar estudo de curto-circuito e seleção de equipamentos
4. Projetar proteção: relés, disjuntores, coordenação temporal
5. Projetar instalação de aterramento conforme NBR 11.002
6. Estimar CAPEX e OPEX do projeto
7. Elaborar projeto executivo e projeto elétrico detalhado
8. Documentar para aprovação ANEEL (quando concessionária)

## Ferramentas
- software ETAP ou PowerFactory para estudos de fluxo e curto-circuito
- AutoCAD/Electrical para projetos elétricos
- Dados PRODIST para níveis de tensão e qualidade
- Planilha de dimensionamento de proteção e coordenação

## Requisitos de Fonte
- ABNT NBR 14.039:2005 (projeto de subestações)
- ABNT NBR 11.002:2009 (aterramento)
- IN ANEEL 502/2012 (procedimentos de distribuição)
- PRODIST: módulo de qualidade de energia

## Verificação
- Estudo de fluxo de carga com todas as condições operacionais
- Coordenação de proteção verificada por simulação
- Conformidade das proteções com NBR e PRODIST
- Verificação independente por engenheiro sênior

## Formato de Saída
Projeto de infraestrutura: dimensionamento, estudos técnicos, projeto executivo, orçamento, cronograma.

## Critérios de Qualidade
- N+1 em equipamentos críticos (transformador, proteção)
- Confiabilidade ≥99,9% (tempo de interrupção <8,7 h/ano)
- Conformidade 100% com NBR e IN ANEEL aplicáveis
- Vida útil projetada: subestação 30 anos, equipamentos 25 anos

## Condições de Falha
- Terreno inadequado para instalação de subestação
- Restrições ambientais significativas na linha de transmissão
- Indisponibilidade de equipamentos de fornecedores específicos
- Complexidade da rede existente dificulta integração

## Regras de Escalação
- Projeto de subestação >100MVA → Comitê de investimentos
- Impacto em rede de distribuição existente → Coordenar com concessionária
- Restrições ambientais significativas → Licenciamento ambiental

## Segurança/Compliance
- Segurança elétrica conforme NR-10 e ABNT NBR 16690
- EPI completo para trabalho com equipamentos energizados
- Conformidade ambiental de subestações (ruído, eletromagnético)
- Certificação de equipamentos conforme INMETRO quando obrigatório
