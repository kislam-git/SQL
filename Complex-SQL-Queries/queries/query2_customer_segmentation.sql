WITH CustomerSpending AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id, 
    customer_name, 
    total_spent,
    CASE 
        WHEN total_spent > 10000 THEN 'VIP'
        WHEN total_spent BETWEEN 5000 AND 10000 THEN 'Regular'
        ELSE 'Low-spending'
    END AS customer_category
FROM CustomerSpending;
