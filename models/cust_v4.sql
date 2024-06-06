 {{
    config(
        materialized='view'
   )
 }}
-- select * from {{source("sahil's sources",'USERS')}}

select *, '{{invocation_id}}' as invocation_id from {{source("sahil's sources",'USERS')}}