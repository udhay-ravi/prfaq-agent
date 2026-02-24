Show the completion status of the current PRFAQ session.

## Steps

1. Find the most recently updated session in `output/` by reading all `session.json` files and comparing `updatedAt` timestamps. If no sessions exist, inform the user and suggest `/start`.

2. Read the active session's `session.json` and `draft.md`.

3. Display a comprehensive status report:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Status: <Product Name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  <one-line description>
  Created: <date>  |  Last Updated: <date>
  Progress: [████████░░░░░░] 4/7 dimensions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  📝 User Input:
  ✅ 1. Problem Statement
     → <1-line summary>

  ✅ 2. Solution
     → <1-line summary>

  🤖 AI Generated:
  ✅ 3. Evidence (Market & Competitive Analysis)
     → <1-line summary>

  ✅ 4. Product Positioning
     → <1-line summary>

  ⬚ 5. Impact
     → Not yet generated

  ⬚ 6. Roadmap
     → Not yet generated

  ⬚ 7. Risks & Tradeoffs
     → Not yet generated

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Next Step: Generating Dimension 5 — Impact
  Tip: Use /resume to continue
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

4. For each completed dimension, generate a 1-line summary from the captured data in `session.json`.

5. If all dimensions are complete, change the "Next Step" to suggest `/review` or `/export`.

6. If a draft.md exists and has content, also show a word count for the current draft.
