create database prince_store;

Show databases;

use prince_store;

-- konsa db hai dikhata hai 

select database();

drop database prince_store;

show databases;

-- this command is for showing the database / commond for single line 

-- this is for multiline command 
-- (ctrl + / )  or /**?
-- this is SQl
-- this class run by prince sir
-- this command is for multiple time


-- Table 
create database prince_data;
use prince_data;
select database();

-- table str
-- create table table_name(
-- column1,datatype,constraints,
-- column2,datatype,
-- column3,datatype,
-- ...
-- );

create table students1(
Stundent_ID INT,
Name varchar(50),
Age Int
);



create table employees(
emp_id INT primary key,
name varchar(50),
department varchar(50),
salary decimal(10,2) Default 30000
);

create table orders(
order_id int primary key,
customer_id int not null,
order_date date not null,
total_amount decimal(10,2) not null,
unique (order_id,customer_id)
);

-- descibe the table, give information
-- describe employees

-- checks how many tables
-- show tables

-- detail explaination
-- explain employees;

-- Rename the table
rename table employees to staff;

-- show tables;
rename table students1 to mystudents;
show tables;

drop table mystudents;

show tables;


-- drop multiple tables 
 drop table employees,orders;
 
 Drop table if exists students1 ;
 
 show databases;
 use sales;
 
 create table customers1(
 customer_id int auto_increment primary key,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(100),
phone_number varchar(20)
 );
 
 desc customers1;
 
 select * from customers;
 select * from sales.customers1;
 
 --  Constraints in SQL
 -- Primary key
 
 Create table Students(
 StudentID INT NOT NULL Primary key,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Age int
 );

Describe Students;

-- primary key checking
Show index from Students;

-- method 2 of primary key  declare


create table Students1(
StudentID INT NOT NULL,
FirstName varchar(50),
LastName varchar(50),
Age int,
Primary key (StudentID)
);

-- Composite key (Multiple Primary Key in one table) 

create table Entrollments(
StudentID INT NOT NULL,
CourseID INT NOT NULL,
primary key(StudentID,CourseID)
);

-- drop primary key 

Alter table Students
drop primary key;

-- Add primary key in exting table
Alter table Students
Add primary key(StudentsID);


-- Foreign Key
-- Primary key acts as a foreign key when used in other table.

-- Hands on Foreign key
use sales; 

create table Entrollments1(
EntrollmentID INT primary key,
StudentID INT,
CourseName varchar(50),
foreign key(StudentID) References Students1(StudentID)
);

-- badd me foreign key dena hai to, if table is already exists

Alter table Entrollments
add constraint fk_student
foreign key (StudentID) References Students1(StudentID);

-- cascading
-- ON DELETE CASCADE
-- ON UPDATE CASCADE

-- how to delete foreign key

alter table Entrollments
drop foreign key fk_student;

-- composite key

create table Orders(
OrderID INT,
CustID INT,
ProductID INT,
primary key(OrderID),
foreign key(CustID,ProductID) references Customers1(CustomerID,ProductID)
);

-- uniques keys
-- delete tables
create table Employees(
EmployeeID int primary key,
Email varchar(100) unique,
PhoneNumber varchar(12) unique
);

describe Employees;

create table Orders1(
OrderID INT primary key,
CustomerID INT,
ProductID INT,
constraint unique_order unique(CustomerID,ProductID)
);

describe Orders1;

create table EMployees1(
EmployeeID INT primary key,
Email varchar(100),
PhoneNumber varchar(12)
);

describe Employees1;

-- already ecisting table unique key add

alter table Employees1
add constraint unique_email unique (Email);

-- drop unique
alter table Employees1
drop index unique_email;

describe Employees1;

drop database if exists Employees;

-- Select Stmt
select * from employees;

select first_name, last_name from employees;

-- other method
select first_name, last_name from employees.employees; 

-- and,or,where
-- condition

select * from Employees where Gender = "M";

select first_name, last_name from Employees where Birth_Date>25;

-- and , or
select first_name,last_name
from employees
where hire_date > '2015-01-01' and gender="M";

-- or
select first_name,last_name
from employees
where hire_date > '2015-01-01' or gender="M";

-- like 
select first_name,last_name
from employees
where birth_date > '2015-01-01' and first_name like "l%";

select first_name,last_name
from employees
where birth_date > '2015-01-01' or first_name like "%son%";

select last_name
from employees
where last_name like "_a%";

select first_name
from employees
where first_name like "J_O%";
 
 -- in , null , not;
 -- in
 
 select first_name, last_name,gender
 from employees
 where gender IN ('M','F');
 
 -- not in
select first_name, last_name,hiring
from employees
where year(hire_date) NOT IN (2010,2012,2014);


-- null or not null

 select first_name, last_name,birth_date
 from employees
 where birth_date IS NULL;
 
 select first_name, last_name,gender
 from employees
 where gender IS NOT NULL;
 
 -- between(Range)
 select first_name, last_name,birth_date
 from employees
 where birth_date between '01-01-2002' and '01-01-2025';
 
select first_name, last_name,birth_date
from employees
where birth_date between '01-01-2002'and '01-01-2025'
and hire_date > 01-01-2007;

 select first_name, last_name,gender,emp_no,birth_date
 from employees
 where (gender = 'M' or hire_date < '01-01-2003')
 and emp_no between 2000 and 3000;
 
 
 -- Aggreagate functions:
 
 select * from employees;
 select count(*) from employees;
 
 select sum(emp_no) from employees;
 select AVG(emp_no) from employees;
 
-- alias (AS) :
select first_name As "Fname", last_name AS "Lname" from employees;

select e.first_name, e.last_name
from employees AS e
where e.gender ='M';


-- order by and group by

 select first_name,last_name,gender
 from employees
 ORDER By gender desc, last_name ASC;
 
 -- group by
 select gender,count(*) as employee_count 
 from employees
 group by gender;
 
 -- LIMIT ,DISTINCT , AND HAVING IN SQL
 
 -- having 
 select gender ,count(*) as employee_count
 from employees
 Group By gender
 having count(*) > 8;
 
 select first_name, Max(birth_date) as latest_birthday
 from employees
 Group by first_name
 having max(birth_date)<'1990-01-01';
 
 -- limit
 select * from employees
 limit 5;
 
 -- offset means next values
 select * from employees
 limit 5 offset 5;
 
 -- distint(category kitne hai)
 select distinct gender from employees;
 
 
 
 -- insert date in table
 
 insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
 values (2001,'01-01-2001','Jon','Doe','M','01-06-2007');
 
 
 -- checking values if exist
  insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
 values (2002,'01-01-2001','Jon','Doe','M','01-06-2017');
 
 -- multiple values insert
 
 insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
 values (2009,'07-01-1982','Alice','Dj','M','05-06-2006'),
 (2000,'07-04-1992','Avinash','sharma','M','05-06-2004'),
 (2003,'15-07-2002','Tejas','Adsare','F','05-06-2025');
 
 -- if duplicates
 
 insert into employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
 select (2001,'01-01-2001','Jon','Doe','M','01-06-2017')
 where not exists(
 select 1
 from employees
 where emp_no = 2001);
 
 -- copy data from one table to another table
 
 create table employees2(
 emp_no int primary key,
 first_name varchar(14),
 last_name varchar(16),
 gender enum('M','F'),
 birth_date date,
 hire_date date
 );
 
insert into employees2 (emp_no,birth_date,first_name,last_name,gender,hire_date)
values 
(2009,'07-01-1982','Alice','Dj','M','05-06-2006'),
(2000,'07-04-1992','Avinash','sharma','M','05-06-2004'),
(2003,'15-07-2002','Tejas','Adsare','F','05-06-2025')
 ;
 
create table employees2_backup(
 emp_no int primary key,
 first_name varchar(14),
 last_name varchar(16),
 gender enum('M','F'),
 birth_date date,
 hire_date date
 );
 
insert into employees2_backup (emp_no,birth_date,first_name,last_name,gender,hire_date)
select mp_no,birth_date,first_name,last_name,gender,hire_date
from employee2
Where Not exists(
select 1
from employees_backup
where employees_backup.emp_no = employee2.emp_no
);
 
-- delete rows, columns, table:

delete from employees
where emp_no In ( 2001,2002,2004); -- multiple 

-- delete table columnswise

alter table employees1
drop column first_name,
drop column last_name,
drop gender,
drop hire_date;

-- whole table droping 
drop table if exists employees1;

/*
-- update stmt
-- syntax

update table_name
set column1 = value1, column = value2,...
where condition;

*/

