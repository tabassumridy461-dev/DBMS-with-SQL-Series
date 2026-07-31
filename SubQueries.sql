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

-- Students with the highest CGPA
SELECT *
FROM Students
WHERE CGPA = (
    SELECT MAX(CGPA)
    FROM Students
);

-- Students older than the average age
SELECT *
FROM Students
WHERE Age > (
    SELECT AVG(Age)
    FROM Students
);

-- Students whose CGPA is above the average CGPA
SELECT *
FROM Students
WHERE CGPA > (
    SELECT AVG(CGPA)
    FROM Students
);

-- Students in the same department as Alice
SELECT *
FROM Students
WHERE Department = (
    SELECT Department
    FROM Students
    WHERE Name = 'Alice'
);

-- Students with the minimum CGPA
SELECT *
FROM Students
WHERE CGPA = (
    SELECT MIN(CGPA)
    FROM Students
);

-- Students whose age is equal to the maximum age
SELECT *
FROM Students
WHERE Age = (
    SELECT MAX(Age)
    FROM Students
);

-- Departments having more than one student
SELECT Department
FROM Students
GROUP BY Department
HAVING COUNT(*) > 1;

-- Students belonging to departments with more than one student
SELECT *
FROM Students
WHERE Department IN (
    SELECT Department
    FROM Students
    GROUP BY Department
    HAVING COUNT(*) > 1
);

-- Students whose CGPA is greater than every BBA student's CGPA
SELECT *
FROM Students
WHERE CGPA > (
    SELECT MAX(CGPA)
    FROM Students
    WHERE Department = 'BBA'
);

-- Display students sorted by CGPA in descending order
SELECT *
FROM Students
ORDER BY CGPA DESC;
