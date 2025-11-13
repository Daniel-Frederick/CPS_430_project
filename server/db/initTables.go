package db

import (
	"log"
)

// InitializeTables creates tables and inserts dummy data
func InitializeTables() {
	statements := []string{
		// STUDENT
		`CREATE TABLE IF NOT EXISTS STUDENT (
			fname TEXT NOT NULL,
			lname TEXT NOT NULL,
			email TEXT NOT NULL,
			grade TEXT NOT NULL,
			dob TEXT NOT NULL,
			enrollment_date TEXT NOT NULL,
			address TEXT NOT NULL,
			studentId TEXT PRIMARY KEY,
			majorID TEXT
		);`,

		// MAJOR
		`CREATE TABLE IF NOT EXISTS MAJOR(
			majorId TEXT PRIMARY KEY,
			majorName TEXT
		);`,

		// SECTION
		`CREATE TABLE IF NOT EXISTS SECTION(
			sectionNum INTEGER PRIMARY KEY,
			courseId TEXT NOT NULL,
			locationID TEXT NOT NULL,
			timeSlot TEXT,
			semester TEXT NOT NULL
		);`,

		// COURSE
		`CREATE TABLE IF NOT EXISTS COURSE(
			courseId TEXT PRIMARY KEY,
			departmentId TEXT NOT NULL,
			sectionNum INTEGER NOT NULL,
			credits INTEGER NOT NULL,
			courseName TEXT,
			facultyId TEXT NOT NULL
		);`,

		// DEPARTMENT
		`CREATE TABLE IF NOT EXISTS DEPARTMENT(
			departmentId TEXT PRIMARY KEY,
			majorId TEXT,
			deptName TEXT,
			locationID TEXT NOT NULL
		);`,

		// FACULTY
		`CREATE TABLE IF NOT EXISTS FACULTY(
			facultyId TEXT PRIMARY KEY,
			email TEXT NOT NULL,
			fname TEXT NOT NULL,
			lname TEXT NOT NULL,
			departmentId TEXT NOT NULL,
			chair BOOLEAN NOT NULL
		);`,

		// ENROLLED_IN
		`CREATE TABLE IF NOT EXISTS ENROLLED_IN(
			studentId TEXT NOT NULL,
			enrollmentId TEXT PRIMARY KEY,
			sectionNum INTEGER,
			grade TEXT
		);`,

		// LOCATION
		`CREATE TABLE IF NOT EXISTS LOCATION(
			locationID TEXT PRIMARY KEY,
			buildingName TEXT NOT NULL,
			roomNumber TEXT NOT NULL
		);`,
	}

	for _, stmt := range statements {
		_, err := DB.Exec(stmt)
		if err != nil {
			log.Fatalf("❌ Failed to execute statement: %v", err)
		}
	}

	log.Println("✅ Tables verified or created successfully")

	InsertDummyData()
}

// InsertDummyData populates initial data into the tables
func InsertDummyData() {
	inserts := []string{
		// MAJOR
		`INSERT OR IGNORE INTO MAJOR (majorId, majorName) VALUES
			('M001', 'Computer Science'),
			('M002', 'Mathematics'),
			('M003', 'Biology');`,

		// DEPARTMENT
		`INSERT OR IGNORE INTO DEPARTMENT (departmentId, majorId, deptName, locationID) VALUES
			('D001', 'M001', 'CS Department', 'L001'),
			('D002', 'M002', 'Math Department', 'L002'),
			('D003', 'M003', 'Bio Department', 'L003');`,

		// LOCATION
		`INSERT OR IGNORE INTO LOCATION (locationID, buildingName, roomNumber) VALUES
			('L001', 'Science Hall', '101'),
			('L002', 'Math Building', '202'),
			('L003', 'Bio Center', '303');`,

		// FACULTY
		`INSERT OR IGNORE INTO FACULTY (facultyId, email, fname, lname, departmentId, chair) VALUES
			('F001', 'alice@uni.edu', 'Alice', 'Smith', 'D001', 1),
			('F002', 'bob@uni.edu', 'Bob', 'Johnson', 'D002', 0),
			('F003', 'carol@uni.edu', 'Carol', 'Williams', 'D003', 0);`,

		// COURSE
		`INSERT OR IGNORE INTO COURSE (courseId, departmentId, sectionNum, credits, courseName, facultyId) VALUES
			('C001', 'D001', 1, 3, 'Intro to CS', 'F001'),
			('C002', 'D002', 1, 4, 'Calculus I', 'F002'),
			('C003', 'D003', 1, 3, 'Biology Basics', 'F003');`,

		// SECTION
		`INSERT OR IGNORE INTO SECTION (sectionNum, courseId, locationID, timeSlot, semester) VALUES
			(1, 'C001', 'L001', '08:00-09:15', 'FA2025'),
			(2, 'C002', 'L002', '09:30-10:45', 'FA2025'),
			(3, 'C003', 'L003', '11:00-12:15', 'FA2025');`,

		// STUDENT
		`INSERT OR IGNORE INTO STUDENT (fname, lname, email, grade, dob, enrollment_date, address, studentId, majorID) VALUES
			('John', 'Doe', 'john.doe@uni.edu', 'A', '10/15/2002', '2021-08-23', '123 Elm St', 'S001', 'M001'),
			('Jane', 'Smith', 'jane.smith@uni.edu', 'B+', '11/02/2001', '2021-08-23', '456 Oak St', 'S002', 'M002'),
			('Tom', 'Brown', 'tom.brown@uni.edu', 'A-', '02/10/2003', '2022-01-10', '789 Pine St', 'S003', 'M003');`,

		// ENROLLED_IN
		`INSERT OR IGNORE INTO ENROLLED_IN (studentId, enrollmentId, sectionNum, grade) VALUES
			('S001', 'E001', 1, 'A'),
			('S002', 'E002', 2, 'B+'),
			('S003', 'E003', 3, 'A-');`,
	}

	for _, stmt := range inserts {
		_, err := DB.Exec(stmt)
		if err != nil {
			log.Printf("⚠️ Insert failed: %v", err)
		}
	}

	log.Println("✅ Dummy data inserted successfully")
}

