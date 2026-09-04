# Plano de Projetos Digitais — Kraefegg M.O.

Decisão executiva do **CEO** · consolidada pelo **orquestrador** · alinhada à Análise de Mercado e Soluções 2026 (R-2026-001) e ao plano operacional.

> Status: v1 · aprovado em 09/08/2026 · revisar a cada ciclo de 30 dias

---

## 1. Contexto (decisões do CEO em R-2026-001)

1. Priorizar **prefeituras → eólicas PB → restauração/carbono**.
2. **Assinatura como âncora de receita recorrente** (AIO + monitoramento contínuo).
3. Registrar todas as análises no banco de dados e disponibilizar download no HQ.
4. Lançar projetos digitais para atender o mercado com **entrega digital, recorrente e escalável**.

## 2. Portfólio de projetos digitais (lançamento v1)

| Código | Projeto | Objetivo de mercado | Entregável-chave | Receita-alvo | Subagentes | Prioridade |
|---|---|---|---|---|---|---|
| PRJ-2026-006 | **AIO Observatory Comercial** | SaaS multi-projeto de monitoramento geoambiental por assinatura | Versão multi-site + branding de cliente (marca d'água) + permissões | R$ 300–600/mês por projeto (setup R$ 3–8 mil) | engineering-dev, data-analytics | 1 |
| PRJ-2026-007 | **Página pública de M&V** | Demo pública de monitoramento & verificação para prospecção | Página pública + conteúdo técnico-comercial + CTA de reunião | Gera leads prefeituras/eólicas | commercial, engineering-dev | 1 |
| PRJ-2026-008 | **Kit Estação Meteo IoT** | Produto IoT instalável com telemetria contínua | Kit calibrado (ESP32→MQTT→CSV→AIO) + manual de instalação | Kit R$ 450–650 + assinatura R$ 300–1.000/mês | iot-embedded, engineering-dev | 2 |
| PRJ-2026-009 | **Kit Comercial Digital** | Máquina de propostas e fechamento | Proposta PDF + contrato de assinatura 14.133 + planilha de precificação | Fecha negócios 30–90 dias | commercial, contracts-business, finance | 1 |

## 3. Delegação (orquestrador → subagentes)

| Projeto | Rota | Responsável líder | Apoio | Resultado esperado |
|---|---|---|---|---|
| PRJ-2026-006 | `engineering-dev` → `data-analytics` | engineering-dev | data-analytics | Release comercial do AIO: multi-projeto, dados por cliente, marca d'água |
| PRJ-2026-007 | `commercial` + `engineering-dev` | commercial | engineering-dev | Página pública de demonstração + copy + CTA; template de proposta PDF |
| PRJ-2026-008 | `iot-embedded` → `engineering-dev` | iot-embedded | engineering-dev | Kit estação meteo validado em campo; telemetria integrada ao AIO |
| PRJ-2026-009 | `commercial` + `contracts-business` + `finance` | commercial | contracts-business, finance | Kit de fechamento: proposta, contrato de assinatura, precificação e fluxo de caixa |

## 4. Marcos 30/60/90

| Janela | Marco | Projeto |
|---|---|---|
| 0–30 | Versão comercial do AIO (multi-site, marca d'água) em demo | PRJ-2026-006 |
| 0–30 | Página pública de M&V no ar + 1ª proposta via kit comercial | PRJ-2026-007, PRJ-2026-009 |
| 0–30 | Kit estação meteo calibrado; contrato JSON de telemetria | PRJ-2026-008 |
| 31–60 | 1º piloto pago de assinatura; 2 clientes em demo | PRJ-2026-006/007 |
| 31–60 | Kit 2 (umidade de solo) em viveiro | PRJ-2026-008 (fase 2) |
| 61–90 | 1ª mensalidade recorrente (meta R$ 1,5–3 mil); case de sucesso | Todos |

## 5. Indicadores de sucesso (KPIs)

- Assinaturas ativas: 1 (60d) → 3 (90d).
- MRR: R$ 800 (60d) → R$ 1,5–3 mil (90d).
- Lead→reunião: ≥25% na página pública de M&V.
- Tempo de fechamento de proposta: ≤ 5 dias úteis (kit comercial).
- Disponibilidade da telemetria do kit: ≥95% no período de teste.

## 6. Riscos e mitigação

| Risco | Mitigação |
|---|---|
| Escopo de engenharia atrasa o SaaS comercial | Lançar versão mínima (multi-site + marca d'água) antes de módulos avançados |
| Página pública expõe dados sensíveis | Publicar apenas dados de demonstração/agregados; revisão `cybersecurity` |
| Kit IoT depende de hardware externo | PoC com componentes disponíveis (ESP32-S3, SHT31, BMP280); BOM em `finance` |
| Preço de assinatura rejeitado pelo mercado | Testar A/B no kit comercial; descontos cooperativas (−30–50%) |

## 7. Registro

- Banco de dados: projetos `PRJ-2026-006…009` + demandas `D-16…D-19` (schema `kraefegg`, tabelas `projetos`/`demandas`).
- HQ: demandas espelhadas em `hq-data.js` (`DEMANDAS`) para o painel de gestão.
- Análises e atas: versionadas em `docs/` (este documento) e no módulo Relatórios do HQ.
