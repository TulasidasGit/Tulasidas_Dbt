{{
    config(
        materialized ='incremental',
        incremental_strategy ='append'
    )
}}
with sales_src as 
(
    select 
    SALE_ID,
    PRODUCT_NAME,
    CREATED_AT,
    current_timestamp as insert_new
    from {{source('sales','SALES_SRC')}}

    {% if is_incremental()%}
    where CREATED_AT > (select max(insert_new) from {{this}})

    {% endif %}
)
select * from sales_src