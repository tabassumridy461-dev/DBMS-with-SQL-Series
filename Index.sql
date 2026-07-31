CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Email VARCHAR(100),
    CGPA DECIMAL(3,2)
);

INSERT INTO Students VALUES
(1, 'Alice', 'CSE', 'alice@gmail.com', 3.85),
(2, 'Bob', 'Software Engineering', 'bob@gmail.com', 3.72),
(3, 'Charlie', 'EEE', 'charlie@gmail.com', 3.60),
(4, 'David', 'BBA', 'david@gmail.com', 3.45),
(5, 'Eva', 'CSE', 'eva@gmail.com', 3.95),
(6, 'Frank', 'EEE', 'frank@gmail.com', 3.50),
(7, 'Grace', 'BBA', 'grace@gmail.com', 3.80);

SELECT * FROM Students;

-- Create an index on the Name column
CREATE INDEX idx_name
ON Students(Name);

-- Create an index on the Department column
CREATE INDEX idx_department
ON Students(Department);

-- Create a unique index on the Email column
CREATE UNIQUE INDEX idx_email
ON Students(Email);

-- Display student by name
SELECT *
FROM Students
WHERE Name = 'Alice';

-- Display students by department
SELECT *
FROM Students
WHERE Department = 'CSE';

-- Display student by email
SELECT *
FROM Students
WHERE Email = 'bob@gmail.com';

-- Show all indexes of the Students table
SHOW INDEX FROM Students;

-- Remove an index
DROP INDEX idx_department
ON Students;

-- Show indexes after dropping one
SHOW INDEX FROM Students;
