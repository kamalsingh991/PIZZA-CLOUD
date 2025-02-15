-- 14. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name,category,Revenue
from
(select name,category,Revenue, rank() over (partition by category order by Revenue desc) as Rank_Revenue
from
(select pizza_types.name, pizza_types.category, round(sum(pizzas.price * order_details.quantity),2) as Revenue
from pizza_types 
join pizzas on
pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on 
pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where Rank_Revenue <=3
