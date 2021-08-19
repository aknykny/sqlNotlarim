--employess that job id is IT prog and sales rep
select*FROM employees where job_id in('IT_PROG','SA_REP');

--to count the result
select COUNT(*)FROM employees where job_id in('IT_PROG','SA_REP');

--how many people making more than 7000 money
select COUNT(*) FROM employees WHERE salary>7000;

SELECT COUNT(DISTINCT first_name)FROM employees;

--dec High to low-- 
SELECT*FROM employees ORDER BY salary DESC;

--asc low to high
SELECT*FROM employees ORDER BY salary ASC;

select COUNT(first_name) FROM employees where salary>5000 ORDER by salary asc;

SELECT*FROM employees WHERE first_name like 'Alex__' ORDER by last_name DESC;

SELECT*FROM employees WHERE first_name like 'Al%' ORDER by last_name DESC;

SELECT*FROM employees WHERE first_name like '__z__';

--get me first name where second char is U
SELECT first_name, last_name FROM employees where first_name like '_u%' ORDER BY last_name desc;


-- find MIn salary
SELECT MIN(salary) FROM employees;

--find MAX salary
SELECT MAX(salary) FROM employees;

--find AVG salary
SELECT AVG(salary) FROM employees;

--round a numbers
SELECT round(AVG(salary),2) FROM employees;

SELECT round(sum(salary)) from employees where salary BETWEEN 0 and 5000;


