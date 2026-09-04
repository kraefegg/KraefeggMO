# SKILL: Análise Regulatória e Ambiental da Mineração

## Versão
1.0.0 | Autor: Mining Department

## Propósito
Analisar o marco regulatório aplicável à mineração no Brasil, incluindo legislação da ANM, código mineral, licenciamento ambiental e requisitos específicos para diferentes tipos de minerais.

## Escopo
- Marco legal da mineração: Código Mineral (Lei 7.805/89), ANM
- Processo de autorização: DPI, DPR, LO, LOR, RENAM
- Requisitos ambientais específicos para mineração
- Análise de restrições de uso do solo e conflitos fundiários

## Quando Usar
- Planejamento de projeto mineral em fase inicial
- Avaliação de risco regulatório antes de investimento
- Articulação com ANM para obtenção de autorização
- Análise de conflitos de uso do solo e comunidades tradicionais

## Quando NÃO Usar
- Detalhamento de licenciamento ambiental mineral (usar environmental-licensing)
- Viabilidade econômica (usar mining-opportunity-analysis)
- Análise de mercado mineral (usar mineral-intelligence)

## Entradas Necessárias
- Localização exata do projeto mineral (coordenadas UTM)
- Tipo de mineral alvo e quantidades estimadas
- Mapa de sobreposição com unidades de conservação, APPs, terras indígenas
- Histórico de autorizações na região (ANM)

## Procedimento
1. Verificar existence de occupations na área (ANM - sistema SAMGE)
2. Mapear restrições: UCs, APPs, terras indígenas, quilombolas
3. Definir tipo de autorização necessária (regime de permissão ou concessão)
4. Verificar requisitos da ANM para o mineral em questão
5. Analisar legislação ambiental específica (EFVM, Lei 12.651/2012)
6. Identificar necessidade de licenciamento ambiental (IBAMA vs estadual)
7. Elaborar plano de articulação com órgãos reguladores
8. Documentar análise e recomendações

## Ferramentas
- SAMGE/ANM para consulta de occupations e títulos
- QGIS para mapeamento de restrições sobrepostas
- Base dados CAR para verificação de áreas legais
- Banco de dados da ANM para occupations na região

## Requisitos de Fonte
- Lei 7.805/1989 (Código Mineral) e Decreto 97.455/1989
- Lei 12.651/2012 (Código Florestal - APPs, RLs)
- Lei 9.985/2000 (SNUC - unidades de conservação)
- IN ANM nº 1/2022 (procedimentos de autorização)

## Verificação
- Inexistência de occupations válidos na área alvo
- Verificação de restrições ambientais com fontes oficiais
- Conferência do enquadramento legal com a ANM
- Conflitos fundiários verificados com certidões negativas

## Formato de Saída
Análise regulatória: mapa de restrições, histórico de occupations, requisitos ANM, fluxo de autorização, riscos regulatórios, cronograma de obtenção de títulos.

## Critérios de Qualidade
- Verificação em fontes oficiais (ANM, ICMBio, INCRA)
- Mapeamento de ≥95% das restrições na área
- Documentação completa para tomada de decisão
- Análise atualizada com legislação vigente

## Condições de Falha
- Área com múltiplos occupations de diferentes titulares
- Sobreposição com unidade de conservação de proteção integral
- Ausência de informações confiáveis sobre situações fundiárias
- Mudança regulatória durante o processo de análise

## Regras de Escalação
- Conflito com terras indígenas → FUNAI e Consulta Prévia
- Restrição de proteção integral → Impossibilidade de mineração
- Divergência com a ANM → Assessoria jurídica especializada
- Necessidade de立法ão específica → Articulação institucional

## Segurança/Compliance
- Dados de occupations são públicos mas devem ser usados com responsabilidade
- Verificação de dados de terras indígenas em fontes protegidas (FUNAI)
- Conformidade com Lei Geral de Mineração
- Documentação完整 para defesa em eventual contencioso
