# Skill: PRFAQ Review & Scoring

This skill defines how to review, score, and critique a PRFAQ document across all 7 dimensions.

## Scoring Rubric (1-5 per dimension)

### Dimension 1: Problem Statement [USER INPUT]
5 = Specific persona, quantified pain, clear frequency/severity, compelling urgency, trend analysis
1 = Problem unclear or builder-perspective

### Dimension 2: Solution [USER INPUT]
5 = Clear one-liner, detailed journey, strong differentiation, magic moment, authentic quote
1 = Vague, no customer perspective

### Dimension 3: Evidence [AI-GENERATED]
5 = TAM/SAM/SOM with sources, detailed competitive matrix, real market data, citations
1 = No market analysis or fabricated data

### Dimension 4: Product Positioning [AI-GENERATED]
5 = Clear positioning statement, defined category, strong value prop, messaging pillars, segment prioritization, defensible moat
1 = No positioning or contradicts problem/solution

### Dimension 5: Impact [AI-GENERATED]
5 = Specific metrics with targets, clear timeline, measurement plan
1 = Missing or purely aspirational

### Dimension 6: Roadmap [AI-GENERATED]
5 = Clear 3-phase plan with features, timelines, audiences, go/no-go criteria
1 = No roadmap or undifferentiated timeline

### Dimension 7: Risks & Tradeoffs [AI-GENERATED]
5 = Comprehensive risks, specific mitigations, clear non-goals, worst-case contingency
1 = Missing or dismissed

## Anti-Pattern Checks
Solution-first thinking, Vague metrics, Missing customer voice, Builder language, Unsourced evidence, Generic positioning, Hand-wavy risks, Kitchen sink roadmap, No urgency, Missing non-goals, Weak moat.

## Overall Score = Average of 7 dimensions
- 4.0+ = READY
- 3.0-3.9 = NEEDS WORK
- Below 3.0 = NOT READY

## Output Format
1. Overall Score (stars)
2. Per-Dimension Scores table (mark User Input vs AI-Generated)
3. Top 3 Strengths
4. Top 3 Areas for Improvement
5. Anti-Pattern Check table
6. Readiness Assessment

For user-input dimensions: suggest user provide more details.
For AI-generated dimensions: offer to regenerate with improvements.
