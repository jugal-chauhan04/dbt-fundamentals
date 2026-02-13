-- WRITE A QUERY SHOWING TOTAL AMOUNT A CUSTOMER HAS SPENT PER ORDER

with order_info as (

    select * from {{ ref('stg_jaffle_shop__orders')}}

),

payment_info as (

    select * from {{ ref('stg_stripe__payments')}}
),

order_payments as (

    select 
        order_id,
        sum (case when status = 'success' then amount end) as amount
    from 
        payment_info
    group by
        order_id
),

final as (

    select 
        order_info.order_id,
        order_info.customer_id,
        order_info.order_date,
        order_payments.amount
    from 
        order_info 
    left join 
        order_payments using (order_id)

)

select * from final

