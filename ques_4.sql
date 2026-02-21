-- Get the latest 3 orders
select * from online_store.orders
ORDER BY created_at DESC
LIMIT 3;