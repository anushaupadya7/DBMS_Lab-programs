create database STUDENT_ANU

use STUDENT_ANU

create table DEPARTMENT (Dept_Id int primary key,
						 DName varchar(50))

insert into DEPARTMENT values(1,'ISE')

create table STUDENT(USN varchar(15) primary key,
                     FName varchar(50),
					 DOB date,
					 Gender char(1),
					 Addr varchar(50))

alter table STUDENT add Dept_Id int
alter table STUDENT add constraint fk1 foreign key (Dept_Id) references DEPARTMENT (Dept_ID)

create table COURSE(COURSE_ID varchar(15) primary key,
                     CTITLE varchar(50),
					 CREDITS float,
					 Dept_ID int,
					 Constraint FK2 Foreign key(Dept_ID) REFERENCES DEPARTMENT(DEPT_ID))

create table GRADE_REPORT(USN varchar(15),
						  COURSE_ID varchar(15),
						  MSE1 int,
						  MSE2 int, 
						  Task int,
						  SEE int,
						  Total int,
						  primary key(USN,COURSE_ID),
						  Constraint FK3 Foreign key(USN) REFERENCES STUDENT(USN),
						  Constraint FK4 Foreign key(COURSE_ID) REFERENCES COURSE(COURSE_ID))

create table Class(Sem int,
				   Sec char(1),
				   USN varchar(15),
				   primary key(Sem,Sec,USN),
				   Constraint FK5 Foreign key(USN) REFERENCES STUDENT(USN))

insert into DEPARTMENT values(2,'CSE')
insert into DEPARTMENT values(3,'MECH')
insert into DEPARTMENT values(4,'EC')
insert into DEPARTMENT values(5,'CIVIL')

insert into STUDENT values('4NM19IS002','ABCD','2001-01-01','F','Karnataka',1)
insert into STUDENT values('4NM19CS002','Anusha','2001-02-01','F','Karnataka',2)
insert into STUDENT values('4NM19ec002','Ashika','2001-03-01','F','Karnataka',4)
insert into STUDENT values('4NM19ec003','Ashwini','2001-03-01','F','Karnataka',4)
insert into STUDENT values('4NM19ec004','Ashimia','2001-03-01','F','Karnataka',4)
insert into STUDENT values('4NM19ec005','Ashimilia','2001-03-01','F','Karnataka',4)
insert into STUDENT values('4NM19ME002','Dhanish','2001-04-01','F','Karnataka',3)
insert into STUDENT values('4NM19CV002','Jyothsna','2001-05-01','F','Karnataka',5)
insert into STUDENT values('4NM19ME050','Dhanush','2001-04-01','M','Karnataka',3)

insert into COURSE values('19IS001','DBMS',10,1)
insert into COURSE values('19IS002','MCES',9,1)
insert into COURSE values('19IS003','FAFL',10,2)
insert into COURSE values('19IS004','DM',9,1)
insert into COURSE values('19IS005','OS',10,2)

insert into GRADE_REPORT values('4nm19CS002','19IS002',18,20,9,49,99)
insert into GRADE_REPORT values('4nm19CS002','19IS001',20,20,9,49,99)
insert into GRADE_REPORT values('4nm19IS002','19IS002',20,20,9,49,99)
insert into GRADE_REPORT values('4nm19ec002','19IS003',20,20,9,49,99)
insert into GRADE_REPORT values('4nm19ec003','19IS003',20,20,9,49,99)
insert into GRADE_REPORT values('4nm19ec004','19IS003',20,20,10,50,100)
insert into GRADE_REPORT values('4nm19ME002','19IS004',20,20,9,49,99)
insert into GRADE_REPORT values('4nm19CV002','19IS005',20,20,9,49,99)

insert into CLASS values(1,'A','4NM19IS002')
insert into CLASS values(2,'B','4NM19CS002')
insert into CLASS values(3,'C','4NM19ec002')
insert into CLASS values(4,'D','4NM19ME002')
insert into CLASS values(5,'A','4NM19CV002')
insert into CLASS values(3,'A','4NM19ME050')


select * from STUDENT
select * from DEPARTMENT
select * from COURSE
select * from GRADE_REPORT
select * from CLASS

//1

Select * 
From CLASS C,STUDENT S
Where Sem='5' and Sec='A' and S.USN=C.USN

//2

Select Sem,Sec,Gender,Count(Gender) as count_student
From STUDENT S,CLASS C
Where S.USN=C.USN
GROUP BY Sem,Sec,Gender

Create view MSE1Mark_2 as
	Select FName,S.USN,CTITLE,MSE1
	From  STUDENT S,COURSE C,GRADE_REPORT G
	Where S.USN=G.USN and C.Course_id=G.COURSE_ID and S.USN='4NM19CS002'

Select * from MSE1Mark_2


create view maxi as(
Select D.DName,count(*) as count
From STUDENT S, DEPARTMENT D
Where S.Dept_ID=D.Dept_ID
group by D.DName
)

select * from maxi

Select DName
From maxi
Where count in(Select MAX(count)
				From maxi)




