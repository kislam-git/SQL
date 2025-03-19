# Complex SQL Queries Repository 🚀

This repository contains **five advanced SQL queries** designed for **Oracle SQL**, demonstrating techniques like **window functions, common table expressions (CTEs), hierarchical queries, and analytical functions**.

## 📌 Queries List

### 1️⃣ [Top 5 Selling Products (Monthly)](queries/top_selling_products.sql)
- **File:** `query1_top_selling_products.sql`
- **Use Case:** Finds the **top 5 best-selling products per month** using `DENSE_RANK()`.
- **Techniques Used:** Window functions (`DENSE_RANK()`), `PARTITION BY`.

### 2️⃣ Customer Segmentation (High-Spending Customers)
- **File:** `query2_customer_segmentation.sql`
- **Use Case:** Classifies customers into **VIP, Regular, and Low-spending** groups based on total purchase amount.
- **Techniques Used:** `CASE`, `SUM()`, `GROUP BY`, CTE.

### 3️⃣ Recurring Orders (Customers with Monthly Purchases)
- **File:** `query3_recurring_orders.sql`
- **Use Case:** Identifies **customers who place orders in consecutive months**.
- **Techniques Used:** `LAG()`, `PARTITION BY`, `DATEDIFF()`.

### 4️⃣ Sales Trend Analysis (Moving Average)
- **File:** `query4_sales_trend_analysis.sql`
- **Use Case:** Calculates a **3-month moving average of total sales**.
- **Techniques Used:** `AVG() OVER (ROWS BETWEEN)`, time-series analysis.

### 5️⃣ Employee Performance Ranking
- **File:** `query5_employee_performance.sql`
- **Use Case:** Ranks employees based on **total sales and performance score**.
- **Techniques Used:** `RANK()`, `JOIN`, `SUM()`, `PARTITION BY`.

