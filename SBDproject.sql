--Name:Prashant Sharma
--s no.:s20985
--GroupId:16c

BEGIN
  FOR c IN ( SELECT table_name FROM user_tables)
  LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || c.table_name || ' CASCADE CONSTRAINTS' ;
  END LOOP;
END;
 
/

BEGIN
  FOR c IN ( SELECT sequence_name FROM user_sequences WHERE sequence_name NOT LIKE '%$%')
  LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || c.sequence_name;
  END LOOP;
END;
/


CREATE TABLE ClassGroup (
    GroupId integer  NOT NULL,
    GroupName varchar2(30)  NOT NULL,
    CONSTRAINT ClassGroup_pk PRIMARY KEY (GroupId)
) ;

-- Table: ClassRoom
CREATE TABLE ClassRoom (
    RoomNo integer  NOT NULL,
    NoOfSeats integer  NOT NULL,
    CONSTRAINT ClassRoom_pk PRIMARY KEY (RoomNo)
) ;

-- Table: ExamResults
CREATE TABLE ExamResults (
    ExamResultId integer  NOT NULL,
    Points integer  NOT NULL,
    ResultDate date  NOT NULL,
    StudentId integer  NOT NULL,
    SubjectId integer  NOT NULL,
    CONSTRAINT ExamResults_pk PRIMARY KEY (ExamResultId)
) ;

-- Table: Student
CREATE TABLE Student (
    StudentId integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Surname varchar2(30)  NOT NULL,
    DateOfBirth date,
    FeePaid integer  NOT NULL,
    Discount integer,
    GroupId integer,
    CONSTRAINT Student_pk PRIMARY KEY (StudentId)
) ;

-- Table: Subject
CREATE TABLE Subject (
    SubjectId integer  NOT NULL,
    SubjectName varchar2(30)  NOT NULL,
    SubjectFee integer  NOT NULL,
    CONSTRAINT Subject_pk PRIMARY KEY (SubjectId)
) ;

-- Table: Tutorial
CREATE TABLE Tutorial (
    TutorialId integer  NOT NULL,
    --StartTime timestamp  NOT NULL,
    SubjectId integer  NOT NULL,
    LecturerId integer  NOT NULL,
    RoomNo integer  NOT NULL,
    CONSTRAINT Tutorial_pk PRIMARY KEY (TutorialId)
) ;

-- Table: lecturer
CREATE TABLE lecturer (
    LecturerId integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Surname varchar2(30)  NOT NULL,
    Salary integer NOT NULL,
    CONSTRAINT lecturer_pk PRIMARY KEY (LecturerId)
) ;

-- foreign keys
-- Reference: Exam Results_Student (table: ExamResults)
ALTER TABLE ExamResults ADD CONSTRAINT ExamResults_Student
    FOREIGN KEY (StudentId)
    REFERENCES Student (StudentId);

-- Reference: Exam Results_Subject (table: ExamResults)
ALTER TABLE ExamResults ADD CONSTRAINT ExamResults_Subject
    FOREIGN KEY (SubjectId)
    REFERENCES Subject (SubjectId);

-- Reference: Student_Group (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_Group
    FOREIGN KEY (GroupId)
    REFERENCES ClassGroup (GroupId);

-- Reference: Tutorial_ClassRoom (table: Tutorial)
ALTER TABLE Tutorial ADD CONSTRAINT Tutorial_ClassRoom
    FOREIGN KEY (RoomNo)
    REFERENCES ClassRoom (RoomNo);

-- Reference: Tutorial_Subject (table: Tutorial)
ALTER TABLE Tutorial ADD CONSTRAINT Tutorial_Subject
    FOREIGN KEY (SubjectId)
    REFERENCES Subject (SubjectId);

-- Reference: Tutorial_lecturer (table: Tutorial)
ALTER TABLE Tutorial ADD CONSTRAINT Tutorial_lecturer
    FOREIGN KEY (LecturerId)
    REFERENCES lecturer (LecturerId);

-- End of file.


CREATE SEQUENCE ClassGroup_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO ClassGroup(GroupId, GroupName)
VALUES (ClassGroup_seq.nextval, '10c');

INSERT INTO ClassGroup(GroupId, GroupName)
VALUES (ClassGroup_seq.nextval, '11c');

INSERT INTO ClassGroup(GroupId, GroupName)
VALUES (ClassGroup_seq.nextval, '12c');



INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('111', '16');

INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('112', '15');

INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('113', '15');

INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('114', '15');

INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('115', '15');

INSERT INTO ClassRoom(RoomNo, NoOfSeats)
VALUES ('116', '15');



CREATE SEQUENCE Subject_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO Subject(SubjectId, SubjectName,SubjectFee)
VALUES (Subject_seq.nextval, 'GUI',1200);

INSERT INTO Subject(SubjectId, SubjectName,SubjectFee)
VALUES (Subject_seq.nextval, 'RBD',1000);

INSERT INTO Subject(SubjectId, SubjectName,SubjectFee)
VALUES (Subject_seq.nextval, 'SOP',1100);

INSERT INTO Subject(SubjectId, SubjectName,SubjectFee)
VALUES (Subject_seq.nextval, 'ANG',900);

INSERT INTO Subject(SubjectId, SubjectName,SubjectFee)
VALUES (Subject_seq.nextval, 'ALG',1250);


CREATE SEQUENCE lecturer_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO Lecturer(LecturerId, Name, Surname,Salary)
VALUES(Lecturer_seq.nextval,'Robert','Dawney Jr.',2000);

INSERT INTO Lecturer(LecturerId, Name, Surname,Salary)
VALUES(Lecturer_seq.nextval,'Chris','Evans',2000);

INSERT INTO Lecturer(LecturerId, Name, Surname,Salary)
VALUES(Lecturer_seq.nextval,'Paul','Rudd',3000);

INSERT INTO Lecturer(LecturerId, Name, Surname,Salary)
VALUES(Lecturer_seq.nextval,'Ben','Afflek',5000);

INSERT INTO Lecturer(LecturerId, Name, Surname,Salary)
VALUES(Lecturer_seq.nextval,'Mark','Rufflo',5000);



CREATE SEQUENCE Student_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'John','Wick',TO_DATE('2020-12-11', 'YYYY-MM-DD'),7000,1);

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Thor','Odinson',TO_DATE('2020-12-13', 'YYYY-MM-DD'),16000,2);

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Steve','Rogers',TO_DATE('2020-07-1', 'YYYY-MM-DD'),8000,3);

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Bruce','Banner',TO_DATE('2020-06-19', 'YYYY-MM-DD'),8000,1);

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Natasha','Romanoff',TO_DATE('2020-04-25', 'YYYY-MM-DD'),16000,2);

INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Antonio','Stark',TO_DATE('2020-01-5', 'YYYY-MM-DD'),8000,3);

--Select * From Student

CREATE SEQUENCE ExamResult_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO ExamResults(ExamResultId,Points,ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),1,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),1,2);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),1,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),1,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),1,5);


INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),2,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),2,2);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),2,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),2,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),2,5);


INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,2,TO_DATE('2020-01-5', 'YYYY-MM-DD'),3,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),3,2);



INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),3,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),3,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),3,5);


INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),4,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),4,2);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),4,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),4,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),4,5);


INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,2,TO_DATE('2020-01-5', 'YYYY-MM-DD'),5,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),5,2);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),5,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),5,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),5,5);


INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),6,1);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),6,2);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,5,TO_DATE('2020-01-5', 'YYYY-MM-DD'),6,3);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,4,TO_DATE('2020-01-5', 'YYYY-MM-DD'),6,4);

INSERT INTO ExamResults(ExamResultId, Points, ResultDate,StudentId,SubjectId)
VALUES(ExamResult_seq.nextval,3,TO_DATE('2020-01-5', 'YYYY-MM-DD'),6,5);

--Select * from ExamResults


CREATE SEQUENCE Tutorial_seq
START WITH     1
INCREMENT BY   1;

INSERT INTO Tutorial(TutorialId, SubjectId, LecturerId, RoomNo)
VALUES(Tutorial_seq.nextval,1,1,111);


INSERT INTO Tutorial(TutorialId, SubjectId, LecturerId, RoomNo)
VALUES(Tutorial_seq.nextval,2,2,112);


INSERT INTO Tutorial(TutorialId,SubjectId, LecturerId, RoomNo)
VALUES(Tutorial_seq.nextval,3,3,113);


INSERT INTO Tutorial(TutorialId,  SubjectId, LecturerId, RoomNo)
VALUES(Tutorial_seq.nextval,4,4,114);


INSERT INTO Tutorial(TutorialId,  SubjectId, LecturerId, RoomNo)
VALUES(Tutorial_seq.nextval,5,5,115);



-- ==========================================================================================================

--TRIGGERS 


--BEFORE UPDATE FOR EACH ROW
CREATE TABLE SAL_HISTORY
(OLD_SAL INT,
NEW_SAL INT,
UPDATED_DATE DATE,
UPDATED_BY VARCHAR2(20)
);

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER TRIGGER_1
BEFORE UPDATE ON LECTURER
FOR EACH ROW
DECLARE
  V_USER VARCHAR2(20);
  V_DATE DATE;
BEGIN 
  IF :NEW.SALARY < :OLD.SALARY THEN
    RAISE_APPLICATION_ERROR(-20000, 'YOU CAN OLNLY INCREASE SALARY AMOUNT');
  ELSE
    SELECT USER, TO_DATE(SYSDATE, 'DD-MM-YYYY') INTO V_USER, V_DATE FROM DUAL;
    INSERT INTO SAL_HISTORY VALUES(:OLD.SALARY, :NEW.SALARY, V_DATE, V_USER);
    DBMS_OUTPUT.PUT_LINE ('THE SALARY HAS BEEN UPDATED AND SAVED');
  END IF;
