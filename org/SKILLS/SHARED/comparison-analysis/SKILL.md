# COMPARISON ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Systematically compare multiple options, alternatives, products, vendors, strategies, or approaches using consistent criteria and transparent methodology. Produces objective, structured comparisons that support informed decision-making.

## Scope
Covers comparison of: technology alternatives, vendor solutions, market strategies, organizational structures, project approaches, regulatory options, geographic locations, partnership models, and any decision requiring evaluation of 2+ alternatives.

## When to Use
- Selecting between technology options or platforms
- Evaluating vendor proposals or bids
- Choosing between strategic approaches
- Comparing project methodology options
- Assessing geographic expansion alternatives
- When a decision requires structured evaluation of alternatives

## When NOT to Use
- When only one option exists (no comparison needed)
- For binary yes/no decisions (use critical analysis instead)
- When the choice is obvious and doesn't require structured analysis
- When comparison would delay an urgent decision beyond usefulness

## Required Inputs
- Options to compare (minimum 2, typically 3-5)
- Comparison criteria (what dimensions matter)
- Decision context (what's the decision, who decides, what's the timeline)

## Optional Inputs
- Weighting for criteria (which are more important)
- Threshold values (minimum acceptable for each criterion)
- Available data for each option
- Stakeholder preferences
- Risk tolerance

## Procedure
1. **Define** the decision: what choice needs to be made and why
2. **Identify** all viable options (avoid premature elimination)
3. **Establish** comparison criteria based on decision requirements:
   - Functional criteria: what the option must do
   - Non-functional criteria: performance, reliability, scalability
   - Financial criteria: cost, ROI, TCO, payback
   - Risk criteria: implementation risk, vendor risk, technology risk
   - Strategic criteria: alignment, flexibility, future-proofing
4. **Assign** weights to criteria (reflecting decision priorities)
5. **Evaluate** each option against each criterion:
   - Use consistent scoring scale (1-5 or 1-10)
   - Document evidence and reasoning for each score
   - Flag where data is insufficient (confidence level)
6. **Calculate** weighted scores for each option
7. **Perform** sensitivity analysis: what if weights change?
8. **Identify** deal-breakers (any criterion where an option fails completely)
9. **Synthesize** recommendation with clear rationale
10. **Document** the comparison with full transparency

## Comparison Framework
| Criterion | Weight | Option A | Option B | Option C |
|-----------|--------|----------|----------|----------|
| [Criterion 1] | X% | Score (evidence) | Score (evidence) | Score (evidence) |
| [Criterion 2] | Y% | Score (evidence) | Score (evidence) | Score (evidence) |
| **Weighted Total** | | **X.X** | **X.X** | **X.X** |

## Reasoning Requirements
- Ensure criteria are exhaustive (no important dimension omitted)
- Maintain scoring consistency (same standard across all options)
- Avoid confirmation bias (don't skew scores to preferred option)
- Consider qualitative factors that resist quantification
- Apply "what matters most" filtering — avoid criterion overload
- Distinguish between "nice to have" and "must have"
- Perform Devil's Advocate: argue for the non-preferred option

## Criteria Design Principles
- **MECE**: Mutually Exclusive, Collectively Exhaustive
- **Measurable**: Each criterion must be scorable with evidence
- **Relevant**: Each criterion must matter for this specific decision
- **Independent**: Minimize correlation between criteria
- **Balanced**: Mix of functional, financial, risk, and strategic criteria

## Tools
- `websearch` — research options, features, pricing, reviews
- `webfetch` — retrieve detailed specifications or documentation
- `read` — examine vendor proposals, technical documentation
- `write` — create comparison analysis deliverables
- `bash` — run scoring calculations

## Verification
- All options evaluated against all criteria (no gaps)
- Scoring is consistent and evidence-based
- Weighted totals reflect the evidence (highest score = strongest option)
- Sensitivity analysis confirms robustness of recommendation
- Deal-breakers are identified and applied consistently

## Output Format
```
## Comparison Analysis: [Decision Context]
### Options Compared
1. [Option A] — [Brief description]
2. [Option B] — [Brief description]
3. [Option C] — [Brief description]

### Criteria & Weights
| # | Criterion | Weight | Rationale for Weight |
|---|----------|--------|---------------------|

### Scoring Matrix
[Table with scores, evidence, and confidence]

### Weighted Results
| Rank | Option | Weighted Score | Key Strengths | Key Weaknesses |
|------|--------|---------------|---------------|----------------|

### Sensitivity Analysis
[How the ranking changes with different weight assumptions]

### Deal-Breakers
[CAny criterion that eliminates an option regardless of overall score]

### Recommendation
- **Recommended**: [Option] — [Primary reason]
- **Runner-Up**: [Option] — [When to reconsider]
- **Not Recommended**: [Option] — [Why]
- **Confidence**: HIGH / MEDIUM / LOW
```

## Quality Criteria
- Criteria are MECE and relevant to the specific decision
- All options scored against all criteria with evidence
- Scoring is consistent and transparent
- Recommendation matches the weighted scores (no surprise conclusion)
- Sensitivity analysis demonstrates robustness
- Limitations and data gaps are explicitly disclosed

## Failure Conditions
- Insufficient data to score options meaningfully
- Options are too dissimilar for fair comparison
- Critical criteria cannot be evaluated due to information asymmetry
- Analysis reveals all options are below acceptable threshold

## Escalation Rules
- Escalate to **CEO** for strategic decisions (market, partnership, investment)
- Escalate to **CTO** for technology selection decisions
- Escalate to **Market-Segment** for market-related comparisons requiring industry data
- Escalate if comparison reveals all options are unacceptable (need new alternatives)

## Security / Compliance
- Treat vendor proposals and pricing as confidential
- Do not share comparison details with competing vendors
- Respect NDAs when comparing options that involve confidential information
- Document comparison methodology for audit trail
- Ensure financial comparisons account for tax and regulatory implications
- LGPD: handle customer data comparisons with appropriate anonymization
