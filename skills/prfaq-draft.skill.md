# Skill: PRFAQ Document Drafting

This skill defines how to compose a complete PRFAQ document from gathered session data.

## Overview

Transform the raw data gathered across all 6 dimensions into a polished, Amazon-style PRFAQ document. The output should read as a professional product document that could be presented to leadership.

## Input

Read the session's `session.json` to get all gathered data across the 6 dimensions.

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

Write a single paragraph (max 100 words) that captures:
- What the product is
- Who it's for
- What problem it solves
- Why now

This should be understandable by anyone in the company without context.

### 3. Press Release Section

Write the press release in this exact structure:

**Headline:** A compelling, customer-centric headline (not a feature name). Format: `<Company> Announces <Product> to Help <Customers> <Achieve Outcome>`

**Subheadline:** One sentence expanding on the headline with a key differentiator or metric.

**City, Date —** Opening paragraph (2-3 sentences):
- What is being launched
- Who is it for
- What's the key benefit

**Problem paragraph** (2-3 sentences):
- Describe the customer pain point
- Quantify the problem where possible
- Connect to broader industry trend

**Solution paragraph** (2-3 sentences):
- How the product solves the problem
- Key capabilities (high-level, not feature list)
- The customer experience in a nutshell

**Customer Quote:**
Use the mock customer quote from the Solution dimension. Format:
> "Quote text here," said [Name], [Title] at [Company]. "[Second sentence about impact or transformation]."

**How It Works** (3-5 bullet points):
- Each bullet = one key capability
- Written from customer's perspective ("You can..." or "Customers can...")
- Specific, not vague

**Availability paragraph:**
Reference the roadmap phases — when Private Preview starts, expected GA timeline.

**Call to Action:**
How interested customers can learn more or sign up.

### 4. Detailed Sections

#### 4a. Problem Deep-Dive
Expand the press release's problem paragraph into a full section:
- Target customer persona (detailed)
- Problem description with specifics
- Current workarounds and their limitations
- Frequency and severity analysis
- Trend analysis (is it getting worse?)

#### 4b. Evidence & Validation
Present all evidence in a structured way:
- **Quantitative Data:** Metrics, surveys, usage data (use a table)
- **Qualitative Data:** Customer quotes, support themes (use blockquotes)
- **Market Analysis:** Competitive landscape, market size
- **Internal Signals:** Feature requests, escalations, lost deals

#### 4c. Solution Details
Expand on the press release's solution:
- Detailed customer journey (step-by-step)
- Feature breakdown (table format: Feature | Description | Customer Benefit)
- Differentiation matrix (vs. alternatives)
- The "magic moment" description

#### 4d. Impact Analysis
Structure impact in three categories:
- **Customer Impact** (table: Metric | Current State | Target State | Timeline)
- **Business Impact** (table: same format)
- **Strategic Impact** (narrative)
- **Success Metrics** (numbered list with specific targets)

#### 4e. Phased Roadmap
Present as a table:

| Aspect | Private Preview | Public Preview | GA |
|--------|----------------|----------------|----|
| Timeline | Q? 20?? | Q? 20?? | Q? 20?? |
| Features | ... | ... | ... |
| Audience | ... | ... | ... |
| Success Criteria | ... | ... | ... |
| Go/No-Go | — | ... | ... |

Include dependencies below the table.

#### 4f. Risks & Mitigations
Present as a matrix:

| Risk | Category | Likelihood | Impact | Mitigation |
|------|----------|------------|--------|------------|
| ... | Technical | High/Med/Low | High/Med/Low | ... |

Include:
- Explicit non-goals (what we're choosing NOT to do)
- Worst-case scenario and contingency
- Security/compliance/regulatory notes

### 5. FAQ Section

Generate two sets of FAQs from the gathered data:

**External FAQs** (customer-facing, 5-7 questions):
- "What is <Product>?"
- "Who is this for?"
- "How is this different from <competitor/alternative>?"
- "When will this be available?"
- "How much will it cost?"
- "What about my existing <workflow/data>?"
- "How do I get started?"

**Internal FAQs** (stakeholder-facing, 5-7 questions):
- "Why should we build this now?"
- "What's the expected revenue/growth impact?"
- "What are the biggest risks?"
- "What resources do we need?"
- "How does this fit our overall strategy?"
- "What are we explicitly NOT doing?"
- "What's the competitive response risk?"

### 6. Appendix

- Data sources referenced
- Related documents or prior art
- Glossary of terms (if any jargon was used)

## Writing Style Guidelines

- **Customer-first language:** "Customers can..." not "We built..."
- **Active voice:** "The product reduces..." not "Time is reduced by..."
- **Specific over vague:** "Reduces deployment time from 3 hours to 10 minutes" not "Significantly improves deployment speed"
- **No jargon:** If a term must be used, define it
- **Short sentences:** Max 25 words per sentence
- **Short paragraphs:** Max 4 sentences per paragraph

## Output

Write the complete document to `output/<product-name>/draft.md`, replacing any existing draft.
