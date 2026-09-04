# Protocolo: Quality Gates

> **ID:** PT-004
> **Versão:** 1.0
> **Autor:** CTO (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Definir critérios de qualidade para cada fase de cada workflow, garantindo consistência e excelência.

---

## Princípios

1. **Qualidade é responsabilidade de todos** — Cada agente é responsável pela qualidade do seu output
2. **Verificação é obrigatória** — Nenhum output avança sem passar pelo quality gate
3. **Defeitos são baratos no início** — Quanto mais cedo detectado, menor o custo de correção
4. **Dados > opiniões** — Critérios de qualidade são mensuráveis sempre que possível
5. **Melhoria contínua** — Quality gates são revisados trimestralmente

---

## Quality Gates por Workflow

### WK-001 — Oportunidade → Proposta

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-001.1** | Market Intelligence | Sinal classificado `relevant` ou `strategic`; ≥ 1 fonte primária | Sinal classificado `noise`; sem fonte primária | Descartar ou retornar para coleta |
| **QG-001.2** | Opportunity Intelligence | Brief com ≥ 3 fontes independentes; TAM/SAM/SOM estimado | < 3 fontes; sem estimativa de mercado | Retornar à Fase 1 |
| **QG-001.3** | Score KOS | Score calculado e documentado; justificativa ≥ 200 chars | Score sem justificativa; cálculo não replicável | Recalcular com metodologia |
| **QG-001.4** | Pesquisa | ≥ 5 fontes validadas; cobertura ≥ 80% do escopo; sem contradições | < 5 fontes; contradição não resolvida | Pesquisa adicional |
| **QG-001.5** | Validação de Evidências | ≥ 80% evidências `high/medium`; todas as contradições resolvidas | < 50% `high/medium`; contradição aberta | Retornar à Fase 4 |
| **QG-001.6** | Inteligência Estratégica | Brief aprovado por CEO; seções completas; margem estimada documentada | Brief incompleto; sem aprovação | Revisar e reapresentar |
| **QG-001.7** | Decisão Executiva | DecisionRecord com hash; confiança ≥ 70%; rationale ≥ 300 chars | Sem hash; confiança < 50% | Reavaliar com mais dados |
| **QG-001.8** | Business Development | Plano com conta mapeada; contato agendado; materiais prontos | Conta não mapeada; materiais incompletos | Pesquisa adicional da conta |
| **QG-001.9** | Qualificação | BANT ≥ 3/4 documentado; fontes de cada resposta identificadas | BANT < 3/4; dados não verificados | Prospectar mais informações |
| **QG-001.10** | Estratégia de Proposta | Margem alva ≥ 25%; escopo aprovado por CTO; exclusões documentadas | Margem < 20%; escopo ambíguo | Renegociar escopo ou pricing |
| **QG-001.11** | Proposta Comercial | Versão final aprovada por CEO + CTO; hash SHA-256; todas as seções preenchidas | Sem aprovação; seção faltante; sem hash | Completar e reapresentar |

---

### WK-002 — Entrega Técnica

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-002.1** | Solicitação | Request classificada com tipo e urgência; contatos validados | Sem classificação; contatos inválidos | Retornar para registro correto |
| **QG-002.2** | Escopo | Escopo aprovado por CTO + cliente sign-off; entregáveis mensuráveis | Escopo ambíguo; sem sign-off | Renegociar com cliente |
| **QG-002.3** | Alocação | ≥ 90% recursos alocados; orçamento aprovado | < 80% alocados; orçamento rejeitado | Renegociar escopo ou buscar recursos |
| **QG-002.4** | Execução (Checkpoints) | Tasks ≤ 10% atraso; blockers documentados; progress report semanal | Atraso > 20%; sem report; blocker > 48h | Escalar para CTO |
| **QG-002.5** | Qualidade | Zero findings `critical`; ≤ 2 `major` com plano; 100% escopo coberto | Finding `critical` sem correção; > 2 `major` | Corrigir antes de avançar |
| **QG-002.6** | Aprovação CTO | Hash SHA-256; todas as condições documentadas; compliance verificado | Sem hash; condições não documentadas | Documentar e reapresentar |
| **QG-002.7** | Entrega | Pacote completo; cliente confirma recebimento; versão taggeada | Pacote incompleto; sem confirmação | Completar e reenviar |
| **QG-002.8** | Aceite | Aceite formal; change requests categorizados; satisfação ≥ 7/10 | Rejeição; satisfação < 5/10 | Investigar e planejar correção |

---

### WK-003 — Pesquisa → Relatório

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-003.1** | Pergunta | Pergunta SMART (específica, mensurável, etc.); escopo delimitado | Pergunta vaga; sem delimitação | Refinar com stakeholder |
| **QG-003.2** | Fontes | ≥ 3 primárias ou secundárias; cobertura ≥ 80% | < 3 fontes; cobertura < 60% | Buscar fontes adicionais |
| **QG-003.3** | Coleta | Dados de ≥ 80% das fontes; metadata completa | < 80%; metadata incompleta | Completar coleta |
| **QG-003.4** | Verificação | ≥ 70% dados `high/medium`; anomalias documentadas | < 50% verificados; anomalias ignoradas | Verificar ou re-coletar |
| **QG-003.5** | Análise | Análise completa com limitations; metodologia documentada | Análise incompleta; sem limitations | Completar e documentar |
| **QG-003.6** | Classificação | 100% findings classificados (A-D); nenhum A contradito por D | Sem classificação; contradição A vs D | Reavaliar evidências |
| **QG-003.7** | Relatório | 8 seções obrigatórias completas; referências ≥ 10 | Seção faltante; < 10 referências | Completar seções e referências |
| **QG-003.8** | Qualidade | Zero erros factuais; 100% referências validadas | Erro factual; referência quebrada | Corrigir e revalidar |

---

### WK-004 — Funil de Vendas

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-004.1** | Lead | Empresa validada; contato identificado; deduplicado | Empresa inexistente; contato inválido | Descartar ou corrigir |
| **QG-004.2** | Conta | Perfil com ≥ 2 pain points; ≥ 1 decisor | < 2 pain points; sem decisor | Pesquisa adicional |
| **QG-004.3** | Decisor | Economic buyer identificado com canal | Sem decisor acessível | Buscar via parcerias |
| **QG-004.4** | Aproximação | Contato estabelecido; resposta não negativa | Sem resposta 3×; resposta negativa | Buscar abordagem alternativa |
| **QG-004.5** | Qualificação | BANT ≥ 3/4 documentado | BANT < 2/4 | Mover para nurture |
| **QG-004.6** | Necessidades | NeedsAssessment validado pelo cliente | Sem validação do cliente | Agendar nova sessão |
| **QG-004.7** | Proposta | Aprovada por CTO (escopo) + CEO (comercial) | Sem aprovação dupla | Revisar e reapresentar |
| **QG-004.8** | Negociação | Termos finais aceitos; limites de concessão respeitados | Impasse; concessão acima do limite | CEO participa |
| **QG-004.9** | Fechamento | Contrato assinado; pagamento registrado | Sem contrato; sem pagamento | Follow-up jurídico |

---

### WK-005 — Licenciamento Ambiental

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-005.1** | Screening | Atividade classificada; órgãos competentes identificados | Sem classificação; órgão errado | Revisar com regulador |
| **QG-005.2** | LP | Documentação completa submetida; protocolo registrado | Documento faltante; sem protocolo | Completar documentação |
| **QG-005.3** | EIA/RIMA | Todos os componentes obrigatórios presentes; equipe qualificada | Componente faltante; equipe não qualificada | Completar e qualificar |
| **QG-005.4** | Análise | Exigências respondidas; prazo regulatório respeitado | Exigência não respondida; prazo perdido | Responder e justificar |
| **QG-005.5** | LI | Condicionantes mapeadas; incorporadas ao cronograma | Condicionante ignorada | Revisar cronograma |
| **QG-005.6** | LO | Relatório completo; condicionantes cumpridas; monitoramento ativo | Relatório incompleto; condicionante pendente | Completar antes de submeter |

---

### WK-006 — Resposta a Emergências

| Gate | Fase | Critérios de passagem | Critérios de falha | Ação em caso de falha |
|---|---|---|---|---|
| **QG-006.1** | Detecção | Incidente confirmado (não falso alarme); alerta registrado | Falso alarme; sem registro | Registrar como near-miss |
| **QG-006.2** | Classificação | Nível atribuído com justificativa; vítima/risco documentado | Sem classificação; vítima não documentada | Re-classificar com dados |
| **QG-006.3** | Escalation | Todos notificados confirmaram; cadeia completa | Notificação falhou; cadeia incompleta | Re-notificar via canal alternativo |
| **QG-006.4** | Contenção | Incidente contido; sem propagação; área isolada | Propagação; contenção falhou | Escalar nível de resposta |
| **QG-006.5** | Investigação | Causa raiz identificada; ≥ 2 evidências; timeline reconstruída | Sem causa raiz; < 2 evidências | Investigação adicional |
| **QG-006.6** | Relatório | CAT/regulatório no prazo; relatório interno completo | CAT atrasado; relatório incompleto | Priorizar CAT; completar relatório |
| **QG-006.7** | Ações Corretivas | Plano aprovado; ações críticas com responsável e prazo | Sem plano; sem responsável | Definir plano |

---

## Critérios de Qualidade Universais

### Para todo output de agente

| Critério | Medida | Target |
|---|---|---|
| **Completude** | % de campos obrigatórios preenchidos | 100% |
| **Precisão** | Dados verificáveis contra fontes | ≥ 95% |
| **Consistência** | Sem contradições internas | 100% |
| **Relevância** | Conteúdo pertinente ao escopo | ≥ 90% |
| **Clareza** | Leitura compreensível por destinatário | Subjetivo (peer review) |
| **Timeliness** | Entregue dentro do prazo | ≥ 90% das entregas |

### Para decisões

| Critério | Medida | Target |
|---|---|---|
| **Documentação** | DecisionRecord completo | 100% |
| **Rastreabilidade** | Hash SHA-256 | 100% |
| **Justificativa** | ≥ 300 chars de rationale | 100% |
| **Opções avaliadas** | ≥ 2 opções apresentadas | 100% |
| **Confiança declarada** | % de confiança documentado | 100% |

---

## Processo de Quality Gate

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐
│Agente       │────►│Output        │────►│Quality Gate  │
│executa      │     │produzido     │     │verificação   │
└─────────────┘     └──────────────┘     └──────┬───────┘
                                          ┌─────┴─────┐
                                     Pass─┘           └─Fail
                                ┌────────▼───┐   ┌──────▼──────┐
                                │Avançar     │   │Corrigir     │
                                │próxima fase│   │(até 3×)     │
                                └────────────┘   └──────┬──────┘
                                                   ┌────▼─────┐
                                              3×────┤Escalar   │
                                              fail  │para CTO  │
                                                    └──────────┘
```

---

## Registro de Quality Gate

```yaml
quality_gate_record:
  gate_id: "QG-001.5"
  workflow: "WK-001"
  phase: "F5 — Validação de Evidências"
  task_id: "WK-001-F5-T1"
  
  timestamp: "2026-09-06T16:00:00-03:00"
  
  criteria:
    - criterion: "Evidências high/medium ≥ 80%"
      measured: "85%"
      status: "PASS"
    - criterion: "Contradições resolvidas"
      measured: "2 de 2 resolvidas"
      status: "PASS"
    - criterion: "Fontes primárias ≥ 3"
      measured: "5"
      status: "PASS"
  
  overall: "PASS"
  reviewer: "cto"
  attempts: 1
  
  notes: "Pesquisa robusta; todas as contradições resolvidas com fontes adicionais"
```
