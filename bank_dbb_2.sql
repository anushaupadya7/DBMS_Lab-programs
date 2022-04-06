create database bank_db_2
use bank_db_2

create table bank(code int,B_Name varchar(20),bank_addr varchar(50),
				primary key(code))
create table Customer(SSN int, phone int, C_Address varchar(50), Customer_name varchar(25),
				primary key(SSN))
create table bank_branch(Branch_Address varchar(50),Branch_no int,code int,
				primary key(Branch_no,code),
				Constraint fk1 foreign key(code) references bank(code))
create table loan(loan_no int, amount float,l_type varchar(20),Branch_no int,code int,
					primary key(loan_no),
					Constraint fk2 foreign key(Branch_no,code) references bank_branch(Branch_no,code))
create table l_c(loan_no int,SSN int,
				primary key(loan_no,SSN),
				Constraint fk3 foreign key(loan_no) references loan(loan_no),
				Constraint fk4 foreign key(SSN) references Customer(SSN))

insert into bank values(101,'Karkala','nitte')
insert into customer values(4,844541791,'Udupi','Anusha')
insert into bank_branch values('karkala',1,101)
insert into loan values(123456,45.6,'saving',1,101)
insert into l_c values(123456,4)

select * from bank
select * from customer
select * from bank_branch
select * from loan
select * from l_c
