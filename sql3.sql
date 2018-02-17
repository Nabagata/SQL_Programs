DECLARE
var1 integer;
var2 integer;
var3 integer;
var4 integer;
BEGIN
var1:=&var1;
var2:=&var2;
var3:=var1+var2;
var4:=var3/2;
Dbms_output.put_line('Sum is '||var3);
Dbms_output.put_line('Average is '||var4);
END;
/

DECLARE
yr integer;
BEGIN
yr:=&yr;
IF MOD(yr,4)=0 AND MOD(yr,100)!=0 OR MOD(yr,400)=0
THEN
Dbms_output.put_line(yr||' is a leap year.');
ELSE
Dbms_output.put_line(yr||' is not a leap year.');
END IF;
END;
/

DECLARE
sal integer;
exp integer;
bon integer;
BEGIN
sal:=&sal;
exp:=&exp;
bon:=(sal*0.10);
IF exp>10
THEN bon:=bon+500;
END IF;
Dbms_output.put_line(bon||' is the bonus.');
END;
/

DECLARE
pr integer;
amt integer;
tim integer;
si number(5,2);
BEGIN
pr:=&pr;
tim:=&tim;
IF tim>10
THEN si:=(pr*tim*0.08)/100;
ELSE si:=(pr*tim*0.06)/100;
END IF;
Dbms_output.put_line(si||' is the simple interest.');
END;
/

DECLARE
bs integer;
hra integer;
da integer;
net integer;
BEGIN
bs:=&bs;
IF bs>15000 
THEN hra:=(bs*0.12);
     da:=(bs*0.08);
     net:=bs+hra+da;
ELSIF bs>12000 
THEN hra:=(bs*0.10);
     da:=(bs*0.06);
     net:=bs+hra+da;
ELSIF bs>9000 
THEN hra:=(bs*0.07);
     da:=(bs*0.04);
     net:=bs+hra+da;
ELSE
     hra:=(bs*0.05);
     da:=(200);
     net:=bs+hra+da;
END IF;
Dbms_output.put_line('HRA : '||hra);
Dbms_output.put_line('DA : '||da);
Dbms_output.put_line('NET SALARY : '||net);
END;
/


CREATE TABLE emp1 (
  empno NUMBER(4),
  ename VARCHAR2(20),
  sal NUMBER(7,2),
  deptno NUMBER(7),
  CONSTRAINT emp_empno_pk1 PRIMARY KEY(empno)
  );


INSERT INTO emp1(empno, ename, deptno,sal) 
  VALUES (44,'SaiK',12,564);

DECLARE
v_empno integer;
v_ename VARCHAR2(20);
v_sal NUMBER(7,2);
BEGIN
v_empno:=&v_empno;
SELECT ename,sal
INTO v_ename,v_sal
FROM emp1
WHERE empno=v_empno;
Dbms_output.put_line('NAME : '||v_ename);
Dbms_output.put_line('SALARY : '||v_sal);
END;
/

DECLARE
hp integer;
lp integer;
BEGIN
SELECT max(sal),min(sal)
INTO hp,lp
FROM emp1;
Dbms_output.put_line('HIGHEST : '||hp);
Dbms_output.put_line('LOWEST : '||lp);
END;
/

DECLARE
v_empno integer;
v_sal integer;
BEGIN
v_empno:=&v_empno;
SELECT sal
INTO v_sal
FROM emp1
WHERE empno=v_empno;
IF v_sal<5000 
THEN 
UPDATE emp1
SET sal=sal*1.1
WHERE empno=v_empno;
ELSE
DELETE FROM emp1
WHERE empno=v_empno;
end if;
END;
/

DECLARE
v_depno integer;
BEGIN
v_depno:=&v_depno;
DELETE from emp1
WHERE v_depno=deptno;
END;
/

DECLARE 
v_empno NUMBER(4);
v_ename VARCHAR2(20);
v_sal NUMBER(7,2);
v_deptno NUMBER(7);
BEGIN
v_empno:=&v_empno;
v_ename:=&v_ename; 
v_sal:=&v_sal;
v_deptno:=&v_deptno;
INSERT INTO emp1(empno, ename, deptno,sal) 
  VALUES (v_empno, v_ename, v_deptno, v_sal);
END;
/

DECLARE
v_ename VARCHAR2(20);
v_sal integer;
BEGIN
v_sal:=&v_sal;
SELECT ename
INTO v_ename
FROM emp1
WHERE sal=v_sal;
Dbms_output.put_line('Name : '||v_ename);

EXCEPTION 
WHEN NO_DATA_FOUND
THEN Dbms_output.put_line('No such data exist.');
WHEN TOO_MANY_ROWS
THEN Dbms_output.put_line('Too many rows.');
END;
/

DECLARE
num1 integer;
num2 integer;
num3 integer;
BEGIN
num1:=&num1;
num2:=&num2;
num3:=(num2/num1);
Dbms_output.put_line(num3);
EXCEPTION 
WHEN ZERO_DIVIDE
THEN Dbms_output.put_line('Cant divide by zero.');
END;
/
