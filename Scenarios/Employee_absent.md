# Scenario: Identify Employees with 3 or More Consecutive Days of Absence

This project demonstrates how to solve a real-world HR requirement using Oracle SQL:  
**Find employees who have been absent for 3 or more consecutive days** based on attendance data.

---

## 📚 Scenario

**Business Requirement:**  
The HR department wants a report listing employees who were absent for **three or more consecutive days**. This helps to track extended leaves, absenteeism trends, and possible compliance issues.

**Table Used:**  
`Employee_Attendance`

| Column   | Data Type   | Description                 |
|----------|-------------|------------------------------|
| emp_id   | NUMBER       | Employee ID                 |
| att_date | DATE         | Attendance Date             |
| status   | VARCHAR2(20) | Attendance Status (e.g., 'Present', 'Absent') |

---

## 🏗️ Solution Approach

- **Step 1:** Focus only on records where `status = 'Absent'`.
- **Step 2:** Use `ROW_NUMBER()` to create a sequence over attendance dates per employee.
- **Step 3:** Calculate a "gap" (`att_date - row_number`) to group consecutive days together.
- **Step 4:** Group the results and filter where the count of days is **>= 3**.

This method ensures that consecutive absences are detected correctly.

---

## 🛠️ SQL Scripts

### Create Table

```sql
CREATE TABLE Employee_Attendance (
    emp_id     NUMBER,
    att_date   DATE,
    status     VARCHAR2(20)
);
```

### Insert Sample Data

```sql
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (101, DATE '2025-04-01', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (101, DATE '2025-04-02', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (101, DATE '2025-04-03', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (101, DATE '2025-04-05', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (102, DATE '2025-04-03', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (102, DATE '2025-04-04', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (102, DATE '2025-04-05', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (104, DATE '2025-04-01', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (104, DATE '2025-04-02', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (104, DATE '2025-04-03', 'Absent');
INSERT INTO Employee_Attendance (emp_id, att_date, status) VALUES (104, DATE '2025-04-04', 'Absent');
COMMIT;
```

### Query to Find 3+ Consecutive Absences

```sql
WITH attendance_with_gap AS (
    SELECT
        emp_id,
        att_date,
        status,
        att_date - ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY att_date) AS gap
    FROM
        Employee_Attendance
    WHERE
        status = 'Absent'
)
SELECT 
    emp_id,
    MIN(att_date) AS absence_start,
    MAX(att_date) AS absence_end,
    COUNT(*) AS consecutive_days
FROM 
    attendance_with_gap
GROUP BY 
    emp_id, gap
HAVING 
    COUNT(*) >= 3
ORDER BY 
    emp_id, absence_start;
```

---

## 📋 Expected Output

| emp_id | absence_start | absence_end | consecutive_days |
|--------|---------------|-------------|------------------|
| 101    | 2025-04-01     | 2025-04-03  | 3                |
| 102    | 2025-04-03     | 2025-04-05  | 3                |
| 104    | 2025-04-01     | 2025-04-04  | 4                |

---

## 🔥 Key Concepts Used

- `ROW_NUMBER()` analytic function
- Date arithmetic in Oracle (`att_date - ROW_NUMBER()`)
- `WITH` Common Table Expressions (CTE)
- `GROUP BY` and `HAVING` for filtering
- `MIN()` and `MAX()` to find absence periods

---
