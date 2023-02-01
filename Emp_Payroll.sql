--Welcome to Employee Payroll Service Problem

create database Payroll_Service
use Payroll_Service

create table Employee_Payroll(
Emp_ID int identity(1,1) not null Primary key,
Name varchar(50),
Salary bigint,
StartDate datetime
)

insert into Employee_Payroll (Name,Salary,StartDate) values 
('Rekha',697820,'2016-11-09'),
('Jaya',354339,'2018-03-18')

select * from Employee_Payroll

select Salary from Employee_Payroll where Name = 'Bill'
select Name from Employee_Payroll where StartDate between '2018-01-01' and '2022-04-18'
select Name from Employee_Payroll where StartDate between '2018-01-01' and GETDATE()

alter table Employee_Payroll add Gender varchar(1)

update Employee_Payroll set Gender = 'M'
update Employee_Payroll set Gender = 'F' where Name in ('Rekha','Jaya')

select Gender, sum(Salary) as Total_Salary from Employee_Payroll group by Gender
select Gender, avg(Salary) as Average_Salary from Employee_Payroll group by Gender
select Gender, min(Salary) as Minimum from Employee_Payroll group by Gender
select Gender, max(Salary) as Maximum from Employee_Payroll group by Gender
select Gender, count(*) as Male_or_Female from Employee_Payroll group by Gender

select Gender,
count(*) as Male_or_Female,
sum(Salary) as Total_Salary,
avg(Salary) as Average_Salary,
min(Salary) as Minimum,
max(Salary) as Maximum 
from Employee_Payroll group by Gender

create table Employee_Department(
ID int identity(1,1) not null,
Department varchar(50) not null,
Phone bigint, 
Address varchar(100),
)
alter table Employee_Department add constraint Same_ID_One foreign key (ID) references Employee_Payroll(Emp_ID)

insert into Employee_Department(Department,Phone,Address) values
('IT',9653217890,'Ghaziabad'),
('Admin',9512364078,'Mumbai'),
('Sales',9632145087,'Delhi'),
('Management',9012457863,'Lucknow'),
('Sales',9965877410,'Pune'),
('IT',9663322115,'Bengaluru')

select * from Employee_Department

select Employee_Payroll.Emp_ID, Name, Salary, StartDate, Gender, Department, Phone, Address
from Employee_Payroll 
left join Employee_Department on Employee_Payroll.Emp_ID = Employee_Department.ID

create table Payroll(
ID int identity(1,1) not null,
BasicPay bigint,
Deductions bigint,
TaxablePay bigint,
IncomeTax bigint,
NetPay bigint
)
alter table Payroll add constraint Same_ID_Two foreign key (ID) references Employee_Payroll(Emp_ID)

insert into Payroll(BasicPay,Deductions,TaxablePay,IncomeTax,NetPay) values
(30010,120,156,363,450),
(24230,500,149,132,400),
(44000,420,136,456,350),
(56000,550,155,950,780),
(46000,120,163,431,600),
(12300,450,141,161,660)

select * from Payroll

select Employee_Payroll.Emp_ID, Name, Salary, StartDate, Gender, Department, Phone, Address, BasicPay, Deductions, TaxablePay, IncomeTax, NetPay
from Employee_Payroll 
left join Employee_Department on Employee_Payroll.Emp_ID = Employee_Department.ID
left join Payroll on Employee_Payroll.Emp_ID = Payroll.ID

exec GetAllEmployeeDetails
exec UpdateDetails 1, 30450
