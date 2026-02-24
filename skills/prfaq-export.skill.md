# Skill: PRFAQ Export

This skill defines how to produce the final, polished PRFAQ document.

## Export Process

### Step 1: Validate Completeness
Check all 12 sections exist: Executive Summary, Press Release, Problem, Evidence, Solution, Product Positioning, Impact, Roadmap, Risks, External FAQs, Internal FAQs, Appendix.

### Step 2: Format & Polish
Apply consistent formatting. TOC should include Product Positioning as section 6.

```markdown
## Table of Contents
1. [Executive Summary](#executive-summary)
2. [Press Release](#press-release)
3. [Problem Statement](#problem-statement)
4. [Evidence & Validation](#evidence--validation)
5. [Solution](#solution)
6. [Product Positioning](#product-positioning)
7. [Impact Analysis](#impact-analysis)
8. [Roadmap](#roadmap)
9. [Risks & Tradeoffs](#risks--tradeoffs)
10. [FAQs — External](#faqs--external)
11. [FAQs — Internal](#faqs--internal)
12. [Appendix](#appendix)
```

### Step 3: Quality Pass
Verify all sections, tables, quotes, metrics, Product Positioning subsections, Evidence sources.

### Step 4: Write Final Document
Write to `output/<product-name>/final-prfaq.md`

### Step 5: Update Session
Set status to "exported" with timestamp.

## Output Summary
Display file path, word count, section count (12), TODO markers, review suggestion.
