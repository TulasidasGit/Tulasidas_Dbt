{{
    config
    (
        materialized ='table'
    )
}}
with customer_src as (
select 
CUST_ID,
FIRST_NAME ,
LAST_NAME ,
EMAIL ,
PHONE ,
COUNTRY ,
CREATED_AT ,
current_timestamp as insert_new
from {{source('customer','CUSTOMER_SRC')}}
)
select * from customer_src