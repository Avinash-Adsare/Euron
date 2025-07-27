-- Indexing - logical seperation
use cust_sales;

drop index idx_customer_city on customers;
create index idx_customer_city on customers(city);

select * from customers;

explain analyze
select * from customers where city = 'Chicago';

create index idx_sales_customer_product
on sales(customer_id,product);

explain analyze
select * from sales where customer_id = 10 and product ='Laptop';

-- Partition - divide data physically , store data into different differnt locations

create table sales2(
sale_id int not null,
customer_id int,
sale_date date not null,
sale_amount decimal(10,2),
product varchar(50),
primary key (sale_id,sale_date)
)
partition by range(year(sale_date))(
partition p2020 values less than (2021),
partition p2021 values less than (2022),
partition p2022 values less than (2023),
partition p2023 values less than (2024),
partition pmax values less than maxvalue
);

select table_name,
partition_name,
subpartition_name,
partition_ordinal_position,
partition_method,
partition_expression,
table_rows
from information_schema.partitions
where table_name = 'sales';

insert into sales2(sale_id,customer_id,sale_date,sale_amount,product)
values(1,101,'2021-05-01',599.99,'Laptop');
