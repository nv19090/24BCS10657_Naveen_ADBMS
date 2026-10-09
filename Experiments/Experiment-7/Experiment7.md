# PL/SQL Exercises

---

## Exercise 1: Salary Update Using `SQL%ROWCOUNT`

### a) Create the Employee Table

We begin by defining a small `EMPLOYEE` table whose primary key is the numeric employee identifier, with columns for name, department, and salary.

```sql
CREATE TABLE EMPLOYEE (
    empId NUMBER PRIMARY KEY,
    name VARCHAR2(15) NOT NULL,
    dept VARCHAR2(10) NOT NULL,
    salary INTEGER
);
```

### b) Insert Sample Records

Three employees across two departments are inserted so the update has data to act on.

```sql
INSERT INTO EMPLOYEE VALUES (1, 'Clark', 'Sales', 100000);
INSERT INTO EMPLOYEE VALUES (2, 'Dave', 'Accounting', 200000);
INSERT INTO EMPLOYEE VALUES (3, 'Ava', 'Sales', 150000);
```

### c) Verify the Data

A quick read of the table confirms the rows we will be manipulating.

```sql
SELECT * FROM EMPLOYEE;
```

### d) PL/SQL Program

The task: raise the salary of the employee with `empId = 1` by 10% and report how many rows were changed using the implicit-cursor attribute `SQL%ROWCOUNT`.

```sql
BEGIN

    UPDATE EMPLOYEE
    SET salary = salary * 1.1
    WHERE empId = 1;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows affected');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rows affected');
    END IF;

END;
/
```

### e) Output

```text
1 rows affected
```

---

## Exercise 2: Salary Update Using an Explicit Cursor

### a) Create the Employee Table

An identical `EMPLOYEE` table is (re)created to serve this exercise independently.

```sql
CREATE TABLE EMPLOYEE (
    empId NUMBER PRIMARY KEY,
    name VARCHAR2(15) NOT NULL,
    dept VARCHAR2(10) NOT NULL,
    salary INTEGER
);
```

### b) Insert Sample Records

The same three seed rows are inserted again.

```sql
INSERT INTO EMPLOYEE VALUES (1, 'Clark', 'Sales', 100000);
INSERT INTO EMPLOYEE VALUES (2, 'Dave', 'Accounting', 200000);
INSERT INTO EMPLOYEE VALUES (3, 'Ava', 'Sales', 150000);
```

### c) Verify the Data

```sql
SELECT * FROM EMPLOYEE;
```

### d) PL/SQL Program

The task: open an explicit cursor that retrieves each employee's ID and salary row by row. While iterating, if a fetched salary equals `0`, raise a custom exception; otherwise, apply a 10% raise to that employee.

```sql
DECLARE

    CURSOR emp_cursor IS
        SELECT empId, salary
        FROM EMPLOYEE;

    V_EMP_ID EMPLOYEE.empId%TYPE;
    V_SALARY EMPLOYEE.salary%TYPE;

    SALARY_ZERO EXCEPTION;

BEGIN

    OPEN emp_cursor;

    FETCH emp_cursor INTO V_EMP_ID, V_SALARY;

    WHILE emp_cursor%FOUND LOOP

        IF V_SALARY = 0 THEN
            RAISE SALARY_ZERO;
        END IF;

        UPDATE EMPLOYEE
        SET salary = salary * 1.10
        WHERE empId = V_EMP_ID;

        FETCH emp_cursor INTO V_EMP_ID, V_SALARY;

    END LOOP;

    CLOSE emp_cursor;

EXCEPTION

    WHEN SALARY_ZERO THEN
        DBMS_OUTPUT.PUT_LINE(
            'Salary is zero. Increment not possible.'
        );

END;
/
```

---

## Core Concepts

### `SQL%ROWCOUNT`

`SQL%ROWCOUNT` is an implicit-cursor attribute that returns the number of rows affected by the most recently executed SQL statement inside the block.

```sql
SQL%ROWCOUNT
```

---

### Lifecycle of an Explicit Cursor

```text
DECLARE
   ↓
OPEN
   ↓
FETCH
   ↓
CHECK %FOUND
   ↓
PROCESS DATA
   ↓
FETCH NEXT ROW
   ↓
CLOSE
```

---

### Cursor Attributes

| Attribute              | Description                                         |
| ---------------------- | --------------------------------------------------- |
| `cursor_name%FOUND`    | Returns TRUE if the last FETCH returned a row       |
| `cursor_name%NOTFOUND` | Returns TRUE if the last FETCH did not return a row |
| `cursor_name%ROWCOUNT` | Returns the number of rows fetched                  |
| `cursor_name%ISOPEN`   | Returns TRUE if the cursor is open                  |

---

## Comparing the Two Approaches

| Exercise 1           | Exercise 2                   |
| -------------------- | ---------------------------- |
| Uses an implicit cursor | Uses an explicit cursor        |
| Relies on `SQL%ROWCOUNT` | Relies on `emp_cursor%FOUND`  |
| Targets a single employee | Processes every employee in a loop |
| Simple anonymous block | Cursor-driven looping block   |
| No custom error handling | Handles a `SALARY_ZERO` exception |
