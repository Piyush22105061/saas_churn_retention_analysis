# Executive Summary

This sits on top of a real business snapshot: 380 active customers generating $167.7K in
monthly recurring revenue, with Enterprise plans alone contributing nearly two-thirds of that
($109.8K). Paid churn has run 2–4% most months but spiked to 5.37% in May 2026 — the signal that
motivated the two deeper investigations below: by signup cohort (Investigation A) and by
customer behaviour (Investigation B). This summary compares the two and recommends one.

**1. Newer customers stick around more, and the first month matters most.** Customers who
signed up in 2025–2026 keep 35–60% active retention (best cohorts, including 2025-01 and
2026-05, reach 50–60%), versus 10–30% for customers who signed up in 2022–2023. In almost every
cohort, the biggest drop-off happens in the first month after signup — though part of that drop
is likely customers who hadn't started their subscription yet rather than customers who left,
since first subscriptions often begin months after the recorded signup date.

**2. Customers go quiet well before they churn.** Customers who end up churning stop using the
product 77.7 days before the reference date, on average — more than double the 38.4 days for
customers who stay. Their activity also drops 62–68% in the 30 to 60 days before they leave.
Retained accounts are older too (507 vs. 396 days) — the same "early survival matters" pattern
the cohort analysis found independently, using completely different data.

**3. The behavioural finding (Investigation B) is the one to act on first.** It's cheap to turn
into a rule (flag accounts that go quiet), it belongs to a team that already does outreach, and
an early signal would show up within a month. The cohort finding (Investigation A) is real and
encouraging, but the data can't yet explain what's driving it — recommended as a slower project
for product rather than an immediate action. Neither investigation currently breaks its results
out by plan tier, so today's at-risk flag treats a Starter account the same as an Enterprise
one — worth refining once the behavioural rule is live, given how much revenue Enterprise
carries.
