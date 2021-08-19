--get me first_name,last_name and department_name for all employees

select * from employees;
select * from departments;


select first_name,last_name,department_name
from employees e inner join departments d 
on e.department_id = d.department_id;

--get me first_name,last_name and department_name,city for all employees
select first_name,last_name,department_name,city
from employees e inner join departments d 
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id;

--get me firstname,lastname and deparment name, city,country_name for all employees;
select first_name,last_name,department_name, city,country_name
from employees e inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id= l.location_id
join countries c
on l.country_id = c.country_id;

