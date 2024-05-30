-- data types
-- ddl statements
create database regex1;
create table employee(eid int);
-- dml statements
insert into employee(eid) values (214774836);
select * from employee;

-- to store the positive number in data type we use "unsighned"
-- smallint, tinyint, mediumint, int, bigint
-- whenever we store the boolean values in table it uses always tinyint

-- string data types

create table emp(name1 char(4));
insert into emp values ("   X");
select name1, length(name1) from emp;

create table emp1(name1 varchar(4));
insert into emp1 values ("Z      ");
select name1, length(name1) from emp1;


-- varchar retains the trailing space up to the specified column range and remove the extra space that are given in last
-- char retains the trailing space up to the given character length only and remove the extra space that are given in the last


-- date data type

create table test(DOB date);

select now();
select current_date();
select current_time();
select current_timestamp();

-- M(month) , m(minute), YY-MM-DD hh:mm:sec

insert into test values('2024-12-23');
select * from test;

-- difference between timestamp and date time is timestamp is 
-- that timestamp is fix range that is upto 2038 only

