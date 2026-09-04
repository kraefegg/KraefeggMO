# Framework de Controle de Qualidade — KRAEFEGG M.O.

**Versão:** 1.0.0  
**Última revisão:** 2026-09-04  
**Responsável:** Diretor de Qualidade (CTO)

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

| Tipo de Entregável | Fact Check | Source Verify | Technical Review | Doc QA | Risk Control |
|---|---|---|---|---|---|
| Relatório Técnico | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Parecer / Consulta | Obrigatório | Obrigatório | Obrigatório | Recomendado | Conforme risco |
| Documento Interno | Recomendado | Não aplicável | Não aplicável | Obrigatório | Não aplicável |
| Entregável ao Cliente | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Análise de Mercado | Obrigatório | Obrigatório | Recomendado | Obrigatório | Obrigatório |
| Proposta Comercial | Recomendado | Não aplicável | Recomendado | Obrigatório | Recomendado |
| EIA/RIMA | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Laudo Técnico | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Plano de Emergência | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |
| Documento Regulatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório | Obrigatório |

---

## 3. Processos de Qualidade

### 3.1 Fact Checking
| Campo | Detalhe |
|---|---|
| **Responsável** | `fact-checking` agent |
| **O que verifica** | Dados numéricos, estatísticas, datas, nomes, citações |
| **Critérios** | ≥ 2 fontes independentes para dados críticos |
| **Se falha** | Classificar como `unverified`; retornar para pesquisa |
| **Registro** | Log com fontes verificadas, status, timestamp |

### 3.2 Source Verification
| Campo | Detalhe |
|---|---|
| **Responsável** | `source-verification` agent |
| **O que verifica** | Autenticidade, confiabilidade e relevância das fontes |
| **Classificação** | Tier 1 (governo/regulador), Tier 2 (setorial), Tier 3 (notícias) |
| **Critérios** | ≥ 1 Tier 1 para dados críticos; ≥ 3 fontes no total |
| **Se falha** | Fonte removida; dados dependentes flagged como `low confidence` |
| **Registro** | SourceMap atualizado com status de cada fonte |

### 3.3 Technical Review
| Campo | Detalhe |
|---|---|
| **Responsável** | `technical-review` agent + peer reviewer |
| **O que revisa** | Precisão técnica, metodologia, lógica, completude |
| **Critérios** | Zero erros factuais; metodologia documentada; limitações declaradas |
| **Se falha** | Findings classificados (critical/major/minor); retorna para correção |
| **Registro** | ReviewReport com findings, severity, recomendação |

### 3.4 Document QA
| Campo | Detalhe |
|---|---|
| **Responsável** | `document-qa` agent |
| **O que verifica** | Formatação, consistência, metadata, referências, completude |
| **Critérios** | Template seguido; todas as seções preenchidas; referências completas |
| **Se falha** | Lista de pendências; retorna para preenchimento |
| **Registro** | QA checklist com status de cada item |

### 3.5 Risk Control
| Campo | Detalhe |
|---|---|
| **Responsável** | `risk-control` agent |
| **O que avalia** | Riscos técnicos, regulatórios, financeiros, reputacionais |
| **Critérios** | Todos os riscos HIGH/CRITICAL com plano de mitigação |
| **Se falha** | Risco não mitigado → escalation para Division Head |
| **Registro** | RiskRegister atualizado com status e owner |

---

## 4. Requisitos de Fontes por Tipo de Pesquisa

| Tipo de Pesquisa | Fontes Mínimas | Primárias Obrigatórias | Secundárias | Terciárias |
|---|---|---|---|---|
| Regulatória | 5 | ≥ 2 (legislação, normas) | ≥ 2 | ≤ 1 |
| Técnica | 7 | ≥ 3 (papers, laudos) | ≥ 3 | ≤ 1 |
| Mercado | 5 | ≥ 2 (dados setoriais) | ≥ 2 | ≤ 1 |
| Ambiental | 6 | ≥ 3 (dados de campo, licenças) | ≥ 2 | ≤ 1 |
| Due Diligence | 8 | ≥ 4 (documentos oficiais) | ≥ 3 | ≤ 1 |

