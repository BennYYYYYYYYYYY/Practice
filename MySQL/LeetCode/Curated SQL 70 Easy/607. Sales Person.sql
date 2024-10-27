USE leetcode;
DROP TABLE IF EXISTS SalesPerson;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Orders;
Create table If Not Exists SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date char(10));
Create table If Not Exists Company (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists Orders (order_id int, order_date char(10), com_id int, sales_id int, amount int);
Truncate table SalesPerson;
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', '4/1/2006');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', '5/1/2010');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', '12/25/2008');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', '1/1/2005');
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', '2/3/2007');
Truncate table Company;
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');
Truncate table Orders;
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', '1/1/2014', '3', '4', '10000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', '2/1/2014', '4', '5', '5000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', '3/1/2014', '1', '1', '50000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', '4/1/2014', '1', '4', '25000');


-- 有與RED公司有訂單往來的業務員
SELECT salesperson.name
FROM orders 
JOIN salesperson  
ON orders.sales_id = salesperson.sales_id -- 連結不同資料表 
JOIN company 
ON orders.com_id = company.com_id -- 連結不同資料表 
WHERE company.name = 'RED';


-- 全部的業務員
SELECT name
FROM salesperson;


-- 全部業務員 - 有和RED往來的業務員 = 沒有和RED有往來的業務員
SELECT name
FROM salesperson
EXCEPT -- 差集
SELECT salesperson.name
FROM orders 
JOIN salesperson  
ON orders.sales_id = salesperson.sales_id 
JOIN company 
ON orders.com_id = company.com_id 
WHERE company.name = 'RED';






















