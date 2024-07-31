-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(time) AS hour, COUNT(order_id) AS orders_count
FROM
    orders
GROUP BY HOUR(time);

