# SKILL: Energia Solar Térmica

## Versão
1.0.0 | Autor: Energy Department

## Propósito
Projetar sistemas solares térmicos para aquecimento de água e processos industriais, dimensionando coletores, reservatórios e sistemas auxiliares conforme normas ABNT e condição climática local.

## Escopo
- Dimensionamento de sistemas de aquecimento de água (residencial, comercial)
- Projetos de processos industriais com calor solar (secagem, pasteurização)
- Dimensionamento de coletores: planos, evacuados, tubos de vácuo
- Análise de desempenho e balanço energético

## Quando Usar
- Aquecimento de água para residências, hotéis, hospitais
- Processos industriais que utilizam calor até 250°C
- Substituição de caldeiras a gás ou elétricas
- Sistemas de aquecimento para piscinas

## Quando NÃO Usar
- Geração de eletricidade (usar solar-pv)
- Aquecimento de ambientes (aquecedores elétricos ou gás)
- Sistemas de refrigeração por absorção (usar energy-efficiency)

## Entradas Necessárias
- Demandas de calor: volume de água, temperatura de aquecimento
- Localização geográfica e irradiância solar horizontal
- Temperatura mínima do ar e inverno solar da região
- Dados de custo de energia convencional (gás, eletricidade)

## Procedimento
1. Dimensionar demanda de calor diária (kWh/dia) e anual
2. Calcular irradiância no coletor conforme inclinação e orientação
3. Selecionar tipo de coletor adequado à temperatura de operação
4. Dimensionar área de coletores, volume do reservatório e auxiliar térmica
5. Projetar circuito: circulação forçada ou termossifão, isolamento, tubulações
6. Elaborar projeto estrutural e elétrico complementar
7. Realizar balanço energético e estimativa de economia anual
8. Documentar projeto e acompanhar instalação

## Ferramentas
- Software RETScreen para dimensionamento e análise econômica
- Modelo de balanço energético conforme ABNT NBR 15575
- Planilha de dimensionamento por método fatorial (Duffie-Beckman)
- Dados TMY (CRESESB/INMET) para irradiância e temperatura

## Requisitos de Fonte
- ABNT NBR 15575:2021 (edificações de baixo consumo energético)
- ABNT NBR 16246:2012 (sistemas de aquecimento solar de água)
- INMETRO: etiquetagem e rendimento de coletores
- Manual de dimensionamento ANVISA (quando aplicável)

## Verificação
- Balanço energético fechado: entrada ≥ demanda × fator de segurança
- Temperatura de serviço atingida em 90% dos dias do ano
- Economia anual ≥30% do custo com energia convencional
- Desempenho do coletor conforme certificação INMETRO

## Formato de Saída
Projeto técnico: dimensionamento, balanço energético, componentes, projeto elétrico e estrutural, estimativa de economia, cronograma.

## Critérios de Qualidade
- Economia anual mínima de 30% vs sistema convencional
- Autonomia mínima de 70% no inverno (sistema bem dimensionado)
- Componentes certificados INMETRO quando obrigatório
- Manutenção preventiva planejada para 20 anos de vida útil

## Condições de Falha
- Irradiação insuficiente no inverno em regiões sul (<3,0 kWh/m².dia)
- Demanda de calor em horário noturno sem armazenamento adequado
- Espaço de instalação incompatível com área de coletores necessária
- Temperatura ambiente muito baixa (-10°C em raras localidades)

## Regras de Escalação
- Projeto industrial >100m² de coletores → Engenheiro de projetos especializado
- Necessidade de financiamento → Assessoria financeira (BNDES, PRODIST)
- Complexidade de integração com caldeira existente → Consultor em processos térmicos

## Segurança/Compliance
- Segurança contra pressão em circuitos fechados (válvula de alívio)
- Isolamento térmico conforme normas de eficiência energética
- Seguro de instalação para sistemas de grande porte
- Conformidade com alvará de instalação e vistoria ANVISA quando aplicável
