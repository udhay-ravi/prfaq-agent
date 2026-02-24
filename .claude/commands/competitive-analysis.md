Run the Competitive Analysis sub-agent to produce a deep competitive evaluation with feature matrices, SWOT analyses, and strategic recommendations.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and verify that:
   - Dimensions `problem` and `solution` are both `"complete"` (required as input context)
   - If not complete, inform the user: "Competitive analysis requires Problem and Solution to be completed first. Run `/resume` to continue."

3. Check if competitive analysis has already been run:
   - If `subAgents.competitiveAnalysis.status` is `"complete"`, ask: "Competitive analysis already exists. Would you like to (a) View the existing report, (b) Re-run with fresh data?"
   - If re-running, proceed to Step 4.

4. **Run the Competitive Analysis Agent:**
   Read `skills/competitive-analysis.skill.md` and follow its complete instructions.

   The agent will:
   - Research competitors using web search
   - Map the competitive landscape (direct, indirect, emerging)
   - Deep-dive into top 3-5 competitors with SWOT
   - Build feature-by-feature comparison matrix
   - Compare pricing across competitors
   - Compare GTM strategies
   - Create win/loss analysis framework
   - Write strategic positioning recommendations
   - Write `output/<slug>/competitive-analysis.md` (2,000-4,000 words)
   - Present summary and wait for feedback

5. **Update session.json:**
   - Set `subAgents.competitiveAnalysis.status` to `"complete"`
   - Store the file path, word count, timestamp, and 200-300 word summary
   - Update artifact tracking (mark CA1-CA6 as done)
   - Update `updatedAt` timestamp

6. After completion, suggest next steps:
   ```
   Next: Run /pricing-analysis or /deep-analysis for all three analyses.
   ```
