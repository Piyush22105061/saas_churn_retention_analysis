# Cohort Retention Analysis

## Business Question

The CFO wanted to determine whether customer churn is worsening over time or whether overall churn is being disproportionately influenced by one particularly weak signup cohort.

To answer this, customers were grouped into monthly signup cohorts based on their signup date. For each cohort, monthly retention was calculated as the percentage of companies that remained active at the beginning of each month after signup. Customer activity was measured at the account level, ensuring renewals, upgrades, overlapping subscriptions, and customer reactivations were handled correctly without double-counting.

---

# Executive Summary

### Most Important Observation

**The cohort analysis does not indicate that one exceptionally poor signup cohort is dragging down overall company retention. Instead, more recent cohorts consistently achieve stronger long-term retention than earlier cohorts, suggesting that customer retention has gradually improved over time.**

This finding suggests that churn is becoming healthier across successive customer cohorts rather than being driven by a single historical acquisition period.

---
# Customer Cohort Retention Heatmap

![Customer Cohort Retention](../figures/heat_map.png)

*Figure 1. Customer retention by monthly signup cohort.*
# Key Findings

## 1. Where is the steepest drop?

The largest decline occurs immediately after customer acquisition.

While every cohort begins at **100% retention in Month 0**, most cohorts experience their sharpest reduction during the first few months following signup. Month 1 retention for many early cohorts falls into the **0–15%** range before gradually recovering and stabilising.

This indicates that the highest customer loss occurs during the early lifecycle, making onboarding and initial customer engagement the most critical stages for improving retention.

---

## 2. Where does retention stabilize?

After approximately **6–12 months**, retention becomes considerably more stable.

Instead of continuing to decline rapidly, most cohorts settle into a relatively consistent long-term retention range between **45% and 65%**, depending on the cohort.

The stabilization suggests that customers who remain active beyond their initial lifecycle become significantly more likely to continue using the product over the long term.

---

## 3. Are newer cohorts performing better?

Yes.

Comparing older cohorts (2022–2023) with more recent cohorts (2024–2026) reveals a gradual improvement in long-term retention.

Recent cohorts consistently achieve darker green retention levels across comparable lifecycle months, indicating that a larger proportion of customers remain active over time.

Although the improvement is gradual rather than dramatic, the overall direction suggests healthier customer retention among more recently acquired customers.

---

## 4. Is one bad cohort dragging down the average?

No.

No individual signup cohort consistently underperforms neighbouring cohorts by a significant margin.

Although small variations exist between individual cohorts, the heatmap does not reveal one exceptionally weak cohort responsible for the company's overall churn performance.

Instead, retention patterns remain relatively consistent across acquisition periods.

This suggests that company-wide churn reflects general customer behaviour rather than one isolated acquisition campaign or operational issue.

---

## 5. Are there any anomalous cohorts?

No major anomalies are visible.

Several cohorts perform slightly better or worse than adjacent cohorts, but none display a sustained deviation large enough to indicate an exceptional event.

There is no visual evidence of:

- sudden retention collapse,
- dramatic improvement,
- isolated customer loss,
- or one-off cohort failure.

---

# Observation, Inference and Limitation

## Observation

The heatmap demonstrates that newer signup cohorts generally retain customers better over the long term than earlier cohorts. Retention behaviour remains relatively consistent across acquisition periods, with no evidence of one cohort disproportionately driving overall churn.

## Inference

The improving performance of recent cohorts **may indicate** improvements in customer onboarding, product adoption, customer success initiatives, subscription management, or acquisition quality.

Because multiple consecutive cohorts exhibit similar behaviour, the improvement appears gradual rather than being caused by one exceptional cohort.

## Limitation

The dataset contains subscription history but does **not** include campaign records, pricing changes, feature releases, customer success initiatives, or operational incident logs.

Therefore, while retention improvements can be observed, it is **not possible to establish a causal relationship** between the observed trend and any specific business event.

The analysis identifies behavioural patterns but cannot explain their underlying causes without additional business context.

---

# Real-World Event Assessment

The cohort heatmap does not provide evidence linking retention changes to any specific real-world event such as:

- Marketing campaigns
- Pricing changes
- Product launches
- Service outages
- Operational incidents

Since the dataset lacks business event metadata, no causal attribution can be made.

Any explanation beyond observed retention patterns would be speculative.

---

# Business Interpretation

From a CFO perspective, the analysis suggests that the company is **not experiencing worsening churn caused by one exceptionally poor acquisition cohort**.

Instead, retention behaviour appears relatively stable across customer cohorts, while more recent cohorts demonstrate healthier long-term retention than earlier cohorts.

The most significant opportunity lies in reducing customer loss immediately after signup, where retention declines most sharply. Improvements in onboarding, activation, and early customer engagement are therefore likely to have the greatest impact on overall retention.

The stronger long-term performance of recent cohorts also suggests that current customer acquisition and lifecycle management practices are moving in a positive direction and should continue to be reinforced.

---

# Conclusion

The cohort retention analysis shows that customer retention has gradually improved across successive signup cohorts, with newer customers remaining active longer than earlier cohorts.

Most customer attrition occurs during the first few months after signup, after which retention stabilizes and remains relatively consistent.

Importantly, no individual cohort appears responsible for dragging down overall company performance. Instead, churn is best understood as a portfolio-wide customer lifecycle challenge rather than the consequence of one isolated acquisition period.

Overall, the findings indicate that recent operational improvements may be positively influencing customer retention, although additional business data would be required to determine the precise drivers behind this trend.
