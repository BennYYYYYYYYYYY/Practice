USE leetcode;

DROP TABLE IF EXISTS ActorDirector;

Create table If Not Exists ActorDirector (actor_id int, director_id int, timestamp int);
Truncate table ActorDirector;
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '0');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '1');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '2');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '3');
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '4');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '5');
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '6');

SELECT actor_id,
	   director_id
-- 	   count(*) AS number_of_cooperation   --對「唯一組合」的次數計算
FROM ActorDirector 
GROUP BY actor_id, director_id -- 把這兩個欄位的組合視為一組「唯一」的組合。
HAVING count(*) >= 3;

		 