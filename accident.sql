create database accidentsee
use accidentsee
create table person(did varchar(20) primary key,nm varchar(20),adrs varchar(20))
create table cars2(rno varchar(20) primary key,model varchar(20),yr char(4))
create table acc(loc varchar(20),rep varchar(20) primary key,accd varchar(20))
create table owns(drid varchar(20) references person(did),regno varchar(20) references cars2(rno),primary key(drid,regno))
create table participate(driid varchar(20) references person(did),reno varchar(20) references cars2(rno),repno varchar(20) references acc(rep),
primary key(driid,reno,repno))


insert into person values('123','abc','zxc')
insert into person values('124','def','mnb')
insert into person values('125','ghi','poi')
insert into person values('126','jkl','aqw')
select * from person
insert into cars2 values('100','mercedes','2021')
insert into cars2 values('101','tesla','2011')
insert into cars2 values('102','swift','2007')
insert into cars2 values('103','innova','2016')
select * from cars2
insert into acc values('ert','200','death')
insert into acc values('out','210','fucked')
insert into acc values('pet','220','safe')
insert into acc values('set','230','critical')
select* from acc
insert into owns values('123','100')
insert into owns values('123','102')
insert into owns values('124','103')
insert into owns values('125','100')
insert into owns values('126','102')
select * from owns
insert into participate values('123','100','200')
insert into participate values('123','100','210')
insert into participate values('123','102','210')
insert into participate values('125','100','220')
insert into participate values('126','102','230')
insert into participate values('124','103','230')
insert into participate values('125','100','230')
select * from participate

select * from person
select * from cars2
select* from acc
select * from owns
select * from participate

select nm 
from person,cars2,owns
where model='mercedes' and did=drid and rno=regno

create view v1 as(select model,count(*)as c from cars2,participate where rno=reno group by model)
select * from v1
select model from v1 where c in(select max(c) as maxm from v1)

select loc 
from acc
where rep in(select repno 
			from participate,person,cars2 
			where nm='abc' and yr>2015 and did=driid and repno=rep)

create view v4 as(select nm,count(*) as c
from person,participate
where did=participate.driid
group by nm)
select * from v4

select nm from v4
where c in(select c from v4 where c>=2)