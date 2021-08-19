--SQL Practice Tasks Part 1
--1. List all the employees' first and last name with their salary in employees table
        SELECT first_name, last_name, salary FROM  employees;
--2. how many employees have salary less than 5000?
    SELECT count(*) FROM employees where salary<5000;
--3. how many employees have salary between 6000 and 7000?
    SELECT first_name, last_name FROM employees where salary between 5000 and 6000;
    SELECT count(*) FROM employees where salary between 5000 and 6000;
--4. List all the different region_ids in countries table
select distinct(region_id) from countries;

--5. display the salary of the employee Grant Douglas (lastName: Grant,  firstName: Douglas)
SELECT salary FROM employees where last_name='Grant' and first_name='Douglas';

--6. display the maximum salary in employees table
select max(salary) from employees;

--7. display all informations of the employee who has the highest salary in employees table
SELECT*FROM employees where salary=(SELECT MAX(salary)FROM employees);

--8. display the the second maximum salary from the employees table
SELECT MAX(salary) FROM employees where salary<(SELECT MAX(salary) FROM employees);

--9. display all informations of the employee who has the second highest salary
SELECT*FROM employees WHERE salary = (SELECT MAX(salary) FROM employees where salary<(SELECT MAX(salary) FROM employees));

--10. display the the minimum salary in employees table
select min(salary) from employees;

--11. display all informations of the employee who has the minimum salary in employees table
SELECT*FROM employees where salary=(SELECT MIN(salary) FROM employees);

--12. display the second minimum salary from the employees table
select min(salary) from employees where salary=(select min(salary) from employees where salary>(select min(salary) from employees));

--13. display all informations of the employee who has the second minimum salary
SELECT* FROM employees
WHERE salary=
(SELECT MIN(salary) FROM EMPLOYEES WHERE salary>
(SELECT MIN(salary) FROM employees));

--//////???????????????????????? why i can not get only second row;

--14. display the average salary of the employees;
SELECT AVG(salary) FROM employees;

--15. list all the employees who are making above the average salary;
SELECT *FROM employees WHERE salary> (SELECT AVG(salary) FROM employees);

--16. list all the employees who are making less than the average salary
SELECT *FROM employees WHERE salary < (SELECT AVG(salary) FROM employees) ORDER BY salary;

--17. count the total numbers of the departments in departs table
SELECT COUNT(DISTINCT(department_name)) FROM departments;

--18. sort the start_date in ascending order in job_history's table
SELECT * FROM job_history ORDER BY start_date;

--19. sort the start_date in descending order in job_history's table
SELECT * FROM job_history ORDER BY start_date DESC;

--20. list all the employees whose first name starts with 'A'
SELECT *FROM employees where first_name like 'A%';

--21. list all the employees whose job_ID contains 'IT'
SELECT*FROM employees WHERE job_id like '%IT%';

--22. list all the employees whose department id in 50, 80, 100
SELECT*FROM employees WHERE department_id in(50,80,100);

--SQL Practice Tasks Part 2
--1. list the initials of all the employees
SELECT first_name, last_name, SUBSTR(first_name,0,1)||SUBSTR(last_name,0,1) FROM employees;

--2. list the full names of all employees ( fullname: Lastname FirstName)
SELECT first_name||' '||last_name as FULLAME FROM employees;

--3. who has the logest name in the employees table?
SELECT MAX(uzun) FROM (SELECT first_name, LENGTH(first_name) as uzun FROM employees);

SELECT first_name, last_name, LENGTH(first_name||last_name) uzun FROM employees;
SELECT max(uzun) FROM (SELECT first_name, last_name, LENGTH(first_name||last_name) uzun FROM employees);

SELECT first_name, last_name 
FROM (SELECT first_name, last_name, LENGTH(first_name||last_name) uzun FROM employees) 
WHERE uzun=
(SELECT max(uzun) FROM (SELECT first_name, last_name, LENGTH(first_name||last_name) uzun FROM employees));

--4. Show all employees who work in any one of these department id  90, 60, 100, 130, 120
SELECT*FROM employees WHERE department_id IN (90,60,100,130,120);

--5. Show all employees who does not work in any one of these department id 90, 60,  100, 130, 120
select *from employees where department_id not in(90,60,100,130,120);

--6. divide employees into groups by using thier job id
SELECT job_id, count(*) FROM employees GROUP by job_id;

