-- Total Active Customers 
WITH active_subscriptions AS (
    SELECT *
    FROM saas.subscriptions
    WHERE status = 'active'
      AND start_date <= CURRENT_DATE
      AND (end_date IS NULL OR end_date > CURRENT_DATE)
)

SELECT COUNT(DISTINCT account_id) AS active_customers
FROM active_subscriptions;

-- Paid Active Customers

WITH active_subscriptions AS (
    SELECT *
    FROM saas.subscriptions
    WHERE status = 'active'
      AND start_date <= CURRENT_DATE
      AND (end_date IS NULL OR end_date > CURRENT_DATE)
)

SELECT COUNT(DISTINCT account_id) AS paid_active_customers
FROM active_subscriptions
WHERE mrr > 0;

-- Free Active Customers 

WITH active_subscriptions AS (
    SELECT *
    FROM saas.subscriptions
    WHERE status = 'active'
      AND start_date <= CURRENT_DATE
      AND (end_date IS NULL OR end_date > CURRENT_DATE)
)

SELECT COUNT(DISTINCT account_id) AS free_active_customers
FROM active_subscriptions
WHERE mrr = 0;

-- Current Paid MRR

WITH normalized_subscriptions AS (

SELECT

    subscription_id,
    account_id,
    user_id,

    CASE
        WHEN LOWER(plan) IN ('professional','pro') THEN 'pro'
        ELSE LOWER(plan)
    END AS plan,

    status,
    start_date,
    end_date,
    cancelled_at,
    mrr,
    seat_count

FROM saas.subscriptions

),

active_subscriptions AS (

SELECT *

FROM normalized_subscriptions

WHERE status='active'
AND (
        end_date IS NULL
        OR end_date > CURRENT_DATE
)

)

SELECT

SUM(mrr) AS current_paid_mrr

FROM active_subscriptions

WHERE plan <> 'free';

-- MRR by Plan

WITH normalized_subscriptions AS (

SELECT

    subscription_id,
    account_id,
    user_id,

    CASE
        WHEN LOWER(plan) IN ('professional','pro') THEN 'pro'
        ELSE LOWER(plan)
    END AS plan,

    status,
    start_date,
    end_date,
    cancelled_at,
    mrr,
    seat_count

FROM saas.subscriptions

),

active_subscriptions AS (

SELECT *

FROM normalized_subscriptions

WHERE status='active'
AND (
        end_date IS NULL
        OR end_date > CURRENT_DATE
)

)

SELECT

plan,

SUM(mrr) AS current_mrr

FROM active_subscriptions

WHERE plan <> 'free'

GROUP BY plan

ORDER BY current_mrr DESC;

-- Monthly Paid Customer Churn

WITH normalized_subscriptions AS (

SELECT

    subscription_id,
    account_id,

    CASE
        WHEN LOWER(plan) IN ('professional','pro') THEN 'pro'
        ELSE LOWER(plan)
    END AS plan,

    status,
    start_date,
    end_date,
    cancelled_at

FROM saas.subscriptions

),

months AS (

SELECT generate_series(

date_trunc('month', CURRENT_DATE) - interval '11 month',

date_trunc('month', CURRENT_DATE),

interval '1 month'

)::date AS month_start

),

monthly_paid AS (

SELECT

m.month_start,

COUNT(DISTINCT s.account_id)

FILTER (

WHERE

s.plan <> 'free'

AND s.start_date < m.month_start

AND (
        s.end_date IS NULL
        OR s.end_date >= m.month_start
)

) AS active_accounts,

COUNT(DISTINCT s.account_id)

FILTER (

WHERE

s.plan <> 'free'

AND s.cancelled_at >= m.month_start

AND s.cancelled_at < m.month_start + interval '1 month'

) AS churned_accounts

FROM months m

CROSS JOIN normalized_subscriptions s

GROUP BY m.month_start

)

SELECT

month_start,

active_accounts,

churned_accounts,

ROUND(

100.0 * churned_accounts /

NULLIF(active_accounts,0)

,2

) AS paid_churn_rate

FROM monthly_paid

ORDER BY month_start;


-- Monthly Free Customer Churn

WITH normalized_subscriptions AS (

SELECT

    subscription_id,
    account_id,

    CASE
        WHEN LOWER(plan) IN ('professional','pro') THEN 'pro'
        ELSE LOWER(plan)
    END AS plan,

    status,
    start_date,
    end_date,
    cancelled_at

FROM saas.subscriptions

),

months AS (

SELECT generate_series(

date_trunc('month', CURRENT_DATE) - interval '11 month',

date_trunc('month', CURRENT_DATE),

interval '1 month'

)::date AS month_start

),

monthly_free AS (

SELECT

m.month_start,

COUNT(DISTINCT s.account_id)

FILTER (

WHERE

s.plan = 'free'

AND s.start_date < m.month_start

AND (
        s.end_date IS NULL
        OR s.end_date >= m.month_start
)

) AS active_accounts,

COUNT(DISTINCT s.account_id)

FILTER (

WHERE

s.plan = 'free'

AND s.cancelled_at >= m.month_start

AND s.cancelled_at < m.month_start + interval '1 month'

) AS churned_accounts

FROM months m

CROSS JOIN normalized_subscriptions s

GROUP BY m.month_start

)

SELECT

month_start,

active_accounts,

churned_accounts,

ROUND(

100.0 * churned_accounts /

NULLIF(active_accounts,0)

,2

) AS free_churn_rate

FROM monthly_free

ORDER BY month_start;

-- Monthly MRR Trend

WITH normalized_subscriptions AS (

SELECT

    subscription_id,
    account_id,

    CASE
        WHEN LOWER(plan) IN ('professional','pro') THEN 'pro'
        ELSE LOWER(plan)
    END AS plan,

    status,
    start_date,
    end_date,
    mrr

FROM saas.subscriptions

),

months AS (

SELECT generate_series(

date_trunc('month', CURRENT_DATE) - interval '11 month',

date_trunc('month', CURRENT_DATE),

interval '1 month'

)::date AS month_start

)

SELECT

m.month_start,

SUM(s.mrr) AS total_mrr

FROM months m

JOIN normalized_subscriptions s

ON s.start_date <= m.month_start

AND (
        s.end_date IS NULL
        OR s.end_date >= m.month_start
)

WHERE s.status='active'

AND s.plan <> 'free'

GROUP BY m.month_start

ORDER BY m.month_start;
