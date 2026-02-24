Run all three deep analysis sub-agents in sequence: Market Analysis, Competitive Analysis, and Pricing Evaluation.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and verify that:
   - Dimensions `problem` and `solution` are both `"complete"` (required as input context)
   - If not complete, inform the user: "Deep analysis requires Problem and Solution to be completed first. Run `/resume` to continue."

3. **Announce the deep analysis sequence:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🔬 Deep Analysis — Running 3 Sub-Agents
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  I'll run these three analyses in sequence:

  ⬚ 1. Market Analysis
     → TAM/SAM/SOM, revenue projections, market dynamics

  ⬚ 2. Competitive Analysis
     → Landscape mapping, SWOT, feature matrix, battlecards

  ⬚ 3. Pricing Evaluation
     → Pricing model, tiers, revenue modeling, spreadsheet

  Each produces a standalone deep-dive document.
  Synthesized summaries feed into your PRFAQ.

  Estimated time: 5-10 minutes total
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

4. **Run Sub-Agent 1: Market Analysis**
   - Show: `🔄 1. Market Analysis — Running...`
   - Read `skills/market-analysis.skill.md` and execute
   - On completion, show: `✅ 1. Market Analysis — Complete (X words)`
   - Present summary, ask for feedback
   - Wait for user to approve before continuing

5. **Run Sub-Agent 2: Competitive Analysis**
   - Show: `🔄 2. Competitive Analysis — Running...`
   - Read `skills/competitive-analysis.skill.md` and execute
   - On completion, show: `✅ 2. Competitive Analysis — Complete (X words)`
   - Present summary, ask for feedback
   - Wait for user to approve before continuing

6. **Run Sub-Agent 3: Pricing Evaluation**
   - Show: `🔄 3. Pricing Evaluation — Running...`
   - Read `skills/pricing-analysis.skill.md` and execute (includes user pricing questions)
   - On completion, show: `✅ 3. Pricing Evaluation — Complete (X words)`
   - Present summary, ask for feedback

7. **Show completion summary:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🔬 Deep Analysis Complete — All 3 Sub-Agents Done
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✅ 1. Market Analysis      → market-analysis.md (X words)
     TAM: $[X]B | SAM: $[X]B | SOM Y1: $[X]M

  ✅ 2. Competitive Analysis  → competitive-analysis.md (X words)
     [N] competitors analyzed | Key advantage: [X]

  ✅ 3. Pricing Evaluation    → pricing-analysis.md (X words)
     Recommended: [Model] | Tiers: Free → $X → $X → Enterprise
     📊 pricing-model.csv (open in Google Sheets)

  📁 All files in: output/<slug>/
  📊 New artifacts: [N] added to board

  These analyses will be synthesized into your PRFAQ
  Evidence section and Internal FAQs.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Next steps:
  • /status    — See updated progress
  • /resume    — Continue PRFAQ generation
  • /artifacts — View all artifacts
  • /export    — Generate final PRFAQ
```

8. Update `session.json` with `updatedAt` timestamp.
