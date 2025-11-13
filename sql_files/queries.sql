-- ==============================================
-- 10 MEANINGFUL SQL QUERIES FOR UNIVERSITY DATABASE
-- ==============================================

-- ==============================================
-- QUERY 1: Student Course Schedule with Location Details
-- Purpose: Get a complete schedule for a specific student including course names, locations, and time slots.
-- ==============================================
SELECT 
    s.fname || ' ' || s.lname AS student_name,
    c.courseName,
    c.courseId,
    sec.timeSlot,
    sec.semester,
    l.buildingName || ' Room ' || l.roomNumber AS location,
    e.grade
FROM STUDENT s
JOIN ENROLLED_IN e ON s.studentId = e.studentId
JOIN SECTION sec ON e.sectionNum = sec.sectionNum
JOIN COURSE c ON sec.courseId = c.courseId
JOIN LOCATION l ON sec.locationID = l.locationID
WHERE s.studentId = 'S001'
ORDER BY sec.semester, sec.timeSlot;


-- ==============================================
-- QUERY 2: Faculty Teaching Load
-- Purpose: Show how many courses each faculty member is teaching and their department.
-- ==============================================
SELECT 
    f.fname || ' ' || f.lname AS faculty_name,
    f.email,
    d.deptName,
    COUNT(c.courseId) AS courses_taught,
    SUM(c.credits) AS total_credits,
    CASE WHEN f.chair = 1 THEN 'Yes' ELSE 'No' END AS is_chair
FROM FACULTY f
JOIN DEPARTMENT d ON f.departmentId = d.departmentId
LEFT JOIN COURSE c ON f.facultyId = c.facultyId
GROUP BY f.facultyId
ORDER BY courses_taught DESC;


-- ==============================================
-- QUERY 3: Department Enrollment Statistics
-- Purpose: Analyze which departments/majors have the most students enrolled.
-- ==============================================
SELECT 
    m.majorName,
    d.deptName,
    COUNT(DISTINCT s.studentId) AS total_students,
    l.buildingName AS dept_location
FROM MAJOR m
JOIN DEPARTMENT d ON m.majorId = d.majorId
LEFT JOIN STUDENT s ON m.majorId = s.majorID
JOIN LOCATION l ON d.locationID = l.locationID
GROUP BY m.majorId
ORDER BY total_students DESC;


-- ==============================================
-- QUERY 4: Course Enrollment Report
-- Purpose: See which courses are most popular and their enrollment numbers.
-- ==============================================
SELECT 
    c.courseId,
    c.courseName,
    d.deptName,
    f.fname || ' ' || f.lname AS instructor,
    COUNT(e.enrollmentId) AS enrolled_students,
    c.credits,
    sec.semester
FROM COURSE c
JOIN DEPARTMENT d ON c.departmentId = d.departmentId
JOIN FACULTY f ON c.facultyId = f.facultyId
JOIN SECTION sec ON c.courseId = sec.courseId
LEFT JOIN ENROLLED_IN e ON sec.sectionNum = e.sectionNum
GROUP BY c.courseId, sec.semester
ORDER BY enrolled_students DESC;


-- ==============================================
-- QUERY 5: Students with High GPA (All A grades)
-- Purpose: Identify top-performing students who received 'A' grades in their enrolled courses.
-- ==============================================
SELECT 
    s.studentId,
    s.fname || ' ' || s.lname AS student_name,
    s.email,
    m.majorName,
    e.grade,
    c.courseName
FROM STUDENT s
JOIN MAJOR m ON s.majorID = m.majorId
JOIN ENROLLED_IN e ON s.studentId = e.studentId
JOIN SECTION sec ON e.sectionNum = sec.sectionNum
JOIN COURSE c ON sec.courseId = c.courseId
WHERE e.grade = 'A'
ORDER BY s.lname, s.fname;


-- ==============================================
-- QUERY 6: Building Utilization by Semester
-- Purpose: See which buildings are most utilized for classes in each semester.
-- ==============================================
SELECT 
    l.buildingName,
    sec.semester,
    COUNT(DISTINCT sec.sectionNum) AS sections_held,
    COUNT(DISTINCT sec.courseId) AS unique_courses,
    COUNT(DISTINCT e.studentId) AS total_students
FROM LOCATION l
JOIN SECTION sec ON l.locationID = sec.locationID
LEFT JOIN ENROLLED_IN e ON sec.sectionNum = e.sectionNum
GROUP BY l.buildingName, sec.semester
ORDER BY sec.semester, sections_held DESC;


-- ==============================================
-- QUERY 7: Department Chair Contact Information
-- Purpose: Get contact details for all department chairs for administrative purposes.
-- ==============================================
SELECT 
    d.deptName,
    f.fname || ' ' || f.lname AS chair_name,
    f.email,
    l.buildingName || ' Room ' || l.roomNumber AS office_location,
    m.majorName
FROM FACULTY f
JOIN DEPARTMENT d ON f.departmentId = d.departmentId
JOIN LOCATION l ON d.locationID = l.locationID
JOIN MAJOR m ON d.majorId = m.majorId
WHERE f.chair = 1
ORDER BY d.deptName;


-- ==============================================
-- QUERY 8: Students Enrolled in Spring 2026 Courses
-- Purpose: Find all students taking classes in a specific semester for registration verification.
-- ==============================================
SELECT DISTINCT
    s.studentId,
    s.fname || ' ' || s.lname AS student_name,
    s.email,
    m.majorName,
    COUNT(e.enrollmentId) AS courses_enrolled,
    s.enrollment_date
FROM STUDENT s
JOIN ENROLLED_IN e ON s.studentId = e.studentId
JOIN SECTION sec ON e.sectionNum = sec.sectionNum
JOIN MAJOR m ON s.majorID = m.majorId
WHERE sec.semester = 'SP2026'
GROUP BY s.studentId
ORDER BY courses_enrolled DESC, s.lname;


-- ==============================================
-- QUERY 9: Cross-Department Course Analysis
-- Purpose: Identify which departments offer courses and their credit distribution.
-- ==============================================
SELECT 
    d.deptName,
    COUNT(c.courseId) AS total_courses,
    AVG(c.credits) AS avg_credits,
    MIN(c.credits) AS min_credits,
    MAX(c.credits) AS max_credits,
    SUM(c.credits) AS total_credits_offered
FROM DEPARTMENT d
LEFT JOIN COURSE c ON d.departmentId = c.departmentId
GROUP BY d.departmentId
HAVING COUNT(c.courseId) > 0
ORDER BY total_courses DESC;


-- ==============================================
-- QUERY 10: Student Age and Enrollment Analysis
-- Purpose: Analyze student demographics and enrollment patterns by age group.
-- ==============================================
SELECT 
    s.studentId,
    s.fname || ' ' || s.lname AS student_name,
    s.dob,
    s.enrollment_date,
    m.majorName,
    julianday('now') - julianday(substr(s.dob, 7, 4) || '-' || 
        substr(s.dob, 1, 2) || '-' || substr(s.dob, 4, 2)) / 365.25 AS approximate_age,
    COUNT(e.enrollmentId) AS total_enrollments
FROM STUDENT s
JOIN MAJOR m ON s.majorID = m.majorId
LEFT JOIN ENROLLED_IN e ON s.studentId = e.studentId
GROUP BY s.studentId
ORDER BY approximate_age DESC;
