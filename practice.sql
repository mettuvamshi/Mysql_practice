=======================================================================================================================


mysql> create database practice;
mysql> use practice ;


 Create table Employees
(
     ID int ,primary key (ID),
     FirstName varchar(50),
     LastName varchar(50),
     Gender varchar(50),
     Salary int
)

Insert into Employees values (1, 'Ben', 'Hoskins', 'Male', 70000),
(2,'Mark', 'Hastings', 'Male', 60000),
(3, 'Steve', 'Pound', 'Male', 45000),
 (4, 'Ben', 'Hoskins', 'Male', 70000),
(5, 'Philip', 'Hastings', 'Male', 45000),
(6, 'Mary', 'Lambeth', 'Female', 30000),
(7, 'Valarie', 'Vikings', 'Female', 35000),
(8, 'John', 'Stanmore', 'Male', 80000);

#To find the highest salary it is straight forward. We can simply use the Max() function as shown below.
Select Max(Salary) from Employees

#To get the second highest salary use a sub query along with Max() function as shown below.
Select Max(Salary) from Employees where Salary < (Select Max(Salary) from Employees)

#To find nth highest salary using Sub-Query

Select Salary
from (
      Select distinct Salary
      FROM Employees
      ORDER BY Salary DESC limit 3
      ) results 
ORDER BY Salary limit 1;


SELECT DISTINCT FirstName,LastName FROM Employees ORDER BY LastName limit 10;

#To find nth highest salary using CTE
 WITH RESULT AS
(
    SELECT Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS DENSERANK
    FROM Employees
)
SELECT Salary
FROM RESULT
WHERE DENSERANK = 3 LIMIT 1;

#if there are no duplicates.
 WITH RESULT AS
(
    SELECT Salary,
           ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROWNUMBER
    FROM Employees
)
SELECT Salary
FROM RESULT
WHERE ROWNUMBER = 3;
==================================================================================================================================================================
# to find nth record / row 
select ID from Employees limit N-1,1;
#6th 
select ID from Employees limit 5,1;



create view players_matches as SELECT players.player_id, players.name ,
	match_scores.match_id, match_scores.runs, match_scores.balls 
	from players INNER JOIN atch_scores ON players.player_id = match_scores.player_id;



SELECT SUM(rumns) / COUNT(match_id) as avg_runs from players_matches where name ="Rohit Sharma" group by name ;
       

select from players_matches

players ( player_id integer, name varchar(255), country varchar(255))
match_scores ( match_id integer,  player_id integer,  runs integer, balls integer, fours integer, sixes integer)


player_id 		name 		match_id 		runs 		balls



==============================================================================================================


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
(001,'NIHARIKA','ARORA',20000,'2013-02-25 09:00:00','HR'),
(002,'AYUSHI','GURONDIA',5000,'2015-02-10 09:00:00','ADMIN'),
(003,'PRIYANSHA','CHOUKSEY',25000,'2014-05-16 09:00:00','HR'),
(004,'APARNA','DESHPANDE',8000,'2016-12-20 09:00:00','ADMIN'),
(005,'SHAFALI','JAIN',21000,'2015-08-29 09:00:00','ADMIN'),
(006,'SUCHITA','JOSHI',20000,'2017-02-12 09:00:00','ACCOUNT'),
(007,'SHUBHI','MISHRA',15000,'2018-03-23 09:00:00','ADMIN'),
(008,'DEVYANI','PATIDAR',18000,'2014-05-02 09:00:00','ACCOUNT');


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
(001, 5000, '15-04-20'),
(002, 3000, '15-08-11'),
(003, 4000, '15-04-20'),
(001, 4500, '15-04-20'),
(002, 3500, '15-08-11');


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


Q.1 Write an SQL query for fetching “FIRST_NAME” from the WORKER table using <WORKER_NAME> as alias.

		Select FIRST_NAME AS WORKER_NAME from Worker;


Q.2 What is an SQL Query for fetching the “FIRST_NAME” from WORKER table in upper case?

		Select upper(FIRST_NAME) from Worker;


Q.3 What is an SQL query for fetching the unique values of the column DEPARTMENT from the WORKER table?

		Select distinct DEPARTMENT from Worker;


Q.4 Write an SQL query for printing the first three characters of the column FIRST_NAME.

		Select substring(FIRST_NAME,1,3) from Worker;

