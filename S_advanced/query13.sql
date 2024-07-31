-- Determine the top 3 most ordered pizza types
-- based on revenue for each category.
select name, revenue from 
( select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
   (select pizza_types.category,
    pizza_types.name,
    SUM((order_details.quantity) * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) as a) b 
where rn <= 3;