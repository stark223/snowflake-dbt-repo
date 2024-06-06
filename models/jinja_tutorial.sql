-- Data types in jinja
{{"sahil"}}
{{23456}}
{{['a','b','c']}}
{{{"name":"sahil","bootcamp":"dbt"}}}


--variables in jinja
{%- set var1="sahil" -%}
{%- set var2=true -%}
{{var1}}
{{var2}}

-- Conditional Logics
--IF condition

{% if 1==2 %}
  {{"I am inside first block"}}
{% else %}
   {{"I am inside a second block"}}
{% endif %}

--IF ELSEIF CONDITION
{% if 1==3 %}
  {{"I am inside first block"}}
{% elif 1==1 %}
   {{"I am inside a second block"}}
{% else %}
   {{"Iam inside a third block"}}
{% endif %}

--FOR LOOP
{%- for i in [1,2,3]-%}
{{i}}
{% endfor %}
