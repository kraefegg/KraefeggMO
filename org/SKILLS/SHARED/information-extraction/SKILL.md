# INFORMATION EXTRACTION

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Extract structured data from unstructured or semi-structured sources (text, documents, web pages, APIs, conversations). Transforms raw information into organized, queryable formats for databases, reports, and analysis pipelines.

## Scope
Covers extraction of entities (people, organizations, locations), attributes (dates, amounts, categories), relationships (connections between entities), and structured records from: natural language text, HTML/web content, PDFs, CSV/Excel files, API responses, chat logs, and mixed-format documents.

## When to Use
- Populating databases from documents or web sources
- Converting unstructured reports into structured records
- Building knowledge bases from research findings
- Extracting data points from multiple sources for aggregation
- When data is scattered across documents and needs consolidation
- Preparing data for analysis or visualization

## When NOT to Use
- When data is already structured (CSV, database, API with JSON)
- For simple text retrieval without structural transformation
- When extraction requires human judgment beyond agent capability
- For real-time data streams (use appropriate pipeline tools)

## Required Inputs
- Source content (file, URL, or inline text)
- Target schema or desired output fields
- Extraction objective (what data is needed)

## Optional Inputs
- Sample output showing expected format
- Validation rules for extracted fields
- Confidence threshold for extraction
- Entity types to focus on
- Handling instructions for ambiguous or missing data

## Procedure
1. **Understand** the source: format, structure, content type, language
2. **Define** target schema: what fields, what types, what constraints
3. **Scan** source for relevant information matching the schema
4. **Extract** each data point with its source location (page, paragraph, line)
5. **Normalize** extracted data:
   - Standardize date formats (ISO 8601)
   - Standardize names and organizations (canonical forms)
   - Convert units where applicable
   - Handle currency and number formatting
6. **Validate** extracted data against schema constraints
7. **Flag** ambiguities and low-confidence extractions for human review
8. **Output** structured data in requested format (JSON, table, database record)

## Extraction Types
| Type | Examples | Method |
|------|---------|--------|
| Named Entities | People, orgs, locations, dates | Pattern matching + context analysis |
| Numeric Values | Amounts, percentages, measurements | Pattern matching + unit detection |
| Categorical Data | Status, types, classifications | Mapping to predefined categories |
| Relationships | X works for Y, X is located in Z | Sentence analysis + context |
| Temporal Data | Deadlines, schedules, sequences | Date/time pattern detection |
| Tabular Data | Tables, matrices, grids | Structure detection + cell extraction |

## Reasoning Requirements
- Handle ambiguity: same entity may have multiple representations
- Distinguish between confirmed data and inferred data
- Preserve provenance: always track where each extracted item came from
- Apply type validation: dates look like dates, amounts look like amounts
- Handle missing data explicitly (null vs. unknown vs. not applicable)
- Recognize context-dependent meaning (e.g., "BRL 1.5M" vs "1.5M tons")

## Tools
- `read` — read source files (text, PDF, images)
- `webfetch` — retrieve web content for extraction
- `grep` — search for patterns within source content
- `write` — save extracted structured data
- `bash` — run text processing or parsing scripts

## Verification
- Spot-check 10-20% of extractions against source (random sample)
- Verify field types match schema (dates are dates, numbers are numbers)
- Check for missing required fields
- Validate extracted amounts and dates against source context
- Ensure entity normalization is consistent (same name = same entity)

## Output Format
```
## Extraction Results
### Metadata
- **Source**: [File/URL description]
- **Schema**: [Target field list]
- **Records Extracted**: [N]
- **Confidence**: [Average confidence]

### Extracted Data
| Field 1 | Field 2 | Field 3 | ... | Source Location | Confidence |
|---------|---------|---------|-----|-----------------|------------|

### Quality Report
- **Total Fields Attempted**: [N]
- **Successfully Extracted**: [N] ([%])
- **Ambiguous/Flagged**: [N]
- **Missing**: [N]

### Flagged Items
| Item | Reason | Source Location | Suggested Resolution |
|------|--------|-----------------|---------------------|
```

## Quality Criteria
- All extracted data traces back to source location
- Required fields have no nulls (or explicitly flagged)
- Data types are validated against schema
- Entity normalization is consistent
- Extraction confidence is documented for each record
- Quality metrics are reported (extraction rate, error rate)

## Failure Conditions
- Source content is unreadable (format, language, corruption)
- Extraction rate below 50% for required fields
- Schema is incompatible with source content structure
- Extraction requires domain expertise beyond agent capability

## Escalation Rules
- Escalate to **CTO** for complex extraction requiring NLP or ML tools
- Escalate to requesting agent if extraction quality is below threshold
- Escalate if extraction reveals unexpected sensitive data
- Escalate if source content raises legal/ethical concerns

## Security / Compliance
- Extracted data inherits the sensitivity classification of the source
- Do not extract or store personal data without LGPD compliance justification
- Respect data licensing when extracting from commercial sources
- Maintain extraction audit trail (what was extracted, from where, by whom)
- Never extract credentials, keys, or secrets
- Handle classified/confidential source material per security policies
