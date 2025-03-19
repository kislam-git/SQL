# 📅 Generate Full-Year Dates in Oracle SQL

This repository contains an SQL script to **generate all dates for a full year**, including:
- 📆 **Year**
- 📅 **Month**
- 🔢 **Date**
- 🗓 **Day Name (Monday, Tuesday, etc.)**

## 📌 Query File  
🔹 [Click here to view the SQL script](queries/generate_full_year_dates.sql)

## 📖 SQL Script Overview  
The script generates **365 dates** for a given year using Oracle SQL.  
It extracts the **year, month, date, and the day name** dynamically.  


🛠 SQL Query Explanation
- The CONNECT BY LEVEL clause generates a sequence of 365 days.
- The EXTRACT() function gets the year, month, and date.
- The TO_CHAR(..., 'Day') function extracts the day name.
