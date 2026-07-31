CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Age INT,
    CGPA DECIMAL(3,2)
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 21, 3.85),
(2, 'Bob', 'Software Engineering', 22, 3.72),
(3, 'Charlie', 'EEE', 20, 3.60),
(4, 'David', 'BBA', 23, 3.45),
(5, 'Eva', 'CSE', 21, 3.95),
(6, 'Frank', 'EEE', 22, 3.50),
(7, 'Grace', 'BBA', 20, 3.80);

SELECT * FROM Students;

-- CASE statement
SELECT
    Name,
    CGPA,
    CASE
        WHEN CGPA >= 3.80 THEN 'Excellent'
        WHEN CGPA >= 3.50 THEN 'Good'
        ELSE 'Average'
    END AS Performance
FROM Students;

-- EXISTS
SELECT *
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Students
    WHERE Department = s.Department
    GROUP BY Department
    HAVING COUNT(*) > 1
);

-- ANY
SELECT *
FROM Students
WHERE CGPA > ANY (
    SELECT CGPA
    FROM Students
    WHERE Department = 'BBA'
);

-- ALL
SELECT *
FROM Students
WHERE CGPA > ALL (
    SELECT CGPA
    FROM Students
    WHERE Department = 'BBA'
);

-- IN
SELECT *
FROM Students
WHERE Department IN ('CSE', 'EEE');

-- NOT IN
SELECT *
FROM Students
WHERE Department NOT IN ('BBA');

-- UNION
SELECT Name
FROM Students
WHERE Department = 'CSE'

UNION

SELECT Name
FROM Students
WHERE Department = 'EEE';

-- UNION ALL
SELECT Department
FROM Students

UNION ALL

SELECT Department
FROM Students;

-- Common Table Expression (CTE)
WITH HighCGPA AS (
    SELECT *
    FROM Students
    WHERE CGPA >= 3.80
)
SELECT *
FROM HighCGPA;

-- ROW_NUMBER()
SELECT
    Name,
    CGPA,
    ROW_NUMBER() OVER (ORDER BY CGPA DESC) AS RowNumber
FROM Students;

-- RANK()
SELECT
    Name,
    CGPA,
    RANK() OVER (ORDER BY CGPA DESC) AS StudentRank
FROM Students;

-- DENSE_RANK()
SELECT
    Name,
    CGPA,
    DENSE_RANK() OVER (ORDER BY CGPA DESC) AS DenseRank
FROM Students;

-- NTILE()
SELECT
    Name,
    CGPA,
    NTILE(2) OVER (ORDER BY CGPA DESC) AS GroupNumber
FROM Students;

-- Top 3 students
SELECT *
FROM Students
ORDER BY CGPA DESC
LIMIT 3;

-- Second highest CGPA
SELECT MAX(CGPA) AS SecondHighestCGPA
FROM Students
WHERE CGPA < (
    SELECT MAX(CGPA)
    FROM Students
);

-- Students above average CGPA
SELECT *
FROM Students
WHERE CGPA > (
    SELECT AVG(CGPA)
    FROM Students
);

-- Number of students in each department
SELECT
    Department,
    COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department
ORDER BY TotalStudents DESC;
