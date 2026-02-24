# Skill: PRFAQ Document Drafting

This skill defines how to compose a complete PRFAQ document from gathered and generated session data.

## Overview

Transform the user-provided Problem and Solution plus AI-generated Evidence, Product Positioning, Impact, Roadmap, and Risks into a polished, Amazon-style PRFAQ document.

## Input

Read the session's `session.json` to get all data across the 7 dimensions.

## Document Structure

### 1. Header Block

```markdown
---
Product: <Product Name>
Author: <to be filled>
Date: <current date>
Version: 1.0
Status: Draft
---
```

### 2. Executive Summary
Write a single paragraph (max 100 words) covering what, who, why, positioning, and why now.

### 3. Press Release Section
Standard press release format: Headline, Subheadline, Opening, Problem paragraph (with market data from Evidence), Solution paragraph, Customer Quote, How It Works bullets, Availability (from Roadmap), Call to Action.

### 4. Detailed Sections

#### 4a. Problem Deep-Dive [FROM USER INPUT]
Target persona, problem description, workarounds, frequency/severity, trends.

#### 4b. Evidence & Validation [AI-GENERATED — Synthesized from Deep Analysis]
Market Analysis summary (TAM/SAM/SOM headline numbers from market-analysis.md), Competitive Landscape summary (top competitors and key gaps from competitive-analysis.md), Pricing Context summary (market pricing range from pricing-analysis.md), Customer Evidence, Supporting Data.

**Important:** This section is a synthesis — keep it to 500-800 words. Link to the standalone deep-dive documents:
```markdown
> 📊 Deep Analysis Documents:
> - [Market Analysis](market-analysis.md) — Full TAM/SAM/SOM, revenue projections, market dynamics
> - [Competitive Analysis](competitive-analysis.md) — Landscape map, SWOT, feature matrix, battlecards
> - [Pricing Analysis](pricing-analysis.md) — Pricing model, tiers, margins, sensitivity analysis
> - [Pricing Spreadsheet](pricing-model.csv) — Revenue model and pricing tiers (Google Sheets)
```

#### 4c. Solution Details [FROM USER INPUT]
Customer journey, feature table, differentiation matrix, magic moment.

#### 4d. Product Positioning [AI-GENERATED]
Positioning Statement, Category Definition, Value Proposition, Key Messages, Target Segments table, Competitive Moat, Brand Voice & Tone.

#### 4e. Impact Analysis [AI-GENERATED]
Customer Impact table, Business Impact table, Strategic Impact narrative, Success Metrics list.

#### 4f. Phased Roadmap [AI-GENERATED]
Roadmap table (Private Preview, Public Preview, GA), Dependencies, Phase Transition Criteria.

#### 4g. Risks & Mitigations [AI-GENERATED]
Risk matrix table, Non-goals, Worst-case scenario, Compliance/security.

### 5. FAQ Section
External FAQs (7 customer-facing) and Internal FAQs (7+ stakeholder-facing), drawing from all dimensions.

**Internal FAQs must include these 3 questions synthesized from sub-agent findings:**
- **"What is our total addressable market and revenue opportunity?"** — Synthesize from market-analysis.md (TAM/SAM/SOM, 5-year revenue projection)
- **"How do we compare to competitors and where do we win?"** — Synthesize from competitive-analysis.md (key advantages, vulnerabilities, battlecard summary)
- **"What is the recommended pricing strategy and expected margins?"** — Synthesize from pricing-analysis.md (recommended model, tiers, LTV:CAC, gross margin)

### 6. Appendix
Data sources from Evidence research, Related documents, Glossary.

**Appendix B: Deep Analysis Documents**
List all standalone sub-agent documents with brief descriptions:
```markdown
## Appendix B: Deep Analysis Documents

These standalone reports provide in-depth analysis beyond the PRFAQ summary:

| Document | Description | File |
|----------|-------------|------|
| Market Analysis | TAM/SAM/SOM, revenue projections, market dynamics | market-analysis.md |
| Competitive Analysis | Landscape map, SWOT, feature matrix, battlecards | competitive-analysis.md |
| Pricing Analysis | Pricing model, tiers, margins, sensitivity analysis | pricing-analysis.md |
| Pricing Spreadsheet | Revenue model, pricing tiers (Google Sheets compatible) | pricing-model.csv |
```

## Writing Style Guidelines
- Customer-first language
- Active voice
- Specific over vague
- No jargon
- Short sentences (max 25 words)
- Short paragraphs (max 4 sentences)

## Section Labels
Mark AI-generated sections with a subtle `*[AI-generated from market research]*` note.

## Output
Write to `output/<product-name>/draft.md`.
