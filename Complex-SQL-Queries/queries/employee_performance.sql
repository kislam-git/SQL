--Employee Performance Ranking

WITH EmployeeSales AS (
    SELECT 
        e.employee_id, 
        e.employee_name, 
        SUM(o.total_amount) AS total_sales
    FROM employees e
    JOIN orders o ON e.employee_id = o.sales_rep_id
    GROUP BY e.employee_id, e.employee_name
)
SELECT 
    employee_id, 
    employee_name, 
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM EmployeeSales;
