CREATE TABLE BOOKS (
    ISBN VARCHAR2(20) PRIMARY KEY,
    Title VARCHAR2(100),
    Author VARCHAR2(50),
    Publisher VARCHAR2(50)
);

CREATE TABLE STUDENT (
    StudentID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Address VARCHAR2(100)
);

CREATE TABLE BORROWS (
    BorrowID NUMBER PRIMARY KEY,
    StudentID NUMBER,
    ISBN VARCHAR2(20),
    BorrowDate DATE,
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN) ON DELETE CASCADE
);

INSERT INTO BOOKS VALUES ('123', 'Database Systems', 'Author A', 'Publisher A');
INSERT INTO BOOKS VALUES ('124', 'Operating Systems', 'Author B', 'Publisher B');
INSERT INTO BOOKS VALUES ('125', 'Data Structures', 'Author C', 'Publisher C');

INSERT INTO STUDENT VALUES (1, 'John Doe', 'Male', '123 Elm St');
INSERT INTO STUDENT VALUES (2, 'Jane Smith', 'Female', '456 Oak St');
INSERT INTO STUDENT VALUES (3, 'Alice Brown', 'Female', '789 Pine Rd');

INSERT INTO BORROWS VALUES (1001, 1, '123', TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO BORROWS VALUES (1002, 2, '124', TO_DATE('2024-07-02', 'YYYY-MM-DD'));
INSERT INTO BORROWS VALUES (1003, 3, '125', TO_DATE('2024-07-03', 'YYYY-MM-DD'));
INSERT INTO BORROWS VALUES (1004, 2, '123', TO_DATE('2024-07-04', 'YYYY-MM-DD'));
INSERT INTO BORROWS VALUES (1005, 3, '123', TO_DATE('2024-07-05', 'YYYY-MM-DD'));

1.Obtain the names of the student who has borrowed either book bearing ISBN ‘123’ or ISBN ‘124’.
SELECT s.Name
FROM STUDENT s
JOIN BORROWS b ON s.StudentID = b.StudentID
WHERE b.ISBN IN ('123', '124');

2.Obtain the Names of female students who have borrowed “Database” books.
SELECT s.Name
FROM STUDENT s
JOIN BORROWS b ON s.StudentID = b.StudentID
JOIN BOOKS bk ON b.ISBN = bk.ISBN
WHERE s.Gender = 'Female' AND bk.Title = 'Database Systems';

3.Find the number of books borrowed by each student. Display the student details along with the number of books.
SELECT s.StudentID, s.Name, s.Gender, s.Address, COUNT(b.ISBN) AS NumberOfBooksBorrowed
FROM STUDENT s
LEFT JOIN BORROWS b ON s.StudentID = b.StudentID
GROUP BY s.StudentID, s.Name, s.Gender, s.Address;

#MongoDB
db.createCollection("library")
db.library.insert({"ISBN": 123 , "Title": 'database', "Author": 'ABC', "Publisher": 'WXYZ', "S_Name": 
'jeevan', "S_Gender":'Male'})
db.library.insert({"ISBN": 124, "Title": 'algorithm', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 
'harsha', "S_Gender":'Male'})
db.library.insert({"ISBN": 125, "Title": 'database', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 
'namitha', "S_Gender":'Female'})
db.library.insert({"ISBN": 126, "Title": 'java', "Author": 'DEF', "Publisher": 'ABCD', "S_Name": 'anjali', 
"S_Gender":'Female'})
>db.library.find({“Author”: ‘ABC’})
>db.library.find({“Title”: “database”},{“s_name”:1, _id: 0}). pretty()


SET SERVEROUTPUT ON

declare

a number;

b number;

c number;

n number;

i number;

begin

n:=8;

a:=0;

b:=1;

dbms_output.put_line(a);

dbms_output.put_line(b);

for i in 1..n-2

loop

c:=a+b;

dbms_output.put_line(c);

a:=b;

b:=c;

end loop;

end;

/
