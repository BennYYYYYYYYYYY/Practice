USE leetcode;

DROP TABLE IF EXISTS Transactions;

Create table If Not Exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07');

WITH a AS (
	# total 
	SELECT date_format(trans_date, '%Y-%m') AS month, # 格式化為 YYYY-MM 的格式
		   country,
		   count(*) AS trans_count, # 有了 GROUP BY，COUNT(*) 是對每個分組的行數計算。
		   sum(amount) AS trans_total_amount
	FROM transactions
	GROUP BY month,
			 country
), b AS (
	# approved
	SELECT date_format(trans_date, '%Y-%m') AS month,
		   country,
		   count(*) AS approved_count,
		   sum(amount) AS approved_total_amount
	FROM transactions
	WHERE state = 'approved'
	GROUP BY month,
			 country
)
SELECT a.month,
	   a.country,
	   a.trans_count,
	   ifnull(b.approved_count, 0) AS approved_count,
	   a.trans_total_amount,
	   ifnull(b.approved_total_amount, 0) AS approved_total_amount
FROM a  
LEFT JOIN b 
ON a.month = b.month and 
   a.country = b.country;
  
  
  
  










