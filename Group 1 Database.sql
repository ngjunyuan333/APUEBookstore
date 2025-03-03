Create database APUEBookstore;
use APUEBookstore;

create table Publisher(
PublisherID nvarchar(50) not null Primary Key,
Publisher_name nvarchar(50),
Address nvarchar(50),
Contact_Number varchar(50),
);

create table PublisherOrder(
PublisherOrderID nvarchar(50) not null Primary Key,
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
ManagerID nvarchar(50) FOREIGN KEY REFERENCES Manager(ManagerID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID),
Total_Order int,
);

create table Manager(
ManagerID nvarchar(50) not null Primary Key,
Name nvarchar(50),
Age integer,
Gender varchar(50),
Email varchar(150),
Contact_Number varchar(50),
);

create table Book(
BookID nvarchar(50) not null Primary Key,
Title nvarchar(max),
Author nvarchar(50),
Category nvarchar(50),
Price integer,
Publisher_Year integer,
Quantity integer,
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID)
);

create table Feedback( 
FeedbackID nvarchar(50) not null Primary Key,
Score integer,
Comment nvarchar(max),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID),
);

create table Member(
MemberID nvarchar(50) not null Primary Key,
Name nvarchar(50),
Email varchar(max),
Address nvarchar(50),
Gender varchar(50),
Membership_Date date,
Contact_mumber varchar(50),
);

create table watch(
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID),
View_date date,
);

create table ShoppingCart(
CartID nvarchar(50) not null Primary Key,
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID),
Amount integer,
Quantity integer,
Total_amount integer,
);

create table MemberOrder(
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID),
CartID nvarchar(50) FOREIGN KEY REFERENCES ShoppingCart(CartID),
Order_date date,
Delivery_status nvarchar(Max),
Delivery_day date,
);

insert into Publisher values
('P01','Simon & Schuster','Bukit Jalil','03-7892315'),
('P02','Hachette Book Group','Puchong','03-1299034'),
('P03','Hardie Grant Publishing','Subang','03-5629841'),
('P04','Hodder & Stoughton,','Kuala Lumpur','03-1280725'),
('P05','Penguin Random House','Cheras','03-4923471'),
('P06','Winking Studios Limited','Kajang','03-9894722'),
('P07','Immediate Media Company','Ampang','03-2457331');

insert into Manager values
('M01','Linya Ong',30,'Female','69Linya2wga@Gmail.com','011-73992540'),
('M02','James Ng',52,'Male','ValtteriitsJames@Gmail.com','014-92306251'),
('M03','Kimi Räikkönen',44,'Male','SVORLH_MVL@Gmail.com','012-43518465'),
('M04','Sophie Belle',23,'Female','tt9500073@Gmail.com','016-11916341'),
('M05','Mahaa binti Hazm',48,'Female','tsaifulzakher@gmail.com','019-38131476');

insert into Book values
('B01','WHERE IS THE LAMB SAUCE?! Hell Of Kitchen','Gordon Ramsay','Cooking',100,2006,10,'P02'),
('B02','Snoop Dogg Presents Goon with the Spoon',' Snoop Dogg','Cooking',145,2017,6,'P03'),
('B03','The Dangerous Book for Boys','Hal Iggulden','Sports',65,2012,2,'P01'),
('B04','Yoga Anatomy','Leslie Kaminoff and Amy Matthews','Sports',90,2009,1,'P07'),
('B05','A Game of Thrones','George R.R. Martin','Science Fiction',80,2000,7,'P05'),
('B06','Heir to the Empire','Timothy Zahn','Science Fiction',200,2011,5,'P06'),
('B07','Introduction to defense Sergio Pérez at the 2023 São Paulo Grand Prix','Fernando Alonso','Sports',30,2023,8,'P04'),
('B08','Food Politics: How the Food Industry Influences Nutrition and Health','Marion Nestle','Medical',160,2003,2,'P02'),
('B09','The C Programming Language','Dennis M. Ritchie and Brian W. Kernighan','Computers',130,2010,5,'P05'),
('B10','Cracking the Coding Interview: 150 Programming Questions and Solutions','Gayle Laakmann McDowell','Computers',180,2018,4,'P03');

insert into Member values
('MS01','Musaddiq bin Abdul Noor','Musabinabunoo@Gmail.com','Setia Alam','Male','10 Jan 2016','011-5673331'),
('MS02','Muneera binti Muneeb','577binti@Gmail.com','Rawang','Female','24 April 2018','017-5984653'),
('MS03','Yurika Matsuki','PNK2YUTI519@Gmail.com','Sri Petaling','Female','1 December 2019','014-5687940'),
('MS04','Tan Minhui','qiyuan0614@Gmail.com','Kajang','Female','19 July 2022','012-5465323'),
('MS05','Eugene Sim','Simmmm@Gmail.com','Puchong','Male','3 May 2021','017-5698714'),
('MS06','Jake Benham','jakebenham4717@Gmail.com','Kelana Jaya','Male','24 November 2022','018-4569311'),
('MS07','Jarno Opmeer','jarnoopmeer@Gmail.com','Subang Jaya','Male','7 November 2018','016-5584213'),
('MS08','Frederik Jul Rasmussen','Fredjul999@Gmail.com','Mont Kiara','Male','11 June 2018','011-4789642'),
('MS09','Lissandra Ionia','Linon@Gmail.com','Seri Kembangan','Female','17 February 2017','014-5698723'),
('MS10','Lili Selisa','Linon@Gmail.com','Seri Kembangan','Female','22 February 2023','019-2233784');

