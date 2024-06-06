-- select *,
-- ((sales1-sales2)/sales2)*100 as change,
-- ((sales1-sales3)/sales3)*100 as change,
-- ((sales1-cost)/cost)*100 as change
--  from {{source("sahil's sources","person_sales")}}


 select *,
{{perc_change('sales1','sales2')}} as change,
{{perc_change('sales1','sales3')}} as change,
{{perc_change('sales1','cost')}} as change
 from {{source("sahil's sources","person_sales")}}