# 4. Behavioural Comparison: Churned vs Retained Customers

Unlike the cohort analysis in Milestone 3, which measured **how retention changes over time**, this investigation focuses on **which customer behaviours differ between churned and retained accounts**.

For each account, behavioural features were engineered from the event logs and support ticket data, including:

- Product activity volume
- Recent activity (last 30 and 60 days)
- Engagement recency
- Breadth of feature adoption
- Support ticket behaviour

The customer-level features were then compared between **retained** and **churned** customers using descriptive statistics and Welch's t-test.

---

## Top Behavioural Signals

### 1. Product inactivity is the strongest predictor of churn

The largest behavioural difference was **days since last event**.

- **Retained customers:** 38.4 days on average
- **Churned customers:** 77.7 days on average

Churned customers had been inactive for **over twice as long** before the reference date, indicating that prolonged inactivity is the strongest behavioural signal associated with churn.

---

### 2. Recent product activity drops sharply before churn

Customer engagement during the most recent activity window differs substantially between the two groups.

| Metric | Retained | Churned | Difference |
|--------|---------:|--------:|-----------:|
| Events in last 30 days | 5.4 | 1.8 | **-67.5%** |
| Events in last 60 days | 10.0 | 3.7 | **-62.5%** |

Customers who churn interact with the platform far less frequently in the weeks leading up to churn, making declining activity one of the clearest early warning signals.

---

### 3. Broader product adoption is associated with retention

Retained customers consistently showed higher overall engagement.

| Behaviour | Retained | Churned |
|-----------|---------:|--------:|
| Total events | 42.7 | 22.6 |
| Active days | 33.0 | 19.0 |
| Unique features used | 4.8 | 2.7 |
| Feature categories used | 3.0 | 2.0 |

These results suggest that customers who explore more features and interact with the platform more frequently are more likely to remain subscribed.

---

## Additional Observations

Support ticket behaviour also differed between the two groups.

Retained customers opened more support tickets overall, particularly medium and critical priority tickets. This likely reflects **higher overall engagement with the product**, rather than support requests themselves reducing churn.

In contrast, metrics such as **average CSAT score** and **ticket resolution time** did not show statistically significant differences, suggesting that support quality alone is not sufficient to distinguish churned customers from retained customers.

Retained accounts were also older on average, indicating that customers who remain engaged beyond the initial stages of adoption are more likely to stay long-term.

---

## Overall Finding

Across all behavioural metrics, the clearest pattern is a decline in customer engagement before churn.

Customers who eventually churn:

- become inactive for much longer periods,
- generate significantly fewer recent events,
- use fewer product features,
- and interact with the platform less consistently.

This investigation highlights **engagement recency and activity volume** as the strongest behavioural indicators of churn.

These findings complement the cohort analysis from Milestone 3 by explaining **why** customers are more likely to churn, rather than simply showing **when** retention declines.
---
**Data Quality**
- Scoped to 693 accounts with an unambiguous `active`/`churned` label; `trialing`/`paused`/`past_due`
  accounts (~285) are excluded from this comparison by design.
- `events.account_id`/`user_id` required a type-cast fix (float-string → integer) before any join to
  `accounts` would work at all — flagged here so the same fix is reused in M3 if events end up needed there.
- 198 event-table account_ids are genuine orphans with no matching account; excluded, not otherwise
  investigated.
