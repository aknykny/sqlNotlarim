--Task 1: get me all unique job ids from employees table 
        SELECT DISTINCT(job_id) FROM employees;
--Task 2: get me average salary for IT_PROG
    select avg(salary) from employees
    where job_id='IT_PROG';
--get me average salary for each different job_id
    select job_id, avg(salary) from employees GROUP by job_id ORDER by job_id;
    select avg(salary) from employees;
    select job_id, count(job_id),min(salary) from employees GROUP by job_id order by job_id;
-- get me number of employees working for each job_id 
select job_id, count(job_id) "Numberof" from employees GROUP by job_id; 
select count(* ) from employees;
CREATE VIEW asdf as
    select job_id, count(job_id) "Numberof" from employees GROUP by job_id; 
--    select count(*) from employees; 
drop view asd;
    
    select sum("Numberof") from asdf;

--get me job_ids where their avg salary is more than 5k

select job_id, AVG(salary) from employees GROUP by job_id HAVING avg(salary)>3000 and AVG(salary) <7000 order by avg(salary) desc;


SELECT avg(salary) from  employees GROUP by job_id ;

-- get me first names, who their salary is greater than average of the same jobtitles people

--get first 10 employee then order them based on the salary high to low
select*from employees where rownum<11 order by salary desc;

--order all employees based on salary high to low then display only first 10 result
select*from employees order by salary desc;
select*from (select*from employees order by salary desc) where ROWNUM<11;

--------------
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

select*from employees where salary=(select max(salary)from employees);


--task
--create a view called SDETs_yourname, display fullname, email(@cybertek.com) of IT_PROG 

create view SDET_ali as
select first_name||last_name as "fullname", lower(email)||'@cybertek.com' as "email" from employees where job_id like '%IT%';
ALTER TABLE sdet_ali RENAME to scrumteam;

RENAME sdet_ali to sss;
drop view sss;
drop table scrumteam;
drop table sdet_ali;


SELECT   * FROM sdet_ali;

Create table Trial (
User_id integer primary key,
first_name VARCHAR(20),
last_name VARCHAR(20),
phone_number INTEGER not null,
user_location VARCHAR(10)
);

INSERT INTO trial (user_id,first_name, last_name,phone_number, user_location ) values (1,'Ali','KAYA',252566633,'amaricar');
INSERT INTO trial (user_id, first_name, last_name, user_location, phone_number) values (0,'Veli','Tas','Birmingham',124578963);
INSERT INTO trial (user_id, first_name, last_name, user_location, phone_number) values (3,'Velis','kayasu','hamurg',987578963);


select*from trial order by user_id asc;

ALTER TABLE trial RENAME to Alis_table;
alter table alis_table rename to trial;
insert into alis_table (last_name, first_name, user_location, user_id, phone_number) values ('ayse','cakil','London',4,456321789);
select*FROM alis_table;



TRUNCATE TABLE alis_table;

alter table alis_table DROP COLUMN first_name;
alter table alis_table ADD first_name VARCHAR(20)

update alis_table set last_name='konya' where user_id=1;
update alis_table set first_name='Smith' where first_name='Ali';
 
alter table alis_table RENAME COLUMN first_name to fff_name;
alter table alis_table rename COLUMN fff_name to first_name;
drop view asdf;
------------------
--select * from s;
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

select max(salary) from employees;
select salary from employees where salary=(select max(salary) from employees);
select max(salary) from employees where salary<(select salary from employees where salary=(select max(salary) from employees));
select first_name from employees where salary=(select max(salary) from employees where salary<(select salary from employees where salary=(select max(salary) from employees)));

select first_name, salary from employees where ROWNUM <3 order by  salary desc ;

--order all employees based on salary high to low then display only first 10 result
select*from employees where rownum<11 order by salary desc ;
--order all employees based on salary high to low then display only first 10 result
--how to find employees information of who is making highest salary in the company ?
select*from employees where salary=(select max(salary)from employees);
--one shot with subquery combining two queires
--finding second highest salary

--finding the employee information of who is making 2nd highest salary;
select*from employees where salary=(select max(salary)from employees where salary<(select max(salary)from employees)) and first_name like '%ee%';

--
select*from countries c join regions r on c.region_id=r.region_id where r.region_id=1;
select e.first_name, e.last_name, d.department_name 
from employees e 
join departments d on e.department_id=d.department_id 
order by d.department_name desc;

select e.first_name as name, e.last_name,d.department_name, l.city, cc.country_name 
from employees e join departments d on e.department_id=d.department_id 
INNER JOIN locations l on d.location_id=l.location_id INNER JOIN countries cc on cc.country_id=l.country_id where cc.country_name='Canada';






