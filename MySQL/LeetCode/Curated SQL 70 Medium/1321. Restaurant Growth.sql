USE leetcode;

DROP TABLE IF EXISTS Customer;

Create table If Not Exists Customer (customer_id int, name varchar(20), visited_on date, amount int);
Truncate table Customer;
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-01', '100');
insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', '2019-01-02', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-03', '120');
insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', '2019-01-04', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', '2019-01-05', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', '2019-01-06', '140');
insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', '2019-01-07', '150');
insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', '2019-01-08', '80');
insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', '2019-01-09', '110');
insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-10', '130');
insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-10', '150');


WITH a AS (
	SELECT visited_on,
		   sum(amount) AS amount
	FROM Customer
	GROUP BY visited_on
	ORDER BY visited_on
), b AS (
	SELECT visited_on,
		   # RANGE: 在窗口函數中，根據排序列的值範圍來定義窗口大小。
		   # INTERVAL: 用於日期和時間操作時，指定一段時間的間隔（如天、月、年）
		   # INTERVAL 支持多種時間單位（如 DAY、MONTH、YEAR 等），而直接加減數字時，SQL 不知道單位。
		   sum(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING) AS amount,
		   sum(amount) OVER (ORDER BY visited_on RANGE INTERVAL 6 DAY PRECEDING) / 7 AS average_amount
	FROM a
)
SELECT visited_on,
	   amount,
	   round(average_amount, 2) AS average_amount
FROM b  
# 選取的 visited_on 要大於 【最早訪問日期（MIN(visited_on)），並在此日期基礎上加上 6 天】，所以必定會有7天平均可以算。 
WHERE visited_on >= (SELECT date_add(min(visited_on), INTERVAL 6 day) FROM b);












