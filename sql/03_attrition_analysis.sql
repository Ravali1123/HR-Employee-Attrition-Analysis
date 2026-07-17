/* =========================================================
   PROJECT : HR EMPLOYEE ATTRITION ANALYSIS
   FILE    : 03_attrition_analysis.sql
   PURPOSE : Identify where attrition is highest and explore
             factors associated with employee attrition
   TOOL    : MySQL
   ========================================================= */

USE hr_analytics;


-- =========================================================
-- 1. OVERALL ATTRITION
-- =========================================================

SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned;


-- =========================================================
-- 2. ATTRITION BY DEPARTMENT
-- =========================================================

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY Department
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 3. ATTRITION BY POSITION
-- =========================================================

SELECT
    Position,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY Position
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 4. ATTRITION BY GENDER
-- =========================================================

SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY Gender
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 5. ATTRITION BY AGE GROUP
-- =========================================================

SELECT
    CASE
        WHEN Age BETWEEN 25 AND 29 THEN 'Early Career'
        WHEN Age BETWEEN 30 AND 34 THEN 'Mid Career'
        ELSE 'Experienced Workforce'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Age BETWEEN 25 AND 29 THEN 'Early Career'
        WHEN Age BETWEEN 30 AND 34 THEN 'Mid Career'
        ELSE 'Experienced Workforce'
    END

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 6. ATTRITION BY YEARS OF SERVICE
-- =========================================================

SELECT
    CASE
        WHEN Years_of_Service BETWEEN 1 AND 3
            THEN 'Early Career'
        WHEN Years_of_Service BETWEEN 4 AND 7
            THEN 'Mid Career'
        ELSE 'Senior Workforce'
    END AS Years_of_Service_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Years_of_Service BETWEEN 1 AND 3
            THEN 'Early Career'
        WHEN Years_of_Service BETWEEN 4 AND 7
            THEN 'Mid Career'
        ELSE 'Senior Workforce'
    END

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 7. ATTRITION BY EDUCATION LEVEL
-- =========================================================

SELECT
    Education_Level,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY Education_Level
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 8. ATTRITION VS EMPLOYEE ENGAGEMENT
-- =========================================================

SELECT
    CASE
        WHEN Employee_Engagement_Score BETWEEN 1 AND 2
            THEN 'Low Engagement'
        WHEN Employee_Engagement_Score BETWEEN 3 AND 4
            THEN 'Moderate Engagement'
        ELSE 'High Engagement'
    END AS Engagement_Level,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Employee_Engagement_Score BETWEEN 1 AND 2
            THEN 'Low Engagement'
        WHEN Employee_Engagement_Score BETWEEN 3 AND 4
            THEN 'Moderate Engagement'
        ELSE 'High Engagement'
    END

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 9. ATTRITION VS TRAINING EXPOSURE
-- =========================================================

SELECT
    CASE
        WHEN Training_Hours BETWEEN 0 AND 20
            THEN 'Low Training Exposure'
        WHEN Training_Hours BETWEEN 21 AND 40
            THEN 'Moderate Training Exposure'
        ELSE 'High Training Exposure'
    END AS Training_Exposure,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Training_Hours BETWEEN 0 AND 20
            THEN 'Low Training Exposure'
        WHEN Training_Hours BETWEEN 21 AND 40
            THEN 'Moderate Training Exposure'
        ELSE 'High Training Exposure'
    END

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 10. ATTRITION BY SALARY GROUP
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

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

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

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 11. ATTRITION VS ABSENTEEISM
-- =========================================================

SELECT
    CASE
        WHEN Absenteeism BETWEEN 0 AND 5
            THEN 'Low Absenteeism'
        WHEN Absenteeism BETWEEN 6 AND 10
            THEN 'Medium Absenteeism'
        ELSE 'High Absenteeism'
    END AS Absenteeism_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,

    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage

FROM hr_data_cleaned

GROUP BY
    CASE
        WHEN Absenteeism BETWEEN 0 AND 5
            THEN 'Low Absenteeism'
        WHEN Absenteeism BETWEEN 6 AND 10
            THEN 'Medium Absenteeism'
        ELSE 'High Absenteeism'
    END

ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 12. ATTRITION VS PROMOTION
-- =========================================================

SELECT
    Promotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END)
        AS Active_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY Promotion
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 13. ATTRITION VS WORK-LIFE BALANCE
-- =========================================================

SELECT
    JobSatisfaction_WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY JobSatisfaction_WorkLifeBalance
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 14. ATTRITION VS PEER RELATIONSHIP
-- =========================================================

SELECT
    JobSatisfaction_PeerRelationship,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY JobSatisfaction_PeerRelationship
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 15. ATTRITION VS COMPENSATION SATISFACTION
-- =========================================================

SELECT
    JobSatisfaction_Compensation,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY JobSatisfaction_Compensation
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 16. ATTRITION VS MANAGEMENT SATISFACTION
-- =========================================================

SELECT
    JobSatisfaction_Management,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY JobSatisfaction_Management
ORDER BY Attrition_Percentage DESC;


-- =========================================================
-- 17. ATTRITION VS JOB SECURITY
-- =========================================================

SELECT
    JobSatisfaction_JobSecurity,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS Attrited_Employees,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_data_cleaned
GROUP BY JobSatisfaction_JobSecurity
ORDER BY Attrition_Percentage DESC;


/* =========================================================
   END OF ATTRITION ANALYSIS

   Key areas analyzed:
   - Where attrition is concentrated
   - Employee demographics and tenure
   - Engagement and training
   - Compensation and promotion
   - Work-life balance
   - Management and job security
   ========================================================= */
