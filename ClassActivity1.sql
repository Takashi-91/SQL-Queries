-- Q1 

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE TABLE STUDENT (
    StudID INT NOT NULL,
    Firstname VARCHAR2(50),
    Surname VARCHAR2(50),
    Email VARCHAR2(100),
    CONSTRAINT PK_StudID PRIMARY KEY(StudID)
);

CREATE TABLE COURSE(
    CourseID INT NOT NULL,
    CourseName VARCHAR2(100),
    Credits INT NOT NULL,
    CONSTRAINT PK_CourseID PRIMARY KEY(CourseID)
);

CREATE TABLE RESULTS (
    ResultID INT NOT NULL,
    Results INT NOT NULL,
    StudID INT NOT NULL,
    CourseID INT NOT NULL,
    CONSTRAINT PK_ResultID PRIMARY KEY(ResultID),
    CONSTRAINT FK_StudID FOREIGN KEY (StudID) REFERENCES STUDENT(StudID),
    CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);

INSERT INTO STUDENT VALUES (1011, 'Kevin', 'Jones', 'kj@isat.co.za');
INSERT INTO STUDENT VALUES (1022, 'Bob', 'Ferreira', 'bf@imail.com');
INSERT INTO STUDENT VALUES (1033, 'Clark', 'Le Roux', 'cerou@mca.com');
INSERT INTO STUDENT VALUES (1044, 'Anda', 'Johnson', 'aj@isat.co.za');
INSERT INTO STUDENT VALUES (1055, 'Mark', 'Waters', 'watersm@nrom.co.za');

INSERT INTO COURSE VALUES(1, 'Java Concepts', 15);
INSERT INTO COURSE VALUES(2, 'PHP for beginners', 10);
INSERT INTO COURSE VALUES(3, 'Android Development', 12);

INSERT INTO RESULTS VALUES(101, 58, 1011, 1);
INSERT INTO RESULTS VALUES(102, 52, 1033, 2);
INSERT INTO RESULTS VALUES(103, 85, 1022, 1);
INSERT INTO RESULTS VALUES(104, 45, 1011, 2);
INSERT INTO RESULTS VALUES(105, 92, 1055, 3);


--Q2
SELECT
    s.Firstname||s.Surname AS Names,
    c.CourseName AS Course,
    r.Results AS Results
FROM
    STUDENT s
INNER JOIN
    RESULTS r ON s.StudID = r.StudID
INNER JOIN
    COURSE c ON r.CourseID = c.CourseID;


--Q3
SET SERVEROUTPUT ON;
DECLARE
    v_StudentName VARCHAR2(100);
    v_CourseName VARCHAR2(100);
    v_ResultObtained INT;
BEGIN
    SELECT
        s.Firstname || ' ' || s.Surname,
        c.CourseName,
        r.Results
    INTO
        v_StudentName,
        v_CourseName,
        v_ResultObtained
    FROM
        STUDENT s
    INNER JOIN
        RESULTS r ON s.StudID = r.StudID
    INNER JOIN
        COURSE c ON r.CourseID = c.CourseID
    WHERE
        s.StudID = 1033;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_StudentName);
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_CourseName);
    DBMS_OUTPUT.PUT_LINE('Result Obtained: ' || v_ResultObtained);
END;
/

--Q4
SET SERVEROUTPUT ON;
DECLARE
    v_StudID INT;
    v_ResultCount INT;
    CURSOR c_StudentResults IS
        SELECT StudID, COUNT(*) AS ResultCount
        FROM RESULTS
        GROUP BY StudID;
BEGIN
    OPEN c_StudentResults;
    LOOP
        FETCH c_StudentResults INTO v_StudID, v_ResultCount;
        EXIT WHEN c_StudentResults%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_StudID || ', Result Count: ' || v_ResultCount);
    END LOOP;
    CLOSE c_StudentResults;
END;
/

--Q4
CREATE OR REPLACE VIEW Course_Credits AS
SELECT CourseName, Credits
FROM COURSE
WHERE Credits > 12;

--Q5
SET SERVEROUTPUT ON;
DECLARE
    v_Result INT;
    v_ResultType VARCHAR2(20);
BEGIN
    -- Get the result for student ID 1011 and result ID 101
    SELECT Results INTO v_Result
    FROM RESULTS
    WHERE StudID = 1011 AND ResultID = 101;

    -- Determine the result type based on the percentage
    IF v_Result >= 75 THEN
        v_ResultType := 'Distinction';
    ELSIF v_Result >= 50 THEN
        v_ResultType := 'Pass';
    ELSE
        v_ResultType := 'Fail';
    END IF;

    -- Display the result type
    DBMS_OUTPUT.PUT_LINE('Result for Student 1011 (Result ID 101): ' || v_ResultType);
END;
/


--Q6
CREATE USER pat_jones IDENTIFIED BY pat12345 DEFAULT TABLESPACE users;

-- Q7
GRANT SELECT ON RESULTS TO pat_jones;

CREATE SEQUENCE result_id
START WITH 106
INCREMENT BY 1;
