# Segurança — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04

---

## Regras de Segurança

### Dados Sensíveis
- NUNCA armazenar credenciais em texto claro
- NUNCA committar segredos, tokens ou chaves
- Credenciais somente via variáveis de ambiente ou cofre de segredos
- Dados pessoais (LGPD) somente em storage com criptografia

### Criptografia
- **Em trânsito:** TLS 1.3 mínimo para todas as comunicações
- **Em repouso:** AES-256 para dados CONFIDENCIAL+
- **Backups:** Criptografia obrigatória
- **Chaves:** Rotação a cada 90 dias

### Autenticação
- Autenticação multifator (MFA) para L3+
- Senhas: mínimo 16 caracteres, complexidade elevada
- Sessões expiram após 30 min de inatividade
- Rate limiting em tentativas de login

---

## Gestão de Segredos

### Cofre de Segredos
- Todos os segredos centralizados (não em arquivos de configuração)
- Acesso por necessidade e temporário
- Rotação automática quando possível
- Auditoria de todos os acessos

### Tipos de Segredo
- Chaves de API
- Tokens de acesso
- Credenciais de banco de dados
- Certificados digitais
- Chaves de criptografia
- Credenciais de terceiros

### Procedimento
1. Segredo é criado/rotacionado
2. Armazenado no cofre de segredos
3. Acesso autorizado para agente necessário
4. Segredo nunca exposto em logs, chat ou documentos
5. Rotação conforme política de cada tipo

---

## NDA (Acordo de Sigilo)

### Quando Obrigatório
- Todos os agentes com acesso a dados RESTRITO+
- Contratos com terceiros que acessem dados internos
- Parceiros e fornecedores
- Colaboradores temporários

### Conteúdo do NDA
- Definição de informação confidencial
- Obrigações de sigilo (durante e após relacionamento)
- Penalidades por violação
- Procedimentos de devolução/destruição
- Prazo de vigência

### Gestão
- NDA registrado antes do acesso
- Cópia mantida em governance
- Renovação conforme prazo
- Violacao = rescisão imediata

---

## Resposta a Incidentes

### Classificação
- **SEVERE:** Vazamento de dados, acesso não autorizado, ransomware
- **HIGH:** Violação de política, tentativa de ataque
- **MEDIUM:** Vulnerabilidade identificada, configuração incorreta
- **LOW:** Evento de segurança sem impacto

### Procedimento
1. **Detecção:** Identificação do incidente
2. **Conter:** Isolar sistema/afetado imediatamente
3. **Avaliar:** Classificar severidade e impacto
4. **Notificar:** Diretor de Qualidade + CEO (SEVERE/HIGH)
5. **Remediar:** Corrigir vulnerabilidade
6. **Recuperar:** Restaurar operações normais
7. **Documentar:** Registrar em lessons learned
8. **Prevenir:** Atualizar políticas se necessário

### Prazos
- Contenção: imediato
- Notificação L4: até 1h para SEVERE
- Relatório preliminar: até 24h
- Relatório final: até 7 dias

---

## Regras Adicionais
- NUNCA executar código de fontes não verificadas
- NUNCA compartilhar credenciais entre agentes
- NUNCA desabilitar security checks para "facilidade"
- Sempre usar least privilege
- Revisão de segurança antes de cada deploy
