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

--Step 4.

SELECT 
 customerName,
 COUNT(*) AS 'number of orders'
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
select * from nodes WHERE INSTR(device_type , '901') AND INSTR(device_name , 'CMBS') AND INSTR(device_name , 'VLL')> 0 limit 30;

-- alais as <alais_name>
-- asending and desending order from alais
-- group by with aggregate function (count, average, sum)
-- in local database group by not working without aggregate function -- need to t-shoot
SELECT count(device_name) as test,device_type FROM nodes GROUP BY device_type order by test desc;

-- limit and offset
select * from nodes order by device_name asc limit 20 offset 16;

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
