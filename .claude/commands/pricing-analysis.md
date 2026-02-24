Run the Pricing Evaluation sub-agent to produce a deep pricing analysis with tier recommendations, revenue modeling, and a Google Sheets-compatible spreadsheet.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and verify that:
   - Dimensions `problem` and `solution` are both `"complete"` (required as input context)
   - If not complete, inform the user: "Pricing analysis requires Problem and Solution to be completed first. Run `/resume` to continue."
   - **Recommended:** Market analysis and competitive analysis should be complete for best results. If not, warn: "For best results, run `/market-analysis` and `/competitive-analysis` first. Proceed anyway?"

3. Check if pricing analysis has already been run:
   - If `subAgents.pricingAnalysis.status` is `"complete"`, ask: "Pricing analysis already exists. Would you like to (a) View the existing report, (b) Re-run with fresh data?"
   - If re-running, proceed to Step 4.

4. **Run the Pricing Analysis Agent:**
   Read `skills/pricing-analysis.skill.md` and follow its complete instructions.

   The agent will:
   - **Ask the user** for specific pricing questions and constraints (Step 0)
   - Evaluate pricing models (per-seat, usage, tiered, freemium, etc.)
   - Benchmark against competitor pricing
   - Analyze willingness-to-pay
   - Run price sensitivity analysis (driven by user's questions)
   - Model revenue at 3 scenarios (conservative, base, aggressive)
   - Recommend pricing tiers with feature mapping
   - Analyze margins and unit economics
   - Write `output/<slug>/pricing-analysis.md` (1,500-3,000 words)
   - Auto-export to PDF and DOCX (if pandoc available)
   - Write `output/<slug>/pricing-model.csv` (Google Sheets-compatible)
   - Present summary and wait for feedback

   **Output files:**
   - `pricing-analysis.md` — Markdown (always)
   - `pricing-analysis.pdf` — PDF (if pandoc/md-to-pdf available)
   - `pricing-analysis.docx` — Google Doc compatible (if pandoc available)
   - `pricing-model.csv` — Pricing model for Google Sheets/Excel (always)

5. **Update session.json:**
   - Set `subAgents.pricingAnalysis.status` to `"complete"`
   - Store file paths (md, pdf, docx, csv), word count, timestamp, summary, user questions, and constraints
   - Update artifact tracking (mark PA1-PA7 as done)
   - Update `updatedAt` timestamp

6. After completion, show:
   ```
   📊 Open pricing-model.csv in Google Sheets:
      1. Go to sheets.google.com → File → Import
      2. Upload output/<slug>/pricing-model.csv
      3. Select "Detect automatically" for separator

   Or open directly in Excel/Numbers.
   ```
