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
  Progress: [████████░░░░] 4/6 dimensions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Dimensions:
  ✅ 1. Problem Statement
     → <1-line summary of the core problem captured>

  ✅ 2. Evidence
     → <1-line summary of key evidence captured>

  ✅ 3. Solution
     → <1-line summary of the proposed solution>

  ✅ 4. Impact
     → <1-line summary of expected impact>

  ⬚ 5. Roadmap
     → Not yet started

  ⬚ 6. Risks & Tradeoffs
     → Not yet started

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Next Step: Continue with Dimension 5 — Roadmap
  Tip: Use /resume to continue gathering
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

4. For each completed dimension, generate a 1-line summary from the captured data in `session.json`.

5. If all dimensions are complete, change the "Next Step" to suggest `/review` or `/export`.

6. If a draft.md exists and has content, also show a word count for the current draft.
