
create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int
);
insert into employee values(1,'Ankit',100,10000);
insert into employee values(2,'Mohit',100,15000);
insert into employee values(3,'Vikas',100,10000);
insert into employee values(4,'Rohit',100,5000);
insert into employee values(5,'Mudit',200,12000);
insert into employee values(6,'Agam',200,12000);
insert into employee values(7,'Sanjay',200,9000);
insert into employee values(8,'Ashish',200,5000);


select emp_id , emp_name , dept_id, salary,
RANK() over (order by salary desc) as rnk,
dense_rank() over (order by salary desc) as densernk,
row_number() over (order by salary desc) as rowno
from EMPLOYEE;


select emp_id , emp_name , dept_id, salary,
RANK() over (partition by dept_id order by salary desc) as rnk,
dense_rank() over (partition by dept_id order by salary desc) as densernk,
row_number() over (partition by dept_id  order by salary desc) as rowno
from EMPLOYEE;

select * from (select emp_id , emp_name , dept_id, salary,
RANK() over (partition by dept_id order by salary desc) as rnk
from EMPLOYEE) a where rnk=1;
