# DOCUMENT ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Extract, structure, and analyze information from documents (PDFs, text files, reports, contracts, specifications, regulations, code, spreadsheets). Transforms unstructured or semi-structured content into actionable intelligence.

## Scope
Applies to all document types encountered by KRAEFEGG agents: contracts, technical specifications, regulatory texts, research papers, business reports, codebases, configuration files, spreadsheets, and mixed-format documents.

## When to Use
- User provides a document for analysis or extraction
- Need to understand contents of a referenced file or URL
- Before integrating document data into databases or reports
- When comparing document versions or tracking changes
- When extracting specific data points from structured/semi-structured sources

## When NOT to Use
- For documents that are clearly outside the agent's domain of competence
- When document access would violate confidentiality without proper authorization
- For real-time streaming data (use appropriate data pipeline tools)
- When a simple read/quote is sufficient without analysis

## Required Inputs
- Document path, URL, or raw content
- Analysis objective (what information is needed)
- Output format preference (structured data, summary, comparison)

## Optional Inputs
- Specific sections or pages to focus on
- Expected data schema for extraction
- Context about the document's purpose and audience
- Known issues or areas of concern to investigate

## Procedure
1. **Access** the document: read file, fetch URL, or receive inline content
2. **Classify** document type: contract, report, specification, regulation, code, other
3. **Identify** document metadata: title, author, date, version, status
4. **Map** document structure: sections, headings, key sections relevant to objective
5. **Extract** information per the analysis objective (specific fields, themes, data points)
6. **Identify** key provisions, constraints, obligations, or metrics
7. **Cross-reference** against known context (other documents, databases, prior analysis)
8. **Flag** ambiguities, contradictions, missing information, or areas requiring expert review
9. **Structure** output according to the requested format

## Reasoning Requirements
- Distinguish between mandatory provisions ("shall") and discretionary ones ("may")
- Recognize document hierarchy: headers > paragraphs > footnotes > appendices
- Account for legal/regulatory language precision (definitions matter)
- Identify implicit assumptions vs. explicitly stated conditions
- Consider document's intended audience and purpose when interpreting content

## Tools
- `read` — primary file reading tool (supports text, PDF, images)
- `webfetch` — retrieve documents from URLs
- `grep` — search within documents for specific patterns
- `glob` — locate documents by name patterns
- `bash` — run document processing commands if needed

## Document Types & Handling
| Type | Focus Areas | Extraction Priority |
|------|-------------|-------------------|
| Contract/Agreement | Obligations, terms, penalties, dates, parties | Key provisions, deadlines, SLAs |
| Technical Spec | Requirements, constraints, interfaces, standards | Functional requirements, interfaces |
| Regulation/Law | Articles, definitions, obligations, deadlines | Compliance requirements, penalties |
| Research Paper | Methodology, findings, limitations, citations | Key findings, methodology quality |
| Business Report | Metrics, trends, forecasts, recommendations | KPIs, trends, action items |
| Codebase | Architecture, patterns, dependencies, tests | Structure, tech stack, complexity |

## Verification
- Extracted data matches source document (spot-check 10% of extracts)
- All identified dates, figures, and proper nouns are accurate
- No information is taken out of context from its surrounding paragraphs
- Document metadata (date, version, author) is captured correctly
- Cross-referenced items are consistent across linked documents

## Output Format
```
## Document Analysis: [Document Title]
### Metadata
- **Type**: [Category]
- **Author/Source**: [Entity]
- **Date**: [Publication/revision date]
- **Version**: [If applicable]

### Key Findings
1. [Finding with page/section reference]
2. ...

### Extracted Data
| Field | Value | Section | Confidence |
|-------|-------|---------|------------|

### Issues / Flags
- [Ambiguity, contradiction, or concern identified]

### Recommendations
- [Action items based on analysis]
```

## Quality Criteria
- All extracted data includes source section/page reference
- No fabricated information — gaps are explicitly marked
- Analysis distinguishes between fact, interpretation, and recommendation
- Document metadata is complete and accurate
- Output is structured for downstream consumption by other agents

## Failure Conditions
- Document is corrupted, encrypted, or unreadable
- Language is unknown or translation quality is insufficient
- Document content contradicts established authoritative records
- Analysis objective requires domain expertise beyond agent capability

## Escalation Rules
- Escalate legal/contractual documents to **CEO** or designated legal review
- Escalate technical specifications to **CTO** for domain validation
- Escalate if document reveals potential compliance violations
- Escalate if document contains classified or restricted information

## Security / Compliance
- Do not reproduce copyrighted material verbatim beyond fair use
- Respect document confidentiality classifications
- Comply with data handling policies for sensitive documents
- Never store credentials, keys, or secrets found in documents
- Audit log all document access for compliance trail
- LGPD: flag and handle documents containing personal data appropriately
