create view number_a as
select last_name, length(last_name)- length(REPLACE(last_name, 'a', '')) as number_of_lowercase_a
from employees order by number_of_lowercase_a desc;

select last_name from number_a where number_of_lowercase_a=2;

--day 4 sql-----SELF JOIN
--create VIEW employee1 as 
--select employee_id,first_name, last_name, manager_id from employees;
--drop VIEW employee1;
--
--create VIEW employee2 as 
--select employee_id,first_name, last_name from employees;
--drop view employee2;
--
--select * from employee1 left join employee2 on employee1.manager_id=employee2.employee_id order by employee1.employee_id;
--
--select*from employee1;
--select*from employee2;

--SELF JOIN--yukarisi aslinda uzun yontemi- ayni table i iki table gibi dusunup kolonlari eslestirme
select * from employees e1 left join employees e2 on e1.manager_id=e2.employee_id order by e1.employee_id;

select e1.employee_id,e1.first_name,e1.last_name,e1.manager_id,e2.employee_id,e2.first_name,e2.last_name 
from employees e1 left join employees e2 on e1.manager_id=e2.employee_id order by e1.employee_id;





