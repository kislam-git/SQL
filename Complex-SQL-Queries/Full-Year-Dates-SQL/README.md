# 📅 Generate Full-Year Dates in Oracle SQL

This repository contains an SQL script to **generate all dates for a full year**, including:
- 📆 **Year**
- 📅 **Month**
- 🔢 **Date**
- 🗓 **Day Name (Monday, Tuesday, etc.)**

## 📌 Query File  
🔹 [Click here to view the SQL script](generate_full_year_dates.sql)

## 📖 SQL Script Overview  
The script generates **365 dates** for a given year using Oracle SQL.  
It extracts the **year, month, date, and the day name** dynamically.  


🛠 SQL Query Explanation
-  The CONNECT BY LEVEL clause generates a sequence of 365 days.
-  The TRUNC(DATE '2024-01-01') + LEVEL - 1 ensures it starts from January 1st and continues for the full year.
-  The EXTRACT() function extracts:\
  *  Year → EXTRACT(YEAR FROM full_date)
  *  Month → EXTRACT(MONTH FROM full_date)
  *  Date → EXTRACT(DAY FROM full_date)
-  The TO_CHAR(full_date, 'Day') extracts the day name (Monday, Tuesday, etc.).
