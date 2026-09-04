# Governança Corporativa — KRAEFEGG M.O.

**Versão:** 1.0.0  
**Última revisão:** 2026-09-04  
**Autor:** CEO / CTO

---

## 1. Princípios de Governança

| Princípio | Descrição |
|---|---|
| **Transparência** | Todas as decisões são documentadas e auditáveis |
| **Accountability** | Cada agente é responsável por suas entregas |
| **Separation of Duties** | Quem cria não aprova; quem aprova não publica sem dupla verificação |
| **Least Privilege** | Nível mínimo de acesso necessário para cada função |
| **Need-to-Know** | Acesso a dados sensíveis apenas quando estritamente necessário |
| **Compliance** | Conformidade com LGPD, regulamentações setoriais e normas técnicas |

---

## 2. Matriz de Permissões

### 2.1 Por Nível de Acesso

| Ação | L0 (Viewer) | L1 (Executor) | L2 (Specialist) | L3 (Approver) | L4 (Director) |
|---|---|---|---|---|---|
| Ler documentos públicos | ✅ | ✅ | ✅ | ✅ | ✅ |
| Ler docs internos | ❌ | ✅ | ✅ | ✅ | ✅ |
| Criar/editar docs internos | ❌ | Própria área | Área de atuação | Área + aprovação | Total |
| Ler dados restritos | ❌ | ❌ | Necessidade | ✅ | ✅ |
| Criar/editar dados restritos | ❌ | ❌ | Própria área | ✅ | ✅ |
| Acessar dados confidenciais | ❌ | ❌ | ❌ | Justificativa | ✅ |
| Acessar ultra-secreto | ❌ | ❌ | ❌ | ❌ | Registro |
| Aprovar entregas | ❌ | ❌ | ❌ | Na área | Total |
| Aprovar propostas > R$ 500K | ❌ | ❌ | ❌ | ❌ | CEO |
| Aprovar investimentos | ❌ | ❌ | ❌ | ❌ | CEO |
| Alterar governança | ❌ | ❌ | ❌ | ❌ | CEO + CTO |
| Publicar na KB | ❌ | ❌ | Solicitar | Aprovar | Total |
| Arquivar na KB | ❌ | ❌ | ❌ | ❌ | Knowledge Mgr + L4 |

### 2.2 Por Tipo de Documento

| Tipo de Documento | Criação | Revisão | Aprovação | Publicação |
|---|---|---|---|---|
| Relatório Técnico | Especialista | Peer Review | Division Head | Knowledge Mgr |
| Proposta Comercial | Commercial | CTO (escopo) | CEO | Commercial |
| EIA/RIMA | Environmental | Perito + CTO | CEO | Knowledge Mgr |
| Documento Interno | Qualquer L1+ | Division Head | — | Document Control |
| Análise de Mercado | Intelligence | Peer Review | Division Head | Knowledge Mgr |
| Laudo Técnico | Especialista L3 | CTO | CEO (se externo) | Document Control |
| Contrato | Legal + Commercial | CTO | CEO | Document Control |
| Plano de Emergência | Safety | CTO | CEO | Document Control |

---

## 3. Controle de Acesso

### 3.1 Níveis de Confidencialidade

| Nível | Nome | Descrição | Acesso |
|---|---|---|---|
| 0 | PÚBLICO | Documentos para divulgação pública | Todos |
| 1 | INTERNO | Documentação e procedimentos internos | L1+ (agentes ativos) |
| 2 | RESTRITO | Dados estratégicos, financeiros, competitivos | L2+ com necessidade |
| 3 | CONFIDENCIAL | IP, dados pessoais (LGPD), NDA | L3+ com justificativa |
| 4 | ULTRA-SECRETO | Chaves, credenciais, M&A, estratégia não divulgada | L4 apenas + registro |

### 3.2 Regras de Acesso por Dado

| Tipo de Dado | Confidencialidade | Nível Mínimo | Aprovação |
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

### 3.3 Procedimento de Solicitação

1. Solicitante justifica necessidade
2. Superior hierárquico aprova
3. Se RESTRITO+: Division Head aprova
4. Se CONFIDENCIAL+: Diretor de Qualidade aprova
5. Se ULTRA-SECRETO: CEO aprova
6. Registro no log de acesso
7. Acesso com prazo definido (renovável)

### 3.4 Revogação

Acesso revogado imediatamente em caso de:
- Mudança de função
- Término de contrato/engajamento
- Violação de política
- Fim do projeto que motivou o acesso

---

## 4. Requisitos de Auditoria

### 4.1 O que Auditar

| Evento | Frequência | Responsável | Retenção |
|---|---|---|---|
| Decisões executivas (L4) | Cada ocorrência | CEO + CTO | 10 anos |
| Aprovações de proposta | Cada ocorrência | Commercial + CEO | 5 anos |
| Acessos a dados confidenciais | Cada ocorrência | Quality | 5 anos |
| Alterações de governança | Cada ocorrência | CTO | Permanente |
| Entregas a clientes | Cada ocorrência | Delivery | 5 anos |
| Incidentes de segurança | Cada ocorrência | Cybersecurity | 10 anos |
| Resultados de qualidade | Mensal | Quality | 3 anos |
| Logs de comunicação | Contínuo | Knowledge Mgr | 1 ano |

### 4.2 Formato de Auditoria

```yaml
audit_record:
  id: "AUD-2026-XXX"
  timestamp: "2026-09-04T10:00:00-03:00"
  event_type: "decision|access|delivery|incident|quality"
  agent: "agent_id"
  action: "descrição da ação"
  target: "objeto da ação"
  hash: "sha256:..."
  previous_hash: "sha256:..."
  integrity: "verified"
```

