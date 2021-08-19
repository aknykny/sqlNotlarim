--SQL Practice Tasks Part 1
--1. List all the employees' first and last name with their salary in employees table
select first_name, last_name, salary from employees;
--2. how many employees have salary less than 5000?
select count(*) from employees where salary<5000;
--3. how many employees have salary between 6000 and 7000?
select count(*) from employees where salary BETWEEN 6000 and 7000;
--4. List all the different region_ids in countries table
select DISTINCT(region_id) from countries;
SELECT *from countries;
--5. display the salary of the employee Grant Douglas (lastName: Grant,  firstName: Douglas)
select first_name,salary  from employees where last_name like '_rant' and first_name like 'D%';
--6. display the maximum salary in employees table
select max(salary) from employees;
--7. display all informations of the employee who has the highest salary in employees table
select * from employees where salary=(select max(salary) from employees);
--8. display the the second maximum salary from the employees table
select max(salary) from employees where salary<(select max(salary) from employees);
--9. display all informations of the employee who has the second highest salary
select * from employees where salary=(select max(salary) from employees where salary<(select max(salary) from employees));

--10. display the the minimum salary in employees table
select min(salary) from employees;
--11. display all informations of the employee who has the minimum salary in employees table
select *from employees where salary=(select max(salary) from employees);
--12. display the second minimum salary from the employees table
select min(salary) from employees where salary=(select min(salary) from employees where salary>(select min(salary) from employees));
--13. display all informations of the employee who has the second minimum salary
select *from employees 
where salary=(select min(salary) from employees where salary=(select min(salary) from employees where salary>(select min(salary) from employees)));
--//////???????????????????????? why i can not get only second row;

--14. display the average salary of the employees;
SELECT avg(salary)FROM employees;
--15. list all the employees who are making above the average salary;
select*from employees where salary>(SELECT avg(salary)FROM employees) order by salary;
--16. list all the employees who are making less than the average salary
select*from employees where salary<(SELECT avg(salary)FROM employees) order by salary;

--17. count the total numbers of the departments in departs table
select count(DISTINCT(department_name)) from departments order by department_name;
--18. sort the start_date in ascending order in job_history's table
select*from job_history order by start_date asc;
--19. sort the start_date in descending order in job_history's table
select*from job_history order by start_date desc;
--20. list all the employees whose first name starts with 'A'
select *FROM employees where first_name like 'A%' order by first_name asc;
--21. list all the employees whose job_ID contains 'IT'
select *FROM employees where job_id like '%IT%' order by first_name asc;
--22. list all the employees whose department id in 50, 80, 100
select *FROM employees where department_id in(50,80,100) order by first_name asc;

