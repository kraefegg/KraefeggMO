# RISK ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Identify, assess, prioritize, and recommend mitigation strategies for risks across all KRAEFEGG operations. Provides structured risk management framework covering strategic, operational, financial, regulatory, technical, and environmental risks.

## Scope
Covers all risk domains: strategic (market, competitive), operational (process, people), financial (cost, revenue, currency), regulatory (compliance, legal), technical (technology, security), environmental (climate, ESG), and reputational. Applies to projects, operations, investments, and market activities.

## When to Use
- Before starting a new project or entering a new market
- During project planning and execution reviews
- When assessing vendor or partner relationships
- Before major financial commitments or investments
- During compliance audits and regulatory assessments
- After incidents or near-misses (root cause risk analysis)
- For periodic enterprise risk reviews

## When NOT to Use
- For trivial decisions with negligible downside
- When a risk assessment already exists and conditions haven't changed
- For creative ideation without a decision context
- When the analysis would be purely theoretical with no actionable output

## Required Inputs
- Context: what activity, project, or decision faces risk
- Risk domain focus (or all domains if comprehensive)
- Risk appetite/tolerance level (conservative, moderate, aggressive)
- Stakeholders affected by identified risks

## Optional Inputs
- Historical incident data
- Industry risk benchmarks
- Regulatory requirements for risk documentation
- Financial thresholds for risk escalation
- Timeline and critical path for the activity

## Procedure
1. **Establish** context: objectives, scope, criteria, and risk appetite
2. **Identify** risks using structured methods:
   - Brainstorming (by category)
   - Checklists (industry-standard risk taxonomies)
   - Historical analysis (past incidents, lessons learned)
   - Assumption analysis (what if key assumptions fail?)
   - SWOT-derived risks (weaknesses and threats)
3. **Analyze** each risk:
   - Likelihood: probability of occurrence (1-5 scale or qualitative)
   - Impact: severity if it occurs (1-5 scale across dimensions: cost, schedule, quality, safety)
   - Velocity: how quickly impact materializes after trigger
4. **Evaluate** risk priority: combine likelihood × impact into risk score
5. **Classify** risk level: CRITICAL (>15), HIGH (10-15), MEDIUM (5-9), LOW (1-4)
6. **Develop** mitigation strategies for HIGH and CRITICAL risks:
   - Avoid: eliminate the risk source
   - Mitigate: reduce likelihood or impact
   - Transfer: share risk (insurance, contracts)
   - Accept: acknowledge and monitor (for LOW/MEDIUM)
7. **Assign** risk owners and monitoring triggers
8. **Document** the risk register with full traceability
9. **Review** and update periodically

## Risk Matrix
| | Impact 1 (Negligible) | Impact 2 (Minor) | Impact 3 (Moderate) | Impact 4 (Major) | Impact 5 (Severe) |
|---|---|---|---|---|---|
| **Likelihood 5 (Almost Certain)** | 5 MEDIUM | 10 HIGH | 15 HIGH | 20 CRITICAL | 25 CRITICAL |
| **Likelihood 4 (Likely)** | 4 LOW | 8 MEDIUM | 12 HIGH | 16 CRITICAL | 20 CRITICAL |
| **Likelihood 3 (Possible)** | 3 LOW | 6 MEDIUM | 9 MEDIUM | 12 HIGH | 15 HIGH |
| **Likelihood 2 (Unlikely)** | 2 LOW | 4 LOW | 6 MEDIUM | 8 MEDIUM | 10 HIGH |
| **Likelihood 1 (Rare)** | 1 LOW | 2 LOW | 3 LOW | 4 LOW | 5 MEDIUM |

## Reasoning Requirements
- Separate root causes from symptoms
- Consider cascading risks (one risk triggering others)
- Distinguish between known risks and unknown unknowns (reserves)
- Apply base rates — don't over-weight dramatic but rare scenarios
- Account for correlation between risks (portfolio effect)
- Consider both upside and downside of risk tolerance decisions

## Tools
- `websearch` — industry risk data, incident reports, risk benchmarks
- `read` — examine project documents, incident reports, historical data
- `write` — create risk registers and assessment reports
- `grep` — search for prior risk assessments in local knowledge base

## Verification
- Risk identification covers all relevant categories (no blind spots)
- Likelihood and impact ratings are calibrated to evidence, not optimism
- Mitigation strategies are feasible with available resources
- Risk register is traceable to specific sources and assumptions
- High/Critical risks have assigned owners and monitoring triggers

## Output Format
```
## Risk Assessment: [Context]
### Risk Register
| # | Risk | Category | Likelihood | Impact | Score | Level | Mitigation | Owner | Status |
|---|------|----------|-----------|--------|-------|-------|-----------|-------|--------|

### Risk Heatmap Summary
- CRITICAL: [N] risks
- HIGH: [N] risks
- MEDIUM: [N] risks
- LOW: [N] risks

### Top 3 Risks (Detail)
1. **[Risk Name]**
   - Description: [Detailed description]
   - Root Cause: [Why this risk exists]
   - Trigger: [What indicates this risk is materializing]
   - Mitigation: [Specific actions]
   - Contingency: [Plan if risk materializes]
   - Cost of Mitigation: [Estimated]

### Monitoring Plan
| Risk | Trigger Indicator | Review Frequency | Escalation Threshold |
|------|-------------------|-----------------|---------------------|
```

## Quality Criteria
- All HIGH and CRITICAL risks have specific mitigation strategies
- Risk ratings are justified, not arbitrary
- Risk owners are specific individuals/roles, not vague teams
- Monitoring plan is actionable with clear triggers
- Risk register is complete and traceable
- Assessment is honest (no downplaying for comfort)

## Failure Conditions
- Risk context is too vague for meaningful assessment
- Critical risk identified but no feasible mitigation exists
- Assessment requires domain expertise not available
- Risk data is unreliable or insufficient

## Escalation Rules
- Escalate CRITICAL risks to **CEO** immediately with recommended actions
- Escalate technical risks to **CTO** for assessment and mitigation planning
- Escalate regulatory risks to legal/compliance for formal opinion
- Escalate to **Market-Segment** for market-related risk requiring industry data
- Never sit on a CRITICAL risk — escalate within the same session

## Security / Compliance
- Risk assessments may contain sensitive business intelligence — classify appropriately
- Never share risk registers externally without authorization
- Document risk management process for audit trail
- Comply with industry-specific risk reporting requirements (ANTAQ, ANP)
- Environmental risks must consider ESG reporting requirements
- Financial risks must consider fiscal and tax compliance implications
