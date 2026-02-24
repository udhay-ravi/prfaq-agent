# Skill: PRFAQ Artifact Board Generation

This skill defines how to generate a kanban-style artifact board that lists all produced artifacts from a PRFAQ session, organized by status.

## Overview

After a PRFAQ is exported (or at any time via `/artifacts`), generate a comprehensive kanban board showing every artifact produced during the session — documents, sections, data, and deliverables — organized into Todo, In Progress, and Done columns.

## Artifact Categories

Every PRFAQ session produces artifacts across these categories:

### Category 1: Core Documents
- `session.json` — Session data and progress tracking
- `draft.md` — Working PRFAQ document
- `final-prfaq.md` — Exported final document

### Category 2: PRFAQ Sections (7 Dimensions)
Each dimension produces a discrete artifact:
- Problem Statement section
- Solution section
- Evidence & Market Analysis section
- Product Positioning section
- Impact Analysis section
- Roadmap section
- Risks & Tradeoffs section

### Category 3: Press Release Components
- Press Release headline & subheadline
- Press Release body (problem, solution, availability paragraphs)
- Customer quote
- Key capabilities list

### Category 4: Analysis Artifacts
- Market sizing data (TAM/SAM/SOM)
- Competitive landscape matrix
- Feature comparison table
- Customer evidence narratives
- Positioning statement
- Messaging pillars
- Target segment analysis

### Category 5: Planning Artifacts
- Success metrics & KPIs
- Phased roadmap table
- Go/no-go criteria
- Dependency list
- Risk mitigation matrix
- Non-goals list

### Category 6: FAQ Content
- External FAQs (7 customer-facing Q&As)
- Internal FAQs (7 stakeholder-facing Q&As)

### Category 7: Supporting Materials
- Executive summary
- Data sources appendix
- Glossary

## Kanban Board Generation

### Board Structure

Generate the artifact board as a markdown file at `output/<product-name>/artifacts-board.md` with three columns:

```markdown
# PRFAQ Artifact Board: <Product Name>

> Generated: <timestamp>
> Session: output/<slug>/
> Status: <Exported / In Progress / Draft>

---

## Kanban View

### ✅ Done (<count>)
_These artifacts have been completed_

| # | Artifact | Category | Source | File |
|---|----------|----------|--------|------|
| 1 | ... | ... | ... | ... |

### 🔄 In Progress (<count>)
_These artifacts are being worked on_

| # | Artifact | Category | Source | File |
|---|----------|----------|--------|------|
| 1 | ... | ... | ... | ... |

### ⬚ Todo (<count>)
_These artifacts haven't been started yet_

| # | Artifact | Category | Source | File |
|---|----------|----------|--------|------|
| 1 | ... | ... | ... | ... |
```

### Status Rules

Determine artifact status from `session.json`:

**Done** ✅ — Artifact exists and is complete:
- Dimension status is `"complete"` in session.json
- Document has been written to disk
- Section has content in draft.md

**In Progress** 🔄 — Artifact is partially complete:
- Dimension status is `"in-progress"`
- Document exists but is incomplete
- Section has placeholder content

**Todo** ⬚ — Artifact hasn't been started:
- Dimension status is `"not-started"`
- Document doesn't exist
- Section is still template placeholder

### Full Artifact List

Generate these artifacts for a complete PRFAQ (total ~30 artifacts):

