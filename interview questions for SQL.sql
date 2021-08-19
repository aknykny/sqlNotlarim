--how to find unique names from employees
select distinct first_name from employees;

--how to find duplicate names, how many times they repeat
select first_name, count(first_name)
from employees
group by first_name
having count(first_name) > 1;
-- how to find top 5 high paid employees ?
--wrong answer
select employee_id,first_name,salary
from employees
where rownum<6
order by salary desc ;
select employee_id,first_name,salary from employees order by salary desc;
--correct one
select first_name, salary
from (select first_name, salary from employees order by salary desc)
where rownum <6;
--how to find first_name,last_name,salary whose salaries below the average ?
select first_name,last_name,salary
from employees
where salary < (select avg(salary) from employees);
-- how to find second highest salary ?
select max(salary) from employees
where salary < (select max(salary) from employees);
-- how to find who is making second highest salary ?
select *
from employees
where salary = (select max(salary) from employees
where salary < (select max(salary) from employees));

---- who is making highest money for each department
select first_name,salary,department_id
from employees
where  (department_id,salary)  in (select department_id, max(salary) from employees group by department_id)
order by salary desc;

select first_name, salary, department_id from employees where (department_id, salary) in
(select department_id, max(salary) from employees group by department_id) order by salary desc;