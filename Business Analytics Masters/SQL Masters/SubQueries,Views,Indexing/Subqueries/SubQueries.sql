-- Subqueries,views & Indexing
create database cust_sales;
use cust_sales;

create table customers(
customer_id int primary key,
customer_name varchar(100),
city varchar(50),
join_date date
);

create table sales(
sale_id int primary key,
customer_id int,
sale_amount decimal(10,2),
sale_date date,
product varchar(50),
foreign key (customer_id) references customers(customer_id)
);

select * from customers;
select * from sales;

-- Q. customers who join after avg joining date
select * from customers where join_date >
(select avg(join_date) from customers);


-- Q.give me the name of all customers who made some sort of purchase
select customer_name from customers where customer_id in
(select distinct customer_id from sales);

-- Q . find customer with highest total sale 
select * from customers where customer_id =
(select customer_id from sales group by customer_id order by sum(sale_amount) desc limit 1)
;

-- Q. customer who baught laptop
select * from customers where customer_id in
(select distinct customer_id from sales where product = 'Laptop');

-- Q. customer with atleast 1 sale purchase
select * from customers c where exists(
select 1 from sales s where s.customer_id = c.customer_id);

-- hard query
-- customer sales > 10
select * from customers where customer_id in
(select distinct customer_id from sales where sale_amount >any
(select sale_amount from sales where customer_id = 10));


-- Q. fetch the customers whose sales is above 200
select * from customers where customer_id in(
select customer_id from sales group by customer_id having min(sale_amount)> 200);


-- Q. Total sales per customer
select customer_id,sale_amount from sales s1 where sale_amount >(
select avg(sale_amount) from sales s2
where s1.customer_id = s2.customer_id);

-- Q. top 5 customer by total sales
select customer_id,customer_name from customers where customer_id in (
select customer_id from sales group by customer_id order by sum(sale_amount)
desc limit 5);

-- Q. customer who purchased all products
select * from customers where customer_id in(
select customer_id from sales group by customer_id having count(distinct product)=
(select count(distinct product) from sales));

select customer_id from sales group by customer_id having sum(sale_amount)>
(select avg(total_sales) from (
(select sum(sale_amount) as total_sales from sales group by customer_id)) as avg_sales);

