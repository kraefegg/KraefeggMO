# Trilha de Auditoria — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04

---

## Escopo de Auditoria

### Ações Obrigatoriamente Logadas
- Criação, edição, exclusão de documentos
- Aprovação ou rejeição de entregas
- Acesso a dados CONFIDENCIAL e ULTRA-SECRETO
- Modificação de permissões
- Alterações em governança e políticas
- Login/logout de agentes
- Publicação de documentos
- Exceções a políticas

### Ações Opcionalmente Logadas
- Acesso a dados RESTRITO (para análise de padrões)
- Buscas na Knowledge Base (para melhoria)

---

## Formato de Log

### Padrão de Registro
```
[TIMESTAMP] [AGENT_ID] [LEVEL] [ACTION] [TARGET] [DETAILS] [RESULT]
```

### Campos
- **TIMESTAMP:** ISO 8601 com timezone (UTC)
- **AGENT_ID:** Identificador único do agente/usuário
- **LEVEL:** Nível de acesso (L0-L4)
- **ACTION:** Tipo de ação (CREATE, READ, UPDATE, DELETE, APPROVE, REJECT, GRANT, REVOKE)
- **TARGET:** ID do objeto afetado
- **DETAILS:** Descrição resumida da ação
- **RESULT:** SUCCESS / FAILURE / PARTIAL

### Exemplo
```
[2026-09-04T14:30:00Z] [AGT-CTO-001] [L3] [APPROVE] [DOC-2026-042] [Relatório técnico - Análise de risco portuário] [SUCCESS]
```

---

## Retenção de Logs

| Tipo de Log | Retenção Mínima | Retenção Recomendada |
|---|---|---|
| Ações CRÍTICAS (exceções, exclusões) | 5 anos | Indefinida |
| Ações de nível 3-4 | 3 anos | 5 anos |
| Acesso a dados sensíveis | 3 anos | 5 anos |
| Ações de nível 1-2 | 1 ano | 3 anos |
| Logs de sistema | 6 meses | 2 anos |

---

## Revisão de Auditoria

### Frequência
- **Diária:** Verificação automática de erros e anomalias
- **Semanal:** Revisão de acessos a dados ULTRA-SECRETO
- **Mensal:** Análise de padrões e relatório executivo
- **Trimestral:** Auditoria completa e revisão de políticas

### Responsabilidades
- **Sistema:** Coleta automática e imutável
- **Knowledge Manager:** Revisão diária
- **Diretor de Qualidade:** Revisão mensal
- **CEO:** Revisão trimestral (ou delegate)

---

## Integridade dos Logs

- Logs são append-only (não editáveis)
- Armazenamento com hash de integridade
- Backup diário off-site
- Detecção de tampering com alertas imediatos
- Logs de auditoria NÃO podem ser deletados

---

## Relatórios de Auditoria

### Relatório Mensal
- Total de ações por tipo
- Acessos a dados sensíveis
- Exceções e incidentes
- Tendências e anomalias

### Relatório de Incidente
- Triggered por: falha de segurança, acesso não autorizado, violação de política
- Conteúdo: descrição, impacto, ação tomada, prevenção
- Distribuição: Diretor de Qualidade + CEO
- Follow-up obrigatório em 30 dias
