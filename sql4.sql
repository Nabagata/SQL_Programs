CREATE TABLE emp2 (
  empno NUMBER(4),
  ename VARCHAR2(20),
  sal NUMBER(7,2),
  jobb VARCHAR2(20),
  deptno NUMBER(7),
  CONSTRAINT emp_empno_pk2 PRIMARY KEY(empno)
  );

  
INSERT INTO emp2(empno, ename, sal, jobb, deptno) 
  VALUES (41,'Balaji',800,'Web Dev',13);

UPDATE emp2
set sal=600
where ename='Saleel';
  
DECLARE
v_ename VARCHAR2(20);
v_job VARCHAR2(20);
v_sal NUMBER(7,2);
v_deptno INTEGER;
CURSOR c1 IS
  SELECT ename,jobb,sal, deptno
  FROM emp2;
BEGIN
--v_empno:=&v_empno;
OPEN c1;
--SELECT ename,jobb,sal, deptno

--FROM emp2;
FOR r1 in 1..3
loop
FETCH c1 INTO v_ename,v_job,v_sal, v_deptno;
Dbms_output.put_line('NAME : '||v_ename);
Dbms_output.put_line('JOB : '||v_job);
Dbms_output.put_line('SALARY : '||v_sal);
Dbms_output.put_line('DEPARTMENT NUMBER : '|| v_deptno);
END LOOP;
END;
/

DECLARE
v_sal NUMBER(7,2);
CURSOR c2 IS
  SELECT sal
  FROM emp2;
BEGIN
  
  
  
  if v_sal<1200
  then 
  update emp2
  set sal= sal*1.8;
  ELSIF v_sal<2500
  then
  update emp2
  set sal= sal*1.12;
  ELSIF v_sal<4500
  then
  update emp2
  set sal= sal*1.15;
  ELSE
  update emp2
  set sal= sal*1.20;
  end IF;
  open c2;
FOR r1 in 1..2
loop
  fetch c2 into v_sal;
  Dbms_output.put_line('SALARY : '||v_sal);
end loop;
end;
/

DECLARE
v_ename VARCHAR2(20);
v_job VARCHAR2(20);
v_sal NUMBER(7,2);
v_deptno INTEGER := &v_deptno;
CURSOR c3 IS
  SELECT ename,jobb,sal
  FROM emp2
  WHERE deptno=v_deptno;
BEGIN
OPEN c3;
FOR r1 in 1..2 
LOOP

FETCH c3 into v_ename,v_job,v_sal;
Dbms_output.put_line('NAME : '||v_ename);
Dbms_output.put_line('JOB : '||v_job);
Dbms_output.put_line('SALARY : '||v_sal);
Dbms_output.put_line('DEPARTMENT NUMBER : '|| v_deptno);
END LOOP;
END;
/

DECLARE
v_sal NUMBER(7,2);
CURSOR c2 IS
  SELECT sal
  FROM emp2;
BEGIN
  open c2;
FOR r1 in 1..2
loop
  fetch c2 into v_sal;
  Dbms_output.put_line('SALARY : '||v_sal);
  Dbms_output.put_line('NEW SALARY : '||v_sal*1.12);
end loop;
end;
/


CREATE PROCEDURE multitable8(no1 in integer, no2 in integer)
IS
BEGIN
FOR r1 in no1..no2
LOOP
  Dbms_output.put_line(no1*(r1+1));
END LOOP;
END multitable8;

DEClARE
no1 integer;
no2 integer;
BEGIN
no1:=&no1;
no2:=&no2;
multitable8(no1,no2);
END;
/

CREATE or REPLACE PROCEDURE disp1(v_deptno in INTEGER)
IS
CURSOR c3 IS
  SELECT ename,jobb,sal
  FROM emp2
  WHERE deptno=v_deptno;
BEGIN
OPEN c3;
FOR r1 in 1..2 
LOOP

FETCH c3 into v_ename,v_job,v_sal;
Dbms_output.put_line('NAME : '||v_ename);
Dbms_output.put_line('JOB : '||v_job);
Dbms_output.put_line('SALARY : '||v_sal);
Dbms_output.put_line('DEPARTMENT NUMBER : '|| v_deptno);
END LOOP;
END disp1;

DECLARE
v_ename VARCHAR2(20);
v_sal NUMBER(7,2);
v_deptno INTEGER := &v_deptno;
BEGIN
disp1(v_deptno)
END;
/

CREATE or REPLACE PROCEDURE raise_sal(v_empno in number, inc in number)
IS
v_sal integer;
BEGIN
v_empno:=&v_empno;
inc:=&inc;
SELECT sal
INTO v_sal
WHERE empno= v_empno;
Dbms_output.put_line('SALARY : '||v_sal);
Dbms_output.put_line('INCREMENT : '||inc);
Dbms_output.put_line('NEW SALARY : '||v_sal*(1+(inc/100)));
END raise_sal;

DECLARE
v_empno integer;
inc integer;
BEGIN
raise_sal(sal,inc);
END;
/

FUNCTION func (no1 in number, no2 in number)
return NUMBER

IS
no3 number;
for r1 in no1..no2
LOOP
  no3:=no3*no1;
END LOOP;
END;
