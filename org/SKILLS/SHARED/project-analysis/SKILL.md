# PROJECT ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Evaluate project feasibility, scope, resource requirements, timelines, dependencies, and risks. Provides structured analysis to support project selection, planning, monitoring, and recovery decisions. Ensures projects are well-defined before commitment.

## Scope
Covers feasibility studies, scope analysis, resource assessment, timeline estimation, dependency mapping, cost-benefit analysis, and project health assessments. Applies to technology projects, business initiatives, market entry projects, and operational improvements.

## When to Use
- Before approving a new project (feasibility study)
- When project scope is unclear or disputed
- During project planning for resource and timeline estimation
- When a project is off-track and needs recovery analysis
- Before committing significant resources to a project phase
- When comparing alternative project approaches
- For post-mortem analysis of completed projects

## When NOT to Use
- For routine tasks that don't require formal project analysis
- When the project is already well-defined with committed resources
- For operational monitoring without project-level decisions
- When the analysis scope is market-level (use market research)

## Required Inputs
- Project description and objectives
- Constraints (budget, timeline, resources, technology)
- Success criteria and definition of done
- Stakeholders and their expectations

## Optional Inputs
- Prior feasibility studies or project proposals
- Available resource inventory
- Similar completed projects for benchmarking
- Technology maturity assessment
- Vendor quotes or cost estimates

## Procedure
1. **Define** project scope: objectives, deliverables, boundaries (in/out)
2. **Assess** feasibility across dimensions:
   - Technical: Can it be built/done with available or acquirable technology?
   - Economic: Does the ROI justify the investment?
   - Operational: Will it integrate with current operations?
   - Schedule: Can it be delivered within the required timeframe?
   - Legal/Regulatory: Are there compliance requirements?
   - Resource: Do we have or can we acquire the needed skills?
3. **Estimate** resources: people, tools, infrastructure, time, budget
4. **Map** dependencies: internal (other projects) and external (vendors, regulators)
5. **Identify** critical path and key milestones
6. **Assess** project risks (using risk analysis skill)
7. **Compare** alternative approaches if applicable (using comparison analysis)
8. **Build** cost-benefit analysis with assumptions stated
9. **Recommend** go/no-go with conditions
10. **Define** monitoring metrics and health indicators

## Feasibility Dimensions
| Dimension | Key Questions | Acceptance Criteria |
|-----------|--------------|-------------------|
| Technical | Technology available? Integration possible? Scalable? | Proof of concept or equivalent evidence |
| Economic | ROI positive? Payback acceptable? Budget available? | NPV > 0 or strategic alignment |
| Operational | Fits current workflows? Team can adopt? | Operational readiness plan in place |
| Schedule | Timeline realistic? Critical path identified? | Milestones achievable with 20% buffer |
| Regulatory | Compliance requirements known? Permits needed? | All regulatory paths identified |
| Resource | Skills available? Hiring feasible? Training needed? | Resource plan with 80%+ confidence |

## Reasoning Requirements
- Apply reference class forecasting (use data from similar past projects)
- Include contingency reserves (schedule: 20-30%, budget: 15-25%)
- Consider opportunity cost (what else could resources be doing?)
- Distinguish between must-haves and nice-to-haves in scope
- Apply skeptical estimation (actuals are typically 1.5-2x estimates)
- Account for integration complexity with existing systems

## Tools
- `websearch` — technology benchmarks, industry project data
- `read` — project proposals, technical documentation, prior project data
- `write` — create feasibility studies and project analysis reports
- `bash` — run project estimation tools or calculations

## Verification
- Resource estimates validated against industry benchmarks
- Timeline includes realistic dependencies and buffers
- Cost-benefit analysis assumptions are explicitly stated
- Scope is unambiguous (measurable deliverables, not vague goals)
- Risks are identified with mitigations, not just listed

## Output Format
```
## Project Analysis: [Project Name]
### Feasibility Assessment
| Dimension | Status | Confidence | Notes |
|-----------|--------|------------|-------|
| Technical | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |
| Economic | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |
| Operational | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |
| Schedule | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |
| Regulatory | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |
| Resource | FEASIBLE / MARGINAL / INFEASIBLE | H/M/L | |

### Scope Definition
- **In Scope**: [Specific deliverables]
- **Out of Scope**: [Explicit exclusions]
- **Assumptions**: [Key assumptions that affect feasibility]

### Resource Requirements
| Resource | Quantity | Duration | Source | Cost Estimate |
|----------|----------|----------|--------|---------------|

### Timeline
[Milestone → target date → dependencies]

### Cost-Benefit Summary
- **Investment Required**: [Total estimated cost]
- **Expected Benefits**: [Revenue increase / cost reduction / strategic value]
- **ROI / Payback**: [Key financial metrics]
- **NPV**: [If applicable]

### Risk Summary
[Top 5 project risks with mitigation]

### Recommendation
- **Decision**: GO / NO-GO / CONDITIONAL GO
- **Conditions**: [What must be true for GO]
- **Next Steps**: [Immediate actions if approved]
```

## Quality Criteria
- All six feasibility dimensions are assessed (no blind spots)
- Estimates include confidence ranges, not just point estimates
- Cost-benefit analysis is based on stated, reasonable assumptions
- Critical path is identified with key dependencies mapped
- Recommendation is tied to feasibility findings
- Resource requirements account for learning curves and ramp-up

## Failure Conditions
- Project scope cannot be defined clearly enough for analysis
- Technical feasibility requires proof-of-concept not yet performed
- Cost-benefit analysis shows negative ROI with no strategic justification
- Required resources are unavailable and cannot be acquired

## Escalation Rules
- Escalate go/no-go decisions to **CEO** for projects above investment threshold
- Escalate technical feasibility to **CTO** for technology-dependent projects
- Escalate if project analysis reveals strategic conflicts or dependency issues
- Escalate resource conflicts to organizational leadership

## Security / Compliance
- Project analysis may contain commercially sensitive information — classify appropriately
- Respect confidentiality of vendor pricing and proposals
- Document all assumptions for audit trail
- Comply with procurement policies for resource acquisition
- Ensure project scope includes necessary compliance activities
- LGPD: projects processing personal data must include privacy-by-design
