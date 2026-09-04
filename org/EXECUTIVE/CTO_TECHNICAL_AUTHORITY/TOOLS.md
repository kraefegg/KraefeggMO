# CTO Technical Authority — Ferramentas

## Ferramentas de Revisão

### code-review
- **Uso:** Revisão de código-fonte
- **Capacidades:** Análise estática, verificação de padrões, detecção de smells
- **Checklist aplicado:** Legibilidade, padrões, testes, segurança
- **Quando usar:** Para toda entrega de código novo ou modificado

### technical-validation
- **Uso:** Validação de especificações e requisitos técnicos
- **Capacidades:** Verificação de completude, consistência, viabilidade
- **Quando usar:** Antes de aprovação de implementação

### benchmark
- **Uso:** Análise comparativa de soluções técnicas
- **Capacidades:** Comparação de performance, custo, escalabilidade
- **Quando usar:** Quando múltiplas opções técnicas são avaliadas

## Ferramentas de Qualidade

### quality-checklist
- **Uso:** Aplicação de checklists de qualidade padronizados
- **Tipos:** Código, Documento, Arquitetura, Segurança
- **Quando usar:** Em toda revisão formal realizada pelo CTO

### fact-checker
- **Uso:** Verificação de afirmações técnicas
- **Capacidades:** Cross-reference com documentação oficial, validação de specs
- **Quando usar:** Para qualquer afirmação técnica em propostas ou entregas

### source-verifier
- **Uso:** Validação de fontes e referências
- **Capacidades:** Verificação de URLs, confiabilidade de fontes, atualidade
- **Quando usar:** Em documentos que citam dados técnicos ou de mercado

## Ferramentas de Documentação

### standards-manager
- **Uso:** Gestão de versão de padrões técnicos
- **Capacidades:** Versionamento, diff, notificação de mudanças
- **Quando usar:** Para criar, atualizar ou consultar padrões

### review-report-generator
- **Uso:** Geração de relatórios de revisão padronizados
- **Formato:** Technical Review / Quality Certificate / Rework Request
- **Quando usar:** Ao concluir qualquer revisão formal

## Ferramentas de Segurança

### security-scanner
- **Uso:** Verificação de vulnerabilidades em dependências
- **Capacidades:** CVE check, OWASP validation, secrets detection
- **Quando usar:** Em toda entrega que envolva código ou configuração

### compliance-checker
- **Uso:** Verificação de conformidade técnica
- **Capacidades:** LGPD, boas práticas, padrões da organização
- **Quando usar:** Para sistemas que processam dados sensíveis

## Restrições de Uso
- Ferramentas de segurança operam em modo leitura por padrão
- `code-review` não modifica código — apenas reporta problemas
- `standards-manager` requer notificação ao CEO para mudanças significativas
- Todas as ações das ferramentas são logadas para auditoria
- Acesso a sistemas de produção requer autorização explícita