```
CORE DOCUMENTS:
  [D1] Session data file (session.json)
  [D2] Working draft (draft.md)
  [D3] Final PRFAQ document (final-prfaq.md)

PRFAQ SECTIONS:
  [S1] Problem Statement — target persona, pain points, workarounds
  [S2] Solution — one-liner, customer journey, features, magic moment
  [S3] Evidence & Market Analysis — TAM/SAM/SOM, competitive landscape
  [S4] Product Positioning — positioning statement, segments, moat
  [S5] Impact Analysis — customer/business/strategic impact metrics
  [S6] Roadmap — Private Preview, Public Preview, GA plan
  [S7] Risks & Tradeoffs — risk matrix, mitigations, non-goals

PRESS RELEASE:
  [PR1] Headline & subheadline
  [PR2] Opening paragraph (what, who, benefit)
  [PR3] Problem paragraph (pain, quantification, trend)
  [PR4] Solution paragraph (how, capabilities, experience)
  [PR5] Customer quote
  [PR6] Key capabilities list (3-5 bullets)
  [PR7] Availability & call to action

ANALYSIS ARTIFACTS:
  [A1] Market sizing table (TAM/SAM/SOM with sources)
  [A2] Competitive landscape matrix
  [A3] Feature comparison table
  [A4] Customer evidence narratives
  [A5] Positioning statement (For...who...is a...that...Unlike...)
  [A6] Key messaging pillars (3-5 messages)
  [A7] Target segment prioritization table

PLANNING ARTIFACTS:
  [P1] Customer impact metrics table
  [P2] Business impact metrics table
  [P3] Success KPIs (3-5 measurable targets)
  [P4] Phased roadmap table (3 phases)
  [P5] Go/no-go criteria per phase
  [P6] Dependencies & prerequisites list
  [P7] Risk mitigation matrix
  [P8] Non-goals & explicit exclusions
  [P9] Worst-case scenario & contingency plan

FAQ CONTENT:
  [F1] External FAQs (7 customer-facing)
  [F2] Internal FAQs (7 stakeholder-facing)

SUPPORTING:
  [X1] Executive summary (100 words)
  [X2] Data sources appendix
  [X3] Glossary of terms
```

### Board Display Format

When showing the board to the user (in the terminal via `/artifacts`), use this visual format:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Artifact Board: <Product Name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

┌─────────────────────────┬──────────────────────────┬──────────────────────────┐
│  ✅ Done (24)           │  🔄 In Progress (3)      │  ⬚ Todo (5)              │
├─────────────────────────┼──────────────────────────┼──────────────────────────┤
│                         │                          │                          │
│  [D1] Session data      │  [P4] Roadmap table      │  [X2] Data sources       │
│  📄 session.json        │  ⚙️ AI generating...      │                          │
│                         │                          │  [X3] Glossary           │
│  [D2] Working draft     │  [P5] Go/no-go criteria  │                          │
│  📄 draft.md            │  ⚙️ AI generating...      │  [F2] Internal FAQs      │
│                         │                          │                          │
│  [S1] Problem Statement │  [P7] Risk matrix        │  [D3] Final document     │
│  📝 User input          │  ⚙️ AI generating...      │  📄 Run /export          │
│                         │                          │                          │
│  [S2] Solution          │                          │                          │
│  📝 User input          │                          │                          │
│                         │                          │                          │
│  [S3] Evidence          │                          │                          │
│  🤖 AI generated        │                          │                          │
│                         │                          │                          │
│  [S4] Positioning       │                          │                          │
│  🤖 AI generated        │                          │                          │
│                         │                          │                          │
│  [PR1] Headline         │                          │                          │
│  🤖 AI generated        │                          │                          │
│                         │                          │                          │
│  [A1] Market sizing     │                          │                          │
│  🤖 AI generated        │                          │                          │
│                         │                          │                          │
│  ... (+16 more)         │                          │                          │
│                         │                          │                          │
└─────────────────────────┴──────────────────────────┴──────────────────────────┘

  Total: 32 artifacts  |  24 done  |  3 in progress  |  5 todo
  Files: output/<slug>/artifacts-board.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## When to Generate

1. **After /export completes** — Automatically generate the full artifact board with everything in "Done"
2. **Via /artifacts command** — Generate current state showing real-time progress
3. **After each dimension completes** — Update the artifact board file incrementally

## Artifact Board File

Always save the board to `output/<product-name>/artifacts-board.md` in the full markdown table format so it can be viewed in any markdown viewer or GitHub.

## Artifact Tracking in session.json

Add an `artifacts` section to session.json that tracks each artifact:

```json
{
  "artifacts": {
    "total": 32,
    "done": 24,
    "inProgress": 3,
    "todo": 5,
    "items": [
      { "id": "D1", "name": "Session data file", "category": "Core Documents", "status": "done", "source": "system", "file": "session.json" },
      { "id": "S1", "name": "Problem Statement", "category": "PRFAQ Sections", "status": "done", "source": "user-input" },
      { "id": "A1", "name": "Market sizing table", "category": "Analysis Artifacts", "status": "done", "source": "ai-generated" },
      ...
    ]
  }
}
```
