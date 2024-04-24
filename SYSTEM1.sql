-- Q1 
CREATE TABLE STUDENT (
    StudID INT PRIMARY KEY,
    Firstname VARCHAR(50),
    Surname VARCHAR(50),
    Email VARCHAR(100)
);

-- Create the COURSE table    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

-- Create the RESULTS table
CREATE TABLE RESULTS (
    ResultID INT PRIMARY KEY,
    Results INT,
    StudID INT,
    CourseID INT,
    FOREIGN KEY (StudID) REFERENCES STUDENT(StudID),
    FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);


INSERT INTO STUDENT (StudID, Firstname, Surname, Email)
VALUES
    (1011, 'Kevin', 'Jones', 'kj@isat.co.za'),
    (1022, 'Bob', 'Ferreira', 'bf@imail.com'),
    (1033, 'Clark', 'Le Roux', 'cerou@mca.com'),
    (1044, 'Anda', 'Johnson', 'aj@isat.co.za'),
    (1055, 'Mark', 'Waters', 'watersm@nrom.co.za');

INSERT INTO COURSE (CourseID, CourseName, Credits)
VALUES
    (1, 'Java Concepts', 15),
    (2, 'PHP for beginners', 10),
    (3, 'Android Development', 12);

INSERT INTO RESULTS (ResultID, Results, StudID, CourseID)
VALUES
    (101, 58, 1011, 1),
    (102, 52, 1033, 2),
    (103, 85, 1022, 1),
    (104, 45, 1011, 2),
    (105, 92, 1055, 3);


--Q2
SELECT
    s.Firstname, s.Surname AS StudentName,
    c.CourseName AS CourseName,
    r.Results AS ResultObtained
FROM
    STUDENT s
INNER JOIN
    RESULTS r ON s.StudID = r.StudID
INNER JOIN
    COURSE c ON r.CourseID = c.CourseID;






--Q3
DECLARE
    v_StudentName VARCHAR(100);
    v_CourseName VARCHAR(100);
    v_ResultObtained INT;
CURSOR c1
IS

SELECT
    s.Firstname, s.Surname AS StudentName,
    c.CourseName AS CourseName,
    r.Results AS ResultObtained
FROM
    STUDENT s
INNER JOIN
    RESULTS r ON s.StudID = r.StudID
INNER JOIN
    COURSE c ON r.CourseID = c.CourseID;

BEGIN
OPEN c1;
LOOP
FETCH c1 INTO v_StudentName,v_CourseName,v_ResultObtained;
EXIT WHEN c1%NOTFOUND;

   
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_StudentName);
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_CourseName);
    DBMS_OUTPUT.PUT_LINE('Result Obtained: ' || v_ResultObtained);
END LOOP;
CLOSE c1;
END;



--Q4
CREATE USER pat_jones IDENTIFIED BY pat12345;

-- Q5 
GRANT SELECT ON RESULTS TO pat_jones;

CREATE SEQUENCE result_id
START WITH 106
INCREMENT BY 1;
