WITH silver AS (
    SELECT * FROM {{ ref('bronze_investment') }}
),

    {{ remover_datas_duplicadas_prioriza_menos_nulos('silver','bronze_investment') }},

    sem_datas_repetidas AS (
    SELECT * FROM ranked WHERE row_num = 1
    )

SELECT
    *
FROM sem_datas_repetidas