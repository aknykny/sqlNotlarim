--SQL Practice Tasks Part 3
--1. Show all job_id and average salary who work as any of these jobs IT_PROG, SA_REP, FI_ACCOUNT, AD_VP
select job_id, avg(salary) from employees where job_id in('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')GROUP by job_id;
select job_id,avg (salary) from employees group by job_id;
--2. Show all records whose last name contains 2 lowercase 'a's
select *from (select*from employees where last_name like '%a%') where last_name like '%s%';
select*from employees where last_name like '%a%';
--3. Display max salary  for each department
select d.department_name, max(salary) from employees e join departments d on e.department_id=d.department_id GROUP BY d.department_name;
    

--4. Display total salary for each department except department_id 50, and where total salary >30000
select d.department_name, sum(salary), count(*) from employees e join departments d on e.department_id=d.department_id group by d.department_name;
--5. Write a SQL query that returns first and last name any employees who started job between 1-JAN-2000 and 3-SEP-2007 from the hr database
select e.first_name,e.last_name,j.start_date
from employees e 
JOIN job_history j 
on e.job_id=j.job_id where j.start_date between '1-JAN-2000' and '3-SEP-2004' ;

--6. Display country_id, country name, region id, region name from hr database
select c.country_id,c.country_name, r.region_id, r.region_name from countries c join regions r on c.region_id=r.region_id;


--7. Display All cities, country names from hr database
select city, c.country_name  from locations l join countries c on l.country_id=c.country_id;


--8. display the first name, last name, department number, and department name,  for all employees for departments 80 or 40.
select first_name, last_name, d.department_name, d.department_id 
from employees e 
join departments d on e.department_id=d.department_id 
where e.department_id in (80,40);

--9. Display employees' first name, Lastname department id and all departments including those where do not have any employee.
select e.first_name, e.last_name, d.department_id, d.department_name
from employees e 
RIGHT OUTER join departments d on e.department_id=d.department_id;
?????????


--
--10. Display the first name, last name, department number, and name, for all employees who have or have not any department
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



