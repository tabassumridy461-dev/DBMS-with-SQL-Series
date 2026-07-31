-- Create and use the database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Create Student table
CREATE TABLE Student (

    -- Student ID (Primary Key)
    StudentID INT PRIMARY KEY,

    -- Student Name
    Name VARCHAR(50),

    -- Student Age
    Age INT,

    -- Student Gender
    Gender VARCHAR(10),

    -- Student Department
    Department VARCHAR(50),

    -- Student CGPA
    CGPA DECIMAL(3,2)
);

-- Show all tables in the database
SHOW TABLES;

-- Display the table structure
DESCRIBE Student;
