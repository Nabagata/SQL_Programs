
CREATE TABLE SalesPerson (
  spno NUMBER(4) NOT NULL,
  spname VARCHAR2(10) NOT NULL,
  compercent NUMBER(3,2),
  yearhire NUMBER(4),
  offno NUMBER(4),
  CONSTRAINT SalesPerson_spno_pk PRIMARY KEY(spno)
);


INSERT INTO salesperson(spno, spname, compercent, yearhire, offno) 
  VALUES (186, 'Nabagata',20.15,2016,12);
  
SELECT compercent, yearhire from salesperson where spno=186;

INSERT INTO salesperson(spno, spname, compercent, yearhire, offno) 
  VALUES (191, 'Adams',5.6,2011,4);
  
SELECT spno,spname from salesperson where compercent=10;

SELECT spno,spname from salesperson;

SELECT spno,spname,compercent from salesperson where compercent < 12;

CREATE TABLE Customer (
  cno NUMBER(4) NOT NULL,
  cname VARCHAR2(10) NOT NULL,
  spno NUMBER(4) NOT NULL,
  hqcity VARCHAR2(10) 
);

INSERT INTO customer(cno, cname, spno, hqcity) 
  VALUES (1525,'Nisha',186,'Atlanta');
  
  
SELECT cno,hqcity from customer where cno >= 1700;

SELECT cno,cname,hqcity from customer where hqcity='New York'
and cno>1500;

SELECT cno,cname,hqcity from customer where hqcity='New York'
or (cno>1500 and  hqcity='Atlanta');

SELECT cno,cname,hqcity from customer where cno>1000 order by hqcity;

CREATE TABLE Sales (
  pno NUMBER(4) NOT NULL,
  quantity NUMBER(4),
  spno NUMBER(4) NOT NULL
);

INSERT INTO sales(pno, quantity, spno) 
  VALUES (31793,6108,191);
  
SELECT avg(quantity), pno from sales where spno=137 group by pno;

SELECT MAX(quantity) from sales where pno=21765;

SELECT count(*) from sales where pno=21765;

SELECT SUM(quantity),spno from sales group by spno;

SELECT SUM(quantity),spno from sales having (spno>=150 and sum(quantity)>=5000) group by spno;

SELECT spname from salesperson natural join customer where cno=1525;

CREATE TABLE Product (
  pno NUMBER(4) NOT NULL,
  pname VARCHAR2(10) NOT NULL,
  price NUMBER(4) NOT NULL
);

INSERT INTO product(pno, pname, price) 
  VALUES (31793,'Accesories',200);

SELECT pname from product natural join salesperson natural join sales where spname='Adams' and quantity>2000;

UPDATE salesperson
  SET spno=250
  WHERE spname LIKE 'Saleel';
  
select * from salesperson;
SELECT spname from salesperson where min(compercent)=min(compercent);


CREATE TABLE Publisher (
  pubname VARCHAR2(10) NOT NULL,
  city VARCHAR2(10) NOT NULL,
  country VARCHAR2(10) NOT NULL,
  yearfound NUMBER(4),
  telno NUMBER(10) NOT NULL
);
CREATE TABLE Author (
  authname VARCHAR2(10) NOT NULL,
  authno NUMBER(4),
  dob date
);
CREATE TABLE Book (
  bname VARCHAR2(10) NOT NULL,
  pubname VARCHAR2(10) NOT NULL,
  bno NUMBER(4),
  pages NUMBER(4),
  cost NUMBER(4),
  pyear NUMBER(4) NOT NULL
);
CREATE TABLE Customer2 (
  cname VARCHAR2(10) NOT NULL,
  city VARCHAR2(10) NOT NULL,
  country VARCHAR2(10) NOT NULL,
  street VARCHAR2(10) NOT NULL,
  state VARCHAR2(10) NOT NULL,
  cno NUMBER(4)
);
CREATE TABLE Writing (
  
  authno NUMBER(4),
  bno NUMBER(4)
);
CREATE TABLE Sale (
  
  cno NUMBER(4),
  bno NUMBER(4),
  datee date,
  price NUMBER(4),
  quantity NUMBER(4)
);

INSERT INTO book(bno, bname, pyear, pages, cost, pubname) 
  VALUES (35,'Lol',2018,489,65,'Singapore Publishing Ltd.');
  
INSERT INTO publisher(pubname,city, country, telno, yearfound) 
  VALUES ('Singapore Publishing Ltd.','Lol','Singapore',9056437840, 1890);
  
INSERT INTO author(authno, authname, dob) 
  VALUES (35,'Nabagata','17-Jun-1910');
  
SELECT count(*) from book natural join publisher where city='Paris' and country='France' and pages>=400;

SELECT pubname from publisher natural join author where country='Brazil'or'Brazil'or'Singapore' and extract(year from dob)<1920;