# QUALITY CONTROL

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Systematically review deliverables for accuracy, completeness, consistency, clarity, and compliance with standards before release. Prevents errors, omissions, and quality issues from reaching stakeholders. Ensures all KRAEFEGG output meets professional quality benchmarks.

## Scope
Applies to all deliverables: reports, analyses, databases, code, documentation, presentations, proposals, dashboards, and any output consumed by internal or external stakeholders. Covers both content quality and formatting standards.

## When to Use
- Before delivering any report, analysis, or deliverable to a stakeholder
- During peer review of another agent's output
- After completing a batch of data entry or database operations
- Before publishing documentation or external communications
- When quality concerns have been raised about a deliverable
- As a mandatory step in the KRAEFEGG quality pipeline

## When NOT to Use
- For internal scratch work or brainstorming outputs
- When the deliverable is explicitly marked as draft/working
- For real-time monitoring dashboards (use alert-based QC)
- When the delay of QC review would cause material harm (escalate instead)

## Required Inputs
- The deliverable to review
- Quality standards or checklist to apply
- Acceptance criteria (what defines "good enough")

## Optional Inputs
- Original requirements or brief (for completeness check)
- Prior versions (for consistency check)
- Stakeholder expectations or feedback
- Industry standards that apply

## Procedure
1. **Receive** deliverable and understand its purpose and audience
2. **Screen** for critical issues first (showstoppers):
   - Factual errors in key findings
   - Missing critical sections or data
   - Security/compliance violations (secrets, PII exposure)
   - Logical inconsistencies or contradictions
3. **Review** content quality:
   - Accuracy: Are facts, figures, and claims correct?
   - Completeness: Are all required sections/fields present?
   - Relevance: Does content address the stated objective?
   - Logic: Do conclusions follow from the evidence presented?
   - Depth: Is analysis sufficient for the audience?
4. **Review** presentation quality:
   - Clarity: Is the writing clear and unambiguous?
   - Structure: Is content logically organized?
   - Formatting: Consistent with standards/templates?
   - Language: Appropriate grammar, spelling, terminology?
   - Visuals: Tables, charts properly labeled and referenced?
5. **Review** compliance:
   - Template adherence (if applicable)
   - Metadata completeness (version, date, author)
   - Classification marking
   - Source attribution
6. **Document** all findings in quality review record
7. **Classify** issues: CRITICAL (must fix), MAJOR (should fix), MINOR (nice to fix)
8. **Return** deliverable with review findings (or approve if clean)

## Quality Review Checklist

### Content Quality
- [ ] All claims supported by evidence or sources
- [ ] Key data points verified against sources
- [ ] No logical contradictions within the document
- [ ] Conclusions follow from presented evidence
- [ ] Assumptions are explicitly stated
- [ ] Limitations and caveats are disclosed

### Presentation Quality
- [ ] Grammar and spelling correct (automated check passed)
- [ ] Consistent terminology throughout
- [ ] Tables and figures numbered and referenced
- [ ] Headings create logical navigation structure
- [ ] Appropriate detail level for target audience
- [ ] No orphan sentences or incomplete thoughts

### Compliance
- [ ] Template structure followed (if applicable)
- [ ] Metadata complete and accurate
- [ ] Classification marking present and correct
- [ ] All cited sources appear in reference list
- [ ] No secrets, credentials, or PII exposed
- [ ] LGPD compliance verified (if applicable)

### Completeness
- [ ] All sections from template/brief are present
- [ ] Executive summary reflects full content
- [ ] Recommendations are specific and actionable
- [ ] Appendix contains supporting material
- [ ] Document is self-contained (no missing context)

## Issue Classification
| Level | Definition | Action |
|-------|-----------|--------|
| CRITICAL | Factually wrong, security violation, legal risk | Must fix before delivery |
| MAJOR | Significant gap, unclear section, missing reference | Should fix; discuss with author |
| MINOR | Style inconsistency, typo, formatting variation | Fix if time permits |
| SUGGESTION | Improvement opportunity, not a defect | Note for future enhancement |

## Reasoning Requirements
- Apply the "fresh eyes" principle — review as if seeing for the first time
- Check for what's missing, not just what's wrong
- Verify the deliverable against the original requirement/brief
- Consider how the audience will interpret and use the deliverable
- Distinguish between style preferences and actual quality issues
- Apply appropriate rigor for the deliverable's risk level

## Tools
- `read` — examine the deliverable thoroughly
- `grep` — search for specific issues (inconsistencies, missing references)
- `bash` — run automated checks (spell-check, lint) if available
- `write` — document review findings
- Related skills: `fact-checking`, `source-verification`, `evidence-analysis`

## Verification
- QC review is documented with specific findings
- CRITICAL and MAJOR issues are addressed before approval
- Reviewer is not the author (independent review when possible)
- Review scope covers both content and presentation
- Final deliverable meets the original acceptance criteria

## Output Format
```
## Quality Review: [Deliverable Name]
### Review Metadata
- **Reviewer**: KRAEFEGG / [Agent]
- **Date**: [Review date]
- **Deliverable Version**: [Version reviewed]

### Summary
- **Decision**: APPROVED / APPROVED WITH NOTES / RETURNED FOR REVISION / REJECTED
- **CRITICAL**: [N] issues
- **MAJOR**: [N] issues
- **MINOR**: [N] issues
- **SUGGESTIONS**: [N]

### Issues Found
| # | Level | Category | Location | Description | Recommendation |
|---|-------|----------|----------|-------------|---------------|

### Checklist Results
[Pass/Fail for each checklist section]

### Approval
[If approved: sign-off statement]
[If returned: specific required changes]
```

## Quality Criteria
- Review is thorough — covers content, presentation, and compliance
- Issues are specific and actionable (not vague complaints)
- Review decision matches the issue severity (CRITICAL → RETURNED)
- Review is documented for audit trail
- Author receives constructive feedback, not just criticism
- Review is completed within agreed turnaround time

## Failure Conditions
- Deliverable has too many issues to enumerate (escalate to author for rework)
- Reviewer lacks domain expertise to validate content accuracy
- Quality standards are unclear or contradictory
- CRITICAL issues are systemic (suggest process improvement, not just fix)

## Escalation Rules
- Escalate CRITICAL issues to deliverable owner immediately
- Escalate to **CEO** if deliverable has legal/compliance implications
- Escalate to **CTO** if deliverable has technical accuracy issues requiring domain expertise
- Escalate if systemic quality issues suggest training or process improvement needs
- Never approve a deliverable with unresolved CRITICAL issues

## Security / Compliance
- QC review must check for security violations (secrets, PII, classification)
- Ensure deliverables comply with information handling policies
- Verify LGPD compliance for deliverables containing personal data
- Document review for accountability and audit trail
- Apply stricter QC for externally-facing deliverables
- Never bypass QC for expedience on high-stakes deliverables
