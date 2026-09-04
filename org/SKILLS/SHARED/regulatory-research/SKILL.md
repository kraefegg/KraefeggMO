# REGULATORY RESEARCH

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Research, identify, and analyze legislation, regulations, standards, and compliance requirements applicable to KRAEFEGG operations and projects. Provides accurate legal/regulatory intelligence to support compliant operations and informed decision-making.

## Scope
Covers Brazilian federal, state, and municipal legislation; international regulations where applicable (IMO, ISPS, MARPOL, SOLAS, ISM); industry standards (NR-29, NR-01, NR-06, NR-35, STCW); LGPD; environmental regulations; and sector-specific compliance frameworks for port/maritime operations.

## When to Use
- Before starting operations in a new jurisdiction or sector
- When regulatory compliance is uncertain or contested
- During audit preparation or compliance assessment
- When regulations change and impact assessment is needed
- Before signing contracts that carry regulatory obligations
- When building compliance dashboards or tracking systems

## When NOT to Use
- For non-regulatory internal policies (use policy analysis)
- When the applicable regulation is already confirmed and documented
- For legal strategy decisions (escalate to legal counsel)
- When the query is purely theoretical with no compliance impact

## Required Inputs
- Jurisdiction (federal, state, municipal, international)
- Subject matter or activity requiring regulatory analysis
- Entity type and operational context (port, maritime, industrial)
- Timeframe (current requirements vs. upcoming changes)

## Optional Inputs
- Specific regulation numbers already known
- Industry sector classification
- Previous compliance assessment for comparison
- Risk tolerance for regulatory interpretation

## Procedure
1. **Define** scope: jurisdiction, subject, entity type, timeframe
2. **Identify** applicable regulatory hierarchy:
   - International: IMO conventions, bilateral treaties
   - Federal: Constitution > Leis > Decretos > Portarias > Resoluções
   - State/Municipal: complementary local legislation
   - Industry: NRs, ABNT norms, sector-specific standards
3. **Search** official sources: planalto.gov.br, DOU, state DOEs, IMO, ILO
4. **Extract** specific obligations: deadlines, requirements, penalties, reporting
5. **Analyze** applicability to the specific entity and operation
6. **Identify** compliance gaps between current state and requirements
7. **Map** penalties and enforcement mechanisms for non-compliance
8. **Track** upcoming regulatory changes and implementation deadlines
9. **Document** findings with exact legal citations and URLs

## Reasoning Requirements
- Apply legal hierarchy: superior law prevails over inferior norm
- Distinguish between mandatory ("obrigatório") and recommended ("recomendado")
- Account for grace periods and transition provisions
- Recognize that absence of explicit prohibition does not equal permission
- Consider regulatory intent when text is ambiguous
- Track changes over time — regulations evolve

## Key Regulatory Sources
| Source | URL/Access | Content |
|--------|-----------|---------|
| Planalto (federal) | planalto.gov.br | Federal legislation, decrees, portarias |
| DOU (Diário Oficial da União) | in.gov.br | Official publications, new regulations |
| IMO | imo.org | International maritime conventions |
| ILO | ilo.org | International labor standards |
| ANTAQ | antaq.gov.br | Port/maritime sector regulations |
| IBAMA | ibama.gov.br | Environmental licensing and compliance |
| ANP | anp.gov.br | Oil and gas regulations |
| State DOE portals | Varies by state | State-level legislation |

## Verification
- All cited regulations verified against official published text
- URLs point to official government/agency sources (not reprints)
- Regulation is currently in force (check for revocation or suspension)
- Applicability to entity type is correctly determined
- Penalties and deadlines are accurately stated

## Output Format
```
## Regulatory Research: [Topic]
### Jurisdiction
[Level and geographic scope]

### Applicable Regulations
| # | Regulation | Issuing Body | Subject | Status |
|---|-----------|-------------|---------|--------|

### Key Obligations
1. **[Obligation]** — Regulation: [Citation] — Deadline: [Date] — Penalty: [Description]

### Compliance Gaps
| Requirement | Current State | Gap | Risk Level | Remediation |
|-------------|--------------|-----|------------|-------------|

### Upcoming Changes
| Change | Effective Date | Impact | Preparation Needed |
|--------|---------------|--------|-------------------|

### Sources
[Official URLs with access dates]
```

## Quality Criteria
- Every regulation cited is verified against official published text
- Obligations include exact legal citations (Lei X, Art. Y, § Z)
- Penalties are stated with magnitude (fine range, suspension, criminal)
- Compliance gaps are tied to specific regulatory requirements
- Regulatory hierarchy is respected (superior norms listed first)
- Portuguese legal terminology is used accurately

## Failure Conditions
- Official regulatory source is unavailable or inconsistent
- Regulation is ambiguous and requires legal interpretation beyond agent scope
- New regulation has not yet been published in official gazette
- Cross-jurisdictional conflicts cannot be resolved

## Escalation Rules
- Always escalate legal interpretation questions to **CEO** or designated legal counsel
- Escalate to **CTO** for technical standards (NRs, ABNT) requiring engineering validation
- Escalate to **Market-Segment** for sector-specific regulatory analysis
- Escalate if regulatory analysis reveals immediate compliance risk

## Security / Compliance
- Use only official government and agency sources for regulatory text
- Never provide legal advice — provide legal research and analysis only
- Add disclaimer: "This is regulatory research, not legal counsel"
- Respect copyright of regulatory compilations
- Document all regulatory sources for audit trail
- Flag personal data handling requirements under LGPD
