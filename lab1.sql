drop table student cascade constraints;
drop table faculty cascade constraints;
drop table class cascade constraints;
drop table enrolled cascade constraints;



create table student(
	snum int primary key,
	sname varchar(20),
	major varchar(5),
	level1 varchar(2),
	age int
);

create table faculty(
	fid int primary key,
	fname varchar(20),
	deptid int
);

create table class(
	cname varchar(20) primary key,
	meetsat varchar(20),
	room varchar(20),
	fid int references faculty(fid)
);

create table enrolled(
	snum int references student(snum),
	cname references class(cname)
);


insert into student values(1,'rakesh', 'cs', 'jr', 18);
insert into student values(2,'raju', 'cs', 'ss', 19);
insert into student values(3,'ram', 'is', 'sj', 21);
insert into student values(4,'hamit', 'civil', 'jr', 18);
insert into student values(5,'Kammi', 'is', 'jr', 18);

insert into faculty values(11,'harshith', 111);
insert into faculty values(22,'anchal', 111);
insert into faculty values(33,'aka', 222);
insert into faculty values(44,'van dijk', 333);
insert into faculty values(55,'ashish', 333);

insert into class values('1st sem','11am-12am', 'R128', 11);
insert into class values('2nd sem','10am-11am', 'R126', 22);
insert into class values('3rd sem','12am-1pm', 'R125', 33);
insert into class values('4th sem','9am-10am', 'R126', 55);
insert into class values('5th sem','11am-12am', 'R125', 22);
insert into class values('6th sem','9am-10am', 'R128', 22);

insert into enrolled values(1,'1st sem');
insert into enrolled values(2,'2nd sem');
insert into enrolled values(3,'3rd sem');
insert into enrolled values(4,'4th sem');
insert into enrolled values(5,'5th sem');




select distinct  s1.sname, s1.snum
from student s1, student s2, class c1, class c2, enrolled e1, enrolled e2
where s1.snum = e1.snum and s2.snum = e2.snum and
	e1.cname = c1.cname and e2.cname = c2.cname and c1.cname <> c2.cname and
	c1.meetsat = c2.meetsat;




select s.sname 
from student s, faculty f, class c, enrolled e
where f.fid = c.fid and c.cname = e.cname and e.snum = s.snum and f.fname = 'harshith' and s.level1='jr';



select c.cname 
from class c 
where c.room='R128'
UNION
select e.cname
from enrolled e
group by (e.cname)
having count(e.snum) >=5





exit