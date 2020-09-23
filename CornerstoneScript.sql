Use sys;

drop database if exists PRS;

create database PRS;

use PRS;

Create table User
(ID int primary key auto_increment,
UserName varchar(20) not null unique,
Password varchar(10) not null,
FirstName varchar(20) not null,
LastName varchar(20) not null,
PhoneNumber varchar(12),
Email varchar(75),
IsReviewer bit default 0,
IsAdmin bit default 0);

insert User
(Username, Password, FirstName, LastName, PhoneNumber, Email)
Values
('User1', 'Password1', 'Karen', 'Jones', 5132952815, 'Karen@email.com'),
('User2', 'Password1', 'Joe', 'Harrison', 5132222222, 'Joe@email.com'),
('User3', 'Password1', 'Clyde', 'Morris', 5138789090, 'Clyde@email.com');

-- Insert User
-- (Username, Password, FirstName, LastName, PhoneNumber, Email)
-- Values
-- ('User3', 'Password1', 'Clyde', 'Morris', 5138789090, 'Clyde@email.com'); -- This was to test to make sure the program does not allow duplicate entries for users!! TEST CODE

Create table Vendor
(ID int primary key auto_increment,
Code varchar(10) not null unique,
Name varchar(255) not null,
Address varchar(255) not null,
City varchar(255) not null,
State varchar(2) not null,
Zip varchar(5) not null,
PhoneNumber varchar(12) not null,
Email varchar(100) not null);

Insert Vendor
(Code, Name, Address, City, State, Zip, PhoneNumber, Email)
Values 
('Code1', 'Vendor1', '345RiverRd', 'Cincinnati', 'OH', '45236', '5132222456', 'Vendor1@email.com'),
('Code2', 'Vendor2', '456Roadrd', 'Columbus', 'OH', '45241', '5132547789', 'Vendor2@email.com'),
('Code3', 'Vendor3', '789highwayrd', 'Cincinnati', 'OH', '45267', '5132754321', 'Vendor3@email.com');


-- Insert Vendor (This is to test to make sure SQL will not allow a duplicate entry. This test was succsessfull
-- (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
-- Values 
-- ('Code3', 'Vendor3', '789highwayrd', 'Cincinnati', 'OH', '45267', '5132754321', 'Vendor3@email.com');



Create table Product
(ID int primary key auto_increment,
VendorID int not null,
foreign key (VendorID) references Vendor(ID), -- Fk to Vendor
PartNumber varchar(50) unique not null,
Name varchar(255) not null,
Price decimal(10,2) not null,
Unit varchar(255),
constraint vendor_part unique (VendorID, PartNumber),
PhotoPath varchar(255));


Insert Product
(VendorID, PartNumber, Name, Price, Unit, Photopath)
Values 
('1', 'PartNumber1', 'Product1', '50', 'Unit1', 'Photopath1'),
('2', 'PartNumber2', 'Product2', '600', 'Unit2', 'Photopath2'),
('3', 'PartNumber3', 'Product3', '1000', 'Unit3', 'Photopath3');

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
(ID int primary key auto_increment,
UserID int not null, 
Foreign key (UserID) references User(ID), -- FK to User table and cannot be null
Description varchar(100) not null,
Justification varchar(255) not null,
DateNeeded Datetime not null default current_timestamp,
DeliveryMode varchar(25) not null,
Status varchar(20) not null default 'New',
Total decimal(10,2) not null, -- might add default 0
SubmittedDate datetime not null default current_timestamp,
ReasonForRejection varchar(100));



Insert Request
(UserID, Description, Justification, DeliveryMode, Total)
Values 
('1', 'RequestForNewDesk', 'DeskStruckByLightening', 'UPS', '0'),
('2', 'ReqestForNewLaptop', 'LaptopEatenByDog', 'Fedex', '0'),
('3', 'RequestForNewChair', 'ChairIsSqueaky',  'Amazon', '0');


Create table LineItem
(ID int primary key auto_increment,
RequestID int not null, 
Foreign key (RequestID) references Request(ID), 
ProductID int not null,
 Foreign key (ProductID) references Product(ID),
 constraint request_ID unique (RequestID, ProductID),
Quantity int not null default 1);

Insert LineItem
(RequestID, ProductID)
Values
('1', '1'),
('2', '2'),
('3', '3');

drop user if exists prs_user@localhost;
create user prs_user@localhost identified by 'sesame';
grant select, insert, delete, update on prs.* to prs_user@localhost;






