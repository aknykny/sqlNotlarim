select * from scrumteam;
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
