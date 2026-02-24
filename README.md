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
   Or run in **auto mode** for a hands-off experience:
   ```
   /auto
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
| `/start`               | Begin a new PRFAQ session                         |
| `/resume`              | Resume an existing PRFAQ session                  |
| `/status`              | Check progress on current PRFAQ                   |
| `/export`              | Generate final PRFAQ document + artifacts         |
| `/save-as`             | Export as PDF, Google Doc (DOCX), or HTML         |
| `/review`              | Get AI review and quality score                   |
| `/artifacts`           | Show kanban board of all produced artifacts       |
| `/market-analysis`     | Run deep market analysis (TAM/SAM/SOM)            |
| `/competitive-analysis`| Run deep competitive evaluation                   |
| `/pricing-analysis`    | Run pricing evaluation + spreadsheet              |
| `/deep-analysis`       | Run all 3 analysis sub-agents in sequence         |
| `/auto`                | Full pipeline end-to-end with minimal interruptions |
| `/help`                | Show all commands and tips                        |

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
│   ├── save-as.md
│   ├── review.md
│   ├── market-analysis.md
│   ├── competitive-analysis.md
│   ├── pricing-analysis.md
│   ├── deep-analysis.md
│   ├── auto.md
│   └── help.md
├── samples/                     # Drop your org's PRFAQs here
│   └── README.md                # Instructions for adding samples
├── skills/                      # Agent skill definitions
│   ├── prfaq-gather.skill.md    # Interactive gathering + AI generation
│   ├── prfaq-draft.skill.md     # Document composition
│   ├── prfaq-review.skill.md    # Quality review & scoring (7 dimensions)
│   ├── prfaq-export.skill.md    # Final document export
│   ├── prfaq-artifacts.skill.md # Kanban artifact board generation
│   ├── prfaq-samples.skill.md   # Sample PRFAQ loader & style analyzer
│   ├── prfaq-formats.skill.md   # PDF, DOCX, HTML export formats
│   ├── market-analysis.skill.md  # Deep market analysis sub-agent
│   ├── competitive-analysis.skill.md # Deep competitive eval sub-agent
│   └── pricing-analysis.skill.md # Pricing evaluation sub-agent
├── templates/                   # Section templates with guidance
│   ├── prfaq-template.md        # Master PRFAQ template (12 sections)
│   ├── section-problem.md
│   ├── section-evidence.md
│   ├── section-solution.md
│   ├── section-positioning.md   # NEW: Product Positioning template
│   ├── section-impact.md
│   ├── section-roadmap.md
│   ├── section-risks.md
│   ├── prfaq-style.css         # CSS for HTML/PDF export styling
│   └── pricing-model-template.csv # Pricing spreadsheet template
├── examples/                    # Reference example
│   └── example-prfaq.md         # Complete example PRFAQ (all 7 dimensions)
├── output/                      # Generated PRFAQs (gitignored)
├── scripts/
│   └── init-session.sh          # Session initialization script
└── package.json
```

## Artifact Board

After export, the agent generates a kanban-style artifact board (`artifacts-board.md`) listing all ~51 artifacts produced during the session, organized into **Done**, **In Progress**, and **Todo** columns:

- **Core Documents** — session.json, draft.md, final-prfaq.md
- **PRFAQ Sections** — all 7 dimensions as discrete artifacts
- **Press Release Components** — headline, body paragraphs, customer quote, capabilities
- **Analysis Artifacts** — market sizing, competitive matrix, feature comparison, positioning statement, messaging pillars
- **Planning Artifacts** — impact metrics, roadmap table, go/no-go criteria, risk matrix, non-goals
- **FAQ Content** — 7 external + 7+ internal Q&As
- **Supporting Materials** — executive summary, data sources, glossary
- **Market Analysis** — TAM calculation, SAM breakdown, SOM capture, revenue model, drivers & headwinds (MD + PDF + DOCX)
- **Competitive Analysis** — landscape map, feature matrix, SWOT analyses, win/loss framework, strategic recommendations (MD + PDF + DOCX + CSV)
- **Pricing Analysis** — pricing document, CSV spreadsheet, benchmarks, revenue model, tier recommendations, margin analysis, sensitivity analysis (MD + PDF + DOCX + CSV)

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

## Deep Analysis Sub-Agents

During Phase 2, the PRFAQ agent runs three specialized sub-agents that each produce standalone deep-dive documents:

