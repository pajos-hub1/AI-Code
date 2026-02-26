-- complete the quest in the class (Monday class)
SELECT
    user.name,
    products.name,
    orders.total_amount
FROM orders
JOIN user
    ON user.user_id = orders.user_id
JOIN products 
    ON products.product_id = orders.product_id;