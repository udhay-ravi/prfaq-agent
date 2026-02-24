# PRFAQ Agent

An interactive Claude Code agent that guides product managers through creating Amazon-style PRFAQ (Press Release / Frequently Asked Questions) documents.

## What is a PRFAQ?

A PRFAQ is a product planning document popularized by Amazon's "Working Backwards" process. It starts with a fictional press release announcing the finished product, then works backwards to define the problem, evidence, solution, impact, roadmap, and risks. It forces customer-centric thinking before any code is written.

## How It Works

This is a **Claude Code agent** — not a traditional application. You interact with it through Claude Code's conversational interface using slash commands.

### Quick Start

1. Open this project directory in Claude Code:
   ```
   cd prfaq-agent
   claude
   ```

2. Start a new PRFAQ session:
   ```
   /start
   ```

3. The agent will walk you through 6 dimensions, asking targeted questions:
   - **Problem** — What customer problem are you solving?
   - **Evidence** — What data proves this problem exists?
   - **Solution** — What's your proposed solution (from the customer's perspective)?
   - **Impact** — How does this impact the business and customers?
   - **Roadmap** — What's the phased rollout plan (Private Preview, Public Preview, GA)?
   - **Risks & Tradeoffs** — What could go wrong and what are you choosing not to do?

4. Check your progress anytime:
   ```
   /status
   ```

5. Get an AI review of your PRFAQ quality:
   ```
   /review
   ```

6. Export the final document:
   ```
   /export
   ```

## Available Commands

| Command    | Description                               |
|------------|-------------------------------------------|
| `/start`   | Begin a new PRFAQ session                 |
| `/resume`  | Resume an existing PRFAQ session          |
| `/status`  | Check progress on current PRFAQ           |
| `/export`  | Generate the final PRFAQ document         |
| `/review`  | Get AI review and quality score           |
| `/help`    | Show all commands and tips                |

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
├── skills/                      # Agent skill definitions
│   ├── prfaq-gather.skill.md    # Interactive information gathering
│   ├── prfaq-draft.skill.md     # Document composition
│   ├── prfaq-review.skill.md    # Quality review & scoring
│   └── prfaq-export.skill.md    # Final document export
├── templates/                   # Section templates with guidance
│   ├── prfaq-template.md        # Master PRFAQ template
│   ├── section-problem.md
│   ├── section-evidence.md
│   ├── section-solution.md
│   ├── section-impact.md
│   ├── section-roadmap.md
│   └── section-risks.md
├── examples/                    # Reference example
│   └── example-prfaq.md         # Complete example PRFAQ
├── output/                      # Generated PRFAQs (gitignored)
├── scripts/
│   └── init-session.sh          # Session initialization script
└── package.json
```

## The 6 Dimensions

### 1. Problem Statement
Define the specific customer problem, target persona, current workarounds, and frequency/severity. The agent asks probing questions to ensure specificity.

### 2. Evidence
Back up the problem with quantitative data, customer quotes, competitive analysis, and internal signals. The agent challenges weak evidence.

### 3. Solution
Describe the solution from the customer's perspective — the journey, key capabilities, differentiation, and the "magic moment."

### 4. Impact
Quantify business and customer impact with specific metrics and targets. Define how success will be measured.

### 5. Roadmap
Plan the phased rollout: Private Preview (alpha), Public Preview (beta), and General Availability (GA) — with go/no-go criteria between phases.

### 6. Risks & Tradeoffs
Honestly assess technical, business, and adoption risks with specific mitigation plans. Define non-goals and worst-case contingencies.

## Output

The agent produces a complete PRFAQ document in markdown format, including:
- Executive summary
- Press release with customer quote
- Detailed sections for all 6 dimensions
- External FAQs (customer-facing)
- Internal FAQs (stakeholder-facing)
- Appendix with data sources

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed and configured
- No other dependencies required

## License

MIT
