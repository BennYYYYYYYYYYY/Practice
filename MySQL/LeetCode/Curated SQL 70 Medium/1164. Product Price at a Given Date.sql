USE leetcode;

DROP TABLE IF EXISTS Products;

Create table If Not Exists Products (product_id int, new_price int, change_date date);
Truncate table Products;
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14');
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15');
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16');
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17');
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18');


WITH a AS (
	# 價格更動在 8/16 前的資料
	SELECT product_id,
		   max(change_date) AS max_change_date
	FROM Products
	WHERE change_date <= '2019-08-16'
	GROUP BY product_id
) 
SELECT a.product_id,
	   Products.new_price AS price
FROM a   
JOIN Products
ON a.product_id = Products.product_id AND 
	a.max_change_date = Products.change_date
UNION # 合併多個查詢結果並移除重複行
# 價格更動在 8/16 之後的資料
SELECT product_id,
	   CASE WHEN change_date > '2019-08-16' THEN 10
	   ELSE new_price 
	   END AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM a);









