# Controle de Acesso — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04

---

## Níveis de Confidencialidade

### PÚBLICO (Public)
- Documentos para divulgação pública
- Materiais de marketing, site, redes sociais
- **Acesso:** Todos (L0+)

### INTERNO (Internal)
- Documentação interna da organização
- Procedimentos, templates, guias
- **Acesso:** L1+ (funcionários/agentes ativos)

### RESTRITO (Restricted)
- Dados estratégicos, financeiros, competitivos
- Contratos, propostas em andamento, dados de clientes
- **Acesso:** L2+ com necessidade comprovada

### CONFIDENCIAL (Confidential)
- Segredos comerciais, property intelectual
- Dados pessoais (LGPD), credenciais
- Informações under NDA
- **Acesso:** L3+ apenas, com justificativa documentada

### ULTRA-SECRETO (Top Secret)
- Chaves de API, credenciais de produção
- Estratégia corporativa não divulgada
- Dados de M&A, operações sensíveis
- **Acesso:** L4 apenas, com registro de acesso

---

## Regras de Acesso por Tipo de Dado

| Tipo de Dado | Confidencialidade | Nível Mínimo | Justificativa |
|---|---|---|---|
| Documentos públicos | PÚBLICO | L0 | — |
| Templates internos | INTERNO | L1 | — |
| Projetos em andamento | RESTRITO | L2 | Necessidade |
| Análises financeiras | RESTRITO | L2 | Necessidade |
| Dados de clientes | CONFIDENCIAL | L3 | LGPD + NDA |
| Credenciais/segredos | ULTRA-SECRETO | L4 | Segurança |
| Dados pessoais (LGPD) | CONFIDENCIAL | L3 | LGPD |
| Informações under NDA | CONFIDENCIAL | L3 | Contratual |
| Propriedade intelectual | CONFIDENCIAL | L3 | Proteção legal |
| Estratégia corporativa | ULTRA-SECRETO | L4 | Competitividade |

---

## Princípios

### Need-to-Know
- Acesso dado apenas quando necessário para a função
- Presunção de não acesso até justificativa
- Revisão trimestral de acessos ativos

### Least Privilege
- Nível mínimo necessário para executar a tarefa
- Sem acesso "por conveniência"
- Temporarização de acessos especiais

### Separation of Duties
- Quem cria não aprova
- Quem aprova não publica (sem dupla verificação)
- Dados sensíveis requerem 2 pessoas para acesso

---

## Procedimento de Solicitação de Acesso

1. Solicitante justifica necessidade (documento, dados, projeto)
2. Superior hierárquico aprova
3. Se RESTRITO+: Division Head aprova
4. Se CONFIDENCIAL+: Diretor de Qualidade aprova
5. Se ULTRA-SECRETO: CEO aprova
6. Registro no log de acesso
7. Acesso com prazo definido (renovável)

---

## Revogação
- Acesso revogado imediatamente em caso de:
  - Mudança de função
  - Término de contrato/engajamento
  - Violação de política
  - Fim do projeto que motivou o acesso
- Revogação registrada e auditada
