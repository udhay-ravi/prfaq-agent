Run the full PRFAQ process end-to-end with minimal interruptions: gather Problem & Solution, run all deep analysis sub-agents, generate all PRFAQ dimensions, export the final document, and produce all artifacts.

## Overview

`/auto` is the "hands-off" mode. After you provide answers for Problem and Solution, the agent runs everything else automatically without pausing for approval between each step. You get one final review at the end instead of reviewing each piece individually.

**Difference from normal flow:**
- Normal: `/start` → answer questions → approve each sub-agent → approve each dimension → `/export`
- Auto: `/auto` → answer questions → everything else runs automatically → final review

## Steps

1. **Session Setup:**
   - If no active session exists, behave like `/start`:
     - Ask for product name and one-line description
     - Create session directory and files
     - Load sample PRFAQs for style profile (if any)
   - If an active session exists with incomplete work:
     - Ask: "Resume existing session for **<Product Name>** in auto mode, or start fresh?"
     - If resuming, pick up from wherever the session left off
   - Set `session.json` → `"mode": "auto"` to track that this session is in auto mode

2. **Phase 1: Gather Problem & Solution (Interactive)**
   - This phase is ALWAYS interactive — the user MUST provide their own input
   - Follow `skills/prfaq-gather.skill.md` Phase 1 instructions exactly
   - Gather Dimension 1: Problem Statement (3-5 questions + follow-ups)
   - Summarize and confirm with user
   - Gather Dimension 2: Solution (3-5 questions + follow-ups)
   - Summarize and confirm with user
   - **If Problem and Solution are already complete** (resuming), skip to Phase 2

3. **Announce Auto Mode:**
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     🚀 Auto Mode — Running Full PRFAQ Pipeline
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     Problem & Solution captured. Now running everything
     automatically. Sit back — I'll present the complete
     PRFAQ when it's ready.

     Pipeline:
     ⬚ 1. Market Analysis        → TAM/SAM/SOM, revenue
     ⬚ 2. Competitive Analysis   → Landscape, SWOT, matrix
     ⬚ 3. Pricing Evaluation     → Model, tiers, spreadsheet
     ⬚ 4. Evidence (synthesized) → Market + competitive summary
     ⬚ 5. Product Positioning    → Statement, segments, moat
     ⬚ 6. Impact                 → Metrics, KPIs
     ⬚ 7. Roadmap                → Phased rollout plan
     ⬚ 8. Risks & Tradeoffs      → Risk matrix, mitigations
     ⬚ 9. Draft PRFAQ            → Full document composition
     ⬚ 10. Quality Review        → Score and validation
     ⬚ 11. Export                 → Final doc + artifacts
     ⬚ 12. Format Export         → PDF + DOCX + HTML

     Estimated time: 10-20 minutes
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

4. **Phase 2A: Run Deep Analysis Sub-Agents (No Approval Gates)**

   **Important: In auto mode, do NOT pause for user approval between sub-agents.**

   **4a. Market Analysis:**
   - Show: `🔄 1. Market Analysis — Running...`
   - Read `skills/market-analysis.skill.md` and execute fully
   - On completion: `✅ 1. Market Analysis — Complete (X words)`
   - Do NOT ask for feedback — proceed immediately

   **4b. Competitive Analysis:**
   - Show: `🔄 2. Competitive Analysis — Running...`
   - Read `skills/competitive-analysis.skill.md` and execute fully
   - On completion: `✅ 2. Competitive Analysis — Complete (X words)`
   - Do NOT ask for feedback — proceed immediately

   **4c. Pricing Evaluation:**
   - Show: `🔄 3. Pricing Evaluation — Running...`
   - Read `skills/pricing-analysis.skill.md` and execute
   - **Exception:** In auto mode, SKIP Step 0 (user pricing questions). Use default sensitivity analysis instead:
     - Scenario A: 20% below market average
     - Scenario B: At market average
     - Scenario C: 20% above market average
     - Free tier vs. no free tier analysis
   - Set `userQuestions: ["auto-mode: default scenarios"]` and `constraints: []` in session.json
   - On completion: `✅ 3. Pricing Evaluation — Complete (X words)`
   - Do NOT ask for feedback — proceed immediately

5. **Phase 2B: Generate All PRFAQ Dimensions (No Approval Gates)**

   Read `skills/prfaq-gather.skill.md` Phase 2B and generate all dimensions in sequence WITHOUT pausing between each:

   - `🔄 4. Evidence — Generating (synthesizing from sub-agents)...`
   - `✅ 4. Evidence — Complete`
   - `🔄 5. Product Positioning — Generating...`
   - `✅ 5. Product Positioning — Complete`
   - `🔄 6. Impact — Generating...`
   - `✅ 6. Impact — Complete`
   - `🔄 7. Roadmap — Generating...`
   - `✅ 7. Roadmap — Complete`
   - `🔄 8. Risks & Tradeoffs — Generating...`
   - `✅ 8. Risks & Tradeoffs — Complete`

   Save each dimension to session.json as you go (for crash recovery).

