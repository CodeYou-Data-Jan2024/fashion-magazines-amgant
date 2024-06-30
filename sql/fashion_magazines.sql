/*
Created by: Aliyah Gant
CreateDate: 06/29/2024
Description: This query contains the name and total amount due for 
customers that have unpaid Fashion Magazine subscriptions.
*/


WITH previous_query AS (


WITH previous_query AS (
SELECT *
FROM orders
JOIN customers
ON orders.customer_id = 
customers.customer_id
WHERE order_status = 'unpaid'
)


SELECT 
customer_id, 
order_status, 
customer_name, 
subscriptions.price_per_month, 
subscriptions.subscription_length
FROM previous_query
JOIN subscriptions
ON previous_query.subscription_id = 
subscriptions.subscription_id
WHERE subscriptions.description = 
'Fashion Magazine'
)

SELECT customer_name AS Customer, 
PRINTF('$%.2f', SUM(price_per_month * subscription_length)) AS 'Amount Due'
FROM previous_query
GROUP BY customer_id
ORDER BY Customer ASC
;