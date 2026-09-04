# SKILL: Energia Solar Fotovoltaica

## Versão
1.0.0 | Autor: Energy Department

## Propósito
Projetar sistemas fotovoltaicos (geração distribuída ou centralizada), dimensionar arranjos, estimar geração e realizar análise econômico-financeira conforme normas ABNT e regulamentação ANEEL.

## Escopo
- Dimensionamento de sistemas on-grid, off-grid ou híbridos
- Estimativa de geração anual (PR, irradiação, inclinação)
- Análise de viabilidade financeira: payback, LCOE, VPL, TIR
- Projetos de decreto de autorização (ANEEL) e APM/APM-G

## Quando Usar
- Projetos de energia distribuída (residencial, comercial, industrial)
- Usinas solares de geração centralizada (>5MW)
- Integração com armazenamento (baterias BESS)
- Viabilidade para condomínios (geração compartilhada)

## Quando NÃO Usar
- Sistemas térmicos solares para aquecimento (usar solar-thermal)
- Viabilidade de projetos de outras fontes (usar energy-feasibility)
- Infraestrutura elétrica de distribuição (usar power-infrastructure)

## Entradas Necessárias
- Localização exata (coordenadas, altitude, clima local)
- Conta de energia elétrica: consumo mensal (kWh) e demanda (kW)
- Irradiação solar (TMY - Typical Meteorological Year) da região
- Características do telhado ou terreno (orientação, sombreamento)

## Procedimento
1. Levantamento de dados: irradiância (INMET/CRESESB), temperatura, consumos
2. Análise de viabilidade de instalação: espaço disponível, orientação, sombras
3. Dimensionamento: número de módulos, inversores, string box, proteções
4. Estimativa de geração: fator de performance (PR), perdas de sistema
5. Projetos elétricos conforme ABNT NBR 16690 e NBR 14681
6. Análise econômica: investimento, custo médio de energia, payback, VPL
7. Elaboração de projeto para aprovação na concessionária
8. Acompanhamento: homologação, conexão, operação

## Ferramentas
- PVsyst / SAM (System Advisor Model) para simulação de geração
- PV*SOL para visualização 3D e análise de sombreamento
- Planilha de viabilidade financeira com fluxo de caixa descontado
- Software de projeto elétrico (RETScreen, Homer)

## Requisitos de Fonte
- ABNT NBR 16690:2018 (sistemas fotovoltaicos conectados à rede)
- ABNT NBR 14681:2011 (energia solar fotovoltaica)
- Lei 14.300/2022 (marco legal da geração distribuída)
- IN ANEEL 687/2015 e atualizações (procedimentos de conexão)

## Verificação
- Conferência do PR (≥75% para sistemas on-grid)
- Validação da geração estimada com dados de monitoramento pós-instalação
- Verificação de conformidade elétrica com ABNT e concessionária
- Análise de sensibilidade nos parâmetros financeiros

## Formato de Saída
Projeto técnico completo: dimensionamento, geração estimada, projetos elétricos, análise financeira, cronograma de implantação.

## Critérios de Qualidade
- PR mínimo de 75% para sistemas bem projetados
- Erro de geração estimada ≤10% vs geração real (primeiro ano)
- Conformidade 100% com normas ABNT e regulamentação ANEEL
- Análise financeira com cenários otimista, base e pessimista

## Condições de Falha
- Irradiação solar insuficiente (<3,5 kWh/m².dia)
- Telhado com área insuficiente ou estrutura comprometida
- Complexidade regulatória da concessionária local (tempo de análise)
- Restrições de uso do solo (zoneamento municipal)

## Regras de Escalação
- Projeto >1MW → Aprovação emassembleia (norma estadual)
- Conexão em distribuidora monopolista → Articulação com ANEEL
- Pendências regulatórias >120 dias → Consultoria jurídica

## Segurança/Compliance
- Segurança elétrica conforme NR-10 e ABNT NBR 16690
- Proteção contra descargas atmosféricas (NBR 5410)
- Conformidade de habite-se e alvará antes da instalação
- Seguro de responsabilidade civil para instalações de grande porte
