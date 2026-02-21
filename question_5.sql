-- Find customers who have never placed an order
SELECT u.*
FROM user u
LEFT JOIN orders o ON u.id = o.customer_id
WHERE o.order_id IS NULL;