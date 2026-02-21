-- Get all customers who registered this month
SELECT * FROM online_store.user
WHERE MONTH(created_at) = MONTH(CURRENT_DATE());