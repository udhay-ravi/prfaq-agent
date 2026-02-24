# Skill: PRFAQ Review & Scoring

This skill defines how to review, score, and critique a PRFAQ document.

## Overview

Evaluate a PRFAQ document against a structured rubric, identify strengths and weaknesses, check for common anti-patterns, and provide an overall readiness assessment.

## Input

Read the session's `draft.md` or `final-prfaq.md` and `session.json`.

## Scoring Rubric

Score each dimension on a 1-5 scale:

### Dimension 1: Problem Statement

| Score | Criteria |
|-------|----------|
| 5 | Specific persona, quantified pain, clear frequency/severity, compelling urgency, trend analysis |
| 4 | Clear problem and persona, some quantification, good specificity |
| 3 | Problem is understandable but lacks specificity in persona or quantification |
| 2 | Vague problem statement, generic persona, no quantification |
| 1 | Problem is unclear, missing, or described from builder's perspective not customer's |

### Dimension 2: Evidence

| Score | Criteria |
|-------|----------|
| 5 | Multiple quantitative data points, direct customer quotes, competitive analysis, internal signals, data is recent and sourced |
| 4 | Good mix of quantitative and qualitative, most claims have sources |
| 3 | Some evidence provided but gaps in either quantitative or qualitative |
| 2 | Minimal evidence, mostly anecdotal, sources not cited |
| 1 | No evidence, or evidence is fabricated/unsubstantiated |

### Dimension 3: Solution

| Score | Criteria |
|-------|----------|
| 5 | Clear one-liner, detailed customer journey, strong differentiation, compelling magic moment, authentic customer quote |
| 4 | Good customer journey, clear features, solid differentiation |
| 3 | Solution is clear but customer experience or differentiation is weak |
| 2 | Solution described from builder's perspective, weak differentiation |
| 1 | Solution is vague, missing customer perspective, no clear value prop |

### Dimension 4: Impact

| Score | Criteria |
|-------|----------|
| 5 | Specific metrics with targets for business/customer/strategic impact, clear timeline, measurement plan |
| 4 | Good metrics with most having targets, reasonable timeline |
| 3 | Some metrics defined but targets are vague or timeline is unclear |
| 2 | Impact is described qualitatively without specific metrics or targets |
| 1 | Impact is missing or purely aspirational with no grounding |

### Dimension 5: Roadmap

| Score | Criteria |
|-------|----------|
| 5 | Clear 3-phase plan with specific features, timelines, audiences, and go/no-go criteria per phase |
| 4 | Good phased plan with most details, some go/no-go criteria |
| 3 | Phases defined but missing important details like criteria or dependencies |
| 2 | Roadmap is a feature list without phasing or criteria |
| 1 | No roadmap, or roadmap is a single undifferentiated timeline |

### Dimension 6: Risks & Tradeoffs

| Score | Criteria |
|-------|----------|
| 5 | Comprehensive risks across all categories, specific mitigations, clear non-goals, worst-case contingency, security/compliance addressed |
| 4 | Good risk identification with most having mitigation plans |
| 3 | Risks identified but mitigations are vague or some categories are missing |
| 2 | Minimal risks listed, no real mitigation plans |
| 1 | Risks are missing or dismissed ("no significant risks") |

## Anti-Pattern Checks

Check for these common PRFAQ mistakes:

| Anti-Pattern | Check | Status |
|---|---|---|
| **Solution-first thinking** | Does the problem section stand on its own without referencing the solution? | ✅/⚠️ |
| **Vague metrics** | Do all metrics have specific numeric targets? | ✅/⚠️ |
| **Missing customer voice** | Are there direct customer quotes (real or representative)? | ✅/⚠️ |
| **Builder language** | Is the document written from customer's perspective? | ✅/⚠️ |
| **Confirmation bias** | Does the evidence section acknowledge what would disprove the thesis? | ✅/⚠️ |
| **Hand-wavy risks** | Do all risks have specific, actionable mitigation plans? | ✅/⚠️ |
| **Kitchen sink roadmap** | Is the roadmap focused with clear phase boundaries? | ✅/⚠️ |
| **No urgency** | Is there a clear "why now?" | ✅/⚠️ |
| **Missing non-goals** | Does the doc explicitly state what is OUT of scope? | ✅/⚠️ |
| **Jargon overload** | Can a non-technical executive understand every section? | ✅/⚠️ |

## Overall Score Calculation

Overall = Average of all 6 dimension scores (rounded to 1 decimal)

## Readiness Assessment

- **🟢 READY** (4.0+): This PRFAQ is ready for leadership review. Minor polish may still help.
- **🟡 NEEDS WORK** (3.0-3.9): Good foundation but has gaps. Address the improvement areas before presenting.
- **🔴 NOT READY** (below 3.0): Significant sections need substantial work. Go back to gathering.

## Output Format

Produce the review in this structure:

1. **Overall Score** with visual indicator (★★★★☆ style)
2. **Per-Dimension Scores** in a table with brief justification
3. **Top 3 Strengths** — Be specific, reference actual content
4. **Top 3 Areas for Improvement** — Be actionable, suggest specific fixes
5. **Anti-Pattern Check** — Table of checks with ✅ or ⚠️
6. **Readiness Assessment** — One of the three levels above with explanation

## Improvement Suggestions

For each area of improvement, provide:
- **What's weak:** Specific description of the gap
- **Why it matters:** Impact on PRFAQ quality
- **How to fix it:** Concrete action (e.g., "Add 2-3 quantitative data points from customer surveys" not "improve evidence")
- **Example:** Show what a stronger version would look like
