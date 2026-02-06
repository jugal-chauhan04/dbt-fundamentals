select
    id as order_id,
    customer as customer_id,
    order_total as amount

from 
    jaffle_shop_raw.raw_orders