USE leetcode;

DROP TABLE IF EXISTS Activities;

Create table If Not Exists Activities (sell_date date, product varchar(20));
Truncate table Activities;
insert into Activities (sell_date, product) values ('2020-05-30', 'Headphone');
insert into Activities (sell_date, product) values ('2020-06-01', 'Pencil');
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities (sell_date, product) values ('2020-05-30', 'Basketball');
insert into Activities (sell_date, product) values ('2020-06-01', 'Bible');
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities (sell_date, product) values ('2020-05-30', 'T-Shirt');


WITH abc AS (
	SELECT sell_date,
		   group_concat(DISTINCT product) AS products # group_concat(): 把同組的值全放進來，並用逗號隔開
	FROM Activities
	group BY sell_date
	ORDER BY sell_date
), def AS (
	SELECT sell_date,
		   count(DISTINCT product) AS num_sold
	FROM Activities
	group BY sell_date
	ORDER BY sell_date
)
SELECT abc.sell_date,
	   def.num_sold,
	   abc.products
FROM abc
JOIN def
ON abc.sell_date = def.sell_date;




