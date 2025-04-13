{% macro interpolar_sales(table_ref) %}
    (
        SELECT
            *,
            IFNULL(
                sales,
                (
                    LAG(sales) OVER (ORDER BY date) + LEAD(sales) OVER (ORDER BY date)
                ) / 2
            ) AS sales_interpolado
        FROM {{ table_ref }}
    )
    {% endmacro %}