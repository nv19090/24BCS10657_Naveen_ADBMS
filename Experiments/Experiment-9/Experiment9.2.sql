--Create an Employee Payroll Management System in PostgreSQL using row-level and statement-level triggers.
--Create an employee table with emp_id, emp_name, per_hour_salary, working_hours, and payable_amount.
--Create a row-level trigger to calculate payable_amount = per_hour_salary × working_hours on INSERT or UPDATE.
--Reject operations where payable_amount exceeds 25,000 using RAISE EXCEPTION.
--Create a statement-level trigger that displays "Rows Updated Successfully" after INSERT or UPDATE.
--Test both triggers using INSERT and UPDATE statements, including a case exceeding 25,000

-- 1. Create Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    per_hour_salary NUMERIC(10,2),
    working_hours INT,
    payable_amount NUMERIC(10,2)
);

-- 2. Create Row-Level Trigger Function
CREATE OR REPLACE FUNCTION calculate_payable()
RETURNS TRIGGER AS $$
BEGIN
    NEW.payable_amount := NEW.per_hour_salary * NEW.working_hours;

    IF NEW.payable_amount > 25000 THEN
        RAISE EXCEPTION 'Payable amount cannot exceed 25000';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Create Row-Level Trigger
CREATE TRIGGER trg_calculate_payable
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
EXECUTE FUNCTION calculate_payable();

-- 4. Create Statement-Level Trigger Function
CREATE OR REPLACE FUNCTION display_success()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Rows Updated Successfully';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- 5. Create Statement-Level Trigger
CREATE TRIGGER trg_display_success
AFTER INSERT OR UPDATE ON Employee
FOR EACH STATEMENT
EXECUTE FUNCTION display_success();

-- 6. Insert Valid Data
INSERT INTO Employee
VALUES (1, 'Aman', 200, 100, 0);

-- 7. Insert Another Valid Record
INSERT INTO Employee
VALUES (2, 'Riya', 150, 100, 0);

-- 8. Update Record
UPDATE Employee
SET working_hours = 120
WHERE emp_id = 2;

-- 9. Test Invalid Data (Exceeds 25000)
INSERT INTO Employee
VALUES (3, 'Rahul', 300, 100, 0);

-- 10. Display Records
SELECT * FROM Employee;
