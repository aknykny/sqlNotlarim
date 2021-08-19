--Task 1: get me all unique job ids from employees table 
select distinct job_id
from employees;
--Task 2: get me average salary for IT_PROG
select avg(salary)
from employees
where job_id ='AC_ACCOUNT';
select avg(salary)
from employees
where job_id ='AC_MGR';
--get me average salary for each different job_id
select job_id,avg(salary)
from employees
group by job_id;
-- get me number of employees working for each job_id 
select job_id,count(*)
from employees
group by job_id;
--get me job_ids where their avg salary is more than 5k
select job_id,avg(salary),count(*)
from employees
group by job_id
having avg(salary)>5000;

--
select * from employees
order by salary desc;
--get first 10 employee then order them based on the salary high to low
select * 
from employees
where rownum <11
order by salary desc;
--order all employees based on salary high to low then display only first 10 result
select *
from (select * from employees order by salary desc)
where rownum <11;


