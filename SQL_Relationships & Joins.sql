create database college;
use college;
create table COURSES(
courseID int primary key,
courseName varchar(50)
);

create table DEEN(
DeenId int auto_increment primary key,
DeenName varchar(50),
Address1 varchar(50),
Address2 varchar(50),
phone varchar(20)
);

create table HOD(
HOD_ID int auto_increment primary key,
HOD_Name varchar(50),
phone varchar(20),
DeenId int,
collegeName varchar(50),
reportsTo int,
foreign key (DeenId) references DEEN(DeenId)
);

create table TUITOR(
tuitorID int auto_increment primary key,
courseID int,
tuitorName varchar(50),
AddressLine1 varchar(50),
AddressLine2 varchar(50),
state varchar(50),
Pincode varchar(50), 
phone varchar(20),
HOD_ID int,
foreign key (courseID) references COURSES(courseID),
foreign key (HOD_ID) references HOD(HOD_ID)
);

create table STUDENTS(
studentID int auto_increment primary key,
courseID int,
firstName varchar(50),
lastName varchar(50),
Address1 varchar(50),
Address2 varchar(50),
phone varchar(20),
tuitorID int,
city varchar(50),
state varchar(50),
Pincode varchar(50),
foreign key (courseID) references COURSES(courseID),
foreign key (tuitorID) references TUITOR(tuitorID)
);

create table FEE(
courseID int primary key,
courseName varchar(50),
courseFee decimal(10,2),
foreign key (courseID) references COURSES(courseID)
);

insert into COURSES (courseID,courseName)
values 
(1, 'B.Sc CS'),
(2, 'B.Sc CT'),
(3, 'BBA'),
(4, 'B.com'),
(5, 'Bio Tech'),
(6,'CS');

insert into DEEN (DeenName, Address1, Address2, phone)
values 
('Dr.Rahman', 'ChurchStreet 1', 'CS Layout', '9876543210'),
('Dr.Ramesh', 'BTM 1', 'BTM Layout', '9877843210'),
('Dr.Bibi', 'Kormagla 1', 'KG Layout', '9846543210'),
('Dr.Harshit', 'Bansangari 1', 'BAN Layout', '9876543220'),
('Dr.Raja', 'RajStreet 1', 'RJ Layout', '9876543222');

insert into HOD (HOD_Name, phone, DeenId, collegeName,reportsTo)
values 
('Dr.Kumar', '9123456780', 1, 'ABC College',null),
('Dr.Rakesh', '9122456780', 2, 'ABC College',null),
('Dr.Vignesh', '9123456780', 3, 'ABC College',1),
('Dr.Siva', '9123456720', 1, 'ABC College',2),
('Dr.Simon', '9123426780', null, 'ABC College',1);

insert into TUITOR (courseID, tuitorName, phone, HOD_ID)
values 
(1, 'Mr. Ravi', '9000000000', 1),
(2, 'Mrs. Banu', '8000000000', 2),
(2, 'Mr. Manu', '7000000000', 3),
(4, 'Mrs.Diya', '6000000000', 1),
(5, 'Mr. Jose', '5000000000', 5);

insert into STUDENTS (courseID, firstName, lastName, phone, tuitorID)
values 
(1, 'Ali', 'Khan', '8888888888', 1),
(2, 'Siva', 'Kumar', '8888888888', 2),
(3, 'Ahmed', 'Khan', '8888888888', 3),
(4, 'Mathew', 'Simon', '8888888888', 4),
(5, 'rithick', 'Mathew', '8888888888', NULL);

insert into FEE (courseID,courseName,courseFee)
 values 
(1, 'B.Sc CS', 50000),
(2, 'B.Sc CT', 40000),
(3, 'BBA', 45000),
(4, 'B.com', 49000),
(5, 'Bio Tech', 52000),
(6,'CS',50000);

# Right Join

select 
TUITOR.tuitorName,
STUDENTS.firstName,
STUDENTS.lastname
from TUITOR 
right join STUDENTS
on TUITOR.TuitorID = STUDENTS.TuitorID ;

select 
HOD.HOD_Name,
Deen.DeenName
from HOD
right join Deen
on HOD.DeenId =Deen.DeenId;

# Left Join

select 
HOD.HOD_Name,
Deen.DeenName
from HOD
left join Deen
on HOD.DeenId =Deen.DeenId;

select 
TUITOR.tuitorName,
STUDENTS.firstName,
STUDENTS.lastname
from TUITOR 
left join STUDENTS
on TUITOR.TuitorID = STUDENTS.TuitorID ;

# Inner Join
select 
HOD.HOD_Name,
Deen.DeenName
from HOD
inner join Deen
on HOD.DeenId =Deen.DeenId;
 
select 
TUITOR.tuitorName,
STUDENTS.firstName,
STUDENTS.lastname
from TUITOR 
inner join STUDENTS
on TUITOR.TuitorID = STUDENTS.TuitorID ;

# Full Join
select 
HOD.HOD_Name,
Deen.DeenName
from HOD
left join Deen
on HOD.DeenId =Deen.DeenId
union
select 
HOD.HOD_Name,
Deen.DeenName
from HOD
right join Deen
on HOD.DeenId =Deen.DeenId;

select 
TUITOR.tuitorName,
STUDENTS.firstName,
STUDENTS.lastname
from TUITOR 
left join STUDENTS
on TUITOR.TuitorID = STUDENTS.TuitorID 
union
select 
TUITOR.tuitorName,
STUDENTS.firstName,
STUDENTS.lastname
from TUITOR 
right join STUDENTS
on TUITOR.TuitorID = STUDENTS.TuitorID ;

# SELF JOIN

select
h.HOD_Name as HOD,
m.HOD_Name as Manager
from hod h
left join hod m
on h.reportsTo=m.HOD_ID;

# CROSS JOIN

select 
deen.DeenName,
hod.HOD_Name
from deen
cross join hod;