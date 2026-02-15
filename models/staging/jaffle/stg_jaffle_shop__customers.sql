with customers_cte as(
        
        select
        id as customer_id,
        first_name,
        last_name

from {{ source('jaffle_shop_raw', 'raw_customers')}}
)

select * from customers_cte