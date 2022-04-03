/*
our First 5 Minute of SQLCODE

--Resources:

    --SQLTry-It Editor https://www.w3schools.com/sql/trysql.asp?filename=trysql_op_or

--Step 1.
*/

SELECT * FROM customers;

--Step 2.

SELECT * FROM orders;

--Step 3.

SELECT * 
FROM products
ORDER BY Price DESC;

--Step 4. (query across tables)

SELECT 
 customerName,
 COUNT(*) AS number_of_orders
FROM customers
INNER JOIN orders
 ON orders.customerID = customers.customerID
GROUP BY customers.customerID;

/* 

Note: Step 4 will give you errors if you're 
using firefox or any other browser other than Chrome, Safari, or Opera. 
This is because the SQL Try-It Editor is using WebSQL. See here for 
further discussion of errors that could occur when using firefox.

########## What is a database?

1) Collection of data
2) A method for accessing & manipulating that data

Or we can say database is a structured set of computerized data with an accessible interface

########## What is DMS (Database Management System)?

Programe that provide method for accessing & manipulating that data 
in the database (MYSQL, PostgreSQL, Oracle Database)

########## What is SQL (Structured Query Language)?
SQL is a query language used by many of DMS

########## What is MYSQL?
MYSQL is a widely used DMS system
Oncs learn SQL its esay to switch between DMS
Difference between DMS is not the SQL query language itself 
the featurs they offer


 */

-- Installation and setup mysql in ubuntu

sudo apt-get install mysql-server
sudo mysql_secure_ installation
sudo mysql -u root
--give sudo password


mysql> USE mysql;
mysql> CREATE USER 'tharindu'@'localhost' IDENTIFIED BY 'my_password';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'tharindu'@'localhost';
mysql> UPDATE user SET plugin='auth_socket' WHERE User='tharindu';
mysql> FLUSH PRIVILEGES;
mysql> SELECT User, Host, plugin FROM mysql.user;
+------------------+-----------+-----------------------+
| User             | Host      | plugin                |
+------------------+-----------+-----------------------+
| debian-sys-maint | localhost | caching_sha2_password |
| mysql.infoschema | localhost | caching_sha2_password |
| mysql.session    | localhost | caching_sha2_password |
| mysql.sys        | localhost | caching_sha2_password |
| root             | localhost | auth_socket           |
| tharindu         | localhost | auth_socket           |
+------------------+-----------+-----------------------+
6 rows in set (0.00 sec)
mysql> exit;


sudo service mysql restart
mysql -u tharindu


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed


/*
within databsase server their can be multiple databases
within single database their will be multiple tables
*/

-- Create database

CREATE DATABASE test_db;
-- We dont have to use captical CREATE DATABASE 
-- its work with create database too
create database test_db;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> create database test_db;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test_db            |
+--------------------+
5 rows in set (0.00 sec)

mysql>

-- remove database
drop database test_db;

mysql> drop database test_db;
Query OK, 0 rows affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql>

-- to excute a sql command we need to have ; at the end.
-- if we dont have it it will go to new line as follows.

mysql>
mysql> show databases
    ->
    ->
    ->
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql>

-- use database
use mysql;
-- check using database
select database();

mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select database();
+------------+
| database() |
+------------+
| mysql      |
+------------+
1 row in set (0.00 sec)

mysql>

-- of we dont use any database output for above command will be null
mysql> select database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql>


-- Data Types
INT -- whole number (-12,0,123)
VARCHAR  -- Varible length string (1-255)
CHAR -- Fix length string

-- When using VARCHAR we need to specifiy max length
-- VARCHAR(100)
-- In above case string can consisit of 1-100 characters
-- Here if we try to store string with more than 100 characters 1st 100 characters will be stored


-- Creating tables

CREATE TABLE tablename
  (
column_name data_type,
column_name data_type
  );



CREATE TABLE cats
  (
name VARCHAR(100),
age INT
  );

-- Show tables

mysql>
mysql> show tables;
+----------------+
| Tables_in_cats |
+----------------+
| cats           |
+----------------+
1 row in set (0.01 sec)

mysql>

-- Show columns

mysql> show columns from cats;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| name  | varchar(100) | YES  |     | NULL    |       |
| age   | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc cats;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| name  | varchar(100) | YES  |     | NULL    |       |
| age   | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql>

-- drop a table

mysql> drop table cats;
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
Empty set (0.00 sec)

mysql>
mysql>
mysql> desc cats;
ERROR 1146 (42S02): Table cats.cats doesnt exist
mysql>


-- Inserting Data

--The "formula":

INSERT INTO table_name(column_name) VALUES (data);

--For example:

INSERT INTO cats(name, age) VALUES ('Jetson', 7);
INSERT INTO cats(name, age) VALUES ('Mat', 1);
INSERT INTO cats(name, age) VALUES ('Katy', 11);
INSERT INTO cats(name, age) VALUES ('Jhon', 3);

-- here order matters if we shuffle colunms they values will go to wroung colunm

-- View Data

mysql> SELECT * FROM cats;
+--------+------+
| name   | age  |
+--------+------+
| Jetson |    7 |
| Mat    |    1 |
| Katy   |   11 |
| Jhon   |    3 |
+--------+------+
4 rows in set (0.00 sec)

mysql>

-- multiple insert

INSERT INTO cats(name, age)
VALUES ('Marko', 5), 
            ('Kuku', 2), 
            ('Tutu', 4);

mysql>
mysql> select * from cats;
+--------+------+
| name   | age  |
+--------+------+
| Jetson |    7 |
| Mat    |    1 |
| Katy   |   11 |
| Jhon   |    3 |
| Marko  |    5 |
| Kuku   |    2 |
| Tutu   |    4 |
+--------+------+
7 rows in set (0.00 sec)

