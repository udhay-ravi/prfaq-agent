# PRFAQ Agent

An interactive Claude Code agent that guides product managers through creating Amazon-style PRFAQ (Press Release / Frequently Asked Questions) documents.

**You provide the Problem and Solution. The agent generates everything else.**

## What is a PRFAQ?

A PRFAQ is a product planning document popularized by Amazon's "Working Backwards" process. It starts with a fictional press release announcing the finished product, then works backwards to define the problem, evidence, solution, impact, roadmap, and risks.

## How It Works

This is a **Claude Code agent** — not a traditional application. You interact with it through Claude Code's conversational interface using slash commands.

### Quick Start

1. Open this project directory in Claude Code:
   ```
   cd prfaq-agent
   claude
   ```

2. **(Optional) Add your org's PRFAQs** to `samples/` to customize the generation style:
   ```
   cp ~/Documents/my-approved-prfaq.md samples/
   ```

3. Start a new PRFAQ session:
   ```
   /start
   ```

3. **Phase 1 — You answer questions** about two dimensions:
   - **Problem** — What customer problem are you solving?
   - **Solution** — What's your proposed solution (from the customer's perspective)?

4. **Phase 2 — The agent generates** the remaining five dimensions:
   - **Evidence** — Market analysis (TAM/SAM/SOM), competitive landscape, industry data
   - **Product Positioning** — Positioning statement, value prop, messaging pillars, target segments, competitive moat
   - **Impact** — Business and customer metrics with specific targets
   - **Roadmap** — Phased rollout plan (Private Preview, Public Preview, GA)
   - **Risks & Tradeoffs** — Risk matrix with mitigations, non-goals, worst-case scenarios

5. **Phase 3 — Review and refine** each section with your feedback.

6. Export the final document:
   ```
   /export
   ```

7. **View the artifact board** — see all ~32 produced artifacts in a kanban view:
   ```
   /artifacts
   ```

## Available Commands

| Command      | Description                                |
|--------------|-------------------------------------------|
| `/start`     | Begin a new PRFAQ session                  |
| `/resume`    | Resume an existing PRFAQ session           |
| `/status`    | Check progress on current PRFAQ            |
| `/export`    | Generate final PRFAQ document + artifacts  |
| `/review`    | Get AI review and quality score            |
| `/artifacts` | Show kanban board of all produced artifacts|
| `/help`      | Show all commands and tips                 |

## The 7 Dimensions

| # | Dimension | Source | What's Covered |
|---|-----------|--------|----------------|
| 1 | **Problem** | You provide | Customer pain point, persona, workarounds |
| 2 | **Solution** | You provide | Product experience, features, differentiators |
| 3 | **Evidence** | AI generates | Market size, competitive landscape, industry data |
| 4 | **Product Positioning** | AI generates | Positioning statement, segments, moat, messaging |
| 5 | **Impact** | AI generates | Business & customer metrics, success KPIs |
| 6 | **Roadmap** | AI generates | Private Preview, Public Preview, GA plan |
| 7 | **Risks & Tradeoffs** | AI generates | Risk matrix, mitigations, non-goals |

## Project Structure

```
prfaq-agent/
├── CLAUDE.md                    # Agent instructions (read by Claude Code)
├── .claude/commands/            # Slash command definitions
│   ├── start.md
│   ├── resume.md
│   ├── status.md
│   ├── export.md
│   ├── review.md
│   └── help.md
├── samples/                     # Drop your org's PRFAQs here
│   └── README.md                # Instructions for adding samples
├── skills/                      # Agent skill definitions
│   ├── prfaq-gather.skill.md    # Interactive gathering + AI generation
│   ├── prfaq-draft.skill.md     # Document composition
│   ├── prfaq-review.skill.md    # Quality review & scoring (7 dimensions)
│   ├── prfaq-export.skill.md    # Final document export
│   ├── prfaq-artifacts.skill.md # Kanban artifact board generation
│   └── prfaq-samples.skill.md   # Sample PRFAQ loader & style analyzer
├── templates/                   # Section templates with guidance
│   ├── prfaq-template.md        # Master PRFAQ template (12 sections)
│   ├── section-problem.md
│   ├── section-evidence.md
│   ├── section-solution.md
│   ├── section-positioning.md   # NEW: Product Positioning template
│   ├── section-impact.md
│   ├── section-roadmap.md
│   └── section-risks.md
├── examples/                    # Reference example
│   └── example-prfaq.md         # Complete example PRFAQ (all 7 dimensions)
├── output/                      # Generated PRFAQs (gitignored)
├── scripts/
│   └── init-session.sh          # Session initialization script
└── package.json
```

## Artifact Board

After export, the agent generates a kanban-style artifact board (`artifacts-board.md`) listing all ~32 artifacts produced during the session, organized into **Done**, **In Progress**, and **Todo** columns:

- **Core Documents** — session.json, draft.md, final-prfaq.md
- **PRFAQ Sections** — all 7 dimensions as discrete artifacts
- **Press Release Components** — headline, body paragraphs, customer quote, capabilities
- **Analysis Artifacts** — market sizing, competitive matrix, feature comparison, positioning statement, messaging pillars
- **Planning Artifacts** — impact metrics, roadmap table, go/no-go criteria, risk matrix, non-goals
- **FAQ Content** — 7 external + 7 internal Q&As
- **Supporting Materials** — executive summary, data sources, glossary

Use `/artifacts` anytime to see the current board.

## Custom Samples (Style Matching)

Drop your organization's existing PRFAQ documents into the `samples/` directory and the agent will automatically learn your style:

```
samples/
├── README.md                    ← Instructions
├── acme-cloudsync-prfaq.md      ← Your approved PRFAQ #1
├── acme-smartalerts-prfaq.md    ← Your approved PRFAQ #2
└── acme-databridge-prfaq.md     ← Your approved PRFAQ #3
```

**What the agent learns from your samples:**

| Aspect | What It Picks Up |
|--------|------------------|
| Tone & Voice | Formal vs. casual, technical depth, audience level |
| Structure | Section ordering, heading depth, custom sections |
| Metrics | KPI types, target format (absolute vs. relative), timeframes |
| Roadmap | Phase names, timeline granularity, go/no-go style |
| Positioning | Framework, messaging conventions, segment definitions |
| Terminology | Domain jargon, product names, internal terms |

2-3 approved PRFAQs give the best results. The agent stores a Style Profile in `session.json` and applies it to all AI-generated sections.

## Output

The agent produces a complete PRFAQ document in markdown format, including:
- Executive summary
- Press release with customer quote
- Problem deep-dive (from your input)
- Evidence with real market data and competitive analysis (AI-researched)
- Solution details (from your input)
- Product positioning with messaging framework (AI-generated)
- Impact analysis with specific metrics (AI-generated)
- Phased roadmap (AI-generated)
- Risk matrix with mitigations (AI-generated)
- External FAQs (customer-facing)
- Internal FAQs (stakeholder-facing)
- Appendix with data sources

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed and configured
- No other dependencies required

## License

MIT
