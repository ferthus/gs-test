-- Revising the select query 1
SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE='USA';

-- Revising the select query 2
SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE='USA';

-- Select all
SELECT * FROM CITY;

-- Select by ID
SELECT * FROM CITY WHERE ID=1661;

-- Japanese cities attributes
SELECT * FROM CITY WHERE COUNTRYCODE='JPN';

-- Japanese cities names
SELECT NAME FROM CITY WHERE COUNTRYCODE='JPN';

-- Weather observation station 1
SELECT CITY, STATE FROM STATION;

-- Weather observation station 3
SELECT CITY FROM STATION WHERE MOD(ID,2)=0 GROUP BY CITY;

-- Weather observation station 4
SELECT 
(SELECT COUNT(*) FROM STATION)
-
(SELECT COUNT(*) FROM (SELECT CITY FROM STATION GROUP BY CITY) t);

-- Weather observation station 6
WITH CITY_LENGTHS_CTE AS (
  SELECT city, LENGTH(city) AS city_l FROM STATION
)
(SELECT * FROM CITY_LENGTHS_CTE ORDER BY city_l, city LIMIT 1)
UNION 
(SELECT * FROM CITY_LENGTHS_CTE ORDER BY city_l DESC, city LIMIT 1);


SELECT CITY FROM STATION
WHERE LEFT(CITY, 1) IN ('a','e','i','o','u','A','E','I','O','U') 
GROUP BY CITY
ORDER BY CITY;


SELECT CITY FROM STATION
WHERE RIGHT(CITY, 1) IN ('a','e','i','o','u','A','E','I','O','U') 
GROUP BY CITY
ORDER BY CITY;


SELECT CITY FROM STATION
WHERE UPPER(RIGHT(CITY, 1)) IN ('A','E','I','O','U')
  AND UPPER(LEFT(CITY, 1)) IN ('A','E','I','O','U')
GROUP BY CITY;


