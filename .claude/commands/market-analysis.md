Run the Market Analysis sub-agent to produce a deep TAM/SAM/SOM analysis with revenue projections.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and verify that:
   - Dimensions `problem` and `solution` are both `"complete"` (required as input context)
   - If not complete, inform the user: "Market analysis requires Problem and Solution to be completed first. Run `/resume` to continue."

3. Check if market analysis has already been run:
   - If `subAgents.marketAnalysis.status` is `"complete"`, ask: "Market analysis already exists. Would you like to (a) View the existing report, (b) Re-run with fresh data?"
   - If re-running, proceed to Step 4.

4. **Run the Market Analysis Agent:**
   Read `skills/market-analysis.skill.md` and follow its complete instructions.

   The agent will:
   - Research the market using web search
   - Calculate TAM (top-down + bottom-up)
   - Calculate SAM with segment breakdown
   - Calculate SOM with capture rate analysis
   - Build a 5-year revenue projection model
   - Identify market drivers, headwinds, and adjacent opportunities
   - Write `output/<slug>/market-analysis.md` (2,000-4,000 words)
   - Auto-export to PDF and DOCX (if pandoc available)
   - Present summary and wait for feedback

   **Output files:**
   - `market-analysis.md` — Markdown (always)
   - `market-analysis.pdf` — PDF (if pandoc/md-to-pdf available)
   - `market-analysis.docx` — Google Doc compatible (if pandoc available)

5. **Update session.json:**
   - Set `subAgents.marketAnalysis.status` to `"complete"`
   - Store file paths (md, pdf, docx), word count, timestamp, and 200-300 word summary
   - Update artifact tracking (mark MA1-MA6 as done)
   - Update `updatedAt` timestamp

6. After completion, suggest next steps:
   ```
   Next: Run /competitive-analysis or /deep-analysis for all three analyses.
   ```
