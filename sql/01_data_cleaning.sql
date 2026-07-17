/* =========================================================
   PROJECT : HR EMPLOYEE ATTRITION ANALYSIS
   FILE    : 01_data_cleaning.sql
   PURPOSE : Clean and prepare raw HR data for analysis
   TOOL    : MySQL
   ========================================================= */

-- =========================================================
-- 1. DATABASE SETUP
-- =========================================================

CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;


-- =========================================================
-- 2. DATASET OVERVIEW
-- =========================================================

-- Verify imported data
SELECT *
FROM hr_data;

-- Check total number of records
SELECT COUNT(*) AS Total_Records
FROM hr_data;

-- Check total number of columns
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'hr_analytics'
  AND TABLE_NAME = 'hr_data';

-- Review original column structure and data types
DESCRIBE hr_data;


-- =========================================================
-- 3. CREATE WORKING TABLE
-- =========================================================

-- Preserve the raw dataset by performing all cleaning
-- operations on a separate working table.

CREATE TABLE hr_data_cleaned AS
SELECT *
FROM hr_data;


-- =========================================================
-- 4. PRIMARY KEY & DUPLICATE VALIDATION
-- =========================================================

-- Check whether Employee_ID contains duplicate values
SELECT
    Employee_ID,
    COUNT(*) AS Duplicate_Count
FROM hr_data_cleaned
GROUP BY Employee_ID
HAVING COUNT(*) > 1;


-- Check for duplicate employee records
WITH duplicate_check AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Employee_ID,
                            Employee_Name,
                            Position,
                            Education_Level
               ORDER BY Employee_ID
           ) AS row_num
    FROM hr_data_cleaned
)
SELECT *
FROM duplicate_check
WHERE row_num > 1;


-- =========================================================
-- 5. HEADER STANDARDIZATION
-- =========================================================

ALTER TABLE hr_data_cleaned
    RENAME COLUMN HireDate TO Hire_Date,
    RENAME COLUMN ExitDate TO Exit_Date,
    RENAME COLUMN `LastPromotion date` TO LastPromotion_Date;


-- =========================================================
-- 6. TEXT QUALITY VALIDATION
-- =========================================================

-- Identify leading/trailing spaces and double spaces
-- in important categorical columns.

SELECT
    Employee_ID,
    Employee_Name,
    Position,
    Gender,
    Department,
    Education_Level
FROM hr_data_cleaned
WHERE Employee_Name LIKE '%  %'
   OR Position LIKE '%  %'
   OR Department LIKE '%  %'
   OR Education_Level LIKE '%  %'
   OR Employee_Name <> TRIM(Employee_Name)
   OR Position <> TRIM(Position)
   OR Gender <> TRIM(Gender)
   OR Department <> TRIM(Department)
   OR Education_Level <> TRIM(Education_Level);


-- =========================================================
-- 7. TEXT STANDARDIZATION
-- =========================================================

-- Remove leading and trailing spaces
UPDATE hr_data_cleaned
SET Employee_Name   = TRIM(Employee_Name),
    Position        = TRIM(Position),
    Gender          = TRIM(Gender),
    Department      = TRIM(Department),
    Education_Level = TRIM(Education_Level);

-- Remove identified double spaces from employee names
UPDATE hr_data_cleaned
SET Employee_Name = REPLACE(Employee_Name, '  ', ' ')
WHERE Employee_Name LIKE '%  %';


-- =========================================================
-- 8. CATEGORICAL VALUE STANDARDIZATION
-- =========================================================

-- Standardize Gender values
UPDATE hr_data_cleaned
SET Gender =
    CASE
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        WHEN LOWER(Gender) = 'female' THEN 'Female'
        WHEN LOWER(Gender) = 'male' THEN 'Male'
        ELSE Gender
    END;


