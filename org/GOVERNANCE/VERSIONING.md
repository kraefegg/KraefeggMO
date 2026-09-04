# Controle de Versão — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04

---

## Semver para Todos os Artefatos

### Formato
`MAJOR.MINOR.PATCH`

### Regras de Incremento
- **MAJOR:** Mudança de interpretação, conclusão ou direção estratégica
- **MINOR:** Atualização de dados, adição de contexto, nova seção
- **PATCH:** Correção de erro tipográfico, formatação, referência

### Exemplos
| Artefato | Mudança | Versão |
|---|---|---|
| Relatório técnico | Corrigido erro numérico | 1.0.0 → 1.0.1 |
| Relatório técnico | Adicionada nova análise | 1.0.1 → 1.1.0 |
| Relatório técnico | Conclusão reformulada | 1.1.0 → 2.0.0 |
| Template | Padronizado cabeçalho | 1.0.0 → 1.0.1 |
| Template | Nova seção obrigatória | 1.0.1 → 1.1.0 |
| Política | Mudança de escopo | 1.0.0 → 2.0.0 |

---

## Estratégia de Branching

### Branches Principais
- **main** — Versão estable e publicada
- **develop** — Versão em desenvolvimento
- **release/vX.Y** — Preparação de release

### Branches de Feature
- **feature/[area]/[descrição]** — Novos conteúdos ou mudanças
- **fix/[area]/[descrição]** — Correções
- **hotfix/[descrição]** — Correções urgentes

### Fluxo
1. Cria branch de feature a partir de `develop`
2. Desenvolve e testa
3. Abre PR para `develop`
4. Revisão e aprovação (L2+)
5. Merge em `develop`
6. Periodicamente, `develop` → `release/vX.Y`
7. QA completo no release
8. `release/vX.Y` → `main` (com tag)

---

## Tagging

### Formato de Tag
`vMAJOR.MINOR.PATCH`

### Tags Obrigatórias
- Toda mudança em `main` recebe tag
- Tags incluem: data, autor, descrição sumária
- Tags são imutáveis

### Exemplo
```
v2.1.0 — 2026-09-04 — AGT-CTO-001 — Relatório de risco portuário atualizado com dados 2026
```

---

## Controle de Artefatos

### Tipos de Artefato Versionados
- Documentos de entrega (relatórios, pareceres, análises)
- Templates e formulários
- Políticas e procedimentos
- Configurações de agentes
- Knowledge Base entries
- Metadados e configurações

### Regras
- Todo artefato publicado tem versão registrada
- Versão anterior arquivada (não deletada)
- History disponível para consulta
- Conflitos de versão resolvidos por Division Head

---

## Changelog

### Formato
Todo release inclui CHANGELOG com:
- Versão
- Data
- Autor(es)
- Mudanças (ADDED, CHANGED, FIXED, REMOVED)
- Breaking changes (se houver)

### Exemplo
```markdown
## [v2.1.0] - 2026-09-04
### ADDED
- Nova análise de risco para terminal portuário
### CHANGED
- Atualizados dados de mercado Q3/2026
### FIXED
- Corrigido cálculo de ROI no item 4.2
```
