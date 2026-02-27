{%set pay_method = ['bank_transfer', 'credit_card', 'coupon', 'gift_card']%}

with payment as
(
    select 
        *
    from 
        {{ ref("stg_stripe__payments") }}
    where
        status = 'success'
),

final as 
(
    select
        order_id,
        {% for method in pay_method %}
            sum(
                    case 
                        when payment_method = '{{method}}' then amount else 0 
                        end
                ) as {{ method }}_amount
            {% if not loop.last %}
                ,
            {% endif %}
        {% endfor %}
    from 
        payment
    group by 1
)

select * from final