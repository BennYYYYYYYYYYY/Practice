USE leetcode;

DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS UnitsSold;

Create table If Not Exists Prices (product_id int, start_date date, end_date date, price int);
Create table If Not Exists UnitsSold (product_id int, purchase_date date, units int);
Truncate table Prices;
insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5');
insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-03-01', '2019-03-22', '20');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-01', '2019-02-20', '15');
insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-21', '2019-03-31', '30');
insert into Prices (product_id, start_date, end_date, price) values ('3', '2019-02-21', '2019-03-31', '30');
Truncate table UnitsSold;
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-02-25', '100');
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-03-01', '15');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-02-10', '200');
insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-03-22', '30');

WITH revenue_units AS (
	SELECT prices.product_id,
		   prices.price * unitssold.units AS revenue,
		   unitssold.units
	FROM unitssold 
	RIGHT JOIN prices # 保留所有 price 資料表的資料
	ON unitssold.product_id = prices.product_id
	WHERE (unitssold.purchase_date BETWEEN prices.start_date AND prices.end_date) OR 
		   unitssold.units IS NULL # 為了符合 leetcode 內容，所以必須把 product_id = 3 的資料拉進來
)
SELECT product_id,
	   ifnull(round(sum(revenue) / sum(units), 2), 0) AS average_price # IFNULL( ,0) 如果是NILL就用0取代
FROM revenue_units
GROUP BY product_id;
