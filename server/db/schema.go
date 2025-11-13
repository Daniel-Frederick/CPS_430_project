package db

// Table creation statements
const (
	createStudentTable = `CREATE TABLE IF NOT EXISTS STUDENT (
		fname TEXT NOT NULL,
		lname TEXT NOT NULL,
		email TEXT NOT NULL,
		grade TEXT NOT NULL,
		dob TEXT NOT NULL,
		enrollment_date TEXT NOT NULL,
		address TEXT NOT NULL,
		studentId TEXT PRIMARY KEY,
		majorID TEXT
	);`

	createMajorTable = `CREATE TABLE IF NOT EXISTS MAJOR(
		majorId TEXT PRIMARY KEY,
		majorName TEXT
	);`

	createSectionTable = `CREATE TABLE IF NOT EXISTS SECTION(
		sectionNum INTEGER PRIMARY KEY,
		courseId TEXT NOT NULL,
		locationID TEXT NOT NULL,
		timeSlot TEXT,
		semester TEXT NOT NULL
	);`

	createCourseTable = `CREATE TABLE IF NOT EXISTS COURSE(
		courseId TEXT PRIMARY KEY,
		departmentId TEXT NOT NULL,
		sectionNum INTEGER NOT NULL,
		credits INTEGER NOT NULL,
		courseName TEXT,
		facultyId TEXT NOT NULL
	);`

	createDepartmentTable = `CREATE TABLE IF NOT EXISTS DEPARTMENT(
		departmentId TEXT PRIMARY KEY,
		majorId TEXT,
		deptName TEXT,
		locationID TEXT NOT NULL
	);`

	createFacultyTable = `CREATE TABLE IF NOT EXISTS FACULTY(
		facultyId TEXT PRIMARY KEY,
		email TEXT NOT NULL,
		fname TEXT NOT NULL,
		lname TEXT NOT NULL,
		departmentId TEXT NOT NULL,
		chair BOOLEAN NOT NULL
	);`

	createEnrolledInTable = `CREATE TABLE IF NOT EXISTS ENROLLED_IN(
		studentId TEXT NOT NULL,
		enrollmentId TEXT PRIMARY KEY,
		sectionNum INTEGER,
		grade TEXT
	);`

	createLocationTable = `CREATE TABLE IF NOT EXISTS LOCATION(
		locationID TEXT PRIMARY KEY,
		buildingName TEXT NOT NULL,
		roomNumber TEXT NOT NULL
	);`
)
