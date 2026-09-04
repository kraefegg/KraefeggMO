# CRITICAL ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Apply structured critical thinking methodology to evaluate arguments, proposals, claims, and situations. Identifies logical fallacies, hidden assumptions, cognitive biases, and gaps in reasoning. Ensures KRAEFEGG recommendations are built on sound logic.

## Scope
Covers analysis of arguments, proposals, business cases, technical claims, market assessments, regulatory interpretations, and strategic positions. Applies to both internal proposals and external claims received from partners, vendors, or market sources.

## When NOT to Use
- When the task is purely creative/generative with no analytical component
- For straightforward data lookup without interpretive element
- When the request explicitly asks for supportive (not critical) analysis

## When to Use
- Evaluating a business proposal, investment case, or strategic recommendation
- Assessing technical claims or vendor promises
- Reviewing arguments before committing resources
- When contradicting viewpoints need structured evaluation
- Quality-checking KRAEFEGG's own analyses before delivery

## Required Inputs
- The claim, proposal, or argument to analyze
- Context (who is making the claim, what decision depends on it)
- Stated assumptions or premises

## Optional Inputs
- Opposing viewpoints or counterarguments
- Historical data for pattern comparison
- Stakeholder interests and potential biases
- Resource constraints that limit options

## Procedure
1. **Deconstruct** the argument into premises and conclusion
2. **Identify** stated and unstated assumptions
3. **Evaluate** each premise for evidence quality and source credibility
4. **Check** logical validity: does the conclusion follow from the premises?
5. **Scan** for cognitive biases: anchoring, confirmation, availability, sunk cost
6. **Scan** for logical fallacies: ad hominem, straw man, false dilemma, slippery slope
7. **Consider** alternative explanations and counterarguments
8. **Assess** the strength of evidence (sufficient, relevant, reliable)
9. **Synthesize** a balanced evaluation with confidence level
10. **Recommend** whether to accept, modify, reject, or seek more information

## Reasoning Requirements
- Steel-man opposing arguments before critiquing them
- Distinguish between the quality of reasoning and the desirability of the conclusion
- Apply Hanlon's razor: don't attribute to malice what can be explained by incompetence
- Recognize that absence of evidence is not evidence of absence
- Consider second and third-order effects of proposed actions
- Apply the pre-mortem technique: assume failure, then identify causes

## Bias & Fallacy Reference
| Bias/Fallacy | Description | Detection Method |
|-------------|-------------|------------------|
| Confirmation bias | Seeking evidence that supports existing belief | Check if disconfirming evidence was sought |
| Anchoring | Over-relying on first piece of information | Ask: would different starting point change conclusion? |
| Sunk cost fallacy | Continuing due to past investment | Ask: if starting fresh, would you choose this? |
| False dilemma | Presenting only two options when more exist | List alternative options not considered |
| Appeal to authority | Claim is true because an authority says so | Verify authority's actual domain expertise |
| Survivorship bias | Only studying successes, not failures | Ask: what failures are not being considered? |
| Bandwagon | Claim is true because many believe it | Evaluate evidence independent of popularity |

## Tools
- `read` — examine source documents and proposals
- `websearch` — check claims against external evidence
- `webfetch` — retrieve supporting or contradicting sources
- Structured reasoning frameworks (SWOT, decision matrices)

## Verification
- All identified assumptions are explicitly listed
- At least one counterargument is considered for each major claim
- No logical fallacies remain unaddressed in the final analysis
- Confidence level accurately reflects evidence strength
- Analysis would survive peer review by a competent critic

## Output Format
```
## Critical Analysis: [Topic]
### Argument Summary
[What is being claimed/proposed and by whom]

### Premises & Evidence
| Premise | Evidence Quality | Source | Assessment |
|---------|-----------------|--------|------------|

### Assumptions Identified
1. [Assumption] — Validity: JUSTIFIED / QUESTIONABLE / UNJUSTIFIED

### Logical Assessment
- Validity: [VALID / FLAWED / PARTIALLY VALID]
- Fallacies Detected: [None / List]
- Biases Detected: [None / List]

### Alternative Perspectives
1. [Counter-argument with supporting evidence]

### Verdict
- **Acceptance**: ACCEPT / ACCEPT WITH MODIFICATIONS / REJECT / INCONCLUSIVE
- **Confidence**: HIGH / MEDIUM / LOW
- **Key Risks**: [If accepted]

### Recommendations
- [Specific actions based on analysis]
```

## Quality Criteria
- Argument is accurately represented (no straw-manning)
- All premises have evidence quality assessments
- At least one genuine counterargument is presented
- Verdict is proportional to evidence strength (no overconfidence)
- Analysis distinguishes between logic quality and conclusion desirability
- Recommendations are actionable and specific

## Failure Conditions
- Source material is too vague to decompose into testable premises
- All evidence sources are Tier D or below
- Analysis requires domain expertise beyond agent capability
- The argument is unfalsifiable (cannot be tested against evidence)

## Escalation Rules
- Escalate to **CTO** if analysis requires deep technical domain expertise
- Escalate to **CEO** if the analysis affects strategic direction or resource allocation
- Escalate to **Market-Segment** for competitive or market-related critical analysis
- Escalate if analysis reveals potential fraud, legal risk, or ethical concerns

## Security / Compliance
- Apply critical analysis to all claims before acting on them
- Never suppress findings that contradict stakeholder preferences
- Maintain intellectual honesty — report what the evidence shows, not what is desired
- Document the critical analysis process for accountability
- Flag if analysis reveals potential conflicts of interest
