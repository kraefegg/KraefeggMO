# WEB RESEARCH

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Systematic methodology for conducting thorough, reliable, and reproducible web research. Ensures comprehensive coverage of topics using structured search strategies, source triangulation, and documented provenance.

## Scope
Covers research conducted via web search engines, public databases, APIs, and online repositories. Applies to all domains: technical, market, regulatory, competitive, and general knowledge research.

## When to Use
- Any request requiring current or recent information not in local knowledge base
- Keyword: "research", "investigate", "find out", "look up", "what is the current state"
- When client needs sourced, verifiable information
- Before strategic decisions that require external data
- When building knowledge base on a new topic

## When NOT to Use
- For internal documentation that already exists locally
- When the answer is in provided context/references
- For classified or NDA-restricted information
- When the query is purely opinion-based with no factual component

## Required Inputs
- Clear research question or topic statement
- Scope boundaries (what is in/out of research)
- Target audience for the findings
- Deadline or freshness requirements (e.g., "last 12 months only")

## Optional Inputs
- Preferred sources or databases to prioritize
- Geographic or jurisdictional focus
- Language preferences
- Minimum source count requirement
- Budget constraints for paid databases

## Procedure
1. **Deconstruct** the research question into sub-questions and key terms
2. **Plan** search strategy: identify keywords, synonyms, boolean operators, and target source types
3. **Execute** initial broad search, then progressively narrow with filters
4. **Capture** every source URL, title, access date, and key excerpt immediately
5. **Triangulate** findings across minimum 3 independent sources per factual claim
6. **Cross-reference** dates to ensure information currency and relevance
7. **Document** research trail: searches performed, sources found, sources excluded (with reason)
8. **Synthesize** findings into structured output with confidence levels
9. **Flag** gaps where no reliable source was found

## Reasoning Requirements
- Apply source hierarchy: primary > secondary > tertiary sources
- Distinguish between correlation and causation in reported findings
- Recognize recency bias vs. enduring authoritative sources
- Account for geographic and cultural context in search results
- Identify potential echo chambers or single-source dependency

## Tools
- `websearch` — primary search tool for real-time queries
- `webfetch` — deep-dive into specific URLs for full content extraction
- `grep` — search local files for related context
- `read` — examine referenced documents
- External: Google Scholar, PubMed, government databases, industry reports

## Source Requirements
- Minimum 3 independent sources per key factual claim
- At least 1 primary source (original report, study, official data)
- Prefer .gov, .edu, established industry publications over blogs
- Document publication date and access date for every source
- Exclude sources older than project-specific freshness threshold (default: 24 months)

## Verification
- Cross-check key figures across multiple sources
- Verify source URLs are accessible and content matches citation
- Check publication dates against freshness requirements
- Confirm author credentials where relevant
- Search for contradicting evidence or alternative viewpoints

## Output Format
```
## Research: [Topic]
### Summary
[2-3 sentence overview]

### Key Findings
1. [Finding] — Source: [URL, date] — Confidence: HIGH/MEDIUM/LOW
2. ...

### Gaps & Limitations
- [What could not be verified or found]

### Sources
| # | Title | URL | Date | Type | Reliability |
|---|-------|-----|------|------|-------------|
```

## Quality Criteria
- Every factual claim has at least one named source
- No unsourced assertions in the output
- Research trail is reproducible (another agent could follow the same steps)
- Gaps are explicitly documented, not filled with assumptions
- Output is tailored to the stated audience

## Failure Conditions
- All sources for a key claim are behind paywalls with no accessible abstracts
- Search results are dominated by low-quality or unverifiable content
- Topic is outside ethical research boundaries
- Freshness requirement cannot be met (topic too new or too old)

## Escalation Rules
- Escalate to **CTO** if research requires access to paid databases beyond available subscriptions
- Escalate to **CEO** if findings have material strategic implications
- Escalate to **Market-Segment** agent for market-specific research requiring domain expertise
- Escalate if research reveals potential legal/regulatory risk

## Security / Compliance
- Never access restricted or unauthorized databases
- Respect robots.txt and terms of service
- Do not scrape personal data without consent (LGPD compliance)
- Document all data sources for audit trail
- Store research artifacts outside version control (secrets/credentials never in research)
- Flag if research touches on sensitive industries (defense, healthcare, finance)
