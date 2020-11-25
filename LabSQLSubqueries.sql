USE SAKILA;

# 1. Select the first name, last name, and email address of all the customers who have rented a movie.

SELECT DISTINCT
	min(first_name),
    min(last_name),
    min(email)
FROM
	customer c
INNER JOIN 
	payment p
		ON
	c.customer_id = p.customer_id
GROUP BY
	c.customer_id;

SELECT
	first_name,
    last_name,
	email
FROM
	customer c
INNER JOIN 
	payment p
		ON
	c.customer_id = p.customer_id
GROUP BY
	c.customer_id;
    
# 2. What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
    
SELECT
	c.customer_id,
    CONCAT(first_name, ' ', last_name) as Name,
    ROUND(AVG(p.amount), 2) AS 'Average Payments'
FROM 
	customer c
JOIN
	payment p 
		ON 
	c.customer_id = p.customer_id
GROUP BY
	c.customer_id;
    
# 3. Select the name and email address of all the customers who have rented the "Action" movies.
# Using Multiple Joins.
SELECT
	first_name,
    last_name,
	email
FROM
	customer c
JOIN
	rental r
		USING (customer_id)
JOIN
	inventory i
		USING (inventory_id)
JOIN 
	film_category f
		USING (film_id)
JOIN
	category a
		USING (category_id)
WHERE
	a.name = 'Action'
GROUP BY
	c.customer_id;
    
# Using Sub-queries.

SELECT
	first_name,
    last_name,
	email
FROM
	customer c
WHERE 
	c.customer_id IN (
		SELECT customer_id FROM rental WHERE inventory_id IN (
			SELECT inventory_id FROM inventory WHERE film_id IN (
				SELECT film_id FROM film_category WHERE category_id IN (
					SELECT category_id FROM category WHERE name = 'Action'
                )
            )
        )
    );


# 4. Use the case statement to create a new column classifying existing columns as either or high value transactions based on 
# the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label
# should be medium, and if it is more than 4, then it should be high.

SELECT 
	*,
    CASE WHEN amount BETWEEN 0 AND 2 THEN 'Low'
    WHEN amount BETWEEN 2 AND 4 THEN 'Medium'
    ELSE 'High' END AS 'Transaction Value'
FROM
	payment;
