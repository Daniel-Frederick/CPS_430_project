package db

import (
	"log"
)

// InsertDummyData populates initial data into all tables
func InsertDummyData() {
	log.Println("Inserting dummy data...")

	// Insert in order of dependencies
	if err := insertMajors(); err != nil {
		log.Printf("⚠️ Failed to insert majors: %v", err)
	}

	if err := insertLocations(); err != nil {
		log.Printf("⚠️ Failed to insert locations: %v", err)
	}

	if err := insertDepartments(); err != nil {
		log.Printf("⚠️ Failed to insert departments: %v", err)
	}

	if err := insertFaculty(); err != nil {
		log.Printf("⚠️ Failed to insert faculty: %v", err)
	}

	if err := insertCourses(); err != nil {
		log.Printf("⚠️ Failed to insert courses: %v", err)
	}

	if err := insertSections(); err != nil {
		log.Printf("⚠️ Failed to insert sections: %v", err)
	}

	if err := insertStudents(); err != nil {
		log.Printf("⚠️ Failed to insert students: %v", err)
	}

	if err := insertEnrollments(); err != nil {
		log.Printf("⚠️ Failed to insert enrollments: %v", err)
	}

	log.Println("Dummy data inserted successfully")
}

func insertMajors() error {
	stmt := `INSERT OR IGNORE INTO MAJOR (majorId, majorName) VALUES
		('M001', 'Computer Science'),
		('M002', 'Mathematics'),
		('M003', 'Physics'),
		('M004', 'Chemistry'),
		('M005', 'Biology'),
		('M006', 'English'),
		('M007', 'Economics'),
		('M008', 'History'),
		('M009', 'Psychology'),
		('M010', 'Sociology'),
		('M011', 'Art'),
		('M012', 'Music'),
		('M013', 'Business'),
		('M014', 'Philosophy'),
		('M015', 'PoliticalSci'),
		('M016', 'Engineering'),
		('M017', 'Data Science'),
		('M018', 'Education'),
		('M019', 'Nursing'),
		('M020', 'Law');`

	_, err := DB.Exec(stmt)
	return err
}

func insertLocations() error {
	stmt := `INSERT OR IGNORE INTO LOCATION (locationID, buildingName, roomNumber) VALUES
		('L001', 'Science Hall', '101'),
		('L002', 'Science Hall', '102'),
		('L003', 'Math Building', '201'),
		('L004', 'Math Building', '202'),
		('L005', 'Humanities', '301'),
		('L006', 'Humanities', '302'),
		('L007', 'Business Center', '401'),
		('L008', 'Business Center', '402'),
		('L009', 'Library', '500'),
		('L010', 'Engineering Lab', '600'),
		('L011', 'Music Hall', '700'),
		('L012', 'Music Hall', '701'),
		('L013', 'Art Studio', '800'),
		('L014', 'Psych Wing', '900'),
		('L015', 'Education Center', '1001'),
		('L016', 'Health Sciences', '1100'),
		('L017', 'Law Building', '1200'),
		('L018', 'Philosophy Tower', '1300'),
		('L019', 'History Annex', '1400'),
		('L020', 'Economics Hall', '1500');`

	_, err := DB.Exec(stmt)
	return err
}

func insertDepartments() error {
	stmt := `INSERT OR IGNORE INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES
		('D001', 'M001', 'CS Dept', 'L001'),
		('D002', 'M002', 'Math Dept', 'L003'),
		('D003', 'M003', 'Physics Dept', 'L002'),
		('D004', 'M004', 'Chemistry Dept', 'L002'),
		('D005', 'M005', 'Biology Dept', 'L001'),
		('D006', 'M006', 'English Dept', 'L005'),
		('D007', 'M007', 'Economics Dept', 'L020'),
		('D008', 'M008', 'History Dept', 'L019'),
		('D009', 'M009', 'Psychology Dept', 'L014'),
		('D010', 'M010', 'Sociology Dept', 'L015'),
		('D011', 'M011', 'Art Dept', 'L013'),
		('D012', 'M012', 'Music Dept', 'L011'),
		('D013', 'M013', 'Business Dept', 'L007'),
		('D014', 'M014', 'Philosophy Dept', 'L018'),
		('D015', 'M015', 'Political Sci Dept', 'L019'),
		('D016', 'M016', 'Engineering Dept', 'L010'),
		('D017', 'M017', 'Data Science Dept', 'L001'),
		('D018', 'M018', 'Education Dept', 'L015'),
		('D019', 'M019', 'Nursing Dept', 'L016'),
		('D020', 'M020', 'Law Dept', 'L017');`

	_, err := DB.Exec(stmt)
	return err
}

