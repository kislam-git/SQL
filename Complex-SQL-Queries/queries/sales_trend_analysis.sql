SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_amount) AS monthly_sales,
    AVG(SUM(total_amount)) OVER (
        PARTITION BY EXTRACT(YEAR FROM order_date)
        ORDER BY EXTRACT(MONTH FROM order_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3_months
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY order_year, order_month;
