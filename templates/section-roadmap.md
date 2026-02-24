# Section Template: Roadmap

## Purpose
Define the phased rollout plan from Private Preview through GA, with clear milestones, audiences, and go/no-go criteria.

## Target Word Count
300-500 words (plus table)

## Key Questions to Answer

1. **Private Preview:** Core features, target customers (3-5 design partners), success criteria, timeline.
2. **Public Preview:** Additional features, expanded audience, feedback mechanisms, timeline.
3. **General Availability:** Full feature set, SLA commitments, pricing, support model, timeline.
4. **Dependencies:** What must be in place before each phase?
5. **Go/No-Go criteria:** What must be true to advance to the next phase?

## Format Guidance

- Use a table for the phase comparison (phases as columns)
- List dependencies separately below the table
- Make go/no-go criteria specific and measurable
- Include both feature and quality milestones

## Good vs. Bad Examples

### Bad Example
> "Phase 1: Basic features. Phase 2: More features. Phase 3: All features. Timeline: 6-12 months."

**Why it's bad:** No specifics on features, no audience definition, no success criteria, vague timeline, no go/no-go criteria.

### Good Example
> | Aspect | Private Preview | Public Preview | GA |
> |--------|----------------|----------------|----|
> | **Timeline** | Q2 2025 (8 weeks) | Q3 2025 (10 weeks) | Q4 2025 |
> | **Features** | AWS+GCP sync, drift detection, alerting | + Azure, auto-remediation, audit log | + Custom policies, API, SSO, RBAC |
> | **Audience** | 5 design partners (DataFlow, Acme Corp, TechNova, ScaleUp, CloudFirst) | Up to 50 companies via waitlist | All Enterprise tier customers |
> | **Success Criteria** | 80% DAU, <5 min drift detection, NPS 40+ | <1% error rate, 90% auto-remediation success | 99.9% uptime, <2s detection latency |
> | **Go/No-Go** | — | All Private Preview criteria met + no P1 bugs for 2 weeks | All Public Preview criteria met + SOC2 audit complete |
> | **Support** | Dedicated Slack channel, weekly syncs | Community forum + priority support | Full support SLA (4hr P1 response) |
>
> **Dependencies:**
> - Cloud provider API access agreements (complete by Q1 2025)
> - SOC2 Type II audit completion (required for GA)
> - Terraform provider support for all three clouds
>
> **Phase Transition Criteria:**
> - **Private → Public:** All 5 design partners actively using; NPS 40+; no unresolved P1/P2 bugs; auto-remediation success rate >85%
> - **Public → GA:** 50+ companies onboarded; 99.9% uptime for 30 consecutive days; SOC2 complete; pricing validated with 10+ customers

**Why it's good:** Specific timelines, named design partners, measurable criteria, clear dependencies, concrete go/no-go gates.

## Checklist

- [ ] All three phases defined with specific timelines
- [ ] Features listed per phase (incremental, not repeated)
- [ ] Audience defined per phase (specific companies for Private Preview)
- [ ] Success criteria are measurable for each phase
- [ ] Go/no-go criteria are specific and binary (met or not met)
- [ ] Dependencies are listed with target completion dates
- [ ] Support model defined per phase
