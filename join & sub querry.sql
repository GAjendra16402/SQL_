use sakila;
drop table company_employee;
create table company_employee(eid int,name varchar(20), manager_id int, salary int);
insert into company_employee values(10,"tushar",null,10000),
(11,"aman",13,500),(12,"aditya",10,1000), (13,"sakshi",12,5000);
select * from company_employee;

--- self join
select emp.eid, emp.name,emp.salary, manager.eid as mid, manager.name,manager.salary
from company_employee as emp join company_employee as manager
where (emp.manager_id = manager.eid) and (emp.salary>manager.salary);

use sakila;
select * from actor;
select * from film_actor;

-- select actor.actor_id, first_name, film_actor.film_id,title
-- from actor join film_actor
-- join film
-- from actor as actor_det join film_actor as film_det;

SELECT actor.actor_id, actor.first_name, film_actor.film_id
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.film_id
INNER JOIN film f ON film_actor.film_id = actor.actor_id;


select a.actor_id, count(film_id)
from actor as a join film_actor as f
where(a.actor_id = f.actor_id)
group by actor_id order by count(film_id);

-- sub query--
select * from payment;

-- get the payment_id, renatl_id and the amount only for those user whose 
--  is greater than rental_id is 1185 and the amount is < 3

select amount,rental_id,payment_id
from payment where amount > 
(select amount from payment where rental_id = 1185 and amount >= 3);

-- get the rental_id and the amount 
-- where the month for the payment date is same for the payment_id is 10

select rental_id, amount
from payment 
where 
month(payment_date) =
				(select month(payment_date) from payment where payment_id = 10);
                
-- multi row subquerry
select * from payment
where 
amount in (select amount from payment where payment_id in (3,4));


use employees;
select * from titles;

SELECT emp_no, title
FROM titles
WHERE title NOT IN (SELECT title FROM titles WHERE title = 'manager');

SELECT emp_no
FROM titles
WHERE title <> 'manager' 
AND emp_no IN ( SELECT emp_no FROM titles WHERE title = 'manager' );

-- multiple column subquerry(co-related subquerry)
select t1.emp_no, year(t1.from_date) as chnge, t2.title as previous, t1.title as curent
from titles t1
join titles t2 on t1.emp_no = t2.emp_no and year(t1.from_date) = year(t2.to_date) and t1.title != t2.title;


select titles.emp_no, t2.title, titles.title
from titles join titles as t2 on titles.emp_no = t2.emp_no and titles.title = 'manager' and t2.title <> 'manager';

show tables;
select * from dept_emp;

select count(*) from departments
where exists( select * from dept_emp where emp_no < 100);

select count(*) from departments
where exists( select * from dept_emp where emp_no > 100);

use sakila;

select * from customer where first_name = 'jon';

select first_name, last_name from staff
where exists (select * from customer
where customer.first_name = staff.first_name);

