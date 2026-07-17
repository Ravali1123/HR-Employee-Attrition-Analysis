/* =========================================================
   PROJECT : HR EMPLOYEE ATTRITION ANALYSIS
   FILE    : 02_exploratory_data_analysis.sql
   PURPOSE : Explore workforce composition and key
             employee characteristics before attrition analysis
   TOOL    : MySQL
   ========================================================= */

USE hr_analytics;


-- =========================================================
-- 1. WORKFORCE OVERVIEW
-- =========================================================

-- Total number of employees
SELECT
    COUNT(*) AS Total_Employees
FROM hr_data_cleaned;


-- =========================================================
-- 2. GENDER DISTRIBUTION
-- =========================================================

SELECT
    Gender,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage
FROM hr_data_cleaned
GROUP BY Gender
ORDER BY Employee_Count DESC;


-- =========================================================
-- 3. DEPARTMENT DISTRIBUTION
-- =========================================================

SELECT
    Department,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage
FROM hr_data_cleaned
GROUP BY Department
ORDER BY Employee_Count DESC;


-- =========================================================
-- 4. POSITION DISTRIBUTION
-- =========================================================

SELECT
    Position,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage
FROM hr_data_cleaned
GROUP BY Position
ORDER BY Employee_Count DESC;


-- =========================================================
-- 5. EDUCATION LEVEL DISTRIBUTION
-- =========================================================

SELECT
    Education_Level,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage
FROM hr_data_cleaned
GROUP BY Education_Level
ORDER BY Employee_Count DESC;


-- =========================================================
-- 6. AGE GROUP DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN Age BETWEEN 25 AND 29 THEN 'Early Career'
        WHEN Age BETWEEN 30 AND 34 THEN 'Mid Career'
        ELSE 'Experienced Workforce'
    END AS Age_Group,

    COUNT(*) AS Employee_Count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Age BETWEEN 25 AND 29 THEN 'Early Career'
        WHEN Age BETWEEN 30 AND 34 THEN 'Mid Career'
        ELSE 'Experienced Workforce'
    END

ORDER BY Employee_Count DESC;


-- =========================================================
-- 7. YEARS OF SERVICE DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN Years_of_Service BETWEEN 1 AND 3
            THEN 'Early Career'

        WHEN Years_of_Service BETWEEN 4 AND 7
            THEN 'Mid Career'

        ELSE 'Senior Workforce'
    END AS Years_of_Service_Group,

    COUNT(*) AS Employee_Count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Years_of_Service BETWEEN 1 AND 3
            THEN 'Early Career'

        WHEN Years_of_Service BETWEEN 4 AND 7
            THEN 'Mid Career'

        ELSE 'Senior Workforce'
    END

ORDER BY Employee_Count DESC;


-- =========================================================
-- 8. SALARY DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN Salary < 2000000
            THEN 'Low Salary'

        WHEN Salary BETWEEN 2000000 AND 5000000
            THEN 'Medium Salary'

        WHEN Salary BETWEEN 5000001 AND 8000000
            THEN 'High Salary'

        ELSE 'Executive Salary'
    END AS Salary_Group,

    COUNT(*) AS Employee_Count

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Salary < 2000000
            THEN 'Low Salary'

        WHEN Salary BETWEEN 2000000 AND 5000000
            THEN 'Medium Salary'

        WHEN Salary BETWEEN 5000001 AND 8000000
            THEN 'High Salary'

        ELSE 'Executive Salary'
    END

ORDER BY Employee_Count DESC;


-- =========================================================
-- 9. EMPLOYEE ENGAGEMENT DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN Employee_Engagement_Score BETWEEN 1 AND 2
            THEN 'Low Engagement'

        WHEN Employee_Engagement_Score BETWEEN 3 AND 4
            THEN 'Moderate Engagement'

        ELSE 'High Engagement'
    END AS Engagement_Level,

    COUNT(*) AS Employee_Count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Employee_Engagement_Score BETWEEN 1 AND 2
            THEN 'Low Engagement'

        WHEN Employee_Engagement_Score BETWEEN 3 AND 4
            THEN 'Moderate Engagement'

        ELSE 'High Engagement'
    END

ORDER BY Employee_Count DESC;


-- =========================================================
-- 10. TRAINING EXPOSURE DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN Training_Hours BETWEEN 0 AND 20
            THEN 'Low Training Exposure'

        WHEN Training_Hours BETWEEN 21 AND 40
            THEN 'Moderate Training Exposure'

        ELSE 'High Training Exposure'
    END AS Training_Exposure,

    COUNT(*) AS Employee_Count,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_data_cleaned),
        2
    ) AS Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Training_Hours BETWEEN 0 AND 20
            THEN 'Low Training Exposure'

        WHEN Training_Hours BETWEEN 21 AND 40
            THEN 'Moderate Training Exposure'

        ELSE 'High Training Exposure'
    END

ORDER BY Employee_Count DESC;


/* =========================================================
   END OF EXPLORATORY DATA ANALYSIS

   The workforce overview provides a baseline understanding
   of employee demographics and organizational characteristics
   before performing detailed attrition analysis.
   ========================================================= */
