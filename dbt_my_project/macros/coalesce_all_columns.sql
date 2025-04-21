{% macro coalesce_all_columns(columns, default_value) %}
        {% for col in columns %}
            COALESCE({{ col }}, {{ default_value }}) AS {{ col }}{{ "," if not loop.last else "" }}
        {% endfor %}
    {% endmacro %}