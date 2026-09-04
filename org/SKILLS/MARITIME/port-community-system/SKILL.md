# SKILL: Sistema de Comunidade Portuária (PCS)

## Versão
1.0.0 | Autor: Maritime Department

## Propósito
Integrar sistemas de comunidade portuária para facilitar o fluxo de informações entre stakeholders portuários: terminais, agentes, autoridades, transportadoras e embarcadoras.

## Escopo
- Integração de PCS com sistemas de terminais (TOS)
- Troca eletrônica de dados (EDI) entre stakeholders
- Rastreamento de carga em tempo real no porto
- Coordenar operações de atracação, amarração e descarga

## Quando Usar
- Implementação de PCS em porto ou terminal
- Otimização de fluxo de informação entre stakeholders
- Digitalização de processos portuários (paperless)
- Análise de eficiência operacional do porto

## Quando NÃO Usar
- Gerenciamento documental alfandegário (usar maritime-single-window)
- Rastreamento global de embarcações (usar maritime-intelligence)
- Avaliação de capacidade física do porto (usar port-analysis)

## Entradas Necessárias
- Arquitetura de sistemas existente (TOS, ERP, comunicações)
- Lista de stakeholders e fluxos de informação
- Requisitos técnicos: APIs, EDI (EDIFACT), mensagens IMO
- Dados operacionais: movimentações, tempos de ciclo

## Procedimento
1. Levantar fluxos de informação atuais e gargalos
2. Definir arquitetura PCS: centralizada, distribuída ou híbrida
3. Implementar integração EDI com mensagens padrão (IFTMIN, IFTSTA)
4. Desenvolver módulo de rastreamento de carga em tempo real
5. Integrar com TOS do terminal para movimentação de carga
6. Implementar dashboard para stakeholders (visão consolidada)
7. Treinar usuários e realizar testes de integração
8. Operar e monitorar sistema conforme SLA

## Ferramentas
- Software PCS (PortNet, CargoSmart, sistema customizado)
- Middleware de integração (MuleSoft, Apache Camel)
- EDI converter para mensagens EDIFACT/ANSI X12
- Dashboard Power BI ou Grafana para monitoramento

## Requisitos de Fonte
- P_idxs e diretrizes da FAL (Facilitation Convention, IMO)
- Padronização EDI para comunidade portuária (UN/EDIFACT)
- Regulamentação ANTAQ para PCS (se existir)
- Padrões ISO para intercâmbio de dados (ISO 15459)

## Verificação
- Integração testada com todos os stakeholders-chave
- Tempos de processamento de mensagens <5 segundos
- Disponibilidade do sistema ≥99,5%
- Usuários treinados e certified

## Formato de Saída
Documento de arquitetura PCS, fluxos de integração, mensagens EDI, dashboard, manual de operações, plano de contingência.

## Critérios de Qualidade
- Redução ≥30% no tempo de processamento documental
- Integração com ≥90% dos stakeholders do porto
- Disponibilidade ≥99,5% (excluindo manutenção programada)
- Suporte técnico em horário comercial + emergencial 24/7

## Condições de Falha
- Incompatibilidade entre sistemas legados dos stakeholders
- Resistência à adoção por parte de operadores menores
- Falha de integração com TOS do terminal
- Atualização de mensagens EDI causa rupture no fluxo

## Regras de Escalação
- Falha do sistema por >4 horas → Alerta ao comitê de gestão
- Incompatibilidade com novo regulamento → Articulação com ANTAQ
- Necessidade de atualização de infraestrutura → Comitê de investimentos

## Segurança/Compliance
- Dados de carga e embarcações protegidos conforme LGPD
- Acesso por perfis de usuário (RBAC)
- Logs de acesso e transações mantidos por 5 anos
- Backup diário com recuperação em <4 horas
