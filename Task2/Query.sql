-- 1. Database Setup
CREATE DATABASE student_database;
USE student_database;

CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC(15,0),
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC(3,1),
    Grade TEXT
);

-- 2. Data Entry
INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade) VALUES
(1, 'Alice Johnson', 'Computer Science', 'alice.johnson@example.com', 1234567890, '123 Apple St', '2000-03-12', 'Female', 'AI', 8.5, 'A'),
(2, 'Bob Smith', 'Mathematics', 'bob.smith@example.com', 2345678901, '456 Orange Ave', '1999-06-25', 'Male', 'Statistics', 6.7, 'B'),
(3, 'Carol Lee', 'Physics', 'carol.lee@example.com', 3456789012, '789 Banana Blvd', '2001-11-03', 'Female', 'Astrophysics', 9.1, 'A'),
(4, 'David Brown', 'Computer Science', 'david.brown@example.com', 4567890123, '321 Pine Rd', '2000-01-15', 'Male', 'Cybersecurity', 4.8, 'C'),
(5, 'Eva Green', 'Biology', 'eva.green@example.com', 5678901234, '654 Cherry Ln', '1998-12-05', 'Female', 'Genetics', 5.9, 'B'),
(6, 'Frank Miller', 'Mathematics', 'frank.miller@example.com', 6789012345, '987 Plum St', '1997-07-19', 'Male', 'Applied Math', 3.4, 'C'),
(7, 'Grace Lee', 'Physics', 'grace.lee@example.com', 7890123456, '321 Peach Blvd', '2001-05-22', 'Female', 'Quantum Mechanics', 8.9, 'A'),
(8, 'Henry Ford', 'Biology', 'henry.ford@example.com', 8901234567, '654 Mango Rd', '1999-11-30', 'Male', 'Zoology', 4.2, 'C'),
(9, 'Ivy White', 'Computer Science', 'ivy.white@example.com', 9012345678, '147 Coconut Ln', '2000-08-14', 'Female', 'Data Science', 7.5, 'B'),
(10, 'Jack Black', 'Mathematics', 'jack.black@example.com', 1123456789, '258 Kiwi St', '1998-03-27', 'Male', 'Pure Math', 5.1, 'B');

-- 3. Student Information Retrieval
SELECT * 
FROM student_table
ORDER BY Grade DESC;

-- 4. Query for Male Students
SELECT *
FROM student_table
WHERE Gender = 'Male';

-- 5. Query for Students with GPA less than 5.0
SELECT *
FROM student_table
WHERE GPA < 5.0;

-- 6. Update Student Email and Grade (example for Student_id = 4)
UPDATE student_table
SET email_id = 'david.brown_new@example.com',
    Grade = 'B'
WHERE Student_id = 4;

-- 7. Query for Students with Grade "B"
SELECT 
    Stu_name, 
    TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM 
    student_table
WHERE 
    Grade = 'B';

-- 8. Grouping and Calculation: Average GPA by Department and Gender
SELECT 
    Department,
    Gender,
    AVG(GPA) AS average_gpa
FROM 
    student_table
GROUP BY 
    Department, Gender;

-- 9. Table Renaming
ALTER TABLE student_table RENAME TO student_info;

-- 10. Retrieve Student with Highest GPA
SELECT 
    Stu_name,
    GPA
FROM 
    student_info
WHERE 
    GPA = (SELECT MAX(GPA) FROM student_info);