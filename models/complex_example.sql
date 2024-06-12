select * from {{source("sahil's sources",'PAYMENT_MODES')}}

select 
sum(CASE WHEN PAYMENT_MODE='UPI' THEN SALES END) AS UPI_SALES
,sum(CASE WHEN PAYMENT_MODE='CASH' THEN SALES END) AS CASH_SALES
,sum(case when PAYMENT_MODE='CC' then sales END) AS CC_SALES
,sum(case when PAYMENT_MODE='DC' then sales END) AS DC_SALES
,sum(case when PAYMENT_MODE='VOUCHER' then sales END) AS VOUCHER_SALES
from 
{{source("sahil's sources",'PAYMENT_MODES')}}

-- JINJA LOGIC + SQL

-- {% set payment_modes=['UPI','CASH','CC','DC','VOUCHER'] %}
{% set payment_modes=dbt_utils.get_column_values(source("sahil's sources",'PAYMENT_MODES'),'PAYMENT_MODE') %}

{{payment_modes}}

select
{%for i in payment_modes%}
sum(case when PAYMENT_MODE='{{i}}' then sales end) as {{i}}_sales
{%- if not loop.last -%},{% endif %}
{% endfor %}
from
{{source("sahil's sources",'PAYMENT_MODES')}}


{% set payment_modes=dbt_utils.get_column_values(source("sahil's sources",'PAYMENT_MODES'),'PAYMENT_MODE') %}

{{payment_modes}}

select
{%for i in payment_modes%}
{%- if not loop.first -%},{% endif %} sum(case when PAYMENT_MODE='{{i}}' then sales end) as {{ i | upper}}_SALES
{% endfor %}
from
{{source("sahil's sources",'PAYMENT_MODES')}}


{% set payment_modes=dbt_utils.get_column_values(source("sahil's sources",'PAYMENT_MODES'),'PAYMENT_MODE') %}

{{payment_modes}}

select
{%for i in payment_modes%}
{%- if  loop.index > 1 -%},{% endif %}sum(case when PAYMENT_MODE='{{i}}' then sales end) as {{ i | upper}}_SALES
{% endfor %}
from
{{source("sahil's sources",'PAYMENT_MODES')}}

{% set payment_modes=dbt_utils.get_column_values(source("sahil's sources",'PAYMENT_MODES'),'PAYMENT_MODE') %}

{{payment_modes}}

select
{%for i in payment_modes%}
sum(case when PAYMENT_MODE='{{i}}' then sales end) as {{ i | upper}}_SALES{%- if  loop.index < loop.length -%},{% endif %}
{% endfor %}
from
{{source("sahil's sources",'PAYMENT_MODES')}}






