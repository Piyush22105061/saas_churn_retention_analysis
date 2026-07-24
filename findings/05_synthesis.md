# 5. Synthesis: Which Finding Should the CFO Escalate First?

## The question

We ran two investigations. M3 looked at retention by signup cohort. M4 looked at what churned
customers do differently from retained ones. Both found something real. The CFO can only push
one to the top of the list — one for product, one for customer success. This page picks one and
explains why.

## What each investigation found

**M3 — Cohort retention:** Newer signup cohorts keep more customers. 2022–2023 cohorts settle
around 10–30% active retention. 2025–2026 cohorts settle around 35–60%, with a few standout
cohorts (2025-01, 2025-06, 2026-02, 2026-05) reaching 50–60%. In almost every cohort, the
biggest drop happens in the first month after signup.

One caveat from the M3 writeup itself matters here: many customers don't start their first
subscription until several months after their recorded signup date. That means part of the
"Month 0→1 drop" is customers who hadn't activated yet, not customers who tried the product and
left. The onboarding story may be partly a measurement artifact, not a pure behavioural one.

**M4 — Behavioural predictors:** Customers who churn go quiet before they leave. They average
77.7 days since their last product activity, versus 38.4 days for customers who stay. In the 30
to 60 days before churn, their activity drops by 62–68%. Retained accounts are also older on
average — 507 days versus 396 days for churned accounts, a 22% gap.

## Where the two investigations agree

They're not just two separate stories — they overlap in one important way. M3 found that
customers who survive the first few months tend to stay active long-term. M4 found, completely
independently, using different data and a different method, that retained accounts are older on
average (507 vs. 396 days). Both point to the same underlying pattern: **early survival predicts
long-term retention.** Two independent methods landing on the same conclusion makes that
conclusion more trustworthy than either investigation alone.

There's also a methods lesson worth carrying forward. M4's own notebook records an earlier
version of this analysis that measured account age against one shared "today" for every account
— which made *churned* accounts look older, purely because retained accounts (mostly recent
signups) hadn't had time to churn yet. That was a measurement artifact, not a real pattern.
Anchoring the calculation to each account's own reference date fixed it and reversed the result
to the one reported above. M3 has an open version of the same kind of problem: the signup-to-
activation lag noted earlier. M4 already caught and fixed its version of this issue; M3 has
flagged its version but not yet corrected for it. That's one more reason to trust M4's numbers
more, as they stand today.

## Why M4 is the one to act on

I scored both findings against four criteria: size of effect, cost to act, organizational fit,
and speed of feedback.

- **Size of effect — does fixing it move the metric?** Both are large enough to matter. M3 shows
  a 3–4x retention gap between old and new cohorts. M4 shows activity dropping by roughly
  two-thirds before churn. Neither wins outright here — and the fact that both independently
  point to "surviving the early period matters" makes the underlying story more solid, even
  though it doesn't decide which one to act on first.
- **Cost to act — can a team actually do something?** M4 is cheap: it turns straight into a
  rule — watch `days_since_last_event`, flag any account that goes quiet, no new tooling
  required. M3 is expensive by comparison: it points at "fix onboarding," but there's nothing to
  fix yet, because the data has no record of marketing campaigns, pricing changes, or product
  releases that would explain *why* newer cohorts do better. The signup-vs-activation lag adds
  to the cost — we're not even fully sure the Month 0→1 drop is a real onboarding problem rather
  than a measurement gap, so acting on it today risks fixing the wrong thing.
- **Organizational fit — is there a team that owns it?** Yes for M4: customer success already
  does outreach to at-risk accounts, so a new flag slots into an existing workflow. M3 belongs to
  product, a slower-moving team, and even then there's no clear starting ticket — just a trend to
  investigate.
- **Speed of feedback — will we know in a month if it worked?** M4 gives an early read fast: flag
  accounts this week, start outreach, and see the first signal within a month, with a fuller read
  by quarter-end. M3 has no equivalent — the only way to judge it is to watch the next cohort
  mature, which takes months no matter when we start.

## Recommendation

**Escalate M4 to customer success first.** Build an at-risk flag using `days_since_last_event`
and `events_last_30d`, route flagged accounts for outreach, and expect an early signal within a
month, a fuller read by quarter-end.

Treat M3 as a **Q4 follow-up for product** — a real trend worth understanding, but one that
needs more data (campaigns, pricing, releases) before it turns into a specific fix. Don't
recommend both at once. Do M4 first, then M3.
