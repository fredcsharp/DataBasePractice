
/*
   Dropping Tables and Bottles...:P
*/ 

Drop Table if Exists BasementRats;
Drop Table if Exists Inventory;
Drop Table if Exists Locations;
Drop Table if Exists Roles;
Drop Table if Exists Sales;
Drop Table if Exists Services;
Drop Table if Exists Supplies;
Drop Table if Exists Taverns;
Drop Table if Exists Users;
Drop Table if Exists Rooms;
Drop Table if Exists RoomStays;

/*

Creating Tables
*/

Create Table  Taverns (
ID int IDENTITY (1,1) NOT NULL,
TavernName VARCHAR (50) NOT NULL,
LocationId INT NOT NULL,
EmployeeId int NOT NULL,

)

Create table Employees (
ID int IDENTITY (1,1) NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR (50)	NOT NULL,
RoleId int NOT NULL
)


Create Table Supplies (
ID int IDENTITY (1,1) NOT NULL,		
ProductName VARCHAR (50) NOT NULL,
UnitMeasure VARCHAR (50) NOT NULL,
SupplyCount INT NOT NULL DEFAULT 0,

)

Create Table Inventory (
ID int IDENTITY (1,1) NOT NULL,
AmountReceived INT NOT NULL,
CostPerUnit SMALLMONEY NOT NULL,
DateReceived DATE NOT NULL,
SupplyId INT NOT NULL,
TavernId INT NOT NULL,
)

Create Table Services (
ID int IDENTITY (1,1) NOT NULL,
ServiceName VARCHAR(50) NOT NULL,
IsActive BIT NOT NULL

)


Create Table Roles (
ID int IDENTITY (1,1) NOT NULL,
RoleName VARCHAR (50) NOT NULL,
Description VARCHAR (50) NOT NULL,


)

Create Table Locations (
ID int IDENTITY (1,1) NOT NULL,
StreetAddress VARCHAR (50) NOT NULL,
City VARCHAR (20) NOT NULL,
State VARCHAR (2) NOT NULL,
ZipCode VARCHAR (10) NOT NULL,
)


CREATE TABLE GuestsInfo  (
ID int IDENTITY (1,1) NOT NULL,
GuestName VARCHAR (50) NOT NULL,
Notes VARCHAR (100) NULL Default 'Loyal/Regular Guest',
Birthdat Date Null  Default ' Not Available' ,
CakePartyDay Date Null  Default 'Have not decided yet',
StatusId Int NOT NULL,
LevelId int NOT NULL,
ClassId int NOT NULL
)


CREATE TABLE StatusInfo (
ID INT IDENTITY (1,1) NOT NULL,
StatusName VARCHAR (50) NOT NULL,

)

CREATE TABLE GuestLevel (
ID INT IDENTITY (1,1) NOT NULL,
GuestLevel VARCHAR (50) NOT NULL
)

CREATE TABLE GuestClass (
ID INT IDENTITY (1,1) NOT NULL,
GuestClass VARCHAR (50) NOT NULL
)

Create Table Sales (
ID int IDENTITY (1,1) NOT NULL,
CostOfService SmallMoney NOT NULL,
AmountPurchased INT NOT NULL DEFAULT 0,
DatePurchased DATE NOT NULL,
ServiceId INT NOT NULL,
GuestId INT NOT NULL,
TavernId INT NOT NULL,
)

Create Table Rooms (
ID int IDENTITY (1,1) NOT NULL,
RoomNumber INT NOT NULL,
StatusId INT NOT NULL,
TavernId INT NOT NULL,
)

Create Table RoomStays (
ID INT IDENTITY (1,1) NOT NULL,
Sale Money NOT NULL,
GuestId INT NOT NULL,
RoomId INT NOT NULL,
DateStayed DATE NOT NULL,
RoomRate MONEY NOT NULL,

)

/*

INSERTING VALUES

*/


