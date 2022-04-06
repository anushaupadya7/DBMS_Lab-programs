create database game
use game

create table team(team_name varchar(20), no_of_players int,
				 primary key(team_name))
create table games(g_date date, result varchar(10), team_name varchar(20),
				primary key(g_date), 
				Constraint fk1  foreign key (team_name) references team(team_name))
create table player(player_no int, team_name varchar(20),player_name varchar(50),
					primary key(player_no, team_name ),
					Constraint fk2  foreign key (team_name) references team(team_name))
create table plays(g_date date,player_no int,team_name varchar(20),player_position varchar(20),
				  primary key(g_date,player_no, team_name ),
				  Constraint fk3  foreign key (g_date) references games(g_date),
				  Constraint fk4  foreign key (player_no,team_name) references player(player_no,team_name))
create table no_of_players(g_date date,players varchar(50),
						   primary key(g_date,players),
						   Constraint fk5  foreign key (g_date) references games(g_date))

select * from team
select * from games
select * from player
select * from plays
select * from no_of_players

sp_help plays

insert into team values('RED',10)
insert into games values ('12-02-2020','Win','Red')
insert into player values(1,'RED','Anusha')
insert into plays values('12-02-2020',1,'RED','Front')
insert into no_of_players values('12-02-2020','10')

insert into team values('green',10)
insert into team values('Yellow',10)
insert into team values('Orange',10)

insert into games values ('02-02-2020','draw','Yellow')
insert into games values ('12-12-2020','draw','Red')
insert into games values ('12-12-2021','lost','Red')


select team_name
from games
where result='draw' or result='win' except(select team_name
											from games
											where result='lost')