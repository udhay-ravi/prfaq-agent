Display the PRFAQ Agent help guide.

Show the following:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Agent — Help Guide
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Available Commands:
  ┌────────────┬─────────────────────────────────────────────┐
  │ Command    │ Description                                 │
  ├────────────┼─────────────────────────────────────────────┤
  │ /start               │ Begin a new PRFAQ session              │
  │ /resume              │ Resume an existing PRFAQ session        │
  │ /status              │ Check progress on current PRFAQ         │
  │ /export              │ Generate final PRFAQ + artifact board   │
  │ /save-as             │ Export as PDF, Google Doc, or HTML      │
  │ /review              │ Get AI review and quality score         │
  │ /artifacts           │ Show kanban board of all artifacts      │
  │ /market-analysis     │ Run deep market analysis sub-agent      │
  │ /competitive-analysis│ Run deep competitive analysis sub-agent │
  │ /pricing-analysis    │ Run pricing evaluation sub-agent        │
  │ /deep-analysis       │ Run all 3 sub-agents in sequence        │
  │ /help                │ Show this help message                  │
  └──────────────────────┴─────────────────────────────────────────┘

  The 7 Dimensions:
  ┌────┬──────────────────┬────────────────────────────────┐
  │ #  │ Dimension        │ Source                         │
  ├────┼──────────────────┼────────────────────────────────┤
  │ 1  │ Problem          │ 📝 You provide: pain point,   │
  │    │                  │ persona, workarounds            │
  │ 2  │ Solution         │ 📝 You provide: experience,   │
  │    │                  │ features, differentiators       │
  │ 3  │ Evidence         │ 🤖 AI generates: market        │
  │    │                  │ analysis, competitive landscape │
  │ 4  │ Positioning      │ 🤖 AI generates: positioning  │
  │    │                  │ statement, segments, moat       │
  │ 5  │ Impact           │ 🤖 AI generates: business &   │
  │    │                  │ customer metrics, success KPIs  │
  │ 6  │ Roadmap          │ 🤖 AI generates: Private      │
  │    │                  │ Preview → Public Preview → GA   │
  │ 7  │ Risks            │ 🤖 AI generates: risks,       │
  │    │                  │ mitigations, tradeoffs          │
  └────┴──────────────────┴────────────────────────────────┘

  How It Works:
  1. You answer questions about the Problem and Solution
  2. The agent researches your market and competitors
  3. The agent writes the remaining 5 sections for you
  4. You review and refine each section
  5. Export the final PRFAQ document + artifact board

  Artifact Board:
  After export, the agent generates a kanban board showing
  all ~32 artifacts produced during the session:
  • Core Documents (session, draft, final PRFAQ)
  • PRFAQ Sections (all 7 dimensions)
  • Press Release Components (headline, quote, etc.)
  • Analysis Artifacts (market sizing, competitive matrix)
  • Planning Artifacts (metrics, roadmap, risks)
  • FAQ Content (external + internal)
  • Supporting Materials (exec summary, appendix)

  • Market Analysis (TAM/SAM/SOM, revenue projections)
  • Competitive Analysis (landscape, SWOT, feature matrix)
  • Pricing Analysis (pricing model, tiers, spreadsheet)

  Use /artifacts anytime to see the current board.

  Deep Analysis Sub-Agents:
  Three specialized agents run deep analyses during Phase 2:
  • /market-analysis     → TAM/SAM/SOM, revenue projections
                           Output: market-analysis.md
  • /competitive-analysis → Landscape, SWOT, feature matrix
                           Output: competitive-analysis.md
  • /pricing-analysis    → Pricing model, tiers, sensitivity
                           Output: pricing-analysis.md + pricing-model.csv
  • /deep-analysis       → Runs all 3 in sequence
  These run automatically during PRFAQ generation, or
  you can run them standalone anytime.
  The pricing agent asks YOU for specific pricing questions.

  Export Formats:
  After exporting, use /save-as to convert to other formats:
  • PDF    — Styled document via pandoc or md-to-pdf
  • DOCX   — Upload-ready for Google Docs
  • HTML   — Styled web page with CSS
  • All    — Generate all formats at once
  The /export command also prompts for format after export.

  Tips for a Great PRFAQ:
  • Be specific about the problem — "users are frustrated" is too vague
  • Describe the solution from the customer's perspective
  • The agent will find real market data — but add your own if you have it
  • Review AI-generated sections carefully and provide feedback
  • A good PRFAQ should be understandable by anyone in the company

  Typical Workflow:
  1. /start     → Answer questions about Problem & Solution
  2. /status    → Check progress as AI generates sections
  3. /review    → Get feedback and quality score
  4. /export    → Generate final document + artifact board
  5. /artifacts → View kanban board of all deliverables

  Session Files:
  All your work is saved in output/<product-name>/
  • session.json             — Progress, data, artifact tracking
  • draft.md                 — Working document
  • market-analysis.md       — Deep market analysis (sub-agent)
  • competitive-analysis.md  — Deep competitive evaluation (sub-agent)
  • pricing-analysis.md      — Pricing strategy analysis (sub-agent)
  • pricing-model.csv        — Pricing spreadsheet (Google Sheets)
  • final-prfaq.md     — Exported final document
  • artifacts-board.md — Kanban board of all artifacts
  • final-prfaq.pdf    — PDF export (via /save-as)
  • final-prfaq.docx   — Google Doc export (via /save-as)
  • final-prfaq.html   — HTML export (via /save-as)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
