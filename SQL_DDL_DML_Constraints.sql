create database sales_management;
use sales_management;

create table Offices(
officeCode varchar(100)primary key,
city varchar(100),
phone varchar(100),
addressLine1 varchar(100),
addressLine2 varchar(100),
state varchar(100),
country varchar(100),
postalCode int,
territory varchar(100));
insert into Offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values
('1', 'Chennai', '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India', '560001', 'APAC');
select * from Offices;

create table Employees(
employeeNumber int primary key,
lastName varchar(100),
firstName varchar(100),
extension varchar(100),
email varchar(100),
officeCode varchar(100),
reportsTo int,
jobTitle varchar(100),
foreign key (officeCode) references Offices(officeCode));
insert into Employees (employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
values
(1002, 'Kumar', 'Arun', 'x101', 'arun.kumar@classic.com', '1', NULL, 'Sales Manager'),
(1056, 'Ravi', 'Suresh', 'x102', 'suresh.ravi@classic.com', '1', 1002, 'Sales Rep'),
(1076, 'Sharma', 'Neha', 'x103', 'neha.sharma@classic.com', '2', 1002, 'Sales Rep');
select * from Employees;

create table Customers(
customerNumber int primary key,
customerName varchar(100),
contractLastName varchar(100),
contractFirstName varchar(100),
phone varchar(100),
addressLine1 varchar(100),
addressLine2 varchar(100),
city varchar(100),
state varchar(100),
postalCode int,
country varchar(100),
SalesRepEmployeeNumber int,
creditLimit int,
foreign key(SalesRepEmployeeNumber)references employees(employeeNumber)
);
insert into Customers(customerNumber,customerName,contractLastName,contractFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,SalesRepEmployeeNumber,creditLimit)
values 
(2001, 'ABC Traders', 'Rao', 'Vikram', '+91-9876543210','Anna Nagar', NULL, 'Chennai', 'Tamil Nadu', '600040', 'India', 1056, 150000),
(2002, 'XYZ Electronics', 'Patel', 'Amit', '+91-9123456789', 'Indiranagar', NULL, 'Bangalore', 'Karnataka', '560038', 'India', 1076, 200000);
select * from Customers;

create table productlines(
productLine varchar(100) primary key,
textDescription varchar(100),
htmlDescription varchar(100),
image varchar(100)
);
insert into productlines(productLine,textDescription,htmlDescription,image)
values 
('Classic Cars', 'Vintage and classic model cars', NULL, NULL),
('Motorcycles', 'Racing and sports bikes', NULL, NULL);
select * from productlines;


create table Products(
productCode varchar(100) primary key,
productName varchar(100),
productLine varchar(100),
productScale varchar(100),
productVendor varchar(100),
productDescription varchar(100),
quantityInStock int,
buyPrice int,
MSRP int,
foreign key (productLine) references productlines(productLine));
insert into Products(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP)
values 
('S10_1678', '1969 Harley Davidson', 'Motorcycles', '1:10','Min Lin Diecast','Classic Harley Davidson bike model', 100, 4800, 6500),
('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12','Autoart Studio', 'Classic Ford Mustang model', 50, 9500, 12000);
select * from Products;

create table Orders(
orderNumber int primary key,
orderDate date,
requiredDate date,
shippedDate date,
statuss varchar(100),
comments varchar(100),
customerNumber int,
foreign key (customerNumber) references customers(CustomerNumber));
insert into Orders(orderNumber,orderDate,requiredDate,shippedDate,statuss,comments,customerNumber)
values
(30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped', 'Delivered on time', 2001),
(30002, '2026-01-12', '2026-01-18', NULL, 'In Process', NULL, 2002);
select * from Orders;

create table OrderDetails(
orderNumber int ,
productCode varchar(100),
quantityOrdered int,
priceEach int,
orderLineNumber int,
primary key(orderNumber,productCode),
foreign key (orderNumber)references Orders(orderNumber),
foreign key (productCode) references products(productCode));
insert into OrderDetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber)
values
(30001, 'S10_1678', 2, 6500, 1),
(30002, 'S12_1099', 1, 12000, 1);
select * from OrderDetails;


create table Payments(
customerNumber int primary key,
checkNumber varchar(100),
paymentDate date,
amount int,
foreign key (customerNumber) references Customers(CustomerNumber));
insert into Payments(customerNumber,checkNumber,paymentDate,amount)
values
(2001, 'CHK1001', '2026-01-16', 13000),
(2002, 'CHK1002', '2026-01-17', 12000);

select * from Offices;
select * from Employees;
select * from Customers;
select * from productlines;
select * from Products;
select * from Orders;
select * from OrderDetails;
select * from Payments;
