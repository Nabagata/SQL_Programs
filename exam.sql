CREATE TABLE lol(
  eno INTEGER,
  PRIMARY KEY(eno)
);

INSERT INTO lol(eno)
  VALUES(40);
  
SELECT * FROM lol;

/*DECLARE
v_eno INTEGER;
BEGIN
SELECT eno
INTO v
END;
*/

CREATE TABLE parts(
  pno INTEGER,
  pname VARCHAR2(20),
  qoh INTEGER,
  price INTEGER,
  olevel VARCHAR2(20)
);

CREATE TABLE customers(
  cno INTEGER,
  cname VARCHAR2(20),
  street VARCHAR2(20),
  zip INTEGER,
  phone INTEGER
);

CREATE TABLE employees(
  eno INTEGER,
  ename VARCHAR2(20),
  zip INTEGER,
  hdate date
);

CREATE TABLE zip_codes(
  zip INTEGER,
  city VARCHAR2(20)
);

CREATE TABLE orders(
  ono INTEGER,
  cno INTEGER,
  eno INTEGER,
  received VARCHAR2(20),
  shipped VARCHAR2(20)
);

CREATE TABLE odetails(
  ono INTEGER,
  pno INTEGER,
  qty INTEGER
);
/*
INSERT INTO parts(pno, pname, qoh, price, olevel)
  VALUES(40, 'scale',10,10,'y');
INSERT INTO parts(pno, pname, qoh, price, olevel)
  VALUES(41, 'eraser',60,2,'y');
INSERT INTO parts(pno, pname, qoh, price, olevel)
  VALUES(42, 'pencil',100,7,'y');
INSERT INTO employees(eno, ename, zip, hdate)
  VALUES(40, 'Nabagata',506004,'03-mar-2018');
INSERT INTO employees(eno, ename, zip, hdate)
  VALUES(39, 'Saleel',506004,'03-mar-2018');
INSERT INTO employees(eno, ename, zip, hdate)
  VALUES(42, 'Aditi',506005,'03-mar-2018');
INSERT INTO employees(eno, ename, zip, hdate)
  VALUES(41, 'Samarjit',506006,'03-mar-2018');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(10, 20, 40, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(11, 21, 39, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(12, 22, 42, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(13, 22, 40, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(14, 22, 39, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(15, 25, 39, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(16, 26, 39, 'y', 'y');
INSERT INTO orders(ono, cno, eno, received, shipped)
  VALUES(17, 20, 39, 'y', 'y');
INSERT INTO odetails(ono, pno, qty)
  VALUES(10, 41, 100);
INSERT INTO odetails(ono, pno, qty)
  VALUES(11, 40, 6);
INSERT INTO odetails(ono, pno, qty)
  VALUES(12, 40, 1);
INSERT INTO odetails(ono, pno, qty)
  VALUES(13, 41, 2);
INSERT INTO odetails(ono, pno, qty)
  VALUES(14, 42, 2);
INSERT INTO odetails(ono, pno, qty)
  VALUES(15, 40, 2);
INSERT INTO odetails(ono, pno, qty)
  VALUES(16, 40, 1);
INSERT INTO odetails(ono, pno, qty)
  VALUES(17, 40, 1);
INSERT INTO zip_codes(zip, city)
  VALUES(506004, 'Warangal');
INSERT INTO zip_codes(zip, city)
  VALUES(506005, 'Wichita');
INSERT INTO zip_codes(zip, city)
  VALUES(506006, 'ABC');
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(20, 'Balaji', 'Osman', 506004, 0000000000);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(21, 'Ramu', 'Hussain', 506004, 0000000001);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(22, 'Hiral', 'Hussain', 506004, 0000000002);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(23, 'Rohan', 'Hussain', 506004, 0000000002);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(24, 'Meet', 'Hussain', 506004, 0000000002);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(25, 'Rahul', 'Hussain', 506006, 0000000002);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(26, 'Shivani', 'Hussain', 506006, 0000000002);
INSERT INTO customers(cno, cname, street, zip, phone)
  VALUES(27, 'Samarjit', 'Hussain', 506006, 0000000002);
*/
  
SELECT * FROM orders;
DELETE FROM parts where olevel='y';
  
SELECT pname from parts where price<20;

SELECT e.ename, z.city
FROM employees e, odetails od , zip_codes z, parts p, orders o
WHERE e.eno= o.eno and e.zip= z.zip and od.pno= p.pno and od.ono=o.ono
and od.qty* p.price>50;

SELECT c1.cname, c2.cname
FROM customers c1, customers c2
WHERE c1.zip=c2.zip and c1.cno!= c2.cno;

SELECT cname 
FROM customers c, zip_codes z, employees e, orders o
WHERE c.cno=o.cno and e.eno= o.eno and e.zip= z.zip 
and z.city='Wichita';

SELECT cname
FROM customers c, orders o, parts p, odetails od
WHERE c.cno= o.cno and od.ono= o.ono and od.pno= p.pno and
p.price<20;

/*SELECT distinct(c.cname)
FROM customers c, orders o, odetails od
WHERE c.cno!=o.cno and o.ono!= od.ono;*/

SELECT cname
FROM customers c  
WHERE NOT EXISTS 
(SELECT cno FROM orders o where c.cno= o.cno);

SELECT c.cname
FROM customers c, orders o
WHERE c.cno= o.cno 
GROUP BY c.cname
HAVING count(o.cno)=2;

SELECT c.cname
FROM customers c, orders o
WHERE c.cno= o.cno
GROUP BY c.cname
HAVING count(o.cno)>=3
ORDER BY c.cname DESC;

SELECT c.cname 
FROM customers c, orders o, odetails od, parts p, zip_codes z
WHERE c.cno=o.cno and o.ono=od.ono and od.pno=p.pno and c.zip= z.zip
and p.price*od.qty<30 and z.city='ABC';

SELECT z.city
FROM zip_codes z, customers c
WHERE c.zip = z.zip
GROUP BY z.city
HAVING count(distinct(cname))>2;


CREATE TABLE emp_sal(
  empno INTEGER,
  sal INTEGER,
  deptno INTEGER,
  PRIMARY KEY(empno)
);

CREATE TABLE emp_dept(
  deptno INTEGER,
  deptname VARCHAR2(20),
  PRIMARY KEY(deptno)
);

CREATE TABLE top_sal_emp(
  empno INTEGER,
  sal INTEGER,
  PRIMARY KEY(empno)
);
/*
INSERT INTO emp_sal(empno, sal, deptno)
  VALUES(40, 100, 12);
INSERT INTO emp_sal(empno, sal, deptno)
  VALUES(41, 90, 12);
INSERT INTO emp_dept(deptno, deptname)
  VALUES(12, 'CSE');
--INSERT INTO top_sal_emp(empno, sal)
 -- VALUES(40);
*/

DECLARE
v_empno INTEGER;
v_sal INTEGER;
CURSOR c1 IS
SELECT empno, sal
FROM emp_sal
ORDER BY sal DESC;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO v_empno,v_sal;
    EXIT WHEN c1%NOTFOUND;
    INSERT INTO top_sal_emp(empno, sal)
      VALUES(v_empno, v_sal);
  END LOOP;
END;
/

SELECt * from top_sal_emp;
SELECT * FROM emp_sal;