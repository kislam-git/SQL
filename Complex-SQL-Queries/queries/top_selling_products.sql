WITH SalesRank AS (
    SELECT 
        p.product_id, 
        p.product_name,
        EXTRACT(MONTH FROM o.order_date) AS order_month,
        SUM(o.quantity) AS total_sold,
        DENSE_RANK() OVER (PARTITION BY EXTRACT(MONTH FROM o.order_date) ORDER BY SUM(o.quantity) DESC) AS rank
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.product_id, p.product_name, EXTRACT(MONTH FROM o.order_date)
)
SELECT * FROM SalesRank WHERE rank <= 5;
