/* You are going to build a project based on Library Management System. It keeps 
track all information about books in the library, their cost, status and total 
number of books available in the library. 
Create a database named library and create following TABLES in the database: 
1.  Branch 
2.  Employee 
3.  Customer 
4.  IssueStatus 
5.  ReturnStatus 
6.  Books */

CREATE DATABASE Library;
USE Library;

/*
Attributes for the tables: 
1.  Branch 
 Branch_no - Set as PRIMARY KEY 
 Manager_Id 
 Branch_address 
 Contact_no 
 */
 CREATE TABLE Branch(
		Branch_No INT PRIMARY KEY,
        Manager_Id INT,
        Branch_Address VARCHAR(30),
        Contact_No VARCHAR(30)
);

DESC Branch;

INSERT INTO Branch VALUES(1, 101, 'Kochi', 1234567890);
INSERT INTO Branch VALUES(2, 102, 'Thrissur', 2345678901);
INSERT INTO Branch VALUES(3, 103, 'Malappuram', 3456789012);
INSERT INTO Branch VALUES(4, 104, 'Kollam', 4567890123);
INSERT INTO Branch VALUES(5, 105, 'Kottayam', 7890123456);

SELECT * FROM Branch;
/*
2.  Employee 
 Emp_Id – Set as PRIMARY KEY 
 Emp_name 
 Position 
 Salary 
Please Note: Manager_Id from Branch table can be considered as Emp_Id in 
Employee table.
*/

CREATE TABLE Employee(
		Emp_Id INT PRIMARY KEY,
        Emp_Name VARCHAR(30),
        Position VARCHAR(30),
        Salary INT
);

DESC Employee;

INSERT INTO Employee VALUES(101, "Manoj", "Manager", 55000);
INSERT INTO Employee VALUES(102, "Zara", "Assistant Manager", 45000);
INSERT INTO Employee VALUES(103, "Miya", "Manager", 58000);
INSERT INTO Employee VALUES(104, "Farzad", "Assistant", 30000);
INSERT INTO Employee VALUES(105, "Shahanazir", "Manager", 67000);
INSERT INTO Employee VALUES(106, "Maya", "Staff", 34000);
INSERT INTO Employee VALUES(107, "Fathima", "Staff", 28000);
INSERT INTO Employee VALUES(108, "Yahana", "Manager", 60000);

SELECT * FROM Employee;

/*
3.  Customer 
 Customer_Id - Set as PRIMARY KEY 
 Customer_name 
 Customer_address 
 Reg_date 
 
*/

CREATE TABLE Customer(
			Customer_Id INT PRIMARY KEY,
			Customer_Name VARCHAR(30),
            Customer_Address VARCHAR(30),
            Reg_Date DATE
	);
    
DESC Customer;

INSERT INTO Customer VALUES(1, 'Alice', 'Kochi','2023-03-10');
INSERT INTO Customer VALUES(2, 'Elsa', 'Kochi','2023-04-20');
INSERT INTO Customer VALUES(3, 'Ahana', 'Thrissur','2023-03-12');
INSERT INTO Customer VALUES(4, 'Ammu', 'MAlappuram','2022-02-15');
INSERT INTO Customer VALUES(5, 'Mini', 'Kollam','2023-01-30');
INSERT INTO Customer VALUES(6, 'Ishal', 'Kottayam','2023-03-13');
INSERT INTO Customer VALUES(7, 'Aina', 'Kollam','2021-12-13');
INSERT INTO Customer VALUES(8, 'Nawal', 'Kochi','2021-07-24');

SELECT * FROM Customer;

/*
4.  IssueStatus 
 Issue_Id - Set as PRIMARY KEY 
 Issued_cust – Set as FOREIGN KEY and it refer customer_id in 
CUSTOMER table 
 Issued_book_name 
 Issue_date 
 Isbn_book – Set as FOREIGN KEY and it should refer isbn in 
BOOKS table 
*/

