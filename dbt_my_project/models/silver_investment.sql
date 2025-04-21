WITH silver AS (
    SELECT * FROM {{ ref('bronze_investment') }}
),

    {{ remove_duplicate_dates_prioritize_fewer_nulls('silver','bronze_investment') }},

    no_duplicate_dates AS (
    SELECT * FROM ranked WHERE row_num = 1
    )

SELECT
    *
FROM no_duplicate_dates