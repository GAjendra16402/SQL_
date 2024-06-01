-- transaction control statement
-- TCL

-- transaction = set of logical statement / or a unit of work
-- data mai consistency lane ke liye transaction use lete hai


-- DML operations always start the transaction
-- DDL, DCL, TCL operations always end the transaction

select @@autocommit;
set autocommit=0;
-- we do this to understand the transaction work

create database PO;
use PO;
create table if not exists emp_1(id int, name varchar(20));

insert into emp_1 values (10,"abc");
insert into emp_1 values (11,"cba");
insert into emp_1 values (10,"abac");
select * from emp_1;

commit; -- it is a TCL statement

rollback; -- it is also TCL statement and it undo the command that we run recently

update emp_1 
set name = 'abb'
where name = 'abc';

create table if not exists emp_2(eid int, ename varchar(20));
rollback;
drop table employee_99;
insert into emp_1 values (12,"xyz");
savepoint emp_sv1;
rollback to savepoint emp_sv1;
update employee_99 set eid = 11
where phn = '787977';
select * from emp_1;


-- ALTER command (DDL statement)

use PO;
create table if not exists employee_99(eid int);
insert into employee_99 values(1,"787977",'dsww');
select * from emp_2;

alter table employee_99
add column ename varchar(20) not null default 'ramu';

desc employee_99;

-- rename table

rename table emp_2 to employee_00;

select * from employee_00;

-- alter command -- most versatile
alter table employee_00 rename to employee_99;
select * from employee_99;

alter table employee_99 
rename column phone to phn;

alter table employee_99
add constraint comp_uk unique(ename);

alter table employee_99
drop constraint comp_uk;


update employee_99 set ename =0;
alter table employee_99 modify ename int;

-- change command

alter table employee_99
change ename name char(20);