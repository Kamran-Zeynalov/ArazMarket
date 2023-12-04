create database ArazMarket
go

use ArazMarket
go

create table Users (
    ID int primary key,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    Email nvarchar(100),
    Password nvarchar(100),
    IsActive bit
);

create table UserDetails (
    ID int primary key,
    UserID int unique,
    PhoneNumber nvarchar(20),
    Address nvarchar(255),
    foreign key (UserID) references Users(ID)
);

create table Products (
    ID int primary key,
    Name nvarchar(100),
    Price decimal(10, 2)
);
go

create table Orders (
    ID int primary key,
    UserID int foreign key references Users(ID),
    ExecutedDate date
);

create table OrderProducts (
    OrderID int foreign key references Orders(ID),
    ProductID int foreign key references Products(ID),
    primary key (OrderID, ProductID)
);
go

insert into Users (ID, FirstName, LastName, Email, Password, IsActive)
values
    (1, 'Tural', 'Aliyev', 'tural@example.com', 'password123', 1),
    (2, 'Tanya', 'Smith', 'tanya@example.com', 'securepassword', 1),
    (3, 'Tariq', 'Khan', 'tariq@example.com', 'qwerty123', 1),
    (4, 'Adil', 'Teymurov', 'emma@example.com', 'p@ssw0rd', 1),
    (5, 'Rustem', 'Taylor', 'emma@example.com', 'p@ssw0rd', 1),
    (6, 'Tom', 'Brown', 'tom@example.com', 'mysecretpass', 1);

	
insert into UserDetails (ID, UserID, PhoneNumber, Address)
values
    (1, 1, '+1234567890', '123 Main St, City'),
    (2, 2, '+1987654321', '456 Elm St, Town'),
    (3, 3, '+1122334455', '789 Oak St, Village'),
    (4, 4, '+1654321890', '101 Pine St, County'),
    (5, 5, '+1789456123', '555 Cedar St, Country');
	
insert into Products (ID, Name, Price)
values
    (1, 'Phone', 500),
    (2, 'Laptop', 1200),
    (3, 'Headphones', 100),
    (4, 'Tablet', 800),
    (5, 'Smartwatch', 300);
	
insert into Orders (ID, UserID, ExecutedDate)
values
    (1, 1, '2023-11-05'),
    (2, 2, '2023-11-10'),
    (3, 3, '2023-11-15'),
    (4, 4, '2023-10-25'),
    (5, 5, '2023-11-20');
	
insert into OrderProducts (OrderID, ProductID)
values
    (1, 1),
    (1, 3),
    (2, 2),
    (3, 4),
    (4, 1),
    (4, 5),
    (5, 3),
    (5, 4);
	go

	select * from Users where FirstName like 'T%';
	select * from Products where Price > 30;
	select * from Orders where month(ExecutedDate) = 11 and year(ExecutedDate) = 2023;
