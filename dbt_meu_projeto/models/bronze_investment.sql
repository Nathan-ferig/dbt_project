WITH bronze AS (
    SELECT * FROM {{ source('sample_data', 'marketing_data') }}
),

    sem_duplicadas AS (
        {{ remover_linhas_duplicadas('bronze') }}
    )

SELECT
    date,
    tv, radio, ooh, meta, google, tiktok, digital
FROM sem_duplicadas