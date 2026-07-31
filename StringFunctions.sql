CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'Alice Johnson', 'CSE', 'alice@gmail.com'),
(2, 'Bob Smith', 'Software Engineering', 'bob@gmail.com'),
(3, 'Charlie Brown', 'EEE', 'charlie@gmail.com'),
(4, 'David Miller', 'BBA', 'david@gmail.com'),
(5, 'Eva Wilson', 'CSE', 'eva@gmail.com');

SELECT * FROM Students;

-- Convert names to uppercase
SELECT Name, UPPER(Name) AS UpperCaseName
FROM Students;

-- Convert names to lowercase
SELECT Name, LOWER(Name) AS LowerCaseName
FROM Students;

-- Find the length of each name
SELECT Name, LENGTH(Name) AS NameLength
FROM Students;

-- Display the first 5 characters of each name
SELECT Name, LEFT(Name, 5) AS FirstFiveCharacters
FROM Students;

-- Display the last 4 characters of each name
SELECT Name, RIGHT(Name, 4) AS LastFourCharacters
FROM Students;

-- Extract characters starting from position 2
SELECT Name, SUBSTRING(Name, 2, 5) AS ExtractedText
FROM Students;

-- Combine name and department
SELECT CONCAT(Name, ' - ', Department) AS StudentInfo
FROM Students;

-- Remove leading and trailing spaces
SELECT TRIM('    Hello SQL    ') AS TrimmedText;

-- Replace a word in a string
SELECT Name,
REPLACE(Name, 'Alice', 'Alicia') AS UpdatedName
FROM Students;

-- Find the position of a character
SELECT Name,
INSTR(Name, 'o') AS PositionOfO
FROM Students;

-- Display the first 3 letters of each department
SELECT Department,
LEFT(Department, 3) AS ShortDepartment
FROM Students;
