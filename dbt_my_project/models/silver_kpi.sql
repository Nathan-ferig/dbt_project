WITH silver AS (
    SELECT * FROM {{ ref('bronze_kpi') }}
),

    {{ remove_duplicate_dates_prioritize_fewer_nulls('silver','bronze_kpi') }},

    no_duplicate_dates AS (
    SELECT * FROM ranked WHERE row_num = 1
)

SELECT
    *
FROM no_duplicate_dates