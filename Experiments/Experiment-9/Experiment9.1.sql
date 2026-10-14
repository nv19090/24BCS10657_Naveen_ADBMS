CREATE OR REPLACE FUNCTION check_salary_hike()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary > OLD.salary * 1.15 THEN
        RAISE EXCEPTION
            'Error: Salary hike cannot exceed 15%% of the old salary.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER salary_hike_trigger
BEFORE UPDATE ON Salary_Hike
FOR EACH ROW
EXECUTE FUNCTION check_salary_hike();

UPDATE Salary_Hike
SET salary = 45000;

UPDATE Salary_Hike
SET salary = 47000;
