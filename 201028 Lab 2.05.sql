use sakila;

alter table staff drop column picture;

select * from customer where first_name='TAMMY' AND last_name = 'SANDERS';

INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username) values ('Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy');

select * from staff;

select * from rental;

select * from inventory;

select * from film; 

select * from customer where first_name = 'Charlotte' AND last_name = 'Hunter';

insert into rental (rental_date, inventory_id, customer_id, staff_id) values ('2020-10-28', 1, 130, 1);

drop table deleted_users;

CREATE TABLE deleted_users (
deleted_users_id int NOT NULL AUTO_INCREMENT,
customer_id int NOT NULL,
email varchar(50),
date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (deleted_users_id)
);

INSERT INTO deleted_users (customer_id, email)
SELECT customer_id, email
FROM customer
WHERE active = 0;

select * from deleted_users;