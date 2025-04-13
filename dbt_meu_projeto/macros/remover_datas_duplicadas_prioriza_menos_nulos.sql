{% macro remover_datas_duplicadas_prioriza_menos_nulos(table,ref_col) %}
    {%- set cols = dbt_utils.get_filtered_columns_in_relation(ref(ref_col)) -%}

    ranked AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY date
                ORDER BY
                    (
                        {%- for col in cols %}
                            (CASE WHEN {{ col }} IS NULL THEN 1 ELSE 0 END){% if not loop.last %} + {% endif %}
                        {%- endfor %}
                    ) ASC
            ) AS row_num
        FROM {{ table }}
        WHERE date IS NOT NULL
    )
    {% endmacro %}