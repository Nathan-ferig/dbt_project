WITH bronze AS (
    SELECT * FROM {{ source('sample_data', 'marketing_data') }}
),

    no_duplicates AS (
        {{ remove_duplicates('bronze') }}
    )

SELECT
    date,
    holiday
FROM no_duplicates