use sales_management;
select * from Offices;
select * from Employees;
select * from Customers;
select * from productlines;
select * from Products;
select * from Orders;
select * from OrderDetails;
select * from Payments;

# 1.Perform an insert 5 new Branch Office table and update Banglore city's addressLine 1 to church Street 

insert into Offices (officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values
('3',"Anchorage","+11-11-1111111","Kenai Fjords National Park",NULL,"Alaska","USA","996644","ASAP"),
('4',"New York","+1-212-5551234","5th Avenue",NULL,"New York","USA","10001","NAHQ"),
('5',"London","+44-20-79460000","221B Baker Street",NULL,"London","UK","901690","EMEA"),
('6',"Tokyo","+81-3-12345678","Shinjuku District",NULL,"Tokyo","Japan","1600022","APAC"),
('7',"Sydney","+61-2-98765432","George Street",NULL,"Sydney","Australia","2000","ANZ"),
('8',"Dubai","+971-4-1234567","Sheikh Zayed Road",NULL,"Dubai","UAE","00000","MEA"),
('9',"Chennai","+91-44-23456789","Anna Salai",NULL,"Tamil Nadu","India","600002","INHQ");
update Offices
set addressLine1="Church Street"
where officeCode=2;
select * from Offices;

# 2. Retrieve all employees who work in officeCode '1'.

select *
from Employees
where officeCode ='1';

# 3. Display customer names and their credit limits where credit limit is greater than 150000.

select customerName,creditLimit 
from Customers
where creditLimit>150000;

# 4 . Show all orders that are not yet shipped.

select * from Orders
where statuss != "Shipped";

# 5 -  List product names and their buying price while the MSRP in descending order.

select productName,buyPrice
from Products
order by MSRP desc;

# 6 - Delete the office where officeCode is 5.

delete from Offices
where officeCode='5';
select * from Offices;

# 7 - Update the contracted Customer FirstName Amit rename it to Sudar .

Update Customers
set contractFirstName="Sudar"
where contractFirstName="Amit";
select * from Customers;

# 8 - Reduce the Mustang Quatity in Stock - 1 which has sold now

update Products
set quantityInStock=quantityInStock-1
where productCode="S12_1099";
select * from Products;

# 9 - Increase the price (MSRP) of all products in 'Motorcycles' by 10%
update Products
set MSRP = MSRP*1.10
where productLine="Motorcycles";
select * from Products;

# 10 - insert a order with order number 30003 and Delete the order 30003.

insert into Orders values(30003,NULL,NULL,NULL,NULL,NULL,NULL);
select * from Orders ;
delete from Orders
where orderNumber =30003;
select * from Orders ;