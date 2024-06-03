-- DCl = data control language
-- how to create user


create user gajendra identified by 'gaj';
-- how many user are there
select * from mysql.user;


-- current user checking

select current_user();

-- to check permission user have

show grants for 'gajendra';

-- when we want to give a IP address to user where he will work

-- (create user 'sammy' @ '192.16.10.%' identified by 'password';)


-- to give permission
grant all privileges on sakila.* to gajendra;
show grants for 'gajendra';

-- change password

alter user 'gajendra' identified by 'gajen';

-- locking user 

alter user 'gajendra' account lock;

-- unlock user

alter user 'gajendra' account unlock;



-- GROUPS = COLLECTION OF USERS
create role sales;
-- can grant single command
grant select on sakila.* to sales;





-- add user in group 
create user 'aman' identified by 'aman';
show grants for 'aman';
grant sales to aman;
show grants for 'aman';


-- assiging role to use
set default role all to aman;


use sakila;

create table if not exists emp_1(id int, name varchar(20));
drop table emp_1;
grant select(id) on sakila.emp_1 to 'aman';

grant update(name) on sakila.emp_1 to 'aman';

insert into emp_1 values (10,"abc");
insert into emp_1 values (11,"cba");
insert into emp_1 values (10,"abac");

REVOKE SELECT ON sakila.* FROM sales;