insert into dbo.Locations (StreetAddress, City ,State ,ZipCode)
values ('737 Red Lion rd.','Philadelphia','PA', 19115),
('9991 Bustleton ave','Philadelphia','PA', 19115),
('2711 Comly rd','Philadelphia','PA', 19154),
('2231 Huntingdon Pike', 'Huntingdon Valley','PA', 19006),
('10253 Bustleton ave','Philadelphia','PA', 19116)


insert into dbo.StatusInfo (StatusName)
values ('Happy'),
('Cranky'),
('SuperDuperHappy'),
('YAYYYY Lets Get LITTTT'),
('Leave me Alone')



insert into Dbo.GuestLevel (GuestLevel)
values ('LEVEL BAUSSS'),
('LEVEL Cant sit with us'),
('LEVEL GROOOOOVE'),
('LEVEL FOOdski'),
('LEVEL KING')


insert into dbo.GuestClass (GuestClass)
values ( 99),(85),(75),(88),(90);


insert into dbo.Roles (RoleName, Description)
Values ('Manager','Operations Manager'),
('Supervisor','Operations Supervisor'),
('Bartender','Watering down drinks 24/7'),
('Waitress','Collects all your tips'),
('Hostess','Welcomes Guests and Rats');


insert into dbo.Services(ServiceName, IsActive)
values ('Top Shelf Bar', 1 ),
('Beer and Wine Open Bar', 1 ),
('Non Alcoholic Bar',0),
('Cash Bar', 1),
('Basic Bar', 1);


insert into dbo.Supplies (ProductName, UnitMeasure , SupplyCount)
values ('Heineken','Gallon',800),
('Smirnoff','Gallon',10000),
('Blue Moon','Gallon', 5000),
('Water','Gallons', 100000),
('Baltika #7','Gallons', 1000);


insert into dbo.Employees (FirstName, LastName ,RoleId)
values ('Fred','Yuldashev', 3),
('Crystal','Vu', 2),
('Scott','Stanley', 1),
('Alexander','Patrick', 5),
('Johnathan','Pompay',4);


insert into dbo.Taverns (TavernName, LocationId , EmployeeID )
values ('Red Lion Tavern', 1, 1),
('Benny The Bums', 2, 2),
('The Union Tap', 3,3 ),
('Tin Pan Alley Tavern', 4,4),
('Omares Irish Pub', 5,5);

insert into dbo.Inventory (AmountReceived, CostPerUnit, DateReceived , SupplyId, TavernId)
values (20, $20 , '12-12-2018', 2, 1),
(40, $20,' 12-11-2019', 1, 5),
(100, $3, '1-1-2019', 4, 2),
(500,$10, '3-1-2019', 5 , 3 ) ,
(120,$40, '1-15-2019', 2, 4);


insert into dbo.GuestsInfo (GuestName, Notes, Birthday,CakePartyDay, StatusId ,LevelId ,ClassId  )
values ('Mark Single',' Party of 3', '1-1-1998','3-19-2019',3, 3, 1),
 ('Mark Knight', ' 2 people', '9-29-1988','3-20-2019',4 , 1,5 ),
 ('D Ramirez', '1 Person ', '9-16-1986', '3-21-2019',5 ,2, 3),
 ('Marco Bailey','Party of 5', '12-19-1992','4-20-2019',4,4,1),
 ('Stafno Noferini','Party of 1','12-12-1960', '3-7-2019',1,1,1);


 insert into dbo.Sales (CostOfService, AmountPurchased, DatePurchased, ServiceId, GuestId, TavernId)
values ($20, 1 , '3-7-2019',  5, 2 , 3),
($100, 2, '3-7-2019', 3 , 1, 5),
($500, 1, '3-7-2019', 5, 3, 2),
($1000, 1,'3-6-2019',4, 4, 4),
($200, 1, '3-5-2019',1 ,5, 2);



Insert Into Dbo.Rooms (RoomNumber , RoomStatus, TavernId)
Values (500, 1, 1 )
(501, 0, 2),
(604, 1, 5),
(700, 1, 2),
(405, 0, 1)