--6.1 display the maximum salaries in each groups
SELECT job_id, max(salary) FROM employees GROUP by job_id;

--6.2 display the minium salaries in each groups
select job_id, min(salary) from employees GROUP by job_id ;

--6.3 display the average salary of each group
select job_id, avg(salary) from employees GROUP by job_id ;

--6.4 how many employees are there in each group that have minimum salary of 5000 ?
SELECT job_id, count(*) FROM employees GROUP by job_id HAVING MIN(salary)>5000;

--6.5 display the total budgests of each groups
SELECT job_id,SUM(salary) butget, COUNT(*) FROM employees GROUP BY job_id ORDER by SUM(salary);
--
--7. display employees' full email addresses and full names
select first_name||' '||last_name "FullName", email||'@gmail.com' "FullEmail" from employees;
--
--8. display full addresses from locations table
select l.street_address||', '||l.city||' '||l.postal_code||','||c.country_name as "Full Address" 
from locations l join countries c on l.country_id=c.country_id;
--
--(full address: Street_Addtess,  CityName  ZipCode,  Country_id)

--SQL Practice Tasks Part 3
--1. Show all job_id and average salary who work as any of these jobs IT_PROG, SA_REP, FI_ACCOUNT, AD_VP
SELECT job_id, AVG(salary) FROM EMPLOYEES where job_id in('IT_PROG', 'SA_REP', 'FI_ACCOUNT') GROUP BY job_id;

--2. Show all records whose last name contains 2 lowercase 'a's
SELECT * FROM (
SELECT*FROM employees where last_name like '%a%')
WHERE last_name like '%s%';

--3. Display max salary  for each department
SELECT d.department_name, max(salary) 
FROM employees e JOIN departments d on e.department_id=d.department_id GROUP By d.department_name;

--4. Display total salary for each department except department_id 50, and where total salary >30000
SELECT department_id, SUM(salary) FROM 
(SELECT*FROM employees WHERE department_id!='50') 
GROUP BY department_id HAVING SUM(salary)> 30000;

--5. Write a SQL query that returns first and last name any employees who started job 
--between 1-JAN-2000 and 3-SEP-2007 from the hr database
SELECT*FROM employees WHERE hire_date between '1-JAN-2000' AND '3-SEP-2007' ORDER BY hire_date;


select e.first_name,e.last_name,j.start_date
from employees e 
JOIN job_history j 
on e.job_id=j.job_id where j.start_date between '1-JAN-2000' and '3-SEP-2004' ;

--6. Display country_id, country name, region id, region name from hr database
select c.country_id,c.country_name, r.region_id, r.region_name from countries c join regions r on c.region_id=r.region_id;


--7. Display All cities, country names from hr database
select city, c.country_name  from locations l join countries c on l.country_id=c.country_id;


--8. display the first name, last name, department number, and department name,  
--for all employees for departments 80 or 40.
SELECT first_name, last_name,department_name,d.department_id 
FROM employees e 
join departments d on e.department_id = d.department_id 
WHERE e.department_id in (80,40);

--burada kaldim


--9. Display employees' first name, Lastname department id and 
--all departments including those where do not have any employee.
SELECT*FROM employees e RIGHT OUTER JOIN 
departments d on e.department_id=d.department_id;


--10. Display the first name, last name, department number, and name, for all employees who have or have not any department
SELECT*FROM employees e RIGHT OUTER JOIN departments d on e.department_id=d.department_id;
SELECT*FROM employees e LEFT OUTER JOIN departments d on e.department_id=d.department_id;

SELECT*FROM employees e LEFT JOIN departments d on e.department_id=d.department_id 
WHERE D.department_id is null;

SELECT*FROM employees e LEFT JOIN departments d on e.department_id=d.department_id 
WHERE D.department_id is NOT null;

SELECT*FROM employees e RIGHT JOIN departments d on e.department_id=d.department_id 
WHERE e.department_id is null;


select e.first_name, e.last_name, d.department_id, d.department_name 
from EMPLOYEES e left join DEPARTMENTS d on e.department_id=d.department_id;
--------------

--get me job_id s where their avg salary is more than 5k
select job_id, avg(salary),count(*) from employees group by job_id having avg(salary)>5000;
select * from employees order by salary desc;

--get first 10 employee then order them based on the salary high to low
select *  from employees  where rownum <11 order by salary desc;
--order all employees based on salary high to low then display only first 10 result
select * from (select * from employees order by salary desc) where rownum <11;



