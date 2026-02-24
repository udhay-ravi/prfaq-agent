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
    "problem": { "status": "not-started", "data": {} },
    "evidence": { "status": "not-started", "data": {} },
    "solution": { "status": "not-started", "data": {} },
    "impact": { "status": "not-started", "data": {} },
    "roadmap": { "status": "not-started", "data": {} },
    "risks": { "status": "not-started", "data": {} }
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
  Progress: [░░░░░░░░░░░░] 0/6 dimensions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

7. Begin the interactive gathering process starting with **Dimension 1: Problem Statement**.

Read the `skills/prfaq-gather.skill.md` file and follow its instructions for conducting the gathering. Start with the Problem dimension questions.

Important:
- If a session already exists for this product name, ask whether to overwrite or resume
- Save all progress incrementally — the user should be able to `/resume` at any time
