# Executive Summary

This project looked at customer churn two ways: by signup cohort (M3) and by customer behaviour
(M4). Then it compared the two and picked one to recommend first (M5).

**1. Newer customers stick around more, and the first month matters most.** Customers who
signed up in 2025–2026 keep 35–60% active retention, versus 10–30% for customers who signed up
in 2022–2023. In almost every group, the biggest drop-off happens in the first month after
signup — though part of that drop is likely customers who hadn't started their subscription yet,
not customers who left, since first subscriptions often start months after the recorded signup
date.

**2. Customers go quiet before they churn.** Customers who end up churning stop using the
product 77.7 days before the cutoff, on average — more than double the 38.4 days for customers
who stay. Their activity also drops 62–68% in the last one to two months before they leave.
Retained accounts are also older on average (507 vs. 396 days) — the same "early survival
matters" pattern the cohort analysis found independently, using completely different data.

**3. The behavioural finding (M4) is the one to act on first.** It's cheap to turn into a rule
(flag accounts that go quiet), it belongs to a team that already does outreach, and we'd see an
early signal within a month. The cohort finding (M3) is real and encouraging, but we can't yet
explain what's driving it — recommended as a slower, Q4 project for product instead of an
immediate action.
