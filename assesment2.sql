--SQL Practice Tasks Part 2
--1. list the initials of all the employees

SELECT first_name,last_name, SUBSTR(first_name,0,1)||'.'||SUBSTR(last_name,0,1)||'.' as Inistials  FROM employees;

--
--2. list the full names of all employees ( fullname: Lastname FirstName)
select first_name||' '||last_name as FullName from employees;
--3. who has the logest name in the employees table?
select first_name, LENGTH(first_name) as length from employees;
select max(length) from (select first_name, LENGTH(first_name) as length from employees);
select first_name, length(first_name) from employees where length(first_name)=(select max(length)from (select first_name, LENGTH(first_name) as length from employees));

--4. Show all employees who work in any one of these department id  90, 60, 100, 130, 120
select *from employees where department_id in(90,60,100,130,120);
--5. Show all employees who does not work in any one of these department id 90, 60,  100, 130, 120
select *from employees where department_id not in(90,60,100,130,120);

--6. divide employees into groups by using thier job id
select job_id, COUNT(*) from employees GROUP by job_id ;
--6.1 display the maximum salaries in each groups
select job_id, max(salary) from employees GROUP by job_id ;
--6.2 display the minium salaries in each groups
select job_id, min(salary) from employees GROUP by job_id ;

--6.3 display the average salary of each group
select job_id, avg(salary) from employees GROUP by job_id ;

--6.4 how many employees are there in each group that have minimum salary of 5000 ?
select avg(salary) from employees GROUP by job_id order by avg(salary) ;
--??????????????????????????????????????????????????

select job_id, min(salary) from employees GROUP by job_id;
--
--//??????????????????

--6.5 display the total budgests of each groups
select job_id,sum(salary) as budget, count(*) from employees GROUP by job_id  order by job_id;
--
-- 
--
--7. display employees' full email addresses and full names
select first_name||' '||last_name "FullName", email||'@gmail.com' "FullEmail" from employees;
--
--(assume that the domain of the email is @gmail)
--8. display full addresses from locations table
select l.street_address||', '||l.city||' '||l.postal_code||','||c.country_name as "Full Address" from locations l join countries c on l.country_id=c.country_id;
--
--(full address: Street_Addtess,  CityName  ZipCode,  Country_id)