Q.5 What is an SQL query for finding the position of the alphabet (‘A’) in the FIRST_NAME column of Ayushi.

		Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Ayushi';


Q.6 What is an SQL Query for printing the FIRST_NAME from Worker Table after the removal of white spaces from right side.

		Select RTRIM(FIRST_NAME) from Worker;


Q.7 Write an SQL Query for printing the DEPARTMENT from Worker Table after the removal of white spaces from the left side.

		Select LTRIM(DEPARTMENT) from Worker;


Q.8 What is an SQL query for fetching the unique values from the DEPARTMENT column and thus printing is the length?

		Select distinct length(DEPARTMENT) from Worker;


Q.9 Write an SQL query for printing the FIRST_NAME after replacing ‘A’ with ‘a’.

		Select REPLACE(FIRST_NAME,'a','A') from Worker;


Q.10 What is an SQL query for printing the FIRST_NAME and LAST_NAME into a column named COMPLETE_NAME? (A space char should be used)

		Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;


Q.11 What is an SQL query for printing all details of the worker table which ordered by FIRST_NAME ascending?

		Select * from Worker order by FIRST_NAME asc;


Q.12 Write an SQL query for printing the all details of the worker table which ordered by FIRST_NAME ascending and the DEPARTMENT in descending

		Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc


Q.13 What is an SQL query to print the details of the workers ‘NIHARIKA’ and ‘PRIYANSHA’.

		Select * from Worker where FIRST_NAME in ('NIHARIKA','PRIYANSHA');



Q.14 What is an SQL query printing all details of workers excluding the first names of ‘NIHARIKA’ and ‘PRIYANSHA’

		Select * from Worker where FIRST_NAME not in ('NIHARIKA','PRYANSHA');



Q.15 Write an SQL query for printing the details of DEPARTMENT name as “Admin”.

		Select * from Worker where DEPARTMENT like 'Admin%';



Q.16  What is an SQL query for printing the details of workers whose FIRST_NAME Contains ‘A’?

		Select * from Worker where FIRST_NAME like '%a%';


Q.17 What is an SQL Query for printing the FIRST_NAME of workers whose name ends with ‘A’?

		Select * from Worker where FIRST_NAME like '%a';


Q.18 What is an SQL Query for printing the details of the workers whose FIRST_NAME ends with ‘H’ and contains six alphabets?

		Select * from Worker where FIRST_NAME like '_____h';


Q.19 Write an SQL Query for printing the details of workers whose SALARY lies between 10000 and 20000.

		Select * from Worker where SALARY between 10000 and 20000;


Q.20 Write an SQL Query for printing the details of workers who joined inFeb’2014

		Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;


Q.21 Write an SQL Query for fetching the count of workers in DEOARTMENT with ‘Admin’.

		SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';


Q.22 Write an SQL Query for fetching the details of workers with Salaries >= 5000 and <= 10000.

		SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
		FROM worker
		WHERE WORKER_ID IN
		(SELECT WORKER_ID FROM worker
		WHERE Salary BETWEEN 5000 AND 10000);


Q.23 What is an SQL Query for fetching the no. of workers in each department in descending order?

		SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers
		FROM worker
		GROUP BY DEPARTMENT
		ORDER BY No_Of_Workers DESC;


Q.24 What is an SQL Query for printing the details of workers who are also managers?

		SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
		FROM Worker W
		INNER JOIN Title T
		ON W.WORKER_ID = T.WORKER_REF_ID
		AND T.WORKER_TITLE in ('Manager');


Q.25 Write an SQL Query for fetching the details of duplicate records in some fields.

		SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
		FROM Title
		GROUP BY WORKER_TITLE, AFFECTED_FROM
		HAVING COUNT(*) > 1;


Q.26 What is an SQL Query for only showing odd rows?

		SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;


Q.27 What is an SQL Query for only showing even rows?

		SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;


Q.28 Write an SQL Query for cloning a new table from another table.

		SELECT * INTO WorkerClone FROM Worker;

		The general way that can be used to clone a table without information is:
		SELECT * INTO WorkerClone FROM Worker WHERE 1 = 0;


Q.29 Write an SQL Query for fetching the intersecting details of two tables.

		(SELECT * FROM Worker)
		INTERSECT
		(SELECT * FROM WorkerClone);

Q.30 What is an SQL Query for showing the details of one table that another doesn’t have.

		SELECT * FROM Worker 	MINUS	SELECT * FROM Title;

=============================================================================================================================================
