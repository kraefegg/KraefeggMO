# COMPETITIVE INTELLIGENCE

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Conduct ethical, systematic analysis of competitors using publicly available information. Identifies competitor strategies, capabilities, positioning, strengths, weaknesses, and market behavior to inform KRAEFEGG's strategic decisions.

## Scope
Covers analysis of direct, indirect, and potential competitors using only OSINT (Open Source Intelligence): public filings, websites, press releases, job postings, patent filings, social media, news coverage, and public event participation. Focus on port/maritime, energy, technology, and infrastructure sectors.

## When to Use
- Preparing for competitive bid or tender
- Developing or updating competitive positioning strategy
- Assessing market entry barriers created by incumbents
- Monitoring competitor moves for strategic response
- Building competitive landscape maps for business development
- Before pricing decisions or product launches

## When NOT to Use
- For espionage, social engineering, or any unethical information gathering
- When competitor information is confidential/proprietary (NDA-bound)
- For purely internal strategy without competitive context
- When the analysis would require unauthorized access to competitor systems

## Required Inputs
- Competitor name(s) or market segment to analyze
- Analysis dimensions (strategy, capabilities, pricing, market share)
- Geographic scope
- Timeframe (current state, historical trends, future projections)

## Optional Inputs
- Specific competitor intelligence questions to answer
- Known competitor actions to analyze
- Industry benchmark data
- Customer win/loss data

## Procedure
1. **Identify** competitors: direct, indirect, potential new entrants, substitutes
2. **Map** public information sources for each competitor:
   - Corporate website, investor relations, annual reports
   - Job postings (reveals strategy direction and capabilities being built)
   - Patent filings (reveals R&D direction)
   - News coverage and press releases
   - Social media presence and engagement
   - Conference presentations and published papers
   - Public contract/tender participation (licitações)
3. **Analyze** each competitor across defined dimensions:
   - Market position and share estimates
   - Product/service portfolio and differentiation
   - Pricing strategy (where publicly known)
   - Geographic footprint and expansion patterns
   - Technology stack and innovation indicators
   - Partnerships, alliances, and M&A activity
   - Organizational structure (from LinkedIn/job postings)
4. **Build** competitive comparison matrix
5. **Identify** strategic patterns and likely future moves
6. **Assess** competitive threats and opportunities
7. **Document** all sources and confidence levels

## Reasoning Requirements
- Strictly ethical: only use publicly available information
- Distinguish between confirmed facts and inferred intelligence
- Recognize that public positioning may differ from actual strategy
- Account for information asymmetry — some competitors are more transparent
- Avoid projection bias — don't assume competitors think like we do
- Consider that competitor silence on a topic may be strategic

## Ethical Boundaries (NEVER cross)
| Allowed | Prohibited |
|---------|-----------|
| Public website content | Hacking or unauthorized access |
| Press releases and news | Social engineering employees |
| Job postings | Paying for insider information |
| Patent filings | Impersonating customers/partners |
| Conference presentations | Accessing confidential databases |
| Public financial filings | Bribing for information |
| FOIA/public records requests | Recording private conversations |

## Tools
- `websearch` — discover competitor public presence and news
- `webfetch` — retrieve competitor website content, press releases
- `read` — examine local competitor intelligence files
- `write` — save competitive analysis deliverables
- `grep` — search local knowledge base for prior intelligence

## Verification
- All competitive claims sourced to public information
- Market share estimates cross-referenced with industry data
- No confidential or insider information used
- Inferences clearly labeled as such (vs. confirmed facts)
- Analysis is reproducible from public sources alone

## Output Format
```
## Competitive Intelligence: [Market/Competitor]
### Competitor Summary
| Competitor | Position | Key Strength | Key Weakness | Threat Level |
|-----------|----------|-------------|-------------|-------------|

### Detailed Analysis: [Competitor Name]
- **Overview**: [Company description, size, focus]
- **Strategy**: [Observed strategic direction]
- **Products/Services**: [Portfolio and differentiation]
- **Market Position**: [Share estimate, positioning]
- **Strengths**: [Based on public evidence]
- **Weaknesses**: [Based on public evidence]
- **Recent Moves**: [Notable recent actions with dates]
- **Likely Future Direction**: [Inference with confidence level]

### Competitive Landscape Map
[Positioning diagram or comparison matrix]

### Strategic Implications
1. [Implication for KRAEFEGG] — Urgency: [H/M/L]

### Sources
[All public sources used with access dates]
```

## Quality Criteria
- Every competitive claim has a public source attribution
- Inferences are clearly distinguished from confirmed facts
- All three competitor types are considered (direct, indirect, potential)
- Analysis covers both strengths and weaknesses (balanced)
- Threat levels are justified by evidence
- Ethical boundaries are explicitly maintained

## Failure Conditions
- Competitor has minimal public presence (limited intelligence)
- Analysis would require non-public information to be meaningful
- Information sources are unreliable or contradictory
- Legal risk identified in the research approach

## Escalation Rules
- Escalate to **CEO** if competitive intelligence reveals significant strategic threat
- Escalate to **CTO** for technology-specific competitive assessment
- Escalate to **Market-Segment** for deep market-share competitive analysis
- Escalate immediately if research approach approaches ethical/legal boundaries

## Security / Compliance
- NEVER use non-public, confidential, or illegally obtained information
- Respect trade secret protections
- Do not engage in pretexting, social engineering, or impersonation
- Document all intelligence sources for legal defensibility
- Apply LGPD to any personal data found about competitor employees
- Retain competitive intelligence records per KRAEFEGG data policies
