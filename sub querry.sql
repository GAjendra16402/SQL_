show databases;
use sakila;
show tables;
select * from actor;
select * from payment;
select * from payment
where amount = (select amount from payment where rental_id = 573);

-- here the bracket is the first one that will execute


-- Q -- i need to get those user whoes staff id is equall to the staff id of payemnt_id = 10

select * from payment
where staff_id = (select staff_id from payment where payment_id = 10);

-- Q -- i need to get the payment id the staff id amount payment date where the year of payemnt date month is equall to payment_id = 5's month
-- single row sub querry
select payment_id, staff_id, amount, payment_date
from payment
where month(payment_date) = (select month(payment_date) from payment where payment_id = 5);

-- amount where payment_id = 2 or payment_id = 3
-- multi row sub querry
select amount
from payment
where amount = (select amount from payment where payment_id = 2) or (select amount from payment where payment_id = 3); 

-- in = aanadar valii sarri chizoo se match krega
-- '>any = greater than the minmum value of sub querry'
-- '<any = less than the maximum value of sub querry'
-- 'all = (=all is not available)'
-- '>all= less than the minimum value of sub querry'
-- '<all = greater than the maximum value of sub querry'
