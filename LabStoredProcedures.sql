# In the previous lab we wrote a query to find first name, last name, and emails of all the customers who rented Action movies. 
# Convert the query into a simple stored procedure. Use the following query:
# Now keep working on the previous stored procedure to make it more dynamic. Update the stored procedure in a such manner that it 
# can take a string argument for the category name and return the results for all customers that rented movie of that category/genre. 
# For eg., it could be action, animation, children, classics, etc.

drop procedure if exists CategoryRenters;

delimiter //
create procedure CategoryRenters (in cat varchar(20))
begin
  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = cat 
  group by first_name, last_name, email
  order by 2, 1;
end;
//
delimiter ;

call CategoryRenters('Action');

# Write a query to check the number of movies released in each movie category. Convert the query in to a stored procedure to filter 
# only those categories that have movies released greater than a certain number. Pass that number as an argument in the stored procedure.

drop procedure if exists CatMovies;

delimiter //
create procedure CatMovies (in num INT)
begin
	select c.name, count(*) as Movies from film_category f
	join category c using (category_id)
	group by category_id
	having Movies > num
    order by 2 asc;
end;
//
delimiter ;

call CatMovies(60);