create database bank_1
use bank_1

create table bank(code int,B_Name varchar(20),bank_addr varchar(50),
				primary key(code))
create table Customer(SSN int, phone int, C_Address varchar(50), Customer_name varchar(25),
				primary key(SSN))
create table bank_branch(Branch_Address varchar(50),Branch_no int,code int,
				primary key(Branch_no,code),
				Constraint fk1 foreign key(code) references bank(code))
create table account(acc_no int, balance float,type varchar(20),Branch_no int,code int,
					primary key(acc_no),
					Constraint fk2 foreign key(Branch_no,code) references bank_branch(Branch_no,code))
create table a_c(SSN int,acc_no int,
				primary key(SSN,acc_no),
				Constraint fk3 foreign key(SSN) references Customer(SSN),
				Constraint fk4 foreign key(acc_no) references  account(acc_no))

insert into bank values(101,'Karkala','nitte')
insert into customer values(4,844541791,'Udupi','Anusha')
insert into bank_branch values('karkala',1,101)
insert into account values(123456,45.6,'saving',1,101)
insert into a_c values(1,123456)

select * from bank
select * from customer
select * from bank_branch
select * from account
select * from a_c