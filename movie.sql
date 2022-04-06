create database movie

create table actor
(actid varchar(30) primary key,
fname char(30),
lname char(30),
phone int,
gen char(1),
age int)
create table director
(dirid varchar(30) primary key,
fname char(30),
lname char(30),
phone int)
create table movie
(movid varchar(30) primary key,
title varchar(30),
year int,
dirid varchar(30) references director(dirid))
create table viewer
(viwid varchar(30) primary key,
name char(30))
create table movcast
(actid varchar(30) references actor,
movid varchar(30) references movie,
role char(30),
primary key(actid,movid))
create table rating
(star int ,
movid varchar(30) references movie,
viwid varchar(30) references viewer,
primary key(movid,viwid))


select * from actor
select * from director
select * from movie
select * from viewer
select * from movcast
select * from rating

insert into actor values('1','DULQ','SAL',123,'M',23)
insert into actor values('2','abc','SAL',123,'M',23)
insert into actor values('3','aNURAS','SAL',123,'F',23)

insert into director values('1','an','upL',123)

insert into movie values('1','pushpa',2020,'1')
insert into movie values('2','baahpa',2020,'1')
insert into movie values('3','KGF',2020,'1')

insert into viewer values('1','nusha')
insert into viewer values('2','usha')
insert into viewer values('3','nusha')

insert into rating values('4','1','1')
insert into rating values('5','2','1')
insert into rating values('2','3','1')
insert into rating values('3','1','2')
insert into rating values('4','2','3')
insert into rating values('3','3','3')

insert into movcast values('1','1','comedy')
insert into movcast values('1','2','comedy')
insert into movcast values('2','1','comedy')
insert into movcast values('2','2','comedy')
insert into movcast values('2','3','comedy')

Select A.fname,A.LName
From  MOVCAST C,ACTOR A,Movie M
Where C.ACTID=A.ACTID and C.movid=M.movid and m.title='pushpa'

Select A.fname,A.LName
From MOVIE M , MOVCAST C,ACTOR A
Where M.MOVID=C.MOVID AND M.YEAR=2020 and C.ACTID=A.ACTID AND gen='M'
     and M.movid=(Select MAX(M.movid)
				From MOVIE M , MOVCAST C,ACTOR A
				Where M.MOVID=C.MOVID AND M.YEAR=2020 and C.ACTID=A.ACTID AND gen='M')

Select m.title,MAX(r.star) as highest_rating
from rating r,movie m
where m.movid=r.movid
group by m.title





Select m.title,MAX(r.star) as highest_rating
from rating r,movie m
where m.movid=r.movid
group by m.title
