use bank;

-- How many clients and accounts are there, overall?
SELECT DISTINCT
    COUNT(*)
FROM
    client;
    
SELECT 
    COUNT(*)
FROM
    account;

-- How many clients are "owners" and how many "disponents" of the accounts?
SELECT 
	type,
	COUNT(*)
FROM
	disp
GROUP BY 
	type;

-- How many clients & accounts are there by region?
SELECT
	d.A3 AS District,
    count(distinct(a.account_id)) as Accounts,
	count(distinct(c.client_id)) as Clients
FROM
	district d
JOIN
	client c
		ON
	c.district_id = d.A1
JOIN
	account a
		ON
	 d.A1 = a.district_id
GROUP BY
	d.A3;


-- Explore the loans given to clients
SELECT 
	client_id, loan_id, amount, duration, status
FROM
	loan l
JOIN
	disp d
		ON
	l.account_id = d.account_id;

SELECT 
	d.client_id, l.loan_id, l.amount, l.duration, l.status
FROM
	loan l
JOIN
	disp d
		ON
	l.account_id = d.account_id;
    
-- How could we define clients as valuable / not valuable? Recall B and D in loan status are the bad traits. 
SELECT 
	client_id,
	CASE WHEN status in ('B', 'D') THEN 'Not Valuable'
		 ELSE 'Valuable'
	END AS 'Val/No Val'
FROM
	loan l
JOIN
	disp d
		ON
	l.account_id = d.account_id;

-- Once you've defined how to classify clients as valuable / not valuable:
	-- describe both groups of clients based on information you'll find accross all tables
    -- (what type of client they are, where do they live, what type of card, etc.)