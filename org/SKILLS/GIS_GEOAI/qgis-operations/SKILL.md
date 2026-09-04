# SKILL: Operações QGIS e Processamento Geoespacial

## Versão
1.0.0 | Autor: GIS/GEOAI Department

## Propósito
Realizar operações geoespaciais usando QGIS como plataforma principal: processamento vetorial e raster, análise espacial, automação de workflows e publicação de mapas.

## Escopo
- Processamento vetorial: clip, merge, dissolve, buffer, intersect
- Processamento raster: reclassificação, álgebra de mapas, reamostragem
- Automação com Processing Toolbox e Python (PyQGIS)
- Criação de layouts de mapa para relatórios e publicações

## Quando Usar
- Elaboração de mapas temáticos para relatórios técnicos
- Processamento de dados geoespaciais (vetor e raster)
- Automação de tarefas repetitivas de GIS
- Integração de dados de múltiplas fontes espacialmente referenciadas

## Quando NÃO Usar
- Análise estatística espacial avançada (usar spatial-analysis)
- Classificação de imagens de satélite (usar remote-sensing)
- Análise de NDVI (usar ndvi-analysis)

## Entradas Necessárias
- Dados geoespaciais: shapefile, GeoPackage, GeoTIFF, KML
- Sistema de referência de coordenadas (SRC/CRS) correto
- Objetivo da análise espacial e formato de saída desejado
- Extensão geográfica (bbox) e escala de trabalho

## Procedimento
1. Verificar SRC dos dados de entrada e definir CRS de trabalho
2. Carregar camadas no projeto QGIS com simbologia adequada
3. Executar processamento: vetorial (buffer, clip, intersect) e raster
4. Automatizar workflow com Processing Toolbox ou scripts PyQGIS
5. Criar layout de mapa com legenda, escala, rosa dos ventos
6. Exportar: PDF para relatório, PNG para web, GeoPackage para entrega
7. Documentar processamento (metadados do processing history)
8. Validar resultados com verificação visual e tabular

## Ferramentas
- QGIS 3.x (LTS) com plugins: GRASS, SAGA, Semi-Automatic Classification
- Processing Toolbox para processamento batch
- PyQGIS para scripts de automação
- MetaSearch para acesso a catálogos de dados

## Requisitos de Fonte
- QGIS 3.x LTS instalado e atualizado
- Plugins obrigatórios: QuickMapServices, GRASS, SAGA
- Dados públicos: IBGE (malhas), ANA (hidrografia), INPE (biodiversidade)
- Padronização de SRC: SIRGAS 2000 / UTM para trabalhos brasileiros

## Verificação
- Conferência visual de sobreposição entre camadas
- Validação de áreas e distâncias com cálculos independentes
- Verificação de SRC em todas as camadas do projeto
- Revisão de layout: legenda, escala, fontes dos dados

## Formato de Saída
Mapa temático em PDF/PNG, dados processados em GeoPackage, scripts PyQGIS documentados, metadados de processamento.

## Critérios de Qualidade
- Precisão posicional: ±1 pixel para raster, ±0,5m para vetor
- SRC correto em todas as camadas (verificação automática)
- Layout profissional com elementos cartográficos completos
- Scripts reutilizáveis e documentados

## Condições de Falha
- Dados de entrada em SRC não compatível (distortion)
- Arquivos corrompidos ou metadados ausentes
- Resolução inadequada do raster para escala de trabalho
- Plugins essenciais indisponíveis para versão do QGIS

## Regras de Escalação
- Dados sensíveis (bioma, terras indígenas) → Verificar restrições de uso
- Divergência significativa entre fontes → Consultoria especializada
- Necessidade de dados proprietários → Solicitação formal

## Segurança/Compliance
- Dados geoespaciais sensíveis (militar, segurança) em repositório seguro
- Metadados completos para reprodutibilidade
- Citação correta das fontes de dados (IBGE, INPE, etc.)
- Licenças de plugins e software respeitadas (GPL, open source)
