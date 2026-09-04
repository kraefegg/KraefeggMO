# OPPORTUNITY DETECTION

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Systematically identify, evaluate, and qualify business opportunities from market signals, regulatory changes, technology trends, competitive gaps, and operational data. Transforms observations into actionable opportunities with preliminary business cases.

## Scope
Covers opportunity identification across: new markets, new services/products, process improvements, cost reductions, partnerships, technology adoption, regulatory advantages, and geographic expansion. Focus on sectors relevant to KRAEFEGG: port/maritime, energy, technology, infrastructure, consulting.

## When to Use
- Proactively scanning for growth opportunities
- When market research reveals gaps or underserved segments
- After regulatory changes create new possibilities
- When competitive analysis reveals positioning gaps
- During strategic planning sessions for opportunity pipeline
- When operational data suggests efficiency gains
- After incident analysis reveals capability improvements

## When NOT to Use
- For mature opportunities already in the pipeline (use project analysis)
- When the user requests analysis of a specific known opportunity (use strategic analysis)
- For creative brainstorming without evaluation criteria
- When the organization is in crisis and cannot pursue new opportunities

## Required Inputs
- Market context or trigger event
- KRAEFEGG capabilities and constraints
- Strategic priorities and focus areas
- Timeframe for opportunity evaluation

## Optional Inputs
- Financial thresholds for opportunity qualification
- Resource availability for new initiatives
- Competitive landscape data
- Customer feedback or demand signals

## Procedure
1. **Scan** for opportunity signals:
   - Market gaps (underserved segments, unmet needs)
   - Regulatory changes (new requirements = new demand)
   - Technology shifts (new capabilities enable new solutions)
   - Competitive exits (market space opening up)
   - Operational inefficiencies (cost reduction potential)
   - Partner/customer pain points (service opportunities)
   - Geographic expansion signals (new regulations, infrastructure)
2. **Capture** each signal with evidence and source
3. **Screen** against strategic fit: does this align with KRAEFEGG's mission and capabilities?
4. **Qualify** with preliminary assessment:
   - Market size estimate (order of magnitude)
   - Competitive intensity in the space
   - Required capabilities (do we have them or can we acquire?)
   - Estimated investment required
   - Time to value
   - Regulatory feasibility
5. **Score** opportunities using a consistent framework
6. **Develop** preliminary business case for top-scoring opportunities
7. **Recommend** which opportunities to advance for detailed analysis
8. **Document** the opportunity pipeline with status tracking

## Opportunity Qualification Framework
| Dimension | Weight | Scoring (1-5) |
|-----------|--------|---------------|
| Strategic Fit | 25% | 1=Off-strategy, 5=Core to mission |
| Market Attractiveness | 20% | 1=Tiny/shrinking, 5=Large/growing |
| Competitive Advantage | 20% | 1=No differentiation, 5=Unique position |
| Feasibility | 15% | 1=Major gaps, 5=All capabilities present |
| Financial Potential | 15% | 1=Low ROI, 5=High ROI, fast payback |
| Risk Level | 5% | 1=High risk, 5=Low risk |

## Reasoning Requirements
- Distinguish between interesting observations and viable opportunities
- Apply opportunity cost thinking — pursuing one means not pursuing another
- Avoid opportunity bias (seeing opportunities everywhere due to optimism)
- Consider execution feasibility, not just attractiveness
- Think about timing — right opportunity at wrong time is still failure
- Apply pre-mortem: assume the opportunity failed, why?

## Tools
- `websearch` — market signals, regulatory changes, industry trends
- `webfetch` — detailed analysis of specific opportunity areas
- `read` — examine local business data, customer feedback, operational metrics
- `write` — document opportunity assessments and pipeline
- `grep` — find related prior analysis

## Verification
- Opportunity signal is supported by at least one external data point
- Strategic fit is assessed honestly (not forced to match priorities)
- Financial estimates are order-of-magnitude (not fabricated precision)
- Competitive landscape is accurately represented
- Feasibility assessment accounts for real resource constraints

## Output Format
```
## Opportunity Pipeline: [Context]
### Opportunity Summary
| # | Opportunity | Source | Strategic Fit | Market Size | Feasibility | Score | Status |
|---|-----------|--------|--------------|-------------|-------------|-------|--------|

### Detailed Assessment: [Top Opportunity]
- **Signal**: [What triggered identification]
- **Description**: [What the opportunity is]
- **Market Context**: [Size, trend, dynamics]
- **KRAEFEGG Fit**: [Why we can win here]
- **Competitive Landscape**: [Who else is here]
- **Required Investment**: [Resources, time, money]
- **Revenue/Cost Impact**: [Estimated financial impact]
- **Key Risks**: [What could go wrong]
- **Recommended Next Step**: [Specific action to advance]

### Pipeline Stages
- IDENTIFIED → QUALIFIED → BUSINESS CASE → APPROVED → EXECUTING → REALIZED
```

## Quality Criteria
- Every opportunity has a source/signal (not invented from thin air)
- Qualification scoring is consistent across all opportunities
- Strategic fit is honestly assessed
- Top opportunities have preliminary (not detailed) financial estimates
- Pipeline is prioritized and ranked
- Recommendations are specific and actionable

## Failure Conditions
- No viable opportunities identified (signal the gap honestly)
- Opportunities identified but resource constraints make none feasible
- Data is insufficient for even order-of-magnitude qualification
- Opportunity requires capabilities far outside KRAEFEGG's scope

## Escalation Rules
- Escalate top opportunities to **CEO** for strategic review and approval
- Escalate technology opportunities to **CTO** for technical feasibility
- Escalate market opportunities to **Market-Segment** for detailed market sizing
- Escalate if opportunity requires immediate resource commitment

## Security / Compliance
- Treat opportunity pipeline as confidential business intelligence
- Do not disclose opportunities to potential competitors
- Respect intellectual property when assessing technology opportunities
- Comply with competition law when evaluating market entry
- LGPD compliance when opportunities involve customer data
- Document opportunity sourcing for audit trail
