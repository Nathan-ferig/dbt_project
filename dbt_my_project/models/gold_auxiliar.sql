WITH gold AS (
    SELECT * FROM {{ ref('silver_auxiliar') }}
),

filled AS (
    SELECT
        date,
        {{ coalesce_all_columns(['holiday'], 0) }}
    FROM gold
)

SELECT
    *
FROM filled