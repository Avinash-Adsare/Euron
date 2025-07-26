create database marketing_sales;
use marketing_sales;

create table customers (
customer_id int primary key,
customer_name varchar(100),
email varchar(100),
phone varchar(100),
signup_date date
);

create table products(
product_id int primary key,
product_name varchar(100),
category varchar(100),
price varchar(100),
launch_date date
);

create table campaigns (
campaign_id int primary key,
campaign_name varchar(100),
start_date date,
end_date date,
budget decimal(10,2),
channel varchar(50)
);

create table orders(
order_id int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2),
status varchar(20),
campaign_id int,
foreign key(customer_id) references customers(customer_id),
foreign key(campaign_id) references campaigns(campaign_id)
);

create table orders_details(
order_detail_id int primary key,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,2),
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id)
);

create table leads(
lead_id int primary key,
lead_name varchar(100),
email varchar(100),
phone varchar(20),
campaign_id int,
lead_date date,
status varchar(20),
foreign key(campaign_id) references campaigns(campaign_id)
);

create table sales_reps(
rep_id int primary key,
rep_name varchar(100),
email varchar(100),
hire_date date,
territory varchar(50)
);

create table customer_assignments(
assignment_id int primary key,
customer_id int,
rep_id int,
assign_date date,
foreign key (customer_id) references customers(customer_id),
foreign key (rep_id) references sales_reps(rep_id)
);

INSERT INTO customers VALUES 
(1, 'Acme Corp', 'contact@acme.com', '555-1234', '2023-01-15'),
(2, 'Beta Industries', 'info@beta.com', '555-2345', '2023-02-20'),
(3, 'Gamma Solutions', 'hello@gamma.com', '555-3456', '2023-03-10'),
(4, 'Delta Services', 'support@delta.com', '555-4567', '2023-04-05'),
(5, 'Epsilon Tech', 'sales@epsilon.com', '555-5678', '2023-05-12');


INSERT INTO products VALUES 
(101, 'Premium CRM', 'Software', 1999.99, '2023-01-01'),
(102, 'Basic CRM', 'Software', 999.99, '2023-01-01'),
(103, 'Marketing Analytics Suite', 'Software', 1499.99, '2023-02-15'),
(104, 'Sales Training Package', 'Service', 2999.99, '2023-03-01'),
(105, 'Customer Support Module', 'Software', 799.99, '2023-04-10');

INSERT INTO campaigns VALUES 
(201, 'Spring Promotion', '2023-03-01', '2023-05-31', 50000.00, 'Email'),
(202, 'Summer Sale', '2023-06-01', '2023-08-31', 75000.00, 'Social Media'),
(203, 'Product Launch', '2023-04-15', '2023-06-15', 100000.00, 'Multiple'),
(204, 'End of Year Special', '2023-11-01', '2023-12-31', 60000.00, 'Email'),
(205, 'Webinar Series', '2023-02-01', '2023-04-30', 25000.00, 'Webinar');

INSERT INTO orders VALUES 
(301, 1, '2023-04-10', 5999.97, 'Completed', 201),
(302, 2, '2023-05-15', 1999.99, 'Completed', 201),
(303, 3, '2023-06-20', 4499.97, 'Processing', 202),
(304, 1, '2023-07-05', 2999.99, 'Completed', 202),
(305, 4, '2023-08-12', 1499.99, 'Completed', 203),
(306, 5, '2023-09-18', 3999.98, 'Processing', 203),
(307, 2, '2023-10-25', 999.99, 'Pending', 204);

INSERT INTO orders_details VALUES 
(401, 301, 101, 3, 1999.99),
(402, 302, 101, 1, 1999.99),
(403, 303, 102, 3, 999.99),
(404, 303, 105, 1, 799.99),
(405, 304, 104, 1, 2999.99),
(406, 305, 103, 1, 1499.99),
(407, 306, 101, 1, 1999.99),
(408, 306, 102, 2, 999.99),
(409, 307, 102, 1, 999.99);

