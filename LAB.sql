CREATE DATABASE ORG;
USE ORG;


-- Create the Employee table
CREATE TABLE Employee (
    EMPLOYEE_ID INT PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL,
    SALARY INT NOT NULL,
    JOINING_DATE DATETIME NOT NULL,
    DEPARTMENT VARCHAR(255) NOT NULL
);

select * from Employee;
drop table Employee;

INSERT INTO Employee (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
   (1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
   (2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
   (3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
   (4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
   (5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
   (6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
   (7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
   (8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
   
 -- xxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxx


-- Create the Bonus table
CREATE TABLE Bonus (
    EMPLOYEE_REF_ID INT PRIMARY KEY NOT NULL,
    BONUS_DATE DATETIME NOT NULL,
    BONUS_AMOUNT INT NOT NULL
);

select * from Bonus;
drop table Bonus;

INSERT INTO Bonus (EMPLOYEE_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES
    (1, '2016-02-20 00:00:00', 5000),
    (2, '2016-06-11 00:00:00', 3000),
    (3, '2016-02-20 00:00:00', 4000),
    (4, '2016-02-20 00:00:00', 4500),
    (5, '2016-06-11 00:00:00', 3500);
    
-- xxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxx


-- Create the Title table
CREATE TABLE Title (
    EMPLOYEE_REF_ID INT PRIMARY KEY NOT NULL,
    EMPLOYEE_TITLE VARCHAR(255) NOT NULL,
    AFFECTED_FROM DATETIME NOT NULL
);

select * from Title;
drop table Title;

INSERT INTO Title (EMPLOYEE_REF_ID, EMPLOYEE_TITLE, AFFECTED_FROM)
VALUES
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (3, 'Executive', '2016-06-11 00:00:00'),
    (4, 'Manager', '2016-06-11 00:00:00'),
    (5, 'Asst. Manager', '2016-06-11 00:00:00'),
    (6, 'Executive', '2016-06-11 00:00:00'),
    (7, 'Lead', '2016-06-11 00:00:00'),
    (8, 'Lead', '2016-06-11 00:00:00');
-- xxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxxxxxxxxxxx---xxxxxxxxxxxxxxxx


/*Q-1. Write an SQL query to fetch “FIRST_NAME” from Employee table using the alias name as <EMPLOYEE_NAME>.*/
select FIRST_NAME AS EMPLOYEE_NAME from Employee;


/*Q-2. Write an SQL query to fetch “FIRST_NAME” from EMPLOYEE table in upper case. */
select upper(FIRST_NAME) AS "EMPLOYEE_NAME(upper case)" from Employee;


/*Q-3. Write an SQL query to fetch unique values of DEPARTMENT from EMPLOYEE table.*/
select distinct DEPARTMENT from Employee;


/*Q-4. Write an SQL query to print the first three characters of FIRST_NAME from EMPLOYEE table.*/
select substring(FIRST_NAME, 1, 3) AS "EMPLOYEE_NAME(characters)" from Employee;



/*Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from EMPLOYEE table. */
select position('a' IN 'Amitabh') from Employee where FIRST_NAME = 'Amitabh';

select locate('a', 'Amitabh') AS "EMPLOYEE_NAME(position)" from Employee where FIRST_NAME = 'Amitabh';


/*Q-6. Write an SQL query to print the FIRST_NAME from EMPLOYEE table after removing white spaces from the right side. */
SELECT trim('    SQL Tutorial    ') AS TrimmedString;

select Rtrim(FIRST_NAME)  AS TrimmedString from Employee;


/*Q-7. Write an SQL query to print the DEPARTMENT from EMPLOYEE table after removing white spaces from the left side.*/
select Ltrim(DEPARTMENT)  AS TrimmedString from Employee;


/*Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from EMPLOYEE table and prints its length.*/
select distinct DEPARTMENT, length(DEPARTMENT)  AS Length from Employee;


/*Q-9. Write an SQL query to print the FIRST_NAME from EMPLOYEE table after replacing ‘a’ with ‘A’.*/
select replace(FIRST_NAME, 'a', 'A') from Employee;

select reverse(FIRST_NAME) from Employee;

select repeat(FIRST_NAME,2) from Employee;



/*Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column COMPLETE_NAME. A space char should separate them.*/
select FIRST_NAME,LAST_NAME,  group_concat(FIRST_NAME," ",LAST_NAME) AS COMPLETE_NAME from Employee group by FIRST_NAME,LAST_NAME;


/*Q-11. Write an SQL query to print all EMPLOYEE details from the EMPLOYEE table order by FIRST_NAME Ascending.*/
select * from Employee order by FIRST_NAME asc;


/*Q-12. Write an SQL query to print all EMPLOYEE details from the EMPLOYEE table order by FIRST_NAME Ascending and DEPARTMENT Descending.*/
select * from Employee order by FIRST_NAME asc, DEPARTMENT desc;


/*Q-13. Write an SQL query to print details for EMPLOYEEs with the first name as “Vipul” and “Satish” from EMPLOYEE table.*/
select * from Employee where FIRST_NAME IN ('Vipul', 'Satish');

select * from Employee where FIRST_NAME NOT IN ('Vipul', 'Satish');

select * from Employee where EMPLOYEE_ID IN (select EMPLOYEE_REF_ID from Bonus ); # it will print matching values in both table

select * from Employee where EMPLOYEE_ID NOT IN (select EMPLOYEE_REF_ID from Bonus ); # it will print non-matching values in both table


/*Q-14. Write an SQL query to print details of EMPLOYEEs excluding first names, “Vipul” and “Satish” from EMPLOYEE table.*/
select * from Employee where FIRST_NAME NOT IN ('Vipul', 'Satish');


/*Q-15. Write an SQL query to print details of EMPLOYEEs with DEPARTMENT name as “Admin”.*/
select * from Employee where DEPARTMENT = 'Admin';


/*Q-16. Write an SQL query to print details of the EMPLOYEEs whose FIRST_NAME contains ‘a’.*/
select * from Employee where FIRST_NAME like '%a%';


/*Q-17. Write an SQL query to print details of the EMPLOYEEs whose FIRST_NAME ends with ‘a’.*/
select * from Employee where FIRST_NAME like '%a';#END

select * from Employee where FIRST_NAME like 'a%';#START


/*Q-18. Write an SQL query to print details of the EMPLOYEEs whose FIRST_NAME ends with ‘h’ and contains six alphabets.*/
select * from Employee where FIRST_NAME like '_____h';#END

select * from Employee where FIRST_NAME like 'h_____';#START


/*Q-19. Write an SQL query to print details of the EMPLOYEEs whose SALARY lies between 100000 and 500000.*/
select * from Employee where SALARY BETWEEN 100000 and 500000;


/*Q-20. Write an SQL query to print details of the EMPLOYEEs who have joined in Feb’2014.*/
select * from Employee where JOINING_DATE = '2014-02-20';# it will show nothing

select * from Employee where JOINING_DATE like '2014-02%';


/*Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.*/
select count(*) from Employee where DEPARTMENT = 'Admin';# This one answer

select FIRST_NAME,count(*) from Employee where DEPARTMENT = 'Admin' group by FIRST_NAME;


/*Q-22. Write an SQL query to fetch EMPLOYEE names with salaries >= 50000 and <= 100000.*/
select FIRST_NAME,LAST_NAME,SALARY from Employee where SALARY BETWEEN 50000 and 100000;

select FIRST_NAME, LAST_NAME, SALARY, group_concat(FIRST_NAME, ' ', LAST_NAME, ' ', SALARY) AS "COMPLETE_NAME(WITH SALARY)" from Employee where SALARY BETWEEN 50000 AND 100000 group by FIRST_NAME, LAST_NAME, SALARY;



/*Q-23. Write an SQL query to fetch the no. of EMPLOYEEs for each department in the descending order.*/
select DEPARTMENT, count(*) AS COUNT_EMPLOYEES from Employee group by DEPARTMENT order by DEPARTMENT desc;


/*Q-24. Write an SQL query to print details of the EMPLOYEEs who are also Managers.*/
select Employee.* from Employee INNER JOIN Title ON Employee.EMPLOYEE_ID = Title.EMPLOYEE_REF_ID where Title.EMPLOYEE_TITLE = 'Manager';

select E.*
from Employee E # we can declare alias without adding AS keyword.
INNER JOIN Title T ON E.EMPLOYEE_ID = T.EMPLOYEE_REF_ID
where T.EMPLOYEE_TITLE = 'Manager';


/*Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/
SELECT DEPARTMENT, COUNT(EMPLOYEE_ID) AS duplicate_count
FROM Employee
GROUP BY DEPARTMENT
HAVING COUNT(DEPARTMENT) > 1;

SELECT E.DEPARTMENT, COUNT(E.EMPLOYEE_ID) AS duplicate_count, 
       GROUP_CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS Employee_Names
FROM Employee E
INNER JOIN (
    SELECT DEPARTMENT
    FROM Employee
    GROUP BY DEPARTMENT
    HAVING COUNT(DEPARTMENT) > 1
) Duplicates
ON E.DEPARTMENT = Duplicates.DEPARTMENT
GROUP BY E.DEPARTMENT, E.FIRST_NAME, E.LAST_NAME;



/*Q-27. Write an SQL query to show only even rows from a table.*/
select * from Employee where mod(EMPLOYEE_ID,2) = 0;#EVEN NUMBER

select * from Employee where mod(EMPLOYEE_ID,2) != 0;#EVEN NUMBER


/*Q-28. Write an SQL query to show the current date and time.*/
Select current_date() AS "CURRENT DATE"; 

select current_time() AS "CURRENT TIME" ;

select current_timestamp() AS "CURRENT TIME STAMP";

SELECT sysdate() 'Current TIME using SYSDATETIME()';



/*Q-29. Write an SQL query to show the top n (say 10) records of a table.*/
select * from Employee limit 10;

select * from Employee where EMPLOYEE_ID <= 5;

select * from Employee order by  EMPLOYEE_ID desc limit 10;



/*Q-30. Write an SQL query to fetch three max salaries from a table.*/
select max(SALARY) from Employee limit 3;

select distinct SALARY from Employee order by SALARY desc limit 3;




 







