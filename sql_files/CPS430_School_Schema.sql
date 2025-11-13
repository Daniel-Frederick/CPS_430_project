CREATE TABLE STUDENT (
  fname    varchar2(15) not null,
  lname    varchar2(15) not null,
  email      varchar2(100) not null,
  grade      varchar2(10) not null,
  dob varchar2(10) not null, -- like 10/15/2002
  enrollment_date    date not null,
  address  varchar2(50) not null,
  studentId varchar2(9) not null, --PK
  majorID varchar2(9), --FK
);

CREATE TABLE MAJOR(
    majorId varchar2(9), --PK
    majorName varchar2(20),

);

CREATE TABLE SECTION(
    sectionNum number(1,0) not null, --PK
    courseId varchar2(10) not null,
    locationID varchar2(9) not null, --FK
    timeSlot varchar2(10), --8:00AM - 9:15AM
    semester varchar2(6), not null, -- like FA2025, SP2026, SM2027

        -- when we populate the DB we can keep that saved^^
        -- would it make more sense to do 24-hr time, like 17:00, 05:00?
);

CREATE TABLE COURSE(
    courseId varchar2(10) not null, --PK
    departmentId varchar2(10) not null, --FK
    sectionNum number(1,0) not null, --FK
    credits int not null,
    courseName varchar2 (20),
    facultyId varchar2(10) not null,

);
CREATE TABLE DEPARTMENT(
    departmentId varchar2(10) not null, --PK
    majorId varchar2(9), --FK
    deptName varchar2 (20),
    locationID varchar2(9) not null, --FK
    
);

CREATE TABLE FACULTY(
    facultyId varchar2(10) not null, --PK
    email varchar2(100) not null,
    fname varchar2(15) not null,
    lname varchar2(15) not null,
    departmentId varchar2(10) not null, --FK
    chair boolean not null
    
);

CREATE TABLE ENROLLED_IN(
    studentId varchar2(9) not null, --FK
    enrollmentId varchar2(10) not null, --PK
    sectionNum number(1, 0), --FK
    grade varchar2(2), -- like A, A-, etc.

    
); 

CREATE TABLE LOCATION(
    locationID varchar2(9) not null, --PK
    buildingName varchar2(30) not null,
    roomNumber varchar2(30) not null,
);

