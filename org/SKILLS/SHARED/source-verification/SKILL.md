# SOURCE VERIFICATION

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Evaluate the credibility, reliability, accuracy, and relevance of information sources before incorporating them into analysis, reports, or decisions. Prevents propagation of misinformation, outdated data, or biased content.

## Scope
Applies to all external information sources used by any agent: web articles, academic papers, government publications, industry reports, news media, social media, vendor claims, and internal documents from external parties.

## When to Use
- Before citing any external source in a deliverable
- When source credibility is uncertain or contested
- When information comes from unfamiliar or non-authoritative origins
- When research findings are consequential to business decisions
- When conflicting information is found from different sources

## When NOT to Use
- For internally generated data with known provenance
- When source is a primary government/official publication already verified
- For trivial or non-actionable background information
- When the requesting agent has already performed verification

## Required Inputs
- Source URL or document reference
- The specific claim or data point being verified
- Context of how the verified information will be used

## Optional Inputs
- Known biases of the source
- Publication date constraints
- Industry-specific credibility benchmarks
- Alternative sources for cross-referencing

## Procedure
1. **Identify** the source type (government, academic, media, blog, vendor, social)
2. **Evaluate authority**: Who published it? What are their credentials? Do they have domain expertise?
3. **Assess currency**: When was it published/last updated? Is the information still valid?
4. **Check methodology**: If a study, is the methodology sound? Sample size? Peer review?
5. **Detect bias**: Is the source funded by interested parties? Does it present balanced views?
6. **Cross-reference**: Verify key claims against at least 2 independent sources
7. **Check consistency**: Does the source contradict itself or other established facts?
8. **Rate reliability**: Assign credibility tier (A/B/C/D/F) with justification
9. **Document** the verification result and reasoning

## Reasoning Requirements
- Distinguish between opinion, analysis, and factual reporting
- Recognize common manipulation tactics: cherry-picking, strawman, appeal to authority
- Understand that even credible sources can have errors
- Account for publication lag in fast-moving fields
- Consider whether the source has a business interest in the claim

## Tools
- `websearch` — check source reputation and cross-reference claims
- `webfetch` — access source content for detailed evaluation
- `read` — examine local copies of documents
- `grep` — find contradictory information across local knowledge base

## Source Types & Base Reliability
| Type | Base Tier | Notes |
|------|-----------|-------|
| Government/Official (.gov, .gov.br) | A | Verify agency jurisdiction and publication date |
| Peer-reviewed academic | A | Check journal impact factor, citation count |
| Established news (Reuters, AP, Folha, G1) | B | Cross-reference for breaking news accuracy |
| Industry analyst (Gartner, IDC, McKinsey) | B | Note methodology and potential vendor bias |
| Corporate blog/whitepaper | C | Heavily biased toward vendor's product |
| Personal blog/social media | D | Verify every claim independently |
| Unknown/anonymous | F | Do not use without strong corroboration |

## Verification
- Source URL is accessible and content matches the citation
- Publication date is within acceptable freshness window
- Author is identifiable and has relevant expertise
- Key claims are consistent with other verified sources
- No known retraction or correction exists for the publication

## Output Format
```
## Source Verification Report
- **Source**: [Title, URL]
- **Claim Verified**: [Specific claim]
- **Source Type**: [Category]
- **Credibility Tier**: [A/B/C/D/F]
- **Currency**: [Date published, last updated]
- **Bias Assessment**: [None / Low / Medium / High — reason]
- **Cross-References**: [List of corroborating sources]
- **Verdict**: VERIFIED / PARTIALLY VERIFIED / UNVERIFIED / REFUTED
- **Confidence**: HIGH / MEDIUM / LOW
- **Notes**: [Caveats, limitations]
```

## Quality Criteria
- Every sourced claim in deliverables has a corresponding verification record
- No source rated below Tier C is used without explicit disclosure
- Verification record includes reasoning, not just a rating
- Conflicting sources are documented with analysis of which is more credible
- Verification is reproducible by another agent

## Failure Conditions
- Source is unreachable or content has been altered/removed
- Author and publisher cannot be identified
- Source contains known disinformation patterns
- Cross-referencing reveals fundamental contradictions
- Source requires paid access that cannot be obtained

## Escalation Rules
- Escalate to **CTO** if source is technical and requires domain expert validation
- Escalate to **CEO** if a Tier-A source contradicts an established business assumption
- Escalate to **legal/compliance** if source involves regulated information
- If 3+ sources conflict, escalate to requesting agent with full analysis

## Security / Compliance
- Never present unverified information as fact
- Always disclose source limitations and potential biases
- Comply with attribution requirements (plagiarism avoidance)
- Do not access paywalled content without proper authorization
- Respect copyright — summarize and cite, do not reproduce large passages
- Flag if source contains personal data (LGPD awareness)