func insertFaculty() error {
	stmt := `INSERT OR IGNORE INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES
		('F001', 'alice@uni.edu', 'Alice', 'Smith', 'D001', 1),
		('F002', 'bob@uni.edu', 'Bob', 'Johnson', 'D002', 0),
		('F003', 'carol@uni.edu', 'Carol', 'Williams', 'D003', 0),
		('F004', 'david@uni.edu', 'David', 'Brown', 'D004', 0),
		('F005', 'eve@uni.edu', 'Eve', 'Jones', 'D005', 1),
		('F006', 'frank@uni.edu', 'Frank', 'Garcia', 'D006', 0),
		('F007', 'grace@uni.edu', 'Grace', 'Martinez', 'D007', 1),
		('F008', 'henry@uni.edu', 'Henry', 'Lopez', 'D008', 0),
		('F009', 'irene@uni.edu', 'Irene', 'Gonzalez', 'D009', 0),
		('F010', 'jack@uni.edu', 'Jack', 'Wilson', 'D010', 0),
		('F011', 'karen@uni.edu', 'Karen', 'Anderson', 'D011', 1),
		('F012', 'leo@uni.edu', 'Leo', 'Thomas', 'D012', 0),
		('F013', 'mia@uni.edu', 'Mia', 'Taylor', 'D013', 1),
		('F014', 'nick@uni.edu', 'Nick', 'Moore', 'D014', 0),
		('F015', 'olivia@uni.edu', 'Olivia', 'Jackson', 'D015', 0),
		('F016', 'paul@uni.edu', 'Paul', 'White', 'D016', 0),
		('F017', 'quinn@uni.edu', 'Quinn', 'Harris', 'D017', 1),
		('F018', 'rachel@uni.edu', 'Rachel', 'Clark', 'D018', 0),
		('F019', 'sam@uni.edu', 'Sam', 'Lewis', 'D019', 0),
		('F020', 'tina@uni.edu', 'Tina', 'Young', 'D020', 1);`

	_, err := DB.Exec(stmt)
	return err
}

func insertCourses() error {
	stmt := `INSERT OR IGNORE INTO COURSE (courseId, departmentId, sectionNum, credits, courseName, facultyId) VALUES
		('C001', 'D001', 1, 3, 'Intro to CS', 'F001'),
		('C002', 'D001', 1, 3, 'Data Structures', 'F001'),
		('C003', 'D002', 1, 4, 'Calculus I', 'F002'),
		('C004', 'D003', 1, 4, 'Physics I', 'F003'),
		('C005', 'D004', 1, 4, 'Chemistry I', 'F004'),
		('C006', 'D005', 1, 3, 'Biology I', 'F005'),
		('C007', 'D006', 1, 3, 'English Lit', 'F006'),
		('C008', 'D007', 1, 3, 'Microeconomics', 'F007'),
		('C009', 'D008', 1, 3, 'World History', 'F008'),
		('C010', 'D009', 1, 3, 'Psychology Basics', 'F009'),
		('C011', 'D010', 1, 3, 'Intro to Sociology', 'F010'),
		('C012', 'D011', 1, 3, 'Art History', 'F011'),
		('C013', 'D012', 1, 3, 'Music Theory', 'F012'),
		('C014', 'D013', 1, 3, 'Accounting', 'F013'),
		('C015', 'D014', 1, 3, 'Ethics', 'F014'),
		('C016', 'D015', 1, 3, 'Political Theory', 'F015'),
		('C017', 'D016', 1, 4, 'Engineering Basics', 'F016'),
		('C018', 'D017', 1, 3, 'Data Analysis', 'F017'),
		('C019', 'D018', 1, 3, 'Teaching Methods', 'F018'),
		('C020', 'D019', 1, 4, 'Anatomy', 'F019');`

	_, err := DB.Exec(stmt)
	return err
}

func insertSections() error {
	stmt := `INSERT OR IGNORE INTO SECTION (sectionNum, courseId, locationID, timeSlot, semester) VALUES
		(1, 'C001', 'L001', '09:00', 'FA2025'),
		(2, 'C002', 'L001', '10:00', 'FA2025'),
		(3, 'C003', 'L003', '11:00', 'FA2025'),
		(4, 'C004', 'L002', '12:00', 'FA2025'),
		(5, 'C005', 'L002', '13:00', 'FA2025'),
		(6, 'C006', 'L001', '14:00', 'FA2025'),
		(7, 'C007', 'L005', '15:00', 'FA2025'),
		(8, 'C008', 'L020', '09:00', 'SP2026'),
		(9, 'C009', 'L019', '10:00', 'SP2026'),
		(10, 'C010', 'L014', '11:00', 'SP2026'),
		(11, 'C011', 'L015', '12:00', 'SP2026'),
		(12, 'C012', 'L013', '13:00', 'SP2026'),
		(13, 'C013', 'L011', '14:00', 'SP2026'),
		(14, 'C014', 'L007', '15:00', 'SP2026'),
		(15, 'C015', 'L018', '16:00', 'SP2026'),
		(16, 'C016', 'L010', '17:00', 'SP2026'),
		(17, 'C017', 'L001', '18:00', 'SP2026'),
		(18, 'C018', 'L001', '09:00', 'FA2026'),
		(19, 'C019', 'L015', '10:00', 'FA2026'),
		(20, 'C020', 'L016', '11:00', 'FA2026');`

	_, err := DB.Exec(stmt)
	return err
}