INSERT INTO leads VALUES 
(501, 'Zeta Corp', 'info@zeta.com', '555-6789', 201, '2023-03-15', 'Qualified'),
(502, 'Eta Enterprises', 'contact@eta.com', '555-7890', 201, '2023-04-02', 'Contacted'),
(503, 'Theta Systems', 'info@theta.com', '555-8901', 202, '2023-06-10', 'Qualified'),
(504, 'Iota Solutions', 'sales@iota.com', '555-9012', 203, '2023-05-05', 'Converted'),
(505, 'Kappa Tech', 'info@kappa.com', '555-0123', 204, '2023-11-15', 'New'),
(506, 'Lambda Services', 'hello@lambda.com', '555-1234', 205, '2023-02-20', 'Contacted'),
(507, 'Omega Industries', 'info@omega.com', '555-2345', NULL, '2023-10-10', 'New');

INSERT INTO sales_reps VALUES 
(601, 'John Smith', 'john@company.com', '2022-01-15', 'North'),
(602, 'Jane Doe', 'jane@company.com', '2022-03-20', 'South'),
(603, 'Robert Johnson', 'robert@company.com', '2022-05-10', 'East'),
(604, 'Lisa Brown', 'lisa@company.com', '2022-07-05', 'West'),
(605, 'Michael Davis', 'michael@company.com', '2022-09-12', 'Central');


INSERT INTO customer_assignments VALUES 
(701, 1, 601, '2023-01-20'),
(702, 2, 602, '2023-02-25'),
(703, 3, 603, '2023-03-15'),
(704, 4, 604, '2023-04-10'),
(705, 5, 605, '2023-05-18');

-- inner join( fetch common data only)
-- Q.
select  * from orders o inner join customers c on 
o.customer_id = c.customer_id;

-- Q which product is ordered so far
select * from products p inner join orders_details od
on p.product_id = od.product_id;

-- Q. which campaign converting into orders
select * from campaigns c inner join orders o
on c.campaign_id =  o.campaign_id ; 

-- left join and right join operations
-- left join
select * from customers c left join orders o
on c.customer_id = o.customer_id;

select * from customers;

select * from products p left join orders_details od
on p.product_id = od.product_id;


select * from campaigns c left join leads l 
on c.campaign_id = l.campaign_id;

-- right join
select * from campaigns c right join leads l 
on c.campaign_id = l.campaign_id;

select * from leads l  right join campaigns c
on c.campaign_id = l.campaign_id;

-- Full outer join(fetch data complete date from left and right table) - use union keyword
select * from campaigns c left join leads l 
on c.campaign_id = l.campaign_id 
union 
select * from campaigns c right join leads l 
on c.campaign_id = l.campaign_id;

-- cross join(matching combination rows from 2 tables)

select * from products cross join campaigns;

select * from sales_reps cross join products;

-- Multiple table join

select c.customer_name,o.order_id,o.order_date,od.quantity,od.unit_price,
p.product_name
from customers c inner join orders o on c.customer_id = o.customer_id
inner join orders_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id;

-- Q
select c.campaign_name,l.lead_name,l.status,
o.order_id,o.order_date,o.total_amount
from campaigns c
left join leads l on c.campaign_id = l.campaign_id
left join orders o on c.campaign_id = o.campaign_id;

alter table customers add column city varchar(100);
alter table customers add column state varchar(100);

update customers set city ="New York",state ="NY" where customer_id = 1;
update customers set city ="New York",state ="NY" where customer_id = 2;
update customers set city ="Boston",state ="MA" where customer_id = 3;
update customers set city ="Chicago",state ="IL" where customer_id = 4;
update customers set city ="Chicago",state ="IL" where customer_id = 5;

select * from customers;

-- self join(join table with iteself)


select * from customers c1 join customers c2
on c1.city = c2.city and c1.state = c2.state and c1.customer_id < c2.customer_id;

-- join and subquery
-- Q . find customers who have purchased a premium CRM product
select customer_name,product_name from customers c inner join orders o  on c.customer_id = o.customer_id
inner join orders_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
where p.product_name = 'Premium CRM';

-- another approach
select * from customers where customer_id in
(select o.customer_id from orders o inner join orders_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
where p.product_name = 'Premium CRM')







