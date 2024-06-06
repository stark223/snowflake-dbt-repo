{{config(materialized='view')}}

select * from {{source("sahil's sources",'USERS')}}
UNION ALL
select * from {{source("sahil's sources",'USERS')}}
UNION ALL
select * from {{source("sahil's sources",'USERS')}}