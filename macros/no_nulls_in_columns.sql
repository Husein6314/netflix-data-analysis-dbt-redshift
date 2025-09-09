{% macro no_null_in_columns(model) %}
    select * from {{ model }} where 
    {% for col in adapter.get_columns_in_relation(model) %}
    {{col.column}} is null or
    {% endfor %}
    FALSE
{% endmacro %}

-- {% macro no_nulls_in_columns(model) %}
--     select *
--     from {{ model }}
--     where
--     {% for col in dbt_utils.get_filtered_columns_in_relation(model) %}
--         {{ col.column }} is null
--         {% if not loop.last %} or {% endif %}
--     {% endfor %}
-- {% endmacro %}
