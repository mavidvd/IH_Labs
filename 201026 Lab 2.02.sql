use sakila;
show tables;
select title from film;
select name AS LANG from language; 
select count(*) from store; 
select count(*) from staff; 
select first_name from staff;

select * from actor where first_name='Scarlett';
select * from actor where last_name='Johansson';
select count(film_id) from film;
select count(rental_id) from rental;

select rental_duration from film order by 1 asc limit 1;
select rental_duration from film order by 1 desc limit 1;

select length as min_duration from film order by 1 asc limit 1;
select length as max_duration from film order by 1 desc limit 1;

select avg(length) as AverageDuration from film;

select concat(floor(avg(length)/ 60), ':', round((avg(length)%60), 0)) as AverageDuration from film;

select time_format((avg(length)/60, '%H/%i')) as AverageDuration from film;

select title, length from film where length>180;

select distinct
	first_name as Name,
    upper(last_name) as Surname,
    lower(email) 
from customer;

select title from film order by length(title) desc limit 1;

