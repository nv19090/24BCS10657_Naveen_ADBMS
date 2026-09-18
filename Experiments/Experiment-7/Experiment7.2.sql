CREATE TABLE employees ( 
    employee_id NUMBER, 
    name VARCHAR2(50), 
    department_id NUMBER, 
    salary NUMBER 
); 

INSERT INTO employees VALUES (201, 'Vikas', 20, 28000); 
INSERT INTO employees VALUES (202, 'Anjali', 30, 42000); 
INSERT INTO employees VALUES (203, 'Karan', 20, 55000); 
INSERT INTO employees VALUES (204, 'Simran', 40, 48000); 
INSERT INTO employees VALUES (205, 'Rohan', 20, 36000); 

COMMIT; 

SELECT * FROM employees; 

BEGIN 
    UPDATE employees 
    SET salary = salary * 1.1 
    WHERE department_id = 20; 

    IF SQL%ROWCOUNT > 0 THEN 
        DBMS_OUTPUT.PUT_LINE( 
            SQL%ROWCOUNT || ' rows updated.' 
        ); 
    ELSE 
        DBMS_OUTPUT.PUT_LINE('No rows updated.'); 
    END IF; 
END;
/
