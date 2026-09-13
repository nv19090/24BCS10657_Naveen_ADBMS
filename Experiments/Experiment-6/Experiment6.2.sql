Create TABLE KRG (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary NUMERIC(10,2)
);
INSERT INTO KRG(emp_id,emp_name,salary) values(1,'A',10000);
INSERT INTO KRG(emp_id,emp_name,salary) values(2,'B',40000);
INSERT INTO KRG(emp_id,emp_name,salary) values(3,'C',30000);
INSERT INTO KRG(emp_id,emp_name,salary) values(4,'D',35000);

create view krg2 AS 
  select emp_id,emp_name from krg
  where emp_id=2


select * from KRG;
create materialized view krg3 
AS 
  select emp_id,emp_name from krg
  with no data

select * from krg3
where emp_id=3

refresh materialized view krg3
