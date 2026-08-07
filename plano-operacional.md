# Plano Operacional — Kraefegg M.O.

Empresa de **mineração, energia e engenharia ambiental** operada como sistema multiagente de IA (gateway OmniRoute). Documento consolidado pelo **orquestrador** com insumos dos departamentos técnicos.

> Status: v1 · data de abertura das operações · revisar a cada ciclo de 90 dias

---

## 1. Estrutura corporativa

| Nível | Agente | Papel |
|---|---|---|
| Executivo | `ceo` | Estratégia, metas de receita, decisões |
| Executivo | `cto` | Arquitetura tecnológica, IoT/Edge, dados, segurança |
| Executivo | `market-segment` | Posicionamento, precificação, funil do segmento-alvo |
| Coordenação | `orchestrator` | Roteia pedidos e consolida entregas |
| Execução | 34 subagentes-departamento | Especialistas por área |

## 2. Segmento-alvo

**Monitoramento geoambiental e serviços de engenharia ambiental no Cariri paraibano / Nordeste do Brasil**: PRAD e recuperação de áreas degradadas, licenciamento (SUDEMA/IBAMA), compensação ambiental de parques eólicos/solares, monitoramento contínuo por assinatura, laudos e perícias. Mercados adjacentes: mineração (brita/calcário), agro, segurança do trabalho, energia, offshore NE.

**Âncora de demanda**: usinas eólicas/solares com obrigação de compensação ambiental e condicionantes de licenciamento; prefeituras do Cariri; mineradoras/pedreiras sob condicionante.

**Produto-farol**: AIO Observatory — dashboard web client-side (HTML/JS vanilla, sem build) de monitoramento geoambiental do PRAD Caraúbas-PB, com NDVI Sentinel-2 real, Open-Meteo, focos INPE BDQueimadas e modelo hidrológico Q = A × V.

## 3. Linhas de P&D

| Domínio | Linha de pesquisa | Produto aplicado |
|---|---|---|
| Ambiental | Assinatura NDVI/hidrologia que prediz recuperação funcional de PRAD na Caatinga | Certificado Digital de Recuperação |
| Segurança do trabalho | Telemetria de exposição ocupacional (IBUTG, poeira, ruído — NR-15/9) | Painel Health & Safety |
| Florestal | Biomassa/regeneração da Caatinga por visão computacional | Contador de Mudas Edge |
| Mineração | Reservas e plano de lavra com ML (agregados do Cariri) | Mina Inteligente Caraúbas |
| Mineralogia | Classificação por espectroscopia portátil (Vis-NIR/Raman) | Scanner MineraloTech |
| Civil / geotecnia | Multi-sensor para estabilidade de taludes e pilhas | Painel TaludeSeguro |
| Renováveis | Previsão de geração solar/eólica por ML (Open-Meteo) | AIO GenForecast |
| Offshore | Inspeção de corrosão subsea/atmosférica por visão | AIO Subsea Inspect |
| Perícia/auditoria | Datação forense de degradação via séries NDVI | Módulo Cronologia da Degradação |

Entregáveis científicos transversais: 3+ artigos (Revista Caatinga, Sociedade & Natureza, Remote Sensing, Ecological Indicators), datasets públicos (Zenodo/GitHub com DOI), metodologias reexecutáveis.

## 4. Portfólio e precificação (R$)

| Produto/serviço | Modelo | Preço referência |
|---|---|---|
| SaaS AIO Observatory por projeto | Setup + mensalidade | 3.000–8.000 setup · 300–600/mês |
| Monitoramento contínuo contratado | Assinatura mensal | 800–1.500/mês |
| PRAD + laudo de recuperação | Projeto | 8.000–25.000 |
| EIA/RIMA e licenciamento | Projeto | 20.000–80.000 |
| PGR + PPRA + LTCAT | Projeto | 6.000–20.000 |
| Laudo de insalubridade/periculosidade | Laudo | 3.000–8.000 |
| Inventário florestal + DOF | Projeto | 6.000–30.000 |
| Relatório de reservas (ANM/CREA) | Projeto | 8.000–25.000 |
| Plano de lavra + sequenciamento | Projeto | 12.000–40.000 |
| Caracterização mineralógica (DRX/FRX + petrografia) | Por amostra | 800–2.500 |
| Laudo geotécnico de taludes/pilhas | Laudo | 4.000–12.000 |
| Due diligence de fazenda solar | Projeto | 8.000–25.000 |
| Auditoria de parque eólico (SCADA) | Projeto | 15.000–40.000 |
| Laudo pericial de dano ambiental | Perícia | 8.000–25.000 |
| Monitoramento de qualidade água/solo/ar | Por ponto/mês | 2.500/mês |
| Consultoria técnica | Hora | 150–250/h |

