# REPORT GENERATION

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Create structured, professional reports of varying types (technical, executive, analytical, compliance) using consistent templates, formatting standards, and quality controls. Ensures every report is complete, accurate, and actionable.

## Scope
Covers all report types: executive summaries, technical reports, market analyses, compliance reports, feasibility studies, status reports, incident reports, and analytical briefs. Applies to internal and external deliverables.

## When to Use
- Producing any formal report or briefing document
- Need standardized format for recurring report types
- Consolidating analysis from multiple agents into a single document
- Creating client-facing deliverables
- Generating compliance or audit documentation

## When NOT to Use
- For informal notes, brainstorming outputs, or chat responses
- When a simple data table or chart suffices without narrative
- For real-time dashboards (use dashboard tools instead)

## Required Inputs
- Report type (executive, technical, analytical, compliance, status)
- Topic / title
- Data, findings, or analysis to include
- Target audience

## Optional Inputs
- Template or precedent from prior reports
- Branding or formatting guidelines
- Length constraints
- Specific sections required by regulation or client
- Data visualization specifications

## Procedure
1. **Classify** report type and select appropriate template/structure
2. **Define** scope: what the report will and will not cover
3. **Gather** all source material, data, and analysis to include
4. **Outline** report structure with section headings and logical flow
5. **Write** each section following technical writing standards
6. **Integrate** data visualizations (charts, tables, figures) at appropriate points
7. **Write** executive summary LAST (after all sections are complete)
8. **Add** metadata: version, date, classification, distribution list
9. **Review** against quality checklist (see below)
10. **Finalize** and deliver in requested format

## Report Type Templates

### Executive Summary Report
Structure: Executive Summary > Context > Key Findings > Implications > Recommendations > Appendix
Target: 1-2 pages; high-level, decision-oriented, minimal jargon.

### Technical Report
Structure: Abstract > Introduction > Methodology > Results > Discussion > Conclusions > References > Appendix
Target: Detailed, reproducible, methodologically transparent.

### Analytical Report
Structure: Summary > Question/Purpose > Methodology > Findings > Analysis > Recommendations > Sources
Target: Evidence-based, balanced, with clear analytical framework.

### Compliance Report
Structure: Scope > Regulatory Framework > Assessment > Findings > Non-Compliance Items > Remediation Plan > Timeline
Target: Precise, traceable to specific regulations, actionable remediation.

### Status Report
Structure: Period > Achievements > Metrics > Issues/Risks > Next Period Plan > Blockers
Target: Concise, metric-driven, forward-looking.

## Reasoning Requirements
- Match report structure to audience needs (executives need summaries, engineers need detail)
- Maintain analytical rigor — report conclusions must follow from the evidence presented
- Distinguish between facts, analysis, and recommendations in the narrative
- Apply the inverted pyramid: most important information first
- Ensure internal consistency — no contradictions between sections

## Tools
- `write` — create report files
- `edit` — revise and refine content
- `read` — gather source material
- `bash` — run formatting or export tools

## Quality Checklist
- [ ] All sections from the template are present and complete
- [ ] Executive summary accurately reflects the full report content
- [ ] Every claim has a source or data reference
- [ ] Tables and figures are numbered, titled, and referenced in text
- [ ] Recommendations are specific, actionable, and tied to findings
- [ ] No orphan references (cited sources appear in reference list)
- [ ] Version number and date are current
- [ ] Classification and distribution are marked
- [ ] Document passes spell/grammar check
- [ ] Formatting is consistent throughout (headings, fonts, spacing)

## Output Format
```
# [Report Title]

**Version**: X.Y.Z | **Date**: YYYY-MM-DD | **Classification**: [Public/Internal/Confidential]
**Prepared by**: KRAEFEGG / [Agent] | **Approved by**: [If applicable]

## Executive Summary
[2-5 paragraph overview: context, key findings, primary recommendation]

## 1. [Section Title]
[Content]

## 2. [Section Title]
[Content]

...

## Recommendations
1. [Specific, actionable recommendation tied to finding]
2. ...

## References
[Numbered list of all sources cited]

## Appendix
[Supporting data, detailed calculations, supplementary material]
```

## Quality Criteria
- Report stands alone: reader needs no additional context to understand it
- Executive summary is a faithful abstraction of the full report (no new info, no omissions)
- All data visualizations are properly labeled and referenced
- Recommendations directly follow from presented findings
- Formatting is consistent and professional
- Report meets the stated audience's information needs

## Failure Conditions
- Insufficient data to produce a meaningful report for the stated scope
- Key findings contradict each other and cannot be reconciled
- Report type template is not applicable to the content
- Deadline cannot be met with required quality level

## Escalation Rules
- Escalate to **CEO** for executive reports requiring final approval
- Escalate to **CTO** for technical reports requiring engineering review
- Escalate to **Market-Segment** for market reports requiring industry validation
- Escalate if report reveals risk requiring immediate leadership attention

## Security / Compliance
- Apply correct classification marking to every report
- Never include secrets, credentials, or proprietary keys in reports
- Respect information handling policies for confidential content
- Maintain audit trail: who created, reviewed, approved, and received the report
- Comply with data protection requirements for any personal data in reports
- Archive reports per retention policy
