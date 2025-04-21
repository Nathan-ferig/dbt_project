WITH gold AS (
    SELECT * FROM {{ ref('silver_investment') }}
),

filled AS (
    SELECT
        date,
        {{ coalesce_all_columns(['tv', 'radio', 'ooh', 'meta', 'google', 'tiktok', 'digital'], 0) }}
    FROM gold
)

SELECT
    date ,
    tv,
    radio,
    ooh,
    meta,
    google,
    tiktok,
    digital AS display_video
FROM filled