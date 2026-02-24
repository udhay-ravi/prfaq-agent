# Section Template: Risks & Tradeoffs

## Purpose
Honestly assess what could go wrong, what you're choosing not to do, and how you'll mitigate the biggest threats. A PRFAQ without risks is a PRFAQ without credibility.

## Target Word Count
300-500 words (plus table)

## Key Questions to Answer

1. **Technical risks:** What could fail technically? Mitigation for each.
2. **Business/market risks:** Timing, competition, market shifts. Mitigation for each.
3. **Adoption risks:** What could prevent customer adoption? Mitigation for each.
4. **Non-goals:** What are you explicitly choosing NOT to do, and why?
5. **Worst-case scenario:** If everything goes wrong, what's the fallback?
6. **Compliance/security:** Any regulatory, security, or compliance considerations?

## Format Guidance

- Use a risk matrix table (Risk | Category | Likelihood | Impact | Mitigation)
- Separate section for non-goals (bullet list with rationale)
- Worst-case scenario as a narrative paragraph
- Compliance as a dedicated subsection

## Good vs. Bad Examples

### Bad Example
> "Risks: There could be some technical challenges. Competition is a risk. Adoption might be slow initially. We'll monitor these closely."

**Why it's bad:** No specific risks, no mitigation plans, "monitor closely" is not a plan.

### Good Example
> | Risk | Category | Likelihood | Impact | Mitigation |
> |------|----------|------------|--------|------------|
> | Cloud provider API rate limits may throttle real-time sync | Technical | Medium | High | Implement intelligent batching + caching; negotiate higher rate limits with providers; degrade gracefully to 5-min sync |
> | AWS releases a native multi-cloud config tool | Market | Low | High | Differentiate on speed and UX; maintain provider-agnostic positioning; build switching costs through policy engine |
> | Customers unwilling to grant cross-cloud API access | Adoption | Medium | Medium | Offer read-only mode first; SOC2 + security whitepaper; design partner testimonials on security posture |
> | Infrastructure state conflicts during simultaneous edits | Technical | Medium | High | Implement optimistic locking; conflict resolution UI; audit log for all changes |
>
> **Non-Goals:**
> - **Single-cloud management:** We will not compete with cloud-native config tools. Our value is cross-cloud.
> - **Cost optimization:** We will not include cloud cost analysis. This is a separate problem space.
> - **Infrastructure provisioning:** We sync and manage existing configs; we don't create new infrastructure.
>
> **Worst-Case Scenario:**
> If adoption stalls after Private Preview (<3 of 5 partners actively using), we'll pivot the product to focus on drift detection and alerting only (monitoring tool rather than sync tool), reducing scope by 60% but delivering immediate value. Engineering investment to that point: ~$400K, recoverable through the monitoring use case.
>
> **Security & Compliance:**
> CloudSync requires read/write access to infrastructure APIs. We will complete SOC2 Type II before GA. All credentials stored in customer's own secrets manager (we never store cloud credentials). Audit logging for all configuration changes. GDPR compliance required for EU customers.

**Why it's good:** Specific risks with likelihood/impact ratings, concrete mitigation plans (not just "monitor"), clear non-goals with rationale, quantified worst-case with a pivot plan, detailed security considerations.

## Checklist

- [ ] At least 4-5 risks identified across categories (technical, business, adoption)
- [ ] Each risk has a specific mitigation plan (not "we'll monitor")
- [ ] Likelihood and impact assessed for each risk
- [ ] 2-3 explicit non-goals with rationale
- [ ] Worst-case scenario described with contingency plan
- [ ] Security/compliance considerations addressed
- [ ] Risks are honest — not minimized or dismissed
