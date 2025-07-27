use emp;
select * from employees;
insert into employees(emp_name,salary,doj,dept)
values(name,sal,join_date,department);

-- procedure
delimiter $$
create procedure add_employee2(
in emp_id int,
in name varchar (100),
in sal decimal(10,2),
in join_date date,
in department varchar(50)
)
begin
	insert into employees(emp_id,emp_name,salary,doj,dept)
values(emp_id,name,sal,join_date,department);
end $$ 
delimiter ;


select * from employees;


call add_employee2(34,'Sudhanshu kumar',34345,'2025-06-11','Fin');

-- revise the salary by emp id
delimiter $$
create procedure update_salary(
in id int,
in new_salary decimal(10,2)
)
Begin 
	update employees set salary = new_salary where emp_id = id ;
end $$
Delimiter ;

call update_salary(2,100000);

-- pass dept and get details

delimiter $$
create procedure get_by_dept(in department varchar(50))
begin
	select * from employees where dept = department;
end $$
delimiter ;

call get_by_dept('fin');

delimiter $$
create procedure get_employee_count(out total int)
begin
	select count(*) into total from employees;
end $$
delimiter ;

call get_employee_count(@count);
select @count;


delimiter $$
create procedure delete_employee(in id int)
begin
	delete from employees where emp_id = id;
end $$
delimiter ;

call delete_employee(2);

select * from employees;


delimiter $$
create procedure increase_salary(in percentage decimal(5,2))
begin
	update employees
    set salary = salary + (salary * (percentage/100));
end $$
delimiter ;

set sql_safe_updates = 0;
call increase_salary(10);

select * from employees;

delimiter $$
create procedure salary_band(in in_emp_id int,out band varchar(20))
begin
	declare sal decimal(10,2);
    select salary into sal from employees where emp_id = in_emp_id;
    
    if sal >= 70000 then
		set band = 'high';
	elseif sal >= 50000 then
		set band = 'medium';
	else
		set band = 'low';
	end if;
end $$
delimiter ;


call salary_band(1,@result);
select @result;