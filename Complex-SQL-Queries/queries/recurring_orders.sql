WITH MonthlyOrders AS (
    SELECT 
        customer_id, 
        EXTRACT(YEAR FROM order_date) AS order_year,
        EXTRACT(MONTH FROM order_date) AS order_month,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id, EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
),
RecurrenceCheck AS (
    SELECT 
        customer_id, 
        order_year, 
        order_month,
        LAG(order_month) OVER (PARTITION BY customer_id ORDER BY order_year, order_month) AS prev_month
    FROM MonthlyOrders
)
SELECT customer_id, order_year, order_month
FROM RecurrenceCheck
WHERE order_month - prev_month = 1;
