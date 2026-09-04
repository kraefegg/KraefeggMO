# Workflow: Licenciamento Ambiental

> **ID:** WK-005
> **Versão:** 1.0
> **Autor:** CTO + environmental_compliance (Kraefegg M.O.)
> **Última atualização:** 2026-09-04
> **Objetivo:** Fluxo completo de screening ambiental até obtenção de licenças e monitoramento contínuo.
> **Base legal:** Lei 6.938/1981, Resolução CONAMA 237/1997, Resolução CONAMA 01/1986.

---

## Visão Geral

```
Screening do Projeto → Licença Preliminar (LP) → Estudo de Impacto Ambiental (EIA/RIMA)
    → Análise do Órgão Competente → Licença de Instalação (LI)
    → Licença Operacional (LO) → Monitoramento Contínuo
```

---

## Fase 1 — Screening do Projeto (Project Screening)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` + `data-analytics` |
| **Input** | Briefing do projeto: localização, tipo de atividade, porte,.area afetada |
| **Processo** | Classificação da atividade conforme lista CONAMA, identificação dos impactos potenciais, definição do órgão competente |
| **Output** | `EnvironmentalScreening` `{ project_type, activity_list, potential_impacts[], competent_body, required_licences[], estimated_timeline }` |
| **Classificação** | Lista de atividades potencialmente poluidoras (CONAMA 237/97 Anexo I) |
| **Órgãos competentes** | IBAMA (projetos federais), Órgão Estadual (projetos estaduais), Municipal (atividades locais) |
| **Gate de saída** | Screening completo com lista de licenças necessárias |
| **Timeout** | 48h |
| **Escalation** | Atividade de risco elevado (usina nuclear, mineração em área indígena) → CEO + assessoria jurídica |

---

## Fase 2 — Licença Preliminar (LP)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` |
| **Input** | `EnvironmentalScreening` da Fase 1 |
| **Processo** | Elaboração de termo de referência, pré-projeto,第一次 contacto com órgão ambiental |
| **Documentos obrigatórios** | 1) Requerimento 2) RG/CNPJ 3) Certidões negativas 4) Memorial descritivo 5) Mapa de localização 6) Croqui de situação |
| **Prazo regulatório** | LP emitida em até 30 dias (IBAMA) / variável por estado |
| **Output** | `LPSubmission` `{ submission_id, documents[], competent_body, submitted_at, expected_response }` |
| **Gate de saída** | LP emitida ou deferida com exigências |
| **Timeout** | 30-60 dias conforme órgão |
| **Escalation** | Exigências do órgão → analisar viabilidade; impossibilidade → suspender projeto |

---

## Fase 3 — Estudo de Impacto Ambiental (EIA/RIMA)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` (orquestração) + `perícia` (execução) + `iot-embedded` (monitoramento) |
| **Input** | LP aprovada + Termo de Referência |
| **Processo** | Elaboração do EIA/RIMA conforme Resolução CONAMA 001/86 |
| **Etapas do EIA** | 1) Diagnóstico ambiental 2) Análise de impactos 3) Alternativas 4) Programa de monitoramento 5) Plano de compensação |
| **Componentes obrigatórios** | Meio físico, biótico, socioeconômico, riscos, impactos acumulativos |
| **Output** | `EIA_RIMA` `{ eia_document, rima_document, public_hearing_record, technical_team }` |
| **Gate de saída** | EIA/RIMA completo com parecer da equipe técnica |
| **Timeout** | 6-18 meses conforme porte do projeto |
| **Human-in-the-loop** | Nível 3 — Profissional habilitado (Eng. Ambiental / Biólogo) assina |
| **Escalation** | Impacto significativo → public hearing obrigatório; comunidade afetada → mediação |

---

## Fase 4 — Análise do Órgão Competente (Licensing Review)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` (acompanhamento) |
| **Input** | `EIA_RIMA` submetido |
| **Processo** | Acompanhamento da análise pelo órgão, resposta a exigências, participação em reuniões |
| **Output** | `ReviewStatus` `{ status, demands[], responses[], meetings[], timeline }` |
| **Status possíveis** | `em_analise`, `exigencia`, `parecer_favoravel`, `parecer_contrario`, `audiencia_publica` |
| **Gate de saída** | Parecer favorável para LI |
| **Timeout** | 12-24 meses (prazo regulatório IBAMA: 12 meses prorrogável) |
| **Escalation** | Exigência técnica complexa → `perícia` mobilizada; parecer contrário → CEO + jurídico |

---

## Fase 5 — Licença de Instalação (LI)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` |
| **Input** | Parecer favorável da Fase 4 |
| **Processo** | Obtenção formal da LI, verificação de condicionantes, planejamento da instalação |
| **Documentos da LI** | 1) Condicionantes ambientais 2) Plano de monitoramento 3) Cronograma de implantação 4) Responsáveis técnicos |
| **Output** | `LIIssued` `{ li_number, validity, conditions[], monitoring_plan, responsible_tech }` |
| **Gate de saída** | LI emitida com condicionantes mapeadas e incorporadas ao cronograma do projeto |
| **Timeout** | 30 dias após aprovação |
| **Controle** | Todas as condicionantes registradas no knowledge base com prazos e responsáveis |

