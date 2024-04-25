--Q1
CREATE TABLE Book
(
Book_ID VARCHAR2(100) NOT NULL,
Title VARCHAR2(100) NOT NULL,
Price NUMBER(5,2) NOT NULL,
Instock INT NOT NULL,
CONSTRAINT PK_Book PRIMARY KEY(Book_ID)
);

CREATE TABLE Author
(
Author_ID INT NOT NULL,
Firstname VARCHAR2(100) NOT NULL,
Surname VARCHAR2(100) NOT NULL,
Contact VARCHAR2(100) NOT NULL,
CONSTRAINT PK_Author PRIMARY KEY(Author_ID)
);

CREATE TABLE ORDERS
(
Order_ID VARCHAR2(100) NOT NULL,
Order_Date DATE NOT NULL,
Qty VARCHAR2(100) NOT NULL,
Book_ID VARCHAR2(100) NOT NULL,
Author_id INT NOT NULL,
CONSTRAINT PK_Orders PRIMARY KEY(Book_ID),
CONSTRAINT FK_Book FOREIGN KEY(Book_ID) REFERENCES Book(Book_ID),
CONSTRAINT FK_Author FOREIGN KEY(Author_ID) REFERENCES Author(Author_ID)

);

INSERT INTO  BOOK VALUES('SQL101','SQL in 3 Months','899','55');
INSERT INTO  BOOK VALUES('AND101','Android Developer','599','35');
INSERT INTO  BOOK VALUES('C101','Extreme C#','997','15');
INSERT INTO  BOOK VALUES('J101','Java in 3 Months','557','28');
INSERT INTO  BOOK VALUES('IT101','IT System Design','825','29');

INSERT INTO Author VALUES('101','Bob','Bobson','0211231258');
INSERT INTO Author VALUES('102','Joe','Bloggs','0111755859');
INSERT INTO Author VALUES('103','Andre','Smith','0411238795');

INSERT INTO Orders VALUES('ORDER_1','15/May/2016','5','SQL101','101');
INSERT INTO Orders VALUES('ORDER_2','15/May/2016','3','C101','102');
INSERT INTO Orders VALUES('ORDER_3','17/May/2016','5','AND101','103');
INSERT INTO Orders VALUES('ORDER_4','25/May/2016','2','AND101','103');
INSERT INTO Orders VALUES('ORDER_5','28/May/2016','3','SQL101','101');



--Q2

SELECT a.Firstname ||a.Surname AS Author_Name,b.Title AS Title,o.Order_Date AS Order
FROM Book b 
INNER JOIN  Author a ON a.Author_ID=b.Author_ID
INNER JOIN  Order_Date o ON o.Order_ID =o.Order_ID
GROUP BY b.Title;


SELECT b.Title,'R '||b.Price AS PRICE ,'R '||b.Price * 0.14  AS VAT, 'R '||price * 1.14 AS Total_Price
FROM Book b;

--Step to create block 
--Formulate your Select
-- Declare your Variables
-- Declare your CUSOR 
--Begin your Program
--Open Cursor
--Loop thourgh cursor
--Intailazie The FECTH
--Exit The Cursor
--Exit loop
--Print Output 
--End Loop
--Close Cursor
--End Program


SELECT a.Firstname ||a.Surname AS Author_Name
FROM BooK 
INNER JOIN  Author a ON a.Author_ID=b.Author_ID
INNER JOIN  Order_Date o ON o.Order_ID =o.Order_ID
GROUP BY b.Title;




