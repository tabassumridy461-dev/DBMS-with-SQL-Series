CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Department VARCHAR(50) DEFAULT 'CSE',
    Age INT CHECK (Age >= 18),
    CGPA DECIMAL(3,2) CHECK (CGPA BETWEEN 0.00 AND 4.00)
);

INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
VALUES
(1, 'Alice', 'alice@gmail.com', 21, 3.85);

INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
VALUES
(2, 'Bob', 'bob@gmail.com', 22, 3.72);

INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
VALUES
(3, 'Charlie', 'charlie@gmail.com', 20, 3.60);

INSERT INTO Students (StudentID, Name, Email, Age)
VALUES
(4, 'David', 'david@gmail.com', 23);

SELECT * FROM Students;

-- Example: PRIMARY KEY violation
-- INSERT INTO Students VALUES
-- (1, 'Eva', 'eva@gmail.com', 'CSE', 21, 3.90);

-- Example: UNIQUE violation
-- INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
-- VALUES
-- (5, 'Eva', 'alice@gmail.com', 21, 3.90);

-- Example: NOT NULL violation
-- INSERT INTO Students (StudentID, Email, Age, CGPA)
-- VALUES
-- (6, 'test@gmail.com', 20, 3.50);

-- Example: CHECK violation
-- INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
-- VALUES
-- (7, 'Tom', 'tom@gmail.com', 15, 3.40);

-- Example: CHECK violation
-- INSERT INTO Students (StudentID, Name, Email, Age, CGPA)
-- VALUES
-- (8, 'Jerry', 'jerry@gmail.com', 20, 4.50);
