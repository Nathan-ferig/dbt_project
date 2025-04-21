WITH bronze AS (
    SELECT * FROM {{ source('sample_data', 'marketing_data') }}
),

    no_duplicates AS (
        {{ remove_duplicates('bronze') }}
    )

SELECT
    date,
    tv, radio, ooh, meta, google, tiktok, digital
FROM no_duplicates