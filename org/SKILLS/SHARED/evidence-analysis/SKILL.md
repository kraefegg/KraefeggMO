# EVIDENCE ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Evaluate the quality, relevance, sufficiency, and credibility of evidence supporting claims, conclusions, or recommendations. Ensures that decisions and deliverables are built on a solid evidentiary foundation, not on assumptions or weak support.

## Scope
Covers assessment of evidence quality in any context: market claims supported by data, regulatory interpretations backed by legal text, technical assertions based on testing, financial projections backed by assumptions, and strategic recommendations based on analysis.

## When to Use
- Before finalizing any recommendation or conclusion
- When evaluating the strength of an argument or proposal
- During quality control of analysis-heavy deliverables
- When sources conflict and evidence quality must arbitrate
- When building a case for or against a specific course of action
- Before presenting findings to leadership

## When NOT to Use
- For simple factual lookups (use fact-checking instead)
- When evidence quality is already established and accepted
- For creative work without analytical claims
- When the stakes are too low to warrant formal evidence analysis

## Required Inputs
- The claim or conclusion being supported
- The evidence presented (sources, data, reasoning)
- The standard of evidence required (preponderance, clear, beyond reasonable doubt, or practical threshold)

## Optional Inputs
- Alternative evidence or counter-evidence
- Stakeholder risk tolerance
- Domain-specific evidence standards
- Timeline constraints on evidence gathering

## Procedure
1. **Identify** the claim that evidence is supposed to support
2. **Catalog** all evidence presented (sources, data points, reasoning chains)
3. **Evaluate** each piece of evidence on quality dimensions:
   - **Reliability**: Is the source trustworthy? (apply source-verification skill)
   - **Relevance**: Does this evidence actually support the claim?
   - **Sufficiency**: Is there enough evidence to support the conclusion?
   - **Recency**: Is the evidence current enough to be valid?
   - **Bias**: Does the evidence source have a conflict of interest?
4. **Assess** evidence type hierarchy:
   - Direct evidence (firsthand observation, primary data)
   - Circumstantial evidence (indirect support, patterns)
   - Hearsay (secondhand, unverified)
   - Expert opinion (credible if domain-appropriate)
5. **Identify** evidence gaps: what evidence is missing that should be present?
6. **Weigh** the evidence: does the total evidence support, partially support, or refute the claim?
7. **Assign** confidence level based on evidence quality and quantity
8. **Document** the evidence assessment with reasoning

## Evidence Quality Framework
| Quality Level | Description | Examples |
|--------------|-------------|----------|
| STRONG | Primary source, direct measurement, peer-reviewed | Official statistics, clinical trials |
| MODERATE | Reputable secondary source, multiple corroboration | Industry reports, expert surveys |
| WEAK | Single source, indirect, potential bias | Blog post, vendor claim, unverified anecdote |
| INSUFFICIENT | Too little evidence, or evidence doesn't address the claim | Cherry-picked data, missing context |
| CONTRADICTORY | Evidence actively refutes the claim | Peer-reviewed studies with opposite findings |

## Reasoning Requirements
- Apply the "burden of proof" principle: stronger claims need stronger evidence
- Distinguish between absence of evidence and evidence of absence
- Consider the base rate before interpreting evidence
- Recognize that quantity of evidence does not equal quality
- Apply the "minimum viable evidence" standard: what's the least evidence needed?
- Consider whether evidence would change under different conditions

## Tools
- `websearch` — find additional evidence or contradicting sources
- `webfetch` — retrieve primary evidence documents
- `read` — examine evidence documents and data
- `grep` — search for corroborating or contradicting evidence locally
- `write` — document evidence assessment

## Verification
- Evidence assessment is traceable to specific sources
- Quality ratings are justified, not assumed
- Gaps are identified, not ignored
- Confidence level matches evidence quality
- Assessment distinguishes between evidence types (primary vs. secondary)

## Output Format
```
## Evidence Assessment: [Claim Being Supported]
### Claim
[Exact statement being evaluated]

### Evidence Inventory
| # | Evidence | Source | Type | Quality | Relevance | Notes |
|---|---------|--------|------|---------|-----------|-------|

### Evidence Summary
- **Total Pieces**: [N]
- **Strong**: [N] | **Moderate**: [N] | **Weak**: [N] | **Insufficient**: [N]
- **Contradicting**: [N]

### Assessment
- **Sufficiency**: SUFFICIENT / PARTIALLY SUFFICIENT / INSUFFICIENT
- **Weight**: Supports / Partially Supports / Does Not Support / Refutes
- **Confidence**: HIGH / MEDIUM / LOW

### Evidence Gaps
- [What additional evidence would strengthen or weaken the claim]

### Recommendation
[Use the claim as-is / Strengthen with additional evidence / Revise claim / Reject claim]
```

## Quality Criteria
- Every piece of evidence has a quality rating with justification
- Evidence gaps are explicitly identified
- Confidence level is calibrated to actual evidence quality
- Assessment distinguishes between types of evidence
- The claim's wording is appropriate for the evidence strength
- No weak evidence is presented as strong or vice versa

## Failure Conditions
- All evidence is weak or insufficient quality
- Evidence contradicts the claim and cannot be reconciled
- Evidence assessment requires domain expertise not available
- Evidence sources are all from a single biased origin

## Escalation Rules
- Escalate to **CTO** for technical evidence requiring domain validation
- Escalate to **CEO** if weak evidence supports a major strategic decision
- Escalate to **Market-Segment** for market evidence requiring proprietary data
- Escalate immediately if evidence assessment reveals potential fraud or misrepresentation

## Security / Compliance
- Evidence assessment must be objective and not influenced by stakeholder pressure
- Do not suppress evidence that contradicts preferred conclusions
- Maintain evidence trail for audit and accountability
- Respect confidentiality of evidence sources when required
- LGPD: handle evidence containing personal data appropriately
- Never fabricate or misrepresent evidence
