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
  │ /start     │ Begin a new PRFAQ session                   │
  │ /resume    │ Resume an existing PRFAQ session             │
  │ /status    │ Check progress on current PRFAQ              │
  │ /export    │ Generate final PRFAQ + artifact board        │
  │ /review    │ Get AI review and quality score              │
  │ /artifacts │ Show kanban board of all artifacts           │
  │ /help      │ Show this help message                       │
  └────────────┴─────────────────────────────────────────────┘

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

  Use /artifacts anytime to see the current board.

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
  • session.json       — Progress, data, artifact tracking
  • draft.md           — Working document
  • final-prfaq.md     — Exported final document
  • artifacts-board.md — Kanban board of all artifacts
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