### Market Analysis Agent (`/market-analysis`)
Produces a 2,000-4,000 word standalone report with auto-export:
- TAM calculation (top-down + bottom-up methods)
- SAM refinement with segment breakdown
- SOM with year-by-year capture rate analysis
- 5-year revenue projection model with scenario analysis
- Market growth drivers and headwinds
- Adjacent market opportunities
- **Output:** `market-analysis.md` / `.pdf` / `.docx` (Google Doc)

### Competitive Analysis Agent (`/competitive-analysis`)
Produces a 2,000-4,000 word standalone report + analysis spreadsheet:
- Competitive landscape map (direct, indirect, emerging)
- Deep dive into top 3-5 competitors with SWOT analysis
- Feature-by-feature comparison matrix (15+ features)
- Pricing and GTM strategy comparison
- Win/loss analysis framework with battlecards
- Strategic positioning recommendations
- **Output:** `competitive-analysis.md` / `.pdf` / `.docx` (Google Doc) + `competitive-matrix.csv` (Google Sheets)

### Pricing Evaluation Agent (`/pricing-analysis`)
Produces a standalone report + Google Sheets-compatible spreadsheet:
- **Asks YOU** for specific pricing questions and constraints before generating
- Pricing model evaluation (per-seat, usage-based, tiered, freemium, etc.)
- Competitive pricing benchmarks
- Price sensitivity analysis (driven by your questions)
- Revenue modeling at 3 price points (conservative, base, aggressive)
- Recommended pricing tiers with feature mapping
- Margin analysis and unit economics (CAC, LTV, LTV:CAC)
- **Output:** `pricing-analysis.md` / `.pdf` / `.docx` (Google Doc) + `pricing-model.csv` (Google Sheets)

### How They Work Together
1. Sub-agents run automatically during PRFAQ generation (Phase 2)
2. Each produces its own standalone document with auto-export to PDF + Google Doc (DOCX)
3. Analysis data is exported as Google Sheets-compatible CSV files
4. Key findings are **synthesized** into the PRFAQ Evidence section
5. Market/competitive/pricing insights are woven into Internal FAQs
6. Full reports are referenced in the PRFAQ appendix
7. Run `/deep-analysis` to execute all three manually, or run each individually
8. Upload DOCX files to Google Drive for collaborative editing; import CSV into Google Sheets

## Auto Mode

For a hands-off experience, use `/auto` instead of `/start`. You still answer the Problem & Solution questions interactively, but everything else runs automatically without pausing for approval:

| Step | Normal Mode | Auto Mode |
|------|------------|-----------|
| Problem & Solution | Interactive (same) | Interactive (same) |
| Sub-agent approval | Pause after each | No pauses |
| Pricing questions | Asks you first | Uses default scenarios |
| Dimension approval | Pause after each | No pauses |
| Export | Manual `/export` | Automatic |
| Format export | User chooses | All formats (PDF + DOCX + HTML) |
| Quality review | Manual | Auto-revise if score < 3.5/5 |

**Normal flow:** `/start` → answer questions → approve each step → `/export`
**Auto flow:** `/auto` → answer questions → everything else runs → final review

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

## Export Formats

After generating your PRFAQ with `/export`, use `/save-as` to convert to additional formats:

| Format | Command | Tool Used | Output |
|--------|---------|-----------|--------|
| **PDF** | `/save-as pdf` | pandoc or md-to-pdf | `final-prfaq.pdf` |
| **Google Doc** | `/save-as gdoc` | pandoc | `final-prfaq.docx` (upload to Google Docs) |
| **HTML** | `/save-as html` | pandoc or manual | `final-prfaq.html` (styled with CSS) |
| **All** | `/save-as all` | — | All three formats |

The `/export` command also prompts you to choose a format after the markdown export completes.

### Format Tool Requirements (Optional)

For PDF and DOCX export, one of these tools should be available:

- **[pandoc](https://pandoc.org/)** — Recommended. Handles PDF, DOCX, and HTML (`brew install pandoc`)
- **[md-to-pdf](https://www.npmjs.com/package/md-to-pdf)** — PDF alternative via `npx md-to-pdf` (no install needed)
- If no tools are available, the agent generates a styled HTML file you can print to PDF from your browser

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed and configured
- No other dependencies required (pandoc optional for PDF/DOCX export)

## License

MIT