6. **Phase 3: Draft, Review, and Export (Automatic)**

   **6a. Draft the PRFAQ:**
   - Show: `🔄 9. Drafting PRFAQ — Composing full document...`
   - Read `skills/prfaq-draft.skill.md` and compose the full document
   - `✅ 9. PRFAQ Drafted — Complete (X words)`

   **6b. Quality Review:**
   - Show: `🔄 10. Quality Review — Scoring...`
   - Read `skills/prfaq-review.skill.md` and run review
   - `✅ 10. Quality Review — Score: X/5`
   - If score < 3.5/5, auto-revise weak sections and re-score (up to 2 attempts)

   **6c. Export:**
   - Show: `🔄 11. Exporting — Generating final document...`
   - Read `skills/prfaq-export.skill.md` and generate `final-prfaq.md`
   - Read `skills/prfaq-artifacts.skill.md` and generate `artifacts-board.md`
   - `✅ 11. Export — Complete`

   **6d. Format Export:**
   - Show: `🔄 12. Format Export — Generating PDF, DOCX, HTML...`
   - Read `skills/prfaq-formats.skill.md` and generate ALL formats (pdf + docx + html)
   - `✅ 12. Format Export — Complete`

7. **Final Presentation:**

   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     🚀 Auto Mode Complete — Full PRFAQ Generated
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     Product: <Product Name>
     Quality Score: <X>/5
     Total Artifacts: <N> produced

     ✅ 1.  Market Analysis        (X words)
     ✅ 2.  Competitive Analysis   (X words)
     ✅ 3.  Pricing Evaluation     (X words)
     ✅ 4.  Evidence               ✓ synthesized
     ✅ 5.  Product Positioning    ✓ generated
     ✅ 6.  Impact                 ✓ generated
     ✅ 7.  Roadmap                ✓ generated
     ✅ 8.  Risks & Tradeoffs      ✓ generated
     ✅ 9.  PRFAQ Drafted          (X words)
     ✅ 10. Quality Review         Score: X/5
     ✅ 11. Export                 ✓ complete
     ✅ 12. Format Export          ✓ PDF + DOCX + HTML

   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     📄 PRFAQ Document:
        output/<slug>/final-prfaq.md     (Markdown)
        output/<slug>/final-prfaq.pdf    (PDF)
        output/<slug>/final-prfaq.docx   (Google Doc)
        output/<slug>/final-prfaq.html   (HTML)

     📊 Deep Analysis Reports:
        output/<slug>/market-analysis.md/.pdf/.docx
        output/<slug>/competitive-analysis.md/.pdf/.docx
        output/<slug>/competitive-matrix.csv     (Google Sheets)
        output/<slug>/pricing-analysis.md/.pdf/.docx
        output/<slug>/pricing-model.csv          (Google Sheets)

     📋 Artifacts:
        output/<slug>/artifacts-board.md  (<N> artifacts)

     📎 Upload DOCX files to Google Drive for editing
     📎 Import CSV files into Google Sheets

   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     Would you like to review or revise any section?
     • /review    — Detailed quality review
     • /status    — See full status breakdown
     • /artifacts — View artifact kanban board

     Or your PRFAQ is ready to share! 🎉
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

8. **Update session.json:**
   - Set `"status": "exported"`, `"mode": "auto"`
   - Set `"exportedAt"` timestamp
   - All dimensions should be `"complete"`
   - All sub-agents should be `"complete"`
   - Artifact counts updated

## Key Differences from Normal Mode

| Aspect | Normal Mode | Auto Mode |
|--------|------------|-----------|
| Problem & Solution | Interactive (same) | Interactive (same) |
| Sub-agent approval | Pause after each | No pauses |
| Pricing questions | Asks user first | Uses default scenarios |
| Dimension approval | Pause after each | No pauses |
| Export | Manual `/export` | Automatic |
| Format export | User chooses | All formats generated |
| Quality review | Manual | Auto-revise if < 3.5 |
| Total user interactions | ~15+ approvals | ~2 (Problem + Solution) |

## Recovery

If the auto pipeline crashes or context runs out mid-way:
- All progress is saved incrementally to `session.json`
- User can run `/auto` again to resume from where it stopped
- User can also switch to normal mode with `/resume` at any point
