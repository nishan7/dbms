create table flights (
 no integer primary key,
 frm varchar(20),
 end varchar(20),
 dist int,
 dept date,
 arr date,
 price real
);


create table aircraft(
 aid int primary key,
 aname varchar(15),
 crange int
);


create table certified(
 eid int,
 aid int,
 primary key(eid,aid)
);


create table employees(
 eid int primary key,
 ename varchar(20),
 salary real
);


insert into flights values(255, 'bangalore','frankfurt',200, '01-aug-2011', '01-aug-2011',5000)
insert into flights values(256, 'bangalore','frankfurt',200, '01-aug-2011', '01-aug-2011',8000)
insert into flights values(257, 'bangalore','dehli',200, '01-aug-2011', '01-aug-2011',5000)
insert into flights values(258, 'bangalore','dehli',200, '01-aug-2011' , '01-aug-2011',6000)
insert into flights values(259, 'bangalore','mangalore',200, '01-aug-2011', '01-aug-2011',8000)


insert into aircraft values(685, 'boeing15', 1000);
insert into aircraft values(686, 'boeing10', 2000);
insert into aircraft values(687, 'skytrain', 1000);
insert into aircraft values(688, 'avenger', 100);

insert into certified values(101, 685);
insert into certified values(102, 686);
insert into certified values(101, 687);
insert into certified values(101, 688);
insert into certified values(101, 686);
insert into certified values(103, 685);
insert into certified values(103, 687);

insert into employees values (101, 'asha', 90000);
insert into employees values (102, 'arun', 85000);
insert into employees values (103, 'anand', 3000);
insert into employees values (104, 'ramya', 4000); 
