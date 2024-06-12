{{
    config(
        tags=['daily']
    )
}}

select * from {{source("sahil's sources",'USERS')}}
-- getting values of a column
{%- set list_of_countries=dbt_utils.get_column_values(source("sahil's sources",'USERS'),'country') -%}

{%- for i in list_of_countries %}
{%- if i=='US' -%}
   {{i,'ifloop'}}
{% endif -%}
{{i,'forloop'}}
{% endfor -%}
{{list_of_countries,'list_of_countries'}}

{% set list_of_columns =adapter.get_columns_in_relation(source("sahil's sources",'USERS')) %}

{%- for i in list_of_columns%}
{{i.column}}
{%- endfor -%}
-- {{list_of_columns}}
