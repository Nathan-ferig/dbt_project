WITH gold AS (
    SELECT * FROM {{ ref('silver_investment') }}
),

preenchido AS (
    SELECT
        date,
        {{ coalesce_todas_colunas(['tv', 'radio', 'ooh', 'meta', 'google', 'tiktok', 'digital'], 0) }}
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
FROM preenchido