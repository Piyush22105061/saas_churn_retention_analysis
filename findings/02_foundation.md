# Foundation — Business Definitions, MRR & Topline Churn

## Objective

This milestone establishes standardized business definitions for Active Subscriptions, Customer Churn, and Monthly Recurring Revenue (MRR). These metrics provide a consistent foundation for all subsequent churn and retention analyses.

---

# Business Definitions

## Active Subscription

A subscription is considered active when:

- Status = `active`
- Start Date ≤ Current Date
- End Date is NULL or End Date > Current Date

---

## Active Customer

An active customer is defined as a **unique account** with at least one active subscription.

Customer counts are calculated using:

```sql
COUNT(DISTINCT account_id)
```

This avoids double-counting accounts that hold multiple simultaneous active subscriptions.

---

## Paid Customer

An active customer having at least one active subscription where:

- MRR > 0

---

## Free Customer

An active customer having an active subscription where:

- MRR = 0

---

## Monthly Recurring Revenue (MRR)

MRR is calculated as the sum of the MRR of all active paid subscriptions.

Each active subscription contributes independently to revenue, even if an account owns multiple subscriptions.

---

# Current Business Snapshot

| Metric | Value |
|--------|------:|
| Active Customers | **380** |
| Paid Active Customers | **334** |
| Free Active Customers | **65** |
| Current Paid MRR | **167,679.17** |

---

# Current MRR by Plan

| Plan | Current MRR |
|------|------------:|
| Enterprise | **109,815.18** |
| Pro | **51,065.98** |
| Starter | **6,798.01** |

Enterprise contributes nearly two-thirds of recurring revenue.

---

# Monthly Paid Customer Churn

| Month | Active Customers | Churned Customers | Churn Rate |
|------|-----------------:|------------------:|-----------:|
| Aug 2025 | 402 | 16 | 3.98% |
| Sep 2025 | 419 | 11 | 2.63% |
| Oct 2025 | 435 | 12 | 2.76% |
| Nov 2025 | 463 | 12 | 2.59% |
| Dec 2025 | 475 | 13 | 2.74% |
| Jan 2026 | 514 | 12 | 2.33% |
| Feb 2026 | 534 | 16 | 3.00% |
| Mar 2026 | 561 | 23 | 4.10% |
| Apr 2026 | 590 | 23 | 3.90% |
| May 2026 | 615 | 33 | 5.37% |
| Jun 2026 | 643 | 20 | 3.11% |
| Jul 2026 | 632 | 15 | 2.37% |

---

# Monthly Free Customer Churn

| Month | Active Customers | Churned Customers | Churn Rate |
|------|-----------------:|------------------:|-----------:|
| Aug 2025 | 61 | 0 | 0.00% |
| Sep 2025 | 62 | 2 | 3.23% |
| Oct 2025 | 70 | 2 | 2.86% |
| Nov 2025 | 73 | 2 | 2.74% |
| Dec 2025 | 74 | 2 | 2.70% |
| Jan 2026 | 79 | 3 | 3.80% |
| Feb 2026 | 88 | 4 | 4.55% |
| Mar 2026 | 97 | 3 | 3.09% |
| Apr 2026 | 99 | 3 | 3.03% |
| May 2026 | 112 | 3 | 2.68% |
| Jun 2026 | 121 | 3 | 2.48% |
| Jul 2026 | 121 | 2 | 1.65% |

---

# Monthly MRR Trend

| Month | Total MRR |
|------|----------:|
| Aug 2025 | 105,888.55 |
| Sep 2025 | 111,637.54 |
| Oct 2025 | 119,442.83 |
| Nov 2025 | 126,759.02 |
| Dec 2025 | 129,798.28 |
| Jan 2026 | 133,972.70 |
| Feb 2026 | 135,221.25 |
| Mar 2026 | 146,264.99 |
| Apr 2026 | 151,176.18 |
| May 2026 | 164,696.56 |
| Jun 2026 | 172,056.11 |
| Jul 2026 | 170,528.34 |

---

# Key Findings

- The business currently has **380 active customer accounts**.
- **334 customers** generate recurring revenue through paid subscriptions.
- **65 customers** are currently on free plans.
- Current Monthly Recurring Revenue is **167,679.17**.
- Enterprise subscriptions contribute the largest share of revenue (**109.8K MRR**).
- Paid customer churn remained relatively stable between **2–4%** for most months, with a temporary spike to **5.37%** in May 2026.
- Free-plan churn remained consistently low throughout the analysis period.
- Monthly recurring revenue increased steadily from **105.9K** to over **170K**, indicating healthy revenue growth despite periodic customer churn.

---

# Important Note

Some customer accounts maintain multiple simultaneous active subscriptions across different plans. Therefore:

- Customer metrics are calculated using `COUNT(DISTINCT account_id)`.
- Revenue metrics are calculated at the subscription level by summing the MRR of all active subscriptions.

This prevents customer overcounting while ensuring recurring revenue is measured accurately.
