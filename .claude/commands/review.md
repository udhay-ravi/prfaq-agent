Review and score the current PRFAQ draft.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and `draft.md` (or `final-prfaq.md` if it exists).

3. Read `skills/prfaq-review.skill.md` and follow its scoring rubric to evaluate the PRFAQ.

4. Display the review results:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Review: <Product Name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Overall Score: ★★★★☆ 4.0/5

  Per-Dimension Scores:
  ┌─────────────────────┬───────┬──────────────────────────────┐
  │ Dimension           │ Score │ Notes                        │
  ├─────────────────────┼───────┼──────────────────────────────┤
  │ 1. Problem          │ 4/5   │ Clear problem, need sharper  │
  │                     │       │ persona definition           │
  │ 2. Evidence         │ 3/5   │ Qualitative strong, needs    │
  │                     │       │ more quantitative data       │
  │ 3. Solution         │ 5/5   │ Excellent customer journey   │
  │ 4. Impact           │ 4/5   │ Good metrics, add timelines  │
  │ 5. Roadmap          │ 4/5   │ Clear phases, need go/no-go  │
  │ 6. Risks            │ 3/5   │ Add mitigation specifics     │
  └─────────────────────┴───────┴──────────────────────────────┘

  ━━━ Strengths ━━━
  1. <Specific strength with reference to content>
  2. <Specific strength with reference to content>
  3. <Specific strength with reference to content>

  ━━━ Areas for Improvement ━━━
  1. <Specific improvement with actionable suggestion>
  2. <Specific improvement with actionable suggestion>
  3. <Specific improvement with actionable suggestion>

  ━━━ Anti-Pattern Check ━━━
  ✅ Customer-first language (not solution-first)
  ✅ Specific metrics with targets
  ⚠️  Missing direct customer quotes in Evidence section
  ⚠️  Roadmap lacks go/no-go criteria between phases

  ━━━ Readiness Assessment ━━━
  🟡 NEEDS WORK — Address the improvement areas above
     before sharing with leadership.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

5. Readiness levels:
   - **🟢 READY** (4.0+ overall) — Ready for leadership review
   - **🟡 NEEDS WORK** (3.0-3.9 overall) — Address improvements first
   - **🔴 NOT READY** (below 3.0) — Significant gaps need to be filled

6. After displaying the review, ask the user if they'd like to:
   - Address specific improvements (offer to re-gather data for weak dimensions)
   - Export as-is with `/export`
   - Continue iterating
