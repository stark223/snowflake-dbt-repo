{{config(materialized='table')}}
select * from DB_ECOMM.SC_ECOMM.USERS
UNION ALL
select * from DB_ECOMM.SC_ECOMM.USERS
UNION ALL
select * from DB_ECOMM.SC_ECOMM.USERS