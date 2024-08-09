
CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    CustomerAddress VARCHAR2(100)
);

CREATE TABLE BRANCH (
    BranchID NUMBER PRIMARY KEY,
    BranchName VARCHAR2(50),
    BranchAddress VARCHAR2(100)
);

CREATE TABLE ACCOUNT (
    AccountID NUMBER PRIMARY KEY,
    AccountType VARCHAR2(20) CHECK (AccountType IN ('Savings', 'Current')),
    Balance NUMBER,
    BranchID NUMBER,
    CustomerID NUMBER,
    FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE
);

CREATE TABLE TRANSACTION (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionType VARCHAR2(20) CHECK (TransactionType IN ('Deposit', 'Withdrawal')),
    TransactionDate DATE,
    Amount NUMBER,
    FOREIGN KEY (AccountID) REFERENCES ACCOUNT(AccountID) ON DELETE CASCADE
);

INSERT INTO CUSTOMER VALUES (1, 'John Doe', '123 Elm St');
INSERT INTO CUSTOMER VALUES (2, 'Jane Smith', '456 Oak St');

INSERT INTO BRANCH VALUES (1, 'Main Branch', '789 Maple Ave');
INSERT INTO BRANCH VALUES (2, 'North Branch', '101 Pine Rd');

INSERT INTO ACCOUNT VALUES (101, 'Savings', 1000, 1, 1);
INSERT INTO ACCOUNT VALUES (102, 'Current', 500, 1, 1);
INSERT INTO ACCOUNT VALUES (103, 'Savings', 2000, 2, 2);

INSERT INTO TRANSACTION VALUES (1001, 101, 'Deposit', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 500);
INSERT INTO TRANSACTION VALUES (1002, 101, 'Withdrawal', TO_DATE('2024-07-02', 'YYYY-MM-DD'), 200);
INSERT INTO TRANSACTION VALUES (1003, 102, 'Deposit', TO_DATE('2024-07-03', 'YYYY-MM-DD'), 300);
INSERT INTO TRANSACTION VALUES (1004, 103, 'Deposit', TO_DATE('2024-07-04', 'YYYY-MM-DD'), 1000);
INSERT INTO TRANSACTION VALUES (1005, 101, 'Deposit', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 700);

1.Obtain the details of customers who have both Savings and Current Account.
SELECT c.*
FROM CUSTOMER c
WHERE EXISTS (
    SELECT 1
    FROM ACCOUNT a
    WHERE a.CustomerID = c.CustomerID AND a.AccountType = 'Savings'
) AND EXISTS (
    SELECT 1
    FROM ACCOUNT a
    WHERE a.CustomerID = c.CustomerID AND a.AccountType = 'Current'
);

2.Retrieve the details of branches and the number of accounts in each branch.
SELECT b.BranchID, b.BranchName, b.BranchAddress, COUNT(a.AccountID) AS NumberOfAccounts
FROM BRANCH b
LEFT JOIN ACCOUNT a ON b.BranchID = a.BranchID
GROUP BY b.BranchID, b.BranchName, b.BranchAddress;

3.Obtain the details of customers who have performed at least 3 transactions.
SELECT c.*
FROM CUSTOMER c
JOIN ACCOUNT a ON c.CustomerID = a.CustomerID
JOIN TRANSACTION t ON a.AccountID = t.AccountID
GROUP BY c.CustomerID, c.CustomerName, c.CustomerAddress
HAVING COUNT(t.TransactionID) >= 3;

4.List the details of branches where the number of accounts is less than the average number of accounts in all branches.
SELECT b.BranchID, b.BranchName, b.BranchAddress
FROM BRANCH b
JOIN (
    SELECT BranchID, COUNT(AccountID) AS NumberOfAccounts
    FROM ACCOUNT
    GROUP BY BranchID
) ba ON b.BranchID = ba.BranchID
WHERE ba.NumberOfAccounts < (
    SELECT AVG(NumberOfAccounts)
    FROM (
        SELECT COUNT(AccountID) AS NumberOfAccounts
        FROM ACCOUNT
        GROUP BY BranchID
    ) da
);

#Mongo DB
db.createCollection("banking")
db.banking.insert({ "A_No": 7421, "A_Type": 'savings', "B_ID": 1542, "C_Name": 'jeevan' })
db.banking.insert({ "A_No": 4315, "A_Type": 'savings', "B_ID": 1587, "C_Name": 'harsha' })
db.banking.insert({ "A_No": 7906, "A_Type": 'current', "B_ID": 1542, "C_Name": 'akash' })
db.banking.find({ "B_ID": 1587 }, { "C_Name": 1, _id: 0 }).pretty()
db.banking.aggregate([{ $group: { _id: '$C_Name', total: { $sum: 1 } } }])

create table table1 (pno int, pname char(20), colour char(20), primary key(pno)); create table copy_table1 (pno int, pname char(20), colour char(20), primary key(pno));

insert into table1 values (10, 'nuts', 'black'); insert into table1 values (20, 'bolts','grey');

insert into table1 values (30, 'screw','green');

set serveroutput on

declare

cursor curr is select "from table1;

counter int;

rows table1%rowtype;

begin

open curr;

loop

fetch curr into rows;

exit when curr%not found;

insert into copy_table1 values (rows.pno, rows.pname, rows.colour); end loop;

counter: curr%rowcount;

close curr;

dbms_output.put_line(counter||' rows inserted into the table copy_part1 ');

end;

/

select * from copy_table1;
