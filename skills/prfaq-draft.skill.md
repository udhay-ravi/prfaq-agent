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

#### 4b. Evidence & Validation [AI-GENERATED — Market & Competitive Analysis]
Market Analysis (TAM/SAM/SOM table), Competitive Landscape (feature comparison matrix), Customer Evidence, Supporting Data.

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
External FAQs (7 customer-facing) and Internal FAQs (7 stakeholder-facing), drawing from all dimensions.

### 6. Appendix
Data sources from Evidence research, Related documents, Glossary.

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
