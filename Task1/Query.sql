
-- Table 1: StudentInfo
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(20),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(255)
);

-- Table 2: CoursesInfo
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

-- Table 3: EnrollmentInfo
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

-- Adding data to StudentInfo
INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'Alice Johnson', '2000-03-12', '1234567890', 'alice.johnson@example.com', '123 Apple St'),
(2, 'Bob Smith', '1999-06-25', '2345678901', 'bob.smith@example.com', '456 Orange Ave'),
(3, 'Carol Lee', '2001-11-03', '3456789012', 'carol.lee@example.com', '789 Banana Blvd'),
(4, 'David Brown', '2000-01-15', '4567890123', 'david.brown@example.com', '321 Pine Rd'),
(5, 'Eva Green', '1998-12-05', '5678901234', 'eva.green@example.com', '654 Cherry Ln');

-- Adding data to CoursesInfo
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(101, 'Database Systems', 'Dr. Stone'),
(102, 'Algorithms', 'Prof. Alan'),
(103, 'Data Structures', 'Dr. Bell'),
(104, 'Operating Systems', 'Prof. Grey');

-- Adding data to EnrollmentInfo
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) VALUES
(1001, 1, 101, 'Enrolled'),
(1002, 1, 102, 'Enrolled'),
(1003, 2, 101, 'Enrolled'),
(1004, 3, 103, 'Enrolled'),
(1005, 3, 104, 'Enrolled'),
(1006, 4, 102, 'Enrolled'),
(1007, 5, 104, 'Enrolled');

-- 3) Retrieve the Student Information

-- a) Retrieve student details: student name, contact information, and enrollment status
SELECT 
    s.STU_NAME,
    s.PHONE_NO,
    s.EMAIL_ID,
    s.ADDRESS,
    GROUP_CONCAT(e.ENROLL_STATUS SEPARATOR ', ') AS enrollment_statuses
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e ON s.STU_ID = e.STU_ID
GROUP BY
    s.STU_ID, s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, s.ADDRESS
ORDER BY
    s.STU_NAME;

-- b) Retrieve list of courses in which a specific student (example STU_ID = 1) is enrolled
SELECT 
    s.STU_NAME,
    GROUP_CONCAT(c.COURSE_NAME SEPARATOR ', ') AS enrolled_courses
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e ON s.STU_ID = e.STU_ID
JOIN 
    CoursesInfo c ON e.COURSE_ID = c.COURSE_ID
WHERE 
    s.STU_NAME = 'Alice Johnson'
    AND e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    s.STU_ID, s.STU_NAME;

-- c) Retrieve course information: course name and instructor information
SELECT 
    COURSE_NAME,
    COURSE_INSTRUCTOR_NAME
FROM 
    CoursesInfo;

-- d) Retrieve course information for a specific course (example COURSE_ID = 101)
SELECT * FROM 
    CoursesInfo
WHERE 
    COURSE_ID = 102;

-- e) Retrieve course information for multiple courses (example COURSE_ID IN 101,103)
SELECT 
    *
FROM 
    CoursesInfo
WHERE 
    COURSE_ID IN (101, 103);

-- f) Test the queries to ensure accurate retrieval of student information (execute the queries and verify the results against the expected output)
-- ALL QUERIES TESTED

-- 4. Reporting and Analytics (Using joining queries)

-- a) Retrieve the number of students enrolled in each course
SELECT 
    c.COURSE_NAME,
    COUNT(e.STU_ID) AS Number_of_Students
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_NAME;

-- b) Retrieve the list of students enrolled in a specific course (example COURSE_ID = 101)
SELECT 
    c.COURSE_NAME AS course_name,
    GROUP_CONCAT(s.STU_NAME SEPARATOR ', ') AS list_of_students
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
JOIN 
    StudentInfo s ON e.STU_ID = s.STU_ID
WHERE 
    c.COURSE_NAME = 'Algorithms'
    AND e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_NAME;

-- c) Retrieve the count of enrolled students for each instructor
SELECT 
    c.COURSE_INSTRUCTOR_NAME,
    COUNT(e.STU_ID) AS Number_of_Students
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_INSTRUCTOR_NAME;

-- d) Retrieve the list of students who are enrolled in multiple courses
SELECT 
    s.STU_NAME,
    COUNT(e.COURSE_ID) AS number_of_courses
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e ON s.STU_ID = e.STU_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    s.STU_ID, s.STU_NAME
HAVING 
    COUNT(e.COURSE_ID) > 1;

-- e) Retrieve the courses that have the highest number of enrolled students (ordered descending)
SELECT 
    c.COURSE_NAME,
    COUNT(e.STU_ID) AS Number_of_Students
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_NAME
ORDER BY 
    Number_of_Students DESC;