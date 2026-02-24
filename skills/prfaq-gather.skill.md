# Skill: PRFAQ Information Gathering

This skill defines the interactive process for gathering Problem and Solution from the user, then autonomously generating the remaining 5 dimensions.

## Overview

You conduct a focused interview with the user to gather two core inputs — Problem and Solution. Then you autonomously generate Evidence, Product Positioning, Impact, Roadmap, and Risks & Tradeoffs using web research and strategic analysis.

## State Management

Track the current state in `session.json`:
- `currentDimension`: Which dimension you're currently on (1-7)
- `dimensions.<name>.status`: `"not-started"`, `"in-progress"`, or `"complete"`
- `dimensions.<name>.source`: `"user-input"` or `"ai-generated"`
- `dimensions.<name>.data`: Object containing all captured/generated content

After every user response:
1. Extract key points from their answer
2. Update `session.json` with the new data
3. Update `draft.md` with the captured information in the appropriate section

---

## PHASE 1: USER INPUT

### Dimension 1: Problem Statement [USER INPUT]

**Opening:** "Let's start by understanding the customer problem. This is the foundation of your PRFAQ — everything else builds on it."

Ask these questions (one at a time, adapting based on answers):

1. "What specific problem are your customers facing? Describe it from their perspective — what are they trying to do, and where does it break down?"
2. "Who exactly is the target customer? Give me a specific persona — their role, industry, company size, technical sophistication."
3. "How do customers solve this problem today? What workarounds, manual processes, or competitor products do they use?"
4. "How often do customers encounter this problem? (Daily? Weekly? At specific moments?) And how severe is it when they do? (Mild annoyance? Blocks their work? Costs them money?)"
5. "If you had to describe this problem in a single sentence that would make any executive immediately understand the urgency, what would it be?"

**Follow-up probes (ask at least 1):**
- "You mentioned [X] — can you give me a specific example of a customer experiencing this?"
- "What happens if we DON'T solve this? What's the cost of inaction for the customer?"
- "Is this problem getting worse over time? What's driving that trend?"

**After gathering:** Summarize the problem statement and ask the user to confirm:

```
Here's what I've captured for the Problem Statement:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• Core Problem: <summary>
• Target Customer: <persona>
• Current Workarounds: <workarounds>
• Frequency/Severity: <frequency and severity>
• One-liner: <single sentence>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Does this accurately capture the problem? Any corrections or additions?
```

Save to `session.json`, update `draft.md`, show progress: `[██░░░░░░░░░░░░] 1/7 dimensions complete`

### Dimension 2: Solution [USER INPUT]

**Transition:** "Great problem definition. Now let's define your solution. Remember — describe it from the customer's perspective, not the engineer's."

Questions:
1. "In one sentence, what is your proposed solution?"
2. "Walk me through the customer experience: A customer has the problem, they discover your solution — what happens next? Step by step."
3. "What are the 3-5 key capabilities or features?"
4. "What makes this different from existing solutions? What's the unique insight or approach?"
5. "What's the 'magic moment' — the point where the customer says 'wow, this is exactly what I needed'?"
6. "Let's write a customer quote for the press release. Imagine a real customer describing how this changed their work. Give me a name, title, company, and what they'd say."

**After gathering:** Summarize, confirm, save, update progress: `[████░░░░░░░░░░] 2/7 dimensions complete`

---

## PHASE 2: DEEP ANALYSIS SUB-AGENTS + AI GENERATION

After Problem and Solution are both confirmed, check for a Style Profile:

1. Read `session.json` and check for `styleProfile`
2. If a style profile exists (from samples), announce: "I'll generate sections matching your org's PRFAQ style (learned from <N> samples)."
3. Apply all style profile patterns when generating each section — tone, structure, metrics format, terminology, roadmap conventions, etc.
4. If no style profile exists, use default generation patterns from the templates.

Then transition to deep analysis and autonomous generation:

