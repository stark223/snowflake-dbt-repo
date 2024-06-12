{{config(
    materialized='incremental'
)}}


select * from {{source("sahil's sources",'DIM_SALES')}} t1

{% if is_incremental() %}
where
t1.date > (select max(date) from {{this}})
{% endif %}