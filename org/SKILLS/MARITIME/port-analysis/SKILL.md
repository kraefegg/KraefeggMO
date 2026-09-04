# SKILL: Análise e Avaliação de Infraestrutura Portuária

## Versão
1.0.0 | Autor: Maritime Department

## Propósito
Avaliar infraestrutura portuária: capacidade operacional, eficiência, gargalos e oportunidades de melhoria, subsidiando decisões de investimento e planejamento portuário.

## Escopo
- Auditoria de infraestrutura: berços, guindastes, armazéns, vias de acesso
- Cálculo de capacidade e eficiência portuária (TEU, toneladas,navios/mês)
- Identificação de gargalos operacionais e gargalos
- Análise comparativa de portos e benchmarking

## Quando Usar
- Planejamento de expansão portuária
- Auditoria de eficiência operacional
- Subsídio a investimentos em infraestrutura
- Comparação de portos para localização de novo terminal

## Quando NÃO Usar
- Operações portuárias específicas (usar port-community-system)
- Rastreamento de embarcações (usar maritime-intelligence)
- Conformidade documental (usar maritime-single-window)

## Entradas Necessárias
- Planta do porto com layout de berços e equipamentos
- Dados operacionais: movimentações, tempos de atracação, queue
- Especificações técnicas dos equipamentos de movimentação
- Dados de acceso: profundidade, maré, vento

## Procedimento
1. Levantar infraestrutura existente: berços, calado, equipamentos
2. Medir capacidade: berço-mês, tonelada-mês, TEU-mês
3. Analisar eficiência: produtividade por guindaste, tempo de ciclo
4. Identificar gargalos: fila de embarcações, capacidade de armazenagem
5. Comparar com benchmarks: portos similares (dados ANTAQ)
6. Modelar cenários de expansão (capacidade × investimento)
7. Elaborar relatório com recomendações e plano de investimento
8. Apresentar resultados à diretoria portuária

## Ferramentas
- Software de simulação discreta (Arena, Simio) para fluxo portuário
- QGIS para mapeamento e cálculo de áreas
- Excel/Python para análise estatística de movimentações
- Dados ANTAQ para benchmarks de eficiência

## Requisitos de Fonte
- Dados ANTAQ de movimentação portuária anual
- Manuais técnicos dos equipamentos (STS, RTG, RMG)
- Regulamentação portuária (Lei 12.815/2013, decreto regulamentar)
- Normas de segurança portuária (NR-34, ISPS)

## Verificação
- Capacidade calculada em linha com dados de movimentação reais
- Benchmarking com portos de mesma categoria e região
- Análise de gargalos validada por operadores do porto
- Investimentos estimados com acurácia ±30% (estimativa preliminar)

## Formato de Saída
Relatório de análise portuária: infraestrutura, capacidade, eficiência, gargalos, benchmarking, cenários de expansão, plano de investimento.

## Critérios de Qualidade
- Dados de movimentação verificados com fonte primária (ANTAQ)
- Benchmarking com portos similares (mesmo bioma, mesma commodity)
- Análise de cenários com pelo menos 3 opções
- Recomendações específicas e mensuráveis

## Condições de Falha
- Dados operacionais incompletos ou indisponíveis
- Restrições ambientais significativas para expansão
- Concorrência de portos vizinhos compromete viabilidade
- Dados de acesso indisponíveis ou desatualizados

## Regras de Escalação
- Gargalo crítico identificado → Notificação à diretoria operacional
- Necessidade de investimento >R$50M → Comitê de investimentos
- Restrição ambiental para expansão → Licenciamento ambiental

## Segurança/Compliance
- Dados operacionais do porto classificados como confidenciais
- Conformidade com NR-34 (segurança em operações portuárias)
- Análise independente sem conflito de interesse com operadores
- Documentação completa para eventual due diligence
