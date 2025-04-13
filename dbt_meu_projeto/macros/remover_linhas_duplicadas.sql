{% macro remover_linhas_duplicadas(table) %}
      SELECT DISTINCT * FROM {{ table }}
    {% endmacro %}