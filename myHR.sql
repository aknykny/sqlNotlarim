select first_name,last_name,phone_number
from employees
where first_name = 'David' and last_name='Lee';
--get me all information who is making more than 7000 salary
select *
from employees
where salary > 7000;
-- get me email of who is making less than 4000
select email
from employees
where salary < 4000;
--get me all info who is working as IT_PROG or SA_REP
select * 
from employees
where job_id='IT_PROG' or job_id='SA_REP';

--
SELECT first_name, last_name, salary FROM employees
WHERE salary>5000 and salary<10000;

select *FROM employees WHERE salary BETWEEN 1000 and 2000;
select *FROM employees WHERE employee_id=135 or employee_id=176 or employee_id=154 or employee_id=129   ;

--shortcut OR logic
select *FROM employees WHERE employee_id IN (135,155,175,165);

--------------------------------------------------------------
--get me all information who is making more than 7000 salary
select * from employees where salary > 7000;

-- get me email of who is making less than 4000
select email from employees where salary < 4000;

--get me all info who is working as IT_PROG or SA_REP
select *  from employees where job_id='IT_PROG' or job_id='SA_REP';

--employess that job id is IT prog and sales rep
select*FROM employees where job_id in('IT_PROG','SA_REP');


-------------------------

--employess that job id is IT prog and sales rep
select*FROM employees where job_id in('IT_PROG','SA_REP');

--to count the result
select COUNT(*)FROM employees where job_id in('IT_PROG','SA_REP');

--how many people making more than 7000 money
select COUNT(*) FROM employees WHERE salary>7000;

SELECT COUNT(DISTINCT first_name)FROM employees;

--dec High to low-- 
SELECT*FROM employees ORDER BY salary DESC;

--asc low to high
SELECT*FROM employees ORDER BY salary ASC;

select COUNT(first_name) FROM employees where salary>5000 ORDER by salary asc;

SELECT*FROM employees WHERE first_name like 'Alex__' ORDER by last_name DESC;

SELECT*FROM employees WHERE first_name like 'Al%' ORDER by last_name DESC;

SELECT*FROM employees WHERE first_name like '__z__';

--get me first name where second char is U
SELECT first_name, last_name FROM employees where first_name like '_u%' ORDER BY last_name desc;


-- find MIn salary
SELECT MIN(salary) FROM employees;

--find MAX salary
SELECT MAX(salary) FROM employees;

--find AVG salary
SELECT AVG(salary) FROM employees;

--round a numbers
SELECT round(AVG(salary),2) FROM employees;

SELECT round(sum(salary)) from employees where salary BETWEEN 0 and 5000;

--------------------------------------------

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
--order all employees based on salary high to low then display only first 10 result
select * 
from employees
where rownum <11
order by salary desc;
--order all employees based on salary high to low then display only first 10 result
select *
from (select * from employees order by salary desc)
where rownum <11;
--
--how to find employees information of who is making highest salary in the company ? 
select max(salary) from employees;
select *
from employees
where salary = 24000;
--one shot with subquery combining two queires
select * 
from employees
where salary = (select max(salary) from employees);
--finding second highest salary
select max(salary)
from employees;
select max(salary)
from employees
where salary < (select max(salary) from employees);
--finding the employee information of who is making 2nd highest salary
select * from employees
where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

-----------------------------------
--how can we rename the column we displayed
select first_name as "given_name", last_name as "surname"
from employees;
--text functions,string mani.
--java first_name+" "+last_name
--in sql we use ||
select first_name||' '||last_name as "full_name"
from employees;
--TASK:
--add @gmail.com and name new column to full_email
select email||'@gmail.com' as "full_email"
from employees;
--lower(value)
select lower(email||'@gmail.com') as "full_email"
from employees;
--upper(value)
select upper(email||'@gmail.com') as "full_email"
from employees;
--length(value)
select first_name||' '||last_name as "full_name",length(first_name||' '||last_name) as "length"
from employees
order by "length" desc;

-------------------------------------------------------

--how can we rename the column we displayed
select first_name as "given_name", last_name as "surname"
from employees;
--text functions,string mani.
--java first_name+" "+last_name
--in sql we use ||
select first_name||' '||last_name as "full_name"
from employees;
--TASK:
--add @gmail.com and name new column to full_email
select email||'@gmail.com' as "full_email"
from employees;
--lower(value)
select lower(email||'@gmail.com') as "full_email"
from employees;
--upper(value)
select upper(email||'@gmail.com') as "full_email"
from employees;
--length(value)
select first_name||' '||last_name as "full_name",length(first_name||' '||last_name) as "length"
from employees
order by "length" desc;
--substr(colName,begIndex,NumberOfChar)
select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials"
from employees;
create or replace view email_list as
select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials",
first_name||' '||last_name as "full_name", lower(email||'@gmail.com') as "full_email"
from employees;
select "full_name" from email_list;

--task
--create a view called SDETs_yourname, display fullname, email(@cybertek.com) of IT_PROG 
------------------
select * from scrumteam;
--adding new column
ALTER TABLE scrumteam add salary Integer;
update scrumteam set salary =100000 where emp_id=1;
update scrumteam set salary =90000 where emp_id=2;
update scrumteam set salary =110000 where emp_id=4;
--rename the column
alter table scrumteam rename column salary to annual_salary;
--delete,drop column
alter table scrumteam drop column annual_salary;
--howto change table name ? 
alter table scrumteam rename to agileteam;
select * from agileteam;
commit;
--truncate, if we want to delete all data from the table, but still keep the table structure, we use truncate
truncate table agileteam;
--if we want to delete the table and data together
drop table agileteam;
----------------------------










