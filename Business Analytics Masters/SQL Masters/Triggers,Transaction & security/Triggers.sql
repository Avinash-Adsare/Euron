create database triggers;
use triggers;
-- triggers - log each and every activity

create table employees(
emp_id int primary key auto_increment,
emp_name varchar(100),
salary decimal(10,2),
doj date,
dept varchar(50)
);

create table audit_log(
id int auto_increment primary key,
action_time datetime,
action_type varchar(20),
details text
);


-- writing triggers one by one

create trigger log_after_insert 
after insert on employees
for each row
insert into audit_log(action_time,action_type,details)
values(now(),'insert',concat('new employee',new.emp_name));

-- inserion opes
select * from employees;
select * from audit_log;

insert into employees(emp_name,salary,doj,dept)
values('sudh',324563,'2025-03-04','IT');

-- deletion trigger
create trigger log_aftr_delete
after delete on employees
for each row
insert into audit_log(action_time,action_type,details)
values(now(),'delete',concat('new employee',old.emp_name));

-- make sure that before delete disable safe mode
set sql_safe_updates = 0;

delete from employees where emp_name = 'sudh';


-- manipulating trigger
create trigger cap_dept_before_insert
before insert on employees
for each row
set new.dept = upper(new.dept);

insert into employees(emp_name,salary,doj,dept)
values("Avinash",6200,'2025-04-02','finance');

select * from employees;

DELIMITER $$

create trigger prevent_salary_drop
before update on employees
for each row 
begin
	if new.salary < old.salary then
		signal sqlstate '45000'
        set message_text = 'salary reduction is not allowed!';
	end if;
end $$
DELIMITER;
update employees set salary = 5500 where emp_name = "Avinash";


-- change 

DELIMITER $$
create trigger log_dept_change
after update on employees
for each row
begin
	if olf.dept <> old.dept then
		insert into audit_log(action_time,action_type,details)
        values (now(),'update',concat('department change for',new.emp_name,':',old.dept,'->',new.dept));
	end if;
end$$
DELIMITER ;

update employees set salary = 8500 where emp_name = "Avinash";

create table employees_archive like employees;

select * from employees_archive;

-- after deletion save into new table.
create trigger archive_on_delete
after delete on employees
for each row
insert into employees_archive
values(old.emp_id,old.emp_name,old.salary,old.doj,old.dept);

delete from employees where emp_name = 'Avinash';

select * from employees_archive;
