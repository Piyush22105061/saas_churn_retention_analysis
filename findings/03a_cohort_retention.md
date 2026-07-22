# Customer Cohort Retention Analysis

## Business Question

Is customer retention improving over time, or is overall churn being driven by one or two poorly performing signup cohorts?

---

# Approach

Customer retention was analyzed using a monthly cohort framework.

Each company was assigned to a cohort based on its **signup month**, following the project specification. For each month after signup, customers with an **active subscription** at the monthly snapshot were counted and compared against the original cohort size.

### Retention Definition

A customer is considered **retained** if all of the following conditions are satisfied at the monthly snapshot:

- `status = 'active'`
- `start_date <= snapshot_date`
- `end_date IS NULL OR end_date > snapshot_date`

### Methodology

1. Assign every company to a monthly signup cohort.
2. Calculate the original size of each cohort.
3. Generate monthly snapshots (Month 0, Month 1, Month 2, ...).
4. Count customers with an active subscription at each snapshot.
5. Calculate retention percentage using the original cohort size.
6. Visualize retention as a cohort heatmap.
7. Analyze long-term retention patterns across cohorts.

---

# Cohort Retention Heatmap

![Customer Cohort Retention](../figures/cohort_heatmap.png)

---

# Executive Summary

### **Most Important Finding**

**Customer retention has improved across successive signup cohorts. Recent cohorts consistently retain a higher proportion of active customers than earlier cohorts, suggesting improvements in customer quality, onboarding effectiveness, product adoption, or customer success initiatives.**

The heatmap also reveals that the **largest decline in retention occurs immediately after signup**, after which retention stabilizes for customers who remain active. Importantly, no individual cohort consistently underperforms, indicating that churn is not concentrated within a single acquisition period.

---

# Key Findings

## 1. The steepest customer drop occurs immediately after signup

The most significant decline in retention occurs between **Month 0 and Month 1** across nearly every cohort.

Many cohorts lose a substantial proportion of active customers during this initial period, making early onboarding and product activation the highest-risk stage of the customer lifecycle.

After the first few months, retention becomes considerably more stable.

**Business Insight**

Improving customer onboarding and first-month engagement is likely to generate the greatest improvement in long-term retention.

---

## 2. Recent cohorts consistently outperform older cohorts

Comparing cohorts over time reveals a noticeable upward shift in retention performance.

- Early cohorts (2022–2023) generally stabilize between **10% and 30%** active retention.
- More recent cohorts (2025–2026) frequently maintain **35%–60%** active retention during comparable lifecycle stages.

This upward trend suggests that customer retention has improved over successive acquisition periods.

Possible contributors include:

- Improved onboarding processes
- Better customer targeting
- Product enhancements
- Stronger customer success initiatives

Although the heatmap demonstrates improving retention, the available dataset does not contain sufficient business metadata to determine which factor contributed most.

---

## 3. No single cohort consistently underperforms

While retention varies across cohorts, no individual signup cohort remains substantially worse than the others throughout its lifecycle.

Instead, retention differences appear relatively gradual across acquisition periods.

This indicates that overall churn is broadly distributed rather than being driven by one exceptionally poor acquisition campaign or signup month.

---

## 4. Several recent cohorts exhibit particularly strong retention

The strongest retention performance is observed among several recent cohorts, including:

- **2025-01**
- **2025-06**
- **2026-02**
- **2026-05**

These cohorts achieve active retention levels approaching **50–60%** during their observed lifecycle, significantly outperforming many earlier cohorts.

---

## 5. Customers who survive the initial months tend to remain active

After the sharp decline immediately following signup, retention curves become comparatively stable.

Although small month-to-month fluctuations exist, later retention percentages change much more gradually than during the onboarding phase.

This suggests that customers who successfully adopt the product during the early lifecycle are substantially more likely to remain active over time.

---

## 6. Future observation periods are correctly excluded

Recent cohorts contain blank cells in later months because those observation periods have not yet occurred.

Excluding future months prevents unobserved periods from appearing as zero retention and ensures that cohort comparisons remain fair and statistically valid.

---

# Business Interpretation

The cohort analysis suggests that customer retention has improved steadily across newer signup cohorts.

Although customer loss remains concentrated during the first month after signup, customers who remain active beyond the onboarding period exhibit relatively stable long-term retention.

From a business perspective, this indicates that improving customer activation and reducing early churn should remain the highest priority for retention initiatives.

The absence of a consistently poor-performing cohort also suggests that retention improvements should focus on company-wide customer lifecycle optimization rather than targeting a specific acquisition period.

---

# Dataset Limitations

This analysis follows the project specification by assigning cohorts using **customer signup month**.

Retention is measured using the same **active customer definition** established in Milestone 2.

During validation, it was observed that many customers begin their first subscription several months after their recorded signup date. Consequently, early retention values may appear lower than expected because some newly signed-up customers have not yet activated a subscription.

Additionally, while some cohorts demonstrate stronger retention than others, the dataset does not include supporting business information such as:

- Marketing campaigns
- Pricing changes
- Product releases
- Service outages

Therefore, no causal relationship between retention performance and business events can be established from the available data.

---

# Conclusion

The cohort retention analysis demonstrates that **customer retention has improved across successive signup cohorts**, making this the most significant finding from the investigation.

The largest decline in customer retention consistently occurs immediately after signup, highlighting early customer activation as the most critical stage of the customer lifecycle.

Despite differences in retention performance across cohorts, no single signup cohort consistently underperforms. Instead, the results indicate broad improvements in retention over time rather than isolated issues within a particular acquisition period.

Overall, the analysis suggests that continued investment in onboarding, customer activation, and early lifecycle engagement is likely to produce the greatest long-term improvement in customer retention.
