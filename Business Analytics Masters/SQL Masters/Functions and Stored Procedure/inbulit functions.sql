-- Common inbuilt functions
select database(); -- gives selected db
select version();  -- mysql version
select user();
select char_length("euron");
select length('euron'); -- give o/p in byte
select reverse('euron');
select uuid(); -- generate unique id
select if(5>3,'true','false'); -- conditional stmt
select coalesce(null,null,'backup',null,'sudh'); -- return 1st not null values
select isnull('sudh');  --  check the value is null or not


-- string inbuilt functions
select concat('euron',' - ','one'); -- combines stmt
select upper('avinash');
select lower('EurinsK');
select length('Avinash');
select substring('sql master',5);
select substring('sql mastery',5,8);
select replace('learn sql by doing practicle','by','with'); -- replace
select trim('        sudh      '); -- removes spaces
select left('Avinash',4); -- extract left 4 char
select right('Avinash',3); -- extract right 3 char
select lpad('sudh',8,0); -- left add with 0 til 8 length 
select rpad('Avinash',14,1); -- right padding
select repeat('sql',4); -- repeat multiple time


-- Date inbulit functions
select now(); -- current time
select curdate(); -- current date
select curtime(); -- current time
select year(current_date()); -- current year
select month(current_date()); -- current month
select day(current_date()); -- current day
select week(current_date()); -- current week

select date_add(curdate(),interval 7 day); -- add days +
select date_sub(current_date(),interval 7 day); -- sub days from current
select datediff(curdate(),'2025-08-03'); -- date differnce
select date_format(now(),'%w,%m,%e,%y');
select date_format(now(),'%W,%M,%e,%Y');
select dayname(now());
select monthname(now());
select str_to_date('27-07-2025','%d-%m-%Y');


-- inbuilt numeric function
select round(234.98623,2); -- round up value
select floor(123.99);
select ceiling(123.69);
select mod(29,5); -- modulo
select abs(-45); -- absolute value
select pow(2,5); -- power fun
select sqrt(9);
select pi(); -- pi vlaue
select rand();





