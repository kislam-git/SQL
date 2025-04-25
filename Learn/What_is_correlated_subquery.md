# Oracle SQL: Correlated Subqueries

Learn what **correlated subqueries** are in Oracle SQL, how they work, and when to use them. This guide explains the concept with simple examples and comparisons to non-correlated subqueries.

---

## 📌 What is a Correlated Subquery?

A **correlated subquery** is a subquery that references a column from the outer query. This means the subquery is executed **once for every row** processed by the outer query.

✅ **It is dependent on the outer query.**

---

## 🔍 Syntax Example

```sql
SELECT name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM exam_results e
    WHERE e.student_id = s.student_id
      AND e.marks > 80
);
```

📘 In this query:
- The subquery checks if the current student (from the outer query) has any marks greater than 80.
- `s.student_id` comes from the outer query — making this a **correlated** subquery.

---

## 🧠 How is it Different from a Non-Correlated Subquery?

### 🔁 Correlated Subquery

```sql
SELECT name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM exam_results e
    WHERE e.student_id = s.student_id
      AND e.marks > 80
);
```

- Executes once per row of `students`
- Subquery depends on outer query

### 🔁 Non-Correlated Subquery

```sql
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM exam_results
    WHERE marks > 80
);
```

- Executes once
- Independent of outer query

---

## 📂 Sample Tables

### `students`

| student_id | name  |
|------------|-------|
| 1          | Rahim |
| 2          | Karim |
| 3          | Jamil |

### `exam_results`

| student_id | subject | marks |
|------------|---------|-------|
| 1          | Math    | 85    |
| 1          | English | 90    |
| 2          | Math    | 60    |

---

## 📈 Use Cases

- Filtering data based on related records row-by-row
- Checking for conditions that vary per outer query row
- Often used with `EXISTS`, `NOT EXISTS`, or `WHERE` clauses

---

## ⚠️ Performance Tip

Correlated subqueries can be **slower** on large datasets because they execute once per outer row. When performance matters, consider:
- `JOIN` + `GROUP BY`
- Non-correlated subqueries (if possible)
- Indexing related fields

---
