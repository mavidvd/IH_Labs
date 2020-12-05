CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(001, 'Manager', '2016-02-20 00:00:00'),
		(002, 'Executive', '2016-06-11 00:00:00'),
		(008, 'Executive', '2016-06-11 00:00:00'),
		(005, 'Manager', '2016-06-11 00:00:00'),
		(004, 'Asst. Manager', '2016-06-11 00:00:00'),
		(007, 'Executive', '2016-06-11 00:00:00'),
		(006, 'Lead', '2016-06-11 00:00:00'),
		(003, 'Lead', '2016-06-11 00:00:00');
 
 
 # Challenges : 
 
# 1 Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT
	RTRIM(FIRST_NAME)
FROM
	Worker;
 
# 2 Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT
	LTRIM(DEPARTMENT)
FROM
	Worker;
 
# 3 Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT
	CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'Full Name'
FROM
	Worker;
 
# 4 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT
	*
FROM 
	Worker
ORDER BY 
	FIRST_NAME ASC;
 
# 5 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT
	*
FROM 
	Worker
ORDER BY 
	FIRST_NAME ASC, DEPARTMENT DESC;

# 6 Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT
	*
FROM 
	Worker
WHERE
	DEPARTMENT = 'Admin';

# 7  Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT
	*
FROM 
	Worker
WHERE 
	FIRST_NAME LIKE '%a%';

# 8 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT
	*
FROM 
	Worker
WHERE 
	SALARY BETWEEN 100000 AND 500000;

# 9  Write an SQL query to print details of the Workers who have joined in Feb 2014.
SELECT
	*
FROM 
	Worker
WHERE 
	YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

# 10 Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT
	COUNT(*)
FROM 
	Worker
WHERE
	DEPARTMENT = 'Admin';

# 11 Write an SQL query to print details of the Workers who are also Managers.
SELECT
	*
FROM 
	Worker w
JOIN
	Title t
		ON
	w.WORKER_ID = t.WORKER_REF_ID
WHERE
	t.WORKER_TITLE = 'Manager';

# 12 Write an SQL query to show the current date and time.
SELECT
	current_timestamp();

# 13 Write an SQL query to show the top n (say 3) records of worker table by salary.
SELECT 
	*
FROM 
	Worker
ORDER BY 
	SALARY DESC
LIMIT 3;

# 14 Write an SQL query to determine the 3rd highest salary from the table.
SELECT
	*
FROM
	(SELECT 
		*
	FROM 
		Worker
	ORDER BY 
		SALARY DESC
	LIMIT 3) sq
ORDER BY
	SALARY ASC
LIMIT 1;

# 15 Write an SQL query to fetch the list of employees with the same salary.
SELECT 
	*
FROM 
	Worker
WHERE
	SALARY IN (
        SELECT 
			SALARY
		FROM 
			Worker
		GROUP BY 
			SALARY
		HAVING 
			COUNT(SALARY) > 1);
            
SELECT 
	W.WORKER_ID,
    W.FIRST_NAME,
    W.SALARY
FROM
	Worker W
JOIN
	Worker W2
ON
	W.SALARY = W2.SALARY
AND
	W.WORKER_ID != W2.WORKER_ID;