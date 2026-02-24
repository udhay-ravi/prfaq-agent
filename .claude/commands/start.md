Start a new PRFAQ session.

## Steps

1. Ask the user for:
   - **Product or feature name** (required)
   - **One-line description** (required — max 1 sentence describing what this product does for the customer)

2. Create a slug from the product name (lowercase, hyphens, no special chars).

3. Create the session directory: `output/<product-name-slug>/`

4. Initialize `output/<product-name-slug>/session.json` with:
```json
{
  "productName": "<name>",
  "description": "<one-liner>",
  "slug": "<slug>",
  "createdAt": "<ISO timestamp>",
  "updatedAt": "<ISO timestamp>",
  "status": "in-progress",
  "currentDimension": 1,
  "dimensions": {
    "problem": { "status": "not-started", "source": "user-input", "data": {} },
    "solution": { "status": "not-started", "source": "user-input", "data": {} },
    "evidence": { "status": "not-started", "source": "ai-generated", "data": {} },
    "positioning": { "status": "not-started", "source": "ai-generated", "data": {} },
    "impact": { "status": "not-started", "source": "ai-generated", "data": {} },
    "roadmap": { "status": "not-started", "source": "ai-generated", "data": {} },
    "risks": { "status": "not-started", "source": "ai-generated", "data": {} }
  },
  "subAgents": {
    "marketAnalysis": { "status": "not-started", "file": null, "wordCount": null, "completedAt": null, "summary": null },
    "competitiveAnalysis": { "status": "not-started", "file": null, "wordCount": null, "completedAt": null, "summary": null },
    "pricingAnalysis": { "status": "not-started", "file": null, "csvFile": null, "wordCount": null, "completedAt": null, "summary": null, "userQuestions": [], "constraints": [] }
  },
  "artifacts": {
    "total": 51,
    "done": 1,
    "inProgress": 0,
    "todo": 50,
    "items": []
  }
}
```

5. Copy `templates/prfaq-template.md` to `output/<product-name-slug>/draft.md`, replacing the placeholder product name.

6. Display a welcome message:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PRFAQ Agent — New Session Started
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Product: <name>
  Session: output/<slug>/
  Progress: [░░░░░░░░░░░░░░] 0/7 dimensions

  📝 You provide: Problem & Solution
  🤖 I generate: Evidence, Positioning, Impact,
                  Roadmap, Risks & Tradeoffs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

7. **Load Sample PRFAQs (if any):**
   Read `skills/prfaq-samples.skill.md` and scan the `samples/` directory for existing PRFAQ documents (.md, .txt files excluding README.md).
   - If samples found: analyze them, build a Style Profile, save to session.json, and announce what was learned
   - If no samples: proceed with default style and show a tip about adding samples

8. Begin the interactive gathering process starting with **Dimension 1: Problem Statement**.

Read the `skills/prfaq-gather.skill.md` file and follow its instructions for conducting the gathering. Start with the Problem dimension questions.

Important:
- If a session already exists for this product name, ask whether to overwrite or resume
- Save all progress incrementally — the user should be able to `/resume` at any time
