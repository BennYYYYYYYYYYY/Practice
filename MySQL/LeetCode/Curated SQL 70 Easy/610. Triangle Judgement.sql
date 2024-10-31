USE leetcode;

DROP TABLE IF EXISTS Triangle;

Create table If Not Exists Triangle (x int, y int, z int);
Truncate table Triangle;
insert into Triangle (x, y, z) values ('13', '15', '30');
insert into Triangle (x, y, z) values ('10', '20', '15');


# Common Table Expression
WITH triangle_conditions AS ( -- Define CTE name 
	# Define CTE Query
	SELECT *,
		   x + y > z AS condition_1,  -- return boolean
		   x + z > y AS condition_2,
		   y + z > x AS condition_3
	FROM triangle
)
# Use CTE
SELECT x,
	   y,
	   z,
	   CASE WHEN condition_1 AND condition_2 AND condition_3 THEN "Yes"
	   	ELSE "No" END AS triangle
FROM triangle_conditions;

