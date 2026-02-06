select
        id as order_id,
        customer as customer_id,
        ordered_at as order_date,
        order_total as amount

from jaffle_shop_raw.raw_orders