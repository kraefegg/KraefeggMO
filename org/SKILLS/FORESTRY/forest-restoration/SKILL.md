# SKILL: Projeto de Restauração Florestal

## Versão
1.0.0 | Autor: Forestry Department

## Propósito
Planejar e implementar projetos de restauração ecológica para áreas degradadas, definindo intervenções baseadas em estádios sucessionais, identidade de restoredores e conectividade de paisagem.

## Escopo
- Diagnóstico de degradação e potencial regenerativo da área
- Seleção de espécies por estádio sucessional e funções ecológicas
- Projeto de plantio: preparo de solo, adensamento, enriquecimento
- Monitoramento de estabelecimento e sobrevivência

## Quando Usar
- Restauração de APPs com obrigação de recomposição (Código Florestal)
- Projetos de compensação ambiental (compensação de Área de Preservação)
- Restauração pós-mineração ou pós-pastagem
- Criação de corredores ecológicos e conectividade

## Quando NÃO Usar
- Monitoramento de floresta primária (usar vegetation-inventory)
- Avaliação individual de árvores para corte (usar tree-assessment)
- Restauração ripária sem enquadramento legal (usar environmental-licensing)

## Entradas Necessárias
- Diagnóstico do grau de degradação (0 a 5, escala SIFLORES)
- Mapa da área com zonesamento ecológico-econômico
- Lista de espécies potenciais: pioneering, secondary, climax
- Disponibilidade de mudas e capacidade de plantio

## Procedimento
1. Classificar a área quanto ao estádio sucessional e potencial regenerativo
2. Selecionar modelo de restauração: nucleação, enriquecimento, plantio denso
3. Definir espécies-chave por função: sombreamento, fixação de N, atração de dispersores
4. Dimensionar mudas: quantidade, tamanho, origem genética local
5. Projetar preparo do solo: cobertura morta, compactação, drenagem
6. Estabelecer cronograma de plantio e manutenções (limpas, formação)
7. Definir plano de monitoramento: sobrevivência, crescimento, regeneração natural
8. Avaliar resultados e ajustar intervenções conformemonitoramento

## Ferramentas
- Matriz de restauração por grau de degradação (SIFLORES)
- Banco de dados de espécies nativas por bioma (CONSEMA)
- QGIS para zoneamento e dimensionamento de intervenções
- Software de monitoramento de sobrevivência e crescimento

## Requisitos de Fonte
- Manual de Restauração Florestal (SIFLORES/INEMA)
- Lei 12.651/2012 (obrigatoriedade de restauração de APPs)
- Lista de espécies nativas por bioma (RBFlora/CONSEMA)
- Protocolo de restauração para cada bioma (Mata Atlântica, Cerrado, etc.)

## Verificação
- Sobrevivência mínima de 80% ao final do primeiro ano
- Diversidade de espécies ≥70% da lista planejada
- Cobertura do solo ≥80% após 3 anos
- Presença de regeneração natural indicando banco de sementes

## Formato de Saída
Projeto técnico: diagnóstico, modelo de restauração, lista de espécies, cronograma, orçamento, plano de monitoramento, mapas de zoneamento.

## Critérios de Qualidade
- Uso de espécies nativas com origem genética local (MIP)
- Diversidade funcional: mínimo 3 funções ecológicas atendidas
- Cobertura do solo planejada para 100% no primeiro ano
- Monitoramento semestral com indicadores claros

## Condições de Falha
- Mudas nativas indisponíveis na região (necessidade de viveiro próprio)
- Condições edáficas desfavoráveis (erosão extrema, solo compactado)
- Herbivoria severa por gado ou fauna silvestre
- Período de estiagem prolongado compromete sobrevivência

## Regras de Escalação
- Sobrevivência abaixo de 60% → Revisão do modelo de restauração
- Necessidade de terra para plantio → Articulação com proprietário
- Influência de manejo inadequado em área vizinha → Notificação ao órgão ambiental

## Segurança/Compliance
- Uso de defensivos biológicos (trichoderma, bactérias fixadoras)
- Responsabilidade técnica por engenheiro florestal habilitado
- Conformidade com IPAM e Condicionantes do órgão ambiental
- Registro completo de todas as intervenções para auditoria
