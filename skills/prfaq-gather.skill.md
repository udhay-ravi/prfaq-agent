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

## PHASE 2: AI GENERATION

After Problem and Solution are both confirmed, transition to autonomous generation:

**Transition message:**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Phase 1 Complete — Problem & Solution captured
  Progress: [████░░░░░░░░░░] 2/7 dimensions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

I now have everything I need from you. I'll now research
your market and generate the remaining 5 sections:

  3. Evidence (market & competitive analysis)
  4. Product Positioning
  5. Impact Analysis
  6. Roadmap (Private Preview → Public Preview → GA)
  7. Risks & Tradeoffs

Let me start by researching your market...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Dimension 3: Evidence [AI-GENERATED — Market & Competitive Analysis]

**Process:**
1. Use web search to research the market related to the problem and solution
2. Search for market size, TAM/SAM/SOM, competitors, industry reports, adoption trends
3. Synthesize into structured Evidence section

**Generate:**
- **Market Analysis:** TAM/SAM/SOM with sources, growth rate, industry dynamics
- **Competitive Landscape:** Direct/indirect competitors, feature comparison matrix, whitespace analysis
- **Customer Evidence:** Pain point narratives, industry benchmarks
- **Supporting Data:** Adoption statistics, cost-of-problem benchmarks, trend data

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

## Completion

When all 7 dimensions are complete, show summary with all dimensions listed (Problem, Solution as User Input; Evidence, Product Positioning, Impact, Roadmap, Risks as AI Generated) and suggest /review, /export, or /status.

## Handling "Skip" Requests

- For Problem or Solution: explain these require user input as they are the foundation
- For AI-generated sections: these can't be skipped since the agent generates them automatically

## Conversation Style

- Be conversational but focused
- Acknowledge good answers
- Push back on vagueness
- When transitioning to AI generation, set expectations
- For AI-generated sections, be confident but open to feedback
