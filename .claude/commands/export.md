Generate the final PRFAQ document and artifact board from the current session.

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Read the session's `session.json` and check dimension completion status.

3. **Completeness Check:**
   - If all 7 dimensions are complete, proceed with export.
   - If any dimensions are incomplete, display a warning:
     ```
     ⚠️  Warning: The following dimensions are incomplete:
        ⬚ 6. Roadmap
        ⬚ 7. Risks & Tradeoffs

     A complete PRFAQ requires all 7 dimensions.
     Would you like to:
       (a) Continue — use /resume
       (b) Export anyway with incomplete sections marked as [TODO]
     ```
   - If the user chooses to export anyway, mark incomplete sections with `[TODO: This section needs to be completed]`.

4. **Draft the PRFAQ:**
   Read `skills/prfaq-draft.skill.md` and follow its instructions to compose the full PRFAQ document from the gathered data.

5. **Quality Review:**
   Read `skills/prfaq-review.skill.md` and run a quality review on the drafted document.
   - If the overall score is below 3.5/5, display the review results and suggest improvements before finalizing.
   - If the score is 3.5/5 or above, proceed to export.

6. **Generate Final Document:**
   Read `skills/prfaq-export.skill.md` and follow its instructions to produce the final formatted document.
   Write it to `output/<product-name>/final-prfaq.md`.

7. **Generate Artifact Board:**
   Read `skills/prfaq-artifacts.skill.md` and generate the full kanban artifact board.
   Write it to `output/<product-name>/artifacts-board.md`.
   Update `session.json` with the artifacts tracking data.

8. **Summary:**
   Display:
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     PRFAQ Export Complete
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     Product: <name>
     Quality Score: <X>/5
     Status: Ready for Review
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

     📄 Produced Files:
     ├── output/<slug>/final-prfaq.md    (<word count> words)
     ├── output/<slug>/artifacts-board.md (<N> artifacts)
     ├── output/<slug>/draft.md
     └── output/<slug>/session.json

     📊 Artifact Board:
     ✅ Done: <N>  |  🔄 In Progress: <N>  |  ⬚ Todo: <N>

     Run /artifacts to see the full kanban board
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

9. Update `session.json` with `"status": "exported"` and the export timestamp.