SELECT CITY FROM STATION
WHERE UPPER(LEFT(CITY,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
GROUP BY CITY;


SELECT CITY FROM STATION
WHERE UPPER(RIGHT(CITY,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
GROUP BY CITY;


SELECT CITY FROM STATION
WHERE UPPER(RIGHT(CITY,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
   OR UPPER(LEFT(CITY,1))  NOT IN ('A', 'E', 'I', 'O', 'U')
GROUP BY CITY;


SELECT CITY FROM STATION
WHERE UPPER(RIGHT(CITY,1)) NOT IN ('A', 'E', 'I', 'O', 'U')
  AND UPPER(LEFT(CITY,1))  NOT IN ('A', 'E', 'I', 'O', 'U')
GROUP BY CITY;


SELECT Name FROM STUDENTS
WHERE Marks>75
ORDER BY RIGHT(NAME,3) ASC, ID ASC;


SELECT name FROM Employee
ORDER BY name ASC;


SELECT name FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

-- Top competitors
SELECT h.hacker_id, h.name FROM (
    SELECT res.hacker_id, COUNT(*) as full_score_challenges FROM Submissions res
    INNER JOIN Challenges cd ON res.challenge_id = cd.challenge_id
    INNER JOIN Difficulty d ON cd.difficulty_level = d.difficulty_level
    WHERE res.score = d.score
    GROUP BY res.hacker_id
) mq 
INNER JOIN Hackers h ON mq.hacker_id = h.hacker_id
WHERE mq.full_score_challenges > 1
ORDER BY mq.full_score_challenges DESC, h.hacker_id ASC;


SELECT h.hacker_id, h.name FROM (
    SELECT res.hacker_id, COUNT(*) as full_score_challenges FROM Submissions res
    INNER JOIN Challenges cd ON res.challenge_id = cd.challenge_id
    INNER JOIN Difficulty d ON cd.difficulty_level = d.difficulty_level
    WHERE res.score = d.score
    GROUP BY res.hacker_id
    HAVING COUNT(*) > 1
) mq 
INNER JOIN Hackers h ON mq.hacker_id = h.hacker_id
ORDER BY mq.full_score_challenges DESC, h.hacker_id ASC;

-- Ollivander's inventory
SELECT we.id, wpe.age, we.coins_needed, we.power FROM Wands we
INNER JOIN Wands_Property wpe ON we.code = wpe.code
WHERE (wpe.age, we.coins_needed, we.power) IN (
  SELECT wpi.age, MIN(coins_needed), wi.power FROM Wands wi
  INNER JOIN Wands_Property wpi ON wi.code = wpi.code
  GROUP BY wi.power, wpi.age
)
AND wpe.is_evil=0
ORDER BY we.power DESC, wpe.age DESC;


--Challenge (MySQL 8)
SELECT 
  cc_by_h.hacker_id,
  h.name,
  cc_by_h.challenge_counter
FROM (
  SELECT hacker_id, COUNT(*) as challenge_counter
  FROM Challenges
  GROUP BY hacker_id
) cc_by_h
CROSS JOIN (
  SELECT MAX(challenge_counter) as max_challenge_counter FROM (
    SELECT hacker_id, COUNT(*) as challenge_counter
    FROM Challenges
    GROUP BY hacker_id
  )
) max_cc
INNER JOIN (
  SELECT challenge_counter, COUNT(*) as bucket_counter FROM (
    SELECT hacker_id, COUNT(*) as challenge_counter
    FROM Challenges
    GROUP BY hacker_id
  )
  GROUP BY challenge_counter
) cc_bucket ON cc_by_h.challenge_counter = cc_bucket.challenge_counter
INNER JOIN Hackers h ON cc_by_h.hacker_id = h.hacker_id
WHERE cc_by_h.challenge_counter=max_cc.max_challenge_counter OR (
    cc_by_h.challenge_counter<max_cc.max_challenge_counter AND
    cc_bucket.bucket_counter=1
)
ORDER BY cc_by_h.challenge_counter DESC, cc_by_h.hacker_id ASC;


WITH cc_by_h_cte AS (
  SELECT hacker_id, COUNT(*) as challenge_counter
  FROM Challenges
  GROUP BY hacker_id
)
SELECT 
  cc_by_h_cte.hacker_id,
  h.name,
  cc_by_h_cte.challenge_counter
FROM cc_by_h_cte
CROSS JOIN (
  SELECT MAX(challenge_counter) as max_challenge_counter FROM cc_by_h_cte
) max_cc
INNER JOIN (
  SELECT challenge_counter, COUNT(*) as bucket_counter FROM cc_by_h_cte
  GROUP BY challenge_counter
) cc_bucket ON cc_by_h_cte.challenge_counter = cc_bucket.challenge_counter
INNER JOIN Hackers h ON cc_by_h_cte.hacker_id = h.hacker_id
WHERE cc_by_h_cte.challenge_counter=max_cc.max_challenge_counter OR (
    cc_by_h_cte.challenge_counter<max_cc.max_challenge_counter AND
    cc_bucket.bucket_counter=1
)
ORDER BY cc_by_h_cte.challenge_counter DESC, cc_by_h_cte.hacker_id ASC;

WITH 
  cch AS (
    SELECT hacker_id, COUNT(*) as counter
    FROM Challenges
    GROUP BY hacker_id
  ),
  cc_bucket AS (
    SELECT counter, COUNT(*) as bucket_counter FROM cch
    GROUP BY counter
  ), 
  max_cc AS ( SELECT MAX(counter) as max_counter FROM cch)
SELECT 
  cch.hacker_id, h.name, cch.counter
FROM cch
INNER JOIN cc_bucket ON cch.counter = cc_bucket.counter
INNER JOIN Hackers h ON cch.hacker_id = h.hacker_id
WHERE cch.counter=max_cc.max_counter OR (
  cch.counter<max_cc.max_counter AND
  cc_bucket.bucket_counter=1
)
ORDER BY cch.counter DESC, cch.hacker_id ASC;

WITH 
  cch AS (
    SELECT hacker_id, COUNT(*) as counter
    FROM Challenges
    GROUP BY hacker_id
  ),
  cc_bucket AS (
    SELECT counter, count(*) as bucket_counter FROM cch
    GROUP BY counter
  ), 
  max_cc AS ( SELECT MAX(counter) as max_counter FROM cch)
SELECT 
  cch.hacker_id, h.name, cch.counter
FROM cch
CROSS JOIN max_cc
INNER JOIN cc_bucket ON cch.counter = cc_bucket.counter
INNER JOIN Hackers h ON cch.hacker_id = h.hacker_id
WHERE cch.counter=max_cc.max_counter OR cc_bucket.bucket_counter=1
ORDER BY cch.counter DESC, cch.hacker_id ASC;


-- 15 Days of Learning SQL
WITH sdhg AS (
  SELECT submission_date, hacker_id, COUNT(*) AS h_count FROM Submissions
  GROUP BY submission_date, hacker_id
),
sdc AS (
  SELECT 
    ROW_NUMBER() OVER (ORDER BY submission_date) as date_number,
    submission_date, COUNT(submission_date) AS d_count, MAX(h_count) AS h_max
  FROM sdhg
  GROUP BY submission_date
),
sdc_filtered_c AS (
  SELECT se.submission_date, COUNT(se.submission_date) as d_count_f
  FROM sdhg se
  LEFT JOIN sdc ON se.submission_date = sdc.submission_date
  WHERE sdc.date_number in (
    SELECT COUNT(*) FROM sdhg si
    WHERE si.submission_date <= se.submission_date AND si.hacker_id = se.hacker_id
  )
  GROUP BY se.submission_date
),
sdf AS (
  SELECT sdhg.submission_date, MIN(sdhg.hacker_id) AS h_min FROM sdhg
  LEFT JOIN sdc ON sdhg.submission_date = sdc.submission_date
  WHERE sdhg.h_count = sdc.h_max
  GROUP BY sdhg.submission_date
)
SELECT
  sdf.submission_date,
  sdc_filtered_c.d_count_f,
  sdf.h_min,
  h.name
FROM sdf
INNER JOIN sdc ON sdf.submission_date = sdc.submission_date
INNER JOIN sdc_filtered_c ON sdf.submission_date = sdc_filtered_c.submission_date
INNER JOIN Hackers h ON sdf.h_min = h.hacker_id
ORDER BY sdf.submission_date;
/*
tmp
submission_date, hacker_id, h_count
              1,         1,       1
              1,         2,       1
              1,         4,       2
              2,         1,       1
              2,         2,       1
              2,         5,       1
              3,         1,       1
              3,         3,       1
$i=3
$n=3
$h=4
$i IN (
  SELECT count(*) FROM tmp
  WHERE submission_date <= $n AND hacker_id = $h
)

-- 1,4,2 then 1 in (3) -> false


$i=3
$n=3
$h=1
$i IN (
  SELECT count(*) FROM tmp
  WHERE submission_date <= $n AND hacker_id = $h
)
--3 IN (
--  SELECT count(*) FROM tmp
--  WHERE 3 <= 3 AND hacker_id = 1
--)
-- 1,1,1; 2,1,1; 3,1,1 then 3 in (3) -> true
*/

--Revising aggregation - The count function
SELECT COUNT(*) FROM CITY WHERE POPULATION > 100000;

--Revising aggregation - The sum function
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = 'California';

--Revising aggregation - The sum function
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = 'California';

-- AVERAGE POPULATION
SELECT AVG(POPULATION) FROM CITY;

-- JAPAN POPULATION
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE='JPN';

-- Population density difference
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;

--The Blunder
SELECT REPLACE(CAST(e.Salary AS CHAR), '0', '') FROM EMPLOYEES e;
SELECT e.Salary, REPLACE(e.Salary, '0', '') FROM EMPLOYEES e;

SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) FROM EMPLOYEES;

--Top Earners
---MySQL 5.*
SELECT CONCAT((SELECT MAX(salary * months) AS max_salary FROM Employee), '  ', COUNT(*))
FROM Employee 
WHERE salary * months = (
  SELECT MAX(salary * months) AS max_salary FROM Employee
);

---Oracle
WITH 
  max_sal_cte AS (
    SELECT MAX(salary * months) AS max_salary FROM Employee
  ),
  emp_max_sal AS ( 
    SELECT count(*) FROM Employee
    WHERE (salary * months) = (SELECT * FROM max_sal_cte)
  )
SELECT * FROM max_sal_cte, emp_max_sal;

-- Weather observation station 2
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

-- Weather observation station 13
SELECT ROUND(SUM(LAT_N), 4) FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

-- Weather observation station 14
SELECT ROUND(MAX(LAT_N), 4) FROM STATION
WHERE LAT_N < 137.2345;

-- Weather observation station 15
SELECT ROUND(LONG_W, 4) FROM STATION
WHERE LAT_N IN (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- Weather observation station 16
SELECT ROUND(MIN(LAT_N), 4) FROM STATION WHERE LAT_N>38.778;

-- Weather observation station 17
SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N IN (
    SELECT MIN(LAT_N) FROM STATION WHERE LAT_N>38.778
);

--Population census
SELECT SUM(CITY.POPULATION) FROM CITY
INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT='Asia';

--AVERAGE POPULATION PER EACH CONTINENT
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.POPULATION))
FROM CITY INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.Continent;

-- Weather observation station 5
(SELECT CITY, LENGTH(CITY) FROM STATION
WHERE LENGTH(CITY) IN (SELECT MIN(LENGTH(CITY)) FROM STATION)
ORDER BY CITY LIMIT 1)
UNION
(SELECT CITY, LENGTH(CITY) FROM STATION
WHERE LENGTH(CITY) IN (SELECT MAX(LENGTH(CITY)) FROM STATION)
ORDER BY CITY LIMIT 1);

--wrong
SELECT CITY, LENGTH(CITY) FROM STATION
WHERE LENGTH(CITY) IN (
  (SELECT MAX(LENGTH(CITY)) FROM STATION),
  (SELECT MIN(LENGTH(CITY)) FROM STATION)
);

--Type of triangle
SELECT
  CASE
    WHEN A>=B+C OR B>=A+C OR C>=A+B THEN 'Not A Triangle'
    ELSE
      CASE
        WHEN A=B AND B=C THEN 'Equilateral'
        WHEN A=B OR A=C OR C=B THEN 'Isosceles'
        ELSE 'Scalene'
      END
  END
FROM TRIANGLES;


-- Draw the triangle 1
WITH RECURSIVE cte AS
(
    SELECT ' * * * * *' AS N
    UNION ALL
    SELECT LEFT(N, LENGTH(N) - 2) FROM cte WHERE LENGTH(N) > 2
)
SELECT * FROM cte;

WITH RECURSIVE cte AS
(
    SELECT 20 AS N
    UNION ALL
    SELECT N - 1 FROM cte WHERE N > 1
)
SELECT REPEAT('* ', N) FROM cte;

-- Draw the  triangle 2
WITH RECURSIVE cte AS (
    SELECT 1 as N
    UNION ALL
    SELECT N + 1 FROM cte WHERE N<20
)
SELECT REPEAT('* ', N) FROM cte;

SET @TEMP:=0; 
SELECT REPEAT('* ', @TEMP:= @TEMP + 1) 
FROM INFORMATION_SCHEMA.TABLES
WHERE @TEMP < 20;

-- Interviews
SELECT 
  cnm.*, 
  NVL(sq1.total_submissions, 0) AS total_submissions,
  NVL(sq1.total_accepted_submissions, 0) AS total_accepted_submissions,
  NVL(sq2.total_views, 0) AS total_views,
  NVL(sq2.total_unique_views, 0) AS total_unique_views
FROM Contests cnm
LEFT JOIN (
  SELECT
    cn.contest_id AS contest_id,
    SUM(total_submissions) AS total_submissions,
    SUM(total_accepted_submissions) AS total_accepted_submissions
  FROM Submission_Stats ss
  LEFT JOIN Challenges ch ON ss.challenge_id = ch.challenge_id
  LEFT JOIN Colleges cl ON ch.college_id = cl.college_id
  LEFT JOIN Contests cn ON cl.contest_id = cn.contest_id
  GROUP BY cn.contest_id
) sq1 ON cnm.contest_id = sq1.contest_id
LEFT JOIN(
  SELECT
    cn.contest_id as contest_id,
    SUM(vs.total_views) as total_views,
    SUM(vs.total_unique_views) as total_unique_views
  FROM View_Stats vs
  LEFT JOIN Challenges ch ON vs.challenge_id = ch.challenge_id
  LEFT JOIN Colleges cl ON ch.college_id = cl.college_id
  LEFT JOIN Contests cn ON cl.contest_id = cn.contest_id
  GROUP BY cn.contest_id
) sq2 ON cnm.contest_id = sq2.contest_id
WHERE 
    total_submissions 
  + total_accepted_submissions
  + total_views
  + total_unique_views > 0
ORDER BY cnm.contest_id;

-- Prime numbers
WITH RECURSIVE number_gen AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1 FROM number_gen WHERE n + 1 <= 1000
),
prime AS (
    SELECT n FROM number_gen
    WHERE NOT EXISTS (
        SELECT bf.n FROM number_gen AS bf
        WHERE bf.n > 1 AND bf.n < number_gen.n AND number_gen.n % bf.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&') FROM prime;

