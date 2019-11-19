CREATE TABLE branch(
    bname VARCHAR(10) PRIMARY KEY,
    city VARCHAR(10),
    assets REAL
); 

CREATE TABLE ACCOUNT(
    accno INT PRIMARY KEY,
    bname VARCHAR(10),
    balance REAL,
    FOREIGN KEY(bname) REFERENCES branch(bname)
);
 
CREATE TABLE cust(
    cname VARCHAR(10) PRIMARY KEY,
    cstreet VARCHAR(10) NOT NULL,
    city VARCHAR(10) NOT NULL
);

 CREATE TABLE depositor(
    cname VARCHAR(10),
    accno INT,
    PRIMARY KEY(cname, accno),
    FOREIGN KEY(accno) REFERENCES ACCOUNT(accno) ON DELETE CASCADE,
    FOREIGN KEY(cname) REFERENCES cust(cname) ON DELETE CASCADE
);
 
CREATE TABLE loan(
    lno INT PRIMARY KEY,
    bname VARCHAR(10) NOT NULL,
    amt REAL,
    FOREIGN KEY(bname) REFERENCES branch(bname) ON DELETE CASCADE
);
 
CREATE TABLE borrower(
    cname VARCHAR(10),
    lno INT,
    PRIMARY KEY(cname, lno),
    FOREIGN KEY(cname) REFERENCES cust(cname) ON DELETE CASCADE,
    FOREIGN KEY(lno) REFERENCES loan(lno) ON DELETE CASCADE
);



insert into branch values('abc','bang',1200000); 
insert into branch values('def','che',2000000);
insert into branch values('abn','mum',330000);
insert into branch values('xyz','hyd',555555);
insert into branch values('mno','bang',9999999);

insert into  account values(1,'abc',25000);
insert into  account values(2,'def',12000);
insert into  account values(3,'def',1000);
insert into  account values(4,'abn',10000);
insert into  account values(5,'mno',600000);
insert into  account values(6,'xyz',50000);

insert into cust values('mik','ab','bang');
insert into cust values('muj','cd','bang');
insert into cust values('maj','ef','che');
insert into cust values('waj','xy','del');
insert into cust values('prad','lm','mum');
insert into cust values('now','op','hyd');

insert into depositor values('mik',2);
insert into depositor values('muj',1);
insert into depositor values('muj',5);
insert into depositor values('prad',4);
insert into depositor values('maj',3);
insert into depositor values('waj',6);
insert into depositor values('mik',3);

insert into loan values(1,'abc',5000);
insert into loan values(2,'def',1500);
insert into loan values(3,'abn',10000);
insert into loan values(4,'xyz',3500);
insert into loan values(5,'mno',20000);

insert into borrower values('mik',2);
insert into borrower values('muj',1);
insert into borrower values('prad',3);
insert into borrower values('maj',4);
insert into borrower values('waj',5);
