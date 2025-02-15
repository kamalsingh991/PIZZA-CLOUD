-- 13. Analyze the cumulative revenue generated over time.

select order_date,round(sum(Revenue) over (order by order_date) ,2)as Cum_Revenue 
from
(select orders.order_date, round(sum(pizzas.price * order_details.quantity),2) as Revenue
from orders join order_details on
orders.order_id = order_details.order_id join pizzas on
order_details.pizza_id = pizzas.pizza_id
group by orders.order_date)as Sales;