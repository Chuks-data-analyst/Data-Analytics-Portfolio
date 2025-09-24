--To view the dataset imported
SELECT * FROM HR; 

--To Backup my dataset
SELECT * INTO HR_backup FROM HR;

--To Trim Unwanted Spaces
UPDATE HR
SET Department  = UPPER(LTRIM(RTRIM(Department))),
    Status      = UPPER(LTRIM(RTRIM(Status))),
    Work_Mode   = UPPER(LTRIM(RTRIM(Work_Mode))),
    Job_Title   = LTRIM(RTRIM(Job_Title)),
    Location    = LTRIM(RTRIM(Location)),
    Full_Name   = LTRIM(RTRIM(Full_Name));


--Check NULLs for all columns
SELECT 
    SUM(CASE WHEN Employee_ID IS NULL THEN 1 ELSE 0 END) AS null_Employee_ID,
    SUM(CASE WHEN Full_Name IS NULL THEN 1 ELSE 0 END) AS null_Full_Name,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS null_Department,
    SUM(CASE WHEN Job_Title IS NULL THEN 1 ELSE 0 END) AS null_Job_Title,
    SUM(CASE WHEN Hire_Date IS NULL THEN 1 ELSE 0 END) AS null_Hire_Date,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS null_Location,
    SUM(CASE WHEN Performance_Rating IS NULL THEN 1 ELSE 0 END) AS null_Performance_Rating,
    SUM(CASE WHEN Experience_Years IS NULL THEN 1 ELSE 0 END) AS null_Experience_Years,
    SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END) AS null_Status,
    SUM(CASE WHEN Work_Mode IS NULL THEN 1 ELSE 0 END) AS null_Work_Mode,
    SUM(CASE WHEN Salary_INR IS NULL THEN 1 ELSE 0 END) AS null_Salary_INR
FROM HR;

--To Check for duplicates (unique identifier)
SELECT Employee_ID, COUNT(*) AS duplicate_count
FROM HR
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

--Outlier scan
SELECT Employee_ID, Department, Job_Title, Salary_INR
FROM HR
WHERE Salary_INR < 100000 OR Salary_INR > 100000000; 

SELECT 
    MIN(Salary_INR) AS min_salary,
    MAX(Salary_INR) AS max_salary
FROM HR;

--Deep scan for outlier
--Let's Compute Q1, Q3 and IQR bounds once
WITH SalaryStats AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q3
    FROM HR
),
Bounds AS (
    SELECT TOP 1
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5*(Q3 - Q1)) AS Lower_Bound,
        (Q3 + 1.5*(Q3 - Q1)) AS Upper_Bound
    FROM SalaryStats
)
SELECT * FROM Bounds; 


--To Count how many employees that fall outside bounds
WITH SalaryStats AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q3
    FROM HR
),
Bounds AS (
    SELECT TOP 1
        Q1, Q3,
        (Q1 - 1.5*(Q3 - Q1)) AS Lower_Bound,
        (Q3 + 1.5*(Q3 - Q1)) AS Upper_Bound
    FROM SalaryStats
)
SELECT 
    COUNT(*) AS Outlier_Count,
    (SELECT COUNT(*) FROM HR) AS Total_Employees,
    ROUND(CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM HR) * 100, 2) AS Outlier_Percent
FROM HR e   
CROSS JOIN Bounds b
WHERE e.Salary_INR < b.Lower_Bound
   OR e.Salary_INR > b.Upper_Bound;


-- Lastly let's pull sample details of outliers
WITH SalaryStats AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Salary_INR) OVER() AS Q3
    FROM HR
),
Bounds AS (
    SELECT TOP 1
        (Q1 - 1.5*(Q3 - Q1)) AS Lower_Bound,
        (Q3 + 1.5*(Q3 - Q1)) AS Upper_Bound
    FROM SalaryStats
)
SELECT TOP 50  -- To  Just show 50 for inspection
    e.Employee_ID,
    e.Department,
    e.Job_Title,
    e.Salary_INR
FROM HR e
CROSS JOIN Bounds b
WHERE e.Salary_INR < b.Lower_Bound
   OR e.Salary_INR > b.Upper_Bound
ORDER BY e.Salary_INR;

--Let's create a view with only the needed columns:
CREATE VIEW HR_Cleaned AS
SELECT 
    Employee_ID,
    Full_Name,
    Department,
    Job_Title,
    Hire_Date,
    Location,
    Performance_Rating,
    Experience_Years,
    Status,
    Work_Mode,
    Salary_INR
FROM HR;

SELECT * FROM HR_Cleaned