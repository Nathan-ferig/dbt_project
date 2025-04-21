{% macro remove_duplicates(table) %}
      SELECT DISTINCT * FROM {{ table }}
    {% endmacro %}