Descontos para cooperativas e agricultor familiar (−30–50%); preço cheio para empresas de energia (obrigação de compensação).

## 5. Linha IoT/Edge/Embedded

**Arquitetura**: sensores → Edge (ESP32/ESP32-S3, R$ 45–90) → gateway LoRa/RPi (R$ 150–500) → broker MQTT → CSV no GitHub → AIO Observatory. Zero backend, sem build; app degrada graciosamente offline. Protocolos: LoRa/LoRaWAN, MQTT, Modbus RTU. Firmware: MicroPython (protótipo) / FreeRTOS-ESP-IDF (produção).

**Kits vendáveis/instaláveis**:
| Kit | Sensores | Custo est. |
|---|---|---|
| Estação meteo agro-ambiental | SHT31, pluviômetro, anemômetro, BMP280, solar 6V | 450–650 |
| Monitor de umidade de solo (viveiro) | 4× capacitivo, DS18B20, bomba opcional | 180–300 |
| Datalogger de nível — Rio Paraíba | JSN-SR04T, RTC, SD + 4G | 350–500 |
| Qualidade do ar / pó / ruído | SDS011, MQ-7, microfone, BME280 | 400–600 |

**Automação**: irrigação por regra Edge, alerta de queimada Edge + INPE, coleta agendada Open-Meteo/INPE, relatórios automáticos.

## 6. Prospecção — alvos prioritários (10 de ~40)

Prefeituras do Cariri (Caraúbas, Juazeirinho, São João do Tigre) · pedreiras de brita (Caraúbas/Cabaceiras) · calcário do Cariri · Complexo Eólico do Cariri (PB) · usinas solares NE · frigoríficos de Patos/Campina Grande · barragem de Boqueirão · CEREST-PB · escritórios de advocacia ambiental · MP-PB/SUDEMA/IBAMA · prestadores offshore de Natal (RN)/Maceió (AL).

## 7. Plano de ação 30/60/90 dias

| Janela | Ação | Responsável |
|---|---|---|
| 0–30 | Listar 20 alvos; campanha de prospecção; 10 reuniões | `client-prospecting`, `commercial` |
| 0–30 | Página de demonstração pública + template de proposta PDF | `engineering-dev` |
| 0–30 | Minuta de contrato + LGPD | `contracts-business`, `legal-compliance` |
| 0–30 | Planilha de precificação e fluxo de caixa | `finance` |
| 0–30 | PoC M1: contrato de telemetria JSON + kit estação meteo | `engineering-dev` |
| 31–60 | Converter ≥2 reuniões em proposta; 1 piloto gratuito 30 dias | `commercial` |
| 31–60 | Versão comercial do AIO (multi-projeto, marca d'água) | `engineering-dev` |
| 61–90 | Entregar piloto; cobrar 1ª mensalidade (meta R$ 1,5–3 mil) | `commercial`, `finance` |
| 61–90 | Case de sucesso para LinkedIn; busca de editais | `commercial`, `market-segment` |

## 8. Roadmap de tecnologia (0–6 meses)

| Mês | Marco | Subagente |
|---|---|---|
| M1 | Contrato JSON de telemetria + `AIO.sites`; PoC ESP32→MQTT→CSV | engineering-dev |
| M1 | Pipeline INPE/Open-Meteo agendado + cache | data-analytics |
| M2 | Kit 1 (estação meteo) calibrado na página Meteo | engineering-dev |
| M2 | Spec LoRa + gateway RPi; seleção de provedor | engineering-dev |
| M3 | Kit 2 (umidade solo) + irrigação Edge em viveiro | engineering-dev |
| M3 | Ingestão Oracle (bronze) + Databricks (silver/gold) | data-analytics |
| M4 | Kit 3 (datalogger rio) em campo; alerta de cheia | engineering-dev |
| M4 | Detecção de queimada no Edge + alerta INPE | ai-ml |
| M5 | Kit 4 (AQI) + Modbus; página Sensoriamento com AQI | engineering-dev |
| M5 | ML: previsão de umidade/queimada (RAG de séries) | ai-ml |
| M6 | Relatório automático consolidado + docs de instalação | data-analytics |
| M6 | Roadmap v2: multi-site, OT-Security, OTA | engineering-dev |

## 9. Regras de execução

- Roteamento: pedido → orquestrador → subagente especialista → consolidação.
- Comunicação e artefatos em pt-BR.
- Chaves e segredos somente em variáveis de ambiente.
- Entregas claras, reproduzíveis e versionadas (GitHub Flow quando aplicável).
