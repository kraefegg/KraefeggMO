# SUMMARIZATION

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Condense complex, lengthy, or multi-source information into concise, accurate summaries that preserve essential meaning, key findings, and actionable insights. Ensures information is digestible for the target audience without loss of critical content.

## Scope
Covers summarization of documents, research findings, meeting notes, reports, conversations, datasets, regulatory texts, market analyses, and any content requiring compression. Supports multiple summary types: executive, technical, analytical, and operational.

## When to Use
- Delivering information to time-constrained stakeholders (executives, clients)
- Preparing briefing materials before meetings or decisions
- Creating executive summaries for longer reports
- Distilling research findings into actionable takeaways
- Converting multi-document analysis into single-page summaries
- When user requests "TL;DR", "quick summary", or "key points"

## When NOT to Use
- When full detail is required (use document-analysis instead)
- For data visualization (use data-analysis instead)
- When the source content is already brief
- When summarization would remove information needed for decision-making

## Required Inputs
- Source content to summarize
- Target length or compression ratio
- Audience (who will read the summary)

## Optional Inputs
- Summary type (executive, technical, analytical)
- Key topics or themes to prioritize
- Format requirements (bullets, narrative, structured)
- Language for summary (default: match source language)

## Procedure
1. **Read** and comprehend the full source content
2. **Identify** the core message, purpose, and audience of the source
3. **Extract** key elements:
   - Main conclusions or findings
   - Critical data points and metrics
   - Actionable recommendations
   - Significant caveats or limitations
   - Key dates, deadlines, or timelines
4. **Prioritize** information by importance and actionability
5. **Compose** summary using these principles:
   - Lead with the most important information (inverted pyramid)
   - Use specific data over vague qualifiers
   - Preserve nuance and caveats (don't over-simplify)
   - Maintain logical flow from context → findings → implications
6. **Verify** that summary accurately represents the source (no distortion)
7. **Format** for the target audience and delivery method

## Summary Types
| Type | Structure | Length | Audience |
|------|-----------|--------|----------|
| Executive | Finding → Implication → Recommendation | 10-15% of source | Decision-makers |
| Technical | Method → Results → Limitations | 15-25% of source | Technical team |
| Analytical | Question → Evidence → Assessment | 15-25% of source | Analysts/stakeholders |
| Operational | Status → Issues → Actions | 10-15% of source | Project team |
| Briefing | Context → Key Points → Decisions Needed | 5-10% of source | Time-constrained execs |

## Reasoning Requirements
- Apply editorial judgment — not everything is equally important
- Preserve the author's intent and nuance (don't distort through omission)
- Distinguish between facts, analysis, and recommendations in the source
- Maintain proportional representation (don't give 80% of space to a minor point)
- Include caveats and limitations even in brief summaries
- Avoid injecting own opinions or interpretations not in the source

## Tools
- `read` — read source content
- `grep` — locate key sections in large documents
- `write` — save summary output
- `webfetch` — retrieve web content for summarization

## Verification
- Summary is proportional to source (no over-emphasis or under-representation)
- Key findings from source are present in summary
- No factual claims in summary that aren't in the source
- Summary does not introduce new information not in the source
- Target audience can make informed decisions from the summary alone

## Output Format
```
## Summary: [Source Title/Topic]
**Source**: [Title, date, author] | **Compression**: [ratio]
**Audience**: [Target audience]

### Key Points
1. [Most important finding/point]
2. [Second most important]
3. [Third most important]

### Context
[1-2 sentences providing necessary background]

### Details
[Supporting information organized by theme]

### Action Items / Recommendations
1. [Specific action]

### Limitations
[Caveats from the source that the reader should know]
```

## Quality Criteria
- Summary is accurate — faithfully represents source content
- No fabricated information (everything traces to source)
- Length matches the target compression ratio
- Key findings are present and proportionally represented
- Caveats and limitations are preserved
- Reader can make informed decisions from the summary alone

## Failure Conditions
- Source content is too ambiguous or poorly written to summarize accurately
- Summary would be too long for target format while preserving essential content
- Source contains contradictory information that cannot be reconciled in summary
- Summarization would require domain expertise not available

## Escalation Rules
- Escalate to source author if summary reveals unclear or contradictory content
- Escalate to requesting agent if key findings have strategic implications
- Escalate to **CEO** if summary of critical report reveals urgent issues
- Escalate if summarization reveals potential misinformation in source

## Security / Compliance
- Summary inherits the classification of the source material
- Never summarize classified information into less-restricted formats
- Respect data handling policies for sensitive content
- Maintain attribution to original source
- Do not strip disclaimers or caveats from source material
- LGPD: ensure summaries of personal data remain compliant