update employee
set hire_date = '02-09-2023'
where emp_no = 2002;


-- commit and rollback :

-- commit - save the all changes permanently

-- rollback - reverts all the changes during the current transaction 1 step only


-- drop, truncate, delete:

-- Delete: Interview questions asked
/*
-- syntax

delete from tablename
where condition
*/

delete from employee1
where hire_date > '01-01-2006';


-- Aggregate function :
select count(column_name) from employees;

select sum(salary) as Total_salary from employees;

select avg(salary) as Avg_salary from employees;

select max(salary) as maximum_salary from employees;

select min(salary) as minimum_salary from employees;


select gender, sum(salary) as Total_salary_by_grnder
from employee
group by gender;

/*
-- Joins
-- By deafult inner join is in sql

-- Inner Join
-- null values rows are not added
-- by default duplicates are allowed

-- eg 2 table join

select table1.col1, table2.col2
from table1
inner join table2
on table1.col = table2.col

*/

create table customers(
cust_id int primary key,
name varchar(50),
city varchar(50)
);

create table orders(
order_id int primary key,
cust_id int,
amount int,
foreign key(cust_id) references customers(cust_id)
);

insert into customers(cust_id,name,city)
values
(1,"Avi","Pune"),
(2,"Ram","Mumbai"),
(3,"Krish","Denmark");

-- inner join
select 
customers.cust_id,
customers.name,
customers.city,
orders.order_id,
orders.amount

from customers
inner join orders
on customers.cust_id = orders.cust_id;

-- handling null values in inner join

insert into customers(cust_id,name,city)
values(5,'Eve','paris');

insert into orders (order_id,cust_id,amount)
values(5,NULL,500);


-- Left join: inner join part + left part

select 
customers.cust_id,
customers.name,
customers.city,
orders.order_id,
orders.amount
from customers
left join orders
on customers.cust_id = orders.customer_id;

-- Right Join

select 
customers.cust_id,
customers.name,
customers.city,
orders.order_id,
orders.amount
from customers
right join orders
on customers.cust_id = orders.customer_id;


-- Full Outer Join

select 
customers.cust_id,
customers.name,
customers.city,
orders.order_id,
orders.amount
from customers
left join orders
on customers.cust_id = orders.customer_id;

union
select 
customers.cust_id,
customers.name,
customers.city,
orders.order_id,
orders.amount
from customers
right join orders
on customers.cust_id = orders.customer_id;

