# Framework de Controle de Qualidade — KRAEFEGG M.O.

**Versão:** 1.0.0
**Última revisão:** 2026-09-04
**Responsável:** Diretor de Qualidade

---

## 1. Quality Gates por Estágio do Workflow

### Gate 1 — Planejamento (PRÉ-EXECUÇÃO)
- [ ] Briefing completo e claro
- [ ] Escopo definido com deliverables
- [ ] Fontes primárias identificadas
- [ ] Riscos iniciais mapeados
- **Aprovação:** Division Head (Level 3)

### Gate 2 — Execução (DURANTE)
- [ ] Fontes Tier 1-2 para dados críticos
- [ ] Fact checking parcial realizado
- [ ] Progresso conforme cronograma
- [ ] Bloqueios escalados em 24h
- **Aprovação:** Specialist (Level 2)

### Gate 3 — Revisão Técnica (PRÉ-APROVAÇÃO)
- [ ] Technical Review completa
- [ ] Fact Checking completo
- [ ] Source Verification completa
- [ ] Regulatory Compliance verificada
- [ ] Risk Control atualizado
- **Aprovação:** Approver (Level 3)

### Gate 4 — QA Documental (FINAL)
- [ ] Document QA aprovado
- [ ] Todos os achados anteriores resolvidos
- [ ] Versão final com metadata completa
- **Aprovação:** Diretor de Qualidade (Level 4)

---

## 2. Requisitos de Revisão por Tipo de Entregável

| Tipo | Fact Check | Source Verify | Technical Review | Doc QA | Risk Control |
|---|---|---|---|---|---|
| Relatório Técnico | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Parecer / Consulta | Obrigatório | Obrigatório | Obrigatório | Recomendado | Conforme risco |
| Documento Interno | Recomendado | Não aplicável | Não aplicável | Obrigatório | Não aplicável |
| Entregável ao Cliente | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Análise de Mercado | Obrigatório | Obrigatório | Recomendado | Obrigatório | Obrigatório |
| Proposta Comercial | Recomendado | Não aplicável | Recomendado | Obrigatório | Recomendado |

---

## 3. Caminhos de Escalação

### Nível 1 — Intra-equipe
- Issues menores de formatação/consistência
- Resolução: autor corrige e reenvia

### Nível 2 — Division Head
- Achados MAJOR em revisão técnica ou fact checking
- Conflitos entre agentes de qualidade
- Resolução: Division Head decide ou convoca revisão

### Nível 3 — Diretor de Qualidade
- Achados CRITICAL bloqueantes
- Não conformidade regulatória grave
- Risco reputacional alto
- Resolução: Diretor toma decisão final ou escala para CEO

### Nível 4 — CEO / Board
- Risco existencial ou crise reputacional
- Não conformidade com impacto legal
- Decisão estratégica sobre entrega comprometida

---

## 4. Métricas e KPIs de Qualidade

### KPIs Mensais
| Métrica | Meta | Alerta |
|---|---|---|
| Taxa de aprovação na 1ª revisão | ≥ 85% | < 70% |
| Tempo médio de revisão | ≤ 48h | > 72h |
| Achados CRITICAL/mês | ≤ 2 | > 5 |
| Fact check coverage | 100% para entregáveis clientes | < 95% |
| Não conformidades regulatórias | 0 | > 0 |
| Risk Register atualizado | 100% semanal | < 90% |
| QA pass rate | ≥ 90% | < 75% |

### Dashboard
- Dashboard de qualidade atualizado semanalmente
- Relatório executivo mensal para CEO
- Benchmarking trimestral com indústria

---

## 5. Procedimentos de Não Conformidade

### 1. Identificação
- Agente de qualidade identifica não conformidade
- Registra no sistema com severidade e categoria

### 2. Classificação
- **Crítica:** Impacto legal, financeiro ou reputacional severo
- **Maior:** Requer correção antes da entrega
- **Menor:** Pode ser corrigido na próxima iteração

### 3. Ação Corretiva
- **Crítica:** Imediata — trava entrega, escala CEO
- **Maior:** Correção em 48h antes da aprovação
- **Menor:** Próxima iteração ou sprint

### 4. Verificação
- Agente de qualidade verifica correção
- Registra evidência de resolução

### 5. Prevenção
- Atualiza processos/templates se necessário
- Adiciona ao LESSONS_LEARNED se aplicável
- Atualiza checklists se padrão recorrente

---

## 6. Ciclo de Melhoria Contínua

- Revisão trimestral do QC Framework
- Incorporação de lessons learned
- Benchmarking com boas práticas do setor
- Atualização de checklists conforme evolução regulatória
- Feedback de clientes integrado ao processo