CREATE TABLE IssueStatus(
		Issue_Id INT PRIMARY KEY,
        Issued_Cust INT,
        Issued_Book_Name VARCHAR(30),
        Issue_Date DATE,
        Isbn_Book VARCHAR(30),
        FOREIGN KEY (Issued_Cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
        FOREIGN KEY (Isbn_Book) REFERENCES Books(ISBN) ON DELETE CASCADE
	);
    
DESC IssueStatus;

INSERT INTO IssueStatus VALUES(1, 2, 'Rich Dad Poor Dad', '2023-05-12', 'ISBN101');
INSERT INTO IssueStatus VALUES(2, 1, 'The Alchemist', '2023-04-15', 'ISBN102');
INSERT INTO IssueStatus VALUES(3, 3, 'Aadujeevitham', '2023-04-17', 'ISBN104');
INSERT INTO IssueStatus VALUES(4, 4, 'Ente Uppupakkoru Aanendarnnu', '2023-07-12', 'ISBN103');
INSERT INTO IssueStatus VALUES(5, 6, 'Rich Dad Poor Dad', '2023-02-16', 'ISBN101');
INSERT INTO IssueStatus VALUES(6, 5, 'Lolita', '2023-04-14', 'ISBN105');
INSERT INTO IssueStatus VALUES(7, 1, 'The Alchemist', '2023-06-15', 'ISBN102');

SELECT * FROM IssueStatus;
/* 
5.  ReturnStatus 
 Return_Id - Set as PRIMARY KEY 
 Return_cust 
 Return_book_name 
 Return_date 
 Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in 
BOOKS table 

*/

CREATE TABLE ReturnStatus(
		Return_Id INT PRIMARY KEY,
        Return_Cust INT,
        Return_Book_Name VARCHAR(30),
        Return_Date DATE,
        Isbn_Book2 VARCHAR(30),
        FOREIGN KEY (Isbn_Book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);

DESC ReturnStatus;

INSERT INTO ReturnStatus VALUES(1, 6, 'Rich Dad Poor Dad', '2023-03-16','ISBN101');
INSERT INTO ReturnStatus VALUES(2, 4, 'Ente Uppupakkoru Aanendarnnu', '2023-07-13','ISBN103');
INSERT INTO ReturnStatus VALUES(3, 1, 'The Alchemist', '2023-05-12', 'ISBN102');
INSERT INTO ReturnStatus VALUES(4, 3, 'Aadujeevitham', '2023-05-17', 'ISBN104');
INSERT INTO ReturnStatus VALUES(5, 2, 'Rich Dad Poor Dad', '2023-05-18', 'ISBN101');
INSERT INTO ReturnStatus VALUES(6, 5, 'Lolita', '2023-05-14', 'ISBN105');

SELECT * FROM ReturnStatus;

/*
6.  Books 
 ISBN  - Set as PRIMARY KEY 
 Book_title 
 Category 
 Rental_Price 
 Status [Give yes if book available and no if book not available] 
 Author 
 Publisher

*/


CREATE TABLE Books(
		ISBN VARCHAR(30) PRIMARY KEY,
        Book_Title VARCHAR(30),
        Category VARCHAR(30),
        Rental_Price INT,
        Status VARCHAR(30),
        Author VARCHAR(30),
        Publisher VARCHAR(30)
);

DESC Books;

INSERT INTO Books VALUES('ISBN101', 'Rich Dad Poor Dad', 'Personal Finance', 300, 'Yes', 'Robert T. Kiyosaki', 'Plata Publishing');
INSERT INTO Books VALUES('ISBN102', 'The Alchemist', 'Fiction', 250, 'Yes', 'Paulo Coelho', 'HarperOne');
INSERT INTO Books VALUES('ISBN103', 'Ente Uppupakkoru Aanendarnnu', 'Fiction', 235, 'No', 'M. Mukundan', 'DC Books ');
INSERT INTO Books VALUES('ISBN104', 'Aadujeevitham', 'Fiction', 170, 'Yes', 'Benyamin', 'DC Books');
INSERT INTO Books VALUES('ISBN105', 'Lolita', 'Literary Fiction', 200, 'No', 'Vladimir Nabokov', 'Olympia Press');
INSERT INTO Books VALUES('ISBN106', 'The Rise of Ancient Egypt', 'History', 350, 'Yes', 'Toby Wilkinson', 'Olympia Press');
INSERT INTO Books VALUES('ISBN107', 'The Guns of August', 'History', 350, 'Yes', 'Barbara W. Tuchman', 'Collen Press');


SELECT * FROM Books;


-- 1.  Retrieve the book title, category, and rental price of all available books.

SELECT Book_Title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

-- List the employee names and their respective salaries in descending order of salary.

SELECT Emp_Name, Salary FROM EMPLOYEE ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Issued_Book_Name AS Book_Title, Customer_Name AS Customer FROM IssueStatus, Customer WHERE Customer_Id = Issued_Cust;

-- Display the total count of books in each category.

SELECT Category, COUNT(*) AS Number_of_books FROM Books GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_Name AS Employee_Name , Position FROM Employee WHERE Salary>50000;

--  List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_Name FROM Customer WHERE Reg_Date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_Cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch.

SELECT Branch_No, COUNT(*) AS Number_of_Employees FROM Branch GROUP BY Branch_no; 

-- Display the names of customers who have issued books in the month of June 2023.

SELECT Customer_Name FROM IssueStatus, Customer WHERE Issued_Cust = Customer_Id AND MONTH(Issue_Date)=6 AND YEAR(Issue_Date) = 2023;

--  Retrieve book_title from book table containing history.

SELECT Book_Title FROM Books WHERE Category = 'History';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees. 

SELECT Branch_no, COUNT(*) AS Total_Count FROM Branch, Employee GROUP BY Branch_no HAVING COUNT(*) > 5;
