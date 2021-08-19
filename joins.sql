select * from customer;

select * from address;

select first_name,last_name,customer.address_id,address,phone
from customer join address
on customer.address_id = address.address_id;

select first_name,last_name,c.address_id,address,phone
from customer c full outer join address a
on c.address_id = a.address_id
where c.address_id is null or a.address_id is null;