insert into PublisherOrder values
('PO01','P03','M04','B10',2),
('PO02','P06','M01','B06',1),
('PO03','P03','M02','B10',1),
('PO04','P05','M03','B09',4),
('PO05','P05','M05','B05',5),
('PO06','P04','M03','B07',3),
('PO07','P07','M01','B04',10),
('PO08','P01','M04','B03',8);

insert into Feedback values
('FB01',8,'This book provides a good explanation of the impact of the food industry on people of health and provides very constructive suggestions.','MS10','B08'),
('FB02',7,'Solve the programmming question but not much basis of the step.','MS06','B09'),
('FB03',9,'Hahaha,well content.','MS03','B05'),
('FB04',5,'meh,what is those solutions?it is useless for beginnner with lack of conceptual explanation.','MS08','B10'),
('FB05',8,'Where are you,harry?Good game.','MS04','B05'),
('FB06',7,'Good defense explanation with picture.','MS08','B07');

insert into watch values
('MS07','B06','10 April 2023'),
('MS07','B03','30 May 2022'),
('MS01','B06','22 February 2019'),
('MS03','B01','6 July 2021'),
('MS05','B08','22 March 2023');

insert into ShoppingCart values
('C01','MS03','B01',100,2,200),
('C02','MS03','B03',65,2,130),
('C03','MS08','B07',30,1,30),
('C04','MS02','B04',90,1,90),
('C05','MS06','B10',180,3,540),
('C06','MS07','B07',30,5,150),
('C07','MS10','B06',200,2,400);

insert into MemberOrder values
('MS03','C01','10 March 2023','have not been delivered','16 March 2023'),
('MS03','C02','22 January 2023','have been delivered','27 January 2023'),
('MS08','C03','15 February 2023','have been delivered','17 February 2023'),
('MS02','C04','8 March 2023','have not been delivered','13 March 2023'),
('MS06','C05','4 February 2023','have been delivered','9 February 2023'),
('MS07','C06','11 March 2023','have not been delivered','17 March 2023'),
('MS10','C07','17 January 2023','have been delivered','20 January 2023');



--Q1
Select book.BookID,book.Title,publisher.Publisher_name,feedback.Score from book
	inner join Publisher on book.PublisherID = Publisher.PublisherID
	inner join Feedback on Book.BookID = Feedback.BookID
	order by feedback.Score desc;

--Q2
SELECT m.MemberID, m.Name AS member_name, COUNT(f.FeedbackID) AS total_feedback FROM Member m 
	LEFT JOIN Feedback f ON m.MemberID = f.MemberID GROUP BY m.MemberID, m.Name;

--Q3
SELECT p.PublisherID, p.Publisher_name, COUNT(b.BookID) AS total_books_published FROM Publisher p
	LEFT JOIN Book b ON p.PublisherID = b.PublisherID GROUP BY p.PublisherID, p.Publisher_name ORDER BY total_books_published ASC;

--Q4
SELECT po.ManagerID, p.PublisherID, p.Publisher_name, Sum(po.Total_Order) AS total_books_ordered FROM PublisherOrder po
JOIN Publisher p ON po.PublisherID = p.PublisherID GROUP BY po.ManagerID, p.PublisherID, p.Publisher_name; 

--Q5
SELECT BookID, Title, Quantity FROM Book WHERE Quantity > (SELECT AVG(Quantity) FROM Book);

--Q6
SELECT TOP 3 b.BookID, b.Title,
SUM(sc.Quantity) AS TotalQuantitySold
FROM Book b
JOIN ShoppingCart sc ON b.BookID = sc.BookID
JOIN MemberOrder mo ON sc.CartID = mo.CartID
GROUP BY b.BookID, b.Title
ORDER BY TotalQuantitySold DESC;

--Q7
SELECT TOP 5 b.Category, b.BookID, b.Title, 
SUM(sc.Quantity) AS TotalQuantitySold 
FROM Book b
JOIN ShoppingCart sc ON b.BookID = sc.BookID 
JOIN MemberOrder mo ON sc.CartID = mo.CartID
GROUP BY b.Category, b.BookID, b.Title 
ORDER BY TotalQuantitySold DESC;

--Q8
SELECT Gender,
COUNT(MemberID) AS TotalMembers
FROM Member
GROUP BY Gender;

--Q9
SELECT
    MO.MemberID,
    M.Address,
    M.Email,
    b.BookID,
    B.Title,
    SO.Quantity,
    MO.Delivery_day,
    MO.Delivery_status
FROM MemberOrder MO
JOIN Member M ON MO.MemberID = M.MemberID
JOIN ShoppingCart SO ON MO.CartID = SO.CartID
JOIN Book B ON b.BookID = B.BookID
WHERE MO.Delivery_status = 'have not been delivered';

--Q10
Select Count(MemberID) as Orders_mumbers,
MemberID From ShoppingCart
Group by MemberID
Having count(MemberID)>=2;