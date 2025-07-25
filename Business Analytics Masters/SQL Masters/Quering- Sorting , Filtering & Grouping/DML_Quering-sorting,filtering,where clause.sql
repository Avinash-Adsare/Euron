create database zara;
use zara;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each record
    product_id VARCHAR(50) NOT NULL, -- Product ID from source
    product_position VARCHAR(20), -- Position in store (e.g., Aisle, End-cap)
    promotion ENUM('Yes', 'No') NOT NULL, -- Promotion status
    product_category VARCHAR(50), -- Category (e.g., Clothing)
    seasonal ENUM('Yes', 'No'), -- Seasonal indicator
    sales_volume INT, -- Sales volume
    brand VARCHAR(50), -- Brand name
    url VARCHAR(255), -- Product URL
    sku VARCHAR(50), -- SKU number
    name VARCHAR(255), -- Product name
    description TEXT, -- Product description
    price DECIMAL(10,2), -- Price
    currency VARCHAR(10), -- Currency code (e.g., USD)
    scraped_at DATETIME, -- Timestamp of data scrape
    terms VARCHAR(50), -- Section or terms (e.g., jackets)
    section VARCHAR(50) -- Section (e.g., MAN)
);


select * from products ;

INSERT INTO products (
    product_id,
    product_position,
    promotion,
    product_category,
    seasonal,
    sales_volume,
    brand,
    url,
    sku,
    name,
    description,
    price,
    currency,
    scraped_at,
    terms,
    section
) VALUES (
    '185102',                -- product_id
    'Aisle',                -- product_position
    'No',                   -- promotion
    'Clothing',             -- product_category
    'No',                   -- seasonal
    2823,                   -- sales_volume
    'Zara',                 -- brand
    'https://www.zara.com/us/en/basic-puffer-jacket-p06985450.html', -- url
    '272145190-250-2',       -- sku
    'BASIC PUFFER JACKET',  -- name
    'Puffer jacket made of tear-resistant ripstop fabric. High collar and adjustable long sleeves with adhesive straps. Welt pockets at hip. Adjustable hem with side elastics. Front zip closure.', -- description
    19.99,                  -- price
    'USD',                  -- currency
    '2024-02-19 08:50:05', -- scraped_at (formatted as DATETIME)
    'jackets',              -- terms
    'MAN'                   -- section
);

INSERT INTO products (
    product_id,
    product_position,
    promotion,
    product_category,
    seasonal,
    sales_volume,
    brand,
    url,
    sku,
    name,
    description,
    price,
    currency,
    scraped_at,
    terms,
    section
) VALUES
-- Record 1
('185102', 'Aisle', 'No', 'Clothing', 'No', 2823, 'Zara', 'https://www.zara.com/us/en/basic-puffer-jacket-p06985450.html', '272145190-250-2', 'BASIC PUFFER JACKET', 'Puffer jacket made of tear-resistant ripstop fabric. High collar and adjustable long sleeves with adhesive straps. Welt pockets at hip. Adjustable hem with side elastics. Front zip closure.', 19.99, 'USD', '2024-02-19 08:50:05', 'jackets', 'MAN'),

-- Record 2
('188771', 'Aisle', 'No', 'Clothing', 'No', 654, 'Zara', 'https://www.zara.com/us/en/tuxedo-jacket-p08896675.html', '324052738-800-46', 'TUXEDO JACKET', 'Straight fit blazer. Pointed lapel collar and long sleeves with buttoned cuffs. Welt pockets at hip and interior pocket. Central back vent at hem. Front button closure.', 169, 'USD', '2024-02-19 08:50:06', 'jackets', 'MAN'),

-- Record 3
('180176', 'End-cap', 'Yes', 'Clothing', 'Yes', 2220, 'Zara', 'https://www.zara.com/us/en/slim-fit-suit-jacket-p01564520.html', '335342680-800-44', 'SLIM FIT SUIT JACKET', 'Slim fit jacket. Notched lapel collar. Long sleeves with buttoned cuffs. Welt pocket at chest and flap pockets at hip. Interior pocket. Back vents. Front button closure.', 129, 'USD', '2024-02-19 08:50:07', 'jackets', 'MAN'),

-- Record 4
('112917', 'Aisle', 'Yes', 'Clothing', 'Yes', 1568, 'Zara', 'https://www.zara.com/us/en/stretch-suit-jacket-p01564300.html', '328303236-420-44', 'STRETCH SUIT JACKET', 'Slim fit jacket made of viscose blend fabric. Notched lapel collar. Long sleeves with buttoned cuffs. Welt pocket at chest and flap pockets at hip. Interior pocket. Back vents. Front button closure.', 129, 'USD', '2024-02-19 08:50:07', 'jackets', 'MAN'),

