SELECT * from address;
select*from customer;

--CONNECTING TO TABLE TO EACHOTHER BY COMMON COLUMN
SELECT first_name,c.address_id,last_name,address,phone 
FROM customer c JOIN address a 
ON c.address_id=a.address_id;

SELECT first_name,c.address_id,last_name,address,phone 
FROM customer c LEFT OUTER JOIN address a 
ON c.address_id=a.address_id;

SELECT first_name,c.address_id,last_name,address,phone 
FROM customer c inner JOIN address a 
ON c.address_id=a.address_id;

select first_name,last_name,department_name 
from employees e inner join departments d on e.department_id=d.department_id; 

select first_name, last_name, department_name, city
from employees e inner JOIN departments d on e.department_id=d.department_id 
JOIN locations l on d.location_id=l.location_id; 

select first_name, last_name, department_name, city,country_name
from employees e inner JOIN departments d on e.department_id=d.department_id 
JOIN locations l on d.location_id=l.location_id
JOIN countries co on co.country_id=l.country_id;


