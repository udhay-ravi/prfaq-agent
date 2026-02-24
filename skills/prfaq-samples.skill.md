# Skill: Sample PRFAQ Loader & Style Analyzer

This skill defines how to load, analyze, and apply patterns from user-provided sample PRFAQ documents in the `samples/` directory.

## Overview

Before generating any content, the agent checks the `samples/` directory for existing PRFAQ documents. If found, it analyzes them to extract writing patterns, structural preferences, tone, and organizational conventions. These patterns are then applied to all AI-generated sections to match the user's organizational style.

## Loading Process

### Step 1: Scan for Samples

Scan `samples/` for `.md` and `.txt` files (excluding README.md and .gitkeep):

```
samples/*.md (excluding README.md)
samples/*.txt
```

If no samples are found, proceed with default generation style and inform the user:
```
ℹ️  No sample PRFAQs found in samples/.
   Using default PRFAQ style. Drop your org's PRFAQs into
   samples/ to customize the generation style.
```

If samples are found, announce:
```
📚 Found <N> sample PRFAQ(s) in samples/:
   • <filename1> (<word count> words)
   • <filename2> (<word count> words)
   Analyzing your org's PRFAQ style...
```

### Step 2: Read and Analyze Each Sample

For each sample file, read the full content and extract:

#### Structure Patterns
- What sections are present and in what order?
- What heading hierarchy is used? (H1, H2, H3 depth)
- Are there subsections not in the standard template?
- How long is each section? (word count per section)
- Are there custom sections unique to this org?

#### Tone & Voice
- **Formality level:** Very formal / Professional / Conversational / Casual
- **Technical depth:** Deep technical / Balanced / Business-focused / Executive-level
- **Perspective:** First person ("we") / Third person ("the team") / Customer-centric ("you")
- **Sentence style:** Short and punchy / Longer and detailed / Mixed

#### Problem Framing Patterns
- How detailed are customer personas? (one-liner vs. full paragraph)
- Are specific customer names used or anonymized?
- How is severity quantified? (dollars, time, percentages, scores)
- Is there a "day in the life" narrative?
- How is "why now" framed? (market trends, tech shifts, customer demand)

#### Evidence Conventions
- What data sources does this org typically cite?
- How is market data presented? (inline, tables, charts references)
- Are analyst firms referenced? (Gartner, Forrester, IDC)
- How are customer quotes formatted?
- Is competitive analysis detailed or high-level?

#### Positioning Style
- Does the org use a standard positioning framework?
- How are messaging pillars structured?
- Are target segments defined with specific criteria?
- How is the competitive moat articulated?

#### Metrics & Impact Patterns
- What KPIs does this org typically track?
- What timeframes are used for impact projections?
- Are metrics absolute (reduce from X to Y) or relative (reduce by N%)?
- What success criteria format is used?

#### Roadmap Conventions
- What phase names are used? (Alpha/Beta/GA? Private Preview/Public Preview/GA? Phase 1/2/3?)
- How granular are timelines? (Quarters? Months? Sprints?)
- What go/no-go criteria format is used?
- Are design partners named or generalized?

#### Risk Language
- How are risks categorized? (Technical/Business/Adoption? Or different?)
- What likelihood/impact scale? (High/Med/Low? 1-5? Percentage?)
- How detailed are mitigations?
- Are non-goals explicitly listed?

#### FAQ Conventions
- How many FAQs per section?
- What's the typical answer length?
- Are internal FAQs more detailed than external?
- What topics do internal FAQs typically cover?

#### Terminology & Jargon
- Domain-specific terms used
- Product naming conventions
- Internal team names or process names
- Abbreviations and acronyms

### Step 3: Build Style Profile

Compile the analysis into a **Style Profile** stored in `session.json`:

```json
{
  "styleProfile": {
    "samplesAnalyzed": 3,
    "sampleFiles": ["acme-cloudsync.md", "acme-smartalerts.md", "acme-databridge.md"],
    "structure": {
      "sectionOrder": ["exec-summary", "press-release", "problem", ...],
      "customSections": ["Technical Architecture Overview"],
      "avgSectionWordCount": { "problem": 450, "evidence": 600, ... }
    },
    "tone": {
      "formality": "professional",
      "technicalDepth": "balanced",
      "perspective": "customer-centric",
      "sentenceStyle": "short-and-punchy"
    },
    "conventions": {
      "phaseNames": ["Private Preview", "Public Preview", "GA"],
      "timelineGranularity": "quarters",
      "metricStyle": "absolute",
      "riskScale": "high-med-low",
      "faqCount": { "external": 7, "internal": 7 },
      "personaDepth": "detailed-paragraph"
    },
    "terminology": ["cloud-native", "platform engineering", "SRE", ...],
    "patterns": {
      "problemFraming": "starts with persona, then pain, then workaround, then cost",
      "evidenceStyle": "table-heavy with analyst citations",
      "positioningFramework": "standard-geoffrey-moore",
      "roadmapStyle": "quarterly with named design partners"
    }
  }
}
```

### Step 4: Present Style Summary

After analysis, show the user what was learned:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Style Profile — Learned from <N> samples
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Tone:       Professional, customer-centric
  Depth:      Balanced (technical + business)
  Structure:  Standard 12-section + "Tech Architecture"
  Metrics:    Absolute targets (reduce from X to Y)
  Roadmap:    Quarterly, named design partners
  Risks:      High/Med/Low scale with detailed mitigations
  Terminology: cloud-native, SRE, platform engineering
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  AI-generated sections will match this style.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Applying Patterns During Generation

When generating any AI section (Evidence, Positioning, Impact, Roadmap, Risks), always check if a `styleProfile` exists in `session.json`. If it does:

### For Evidence Generation
- Match the data presentation format (tables vs. inline vs. mixed)
- Use similar data source types (if samples cite Gartner, include analyst references)
- Match the competitive analysis depth
- Use the same customer quote format

### For Product Positioning
- Follow the same positioning framework found in samples
- Match messaging pillar structure and count
- Use similar segment definition criteria
- Match moat articulation style

### For Impact
- Use the same metric types and formats found in samples
- Match timeframe conventions (if samples use 6-month projections, do the same)
- Use absolute or relative metrics consistently with samples
- Match success criteria formatting

### For Roadmap
- Use the same phase names as samples
- Match timeline granularity
- Use similar go/no-go criteria structure
- Match the level of detail in feature descriptions per phase

### For Risks
- Use the same risk categories
- Match the likelihood/impact scale
- Use similar mitigation detail level
- Match non-goal formatting

### For Press Release & FAQs
- Match tone, sentence length, and formality
- Use similar FAQ count and answer depth
- Match customer quote style and attribution format

## When No Samples Exist

If `samples/` is empty, use the defaults defined in the other skill files and templates. The agent should still mention that samples can be added:

```
💡 Tip: Drop your org's existing PRFAQs into the samples/
   folder and I'll match your team's writing style.
```

## Refreshing the Style Profile

If the user adds new samples mid-session:
- Re-scan `samples/` when `/start` or `/resume` is run
- Update the style profile in session.json
- Announce any changes to the style profile
