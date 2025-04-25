# Oracle SQL: `EXISTS` vs `IN`

A beginner-friendly guide to understanding the difference between `EXISTS` and `IN` in Oracle SQL, with practical examples and use-case-based explanations.

---

## 📌 Overview

When working with subqueries in SQL, two commonly used operators are `EXISTS` and `IN`. While they may seem similar, they have different behavior and performance characteristics depending on the context.

This guide explains:
- What `EXISTS` and `NOT EXISTS` do
- What `IN` and `NOT IN` do
- When to use each
- Practical examples with multiple columns
- Common pitfalls (like dealing with `NULL`s)

---

## ✅ EXISTS

`EXISTS` checks whether a subquery returns **at least one row**. It is often used with **correlated subqueries** and is usually more efficient for large datasets.

### Example: Students who have taken any exam

```sql
SELECT name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM exam_results e
    WHERE e.student_id = s.student_id
);
```

---

## 🚫 NOT EXISTS

Returns true if the subquery returns **no rows**.

### Example: Students who have not taken any exam

```sql
SELECT name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM exam_results e
    WHERE e.student_id = s.student_id
);
```

---

## 📥 IN

`IN` checks whether a value exists in a list or the result of a subquery. Best used when comparing with a **single column** or **known set of values**.

### Example: Students who have taken any exam

```sql
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id FROM exam_results
);
```

---

## ⚠️ Caution with `IN` and NULL

If the subquery contains `NULL`, it can lead to **unexpected empty results**.

---

## ✅ Multiple Column Comparison

### With `IN`

```sql
SELECT *
FROM students s
WHERE (s.student_id, s.name) IN (
    SELECT student_id, name FROM exam_results
);
```

### With `EXISTS`

```sql
SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM exam_results e
    WHERE e.student_id = s.student_id AND e.name = s.name
);
```

---

## 💡 When to Use What?

| Scenario | Use |
|----------|-----|
| Checking if related rows exist | `EXISTS` |
| Comparing a column with a list of values | `IN` |
| Large data sets | Prefer `EXISTS` for performance |
| Subquery may return NULLs | Avoid `IN`, use `EXISTS` |

---