**Transition message:**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Phase 1 Complete — Problem & Solution captured
  Progress: [████░░░░░░░░░░] 2/7 dimensions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

I now have everything I need from you. I'll now run
three deep analysis sub-agents, then generate the
remaining PRFAQ sections:

  🔬 Deep Analysis Sub-Agents:
  ⬚ Market Analysis    → TAM/SAM/SOM, revenue projections
  ⬚ Competitive Analysis → Landscape, SWOT, feature matrix
  ⬚ Pricing Evaluation  → Pricing model, tiers, spreadsheet

  📝 Then generate PRFAQ sections:
  3. Evidence (synthesized from deep analyses)
  4. Product Positioning
  5. Impact Analysis
  6. Roadmap (Private Preview → Public Preview → GA)
  7. Risks & Tradeoffs

Let me start with market research...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Phase 2A: Run Deep Analysis Sub-Agents

Execute the three sub-agents sequentially. Each produces a standalone document (2,000-4,000 words).

**Sub-Agent 1: Market Analysis**
1. Read `skills/market-analysis.skill.md` and follow its instructions
2. Produces `output/<slug>/market-analysis.md` with TAM/SAM/SOM, revenue projections, market dynamics
3. Present summary to user, wait for feedback
4. Update `session.json` → `subAgents.marketAnalysis`
5. Mark artifacts MA1-MA6 as done

**Sub-Agent 2: Competitive Analysis**
1. Read `skills/competitive-analysis.skill.md` and follow its instructions
2. Produces `output/<slug>/competitive-analysis.md` with landscape map, SWOT, feature matrix, battlecards
3. Present summary to user, wait for feedback
4. Update `session.json` → `subAgents.competitiveAnalysis`
5. Mark artifacts CA1-CA6 as done

**Sub-Agent 3: Pricing Evaluation**
1. Read `skills/pricing-analysis.skill.md` and follow its instructions
2. **Important:** This agent asks the user for specific pricing questions and constraints before generating
3. Produces `output/<slug>/pricing-analysis.md` + `output/<slug>/pricing-model.csv`
4. Present summary to user, wait for feedback
5. Update `session.json` → `subAgents.pricingAnalysis`
6. Mark artifacts PA1-PA7 as done

### Phase 2B: Generate PRFAQ Dimensions

### Dimension 3: Evidence [AI-GENERATED — Synthesized from Sub-Agent Reports]

**Process:**
1. Read the completed sub-agent documents: `market-analysis.md`, `competitive-analysis.md`, `pricing-analysis.md`
2. Read the sub-agent summaries from `session.json` → `subAgents.*.summary`
3. **Synthesize** (do NOT duplicate) the key findings into a PRFAQ-appropriate Evidence section

**Generate (synthesized from sub-agent outputs):**
- **Market Analysis Summary:** TAM/SAM/SOM headline numbers, growth rate, key dynamics (from market-analysis.md)
- **Competitive Landscape Summary:** Top competitors, key differentiators, whitespace (from competitive-analysis.md)
- **Pricing Context:** Market pricing range, recommended positioning (from pricing-analysis.md)
- **Customer Evidence:** Pain point narratives, industry benchmarks
- **Supporting Data:** Adoption statistics, cost-of-problem benchmarks, trend data

**Important:** Keep the PRFAQ Evidence section concise (500-800 words). Point readers to the standalone deep-dive documents for full details:
```markdown
> 📊 For the complete analysis, see:
> - [Market Analysis](market-analysis.md) — Full TAM/SAM/SOM and revenue projections
> - [Competitive Analysis](competitive-analysis.md) — Detailed competitive evaluation
> - [Pricing Analysis](pricing-analysis.md) — Pricing model and recommendations
> - [Pricing Spreadsheet](pricing-model.csv) — Open in Google Sheets
```

**After generating:** Present and ask for feedback.
Save, update progress: `[██████░░░░░░░░] 3/7 dimensions complete`

