{% macro coalesce_todas_colunas(colunas, valor_padrao) %}
        {% for col in colunas %}
            COALESCE({{ col }}, {{ valor_padrao }}) AS {{ col }}{{ "," if not loop.last else "" }}
        {% endfor %}
    {% endmacro %}