create database blood
use blood
create table donor(did varchar(20) primary key,nm varchar(20),sex char(1),age int,adr varchar(20))
create table bloodbank(bno varchar(20) primary key,adrs varchar(20),nam varchar(20))
create table blood(code varchar(20) primary key,typ varchar(20),cost int,qty int,
did1 varchar(20) references donor(did),blno varchar(20) references bloodbank(bno))
create table hospital(hnm varchar(20) primary key,addrs varchar(20),pn varchar(20))
create table orders(hname varchar(20) references hospital(hnm),blono varchar(20) references bloodbank(bno),
primary key(hname,blono),quan int)

insert into donor values('123','aadarsh','M',22,'varanasi')
insert into donor values('124','akash','M',24,'kanpur')
insert into donor values('125','aditya','M',21,'nepal')
insert into donor values('126','anushka','F',19,'patna')

insert into bloodbank values('200','korea','mota donor')
insert into bloodbank values('210','udupi','chota donor')
insert into bloodbank values('220','manglore','khota donor')
insert into bloodbank values('230','karkala','lota donor')

insert into blood values('300','A+',500,2,'123','200')
insert into blood values('340','A+',500,4,'123','220')
insert into blood values('310','A',1500,5,'124','210')
insert into blood values('320','B+',4500,9,'125','220')
insert into blood values('330','B',2500,3,'126','230')

insert into hospital values('yo','abc','6748390303')
insert into hospital values('yoyo','efg','6748390223')
insert into hospital values('yoyoyo','hij','67487860303')
insert into hospital values('yoyoyoyo','stu','6748310903')

insert into orders values('yo','200',2)
insert into orders values('yoyo','210',12)
insert into orders values('yoyoyo','220',22)
insert into orders values('yo','230',27)
insert into orders values('yoyoyoyo','200',21)

select * from donor
where did in(select did1 from blood,hospital,orders
where blono=blno and hname=hnm and hnm='yo')

create view v1 as(select nm,max(qty)as maxm from donor,blood
where did=did1
group by nm)
select * from v1
select nm from v1 where maxm in(select max(maxm) from v1)

create view v2 as (select hname, max(qty)  as c from orders,blood
where typ='A+' and blno=blono 
group by hname)
select * from v1
select hname from v2 where c in(select max(c) from v2)