---

## 5. Caminhos de Escalação

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

## 6. Métricas e KPIs de Qualidade

### 6.1 KPIs Mensais

| Métrica | Meta | Alerta |
|---|---|---|
| Taxa de aprovação na 1ª revisão | ≥ 85% | < 70% |
| Tempo médio de revisão | ≤ 48h | > 72h |
| Achados CRITICAL/mês | ≤ 2 | > 5 |
| Fact check coverage (entregas cliente) | 100% | < 95% |
| Não conformidades regulatórias | 0 | > 0 |
| Risk Register atualizado | 100% semanal | < 90% |
| QA pass rate | ≥ 90% | < 75% |
| Fontes Tier 1 em relatórios críticos | ≥ 2 | < 1 |
| Documentos sem revisão > 2 anos | 0 | > 0 |
| Audit trail completeness | 100% | < 95% |

### 6.2 Dashboard

- Dashboard de qualidade atualizado semanalmente
- Relatório executivo mensal para CEO
- Benchmarking trimestral com indústria
- Heatmap de achados por divisão e tipo

### 6.3 Métricas por Workflow

| Workflow | Métrica Específica | Meta |
|---|---|---|
| WK-001 | KOS → Proposta conversão | ≥ 60% |
| WK-002 | Entregas sem critical findings | ≥ 95% |
| WK-003 | Relatórios com 0 erros factuais | ≥ 95% |
| WK-004 | Propostas aprovadas 1ª vez | ≥ 80% |
| WK-005 | Condicionantes cumpridas no prazo | 100% |
| WK-006 | CATs registradas em 24h | 100% |

---

## 7. Procedimentos de Não Conformidade

### 7.1 Identificação
- Agente de qualidade identifica não conformidade
- Registra no sistema com severidade e categoria

### 7.2 Classificação
- **Crítica:** Impacto legal, financeiro ou reputacional severo
- **Maior:** Requer correção antes da entrega
- **Menor:** Pode ser corrigido na próxima iteração

### 7.3 Ação Corretiva
- **Crítica:** Imediata — trava entrega, escala CEO
- **Maior:** Correção em 48h antes da aprovação
- **Menor:** Próxima iteração ou sprint

### 7.4 Verificação
- Agente de qualidade verifica correção
- Registra evidência de resolução
- Fecha registro de não conformidade

### 7.5 Prevenção
- Atualiza processos/templates se necessário
- Adiciona ao LESSONS_LEARNED se aplicável
- Atualiza checklists se padrão recorrente
- Comunica lição aprendida para divisões relevantes

---

## 8. Ciclo de Melhoria Contínua

```
┌─────────────────────────────────────────────────────────┐
│              CICLO PDCA DE QUALIDADE                     │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐           │
│  │  PLAN    │───►│   DO     │───►│  CHECK   │           │
│  │          │    │          │    │          │           │
│  │Definir   │    │Executar  │    │Verificar │           │
│  │metas e   │    │processos │    │resultados│           │
│  │processos │    │          │    │          │           │
│  └──────────┘    └──────────┘    └────┬─────┘           │
│                                       │                  │
│                              ┌────────▼────────┐        │
│                              │      ACT        │        │
│                              │                 │        │
│                              │Corrigir, melhorar│       │
│                              │padronizar        │        │
│                              └─────────────────┘        │
└─────────────────────────────────────────────────────────┘
```

### Atividades de Melhoria

| Atividade | Frequência | Responsável |
|---|---|---|
| Revisão do QC Framework | Trimestral | Diretor de Qualidade |
| Incorporação de lessons learned | Contínuo | Knowledge Manager |
| Benchmarking com boas práticas | Trimestral | Quality Team |
| Atualização de checklists | Conforme evolução regulatória | Regulatory Compliance |
| Feedback de clientes integrado | Pós-entrega | Commercial + Quality |
| Análise de tendências de achados | Mensal | Quality Team |
| Treinamento de agentes em quality | Semestral | CTO + Quality |

---

**Este framework é a referência para todos os processos de qualidade da Kraefegg M.O. Qualquer alteração requer aprovação do CTO.**
