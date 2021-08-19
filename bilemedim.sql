--6.4 how many employees are there in each group that have minimum salary of 5000 ?
select avg(salary) from employees GROUP by job_id order by avg(salary) ;
select job_id, min(salary) from employees GROUP by job_id;
--//??????????????????

--9. Display employees' first name, Lastname department id and all departments including those where do not have any employee.
select *
from employees e 
join departments d on e.department_id=d.department_id;
--?????????