-- Standardize Position titles
UPDATE hr_data_cleaned
SET Position =
    CASE
        WHEN Position = 'DataAnalyst'
            THEN 'Data Analyst'

        WHEN Position IN ('AccountExec.',
                          'AccountExecutive',
                          'A/c Exec')
            THEN 'Account Executive'

        WHEN Position = 'Creator'
            THEN 'Content Creator'

        WHEN Position = 'IT support specialist'
            THEN 'IT Support Specialist'

        WHEN Position = 'Datawarehouse lead'
            THEN 'Data Warehouse Lead'

        ELSE Position
    END;


-- =========================================================
-- 9. MISSING VALUE ASSESSMENT
-- =========================================================

-- Review NULL values in the dataset.
-- Department was the only field with identified missing
-- values requiring business-rule-based treatment.

SELECT *
FROM hr_data_cleaned
WHERE Department IS NULL;


-- CEO and COO records with missing departments were
-- categorized under Higher Management based on their roles.

UPDATE hr_data_cleaned
SET Department = 'Higher Management'
WHERE Department IS NULL
  AND Position IN ('CEO', 'COO');


-- =========================================================
-- 10. DATE STANDARDIZATION
-- =========================================================

-- Convert DD-MM-YYYY date strings into MySQL DATE format.
-- Conversion is performed before changing column data types.

UPDATE hr_data_cleaned
SET Hire_Date =
    CASE
        WHEN Hire_Date LIKE '__-__-____'
        THEN STR_TO_DATE(Hire_Date, '%d-%m-%Y')
        ELSE Hire_Date
    END,

    Exit_Date =
    CASE
        WHEN Exit_Date LIKE '__-__-____'
        THEN STR_TO_DATE(Exit_Date, '%d-%m-%Y')
        ELSE Exit_Date
    END,

    LastPromotion_Date =
    CASE
        WHEN LastPromotion_Date LIKE '__-__-____'
        THEN STR_TO_DATE(LastPromotion_Date, '%d-%m-%Y')
        ELSE LastPromotion_Date
    END;


-- =========================================================
-- 11. DATA TYPE STANDARDIZATION
-- =========================================================

ALTER TABLE hr_data_cleaned
    MODIFY Employee_ID VARCHAR(20),
    MODIFY Employee_Name VARCHAR(100),
    MODIFY Position VARCHAR(100),
    MODIFY Gender VARCHAR(20),
    MODIFY Department VARCHAR(100),
    MODIFY Education_Level VARCHAR(50),
    MODIFY Attrition VARCHAR(20),
    MODIFY Promotion VARCHAR(20),
    MODIFY Salary DECIMAL(10,2),
    MODIFY Hire_Date DATE,
    MODIFY Exit_Date DATE,
    MODIFY LastPromotion_Date DATE;


-- =========================================================
-- 12. FINAL DATA QUALITY VALIDATION
-- =========================================================

-- Confirm total record count after cleaning
SELECT COUNT(*) AS Final_Record_Count
FROM hr_data_cleaned;

-- Confirm Employee_ID uniqueness
SELECT
    Employee_ID,
    COUNT(*) AS Duplicate_Count
FROM hr_data_cleaned
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- Review standardized Gender values
SELECT
    Gender,
    COUNT(*) AS Employee_Count
FROM hr_data_cleaned
GROUP BY Gender;

-- Review standardized Position values
SELECT
    Position,
    COUNT(*) AS Employee_Count
FROM hr_data_cleaned
GROUP BY Position
ORDER BY Employee_Count DESC;

-- Review Department values
SELECT
    Department,
    COUNT(*) AS Employee_Count
FROM hr_data_cleaned
GROUP BY Department
ORDER BY Employee_Count DESC;

-- Review Education Level values
SELECT
    Education_Level,
    COUNT(*) AS Employee_Count
FROM hr_data_cleaned
GROUP BY Education_Level
ORDER BY Employee_Count DESC;


/* =========================================================
   END OF DATA CLEANING
   The hr_data_cleaned table is now ready for
   exploratory data analysis and attrition analysis.
   ========================================================= */
