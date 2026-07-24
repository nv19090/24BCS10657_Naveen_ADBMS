## Repository Overview:

This repository contains the SQL experiments performed during the Advanced Database Management System (ADBMS) laboratory. Each experiment focuses on a different SQL concept and includes the objective, theory, implementation, and learning outcomes.

# 24BCS10657_NAVEEN_ADBMS

---

# Experiment 1 – Hospital Management System

## Objective

The objective of this experiment is to populate the Hospital Management System database with sample data and verify the successful insertion by retrieving records from the created tables. This experiment demonstrates the use of SQL **Data Manipulation Language (DML)** statements for inserting data and **Data Query Language (DQL)** statements for retrieving information.

---

## Database Overview

The Hospital Management System is designed to manage and organize hospital-related information efficiently. The database consists of the following tables:

| Table | Description |
|--------|-------------|
| **Doctors** | Stores doctor information such as specialization and contact details. |
| **Patients** | Maintains patient personal and contact information. |
| **Appointments** | Records appointment details between patients and doctors. |
| **Treatments** | Stores diagnosis and treatment information provided to patients. |
| **MedicalRecords** | Maintains treatment notes and medical history. |
| **Billing** | Stores billing details and payment status for treatments. |

---

## Concepts Used

- SQL INSERT Statement
- SQL SELECT Statement
- LIMIT Clause
- Data Manipulation Language (DML)
- Data Query Language (DQL)

---

# Task 1 – Insert Sample Data

### Problem Statement

Insert sample records into all the tables of the Hospital Management System to simulate a real-world hospital database.

### Explanation

The `INSERT INTO` statement is used to add new records to database tables. In this experiment, sample data is inserted into six related tables to establish relationships between doctors, patients, appointments, treatments, medical records, and billing information.

This dataset serves as the foundation for executing future SQL operations such as joins, filtering, aggregation, and reporting.

---

# Task 2 – Retrieve Records

### Problem Statement

Retrieve the first record from the **Doctors**, **Patients**, and **Appointments** tables to verify that the data has been inserted successfully.

### Explanation

The `SELECT` statement is used to retrieve data from a database table.

The `LIMIT 1` clause restricts the output to only the first record, allowing quick verification that data insertion was successful.

---

## Output

The queries successfully:

- Inserted sample records into all six database tables.
- Retrieved the first record from the **Doctors** table.
- Retrieved the first record from the **Patients** table.
- Retrieved the first record from the **Appointments** table.

---

## Learning Outcomes

After completing this experiment, I learned to:

- Insert records into relational database tables using the `INSERT INTO` statement.
- Retrieve data using the `SELECT` statement.
- Use the `LIMIT` clause to restrict query results.
- Understand the relationship between multiple tables in a relational database.
- Verify database operations through SQL queries.

---

## Conclusion

This experiment successfully demonstrated the implementation of SQL Data Manipulation and Data Query Language commands within a Hospital Management System database. By inserting sample records into multiple related tables and retrieving selected data, the experiment established a structured dataset that can be utilized for performing advanced SQL operations in subsequent experiments.

---

# Experiment 2 – SQL Set Operations

## Objective

The objective of this experiment is to understand and implement SQL **Set Operations**. Set operations allow the result of multiple `SELECT` statements to be combined or compared based on specific conditions. In this experiment, the following operators are used:

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

These operators are widely used while querying relational databases to merge datasets, identify common records, and retrieve unique records.

---

## Experiment 2.1 – UNION

### Problem Statement

Write a SQL query using the **UNION** operator to combine the records from the **Arts** and **Science** tables into a single result.

### Theory

The `UNION` operator combines the result sets of two or more `SELECT` statements into one result set.

It automatically removes duplicate rows from the final output.


### Conditions

- Both queries must return the same number of columns.
- Corresponding columns should have compatible data types.
- Duplicate rows are removed automatically.

### Working

1. Reads all records from the **Arts** table.
2. Reads all records from the **Science** table.
3. Combines both result sets.
4. Removes duplicate records.
5. Displays a single table containing unique rows.

---

## Experiment 2.2 – UNION ALL

### Problem Statement

Write a SQL query to display employee names from both the **employee** and **pt_employee** tables without removing duplicate records.

### Theory

The `UNION ALL` operator combines the results of multiple queries while preserving every record, including duplicates.

Unlike `UNION`, it does not perform duplicate checking, making it faster for large datasets.

### Working

1. Retrieves employee names from the **employee** table.
2. Retrieves employee names from the **pt_employee** table.
3. Combines both result sets.
4. Displays all records including duplicate employee names.

---

## Experiment 2.3 – INTERSECT

### Problem Statement

Write a SQL query to display the names of fruits that are available in both the **fruit** and **inventory** tables.

### Theory

The `INTERSECT` operator returns only those rows that are common between two `SELECT` statements.

It is useful for identifying matching records across multiple tables.

### Working

1. Retrieves all fruit names.
2. Retrieves all inventory item names.
3. Compares both result sets.
4. Displays only the names that exist in both tables.