---

## Fase 6 — Licença Operacional (LO)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `environmental_compliance` + `iot-embedded` (monitoramento contínuo) |
| **Input** | `LIIssued` + projeto concluído/instalado |
| **Processo** | Verificação de conformidade com condicionantes da LI, elaboração de relatório de instalação, submissão para LO |
| **Documentos obrigatórios** | 1) Relatório de instalação 2) Comprovação de condicionantes cumpridas 3) Resultados de monitoramento 4) Plano de emergência |
| **Output** | `LOSubmission` `{ submission_id, compliance_report, monitoring_data, documents[] }` |
| **Prazo regulatório** | LO emitida em até 30-60 dias |
| **Gate de saída** | LO emitida; operação autorizada |
| **Timeout** | 60-120 dias para preparação + 30-60 dias para análise |
| **Escalation** | Condicionante não cumprida → plano de correção; impossibilidade → suspender operação |

---

## Fase 7 — Monitoramento Contínuo (Monitoring)

| Campo | Detalhe |
|---|---|
| **Agente responsável** | `iot-embedded` (sensores) + `environmental_compliance` (análise) |
| **Input** | `LOIssued` + plano de monitoramento |
| **Processo** | Coleta contínua de dados ambientais, relatórios periódicos, detecção de não-conformidades |
| **Frequência de relatórios** | Mensal (dados brutos), trimestral (análise), anual (consolidado para órgão) |
| **Output** | `MonitoringReport` `{ period, data[], anomalies[], compliance_status, corrective_actions[] }` |
| **Gate de saída** | Relatórios entregues nos prazos regulatórios |
| **Timeout** | Relatório anual: 30 dias antes do vencimento da LO |
| **Escalation** | Não-conformidade detectada → ação corretiva imediata;missão regulatória → CEO + jurídico |
| **Sensores IoT** | Qualidade da água, qualidade do ar, ruído, resíduos, efluentes |

---

## Mapa de Decisões

```
     ┌──────────────────┐
     │  Screening       │
     └────────┬─────────┘
              │
     ┌────────▼─────────┐
     │ Licença           │
     │ Preliminar (LP)   │
     └──┬─────────────┬──┘
   Emitida│             │Exigências
    ┌─────▼─────┐  ┌────▼──────────┐
    │ EIA/RIMA  │  │Avaliar        │
    └─────┬─────┘  │viabilidade    │
          │        └───────────────┘
     ┌────▼──────────┐
     │Análise Órgão  │
     └──┬────────┬───┘
  Parecer─┘       └─Exigência
┌────▼─────┐  ┌───▼──────────┐
│LI emitida│  │Responder     │
└────┬─────┘  │exigências    │
     │        └──────────────┘
┌────▼─────┐
│Instalação│
│+ LO      │
└────┬─────┘
     │
┌────▼──────────┐
│Monitoramento  │
│Contínuo       │
└───────┬───────┘
   ┌────▼─────┐
   │Renovação │
   │LO (3-5a) │
   └──────────┘
```

---

## Prazos Regulatórios por Órgão

| Órgão | Esfera | LP | EIA/RIMA | LI | LO |
|---|---|---|---|---|---|
| **IBAMA** | Federal | 30 dias | 12-24 meses | 30 dias | 30-60 dias |
| **SEMA/IPA** (exemplo PB) | Estadual | 30 dias | 6-12 meses | 30 dias | 30-60 dias |
| **SEMA-CE** | Estadual | 30 dias | 6-18 meses | 30 dias | 30-60 dias |
| **Prefeitura** | Municipal | 15 dias | 3-6 meses | 15 dias | 15 dias |

---

## Documentos Obrigatórios por Fase

### Licença Preliminar (LP)
1. Requerimento de licenciamento
2. RG/CNPJ
3. Certidão negativa de débitos
4. Certidão de regularidade fiscal
5. Memorial descritivo do empreendimento
6. Mapa de localização (escala adequada)
7. Croqui de situação
8. Comprovante de propriedade ou posse

### Licença de Instalação (LI)
1. EIA/RIMA aprovado
2. Condicionantes ambientais da LP cumpridas
3. Projeto executivo ambiental
4. Plano de monitoramento
5. Plano de emergência
6. CRTE (para atividades de risco)

### Licença Operacional (LO)
1. Relatório de instalação
2. Relatório de monitoramento (conforme plano)
3. Comprovação de cumprimento de condicionantes
4. Relatório de resíduos
5. Ficha de emergência atualizada

---

## Integração com Outros Workflows

| Workflow | Integração |
|---|---|
| WK-001 (Oportunidade → Proposta) | Fase de screening alimenta proposta com riscos e prazos regulatórios |
| WK-002 (Entrega Técnica) | LI/LO como entregáveis de projeto técnico |
| WK-003 (Pesquisa → Relatório) | EIA/RIMA segue estrutura de relatório de pesquisa |
| WK-006 (Resposta a Emergências) | Plano de emergência vinculado à LO |
