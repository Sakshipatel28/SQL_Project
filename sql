--SQL Mini Project--
User Performance
--DROP TABLE user_submissions;
CREATE TABLE user_submissions (
id SERIAL PRIMARY KEY,
user_id BIGINT,
question_id INT,
points INT,
submitted_at TIMESTAMP WITH TIME ZONE,
username VARCHAR(50)
);

SELECT*FROM user_submissions;

--Q1 List all distinct users and their stats(return,user_name,total_submissions,points earned).
Solution:
--SELECT
--COUNT(DISTINCT username)
--FROM user_submissions

SELECT
username,
COUNT(id) as total_submissions,
SUM(points)as points_earned
FROM user_submissions
GROUP BY username
ORDER BY total_submissions DESC

--Q2 Calculate the daily average points for each user.
Solution:
--each day
--each user and their daily avg points
--group by day and user
SELECT*FROM user_submissions;
SELECT
--Extract(DAY FROM submitted_at)as day,
TO_CHAR(submitted_at, 'DD-MM')as day,
username,
AVG(points) as daily_avg_points
From user_submissions
Group BY 1,2
ORDER BY username;

--Find the top 3 users with the most positive submissions for each day.
Solution:
--each day
--most correct user_submissions
SELECT*FROM user_submissions;
WITH daily_submissions
AS
(
SELECT
--Extract(DAY FROM submitted_at)as day,
TO_CHAR(submitted_at, 'DD-MM')as daily,
username,
SUM(CASE
WHEN points>0 THEN 1 ELSE 0
END)as correct_submissions
From user_submissions
Group BY 1,2
),
users_rank
as
(SELECT
daily,
username,
correct_submissions,
DENSE_RANK()OVER (PARTITION BY daily ORDER BY correct_submissions DESC) as rank
FROM daily_submissions
)
SELECT
daily,
username,
correct_submissions
From users_rank
WHERE rank<=3;

--Q4 Find the top 5 users with the highest number of incorrect submissions.
Solution:
SELECT
username,
SUM(CASE
WHEN points<0 THEN 1 ELSE 0
END)as Incorrect_submissions,
SUM(CASE
WHEN points>0 THEN 1 ELSE 0
END)as correct_submissions,
SUM(points)as points_earned
From user_submissions
Group BY 1
ORDER BY Incorrect_submissions DESC
LIMIT 5

--Find the top 10 performers for each week.
Solution:
SELECT*FROM
(
	SELECT
 --WEEK()
 EXTRACT(WEEK FROM submitted_at)as week_no,
 username,
 SUM(points)as total_points_earned,
	DENSE_RANK()OVER (PARTITION BY EXTRACT(WEEK FROM submitted_at)ORDER BY SUM(points) DESC)as rank
	FROM user_submissions
Group BY 1,2
 ORDER BY week_no,total_points_earned DESC
)
WHERE rank<=10