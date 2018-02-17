CREATE TABLE emp (
  empno NUMBER(4),
  ename VARCHAR2(10),
  deptno NUMBER(7,2) NOT NULL,
  CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
  CONSTRAINT emp_ename_uk UNIQUE(ename),
  CONSTRAINT emp_deptno_ck CHECK(deptno BETWEEN 10 AND 99));
  DESC emp;
  INSERT INTO emp(empno, ename, deptno) 
  VALUES (24,'Himanshu',12);
  SELECT * FROM emp;
  INSERT INTO emp(empno, ename, deptno, ad_date) 
  VALUES (59,'Shivani',12,SYSDATE);
  ALTER TABLE emp
  ADD ("AD_DATE" DATE);
  ALTER TABLE emp
  MODIFY ("EMPNO" NUMBER(6,0));
  UPDATE emp
  SET ad_date = sysdate, empno = 167124 where ename = 'Himanshu';
  
  
  
  