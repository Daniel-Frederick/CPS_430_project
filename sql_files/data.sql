-- ======================
-- MAJOR
-- ======================
INSERT ALL
  INTO MAJOR (majorId, majorName) VALUES ('M001', 'Computer Science')
  INTO MAJOR (majorId, majorName) VALUES ('M002', 'Mathematics')
  INTO MAJOR (majorId, majorName) VALUES ('M003', 'Physics')
  INTO MAJOR (majorId, majorName) VALUES ('M004', 'Chemistry')
  INTO MAJOR (majorId, majorName) VALUES ('M005', 'Biology')
  INTO MAJOR (majorId, majorName) VALUES ('M006', 'English')
  INTO MAJOR (majorId, majorName) VALUES ('M007', 'Economics')
  INTO MAJOR (majorId, majorName) VALUES ('M008', 'History')
  INTO MAJOR (majorId, majorName) VALUES ('M009', 'Psychology')
  INTO MAJOR (majorId, majorName) VALUES ('M010', 'Sociology')
  INTO MAJOR (majorId, majorName) VALUES ('M011', 'Art')
  INTO MAJOR (majorId, majorName) VALUES ('M012', 'Music')
  INTO MAJOR (majorId, majorName) VALUES ('M013', 'Business')
  INTO MAJOR (majorId, majorName) VALUES ('M014', 'Philosophy')
  INTO MAJOR (majorId, majorName) VALUES ('M015', 'PoliticalSci')
  INTO MAJOR (majorId, majorName) VALUES ('M016', 'Engineering')
  INTO MAJOR (majorId, majorName) VALUES ('M017', 'Data Science')
  INTO MAJOR (majorId, majorName) VALUES ('M018', 'Education')
  INTO MAJOR (majorId, majorName) VALUES ('M019', 'Nursing')
  INTO MAJOR (majorId, majorName) VALUES ('M020', 'Law')
SELECT * FROM dual;

-- ======================
-- LOCATION
-- ======================
INSERT ALL
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L001', 'Science Hall', '101')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L002', 'Science Hall', '102')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L003', 'Math Building', '201')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L004', 'Math Building', '202')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L005', 'Humanities', '301')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L006', 'Humanities', '302')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L007', 'Business Center', '401')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L008', 'Business Center', '402')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L009', 'Library', '500')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L010', 'Engineering Lab', '600')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L011', 'Music Hall', '700')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L012', 'Music Hall', '701')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L013', 'Art Studio', '800')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L014', 'Psych Wing', '900')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L015', 'Education Center', '1001')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L016', 'Health Sciences', '1100')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L017', 'Law Building', '1200')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L018', 'Philosophy Tower', '1300')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L019', 'History Annex', '1400')
  INTO LOCATION (locationID, buildingName, roomNumber) VALUES ('L020', 'Economics Hall', '1500')
SELECT * FROM dual;


-- ======================
-- DEPARTMENT
-- ======================
INSERT ALL
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D001', 'M001', 'CS Dept', 'L001')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D002', 'M002', 'Math Dept', 'L003')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D003', 'M003', 'Physics Dept', 'L002')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D004', 'M004', 'Chemistry Dept', 'L002')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D005', 'M005', 'Biology Dept', 'L001')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D006', 'M006', 'English Dept', 'L005')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D007', 'M007', 'Economics Dept', 'L020')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D008', 'M008', 'History Dept', 'L019')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D009', 'M009', 'Psychology Dept', 'L014')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D010', 'M010', 'Sociology Dept', 'L015')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D011', 'M011', 'Art Dept', 'L013')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D012', 'M012', 'Music Dept', 'L011')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D013', 'M013', 'Business Dept', 'L007')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D014', 'M014', 'Philosophy Dept', 'L018')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D015', 'M015', 'Political Sci Dept', 'L019')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D016', 'M016', 'Engineering Dept', 'L010')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D017', 'M017', 'Data Science Dept', 'L001')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D018', 'M018', 'Education Dept', 'L015')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D019', 'M019', 'Nursing Dept', 'L016')
  INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES ('D020', 'M020', 'Law Dept', 'L017')
SELECT * FROM dual;


