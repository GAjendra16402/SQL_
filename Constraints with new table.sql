-- constraints: rules (to avoid ivalid data in our table)
-- primary key
-- foreign key
-- not null
-- unique
-- default
-- index

-- ddl statement


use sakila;
create table raj(id int, name varchar(20));
insert into raj values(10, 'aman');

select * from raj2;
insert into raj(id) values(10);
-- default, not null
create table raj2(id int default 100, name varchar(20) not null);
insert into raj2 values(0,'aman');
drop table raj2;
-- unique: can hold multiple null values
create table raj3(id int unique, name varchar(20));
insert into raj3 values(0,'aman');
insert into raj3 values(0,'aman');


-- check
create table raj4(id int check(id between 2 and 5));


-- Q, house id , selling price and purchase price, email

drop table house;
create table house1(house_id int, selling_price int, purchase_price int, email varchar(30) unique,constraint ho_table_sp_check check(selling_price > purchase_price));
insert into house1 values(0,1,2,'abc');


-- primary key
-- constraint : unique indetifier each and every record
-- unique & not null



use sakila;
create table library(book_id int primary key, auther varchar(40) not null, book_name varchar(50) not null, publish_year date);
drop table library;
select * from library;

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (101, 'J.R.R. Tolkien', 'The Lord of the Rings', '1954-12-15');

INSERT INTO library (book_id, auther, book_name)
VALUES (102, 'George R.R. Martin', 'A Song of Ice and Fire');  -- Year can be NULL

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (103, 'Agatha Christie', 'Murder on the Orient Express', '1934-01-01');

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (104, 'Harper Lee', 'To Kill a Mockingbird', '1960-07-11');

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (105, 'F. Scott Fitzgerald', 'The Great Gatsby', '1925-04-10');

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (106, 'Gabriel García Márquez', 'One Hundred Years of Solitude', '1967-05-30');

INSERT INTO library (book_id, auther, book_name)
VALUES (107, 'Margaret Atwood', 'The Handmaid\'s Tale');  -- Escape the single quote in 'Handmaid's'

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (108, 'Chimamanda Ngozi Adichie', 'Americanah', '2013-03-14');

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (109, 'Salman Rushdie', 'Midnight\'s Children', '1981-09-19');  -- Escape the single quote in 'Midnight's'

INSERT INTO library (book_id, auther, book_name, publish_year)
VALUES (110, 'Viktor Frankl', 'Man\'s Search for Meaning', '1946-01-01');  -- Escape the single quote in 'Man's'




CREATE TABLE library_record (
  refer_id INT PRIMARY KEY,
  FOREIGN KEY (refer_id) REFERENCES library(book_id),  -- Corrected reference
  issuer_name VARCHAR(50) NOT NULL,
  recipient_name VARCHAR(50) NOT NULL,
  issue_date DATE
);

drop table library_record;

select * from library_record;


-- Sample data for library_record table
INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (101, 'Jane Smith (Librarian)', 'John Doe', '2024-05-31');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (102, 'Michael Brown (Librarian)', 'Emma Watson', '2024-05-28');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (103, 'David Lee (Librarian)', 'Charles Jones', '2024-05-20');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (104, 'Sarah Miller (Librarian)', 'Olivia Rodriguez', '2024-05-17');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (105, 'Emily Garcia (Librarian)', 'William Smith', '2024-05-10');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (106, 'Daniel Johnson (Librarian)', 'Isabella Garcia', '2024-05-03');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (107, 'Ashley Hernandez (Librarian)', 'Christopher Lee', '2024-04-25');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (108, 'Robert Moore (Librarian)', 'Mia Hernandez', '2024-04-18');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (109, 'Lisa Sanchez (Librarian)', 'Benjamin Brown', '2024-04-11');

INSERT INTO library_record (refer_id, issuer_name, recipient_name, issue_date)
VALUES (110, 'Kevin Thomas (Librarian)', 'Sophia Miller', '2024-04-04');



select issue_date, library.book_id
from library_record join library on(book_id = refer_id)
where library.auther like 'Harper Lee';


