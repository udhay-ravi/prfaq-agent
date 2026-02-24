# Skill: PRFAQ Export

This skill defines how to produce the final, polished PRFAQ document.

## Overview

Take the drafted PRFAQ content and produce a clean, well-formatted final document ready for distribution and review.

## Input

Read the session's `draft.md` and `session.json`.

## Export Process

### Step 1: Validate Completeness

Check that all required sections exist in the draft:
- [ ] Executive Summary
- [ ] Press Release (headline, subheadline, body, customer quote)
- [ ] Problem Deep-Dive
- [ ] Evidence & Validation
- [ ] Solution Details
- [ ] Impact Analysis
- [ ] Phased Roadmap
- [ ] Risks & Mitigations
- [ ] External FAQs
- [ ] Internal FAQs

For any missing sections, either:
- Generate from `session.json` data if available
- Mark as `[TODO: Section incomplete — run /resume to complete gathering]`

### Step 2: Format & Polish

Apply consistent formatting:

**Document Header:**
```markdown
---
title: "PRFAQ: <Product Name>"
author: "<Author>"
date: <YYYY-MM-DD>
version: "1.0"
status: "Draft"
classification: "Internal"
---
```

**Table of Contents:**
Generate a linked TOC:
```markdown
## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Press Release](#press-release)
3. [Problem Statement](#problem-statement)
4. [Evidence & Validation](#evidence--validation)
5. [Solution](#solution)
6. [Impact Analysis](#impact-analysis)
7. [Roadmap](#roadmap)
8. [Risks & Tradeoffs](#risks--tradeoffs)
9. [FAQs — External](#faqs--external)
10. [FAQs — Internal](#faqs--internal)
11. [Appendix](#appendix)
```

**Formatting Rules:**
- Use `##` for major sections, `###` for subsections
- Tables should use proper markdown table syntax with alignment
- Blockquotes (`>`) for customer quotes
- Bold (`**`) for emphasis, not ALL CAPS
- Bullet lists for 3+ items, numbered lists for sequential steps
- Horizontal rules (`---`) between major sections
- No orphan headers (every header must have content below it)

### Step 3: Quality Pass

Before writing the final file:
- Remove any placeholder text or [TODO] markers (or flag them clearly)
- Check that all tables render correctly
- Ensure customer quotes are in blockquote format
- Verify the roadmap table has all three phases
- Check that metrics have specific numbers, not percentages without context
- Ensure the executive summary is under 100 words
- Remove duplicate content between sections

### Step 4: Write Final Document

Write the polished document to: `output/<product-name>/final-prfaq.md`

### Step 5: Update Session

Update `session.json`:
```json
{
  "status": "exported",
  "exportedAt": "<ISO timestamp>",
  "exportFile": "final-prfaq.md"
}
```

## Final Document Template

```markdown
---
title: "PRFAQ: <Product Name>"
author: "<Author>"
date: <date>
version: "1.0"
status: "Draft"
---

# PRFAQ: <Product Name>

## Table of Contents
[auto-generated]

---

## Executive Summary

[100 words max — what, who, why, why now]

---

## Press Release

### <Headline>

#### <Subheadline>

**<City>, <Date>** — [Opening paragraph]

[Problem paragraph]

[Solution paragraph]

> "[Customer quote]," said [Name], [Title] at [Company].

**Key Capabilities:**
- [Capability 1]
- [Capability 2]
- [Capability 3]

**Availability:** [Availability details]

[Call to action]

---

## Problem Statement

### Target Customer
[Detailed persona]

### The Problem
[Problem description]

### Current Workarounds
[How customers deal with it today]

### Frequency & Severity
[How often, how bad]

---

## Evidence & Validation

### Quantitative Data
| Metric | Value | Source |
|--------|-------|--------|
| ... | ... | ... |

### Customer Voice
> "[Direct quote]" — [Name, Role]

### Competitive Landscape
[Analysis]

### Internal Signals
[Data points]

---

## Solution

### One-Liner
[Single sentence]

### Customer Journey
1. [Step 1]
2. [Step 2]
...

### Key Features
| Feature | Description | Customer Benefit |
|---------|-------------|-----------------|
| ... | ... | ... |

### Differentiation
[What makes this unique]

### The Magic Moment
[Description]

---

## Impact Analysis

### Customer Impact
| Metric | Current | Target | Timeline |
|--------|---------|--------|----------|
| ... | ... | ... | ... |

### Business Impact
| Metric | Current | Target | Timeline |
|--------|---------|--------|----------|
| ... | ... | ... | ... |

### Strategic Impact
[Narrative]

### Success Metrics
1. [Metric 1 with target]
2. [Metric 2 with target]
3. [Metric 3 with target]

---

## Roadmap

| Aspect | Private Preview | Public Preview | GA |
|--------|----------------|----------------|----|
| Timeline | ... | ... | ... |
| Features | ... | ... | ... |
| Audience | ... | ... | ... |
| Success Criteria | ... | ... | ... |
| Go/No-Go | — | ... | ... |

### Dependencies
[List]

---

## Risks & Tradeoffs

| Risk | Category | Likelihood | Impact | Mitigation |
|------|----------|------------|--------|------------|
| ... | ... | ... | ... | ... |

### Non-Goals
[What we're explicitly NOT doing]

### Worst-Case Scenario
[Description and contingency]

### Compliance & Security
[Considerations]

---

## FAQs — External

**Q: [Question]?**
A: [Answer]

[Repeat for 5-7 questions]

---

## FAQs — Internal

**Q: [Question]?**
A: [Answer]

[Repeat for 5-7 questions]

---

## Appendix

### Data Sources
[Referenced data and sources]

### Related Documents
[Links to related work]

### Glossary
[Terms defined, if any]
```

## Output Summary

After writing the file, display:
- File path
- Word count
- Section count
- Any [TODO] markers remaining
- Suggestion to run `/review` if not already done