-- ======================
-- FACULTY
-- ======================
INSERT ALL
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F001', 'alice@uni.edu', 'Alice', 'Smith', 'D001', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F002', 'bob@uni.edu', 'Bob', 'Johnson', 'D002', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F003', 'carol@uni.edu', 'Carol', 'Williams', 'D003', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F004', 'david@uni.edu', 'David', 'Brown', 'D004', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F005', 'eve@uni.edu', 'Eve', 'Jones', 'D005', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F006', 'frank@uni.edu', 'Frank', 'Garcia', 'D006', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F007', 'grace@uni.edu', 'Grace', 'Martinez', 'D007', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F008', 'henry@uni.edu', 'Henry', 'Lopez', 'D008', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F009', 'irene@uni.edu', 'Irene', 'Gonzalez', 'D009', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F010', 'jack@uni.edu', 'Jack', 'Wilson', 'D010', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F011', 'karen@uni.edu', 'Karen', 'Anderson', 'D011', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F012', 'leo@uni.edu', 'Leo', 'Thomas', 'D012', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F013', 'mia@uni.edu', 'Mia', 'Taylor', 'D013', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F014', 'nick@uni.edu', 'Nick', 'Moore', 'D014', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F015', 'olivia@uni.edu', 'Olivia', 'Jackson', 'D015', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F016', 'paul@uni.edu', 'Paul', 'White', 'D016', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F017', 'quinn@uni.edu', 'Quinn', 'Harris', 'D017', 1)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F018', 'rachel@uni.edu', 'Rachel', 'Clark', 'D018', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F019', 'sam@uni.edu', 'Sam', 'Lewis', 'D019', 0)
  INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES ('F020', 'tina@uni.edu', 'Tina', 'Young', 'D020', 1)
SELECT * FROM dual;

-- ======================
-- COURSE
-- ======================
INSERT ALL
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C001', 'D001', 3, 'Intro to CS', 'F001')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C002', 'D001', 3, 'Data Structures', 'F001')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C003', 'D002', 4, 'Calculus I', 'F002')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C004', 'D003', 4, 'Physics I', 'F003')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C005', 'D004', 4, 'Chemistry I', 'F004')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C006', 'D005', 3, 'Biology I', 'F005')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C007', 'D006', 3, 'English Lit', 'F006')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C008', 'D007', 3, 'Microeconomics', 'F007')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C009', 'D008', 3, 'World History', 'F008')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C010', 'D009', 3, 'Psychology Basics', 'F009')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C011', 'D010', 3, 'Intro to Sociology', 'F010')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C012', 'D011', 3, 'Art History', 'F011')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C013', 'D012', 3, 'Music Theory', 'F012')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C014', 'D013', 3, 'Accounting', 'F013')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C015', 'D014', 3, 'Ethics', 'F014')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C016', 'D015', 3, 'Political Theory', 'F015')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C017', 'D016', 4, 'Engineering Basics', 'F016')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C018', 'D017', 3, 'Data Analysis', 'F017')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C019', 'D018', 3, 'Teaching Methods', 'F018')
    INTO COURSE (courseId, departmentId, credits, courseName, facultyId) VALUES ('C020', 'D019', 4, 'Anatomy', 'F019')
SELECT * FROM dual;

-- ======================
-- SECTION
-- ======================
INSERT ALL
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C001', 'L001', '09:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C002', 'L001', '10:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C003', 'L003', '11:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C004', 'L002', '12:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C005', 'L002', '13:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C006', 'L001', '14:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C007', 'L005', '15:00', 'FA2025')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C008', 'L020', '09:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C009', 'L019', '10:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C010', 'L014', '11:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C011', 'L015', '12:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C012', 'L013', '13:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C013', 'L011', '14:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C014', 'L007', '15:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C015', 'L018', '16:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C016', 'L010', '17:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C017', 'L001', '18:00', 'SP2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C018', 'L001', '09:00', 'FA2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C019', 'L015', '10:00', 'FA2026')
    INTO SECTION (courseId, locationID, timeSlot, semester) VALUES ('C020', 'L016', '11:00', 'FA2026')
SELECT * FROM dual;

