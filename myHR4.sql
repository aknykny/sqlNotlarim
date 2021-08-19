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

create view email_list as
select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials",
first_name||' '||last_name as "full_name", lower(email||'@gmail.com') as "full_email"
from employees;
select "full_name" from email_list;
--task
--create a view called SDETs_yourname, display fullname, email(@cybertek.com) of IT_PROG 
