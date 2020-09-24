drop database if exists PRS;
create database PRS;
use PRS;

Create table User
(ID		    int 		primary key auto_increment,
UserName	varchar(20) not null unique,
Password    varchar(10) not null,
FirstName   varchar(20) not null,
LastName    varchar(20) not null,
PhoneNumber varchar(12),
Email       varchar(75),
IsReviewer  bit         default 0,
IsAdmin     bit         default 0);

insert User
(Username, Password, FirstName, LastName, PhoneNumber, Email)
Values
('Kgibson', 'Login', 'Kali', 'Gibson', 5132952815, 'test@email.com'),
('User2', 'Password1', 'Joe', 'Harrison', 5132222222, 'Joe@email.com'),
('User3', 'Password1', 'Clyde', 'Morris', 5138789090, 'Clyde@email.com');

-- Insert User
-- (Username, Password, FirstName, LastName, PhoneNumber, Email)
-- Values
-- ('User3', 'Password1', 'Clyde', 'Morris', 5138789090, 'Clyde@email.com'); -- This was to test to make sure the program does not allow duplicate entries for users!! TEST CODE

Create table Vendor
(ID 	    int 		 primary key auto_increment,
Code        varchar(10)  not null unique,
Name        varchar(255) not null,
Address     varchar(255) not null,
City        varchar(255) not null,
State       varchar(2)   not null,
Zip         varchar(5)   not null,
PhoneNumber varchar(12)  not null,
Email       varchar(100) not null);

Insert Vendor
(Code, Name, Address, City, State, Zip, PhoneNumber, Email)
Values 
('CC-4076', 'Frito Lay', '345ChipsOnChipsRd', 'Cincinnati', 'OH', '45236', '513-222-2456', 'FritoLay@FritoLay.com'),
('DD-7098', 'Oreo', '456CookiesAndCreamRd', 'Columbus', 'OH', '45241', '513-254-7789', 'Oreo@oreo.com'),
('EE-0632', 'Campbells', '789SoupSt', 'Cincinnati', 'WA', '45267', '513-275-4321', 'Campbells@Campbells.com'),
('FF-4532', 'Heinz', '123KetchupBlvd', 'Fairfield', 'OH', '45238', '513-607-9087', 'Heinz@Heinz.com'),
('GG-4567', 'Kelloggs', '123CerealBowlDr', 'Pleasant Ridge', 'NV', '45231', '467-894-3231', 'Cereal@Kellogs.com'),
('II-4521', 'Pillsbury', '643BiscuitBoyLn', 'Moscow', 'TN', '67890', '564-321-7878', 'Pillsbury@Pillsbury.com'),
('KK-7890', 'Betty Crocker', '467BakingCakesDr', 'BlueMountain', 'AL', '23432', '675-909-0875', 'BettyCrocker@BettyCrocker.com'),
('YY-9090', 'Hershey', '7865ChocolateSt', 'Hershey', 'PA', '45321', '898-907-4343', 'Hershey@Hershey.com'),
('TT-4545', 'Quaker', '5432BucketOfOatsLn', 'Chicago', 'IL', '45678', '543-786-8989', 'Quaker@Quaker.com');
 


-- Insert Vendor (This is to test to make sure SQL will not allow a duplicate entry. This test was succsessfull
-- (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
-- Values 
-- ('Code3', 'Vendor3', '789highwayrd', 'Cincinnati', 'OH', '45267', '5132754321', 'Vendor3@email.com');



Create table Product
(ID 	    int 	primary key auto_increment,
VendorID    int     not null,
foreign key (VendorID) references Vendor(ID), -- Fk to Vendor
PartNumber  varchar(50) unique not null,
Name        varchar(255) not null,
Price       decimal(10,2) not null,
Unit        varchar(255),
constraint vendor_part unique (VendorID, PartNumber),
PhotoPath   varchar(255));


Insert Product
(VendorID, PartNumber, Name, Price, Unit, Photopath)
Values 
('1', 'ME280LL', 'Lays Chips', '1', 'null', 'null'),
('2', 'NU4569F', 'Oreos', '4', 'null', 'null'),
('3', 'YU8452V', 'Ketchup', '2', '3', 'Photopath3'),
('4', 'FC4756S', 'Cake Mix', '3', 'null', 'null'),
('5', 'GH3231Q', 'Cheerios Cereal', '1', 'null', 'null'),
('6', 'KJ5488B', 'Can of Biscuits', '4', '10', 'null');


-- **This is to test to make sure that SQL will not allow a duplicate entry. This test was successful**
-- Insert Product 
-- (VendorID, PartNumber, Name, Price, Unit, Photopath)
-- Values
-- ('3', 'PartNumber3', 'Product3', '1000', 'Unit3', 'Photopath3');

-- ** Below is a test to make sure that FK works**

-- Insert Product
-- (VendorID, PartNumber, Name, Price, Unit, Photopath)
-- Values
-- ('4', 'PartNumber4', 'Product4', '10001', 'Unit4', 'Photopath4');

-- **Test was succsessful**

-- Test to make sure SQL won't allow duplicate partnumber
-- Insert Product
-- (VendorID, PartNumber, Name, Price, Unit, Photopath)
-- Values 
-- ('3', 'PartNumber3', 'Product3', '1000', 'Unit3', 'Photopath3');
-- Test was succsessful


Create table Request
(ID 		    int 	  primary key auto_increment,
UserID          int       not null, 
Foreign key (UserID) references User(ID), -- FK to User table and cannot be null
Description     varchar(100)  not null,
Justification   varchar(255)  not null,
DateNeeded      Datetime      not null default current_timestamp,
DeliveryMode    varchar(25)   not null,
Status          varchar(20)   not null default 'New',
Total           decimal(10,2) not null, -- might add default 0
SubmittedDate   datetime not  null default current_timestamp,
ReasonForRejection varchar(100));



Insert Request
(UserID, Description, Justification, DeliveryMode, Total)
Values 
('1', 'RequestForLaysChips', 'I forgot to pack a lunch', 'Amazon Fresh', '3.25'),
('2', 'ReqestForOreos', 'Surprise for myself', 'Kroger Clicklist', '5.00'),
('3', 'RequestForCakeMix', 'Birthday party for admin assistant',  'Amazon', '3.00');


Create table LineItem
(ID 		int 	primary key auto_increment,
RequestID   int     not null, 
Foreign key (RequestID) references Request(ID), 
ProductID   int not null,
Foreign key (ProductID) references Product(ID),
constraint request_ID unique (RequestID, ProductID),
Quantity    int 	not null default 1);

Insert LineItem
(RequestID, ProductID)
Values
('1', '1'),
('2', '2'),
('3', '3');

drop user if exists prs_user@localhost;
create user prs_user@localhost identified by 'sesame';
grant select, insert, delete, update on prs.* to prs_user@localhost;