Insert into Dbo.RoomStays (Sale, GuestId, RoomId, DateStayed , RoomRate) 
Values ($400, 2, 1 , '12-19-2018', $90),
($500, 1, 3, '12-13-2018', $80),
($600, 3, 4, '3-1-2019', $100),
($200, 4, 1, '12-15-2018',$200 ),
($330, 5, 3, '1-1-2019', $600);


/*
ALTER TABLES

1st PRIMARY Key Assignments
2nd Foreign Key Assignemnts
*/                   

/*  PRIMARY KEYS  */

ALter Table Rooms Add Constraint [PK_Room] PRIMARY KEY (ID); 
Alter Table RoomStays Add Constraint [PK_RoomStays] PRIMARY KEY (ID);

/* FOREIGN KEYS */

ALTER TABLE Rooms ADD CONSTRAINT [FK_Rooms_Taverns] FOREIGN KEY (TavernId ) REFERENCES Taverns (ID);
ALTER TABLE RoomStays ADD CONSTRAINT [FK_RoomSTays_GuestInfo] FOREIGN KEY (GuestId) REFERENCES GuestsInfo (ID);
ALTER TABLE RoomStays ADD CONSTRAINT [FK_RoomStays_Rooms] FOREIGN KEY (RoomId) References Rooms (ID);




#2  /* Write a query that returns guests with a birthday before 1990 . */

  Select Birthday
  From dbo.GuestsInfo where Birthday < '1990-1-1';


# 3 /*Write a query to return rooms that cost more than 100 gold a night */

  Select RoomRate
  From dbo.RoomStays where RoomRate  >100 ;

# 4 /*  Write a query that returns UNIQUE guest names. */

    Select DISTINCT GuestName from GuestsInfo



#5 /* Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col] */

 Select GuestName 
From Dbo.GuestsInfo
Order By GuestName DESC


#6 /* Write a query that returns the top 5 highest price sales  */

Select Top 5 * from RoomStays Order BY RoomRate  ASC;

# 7   Write a query to return all Lookup Table Names - 
/*this is, not the names of the tables but the  Names of things like Status/Role/Class,etc. (w/ Union) */

select distinct TABLE_NAME from INFORMATION_SCHEMA.TABLES;   -- I'm lil confused on this one /


# 8.  Write a query that returns Guest Classes with Levels and Generate a new column with a label for their 
 -- level grouping (lvl 1-10, 10-20, etc  */

SELECT CONCAT ('Class',' ',  Id, ' ', 'Level: ', GuestLevel)
as 'Level 1-10' From GuestLevel
Where GuestLevel Between 1 and 10
Order BY GuestLevel ASC


SELECT CONCAT ('Class',' ',  Id, ' ', 'Level: ', GuestLevel)
as 'Level 10-20' From GuestLevel
Where GuestLevel Between 10 and 20
Order BY GuestLevel ASC



SELECT CONCAT ('Class',' ',  Id, ' ', 'Level: ', GuestLevel)
as 'Level 20-30' From GuestLevel
Where GuestLevel Between 20 and 30
Order BY GuestLevel ASC


#9  Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using 
--SELECT statements (See our lab in class - The INSERT commands should be generated). Its ok if the data doesnt 
--match or make sense! :) Remember, INSERT Commands look like: INSERT INTO Table1 (column1, column2) VALUES (column1, column2)


 /* STEP 1 *   P.S. Did not want to mess with my other tables * Please 4give me RAT MASTER */

Create Table TESTRoles (
ID INT IDENTITY (1,1) NOT NULL,
Major VARCHAR (50) NOT NULL,
JobName VARCHAR (50) NOT NULL,
)

 /* STEP 2 */

Insert into TESTRoles ( Major ,JobName  )
Select  RoleName, Description 
From Roles 

/* STEP 3 */


Select * From TESTRoles 