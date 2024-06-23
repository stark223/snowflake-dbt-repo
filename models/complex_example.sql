select *
from {{ source("sahil's sources", "PAYMENT_MODES") }}

select
    sum(case when payment_mode = 'UPI' then sales end) as upi_sales,
    sum(case when payment_mode = 'CASH' then sales end) as cash_sales,
    sum(case when payment_mode = 'CC' then sales end) as cc_sales,
    sum(case when payment_mode = 'DC' then sales end) as dc_sales,
    sum(case when payment_mode = 'VOUCHER' then sales end) as voucher_sales
from
    {{ source("sahil's sources", "PAYMENT_MODES") }}

    -- JINJA LOGIC + SQL
    -- {% set payment_modes=['UPI','CASH','CC','DC','VOUCHER'] %}
    {% set payment_modes = dbt_utils.get_column_values(
        source("sahil's sources", "PAYMENT_MODES"), "PAYMENT_MODE"
    ) %}

    {{ payment_modes }}

select
    {% for i in payment_modes %}
        sum(case when payment_mode = '{{i}}' then sales end) as {{ i }}_sales
        {%- if not loop.last -%},{% endif %}
    {% endfor %}
from
    {{ source("sahil's sources", "PAYMENT_MODES") }}

    {% set payment_modes = dbt_utils.get_column_values(
        source("sahil's sources", "PAYMENT_MODES"), "PAYMENT_MODE"
    ) %}

    {{ payment_modes }}

select
    {% for i in payment_modes %}
        {%- if not loop.first -%}
            ,
        {% endif %} sum(
            case when payment_mode = '{{i}}' then sales end
        ) as {{ i | upper }}_sales
    {% endfor %}
from
    {{ source("sahil's sources", "PAYMENT_MODES") }}

    {% set payment_modes = dbt_utils.get_column_values(
        source("sahil's sources", "PAYMENT_MODES"), "PAYMENT_MODE"
    ) %}

    {{ payment_modes }}

select
    {% for i in payment_modes %}
        {%- if loop.index > 1 -%}
            ,
        {% endif %} sum(
            case when payment_mode = '{{i}}' then sales end
        ) as {{ i | upper }}_sales
    {% endfor %}
from
    {{ source("sahil's sources", "PAYMENT_MODES") }}

    {% set payment_modes = dbt_utils.get_column_values(
        source("sahil's sources", "PAYMENT_MODES"), "PAYMENT_MODE"
    ) %}

    {{ payment_modes }}

select
    {% for i in payment_modes %}
        sum(case when payment_mode = '{{i}}' then sales end) as {{ i | upper }}_sales
        {%- if loop.index < loop.length -%},{% endif %}
    {% endfor %}
from {{ source("sahil's sources", "PAYMENT_MODES") }}

-- ASSIGNMENT
select *
from {{ source("sahil's sources", "DIM_CURRENCY") }}
