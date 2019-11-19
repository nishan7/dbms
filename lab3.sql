drop table student cascade constraints;
drop table course cascade constraints;
drop table text cascade constraints;
drop table bad cascad constraints;
drop table enrolled cascade constraints;


create table students(
regno varchar(5) primary key,
name varchar(10),
major varchar(10),
bdate date

);

create table course(
cno int primary key,
cname varchar(10),
dept varchar(10)

);


create table enroll(
regno varchar(5),
cno int,
sem int primary key,
marks int
);

create table text (
isbn int primary key,
title varchar(15),
publisher varchar(10),
author varchar(10)
);

create table bad(
cno int,
sem int,
isbn int
);



alter table enroll add foreign key(regno) refernces students(regno);
alter table enroll add foreign key(cno) refernces course(cno);
alter table bad add foreign key(cno) refernces course(cno);
alter table bad add foreign key(sem) refernces enroll(sem);
alter table bad add foreign key(isbn) refernces text(isbn);

insert into students values('cs42', 'mikhil', 'cse', '17-dec-1986');
insert into students values('cs48', 'mujeeb', 'cse', '02-sep-1986');
insert into students values('ec26', 'pradeep', 'cse', '16-aug-1987');
insert into students values('ee37', 'majid', 'ise', '28-may-1986');
insert into students values('is48', 'wajid', 'ise', '28-may-1986');


insert into course values (1, '.net', 'computer');
insert into course values (2, 'j2ee', 'computer');
insert into course values (3, 'mis', 'infosci');
insert into course values (4, 'fs', 'infosci');
insert into course values (5, 'oracle', 'computer');

insert into enroll values('cs42', 1, 6 , 98);
insert into enroll values('cs48', 2, 3, 97);
insert into enroll values('ec26', 5, 5, 50);
insert into enroll values('is48', 3, 7, 90);
insert into enroll values('ec37', 4, 4, 80);

insert into text values(101, 'let us c', 'lpe', 'fahad');
insert into text values(102, 'c++', 'abc', 'mujeeb');
insert into text values(103, 'oracle', 'def', 'ofhman');
insert into text values(104, '.net', 'lpe', 'naushad');
insert into text values(105, 'j2ee', 'pearson', 'mikhil');

insert into bad values(1, 6, 101);
insert into bad values(1,6,103);
insert into bad values(1, 0, 102);
insert into bad values(4,4, 104);
insert into bad values(5,7, 105);

insert into text values (106, 'JAVA', 'pearson', 'avril');
insert into bad values(2, 7, 106);


alter table enroll add foreign key(regno) references students(regno);
alter table enroll add foreign key(cno) references course(cno);
alter table bad add foreign key(cno) references course(cno);
alter table bad add foreign key(sem) references enroll(sem);
alter table bad add foreign key(isbn) references text(isbn);


select s.cno , t.title , b.isbn
from course s, bad b, text t
where s.cno = b.cno and
	b.isbn = t.isbn and 
	s.dept = 'computer' AND
	b.cno  in ( select b.cno
		from bad b, course s
		where b.cno = s.cno
		group by b.cno
		having count(*) >2
		)
	order by t.title;


select s.dept, t.publisher 
from course s, bad b, text t
where s.cno = b.cno and
t.isbn = b.isbn and
t.publisher = 'lpe'

exit