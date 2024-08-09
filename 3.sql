
CREATE TABLE BOAT (
    BID NUMBER PRIMARY KEY,
    BName VARCHAR2(50),
    BColor VARCHAR2(20)
);

CREATE TABLE SAILOR (
    SID NUMBER PRIMARY KEY,
    SName VARCHAR2(50),
    Age NUMBER
);

CREATE TABLE RESERVES (
    ReservationID NUMBER PRIMARY KEY,
    SID NUMBER,
    BID NUMBER,
    ReservationDate DATE,
    FOREIGN KEY (SID) REFERENCES SAILOR(SID) ON DELETE CASCADE,
    FOREIGN KEY (BID) REFERENCES BOAT(BID) ON DELETE CASCADE
);

INSERT INTO BOAT VALUES (1, 'Boat A', 'Red');
INSERT INTO BOAT VALUES (2, 'Boat B', 'Blue');

INSERT INTO SAILOR VALUES (101, 'Sailor A', 25);
INSERT INTO SAILOR VALUES (102, 'Sailor B', 30);

INSERT INTO RESERVES VALUES (1001, 101, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'));
INSERT INTO RESERVES VALUES (1002, 102, 2, TO_DATE('2024-07-02', 'YYYY-MM-DD'));
INSERT INTO RESERVES VALUES (1003, 101, 2, TO_DATE('2024-07-03', 'YYYY-MM-DD'));
INSERT INTO RESERVES VALUES (1004, 102, 1, TO_DATE('2024-07-04', 'YYYY-MM-DD'));

1.Obtain the details of the boats reserved by #Sailor_Name.
SELECT b.*
FROM BOAT b
JOIN RESERVES r ON b.BID = r.BID
JOIN SAILOR s ON r.SID = s.SID
WHERE s.SName = :Sailor_Name;

2.Retrieve the BID of the boats reserved necessarily by all the sailors
SELECT BID
FROM RESERVES
GROUP BY BID
HAVING COUNT(DISTINCT SID) = (SELECT COUNT(*) FROM SAILOR);

3.Find the number of boats reserved by each sailor. Display the Sailor_Name along with the number of boats reserved.
SELECT s.SName, COUNT(r.BID) AS NumberOfBoatsReserved
FROM SAILOR s
LEFT JOIN RESERVES r ON s.SID = r.SID
GROUP BY s.SID, s.SName;

#Mongo DB
>db.createCollection("boaters")
>db.boaters.insert({"B_ID":9988,"B_Name":'ABC',"Colour":'Black',"S_Name":'John',"S_ID":1234,"DAY
":'2017-12-25'}) 
>db.boaters.insert({"B_ID":8877,"B_Name":'DEF',"Colour":'White',"S_Name":'Smith',"S_ID":4567,"D
AY":'2017-11-24'})
>db.boaters.insert({"B_ID":7766,"B_Name":'GHI',"Colour":'Red',"S_Name":'Jack',"S_ID":7890,"DAY":'
2017-10-23'})
>db.boaters.find({"S_Name":'Jack'}).count()
>db.boaters.find({"Colour":'Red'}).pretty()


create table SHIPMENT (PartNumber number, partName varchar(20));

insert into SHIPMENT values (101, 'wheel'); insert into SHIPMENT values (102, 'tyre');

insert into SHIPMENT values (103, 'tube');

create table SHIPMENT_PART (PartNumber number, partName varchar(20));

SET SERVEROUTPUT ON;

DECLARE

Define the part number to filter by v_part_number SHIPMENT. PartNumber%TYPE := 101;

BEGIN

Insert rows into SHIPMENT_PART from SHIPMENT where PartNumber matches v part_number

INSERT INTO SHIPMENT_PART SELECT * FROM SHIPMENT WHERE Part Number = v_part_number;

Display the number of rows copied

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || rows copied to SHIPMENT_PART table for PartNumber: ' || v_part_number);

EXCEPTION

WHEN OTHERS THEN

Handle exceptions

DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);

END;

/

SELECT * from SHIPMENT_PART;
