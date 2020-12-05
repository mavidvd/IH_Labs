use sakila;

SELECT count(DISTINCT last_name) from actor; 

SELECT count(DISTINCT language_id) from film; 

select count(*) from film where rating='PG-13';

select title, length, release_year from film where release_year=2006 order by 2 desc limit 10;

select datediff(max(rental_date), min(rental_date)) from rental;

select *, month(rental_date) as month, day(rental_date) as day, CASE
	WHEN date_format(rental_date, '%w') = 0 OR date_format(rental_date, '%w') = 6 THEN 'Weekend'
    ELSE 'Weekday'
END AS day_type from rental;

select date_format(rental_date, '%w') from rental;

select distinct year(rental_date) from rental;

select count(*) as Rentals, year(rental_date) as Year, month(rental_date) as Month from rental group by 2, 3 order by 2 desc, 3 desc limit 1;

