WITH gold AS (
    SELECT * FROM {{ ref('silver_auxiliar') }}
),

preenchido AS (
    SELECT
        date,
        {{ coalesce_todas_colunas(['holiday'], 0) }}
    FROM gold
)

SELECT
    *
FROM preenchido