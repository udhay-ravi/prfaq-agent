Show the artifact board for the current PRFAQ session — a kanban view of all produced artifacts.

## Steps

1. Find the most recently updated session in `output/` by reading `session.json` files. If none exists, tell the user to run `/start`.

2. Read `skills/prfaq-artifacts.skill.md` for the full artifact list and board generation rules.

3. Read the session's `session.json` to determine:
   - Which dimensions are complete, in progress, or not started
   - Whether the draft and final documents exist
   - Current overall session status

4. Scan the session directory for actual files (session.json, draft.md, final-prfaq.md, artifacts-board.md).

5. Determine the status of each artifact (~32 total) based on:
   - Dimension completion status in session.json
   - Whether corresponding files exist on disk
   - Whether sections in draft.md have real content vs. placeholders

6. Display the kanban board to the user:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Artifact Board: <Product Name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

┌─────────────────────────┬──────────────────────────┬──────────────────────────┐
│  ✅ Done (<count>)      │  🔄 In Progress (<count>)│  ⬚ Todo (<count>)        │
├─────────────────────────┼──────────────────────────┼──────────────────────────┤
│                         │                          │                          │
│  [ID] Artifact name     │  [ID] Artifact name      │  [ID] Artifact name      │
│  📝/🤖/📄 source        │  ⚙️ status note           │  status note             │
│                         │                          │                          │
│  ... (all done items)   │  ... (all WIP items)     │  ... (all todo items)    │
│                         │                          │                          │
└─────────────────────────┴──────────────────────────┴──────────────────────────┘

  Total: <N> artifacts  |  <N> done  |  <N> in progress  |  <N> todo
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

7. Save the artifact board as a markdown file to `output/<product-name>/artifacts-board.md` with the full table format.

8. Update `session.json` with the artifacts tracking data (total, done, inProgress, todo, items array).

9. Show the user the board and tell them:
   - How many artifacts are complete
   - What's still in progress or todo
   - The file path where the board is saved
   - Suggest `/export` if the PRFAQ is ready, or `/resume` if there's more to do
