CREATE TABLE MAJOR(
    majorId varchar2(9) PRIMARY KEY, --PK
    majorName varchar2(20)
);

CREATE TABLE LOCATION(
    locationID varchar2(9) PRIMARY KEY, --PK
    buildingName varchar2(30) not null,
    roomNumber varchar2(30) not null
);

CREATE TABLE DEPARTMENT(
    departmentId varchar2(10) PRIMARY KEY, --PK
    majorId varchar2(9), --FK
    deptName varchar2 (20),
    locationID varchar2(9) not null, --FK
    FOREIGN KEY (majorId) REFERENCES MAJOR(majorId)
        ON DELETE SET NULL,
    FOREIGN KEY (locationID) REFERENCES LOCATION(locationID)
        ON DELETE CASCADE
);

CREATE TABLE FACULTY(
    facultyId varchar2(10) PRIMARY KEY, --PK
    email varchar2(100) not null,
    fname varchar2(15) not null,
    lname varchar2(15) not null,
    departmentId varchar2(10) not null, --FK
    chair number(1) not null, -- 0 or 1 (Oracle doesn't support boolean)
    FOREIGN KEY (departmentId) REFERENCES DEPARTMENT(departmentId)
        ON DELETE CASCADE
);

CREATE TABLE STUDENT (
    studentId VARCHAR2(9) PRIMARY KEY,  -- PK
    fname VARCHAR2(15) NOT NULL,
    lname VARCHAR2(15) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    grade VARCHAR2(10) NOT NULL,
    dob DATE NOT NULL,                   -- Store date of birth as DATE type
    enrollment_date DATE NOT NULL,       -- Store enrollment date as DATE type
    address VARCHAR2(50) NOT NULL,
    majorID VARCHAR2(9),                 -- FK
    FOREIGN KEY (majorID) REFERENCES MAJOR(majorId) ON DELETE SET NULL
);

CREATE TABLE SECTION(
    sectionNum NUMBER(2,0),  -- allow section numbers up to 99
    courseId VARCHAR2(10),   -- PK
    locationID VARCHAR2(9) NOT NULL,  -- FK
    timeSlot VARCHAR2(10),   -- e.g., '08:00', '17:00'
    semester VARCHAR2(6) NOT NULL,    -- e.g., 'FA2025', 'SP2026'
    PRIMARY KEY (sectionNum, courseId),
    FOREIGN KEY (locationID) REFERENCES LOCATION(locationID)
        ON DELETE CASCADE
);

CREATE TABLE COURSE(
    courseId varchar2(10) PRIMARY KEY, --PK
    departmentId varchar2(10) not null, --FK
    credits int not null,
    courseName varchar2 (20),
    facultyId varchar2(10) not null, --FK
    FOREIGN KEY (departmentId) REFERENCES DEPARTMENT(departmentId)
        ON DELETE CASCADE,
    FOREIGN KEY (facultyId) REFERENCES FACULTY(facultyId)
        ON DELETE CASCADE
);

CREATE TABLE ENROLLED_IN(
    enrollmentId VARCHAR2(10) PRIMARY KEY, -- PK
    studentId VARCHAR2(9) NOT NULL, -- FK
    sectionNum NUMBER(2, 0) NOT NULL, -- FK, matches SECTION sectionNum precision
    courseId VARCHAR2(10) NOT NULL, -- FK
    grade VARCHAR2(2), -- like A, A-, etc.
    FOREIGN KEY (studentId) REFERENCES STUDENT(studentId)
        ON DELETE CASCADE,
    FOREIGN KEY (sectionNum, courseId) REFERENCES SECTION(sectionNum, courseId)
        ON DELETE CASCADE
);