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
