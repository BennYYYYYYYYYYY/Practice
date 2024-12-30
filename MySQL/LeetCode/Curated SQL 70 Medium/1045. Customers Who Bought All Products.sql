USE leetcode;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

Create table If Not Exists Customer (customer_id int, product_key int);
Create table Product (product_key int);
Truncate table Customer;
insert into Customer (customer_id, product_key) values ('1', '5');
insert into Customer (customer_id, product_key) values ('2', '6');
insert into Customer (customer_id, product_key) values ('3', '5');
insert into Customer (customer_id, product_key) values ('3', '6');
insert into Customer (customer_id, product_key) values ('1', '6');
Truncate table Product;
insert into Product (product_key) values ('5');
insert into Product (product_key) values ('6');

WITH a AS (
	SELECT customer_id,
		   group_concat(DISTINCT product_key ORDER BY product_key) AS group_concat_product_key
	FROM Customer
	GROUP BY customer_id
)
SELECT customer_id
FROM a 
WHERE group_concat_product_key = ( SELECT group_concat(product_key ORDER BY product_key) FROM Product);











