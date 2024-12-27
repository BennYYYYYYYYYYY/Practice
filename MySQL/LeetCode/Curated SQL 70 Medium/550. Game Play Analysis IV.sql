USE leetcode;

DROP TABLE IF EXISTS activity;

Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');


WITH a AS (
	SELECT DISTINCT player_id,
		   # PARTITION BY 的作用是把一張表的數據分組，類似於 GROUP BY，但不會壓縮數據。這些分組資料仍然保持獨立的行數。
		   # OVER 子句 定義了窗口函數的工作範圍。
		   FIRST_VALUE(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS first_login_date,
		   NTH_VALUE(event_date, 2) OVER (PARTITION BY player_id) AS second_login_date
	FROM activity
), b AS (
	SELECT player_id,
		   CASE WHEN datediff(second_login_date, first_login_date) = 1 THEN 1 # DATEDIFF(end_date, start_date)
		   ELSE 0 END AS is_login_consecutively
	FROM a
)
SELECT round(sum(is_login_consecutively) / count(*), 2) AS fraction
FROM b;

