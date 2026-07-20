# Foundation — Definitions, MRR & Topline Churn

## Objective

The objective of this analysis is to establish consistent business definitions for **active subscriptions**, **churn**, and **Monthly Recurring Revenue (MRR)**. These definitions serve as the foundation for all subsequent retention and churn analyses in this project.

## Business Definitions

### Active Subscription

An active subscription is defined as a subscription that:

* Has a status of **`active`**
* Has **no end date**, or its **end date is later than the current date**

Subscriptions in `trialing`, `paused`, `past_due`, or `churned` states are excluded from the active customer base.

### Churned Subscription

A customer is considered churned if the subscription has a populated `cancelled_at` date. Monthly customer churn is calculated using the standard SaaS formula:

> **Monthly Churn Rate = Customers Churned During the Month ÷ Customers Active at the Beginning of the Month**

The denominator includes only accounts that were active on the first day of the month, ensuring that customers who joined during the month are not incorrectly considered at risk of churning.

### Monthly Recurring Revenue (MRR)

Current MRR is calculated as the sum of the `mrr` field for all active paid subscriptions. Free plans are excluded because they do not generate recurring revenue.

---

# Current MRR

The current **paid MRR is approximately $167,679**.

MRR is heavily concentrated in higher-tier plans:

| Plan       | Current MRR |
| ---------- | ----------: |
| Enterprise |    $109,815 |
| Pro        |     $51,066 |
| Starter    |      $6,798 |

Although Enterprise accounts represent a smaller share of active subscriptions, they contribute nearly two-thirds of total recurring revenue, indicating that revenue is concentrated among higher-value customers.

---

# Monthly Customer Churn

Paid-plan monthly churn remained relatively stable over the last twelve months, fluctuating between **2.3% and 5.3%**. Churn peaked in **May 2026 (5.34%)** before returning to **2.37%** in July 2026. Overall, the trend remains within a healthy range for a subscription SaaS business and does not indicate sustained deterioration in customer retention.

Free-plan churn was analysed separately because free users behave differently from paying customers and do not directly impact recurring revenue. Consequently, paid customer churn is used as the primary executive KPI throughout the remainder of this project.

---

# Key Findings

* Current paid MRR is approximately **$167.7K**.
* Enterprise customers generate the largest share of recurring revenue despite representing fewer active subscriptions than the Pro plan.
* Paid customer churn remained relatively stable throughout the observation period, generally staying between **2% and 5%**.
* Business definitions for active subscriptions and churn have been standardized and will be reused consistently in the cohort retention and behavioural churn analyses in subsequent milestones.
