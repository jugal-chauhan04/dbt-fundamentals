with stripe_payment as(
select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert to dollars
    {{ cents_to_dollars('amount',4) }} as amount,
    created as created_at
    
from {{ source('jaffle_shop_raw', 'stripe_payments')}}
)

select * from stripe_payment