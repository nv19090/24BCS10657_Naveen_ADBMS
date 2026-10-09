# Experiment 6.1: Building a Basic View

## Step 1 — Define the `employees` Table

First, we construct the base table that will hold our employee records. It carries a numeric identifier as the primary key along with the employee's name, salary, and city.

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);
```

## Step 2 — Load Sample Rows

Next, we populate the table with a few sample employees drawn from different cities so the later queries have meaningful data to work with.

```sql
INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');
```

## Step 3 — Verify the Table Contents

Before building the view, we confirm that every inserted row is present in the base table.

```sql
SELECT * FROM employees;
```

## Step 4 — Create the View

We now define a simple view named `EMP_KRG` that exposes only the identifier and name columns of the `employees` table. A view is a virtual table — it stores no data of its own and simply re-runs its underlying `SELECT` each time it is queried.

```sql
CREATE VIEW EMP_KRG AS 
SELECT emp_id, emp_name
FROM employees;
```

## Step 5 — Query the View

The view can be read exactly like an ordinary table. This query returns the ID–name pairs produced by the view's defining query.

```sql
SELECT * FROM EMP_KRG;
```

## Step 6 — Remove a Row Through the View

Because the view references a single base table, it is updatable. Deleting through the view deletes the matching row from the underlying `employees` table itself.

```sql
DELETE FROM EMP_KRG
WHERE emp_id = 101;
```

## Step 7 — Observe the Change

Re-querying the view shows that employee 101 no longer appears — proof that the view always reflects the current state of its base table.

```sql
SELECT * FROM EMP_KRG;
```

---

# Experiment 6.2: Building a Materialized View

## Step 1 — Create the Materialized View

A materialized view, unlike a plain view, physically stores the result set on disk at creation time. Here it is built with the `WITH NO DATA` clause, meaning the structure exists but contains no rows until it is explicitly refreshed. (Note: `CREATE MATERIALIZED VIEW` is supported by PostgreSQL and Oracle; MySQL does not offer this feature.)

```sql
CREATE MATERIALIZED VIEW EMP_KRG_MAT AS 
SELECT emp_id, emp_name
FROM employees
WITH NO DATA;
```

## Step 2 — Inspect the Unrefreshed View

Since the view was populated with `NO DATA`, querying it initially returns no rows (or raises an error in PostgreSQL until the first refresh is run).

```sql
SELECT * FROM EMP_KRG_MAT;
```

## Step 3 — Refresh the Materialized View

Materialized views do not track their base tables automatically — they must be refreshed on demand. The `REFRESH` command re-executes the defining query and repopulates the stored snapshot.

```sql
REFRESH MATERIALIZED VIEW EMP_KRG_MAT;
```

## Step 4 — Inspect the Refreshed View

After the refresh, the materialized view holds a physical copy of the current `employees` data, and the query now returns every row.

```sql
SELECT * FROM EMP_KRG_MAT;
```

---

## Key Takeaway

| Aspect | Simple View | Materialized View |
|---|---|---|
| Storage | Virtual — no data stored | Physically stores the result set |
| Freshness | Always current (query re-executed live) | Stale until explicitly refreshed |
| Performance | Query-time execution cost | Fast reads, refresh-time cost |
| Database support | All major RDBMSs | PostgreSQL, Oracle (not MySQL) |
