use sales_management;

# TASK 1 --- AGGREGATE FUNCTIONS

# COUNT FUNCTION :

# 1 - Find the Total count of Employees
select count(*) as Total_Employees
from Employees;
# 2 - Find the Total count of Customers
select count(customerNumber) as Total_Customers
from Customers;
# 3 - Find the Total count of Branch Offices
select count(*) as Total_Branches
from Offices;

# SUM FUNCTION :

# 1 - Find the Sum of Total products price 
select sum(priceEach) as Total_Price
from OrderDetails;

# 2 - Find the Sum of Total Orders Sold
select sum(amount) as total_amount
from payments; 

# AVERAGE FUNCTION :

# 1 - Find the Average of Credit Limit
select avg(creditLimit) as avg_creditlimit
from Customers; 

# 2 - Find the Average of MSRP
select avg(MSRP) as avg_MSRP
from Products;

# 3 - Find the Average of sold products Payments   
select avg(amount) as avg_amount
from Payments;

# MIN & MAX FUNCTION :

# 1 - Find the Maxium and Minimum of payments done by the Customers
 select 
 min(amount) as Min_Payment,
 max(amount)as Max_Payment
 from Payments;
 
 # 2 - Find the Minimum and Maxium of MSRP 
 select 
 min(MSRP) as Min_MSRP,
 max(MSRP)as Max_MSRP
 from Products;
 
 # 3 - Find the Most and Least of buyPrice
 select 
 max(buyPrice)as Most_buyPrice,
 min(buyPrice) as Least_buyPrice
 from Products;
 
# TASK 2 --- AGGREGATE FUNCTIONS WITH WHERE
 
# 1 - Find how many customers are from India 
select count(*) as Total_Customers
from Customers
where country="India";

# 2 - Find the Average of CreditLimit more than 149000
select avg(creditLimit)
from Customers
where creditLimit>149000;

# 3 - Find the Total Sum of MSRP from productVendor Autoart Studio 
select 
sum(MSRP) as Total_Sum
from Products
where productVendor='Autoart Studio';

# TASK 3 --- AGGREGATE FUNCTIONS WITH GROUP-BY

# 1 - Find the Total count of status groupby 'Shipped' and 'In-Process'
select statuss,count(*) as total_status
from Orders
group by statuss;

# 2 - Find the total branches groupby country
select country,count(*) as total_branches
from Offices
group by country;

# 3 - Find the sum of Products quantity In Stock  
select productName,sum(quantityInStock) as quantityInStock
from Products
group by productName;

# TASK 4 --- SUB-QUERY

# 1 - Find the employees works in Indian Branch with there full name
select employeeNumber,firstName,lastName
from employees
where officeCode in(
  select officeCode
  from Offices
  where country="India");

# 2 - Find the SalesRepEmployeeNumberand their phone number in the position "Sales Rep" 
select SalesRepEmployeeNumber,phone
from Customers
where SalesRepEmployeeNumber in(
  select employeeNumber
  from employees
  where jobTitle="Sales Rep"
  );
# 3 - Find the maxium Buying Price of the Products
select productName,buyPrice
from products
where buyPrice=(
select 
max(buyPrice)
from productlines)