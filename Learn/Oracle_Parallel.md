# 🚀 Oracle Parallel Execution (Parallel Query)

Oracle Parallel Execution allows large database operations to be divided into smaller tasks and executed concurrently by multiple CPU processes, significantly improving performance for large datasets.

---

## 📘 What Is Parallel Execution?

Parallel Execution is Oracle's method of processing SQL statements using **multiple parallel execution servers**. It is particularly effective for:

- Complex queries over large tables
- Full table scans
- Partitioned data access
- Bulk data loading (INSERT, CREATE TABLE AS SELECT)
- Index creation and maintenance

---

## ⚙️ Key Components

| Component             | Description |
|-----------------------|-------------|
| **Query Coordinator (QC)** | The main process that breaks down the task and coordinates parallel slaves. |
| **Parallel Slaves (PX)**   | Multiple background processes that execute tasks in parallel. |
| **Degree of Parallelism (DOP)** | Number of parallel slaves assigned to a task. |

---

## 🧠 How It Works

1. The Query Coordinator receives the SQL statement.
2. It splits the task (e.g., a full table scan) into smaller chunks.
3. Each chunk is assigned to a parallel slave.
4. Results are returned to the QC and merged (if needed).

---

## ✍️ Example Usage

### Query-Level Parallel Hint

```sql
SELECT /*+ PARALLEL(employees, 4) */ * FROM employees;
````

This instructs Oracle to use **4 parallel slaves** for scanning the `employees` table.

---

### Table-Level Parallel Setting

```sql
ALTER TABLE employees PARALLEL 4;
```

This sets a default parallel degree of 4 for operations on the `employees` table.

---

### Automatic Parallelism

Let Oracle decide the DOP:

```sql
SELECT /*+ PARALLEL(employees, AUTO) */ * FROM employees;
```

---

## ✅ Benefits

* Faster execution of resource-intensive SQL
* Improved throughput in batch processing
* Efficient use of multi-core CPUs

---

## ⚠️ Considerations

* Consumes more system resources (CPU, memory)
* Not suitable for small or OLTP-style queries
* Requires tuning for optimal performance

---

## 🔍 Monitoring Parallel Execution

You can monitor parallel query activity using views like:

```sql
SELECT * FROM V$PQ_SESSTAT;
SELECT * FROM V$PQ_TQSTAT;
SELECT * FROM V$SESSION WHERE QCSID = :QC_SID;
```

---

## 📚 Related Views

| View Name      | Purpose                                  |
| -------------- | ---------------------------------------- |
| `V$PX_SESSION` | Shows PX slave sessions.                 |
| `V$PQ_SESSTAT` | Statistics on parallel queries.          |
| `V$PX_PROCESS` | Info on PX servers.                      |
| `DBA_TABLES`   | Check if a table is marked for parallel. |

---

## 🛠️ Initialization Parameters

| Parameter Name           | Description                            |
| ------------------------ | -------------------------------------- |
| `parallel_max_servers`   | Max number of parallel slaves allowed. |
| `parallel_min_servers`   | Min number of slaves Oracle maintains. |
| `parallel_degree_policy` | Controls automatic DOP decisions.      |
| `parallel_degree_limit`  | Caps the maximum DOP.                  |

---

## 📎 References

* [Oracle Docs - Parallel Execution](https://docs.oracle.com/en/database/)
* [Oracle Concepts Guide](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)

---

## 🧩 Summary

Oracle Parallel Execution is a powerful feature for handling large-scale operations efficiently. By distributing workload across multiple CPUs, it significantly reduces execution time for data-heavy operations.

Use it wisely in the right context and monitor its behavior to avoid overloading system resources.

---
