# Matriz de Permissões — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04

---

## Níveis de Acesso

### LEVEL 0 — Viewer (Visualizador)
- Ler documentos publicados
- Visualizar dashboards e relatórios públicos
- Buscar na Knowledge Base
- **NÃO pode:** Escrever, editar, aprovar, deletar, compartilhar

### LEVEL 1 — Executor (Executante)
- Criar rascunhos e documentos em área própria
- Editar seu próprio trabalho
- Comentar em documentos
- **NÃO pode:** Aprovar, deletar de outros, acessar dados sensíveis, modificar templates

### LEVEL 2 — Specialist (Especialista)
- Escrever em sua área de atuação
- Revisar documentos de nível inferior
- Aprovar entregas de nível inferior
- Acessar dados restritos da área
- **NÃO pode:** Aprovar entregas da própria divisão, modificar governança, acessar dados de outras divisões

### LEVEL 3 — Approver (Aprovador)
- Aprovar entregas de sua divisão
- Rejeitar e solicitar correções
- Acessar dados de todas as divisões para revisão
- Modificar templates e processos de sua divisão
- **NÃO pode:** Modificar governança global, acessar dados financeiros sensíveis sem autorização

### LEVEL 4 — Director (Diretor)
- Acesso total a todos os dados e documentos
- Modificar governança e políticas globais
- Aprovar exceções a políticas
- Acessar dados financeiros e estratégicos sensíveis
- Gerenciar permissões de outros usuários

---

## Matriz de Permissões Detalhada

| Ação | L0 | L1 | L2 | L3 | L4 |
|---|---|---|---|---|---|
| Ler documentos publicados | ✅ | ✅ | ✅ | ✅ | ✅ |
| Buscar Knowledge Base | ✅ | ✅ | ✅ | ✅ | ✅ |
| Criar rascunhos | ❌ | ✅ | ✅ | ✅ | ✅ |
| Editar próprio trabalho | ❌ | ✅ | ✅ | ✅ | ✅ |
| Comentar | ❌ | ✅ | ✅ | ✅ | ✅ |
| Revisar trabalho de outros | ❌ | ❌ | ✅ | ✅ | ✅ |
| Aprovar entregas | ❌ | ❌ | ✅(hierarquia) | ✅(divisão) | ✅(global) |
| Deletar documentos | ❌ | ❌ | ❌ | ✅(próprios) | ✅ |
| Modificar templates | ❌ | ❌ | ❌ | ✅(divisão) | ✅(global) |
| Acessar dados financeiros | ❌ | ❌ | ❌ | ❌ | ✅ |
| Modificar governança | ❌ | ❌ | ❌ | ❌ | ✅ |
| Gerenciar permissões | ❌ | ❌ | ❌ | ❌ | ✅ |
| Acessar dados de outra divisão | ❌ | ❌ | ❌ | ✅(leitura) | ✅(total) |
| Aprovar exceções a políticas | ❌ | ❌ | ❌ | ❌ | ✅ |

---

## Regras de Atribuição
1. Permissões são atribuídas por função, não por indivíduo
2. Conflito de interesse: agente NÃO pode revisar/aprovar seu próprio trabalho
3. Permissões temporárias devem ter prazo definido e aprovação de L4
4. Downgrade automático: após 30 dias sem atividade, nível reduz em 1
5. Auditoria: todas as ações de nível 3-4 são logadas