func insertStudents() error {
	stmt := `INSERT OR IGNORE INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
		('John', 'Doe', 'john@uni.edu', 'A', '10/15/2002', '2021-08-25', '123 Main St', 'S001', 'M001'),
		('Jane', 'Smith', 'jane@uni.edu', 'B+', '02/20/2003', '2022-08-25', '234 Oak St', 'S002', 'M002'),
		('Mike', 'Brown', 'mike@uni.edu', 'A-', '05/10/2002', '2021-08-25', '345 Pine St', 'S003', 'M003'),
		('Lisa', 'Johnson', 'lisa@uni.edu', 'B', '11/30/2002', '2021-08-25', '456 Elm St', 'S004', 'M004'),
		('Tom', 'Davis', 'tom@uni.edu', 'B+', '07/12/2003', '2022-08-25', '567 Cedar St', 'S005', 'M005'),
		('Nina', 'White', 'nina@uni.edu', 'A', '01/09/2003', '2022-08-25', '678 Birch St', 'S006', 'M006'),
		('Owen', 'Lee', 'owen@uni.edu', 'B', '03/23/2003', '2022-08-25', '789 Maple St', 'S007', 'M007'),
		('Paula', 'Martinez', 'paula@uni.edu', 'A-', '08/08/2002', '2021-08-25', '890 Walnut St', 'S008', 'M008'),
		('Quinn', 'Clark', 'quinn@uni.edu', 'C+', '04/14/2003', '2022-08-25', '901 Chestnut St', 'S009', 'M009'),
		('Ruth', 'Lopez', 'ruth@uni.edu', 'A', '12/03/2002', '2021-08-25', '101 Ash St', 'S010', 'M010'),
		('Sam', 'Harris', 'sam@uni.edu', 'B', '02/14/2003', '2022-08-25', '202 Beech St', 'S011', 'M011'),
		('Tina', 'Young', 'tina@uni.edu', 'B+', '03/18/2003', '2022-08-25', '303 Fir St', 'S012', 'M012'),
		('Uma', 'King', 'uma@uni.edu', 'A-', '06/25/2003', '2022-08-25', '404 Spruce St', 'S013', 'M013'),
		('Vera', 'Allen', 'vera@uni.edu', 'B', '09/10/2002', '2021-08-25', '505 Hickory St', 'S014', 'M014'),
		('Will', 'Scott', 'will@uni.edu', 'A', '05/22/2003', '2022-08-25', '606 Redwood St', 'S015', 'M015'),
		('Xena', 'Adams', 'xena@uni.edu', 'B-', '07/19/2002', '2021-08-25', '707 Dogwood St', 'S016', 'M016'),
		('Yara', 'Bennett', 'yara@uni.edu', 'A', '01/02/2003', '2022-08-25', '808 Poplar St', 'S017', 'M017'),
		('Zack', 'Nelson', 'zack@uni.edu', 'B+', '10/05/2002', '2021-08-25', '909 Magnolia St', 'S018', 'M018'),
		('Anna', 'Turner', 'anna@uni.edu', 'A-', '11/18/2003', '2022-08-25', '100 Elm St', 'S019', 'M019'),
		('Ben', 'Wright', 'ben@uni.edu', 'A', '09/29/2002', '2021-08-25', '200 Oak St', 'S020', 'M020');`

	_, err := DB.Exec(stmt)
	return err
}

func insertEnrollments() error {
	stmt := `INSERT OR IGNORE INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, grade) VALUES
		('S001', 'E001', 1, 'A'),
		('S002', 'E002', 2, 'B+'),
		('S003', 'E003', 3, 'A-'),
		('S004', 'E004', 4, 'B'),
		('S005', 'E005', 5, 'A'),
		('S006', 'E006', 6, 'B+'),
		('S007', 'E007', 7, 'A'),
		('S008', 'E008', 8, 'C+'),
		('S009', 'E009', 9, 'A'),
		('S010', 'E010', 10, 'B'),
		('S011', 'E011', 11, 'B+'),
		('S012', 'E012', 12, 'A-'),
		('S013', 'E013', 13, 'A'),
		('S014', 'E014', 14, 'B'),
		('S015', 'E015', 15, 'A'),
		('S016', 'E016', 16, 'B+'),
		('S017', 'E017', 17, 'A-'),
		('S018', 'E018', 18, 'A'),
		('S019', 'E019', 19, 'B+'),
		('S020', 'E020', 20, 'A');`

	_, err := DB.Exec(stmt)
	return err
}
