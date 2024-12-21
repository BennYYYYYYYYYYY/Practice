USE leetcode;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Examinations;

Create table If Not Exists Students (student_id int, student_name varchar(20));
Create table If Not Exists Subjects (subject_name varchar(20));
Create table If Not Exists Examinations (student_id int, subject_name varchar(20));
Truncate table Students;
insert into Students (student_id, student_name) values ('1', 'Alice');
insert into Students (student_id, student_name) values ('2', 'Bob');
insert into Students (student_id, student_name) values ('13', 'John');
insert into Students (student_id, student_name) values ('6', 'Alex');
Truncate table Subjects;
insert into Subjects (subject_name) values ('Math');
insert into Subjects (subject_name) values ('Physics');
insert into Subjects (subject_name) values ('Programming');
Truncate table Examinations;
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Programming');
insert into Examinations (student_id, subject_name) values ('2', 'Programming');
insert into Examinations (student_id, subject_name) values ('1', 'Physics');
insert into Examinations (student_id, subject_name) values ('1', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Math');
insert into Examinations (student_id, subject_name) values ('13', 'Programming');
insert into Examinations (student_id, subject_name) values ('13', 'Physics');
insert into Examinations (student_id, subject_name) values ('2', 'Math');
insert into Examinations (student_id, subject_name) values ('1', 'Math');


WITH students_cross_join_subjects AS (
	SELECT *
	FROM students 
	CROSS JOIN subjects # 將兩表的每一筆資料做相互結合
	ORDER BY student_id, # 先 ORDER BY 
	         subject_name # 在基於剛剛的結果 ORDER BY 
), before_aggregation AS ( # 再做一個 CTE
SELECT students_cross_join_subjects.student_id,
		   students_cross_join_subjects.student_name,
		   students_cross_join_subjects.subject_name,
		   CASE WHEN examinations.subject_name IS NULL THEN 0 # 有參加考試 = 1, 沒參加 = 0
		   		ELSE 1
		   	END AS attended_exams
	FROM students_cross_join_subjects
	LEFT JOIN examinations # 保留所有學生的資料
	ON students_cross_join_subjects.student_id = examinations.student_id AND 
	   students_cross_join_subjects.subject_name = examinations.subject_name # 排除掉學生沒參加的科目
)
SELECT student_id,
	   student_name,
	   subject_name,
	   sum(attended_exams) AS attended_exams
FROM before_aggregation # 第二個CTE
GROUP BY student_id,
	     student_name,
	     subject_name
ORDER BY student_id,
		 subject_name;