mysql>

-- ########################################################################################################################
-- ########################################################################################################################
-- insert data to table from csv file

-- create table
CREATE TABLE nodes(
device_name VARCHAR(255),
ip VARCHAR(255),
device_type VARCHAR(255),
collection_time VARCHAR(255),
site_id VARCHAR(255),
serial_number VARCHAR(255))
;

-- copy csv file to /var/lib/mysql-files/
-- mysql only has access to this folder to read files

-- insert data from csv
LOAD DATA INFILE '/var/lib/mysql-files/epnm-inventory.csv'
INTO TABLE nodes
FIELDS TERMINATED BY ','

--Query data and filter rows with a condition
SELECT c1, c2 FROM t
WHERE condition;

-- string function INSTR
SELECT *
FROM   nodes
WHERE  Instr(device_type, '901')
       AND Instr(device_name, 'CMBS')
       AND Instr(device_name, 'VLL') > 0
LIMIT  30;  

-- alais as <alais_name>
-- asending and desending order from alais
-- group by with aggregate function (count, average, sum)
-- in local database group by not working without aggregate function -- need to t-shoot

SELECT Count(device_name) AS test,
       device_type
FROM   nodes
GROUP  BY device_type
ORDER  BY test DESC;  

-- limit and offset

SELECT *
FROM   nodes
ORDER  BY device_name ASC
LIMIT  20 offset 16;  

-- create new database
mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| cats                 |
| dialog_network_nodes |
| information_schema   |
| mysql                |
| performance_schema   |
| sys                  |
+----------------------+
6 rows in set (0.00 sec)

mysql>

-- like and wildcards

SELECT *
FROM   nodes
WHERE  device_name LIKE '%CMBS%'
LIMIT  5;

SELECT *
FROM   nodes
WHERE  serial_number LIKE '%FOC%'
       AND device_type LIKE '%540%'
       AND device_name LIKE '%VLL%';  

-- string functions ## concat

SELECT Concat(device_name, '                   ', ip) AS new
FROM   nodes
LIMIT  5;  

-- string functions ## concat_ws (concat with separator)

SELECT Concat_ws('___________', device_name, ip) AS new
FROM   nodes
LIMIT  5;  

-- string functions ## substring

SELECT Substring(device_name, -5)
FROM   nodes
LIMIT  5;  

-- string functions ## char_lenght

SELECT *,
       Char_length(device_name) AS hostname_length
FROM   nodes
WHERE  Char_length(device_name) > 40;  

-- string functions ## upper
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- getting distinct values in a column

SELECT DISTINCT( device_type )
FROM   nodes;  

-- count distinct authors

SELECT Count(DISTINCT author_lname)
FROM   books;  

-- count the number of book title's that contain word 'the'

SELECT Count(title) AS the_title_count
FROM   books
WHERE  title LIKE '%the%';  

-- group by first and last names and count books for each individual author
-- group by with count and sum

SELECT author_fname,
       author_lname,
       Count(*)   AS book_count,
       Sum(pages) AS page_count
FROM   books
GROUP  BY author_fname,
          author_lname; 


-- sub queries

SELECT *
FROM   books
WHERE  pages = (SELECT Max(pages)
                FROM   books); 

-- without sub query
SELECT title,
       pages
FROM   books
ORDER  BY pages DESC
LIMIT  1;  


-- Min and group by
SELECT author_fname,
       author_lname,
       min(pages) AS min_page_count
FROM   books
GROUP  BY author_fname,
          author_lname; 

-- greater than lesser than
SELECT title, released_year FROM books
    WHERE released_year >= 2000 ORDER BY released_year;


SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

-- AND operator
SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';

-- OR  operator
SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;


-- BETWEEN operator
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

-- order by with colunm numbers
SELECT title, author_fname, author_lname 
FROM books ORDER BY 2;

-- ###################################################
-- Case Statements
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;

-- here based on stock_quantity value we are creating new colunm called STOCK
-- always start the statement with CASE 
-- always end the statement with END
-- WHEN to define condition
-- THEN to define action

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

-- #######################################################
-- Relational database concepts
-- #######################################################


-- Primary key -  Table column (or combination of columns) designated to uniquely identify each table record
-- Foreign key -  Column or group of columns in a relational database table that provides a link between data in two tables

-- When we define our schema with primary key. RDMS (MySQL) will not allow us to create dupliate entery for for primary key colunm
-- Also when we define our schema with foreign key RDMS will not allow us to create table entery that contain foreign key colunm value doesn't including in other table
-- as an example we cant create a order entery in the order table for customer id does not exisit in customer table

/*
#######################################################
different types of relational database tables.
#######################################################

One to One relationship - single row of the first table can only be related to one and only one records of a second table
One to many or many to one relationship - Any single rows of the first table can be related to one or more rows of the second tables
Many to many relationships - Each record of the first table can relate to any records (or no records) in the second table
*/


-- Creating the customers and orders tables (define schema)

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

-- Inserting some customers and orders

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


-- This INSERT fails because of our fk constraint. No user with id: 98

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);

-- write query that effect multiple tables with sub query
select * from orders where customer_id = (select id from customers where first_name = 'Boy');


-- #################################################
-- SQL JOIN operations

-- useless cross join (will create raws by combining both tables with all the possible combinations)
select * from customers, orders;
-- we can get meaningful inner join by adding where condition to above cross join 
-- but we need to prepend table name with the colunm name in the where condition
select * from customers, orders where customers.id=orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;

