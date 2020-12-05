use sakila;

SELECT 
	last_name, max(first_name), count(*) as surnamecount
FROM
	actor
GROUP BY
	last_name
HAVING
	surnamecount = 1;
    
SELECT min(first_name), last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

SELECT 
	last_name, max(first_name), count(*) as surnamecount
FROM
	actor
GROUP BY
	last_name
HAVING
	surnamecount > 1;
    
SELECT 
	staff_id, count(*)
FROM 
	rental
GROUP BY
	1;
    
SELECT 
	release_year, count(*)
FROM 
	film
GROUP BY
	1;
    
SELECT 
	rating, count(*)
FROM 
	film
GROUP BY
	1;
    
   SELECT 
	rating, avg(length)
FROM 
	film
GROUP BY
	1; 
    
SELECT 
	rating, avg(length)
FROM 
	film
GROUP BY
	1
HAVING
	avg(length)>120;