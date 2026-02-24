# Sample PRFAQs

Drop your existing PRFAQ documents here to teach the agent your organization's style, tone, structure, and quality standards.

## How It Works

When you run `/start`, the agent scans this directory for `.md` files. If samples are found, the agent:

1. **Reads** each sample to learn your preferred writing style, structure, and terminology
2. **Extracts patterns** — how your org formats problem statements, what metrics you track, how you structure roadmaps, your positioning framework, etc.
3. **Applies those patterns** when generating AI-written sections (Evidence, Positioning, Impact, Roadmap, Risks)
4. **Matches tone** — formal vs. conversational, technical depth, executive-friendly language

## What to Put Here

### Best Results
- **2-3 approved PRFAQs** from your organization that represent "great" quality
- Documents that have been reviewed and approved by leadership
- A mix of product types (new product, feature enhancement, platform capability)

### File Format
- Markdown (`.md`) files only
- Any naming convention works (e.g., `acme-cloudsync-prfaq.md`, `2024-q3-auth-feature.md`)
- Plain text (`.txt`) also supported but markdown is preferred

### What the Agent Learns From Your Samples

| Aspect | What It Picks Up |
|--------|------------------|
| **Structure** | Section ordering, heading hierarchy, subsection depth |
| **Tone & Voice** | Formal vs. casual, technical depth, audience level |
| **Problem Framing** | How your org describes customer problems, persona detail level |
| **Evidence Style** | What data sources you cite, how you present market data |
| **Positioning** | Your positioning framework, messaging conventions |
| **Metrics** | What KPIs your org tracks, how targets are set |
| **Roadmap Format** | Phase naming, timeline granularity, criteria style |
| **Risk Language** | How you categorize risks, mitigation detail level |
| **FAQ Style** | Question phrasing, answer depth, internal vs. external tone |
| **Terminology** | Domain-specific terms, product names, internal jargon |

## Example

```
samples/
├── README.md                          ← You're reading this
├── acme-cloudsync-prfaq.md            ← Your approved PRFAQ #1
├── acme-smartalerts-prfaq.md          ← Your approved PRFAQ #2
└── acme-databridge-prfaq.md           ← Your approved PRFAQ #3
```

## Tips

- **More samples = better tailoring** — 2-3 is ideal, 1 still helps
- **Quality matters** — only use PRFAQs that represent the standard you want
- **Recency matters** — newer PRFAQs reflect current org style better
- **Remove samples** anytime to reset to the default generation style
- **Mix of outcomes** — include PRFAQs that led to approved projects for best pattern matching
