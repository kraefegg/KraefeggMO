# FACT-CHECKING

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Systematically verify the truthfulness of factual claims against authoritative sources. Distinguishes between verifiable facts, opinions, projections, and speculation. Prevents the propagation of incorrect information across all deliverables.

## Scope
Covers verification of quantitative claims (numbers, dates, statistics), qualitative claims (events, attributions, definitions), and causal claims (relationships between variables). Applies to all information entering KRAEFEGG deliverables.

## When to Use
- Before including any factual claim in a report, analysis, or recommendation
- When a user or agent questions the accuracy of previously stated information
- When data originates from unverified or informal sources
- During quality control of any deliverable containing external data
- When building data-driven dashboards or databases

## When NOT to Use
- For clearly labeled opinions, projections, or scenarios
- For internal data with established provenance (e.g., own sensor readings)
- When the claim is trivially verifiable by the end reader
- For labeled hypotheses or assumptions in strategic analysis

## Required Inputs
- The specific factual claim to verify (isolated from context)
- Source attribution (where the claim originated)
- Acceptable margin of error (if quantitative)

## Optional Inputs
- Time sensitivity (how quickly verification is needed)
- Authoritative sources to check against
- Consequences if the claim is incorrect (severity assessment)

## Procedure
1. **Isolate** the claim: Extract the specific, testable factual assertion
2. **Classify** claim type: quantitative, qualitative, causal, or definitional
3. **Identify** authoritative sources for this claim type (government data, primary studies, official records)
4. **Search** authoritative sources for corroborating or contradicting evidence
5. **Quantitative claims**: Recalculate if possible; verify units, time periods, and methodology
6. **Qualitative claims**: Verify against official records, press releases, or primary reporting
7. **Causal claims**: Check for confounding variables, sample size, peer review status
8. **Assess** evidence strength: strong corroboration, partial match, or contradiction
9. **Assign** verification status with confidence level
10. **Document** the entire verification chain

## Reasoning Requirements
- Distinguish between precision and accuracy (precise ≠ correct)
- Recognize common statistical fallacies: base rate neglect, survivorship bias, Simpson's paradox
- Account for reporting lag (official data often delayed by months)
- Consider whether the claim's precision is justified by available data
- Apply the "extraordinary claims require extraordinary evidence" principle

## Tools
- `websearch` — primary tool for locating authoritative data
- `webfetch` — retrieve specific statistical databases, official reports
- `read` — examine local reference documents
- Calculator/analysis tools for numerical verification

## Verification Levels
| Level | Criteria | Action |
|-------|----------|--------|
| CONFIRMED | Matched against 2+ authoritative sources | Green light for use |
| LIKELY TRUE | 1 authoritative source matches, no contradictions | Use with citation |
| UNRESOLVED | Insufficient authoritative sources found | Flag and disclose |
| LIKELY FALSE | Contradicted by authoritative source | Do not use; escalate |
| REFUTED | Multiple authoritative sources contradict | Do not use; escalate immediately |

## Verification
- Claim is isolated from surrounding context (no cherry-picking)
- At least one authoritative source checked for each key fact
- Quantitative claims verified against original data source (not secondary reports)
- Confidence level reflects evidence quality, not wishful thinking
- Verification is documented with source URLs and access dates

## Output Format
```
## Fact-Check Result
- **Claim**: [Exact claim as stated]
- **Type**: Quantitative / Qualitative / Causal / Definitional
- **Status**: CONFIRMED / LIKELY TRUE / UNRESOLVED / LIKELY FALSE / REFUTED
- **Confidence**: HIGH / MEDIUM / LOW
- **Evidence**: [Summary of what authoritative sources say]
- **Sources**: [List with URLs]
- **Caveats**: [Nuances, limitations, conditions]
- **Recommended Action**: [Use as-is / Use with caveat / Do not use / Revise]
```

## Quality Criteria
- No factual claim passes into deliverables without at least one verification attempt
- Verification record distinguishes between "I couldn't find evidence" and "I found contradicting evidence"
- Confidence levels are calibrated to evidence quality, not assumed
- Quantitative verification includes source data, not just the claim
- All corrections are propagated to any downstream deliverables

## Failure Conditions
- Authoritative sources are unavailable or behind paywalls
- The claim is too vague to test (e.g., "significantly increased")
- Multiple authoritative sources disagree with no clear resolution
- The claim requires specialized expertise not available to the verifying agent

## Escalation Rules
- Escalate LIKELY FALSE or REFUTED claims to requesting agent immediately
- Escalate to **CTO** for technical claims requiring domain expertise
- Escalate to **CEO** if a REFUTED claim affects a strategic decision
- Escalate to **Market-Segment** for market data requiring proprietary database access
- Never suppress a REFUTED finding — always escalate

## Security / Compliance
- Do not fabricate verification results — if unable to verify, say so
- Never present opinion as verified fact
- Maintain audit trail of all verification activities
- Respect data licensing when accessing statistical databases
- Flag if fact-check reveals potential fraud, misrepresentation, or legal exposure
- Comply with LGPD if verification involves personal data
