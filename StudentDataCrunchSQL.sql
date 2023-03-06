--	Student Data Crunch SQL

-- What is the proportion of female students?= 1.53
-- 	SELECT gender,
-- 		ROUND((SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE gender='Female') / 
-- 		 (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE gender='Male'),2)
-- 		AS ratioMaleFemale
-- 		FROM cd.statcrunchsurvey
-- 		WHERE gender='Female'
-- 		GROUP BY gender;

-- "gender"	"ratiomalefemale"
-- "Female"	1.53

-- How are the students distributed across the classes of 
	--First Year, Sophomore, Junior, and Senior classes?
	
-- SELECT class,
--      (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE class=1) as Freshman,
--      (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE class=2) as Sophomore,
--      (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE class=3) as Junior,	
--      (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE class=4) as Senior
-- 	FROM cd.statcrunchsurvey
-- 	GROUP BY class
-- 	ORDER BY class
-- 	LIMIT 1;
	
-- 	"class"	"freshman"	"sophomore"	"junior" "senior"
		-- 	1	309.00	215.00	243.00	233.00

-- What is the distribution of credit hours? 
	--Is the mean number of credit hours per student less than 15?

-- 	SELECT DISTINCT class, sum(hours) as hrs
-- 		FROM cd.statcrunchsurvey
-- 		GROUP BY class
-- 		ORDER BY class;
	
-- "class"	"hrs"
	-- 1	4491
	-- 2	3071
	-- 3	3487
	-- 4	3136

-- 	SELECT DISTINCT class, avg(hours) as hrs
-- 		FROM cd.statcrunchsurvey
-- 		GROUP BY class
-- 		ORDER BY class;

-- "class"	"hrs"
	-- 1	14.53
	-- 2	14.28
	-- 3	14.35
	-- 4	13.46

-- What proportion of students work? 1.54 For students who work, 
	--describe the relationship between weekly hours worked and credit hours.

-- SELECT ROUND(avg(hours),2) as hours, 
-- 	ROUND(avg(work),2) as work
-- 	FROM cd.statcrunchsurvey
-- 	where work > 0;

-- What proportion of students have loans? Approx 1:1. Characterize the distribution of loan amounts. 
	-- SELECT ROUND(count(loans),2) as loans 
	-- 	FROM cd.statcrunchsurvey
	-- 	where loans > 0;
	
-----Check if gender and/or class impact this distribution.
	-- SELECT SUM(loans) as Total_debt,
	--   (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE class=1) as Freshman,
	--   (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE class=2) as Sophomore,
	--   (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE class=3) as Junior,	
	--   (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE class=4) as Senior,
	-- 	 (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE gender='Male') as Male,
	-- 	 (SELECT ROUND(SUM(loans),2) FROM cd.statcrunchsurvey WHERE gender='Female') as Female
	-- 	FROM cd.statcrunchsurvey
	-- 	LIMIT 1;
	
-- "total_debt"	"freshman"	"sophomore"	"junior"	"senior"	"male"	"female"
	-- 4871057	562017.00	927221.00	1598263.00	1783556.00	1800692.00	3070365.00
	
-- What proportion of students have credit card debt? 
--- For students with debt, check if debt is influenced by any of the other variables.

-- 	SELECT 
-- 		ROUND((SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE ccdebt>0) / 
-- 		 (SELECT ROUND(COUNT(*),2) FROM cd.statcrunchsurvey WHERE ccdebt=0),2)
-- 		AS ccdebt_ratio
-- 		FROM cd.statcrunchsurvey
-- 		LIMIT 1;

-- "ccdebt_ratio"
	-- 7.85
	
-- SELECT SUM(ccdebt) as Total_CCdebt,
--      (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE class=1) as Freshman,
--      (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE class=2) as Sophomore,
--      (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE class=3) as Junior,	
--      (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE class=4) as Senior,
-- 	 (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE gender='Male') as Male,
-- 	 (SELECT ROUND(SUM(ccdebt),2) FROM cd.statcrunchsurvey WHERE gender='Female') as Female
-- 	FROM cd.statcrunchsurvey
-- 	LIMIT 1;
	
-- "total_ccdebt"	"freshman"	"sophomore"	"junior"	"senior"	"male"	"female"
	-- 2983664	356806.00	524565.00	927087.00	1175206.00	1369667.00	1613997.00	