---

## Experiment 2.4 – EXCEPT

### Problem Statement

Write a SQL query to display the names of fruits that are present in the **fruit** table but are not available in the **inventory** table.

### Theory

The `EXCEPT` operator returns records from the first query that are not present in the second query.

It is commonly used to identify missing or unmatched records.

### Working

1. Retrieves all fruit names.
2. Retrieves all inventory item names.
3. Removes all matching values.
4. Displays only those fruits that are not available in the inventory.

---

# Key Learnings

After completing this experiment, I learned:

- The purpose of SQL Set Operations.
- The difference between **UNION** and **UNION ALL**.
- How to identify common records using **INTERSECT**.
- How to retrieve unmatched records using **EXCEPT**.
- The conditions required before applying Set Operations.
- Practical applications of Set Operators in relational databases.

---

# Conclusion

This experiment provided practical exposure to SQL Set Operations used for combining and comparing multiple result sets. Understanding these operations improves the ability to write efficient SQL queries for data retrieval and analysis while maintaining data consistency.

---

# Experiment 3 – Aggregate Functions and SQL Joins

## Objective

The objective of this experiment is to understand the use of SQL Aggregate Functions, conditional counting using the `CASE` statement, grouping of records using `GROUP BY`, filtering grouped data using `HAVING`, sorting results using `ORDER BY`, retrieving unique records using `DISTINCT`, and implementing `LEFT JOIN` to identify unmatched records between related tables.

---

## Experiment 3.1 – COUNT using CASE

### Problem Statement

Write a SQL query to count the number of students in each department who have scored more than **80** marks. Display the count using the alias **Dept_HighScore_Count**.

### Theory

The `CASE` statement allows conditional logic to be applied inside SQL queries. When combined with the `COUNT()` aggregate function, only the values satisfying the specified condition are counted, while `NULL` values are ignored.

This approach is useful for calculating conditional counts without writing multiple queries.

### Working

1. Reads all records from the **student** table.
2. Evaluates whether each student's marks are greater than **80**.
3. Returns **1** for records satisfying the condition and **NULL** for others.
4. Counts only the non-null values.
5. Groups the result according to each department.

---

## Experiment 3.2 – Aggregate Functions with GROUP BY, HAVING and ORDER BY

### Problem Statement

Create an **Employees** table and perform various SQL operations using aggregate functions to analyze employee data based on different cities.

### Concepts Covered

- Aggregate Functions (`COUNT`, `SUM`, `MIN`, `MAX`, `AVG`)
- GROUP BY
- HAVING
- ORDER BY
- DISTINCT
- Conditional Aggregation using CASE

### Tasks Performed

#### 1. Count the total number of employees in each city.

Uses the `COUNT()` function along with the `GROUP BY` clause to determine the total number of employees belonging to each city.

#### 2. Count employees whose salary is greater than or equal to **90,000**.

Uses the `SUM(CASE...)` technique to count only those employees satisfying the salary condition.

#### 3. Sort employee counts by city name.

Applies the `ORDER BY` clause to display cities in descending alphabetical order.

#### 4. Sort employee counts based on the number of employees.

Displays cities according to the calculated employee count in descending order.

#### 5. Find cities having at least two employees.

Uses the `HAVING` clause to filter grouped records after aggregation.

#### 6. Display unique city names.

Uses the `DISTINCT` keyword to eliminate duplicate city names from the result set.

---

### Working

This experiment demonstrates how aggregate functions can be combined with SQL clauses such as `GROUP BY`, `HAVING`, `ORDER BY`, and `DISTINCT` to summarize, filter, and organize relational data efficiently.

---

## Experiment 3.3 – Customers Who Never Order

### Problem Statement

Given the **Customers** and **Orders** tables, write a SQL query to find the names of customers who have never placed an order.

### Theory

A `LEFT JOIN` returns all records from the left table and the matching records from the right table.

If no matching record exists in the right table, the corresponding columns contain `NULL` values.

By filtering these `NULL` values, it becomes possible to identify customers who have never placed an order.

### Working

1. Retrieves all customers from the **Customers** table.
2. Performs a **LEFT JOIN** with the **Orders** table.
3. Matches customers using the customer ID.
4. Identifies rows where no matching order exists.
5. Displays only the names of customers who have never placed an order.

---

## Key Learnings

After completing this experiment, I learned to:

- Apply conditional counting using the `CASE` statement.
- Use aggregate functions to summarize data.
- Group records using `GROUP BY`.
- Filter grouped data using `HAVING`.
- Sort query results using `ORDER BY`.
- Retrieve unique records using `DISTINCT`.
- Use `LEFT JOIN` to identify unmatched records between related tables.
- Apply SQL techniques to solve real-world database problems.

---

## Conclusion

This experiment provided practical experience with SQL Aggregate Functions and Join operations. It demonstrated how SQL can be used to summarize data, perform conditional analysis, organize grouped information, and identify unmatched records across multiple tables. These concepts form the foundation for writing efficient analytical queries in relational database management systems.
