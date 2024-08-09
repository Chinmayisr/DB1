CREATE TABLE Employee (
    SSN NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Address VARCHAR2(100),
    Department VARCHAR2(50)
);

CREATE TABLE Project (
    ProjectNo NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Domain VARCHAR2(50)
);

CREATE TABLE WorksOn (
    WorkID NUMBER PRIMARY KEY,
    EmployeeSSN NUMBER,
    ProjectNo NUMBER,
    Hours NUMBER,
    FOREIGN KEY (EmployeeSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjectNo) REFERENCES Project(ProjectNo)
);

INSERT INTO Employee VALUES (123456789, 'John Doe', '123 Elm St', 'IT');
INSERT INTO Employee VALUES (987654321, 'Jane Smith', '456 Oak St', 'HR');

INSERT INTO Project VALUES (1, 'Database Migration', 'Database');
INSERT INTO Project VALUES (2, 'Cloud Integration', 'Cloud');

INSERT INTO WorksOn VALUES (101, 123456789, 1, 30);
INSERT INTO WorksOn VALUES (102, 987654321, 2, 40);

1.Obtain the details of employees assigned to the "Database" project.
SELECT e.*
FROM Employee e
JOIN WorksOn w ON e.SSN = w.EmployeeSSN
JOIN Project p ON w.ProjectNo = p.ProjectNo
WHERE p.Domain = 'Database';

2.Find the number of employees working in each department with department details.
SELECT Department, COUNT(SSN) as NumberOfEmployees
FROM Employee
GROUP BY Department;

3.Update the Project details of Employee bearing SSN = #SSN to ProjectNo = #Project_No and display the same.
UPDATE WorksOn
SET ProjectNo = 2 
WHERE EmployeeSSN = 123456789;

SELECT * FROM WorksOn WHERE EmployeeSSN = 123456789;

#Mongo DB
>db.createCollection("EMPLOYEE1") 
>db.EMPLOYEE1.insert({"SSN":4567,"Name":'James',"Dept_name":'XYZ',"Project _no":101}) 
>db.EMPLOYEE1.insert({"SSN":3256,"Name":'Jack',"Dept_name":'XXZ',"Project_ no":102}) 
>db.EMPLOYEE1.find({"Dept_name":'XYZ'}).pretty() 
>db.EMPLOYEE1.find({"Project_no":102}).pretty()

set serveroutput on 
begin 
update employee1 
set salary=(1.15*salary) where deptno=10; 
dbms_output.put_line('number of rows updated are'||sql%rowcount); 
end; 
/ 
