# DATA ANALYSIS

Version: 1.0.0
Created: 2026-09-04
Updated: 2026-09-04
Owner: KRAEFEGG
Status: ACTIVE

## Purpose
Apply quantitative and qualitative analytical methods to structured and unstructured data. Transforms raw data into insights, patterns, trends, and actionable intelligence using statistical reasoning, visualization principles, and domain knowledge.

## Scope
Covers numerical data analysis (statistics, trend analysis, regression), categorical data analysis (classification, grouping), text/qualitative data analysis (thematic analysis, sentiment), and hybrid approaches. Applies to sensor data, financial data, market data, operational metrics, and survey/feedback data.

## When to Use
- When datasets require statistical or trend analysis
- Need to identify patterns, anomalies, or correlations in data
- Building or updating dashboards with KPIs and metrics
- Comparing performance across periods, segments, or categories
- Preparing data-driven recommendations or forecasts

## When NOT to Use
- For simple lookups or data retrieval without analysis
- When data quality is too poor for meaningful analysis (escalate first)
- For real-time streaming analysis (use dedicated pipeline)
- When analysis requires specialized tools not available (e.g., advanced ML)

## Required Inputs
- Dataset (file, database query, or inline data)
- Analysis objective (what question the data should answer)
- Data dictionary or schema (field definitions, units, types)
- Time period and scope of analysis

## Optional Inputs
- Historical baseline for comparison
- External variables for correlation analysis
- Target thresholds or benchmarks
- Visualization preferences

## Procedure
1. **Profile** the data: rows, columns, types, completeness, distributions
2. **Clean** data: handle missing values, outliers, duplicates, format inconsistencies
3. **Validate** data quality: completeness %, accuracy indicators, consistency checks
4. **Transform** if needed: aggregation, normalization, feature engineering
5. **Analyze** using appropriate methods:
   - Descriptive: mean, median, mode, variance, percentiles
   - Trend: time series decomposition, moving averages, seasonality
   - Comparative: A/B comparisons, segment analysis, benchmarking
   - Correlational: cross-tabulation, correlation coefficients (with caveats)
6. **Visualize** findings with appropriate chart types (bar, line, scatter, heatmap)
7. **Interpret** results in business/domain context
8. **Document** methodology, assumptions, and limitations
9. **Recommend** actions based on findings

## Reasoning Requirements
- Distinguish correlation from causation (always)
- Check statistical significance before drawing conclusions
- Account for sample size limitations and confidence intervals
- Recognize Simpson's paradox in segmented analysis
- Consider confounding variables in observational data
- Apply appropriate tests for data distribution (parametric vs. non-parametric)
- Never extrapolate trends indefinitely without justification

## Tools
- `bash` — run data processing scripts (Python, PowerShell)
- `read` — load data files for inspection
- `write` — save analysis results and visualizations
- `grep` — search for specific data patterns
- Python libraries (pandas, numpy, matplotlib) when available
- SQL for database queries where applicable

## Analysis Methods Reference
| Method | When to Use | Key Assumptions |
|--------|-------------|-----------------|
| Descriptive Stats | Understand data distribution | None; foundational |
| Trend Analysis | Time-ordered data patterns | Consistent time intervals |
| Segmentation | Group by categories | Meaningful categories defined |
| Correlation | Relationship between variables | Linear relationship assumed |
| Anomaly Detection | Find outliers/unusual patterns | Baseline "normal" defined |
| Regression | Predict or explain relationships | Appropriate model specification |

## Verification
- Data profiling reveals no unexpected nulls or type mismatches
- Summary statistics match manual spot-checks
- Trends are consistent across different time aggregations
- No single outlier is driving the entire result
- Analysis is reproducible (documented code/steps)

## Output Format
```
## Data Analysis: [Topic]
### Dataset Summary
- **Records**: [N] | **Fields**: [M] | **Period**: [date range]
- **Data Quality**: [completeness %, issues found]

### Key Metrics
| Metric | Value | Change vs. Baseline | Trend |
|--------|-------|---------------------|-------|

### Findings
1. [Insight with supporting data]
2. ...

### Visualizations
[Chart descriptions or references]

### Limitations
- [Data quality issues, missing data, assumptions]

### Recommendations
- [Data-driven action items]
```

## Quality Criteria
- All statistics include units and context
- Sample sizes are stated for any aggregated metric
- Trends include time period and rate of change
- Limitations and data quality issues are explicitly disclosed
- Analysis methodology is reproducible from documentation
- No cherry-picked timeframes to support predetermined conclusions

## Failure Conditions
- Data quality below 70% completeness for key fields
- Sample size too small for meaningful statistical inference
- Data conflicts with authoritative sources and cannot be reconciled
- Analysis reveals patterns that require specialized domain expertise to interpret

## Escalation Rules
- Escalate to **CTO** for technical data requiring specialized tools (ML, large-scale)
- Escalate to **CEO** if analysis reveals material business risk or opportunity
- Escalate to **Market-Segment** for market data requiring industry-specific interpretation
- Escalate if data quality issues are systemic (suggest upstream data pipeline problems)

## Security / Compliance
- Never include PII in analysis outputs without anonymization
- Respect data licensing and usage restrictions
- Comply with LGPD for personal data processing
- Document data lineage for audit purposes
- Do not export sensitive data to external tools without authorization
- Statistical results must not reveal individual-level data in aggregate reports
