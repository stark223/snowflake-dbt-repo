select * from {{ref('marketing_stg')}} 
where SALES > 1000

-- select * from {{source("sahil's sources",'marketing')}}
-- where sales > 1000