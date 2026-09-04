# SKILL: Janela Única Marítima (Maritime Single Window)

## Versão
1.0.0 | Autor: Maritime Department

## Propósito
Gerenciar documentação de port call em conformidade com a Janela Única Marítima (SISMAR/SEAG), integrando processos alfandegários, sanitários, de imigração e de segurança para entrada e saída de portos brasileiros.

## Escopo
- Preenchimento e envio da Declaração de Entrada/Saída (DAS)
- Coordenação com: Receita Federal, ANVISA, Polícia Federal, Capitanias
- Gestão de documentos: prancha, manifesto, certificados,manifest
- Conformidade com regulamentação OMC (Recomendação 33) e ANTAQ

## Quando Usar
- Chegada e partida de embarcação em porto brasileiro
- Processo de despacho aduaneiro de carga
- Articulação com autoridades portuárias e alfandegárias
- Resolução de pendências documentais durante port call

## Quando NÃO Usar
- Gerenciamento de containeres (usar port-community-system)
- Rastreamento de embarcações (usar maritime-intelligence)
- Análise de capacidade portuária (usar port-analysis)

## Entradas Necessárias
- Dados da embarcação: nome, IMO, bandeira, agente de visita
- Manifesto de carga e documento de embarque
- Dados da tripulação e passageiros
- Informações de saúde pública (quebra dequarentena)

## Procedimento
1. Receber notificação de chegada do agente marítimo
2. Preencher DAS (SISMAR) com dados da embarcação e carga
3. Enviar documentos às autoridades: Receita, ANVISA, PF, Capitanias
4. Aprovação de cada autoridade (checklist de conformidade)
5. Coordenar operações de atracação e início de descarga
6. Gerenciar despacho aduaneiro da carga
7. Preencher documentos de saída e obter despacho final
8. Confirmar partida e encerrar port call no sistema

## Ferramentas
- SISMAR (Sistema Integrado de Segurança Marítima) — portal ANTAQ
- Portal Único de Comércio Exterior (Siscomex) para despacho
- SEAG (Sistema Eletrônico de Acesso à Guarita) para controle de acesso
- WhatsApp/telegram para comunicação com autoridades

## Requisitos de Fonte
- IN RFB 1.804/2018 (procedimentos aduaneiros marítimos)
- Lei 9.537/1997 (segurança do tráfego aquaviário)
- Portarias da ANTAQ para janela única
- Convenções OMC e IMO para documentação marítima

## Verificação
- Dados da DAS consistentes com manifesto de carga
- Aprovação de todas as autoridades antes da operação
- Tempos de permanência otimizados (benchmark: <72h carga geral)
- Documentação completa e arquivada conforme prazo legal

## Formato de Saída
Checklist de port call: DAS, aprovações, despacho aduaneiro, tempo de permanência, pendências, resoluções.

## Critérios de Qualidade
- DAS preenchido com 100% de dados corretos
- Tempo médio de despacho: <24h para carga containerizada
- Nenhuma pendência aduaneira na saída da embarcação
- Comunicação eficiente com todas as autoridades

## Condições de Falha
- Dados inconsistentes entre manifesto e DAS
- Retenção de carga por pendência documental
- Atraso na aprovação de autoridade sanitária (ANVISA)
- Ausência de documentos obrigatórios a bordo

## Regras de Escalação
- Retenção de embarcação pela autoridade → Assessoria jurídica
- Multa por atraso na DAS → Articulação com ANTAQ
- Conflito entre autoridades alfandegárias → Coordenação via SISCOMEX

## Segurança/Compliance
- Dados de carga protegidos conforme legislação aduaneira
- Acesso restrito a informações de segurança (ISPS)
- Conformidade com Lei Geral de Aduanas (Lei 13.709/2018 — LGPD)
- Arquivamento de documentos conforme prazo legal (5 anos mínimo)