-- Record 5
('192936', 'End-cap', 'No', 'Clothing', 'Yes', 2942, 'Zara', 'https://www.zara.com/us/en/double-faced-jacket-p08281477.html', '312368260-800-2', 'DOUBLE FACED JACKET', 'Jacket made of faux leather faux shearling with fleece interior. Tabbed lapel collar. Long sleeves. Zip pockets at hip. Front zip closure.', 139, 'USD', '2024-02-19 08:50:08', 'jackets', 'MAN');



select * from products ;

-- select name, price column(specific column selected)
select name, price from products;

-- alice
select name as ProductName, price as ProductPrice from products;

-- filter out (where clause is used)
select * from products where promotion = 'yes';
select * from products where product_position = 'Front of Store';
select * from products where price > 100;

-- filter out with multiple conditions
select * from products where price > 100 and promotion = 'yes';

-- either condition
select * from products where price > 100 or seasonal = 'yes';

-- not condition
select * from products where not promotion = 'yes';

-- like(fetching) 
select * from products where name like '%jack%' ; 

select * from products where description like '%slim fit%' ; 
-- multiple fetching
select * from products where section in ('man','women');

select * from products where terms in ('shoes','jeans');

-- between keyword
select * from products where price between 100 and 150;

select * from products where name is null;

-- order by
select * from products order by price asc;
select * from products order by price desc;

-- limit 
select * from products limit 4;

-- limit and asc first 5
select * from products order by price asc limit 5 ;

-- total no of records (count)
select count(*)  from products;

-- avg price
select avg(price) from products;

select min(price) from products;
select max(price) from products;


select * from products;

-- group by
select terms,count(*) from products group by terms;

-- update operation
-- before updation check safe mode , make it enable/ disable
-- for disble safe mode = 0
set sql_safe_updates = 0;
update products set promotion = 'yes' where price > 100;

select * from products where price > 100;


-- for enable safe mode
set sql_safe_updates = 1;

-- DML
-- delete (for delete you have to disable safe mode)
set sql_safe_updates = 0;

select * from products;

-- delete by certain condition

delete from products where sales_volume < 1500;
select * from products;

-- truncate(all dataset delete together)/ delete table
truncate table products;

delete table products;

-- Quering

select * from products;


select product_id,promotion,url,sku from products;

select product_id as pid, promotion as pr, url ,  sku as s from products;

-- fetch data name and price
select name , price from products order by price asc ;
select name , price from products order by price desc ;

select name , price from products order by price asc limit 5 ;
select name , price from products order by price desc limit 5 ;

-- show 5  record but after 3rd record (offset) used.
select * from products limit 5  offset 3;

-- what is price after 10 % discount
select name,price , price * .90 as discounted_price from products;

-- attached 2 column data into 1 by concat function
select brand,name , concat(name,'-',brand) as combined_name from products;

-- more operations

select * from products;

select * from products where promotion = 'yes';

-- all promotional and seasonal yes
select * from products where promotion = 'yes' and seasonal = "yes";

-- between 
select * from products where price between 50 and 100;

-- Group by , Count operation
select product_category , count(*) as total_product from products group by product_category;

-- average price
select product_category , count(*) as total_product,avg(price) as avg_p from products group by product_category;

select product_position from products;

select product_position , count(*) as total_product,avg(price) as avg_p from products group by product_position;

-- min sales and max sales
select product_position , count(*) as total_product,avg(price) as avg_p,
min(sales_volume) as min_sales,max(sales_volume) as max_sales
from products group by product_position;

-- sum operation 
select product_position , count(*) as total_product,avg(price) as avg_p,
min(sales_volume) as min_sales,max(sales_volume) as max_sales,sum(sales_volume)as total_sales
from products group by product_position;


-- how many promotion yes or no
select promotion,count(*) as count_promotion_product from products group by promotion;

-- checking brands
select brand from products;

-- checking section
select section from products;

select section, count(*) as product_buy from products group by section;

select section from products group by section;

-- what is sales volume for man and sales volume for women
select section,sum(sales_volume) as total_sales from products group by section having total_sales > 100000;


select section,count(*) as section_count from products where seasonal = 'yes' group by section;


-- where apply on whole data without groups
-- on grouping data , then you can use having clause
-- Q. Difference between where and having clause.