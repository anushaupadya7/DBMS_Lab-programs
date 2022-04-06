create database booksee
use booksee
create table author(aid varchar(20) primary key,fname varchar(20),lname varchar(20))
create table publisher(pid varchar(20) primary key,pname varchar(20))
create table book(bid varchar(20) primary key,yob varchar(20),bname varchar(20),pid2 varchar(20) references publisher(pid))
create table noc(bid2 varchar(20) references book(bid),nocop int,primary key(bid2,nocop))
create table written(auid varchar(20) references author(aid),boid varchar(20) references book(bid),
primary key(auid,boid))

SELECT * FROM author
SELECT * FROM publisher
SELECT * FROM book
SELECT * FROM noc
SELECT * FROM written

insert into AUTHOR values('1','Rabindranath','Tagore')
insert into AUTHOR values('2','Chethan','Bhagath')

insert into publisher values('1','Amazon Publishing')


insert into book values('1','2020','Geetanjali','1')
insert into book values('2','2000','Gurudas','1')

insert into noc values('1','2020')
insert into noc values('2','20200')
insert into noc values('2','80000')
insert into written values('1','1')
insert into written values('1','2')
insert into noc values('1','2')

Create view v2 as(
Select bname,SUM(nocop) as maxcopy
From BOOK,noc,publisher,author,written
Where bid=bid2 and pid=pid2 and aid=auid and boid=bid2 and pname='amazon publishing' and fname='Rabindranath' and lname='Tagore'
Group by bname)

Select * from v2

Select  bname
From v2
where maxcopy IN(Select MAX(maxcopy)
				From V2)








Select bname,nocop
From BOOK,noc,publisher,author,written
Where bid=bid2 and pid=pid2 and aid=auid and boid=bid2 and pname='amazon publishing' and fname='Rabindranath' and lname='Tagore'
and nocop IN(Select MAX(nocop)
From BOOK,noc,publisher,author,written
Where bid=bid2 and pid=pid2 and aid=auid and boid=bid2 and pname='amazon publishing' and fname='Rabindranath' and lname='Tagore'
)