### Dimension 4: Product Positioning [AI-GENERATED]

**Generate:**
- **Positioning Statement:** "For [target customer] who [problem], [product] is a [category] that [key benefit]. Unlike [alternatives], [product] [primary differentiator]."
- **Category Definition**
- **Value Proposition:** Core promise in 1-2 sentences
- **Key Messages (3-5):** Messaging pillars with headline and supporting point
- **Target Segments:** Primary, secondary, tertiary with prioritization rationale
- **Competitive Moat:** Network effects, data advantages, switching costs, etc.
- **Brand Voice & Tone**

**After generating:** Present and ask for feedback.
Save, update progress: `[████████░░░░░░] 4/7 dimensions complete`

### Dimension 5: Impact [AI-GENERATED]

**Generate:**
- **Customer Impact** (table: Metric | Current State | Target State | Timeline)
- **Business Impact** (table: same format)
- **Strategic Impact** (narrative)
- **Success Metrics** (3-5 with specific targets)
- **Impact Timeline**

**After generating:** Present and ask for feedback.
Save, update progress: `[██████████░░░░] 5/7 dimensions complete`

### Dimension 6: Roadmap [AI-GENERATED]

**Generate:** Phased rollout table (Private Preview, Public Preview, GA) with timelines, features, audiences, success criteria, go/no-go, dependencies, phase transition criteria.

**After generating:** Present and ask for feedback.
Save, update progress: `[████████████░░] 6/7 dimensions complete`

### Dimension 7: Risks & Tradeoffs [AI-GENERATED]

**Generate:** Risk matrix table, non-goals, worst-case scenario, compliance/security considerations.

**After generating:** Present and ask for feedback.
Save, update progress: `[██████████████] 7/7 dimensions complete`

---

## Artifact Tracking

After each dimension is completed, update the `artifacts` section in `session.json`:

- When **Problem** completes: Mark [S1] Problem Statement as done. Also mark related sub-artifacts (target persona, workarounds analysis, frequency/severity data) as done.
- When **Solution** completes: Mark [S2] Solution as done. Also mark sub-artifacts (customer journey, feature list, differentiation, magic moment, customer quote) as done.
- When **Market Analysis sub-agent** completes: Mark [MA1]-[MA6] as done.
- When **Competitive Analysis sub-agent** completes: Mark [CA1]-[CA6] as done.
- When **Pricing Analysis sub-agent** completes: Mark [PA1]-[PA7] as done.
- When **Evidence** completes: Mark [S3] Evidence, [A1] Market sizing, [A2] Competitive landscape matrix, [A3] Feature comparison, [A4] Customer evidence as done.
- When **Positioning** completes: Mark [S4] Positioning, [A5] Positioning statement, [A6] Key messaging pillars, [A7] Target segment table as done.
- When **Impact** completes: Mark [S5] Impact, [P1] Customer impact metrics, [P2] Business impact metrics, [P3] Success KPIs as done.
- When **Roadmap** completes: Mark [S6] Roadmap, [P4] Roadmap table, [P5] Go/no-go criteria, [P6] Dependencies list as done.
- When **Risks** completes: Mark [S7] Risks, [P7] Risk matrix, [P8] Non-goals, [P9] Worst-case contingency as done.

Update the total done/inProgress/todo counts after each dimension.

## Completion

When all 7 dimensions are complete, show summary with all dimensions listed (Problem, Solution as User Input; Evidence, Product Positioning, Impact, Roadmap, Risks as AI Generated) and suggest /review, /export, /artifacts, or /status.

## Handling "Skip" Requests

- For Problem or Solution: explain these require user input as they are the foundation
- For AI-generated sections: these can't be skipped since the agent generates them automatically

## Conversation Style

- Be conversational but focused
- Acknowledge good answers
- Push back on vagueness
- When transitioning to AI generation, set expectations
- For AI-generated sections, be confident but open to feedback
