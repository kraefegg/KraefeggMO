# MARKET RESEARCH

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Conduct systematic market analysis to identify market size, trends, dynamics, customer needs, competitive landscape, and growth opportunities. Provides data-driven foundation for business strategy, product development, and investment decisions.

## Scope
Covers market sizing (TAM/SAM/SOM), trend analysis, customer segmentation, demand assessment, pricing analysis, market entry evaluation, and industry dynamics. Focus on port/maritime, energy, technology, and infrastructure sectors relevant to KRAEFEGG.

## When to Use
- Evaluating a new market opportunity or entry strategy
- Building or updating market sizing models
- Assessing demand for new products or services
- Preparing investor materials or business cases
- Monitoring industry trends and market shifts
- Supporting strategic planning with market intelligence

## When NOT to Use
- For internal operational metrics (use data analysis skill)
- When proprietary market data requires paid subscriptions beyond reach
- For purely technical feasibility (use project analysis)
- When the "market" is a single known client (use relationship analysis)

## Required Inputs
- Market definition (geography, segment, product/service category)
- Analysis objective (sizing, trends, competition, opportunity)
- Timeframe (current state, forecast horizon)
- Target audience for findings

## Optional Inputs
- Prior market research to build upon
- Available proprietary data sources
- Competitor names for focused analysis
- Customer segments already defined
- Budget for primary research

## Procedure
1. **Define** market boundaries: geography, product/service scope, customer segments
2. **Classify** market type: B2B/B2C, domestic/international, regulated/free
3. **Research** market size using top-down and bottom-up approaches:
   - Top-down: total addressable market → serviceable → obtainable
   - Bottom-up: unit economics × estimated addressable volume
4. **Analyze** market trends: growth rate, drivers, barriers, seasonality
5. **Map** competitive landscape: key players, market shares, positioning
6. **Assess** customer needs: segments, pain points, willingness to pay
7. **Evaluate** regulatory and macroeconomic factors affecting the market
8. **Build** market model with assumptions clearly stated
9. **Validate** findings against multiple data sources
10. **Synthesize** into actionable market intelligence

## Reasoning Requirements
- Triangulate market size from multiple sources (no single-source dependency)
- Distinguish between TAM (theoretical maximum), SAM (reachable), SOM (realistic)
- Recognize when data is extrapolated vs. directly measured
- Account for currency, purchasing power, and inflation in market sizing
- Apply appropriate growth models (linear, exponential, S-curve) based on market maturity
- Consider substitution effects and emerging alternatives

## Market Sizing Framework
| Metric | Definition | Method |
|--------|-----------|--------|
| TAM | Total Addressable Market | Top-down from industry reports |
| SAM | Serviceable Addressable Market | TAM filtered by geography/capability |
| SOM | Serviceable Obtainable Market | SAM filtered by competition/capacity |
| CAGR | Compound Annual Growth Rate | Historical trend extrapolation |
| Market Share | Revenue / Total Market Revenue | Competitive benchmarking |

## Tools
- `websearch` — market data, industry reports, company filings
- `webfetch` — retrieve detailed data from specific sources
- `read` — examine local market data and reference documents
- `bash` — run analysis scripts for market modeling
- `write` — save market research deliverables

## Verification
- Market size figures cross-referenced across 2+ independent sources
- Growth rates are consistent with industry consensus
- Competitor data matches public filings or verified reports
- Assumptions are explicitly stated and reasonable
- Conclusions follow logically from the data presented

## Output Format
```
## Market Research: [Market Name]
### Executive Summary
[Key findings in 3-5 sentences]

### Market Definition
- **Geography**: [Scope]
- **Segment**: [Product/service category]
- **Customers**: [Target segments]

### Market Size & Growth
| Metric | Value | Source | Year |
|--------|-------|--------|------|
| TAM | $X | [Source] | [Year] |
| SAM | $X | [Source] | [Year] |
| SOM | $X | [Estimated] | [Year] |
| CAGR | X% | [Source] | [Period] |

### Key Trends
1. [Trend] — Impact: [Positive/Negative] — Confidence: [H/M/L]

### Competitive Landscape
[Key players, positioning, market concentration]

### Customer Insights
[Segments, needs, buying behavior]

### Barriers & Risks
[Market entry barriers, regulatory risks, economic risks]

### Opportunities
[Identified gaps, underserved segments, emerging needs]

### Assumptions & Limitations
[Key assumptions, data gaps, confidence levels]
```

## Quality Criteria
- Market size has triangulation from at least 2 independent sources
- All assumptions are explicit and reasonable
- Competitive analysis covers top 5-10 players or 80%+ market share
- Growth projections include methodology and confidence level
- Recommendations are tied to specific market findings
- Data recency is within 18 months for fast-moving markets

## Failure Conditions
- Market is too nascent for reliable sizing (insufficient data points)
- All sources are from a single vendor with obvious bias
- Regulatory environment makes market projections unreliable
- Data conflicts cannot be resolved and affect conclusions materially

## Escalation Rules
- Escalate to **CEO** for market intelligence affecting strategic decisions
- Escalate to **Market-Segment** agent for deep domain-specific market analysis
- Escalate to **CTO** for technology market analysis requiring technical assessment
- Escalate if market research reveals unexpected competitive threat

## Security / Compliance
- Use publicly available data as primary sources
- Respect data licensing — do not redistribute paid reports
- Disclose source limitations and data age
- Do not present estimated figures as measured data
- LGPD: handle customer data in market research with appropriate anonymization
- Document methodology for reproducibility and audit
