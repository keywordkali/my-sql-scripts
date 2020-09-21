Use sys;

drop database if exists BcDb;


Create Database BcDb;

Use BcDb;

Create table Customers
(ID int primary key auto_increment,
Code varchar(10) not null unique,
Name varchar(30) not null,
Sales decimal(9,2) not null default 0,
Active bit not null default 1,
Created datetime not null default current_timestamp);


insert Customers
(Code, Name, Sales)
Values
('D', 'Karen Jones', 80000),
('E', 'Josh Judd', 90000),
('F', 'Clyde Morris', 34000);

create table Orders

(ID int primary key auto_increment,
Description varchar(30) not null,
Total decimal(9,2) not null default 0,
CustomerID int not null,
 foreign key (CustomerID) references customers(id));
 
 Insert Orders
 (Description, total, customerID) -- you don't need to put the ID value in this list because it is auto_incremented and SQL will provide that for us
 Values
 ('Computer', 1000, 2),
 ('Mouse', 8, 3);

 select * from orders




