# KRAEFEGG Knowledge Base

**Versão:** 1.0.0
**Última atualização:** 2026-09-04
**Responsável:** Knowledge Manager

---

## Estrutura

### LEGISLATION/
Leis federais, estaduais e municipais aplicáveis às operações.
- Federal (Código Civil, Código Penal, CLT, Lei de Licitações, etc.)
- Estadual (legislação ambiental, tributária, trabalhista estadual)
- Municipal (alvarás, zoneamento, taxas municipais)

### REGULATIONS/
Regulamentações setoriais e de órgãos reguladores.
- **ANTAQ** — Agência Nacional de Transportes Aquaviários
- **ANP** — Agência Nacional do Petróleo, Gás Natural e Biocombustíveis
- **ANEEL** — Agência Nacional de Energia Elétrica
- **IBAMA** — Instituto Brasileiro do Meio Ambiente
- **CONAMA** — Conselho Nacional do Meio Ambiente
- **ANM** — Agência Nacional de Mineração
- **ANA** — Agência Nacional de Águas e Saneamento Básico
- **ANTT** — Agência Nacional de Transportes Terrestres
- **AVIC** — Agência Nacional de Aviação Civil

### STANDARDS/
Normas técnicas e padrões de referência.
- **NBR** — ABNT (normas brasileiras)
- **ISO** — International Organization for Standardization
- **API** — American Petroleum Institute
- **ASTM** — American Society for Testing and Materials
- **SOLAS** — Safety of Life at Sea
- **MARPOL** — MARine POLlution
- **ISPS** — International Ship and Port Facility Security

### SCIENTIFIC/
Artigos científicos, estudos e pesquisas.
- Publicações peer-reviewed
- Relatórios de pesquisa financiada
- Dissertações e teses relevantes

### TECHNICAL/
Manuais técnicos, especificações e documentação de engenharia.
- Manuais de operação
- Especificações técnicas de equipamentos
- Procedimentos operacionais padrão (POP)
- Fichas técnicas de materiais e substâncias

### MARKET/
Dados de mercado, relatórios e previsões.
- Relatórios de mercado setorial
- Dados de preços e indices
- Previsões e tendências
- Dados macroeconômicos relevantes

### COMPETITIVE/
Perfis de concorrentes e posicionamento de mercado.
- Perfis de empresas concorrentes
- Análise de posicionamento
- Benchmarking competitivo
- Inteligência de mercado

### COMPANY/
Documentação interna, políticas e templates.
- Procedimentos operacionais internos
- Políticas organizacionais
- Templates padrão
- Códigos de conduta

### PROJECTS/
Documentação de projetos e deliverables.
- Bids e propostas
- Relatórios de projeto
- Entregas finais
- Contratos e aditivos

### LESSONS_LEARNED/
Revisões pós-projeto e melhores práticas.
- Retrospectivas de projeto
- Análises de causa raiz
- Melhores práticas documentadas
- Erros a evitar

---

## Governança

### Metadados Obrigatórios
Todo registro na knowledge base deve conter:
- **source** — Fonte primária (nome, autor, instituição)
- **date** — Data de publicação ou emissão
- **verification_status** — VERIFIED / UNVERIFIED / PARTIALLY_VERIFIED
- **last_reviewed** — Data da última revisão de validade
- **version** — Versão do registro (semver)
- **category** — Categoria/subcategoria

### Revisão e Validade
- Conhecimento com mais de 2 anos requer re-verificação
- Conhecimento regulatório requer re-verificação a cada 6 meses
- Fontes contraditórias devem ser sinalizadas e resolvidas antes do uso
- Dados obsoletos são movidos para ARCHIVE/ com tag "deprecated"

### Versionamento
- Todo registro versionado com semver (MAJOR.MINOR.PATCH)
- MAJOR: mudança de interpretação ou conclusão
- MINOR: atualização de dados ou contexto
- PATCH: correção de erros tipográficos ou formatação

---

## Controle de Acesso

| Nível | Permissão |
|---|---|
| LEVEL 0 (Viewer) | Somente leitura |
| LEVEL 1 (Executor) | Leitura + escrita em分类 própria |
| LEVEL 2 (Specialist) | Leitura + escrita em área de atuação |
| LEVEL 3 (Approver) | Leitura + escrita + aprovação na área |
| LEVEL 4 (Director) | Acesso total + governança da KB |

- **ESCRITA:** Knowledge Manager + especialistas de domínio
- **APROVAÇÃO:** Division Head + Revisão de Qualidade
- **ARQUIVO:** Apenas Knowledge Manager