END;
/

 -- TO TEST THE TRIGGER
UPDATE LECTURER SET SALARY=7000 WHERE LECTURERID=1;
UPDATE LECTURER SET SALARY=10000 WHERE LECTURERID=3;
SELECT * FROM SAL_HISTORY;

-- ===================================================================================================

-- Trigger Before Insert For Each Row.
CREATE TABLE USER_REMINDERS
(
    StudentId number(10),
    REMINDER_TEXT varchar2(200),
    REMINDER_DATE date,
    STATUS varchar2(10)
);

CREATE OR REPLACE TRIGGER REMINDER
AFTER INSERT
  on STUDENT
  FOR EACH ROW 

DECLARE
counter INTEGER;
reminder_text varchar2(200);

BEGIN
counter := 0;
reminder_text := '';

  IF(:NEW.DateOfBirth = '' OR :NEW.DateOFBirth is null) THEN
    reminder_text := 'Please insert Birth details into system. ';
    counter := counter+1;
  END IF;  
  
  IF(:NEW.GroupId = '' OR :NEW.GroupId is null) THEN
    reminder_text := reminder_text || 'Please insert Group details into system.';
    counter := counter+1;
  END IF;  

  IF(counter>0) THEN
    INSERT INTO USER_REMINDERS VALUES (:NEW.StudentID,reminder_text,To_Date(sysdate),'PENDING');
  END IF;
    
END;
/

-- Test Trigger Remainder.
INSERT INTO Student(StudentId, Name, Surname,DateOfBirth,Feepaid,GroupId)
VALUES(Student_seq.nextval,'Will','Wick',TO_DATE('2020-12-11', 'YYYY-MM-DD') ,7000,null);

Select * From USER_REMINDERS;

-- ===================================================================================================

 
CREATE OR REPLACE TRIGGER Deleting_Completed_Reminders
BEFORE DELETE
  on User_Reminders
  FOR EACH ROW 
 
DECLARE
pending_reminders INTEGER;
 
BEGIN
pending_reminders := 0;

SELECT count(1) INTO pending_reminders FROM User_Reminders WHERE STATUS = 'PENDING';
 
    IF (pending_Reminders > 0) THEN
      RAISE_APPLICATION_ERROR(-20000,' Pending Reminder cannot be deleted.');
    END IF;
    
END;
/

Delete From User_Reminders Where StudentId=7;

-- ===================================================================================================

CREATE OR REPLACE PROCEDURE AddSubject
(SubId INTEGER,
SubName VARCHAR2,
SubFee INTEGER)
AS
counter INTEGER := 0;
BEGIN
    SELECT COUNT(SubjectName) INTO counter
    FROM SUBJECT s
    WHERE
        (s.SubjectName=SubName);
        
        if counter = 0 THEN
        INSERT INTO SUBJECT(SubjectId, SubjectName, SubjectFee) Values
            (SubId,SubName,SubFee);
        ELSE 
            DBMS_OUTPUT.PUT_LINE('There Cannot Be Two Subjects Of same Name');
        END IF;
END AddSubject;
/

Exec AddSubject(Subject_seq.nextval,'ASD',1250);
Exec AddSubject(Subject_seq.nextval,'GUI',1250);
Select * from Subject;


--==================================================================================================

--Cursor
DECLARE 
v_StudentId Student.StudentId%type;
v_FeePaid Student.FeePaid%type;
v_FeeDiscount Student.FeePaid%type;

CURSOR cur IS SELECT StudentID, FeePaid FROM Student;
BEGIN
    OPEN cur;
    LOOP
    FETCH cur INTO v_StudentID, v_Feepaid;
    EXIT WHEN cur%NOTFOUND;
        IF
            v_FeePaid > 7500 AND v_FeePaid <8500 THEN 
            v_FeeDiscount := v_FeePaid * 0.02;
            Update Student Set Discount = v_FeeDiscount
            where StudentID = V_StudentID;
            dbms_output.put_line('Student With StudentID '|| v_StudentId|| ' has a fee discount of: ' || v_FeeDiscount);
        END IF;
        
         IF
            v_FeePaid > 15000 AND v_FeePaid <16500 THEN 
            v_FeeDiscount := v_FeePaid * 0.05;
            Update Student Set Discount = v_FeeDiscount
            where StudentID = V_StudentID;
            dbms_output.put_line('Student With StudentID '|| v_StudentId|| ' has a fee discount of: ' || v_FeeDiscount);
        END IF;
        
        IF v_FeePaid < 7500 THEN 
            v_FeeDiscount := 0;
            Update Student Set Discount = v_FeeDiscount
            where StudentID = v_StudentID;
            dbms_output.put_line('Student With StudentID '|| v_StudentId|| ' has a no fee discount');
        END IF;
    END LOOP;
    CLOSE CUR; 
END;
/


