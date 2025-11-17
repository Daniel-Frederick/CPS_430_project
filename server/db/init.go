package db

import (
	"log"
)

// InitializeTables creates all database tables
func InitializeTables() {
	log.Println("Initializing database tables...")
	
	if err := createTables(); err != nil {
		log.Fatalf("Failed to create tables: %v", err)
	}
	
	log.Println("Tables verified or created successfully")
}

// createTables executes all CREATE TABLE statements
func createTables() error {
	statements := []string{
		createMajorTable,
		createLocationTable,
		createDepartmentTable,
		createFacultyTable,
		createCourseTable,
		createSectionTable,
		createStudentTable,
		createEnrolledInTable,
	}

	for _, stmt := range statements {
		if _, err := DB.Exec(stmt); err != nil {
			return err
		}
	}

	return nil
}
