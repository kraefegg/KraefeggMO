# STRATEGIC ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Apply established strategic analysis frameworks (SWOT, Porter's Five Forces, PESTEL, Value Chain, Scenario Planning) to evaluate business positions, industry dynamics, and strategic options. Provides structured foundation for strategic decision-making.

## Scope
Covers strategy-level analysis for KRAEFEGG as a whole, individual business units, market entry decisions, partnership evaluations, and competitive positioning. Frameworks applied include SWOT, PESTEL, Porter's Five Forces, Value Chain, BCG Matrix, Ansoff Matrix, Scenario Planning, and Balanced Scorecard.

## When to Use
- Annual or quarterly strategic planning cycles
- Before major strategic decisions (entry, exit, investment, partnership)
- When market conditions change materially
- After mergers, acquisitions, or significant organizational changes
- When competitive dynamics shift
- For investor presentations requiring strategic narrative
- When current strategy is underperforming

## When NOT to Use
- For operational decisions (use risk analysis or project analysis)
- For day-to-day management without strategic implications
- When the situation requires immediate tactical response
- When insufficient data exists for meaningful framework application

## Required Inputs
- Strategic question or decision to inform
- Entity scope (KRAEFEGG overall, BU, product line, market)
- Timeframe (1-year, 3-year, 5-year horizon)
- Available data and prior analysis

## Optional Inputs
- Industry and competitive data
- Financial performance data
- Stakeholder expectations and constraints
- Regulatory environment specifics
- Technology trends

## Frameworks & When to Use

### SWOT Analysis
**When**: Initial positioning assessment, before planning
**Structure**: Internal Strengths/Weaknesses + External Opportunities/Threats
**Key**: Be brutally honest; each item must be specific and evidence-based

### PESTEL Analysis
**When**: Market entry, geographic expansion, regulatory assessment
**Structure**: Political, Economic, Social, Technological, Environmental, Legal factors
**Key**: Focus on factors that materially affect the specific decision

### Porter's Five Forces
**When**: Industry attractiveness assessment, competitive positioning
**Structure**: Supplier power, Buyer power, Competitive rivalry, Threat of substitution, Threat of new entry
**Key**: Quantify where possible (market concentration, switching costs)

### Value Chain Analysis
**When**: Cost advantage identification, capability assessment
**Structure**: Primary activities + Support activities, mapped to value creation
**Key**: Identify where KRAEFEGG creates differentiated value

### Ansoff Matrix
**When**: Growth strategy selection
**Structure**: Market penetration, Market development, Product development, Diversification
**Key**: Match risk appetite to growth quadrant

### Scenario Planning
**When**: High uncertainty, long time horizons
**Structure**: 2-4 plausible future scenarios with strategy per scenario
**Key**: Identify robust strategies that work across multiple scenarios

## Procedure
1. **Select** appropriate framework(s) based on the strategic question
2. **Gather** relevant data: internal performance, market data, competitive intelligence, macro trends
3. **Apply** framework systematically — fill every cell/element, don't skip inconvenient items
4. **Cross-reference** framework outputs (SWOT insights inform strategy selection, etc.)
5. **Generate** strategic options based on analysis
6. **Evaluate** options against criteria: feasibility, attractiveness, risk, alignment
7. **Recommend** primary strategy with rationale and contingencies
8. **Validate** against common strategic pitfalls (groupthink, anchoring, status quo bias)
9. **Document** with clear traceability from analysis to recommendation

## Reasoning Requirements
- Challenge assumptions — every SWOT item should pass the "so what?" test
- Distinguish between observations and strategic implications
- Consider dynamic effects (how will this change over time?)
- Apply systems thinking — strategies have feedback loops and second-order effects
- Avoid analysis paralysis — imperfect analysis applied beats perfect analysis delayed
- Stress-test strategy against adversarial scenarios

## Tools
- `websearch` — market data, competitive intelligence, macro trends
- `webfetch` — industry reports, competitor analysis, regulatory landscape
- `read` — internal strategy documents, performance data, prior analyses
- `write` — create strategic analysis deliverables
- `bash` — run scenario modeling if computational tools available

## Verification
- Every SWOT item is supported by evidence or data
- PESTEL factors are specific to the entity and decision (not generic)
- Porter's Five Forces uses market-specific data where available
- Strategic options are genuinely distinct (not cosmetic variations)
- Analysis passes the "hostile board member" test (would it survive challenge?)

## Output Format
```
## Strategic Analysis: [Topic]
### Framework Applied: [SWOT / PESTEL / Five Forces / etc.]

### Analysis
[Framework-specific structured output]

### Strategic Options
| Option | Description | Feasibility | Attractiveness | Risk | Alignment | Score |
|--------|------------|-------------|---------------|------|-----------|-------|

### Recommended Strategy
- **Primary**: [Strategy with rationale]
- **Contingency**: [If primary strategy conditions change]
- **Key Success Factors**: [What must go right]
- **Critical Assumptions**: [What we're betting on]

### Implementation Considerations
- **Quick Wins**: [Actions in first 30 days]
- **Medium-term**: [Actions in 3-6 months]
- **Long-term**: [Strategic moves over 1-3 years]
```

## Quality Criteria
- Framework is applied completely (no skipped elements)
- Analysis is specific to the entity and context (not generic)
- Strategic options are genuinely distinct
- Recommendation includes rationale, not just assertion
- Assumptions and risks are explicitly stated
- Analysis would withstand challenge from a knowledgeable skeptic

## Failure Conditions
- Insufficient data to apply framework meaningfully
- Strategic question is too vague for framework selection
- Analysis reveals that no viable strategic option exists
- Framework outputs are contradictory with no resolution path

## Escalation Rules
- ALL strategic analysis outputs escalate to **CEO** for review and approval
- Technical strategy components escalate to **CTO**
- Market strategy components escalate to **Market-Segment**
- Financial strategy components may require CFO-level review
- Never implement strategy without executive sign-off

## Security / Compliance
- Strategic analysis may contain highly sensitive business intelligence — classify CONFIDENTIAL
- Do not share strategic analysis externally without executive authorization
- Competitive intelligence used in analysis must comply with ethical boundaries
- Respect NDA obligations when analyzing partnership/joint venture options
- Document strategic decisions for governance and audit trail
- LGPD: handle any customer/market personal data appropriately
