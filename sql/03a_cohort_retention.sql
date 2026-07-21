/*
===============================================================================
Milestone 03: Cohort Retention Analysis
===============================================================================

Business Question:
Is customer retention improving over time, or is overall churn being driven
by one or two poorly performing signup cohorts?

Retention Definition:
Retention = Active companies in a given month after signup
            ÷
            Original cohort size

Project Assumptions:
- Cohort is based on ACCOUNT SIGNUP MONTH (per assignment instructions).
- Month 0 is always 100%.
- A company is considered active if:
      start_date <= snapshot_date
  AND (end_date IS NULL OR end_date > snapshot_date)

Output:
cohort_month
month_offset
cohort_size
retained_accounts
retention_rate

===============================================================================
*/

WITH

/* ---------------------------------------------------------------------------
Step 1: Assign every account to its signup cohort.
Each company belongs to the month in which it signed up.
--------------------------------------------------------------------------- */

cohorts AS (

    SELECT
        account_id,
        DATE_TRUNC('month', signup_date)::date AS cohort_month
    FROM saas.accounts

),

/* ---------------------------------------------------------------------------
Step 2: Calculate the original size of every cohort.
This will be the denominator for retention calculations.
--------------------------------------------------------------------------- */

cohort_sizes AS (

    SELECT
        cohort_month,
        COUNT(DISTINCT account_id) AS cohort_size
    FROM cohorts
    GROUP BY cohort_month

),

/* ---------------------------------------------------------------------------
Step 3: Generate Month 0 to Month 60.

Each month_offset represents the number of months after signup
at which retention will be measured.
--------------------------------------------------------------------------- */

month_offsets AS (

    SELECT generate_series(0,60) AS month_offset

),

/* ---------------------------------------------------------------------------
Step 4: Build every Cohort × Month combination.

For each company we create monthly snapshot dates:

Month 0 = signup month
Month 1 = signup month + 1
Month 2 = signup month + 2
...
--------------------------------------------------------------------------- */

cohort_snapshots AS (

    SELECT

        c.account_id,

        c.cohort_month,

        mo.month_offset,

        (
            c.cohort_month
            +
            (mo.month_offset || ' month')::interval
        )::date AS snapshot_date

    FROM cohorts c

    CROSS JOIN month_offsets mo

),

/* ---------------------------------------------------------------------------
Step 5: Determine whether a company is active at each snapshot.

A company is active if:

start_date <= snapshot_date

AND

(end_date IS NULL
 OR end_date > snapshot_date)

DISTINCT removes duplicate subscriptions for the same account.
--------------------------------------------------------------------------- */

active_accounts AS (

    SELECT DISTINCT

        cs.account_id,

        cs.cohort_month,

        cs.month_offset

    FROM cohort_snapshots cs

    JOIN saas.subscriptions s

      ON cs.account_id = s.account_id

     AND s.start_date <= cs.snapshot_date

     AND (
            s.end_date IS NULL
            OR s.end_date > cs.snapshot_date
         )

),

/* ---------------------------------------------------------------------------
Step 6: Count retained companies for every cohort and month.
--------------------------------------------------------------------------- */

retention_counts AS (

    SELECT

        cohort_month,

        month_offset,

        COUNT(DISTINCT account_id) AS retained_accounts

    FROM active_accounts

    GROUP BY

        cohort_month,

        month_offset

),

/* ---------------------------------------------------------------------------
Step 7: Generate the complete reporting grid.

Without this CROSS JOIN, months having zero retained customers
would disappear from the results.
--------------------------------------------------------------------------- */

cohort_grid AS (

    SELECT

        cs.cohort_month,

        mo.month_offset,

        cs.cohort_size

    FROM cohort_sizes cs

    CROSS JOIN month_offsets mo

)

/* ---------------------------------------------------------------------------
Final Result
--------------------------------------------------------------------------- */

SELECT

    g.cohort_month,

    g.month_offset,

    g.cohort_size,

    /* Month 0 is always 100% of the cohort */

    CASE

        WHEN g.month_offset = 0

            THEN g.cohort_size

        ELSE

            COALESCE(r.retained_accounts,0)

    END AS retained_accounts,

    /* Calculate retention percentage */

    ROUND(

        CASE

            WHEN g.month_offset = 0

                THEN 1.0

            ELSE

                COALESCE(r.retained_accounts,0)::numeric
                /
                g.cohort_size

        END

    ,4) AS retention_rate

FROM cohort_grid g

LEFT JOIN retention_counts r

ON g.cohort_month = r.cohort_month

AND g.month_offset = r.month_offset

ORDER BY

    cohort_month,

    month_offset;