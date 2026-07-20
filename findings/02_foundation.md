# Foundation — Business Definitions, MRR & Topline Churn

## Objective

Before analyzing churn drivers and customer retention, it is essential to establish consistent business definitions for key SaaS metrics. Different teams often calculate metrics such as churn and MRR differently, leading to inconsistent reporting. This milestone standardizes the definitions of **Active Subscription**, **Customer Churn**, and **Monthly Recurring Revenue (MRR)** to provide a reliable foundation for all subsequent analyses.

---

# Business Definitions

## Active Subscription

A subscription is considered **active** if it satisfies both of the following conditions:

- `status = 'active'`
- `end_date IS NULL` or `end_date > CURRENT_DATE`

Subscriptions with statuses such as `trialing`, `paused`, `past_due`, and `churned` are excluded from the active customer base.

## Churned Customer

A customer is classified as churned when a valid `cancelled_at` timestamp exists.

Monthly customer churn is calculated using the standard SaaS methodology:

> **Monthly Customer Churn = Customers Churned During the Month ÷ Customers Active at the Beginning of the Month**

Using customers active at the **start of the month** as the denominator ensures that only customers who were genuinely at risk of churning are included in the calculation.

## Monthly Recurring Revenue (MRR)

Current MRR is calculated as the sum of the `mrr` field across all active **paid** subscriptions.

Free plans are excluded because they do not generate recurring revenue.

---

# Current Business Snapshot

The platform currently has **437 active customer accounts**, comprising **379 paid customers** and **58 free users**.

Paid subscriptions generate a total **Monthly Recurring Revenue (MRR) of $167,679**.

### Active Customer Distribution

| Customer Type | Active Accounts |
|---------------|----------------:|
| Paid Customers | **379** |
| Free Users | **58** |
| **Total Active Customers** | **437** |

### Revenue Distribution by Plan

| Plan | Active Accounts | Current MRR | Share of Total MRR |
|------|----------------:|------------:|-------------------:|
| Enterprise | **106** | **$109,815** | **65.4%** |
| Pro | **186** | **$51,066** | **30.5%** |
| Starter | **87** | **$6,798** | **4.1%** |
| **Total Paid** | **379** | **$167,679** | **100%** |

---

# Key Observations

The customer base is concentrated in the **Pro** plan, which accounts for nearly **49% of all paid customers (186 of 379)**. However, the **Enterprise** tier contributes almost **two-thirds (65.4%)** of total Monthly Recurring Revenue despite representing only **28% of paid customers (106 accounts)**.

This indicates a significant difference between **customer volume** and **revenue contribution**. While Pro serves as the largest acquisition segment, Enterprise customers contribute substantially more revenue per account and therefore represent the highest-value customer segment.

The Starter plan consists of **87 active customers**, but contributes only **4.1%** of total MRR, suggesting a relatively low revenue per customer compared with the higher-tier plans.

The platform also maintains **58 active free users**, representing approximately **13% of the total active customer base**. Although these users do not contribute directly to recurring revenue, they represent a potential conversion opportunity for future revenue growth.

---

# Monthly Customer Churn

Paid customer churn remained relatively stable over the last twelve months, fluctuating between **2.3% and 5.3%**.

The highest churn rate was observed in **May 2026 (5.34%)**, after which churn declined to **2.37%** in **July 2026**, indicating no sustained deterioration in customer retention.

Free-plan churn was analysed separately because free users typically exhibit different behavioural patterns and do not directly affect recurring revenue. As a result, paid customer churn is used as the primary executive retention KPI throughout the remainder of this project.

---

# Overall Business Health

The current business exhibits several positive characteristics:

- Stable recurring revenue of **$167.7K** generated from **379 paying customers**.
- A sizeable customer base of **437 active accounts**, including both paid and free users.
- Healthy paid customer churn, consistently remaining within the **2–5%** range over the last year.
- Strong revenue contribution from Enterprise customers, indicating successful monetization of premium subscriptions.
- A meaningful free-user population that provides opportunities for future customer conversion and revenue expansion.

---

# Key Findings

- Established standardized definitions for **Active Subscription**, **Customer Churn**, and **Monthly Recurring Revenue (MRR)** that will be used consistently throughout the project.
- The business currently has **437 active customers**, including **379 paid subscribers** and **58 free users**.
- Current Monthly Recurring Revenue is **$167,679**, generated entirely from paid subscriptions.
- Revenue is highly concentrated in the **Enterprise** tier, which contributes **65.4%** of total MRR while accounting for only **106 active customers**.
- The **Pro** plan represents the largest customer segment (**186 active customers**) and offers the greatest opportunity for expansion through upgrades and upselling.
- Paid customer churn has remained stable between **2% and 5%**, indicating healthy retention performance over the observed period.
- The standardized metrics established in this milestone provide a robust analytical foundation for the cohort retention, behavioural analysis, and predictive churn modelling developed in subsequent milestones.
