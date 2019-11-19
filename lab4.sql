create table author
(
aid int primary key,
name varchar(15),
city varchar(15),
country varchar(15)
);

create table publisher
(
pid int primary key,
name varchar(15) ,
city varchar(15) ,
country varchar(15)
);

create table category
(
cid int primary key,
description varchar(15)
);

create table catalog
(
bid int primary key,
title varchar(15),
aid references author,
pid references publisher,
cid references category,
year int,
price int
);

create table odetails
(
ono int,
bid references catalog,
qty int
);



insert into author values (1,'mik','bang','ind');
insert into author values (2,'muj','bang','ind');
insert into author values (3,'prad','tri','aus');
insert into author values (4,'maj','anan','ame');
insert into author values (5,'waj','anan','euro');

insert into publisher values (101,'pearson','bang','ind');
insert into publisher values (102,'tata','mumbai','aus');
insert into publisher values (103,'sapna','che','euro');
insert into publisher values (104,'abc','tri','ame');
insert into publisher values (105,'xyz','anan','ind');

insert into category values (1001,'computer');
insert into category values (1002,'electronics');
insert into category values (1003,'maths');
insert into category values (1004,'science');
insert into category values (1005,'electrical');


insert into catalog values (111,'lib1',1,101,1001,2002,500);
insert into catalog values (112,'lib2',2,102,1002,2000,800);
insert into catalog values (113,'lib3',3,103,1003,2003,200);
insert into catalog values (114,'lib4',4,104,1001,2006,350);
insert into catalog values (115,'lib5',5,105,1004,2007,100);
insert into catalog values (116,'lib6',2,103,1005,2007,600);
insert into catalog values (117,'lib7',2,105,1002,2007,450);
insert into catalog values (118,'lib8',1,101,1001,2002,500);

insert into odetails values (1,111,2);
insert into odetails values (2,112,3);
insert into odetails values (3,111,5);
insert into odetails values (4,113,1);
insert into odetails values (5,114,2);
insert into odetails values (6,115,1);
insert into odetails values (1,114,2);
insert into odetails values (2,113,2);



select name, city, country
from author
where aid in ( select aid from catalog
               where year>2000
               and price > (select avg(price) from catalog)
               group by aid
               having count(*) > 1);



select a.aid, name
from author a, catalog c
where a.aid=c.aid and
c.bid=(select bid
from odetails
group by bid
having sum(qty) = (select max(sum(qty))
from odetails


update catalog
set price=1.1*price
where pid in (select pid
from publisher
where name='abc');
group by bid));

exit
