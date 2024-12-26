USE leetcode;

DROP TABLE IF EXISTS tree;

Create table If Not Exists Tree (id int, p_id int);
Truncate table Tree;
insert into Tree (id, p_id) values ('1', NULL);
insert into Tree (id, p_id) values ('2', '1');
insert into Tree (id, p_id) values ('3', '1');
insert into Tree (id, p_id) values ('4', '2');
insert into Tree (id, p_id) values ('5', '2');

SELECT id,
	   CASE WHEN p_id IS NULL THEN 'Root'
	   	  	WHEN id IN (SELECT DISTINCT p_id FROM tree) THEN 'Inner'
	   	  	ELSE 'Leaf'
	   	  	END AS TYPE
FROM tree;


