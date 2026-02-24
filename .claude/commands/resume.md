Resume an existing PRFAQ session.

## Steps

1. Scan the `output/` directory for all subdirectories containing a `session.json` file.

2. For each session found, read `session.json` and display:
```
Available PRFAQ Sessions:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  1. <Product Name>
     Created: <date>  |  Status: <X/6 dimensions complete>
     Progress: [██████░░░░░░] 3/6
     Last worked on: <dimension name>

  2. <Product Name>
     Created: <date>  |  Status: <X/6 dimensions complete>
     Progress: [████████████] 6/6
     Last worked on: Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

3. If no sessions exist, inform the user and suggest using `/start`.

4. Ask the user which session to resume (by number or name).

5. Load the selected session's `session.json` and determine:
   - Which dimension was last completed
   - Which dimension to continue with (the next incomplete one)

6. Display the session state:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Resuming: <Product Name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✅ Problem Statement — Complete
  ✅ Evidence — Complete
  ✅ Solution — Complete
  🔄 Impact — In Progress
  ⬚ Roadmap — Not Started
  ⬚ Risks & Tradeoffs — Not Started
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Continuing with: Dimension 4 — Impact
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

7. Read `skills/prfaq-gather.skill.md` and continue the gathering process from the next incomplete dimension.

8. If all 6 dimensions are complete, suggest using `/export` to generate the final document or `/review` to get quality feedback.
