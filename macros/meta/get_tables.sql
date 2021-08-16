{% macro get_tables() %}
    select table_name, time_filter
    from {{ ref('re_data_tables') }}
    where
        time_filter is not null and
        actively_monitored = true
    order by id
{% endmacro %}

-- think about handling cases for null time_filter
-- computing max/min etc. should be possible just 
-- those queries can run without filter -- will be much larget then