# TECHNICAL WRITING

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Produce clear, precise, well-structured, and audience-appropriate written content for technical and professional contexts. Ensures consistency in tone, formatting, terminology, and quality across all KRAEFEGG documentation.

## Scope
Covers all written output: reports, specifications, documentation, emails, proposals, analysis summaries, technical guides, API docs, SOPs, and any text-based deliverable. Applies to pt-BR (default), en-US, and es-LA.

## When to Use
- Producing any written deliverable for internal or external audiences
- Need to maintain consistent KRAEFEGG documentation standards
- Writing specifications, requirements, or technical documentation
- Creating client-facing proposals or reports
- Authoring standard operating procedures or guidelines

## When NOT to Use
- For internal scratch notes or brainstorming (use casual format)
- When the output is purely data/charts with no prose
- For code comments (follow codebase conventions instead)

## Required Inputs
- Content/topic to be written
- Target audience (technical, executive, general)
- Document type and format requirements
- Language (default: pt-BR)

## Optional Inputs
- Brand style guide or glossary
- Template or format precedent
- Length constraints
- Specific terminology to use or avoid
- Reference documents for consistency

## Procedure
1. **Define** audience, purpose, and desired outcome of the document
2. **Outline** structure before writing (headings, sections, logical flow)
3. **Write** first draft focusing on content completeness over polish
4. **Apply** these writing principles:
   - Active voice preferred over passive
   - One idea per paragraph; topic sentence first
   - Short sentences (15-25 words target)
   - Technical terms defined on first use
   - Concrete language over abstract
5. **Structure** with clear hierarchy: H1 > H2 > H3, numbered steps for procedures
6. **Add** visual aids where they improve comprehension (tables, diagrams, code blocks)
7. **Review** for clarity, accuracy, completeness, and consistency
8. **Proofread** for grammar, spelling, punctuation, and formatting
9. **Verify** all technical claims, data, and references
10. **Finalize** with metadata (version, date, author, status)

## Reasoning Requirements
- Write for the reader, not the writer (empathy principle)
- Progressive disclosure: overview first, details on demand
- Maintain information scent: readers should predict content from headings
- Balance completeness with conciseness — every word must earn its place
- Consider cultural and linguistic context of target audience

## Style Standards
| Element | Rule |
|---------|------|
| Voice | Active preferred: "The system processes..." not "Processing is done by..." |
| Tense | Present for current state, past for completed actions |
| Numbers | Spell out 1-9, use digits for 10+ (except units, dates, ages) |
| Lists | Parallel structure, no orphan items |
| Acronyms | Define on first use, use abbreviation thereafter |
| Tables | Headers, consistent alignment, units in headers |
| Code | Fenced blocks with language identifier |
| Headings | Sentence case, no trailing punctuation |
| Links | Descriptive text, not "click here" |

## Tools
- `write` — create and save documents
- `edit` — revise existing documents
- `read` — review reference materials and existing docs
- `bash` — run spell-check or linting tools if available

## Verification
- Document passes grammar/spell-check (no automated errors)
- All headings create a logical, navigable outline
- Every technical claim is sourced or verifiable
- Acronyms are defined and used consistently
- Document is readable at the target audience level
- Tables and lists use parallel structure

## Output Format
Follows the KRAEFEGG document template:
```
# [Document Title]

Version: X.Y.Z
Created: YYYY-MM-DD
Updated: YYYY-MM-DD
Owner: KRAEFEGG / [Agent]
Status: [DRAFT / ACTIVE / ARCHIVED]

## [Section 1]
[Content with clear hierarchy]

## [Section 2]
[Content with tables, code blocks, or visuals as needed]
```

## Quality Criteria
- Zero grammatical or spelling errors
- Logical flow from introduction to conclusion
- Consistent terminology throughout (no synonyms for the same concept)
- Appropriate detail level for target audience
- Actionable and specific (no vague generalities in recommendations)
- Compliant with pt-BR conventions when writing in Portuguese

## Failure Conditions
- Information is insufficient to write a complete, accurate document
- Source material contains contradictions that cannot be resolved
- Audience requirements are unclear and unstated
- Document requires expertise beyond agent capability

## Escalation Rules
- Escalate to **CTO** for technical accuracy review of engineering documentation
- Escalate to **CEO** for executive-facing documents requiring strategic alignment
- Escalate to **Market-Segment** for market-facing content requiring domain nuance
- Escalate if writing reveals factual gaps that require research

## Security / Compliance
- Never embed credentials, API keys, or secrets in documentation
- Respect confidentiality of information not cleared for documentation
- Use appropriate disclaimers for forward-looking statements
- Comply with accessibility standards (clear structure, alt text for images)
- Maintain version control — never silently alter published documents
- Follow KRAEFEGG naming and directory conventions for saved files
