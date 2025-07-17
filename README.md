# SQL Capstone Project

## Overview
This repository contains solutions for the **SQL Capstone Project A**, covering multiple database scenarios implemented in **MySQL**. The project consists of:
- Academic Management System
- Student Database Management System
- Event Management System
- OLAP Operations on Sales Data

Each task includes database creation, data insertion, various SQL queries for data retrieval, reporting, and analytics.

---

## Project Tasks

###  Task 1: Academic Management System
- **Objective:** Design a system to manage student and course enrollment data.
- **Tables Created:** `StudentInfo`, `CoursesInfo`, `EnrollmentInfo`
- **Key Queries Implemented:**
  - Retrieve student details with enrollment status
  - List courses for a specific student
  - Retrieve all courses, specific course, multiple courses
  - Analytics:
    - Number of students per course
    - Students per course with names
    - Students enrolled in multiple courses
    - Courses with the highest number of enrollments
    - Count of enrolled students per instructor

---

###  Task 2: Student Database Management System
- **Objective:** Create and manage a student academic database with analytics.
- **Database:** `student_database`
- **Table:** `student_table` (renamed to `student_info`)
- **Operations Performed:**
  - Inserted 10 sample student records
  - Queries to retrieve:
    - All students sorted by grade descending
    - Male students
    - Students with GPA less than 5.0
    - Names and ages of students with grade 'B'
    - Student with the highest GPA
  - Updates: Email and grade for a student
  - Grouped average GPA by department and gender
  - Table renamed to `student_info`

---

###  Task 3: Event Management System
- **Objective:** Create a system to manage events, attendees, and registrations.
- **Database:** `EventsManagement`
- **Tables:** `Events`, `Attendees`, `Registrations`
- **Tasks Completed:**
  - Inserted event, attendee, and registration data
  - CRUD operations:
    - Add, update, delete events
    - Add attendees and register them to events
  - Queries:
    - Retrieve all event information
    - Attendee list for a specific event
    - Number of attendees per event
    - Total sales (registration amounts) per event

---

###  Task 4: OLAP Operations on Sales Data
- **Objective:** Analyze sales data using OLAP techniques.
- **Database:** `SalesData`
- **Table:** `sales_sample`
- **OLAP Operations Implemented:**
  - **Drill Down:** Summarized sales by region and product
  - **Rollup:** Summarized sales by region and product with intermediate totals
  - **Cube:** Simulated cube using UNIONs (since MySQL lacks direct `CUBE` support)
  - **Slice:** Filtered sales data for a specific region or date range
  - **Dice:** Filtered data based on specific products, regions, and date range

 ---
 
 ## Technologies Used
- **Database:** MySQL
- **Environment:** MySQL Workbench
- **Concepts:** Joins, Grouping, Aggregations, Rollup, Cube (via UNIONs), Slice, Dice, CRUD operations

---

- ##  Author
- **Name:** Ankur Dwivedi