-- ======================
-- STUDENT
-- ======================
INSERT ALL
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('John', 'Doe', 'john@uni.edu', 'A', TO_DATE('2002-10-15', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '123 Main St', 'S001', 'M001')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Jane', 'Smith', 'jane@uni.edu', 'B+', TO_DATE('2003-02-20', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '234 Oak St', 'S002', 'M002')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Mike', 'Brown', 'mike@uni.edu', 'A-', TO_DATE('2002-05-10', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '345 Pine St', 'S003', 'M003')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Lisa', 'Johnson', 'lisa@uni.edu', 'B', TO_DATE('2002-11-30', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '456 Elm St', 'S004', 'M004')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Tom', 'Davis', 'tom@uni.edu', 'B+', TO_DATE('2003-07-12', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '567 Cedar St', 'S005', 'M005')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Nina', 'White', 'nina@uni.edu', 'A', TO_DATE('2003-01-09', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '678 Birch St', 'S006', 'M006')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Owen', 'Lee', 'owen@uni.edu', 'B', TO_DATE('2003-03-23', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '789 Maple St', 'S007', 'M007')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Paula', 'Martinez', 'paula@uni.edu', 'A-', TO_DATE('2002-08-08', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '890 Walnut St', 'S008', 'M008')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Quinn', 'Clark', 'quinn@uni.edu', 'C+', TO_DATE('2003-04-14', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '901 Chestnut St', 'S009', 'M009')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Ruth', 'Lopez', 'ruth@uni.edu', 'A', TO_DATE('2002-12-03', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '101 Ash St', 'S010', 'M010')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Sam', 'Harris', 'sam@uni.edu', 'B', TO_DATE('2003-02-14', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '202 Beech St', 'S011', 'M011')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Tina', 'Young', 'tina@uni.edu', 'B+', TO_DATE('2003-03-18', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '303 Fir St', 'S012', 'M012')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Uma', 'King', 'uma@uni.edu', 'A-', TO_DATE('2003-06-25', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '404 Spruce St', 'S013', 'M013')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Vera', 'Allen', 'vera@uni.edu', 'B', TO_DATE('2002-09-10', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '505 Hickory St', 'S014', 'M014')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Will', 'Scott', 'will@uni.edu', 'A', TO_DATE('2003-05-22', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '606 Redwood St', 'S015', 'M015')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Xena', 'Adams', 'xena@uni.edu', 'B-', TO_DATE('2002-07-19', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '707 Dogwood St', 'S016', 'M016')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Yara', 'Bennett', 'yara@uni.edu', 'A', TO_DATE('2003-01-02', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '808 Poplar St', 'S017', 'M017')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Zack', 'Nelson', 'zack@uni.edu', 'B+', TO_DATE('2002-10-05', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '909 Magnolia St', 'S018', 'M018')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Anna', 'Turner', 'anna@uni.edu', 'A-', TO_DATE('2003-11-18', 'YYYY-MM-DD'), TO_DATE('2022-08-25', 'YYYY-MM-DD'), '100 Elm St', 'S019', 'M019')
  INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
    ('Ben', 'Wright', 'ben@uni.edu', 'A', TO_DATE('2002-09-29', 'YYYY-MM-DD'), TO_DATE('2021-08-25', 'YYYY-MM-DD'), '200 Oak St', 'S020', 'M020')
SELECT * FROM dual;


-- ======================
-- ENROLLED_IN
-- ======================
INSERT ALL
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S001', 'E001', 1, 'C001', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S002', 'E002', 2, 'C002', 'B+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S003', 'E003', 3, 'C003', 'A-')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S004', 'E004', 4, 'C004', 'B')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S005', 'E005', 5, 'C005', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S006', 'E006', 6, 'C006', 'B+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S007', 'E007', 7, 'C007', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S008', 'E008', 8, 'C008', 'C+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S009', 'E009', 9, 'C009', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S010', 'E010', 10, 'C010', 'B')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S011', 'E011', 11, 'C011', 'B+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S012', 'E012', 12, 'C012', 'A-')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S013', 'E013', 13, 'C013', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S014', 'E014', 14, 'C014', 'B')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S015', 'E015', 15, 'C015', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S016', 'E016', 16, 'C016', 'B+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S017', 'E017', 17, 'C017', 'A-')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S018', 'E018', 18, 'C018', 'A')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S019', 'E019', 19, 'C019', 'B+')
  INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, courseId, grade) VALUES ('S020', 'E020', 20, 'C020', 'A')
SELECT * FROM dual;


