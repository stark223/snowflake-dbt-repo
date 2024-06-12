 {{
    config(
        materialized='view',
        alias="new_table_name"
   )
 }}
-- select * from {{source("sahil's sources",'USERS')}}

select *, '{{invocation_id}}' as invocation_id from {{source("sahil's sources",'USERS')}}