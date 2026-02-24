# Skill: PRFAQ Information Gathering

This skill defines the interactive process for gathering information across all 6 PRFAQ dimensions.

## Overview

You are conducting a structured interview with the user to gather all the information needed for a complete PRFAQ document. You proceed through 6 dimensions in order, asking targeted questions and capturing detailed answers.

## State Management

Track the current state in `session.json`:
- `currentDimension`: Which dimension you're currently gathering (1-6)
- `dimensions.<name>.status`: `"not-started"`, `"in-progress"`, or `"complete"`
- `dimensions.<name>.data`: Object containing all captured answers for that dimension

After every user response:
1. Extract key points from their answer
2. Update `session.json` with the new data
3. Update `draft.md` with the captured information in the appropriate section

## Dimension 1: Problem Statement

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

Save to `session.json`, update `draft.md`, show progress: `[██░░░░░░░░░░] 1/6 dimensions complete`

## Dimension 2: Evidence

**Transition:** "Great problem definition. Now let's back it up with evidence. Strong evidence separates a good PRFAQ from a wishful one."

Questions:
1. "What quantitative data do you have that proves this problem exists? (Usage metrics, survey results, support ticket volumes, churn data, market size)"
2. "What have customers actually said about this problem? Share direct quotes from interviews, support tickets, reviews, or sales calls."
3. "What does the competitive landscape look like? Who else is trying to solve this, and where do they fall short?"
4. "What internal signals or data points support prioritizing this? (Escalations, lost deals, feature requests, NPS feedback)"
5. "What would disprove this problem? What data, if you found it, would make you reconsider?"

**Challenge probes:**
- "You said [X]% — where does that number come from? How was it measured?"
- "That's qualitative evidence. Do you have any numbers to back it up?"
- "How recent is this data? Is it still relevant?"

**After gathering:** Summarize, confirm, save, update progress: `[████░░░░░░░░] 2/6 dimensions complete`

## Dimension 3: Solution

**Transition:** "Now that we've established the problem and evidence, let's define the solution. Remember — describe it from the customer's perspective, not the engineer's."

Questions:
1. "In one sentence, what is your proposed solution?"
2. "Walk me through the customer experience: A customer has the problem, they discover your solution — what happens next? Step by step."
3. "What are the 3-5 key capabilities or features?"
4. "What makes this different from existing solutions? What's the unique insight or approach?"
5. "What's the 'magic moment' — the point where the customer says 'wow, this is exactly what I needed'?"
6. "Let's write a customer quote for the press release. Imagine a real customer describing how this changed their work. Give me a name, title, company, and what they'd say."

**After gathering:** Summarize, confirm, save, update progress: `[██████░░░░░░] 3/6 dimensions complete`

## Dimension 4: Impact

**Transition:** "Strong solution. Now let's quantify the impact — both for the business and for customers."

Questions:
1. "What's the business impact? Think revenue, cost savings, market expansion, retention improvement. Be specific with numbers."
2. "What's the customer impact? How much time/money does this save them? What new capabilities does it unlock?"
3. "What's the strategic impact? How does this affect competitive positioning, platform value, or ecosystem?"
4. "How will we measure success? Define 3-5 specific metrics with target numbers. (e.g., 'Reduce onboarding time from 3 days to 30 minutes')"
5. "What's the timeline to see this impact? When do early signals appear vs. full impact?"

**After gathering:** Summarize, confirm, save, update progress: `[████████░░░░] 4/6 dimensions complete`

## Dimension 5: Roadmap

**Transition:** "Let's plan the phased rollout. We'll use three phases: Private Preview, Public Preview, and General Availability."

Questions:
1. "**Private Preview (Alpha):** What are the core features for the first release? Who are the 3-5 design partner customers? What are the success criteria to move to Public Preview? Target timeline?"
2. "**Public Preview (Beta):** What additional features will be added? How will the audience expand? What feedback mechanisms will be in place? Target timeline?"
3. "**General Availability:** What's the full feature set? What SLA commitments? Pricing model? Support model? Target timeline?"
4. "What are the key dependencies or prerequisites for each phase? (Infrastructure, partnerships, regulatory, etc.)"
5. "What are the go/no-go criteria between phases? What would cause you to pause or pivot?"

**After gathering:** Summarize as a phased table, confirm, save, update progress: `[██████████░░] 5/6 dimensions complete`

## Dimension 6: Risks & Tradeoffs

**Transition:** "Almost done. Last dimension — let's be honest about what could go wrong and what we're choosing not to do."

Questions:
1. "What are the top technical risks? For each, what's the mitigation plan?"
2. "What are the business or market risks? (Timing, competition, market shifts) Mitigation plans?"
3. "What are the customer adoption risks? What could prevent customers from using this even if we build it well?"
4. "What are you explicitly choosing NOT to do in this solution? Why?"
5. "What's the worst-case scenario? If everything that could go wrong does — what's our contingency?"
6. "Are there security, compliance, or regulatory considerations? How will you address them?"

**After gathering:** Summarize as a risk matrix, confirm, save, update progress: `[████████████] 6/6 dimensions complete`

## Completion

When all 6 dimensions are complete:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  All 6 Dimensions Complete!
  Progress: [████████████] 6/6
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Your PRFAQ data has been saved. Next steps:
  • /review  — Get a quality score and improvement suggestions
  • /export  — Generate the final PRFAQ document
  • /status  — View a summary of everything captured
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Handling "Skip" Requests

If the user says "skip" for any dimension:
1. Explain why this dimension matters for a complete PRFAQ
2. Ask at least 1 simplified question to capture the minimum viable information
3. If they still insist, mark the dimension as `"skipped"` and note it for the review

## Conversation Style

- Be conversational but focused — this isn't a form, it's a strategic discussion
- Acknowledge good answers: "That's a strong data point" or "Great specificity"
- Push back on vagueness: "Can you be more specific?" or "What's the actual number?"
- Connect dimensions: "Earlier you mentioned X — how does that relate to this risk?"
- Keep energy up: Show progress, celebrate completing dimensions