### 4.3 Imutabilidade

- Registros de auditoria são append-only
- Cada registro com SHA-256 do conteúdo
- Hash anterior referenciado (cadeia)
- Backup diário em local separado
- Verificação de integridade semanal

---

## 5. Política de Versionamento

### 5.1 Semver para Documentos

| Componente | Quando Incrementar |
|---|---|
| **MAJOR** | Mudança de interpretação, conclusão ou estrutura |
| **MINOR** | Atualização de dados, contexto ou escopo |
| **PATCH** | Correção de erros tipográficos, formatação |

### 5.2 Regras de Versionamento

| Regra | Detalhe |
|---|---|
| **Controle de versão** | Todo documento versionado (v1.0.0) |
| **Changelog** | Cada versão com descrição da alteração |
| **Aprovação** | MAJOR requer aprovação do Division Head |
| **Revisão** | Documentos com > 2 anos sem revisão → flag `outdated` |
| **Arquivamento** | Versões obsoletas → ARCHIVE/ com tag `deprecated` |
| **Comparabilidade** | Diferenças entre versões devem ser claras |

### 5.3 Branching (para código)

| Branch | Uso |
|---|---|
| `main` | Produção, entregas aprovadas |
| `develop` | Integração, desenvolvimento ativo |
| `feature/*` | Funcionalidades específicas |
| `hotfix/*` | Correções urgentes |

**Commits:** Mensagens em pt-BR, formato `[tipo] descrição` (`[feat]`, `[fix]`, `[docs]`, `[refactor]`)

---

## 6. Regras de Segurança

### 6.1 Chaves e Credenciais

| Regra | Implementação |
|---|---|
| **Nunca em código** | Chaves somente em env vars / arquivos fora do git |
| **Rotação** | Credenciais rotacionadas a cada 90 dias |
| **Revogação** | Imediata em caso de comprometimento |
| **Registro** | Log de quando foram criadas, usadas, rotacionadas |
| **Backup** | Credenciais de backup em local seguro e separado |

### 6.2 Comunicação

| Regra | Detalhe |
|---|---|
| **Dados sensíveis** | Nunca incluir chaves, tokens ou credenciais em mensagens |
| **Criptografia** | Dados confidenciais em trânsito e repouso |
| **Autenticação** | Toda comunicação inter-agente autenticada |
| **Logging** | Todas as comunicações logadas com hash |

### 6.3 LGPD Compliance

| Requisito | Implementação |
|---|---|
| **Consentimento** | Dados pessoais coletados com consentimento |
| **Finalidade** | Dados usados apenas para finalidade declarada |
| **Minimização** | Coletar apenas dados necessários |
| **Qualidade** | Dados precisos e atualizados |
| **Segurança** | Proteção contra acesso não autorizado |
| **Transparência** | Informar sobre uso de dados |
| **Retention** | Dados mantidos apenas pelo tempo necessário |
| **Eliminação** | Exclusão solicitada em até 15 dias |

### 6.4 Senhas e Autenticação

| Regra | Detalhe |
|---|---|
| **Complexidade** | Mínimo 12 caracteres, maiúsculas, minúsculas, números, símbolos |
| **Autenticação** | MFA obrigatório para L3+ |
| **Sessão** | Timeout de 30 min para inatividade |
| **Lockout** | 5 tentativas falhas → bloqueio temporário (15 min) |

---

## 7. Checklist de Compliance

### 7.1 Compliance Operacional

- [ ] Todos os agentes com roles e permissões documentados
- [ ] Nenhum acesso sem justificativa
- [ ] Logs de acesso revisados mensalmente
- [ ] Credenciais rotacionadas no prazo
- [ ] Dados sensíveis fora do git
- [ ] .gitignore cobre todos os arquivos sensíveis
- [ ] Backup diário funcionando
- [ ] Incidentes de segurança reportados em 24h

### 7.2 Compliance de Entregas

- [ ] Quality gates seguidos para cada entrega
- [ ] Fact checking completo para entregas ao cliente
- [ ] Source verification para dados críticos
- [ ] Document QA antes de publicação
- [ ] Aprovação do Division Head antes de envio
- [ ] Versão final com hash registrada
- [ ] Audit trail completo

### 7.3 Compliance Regulatório

- [ ] Licenças ambientais válidas e monitoradas
- [ ] NRs de segurança do trabalho em dia
- [ ] CATs registradas no prazo (NR-1)
- [ ] Relatórios ambientais entregues conforme prazos
- [ ] LGPD compliance para dados pessoais
- [ ] NDA assinados para dados confidenciais

---

## 8. Escalation de Governança

| Evento | Nível | Escala para | Prazo |
|---|---|---|---|
| Violação de política menor | 1 | Division Head | 24h |
| Violação de política maior | 2 | Diretor de Qualidade | 12h |
| Violação de segurança | 3 | CTO + CEO | Imediato |
| Vazamento de dados | 4 | CEO + Board + Jurídico | Imediato |
| Não conformidade regulatória grave | 3-4 | CEO + Jurídico | 24h |
| Risco reputacional | 4 | CEO | Imediato |

---

## 9. Revisão da Governança

| Atividade | Frequência | Responsável |
|---|---|---|
| Revisão completa da governança | Anual | CEO + CTO |
| Auditoria de acessos | Trimestral | Quality |
| Revisão de permissões | Semestral | CTO |
| Teste de backup | Mensal | CTO |
| Simulação de incidente | Semestral | Safety + CTO |
| Revisão LGPD | Anual | Legal + Quality |

---

**Este documento é a fonte de verdade para a governança da Kraefegg M.O. Qualquer alteração deve ser aprovada pelo CEO.**
