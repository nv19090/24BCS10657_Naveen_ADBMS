# PostgreSQL Stored Procedure — Updating an Employee's Salary

---

## Step 1 — Create the Employee Table

We begin with a minimal `EMPLOYEE` table whose primary key is the numeric employee ID, accompanied by the employee's name and current salary.

```sql
CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2)
);
```

---

## Step 2 — Insert Sample Data

Three employees are seeded so the procedure has rows to operate on.

```sql
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, SALARY)
VALUES
(201, 'Amit', 40000),
(202, 'Rahul', 35000),
(203, 'Priya', 45000);
```

---

## Step 3 — Create the Stored Procedure

The procedure `UPDATE_SAL_PROC2` takes three parameters:

- `P_EMPID` (**IN**) — the employee whose salary must change
- `P_SALARY` (**IN OUT**) — an increment value on input, replaced with the employee's new total on output
- `STATUS` (**OUT**) — a message reporting the outcome

Inside the block, the procedure looks up the employee's current salary. If no matching row exists, it raises an exception; otherwise it adds the increment to the current salary, writes the new value back to the table, and reports success.

```sql
CREATE OR REPLACE PROCEDURE UPDATE_SAL_PROC2(
    IN P_EMPID INT,
    OUT STATUS VARCHAR(20),
    IN OUT P_SALARY NUMERIC
)
AS $$

DECLARE
    CURRENT_SAL NUMERIC(10,2);
BEGIN

    SELECT SALARY INTO CURRENT_SAL
    FROM EMPLOYEE
    WHERE EMP_ID = P_EMPID;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'EMPLOYEE NOT FOUND';
    END IF;

    P_SALARY := CURRENT_SAL + P_SALARY;

    UPDATE EMPLOYEE
    SET SALARY = P_SALARY
    WHERE EMP_ID = P_EMPID;

    STATUS := 'Success';

END;

$$ LANGUAGE PLPGSQL;
```

---

## Step 4 — Invoke the Procedure

We call the procedure for employee `201` with an increment of `5208`. The `NULL` placeholder is simply discarded for the unused `STATUS` output parameter.

```sql
CALL UPDATE_SAL_PROC2(201, NULL, 5208);
```

---

## Step 5 — Confirm the New Salary

A full read of the table verifies that employee 201's salary has grown from `40000` to `45208`.

```sql
SELECT * FROM EMPLOYEE;
```

---

## Key Points to Remember

| Point | Detail |
|-------|--------|
| `IN` | Read-only parameter passed into the procedure |
| `OUT` | Output parameter that carries a value back to the caller |
| `IN OUT` | Read at entry, overwritten with a new value before returning |
| `NOT FOUND` | True when the preceding `SELECT INTO` returned no rows |
| `RAISE EXCEPTION` | Aborts the procedure with an error message |
| `$$ ... $$ LANGUAGE PLPGSQL` | Dollar-quoted body written in PL/pgSQL |
