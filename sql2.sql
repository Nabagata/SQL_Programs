
INSERT INTO flight_leg(leg_no, acode, num, sc_arr_time, sc_dep_time) 
  VALUES (73,12,223,TO_DATE('07-MAR-18 01:42 P.M.','DD-MON-YY HH:MI P.M.'),TO_DATE('07-MAR-18 07:25 P.M.','DD-MON-YY HH:MI P.M.') );
  
SELECT * FROM flight;
SELECT * FROM airport;
SELECT * FROM flight_leg;
SELECT * FROM airplane_type;
SELECT * FROM airplane;
SELECT * FROM leg_instance;
SELECT * FROM seat;
SELECT * FROM fare;

INSERT INTO flight(airline, num, weekdays) 
  VALUES ('JA',223,7);
INSERT INTO flight(airline, num, weekdays) 
  VALUES ('SJ',221,5);
INSERT INTO flight(airline, num, weekdays) 
  VALUES ('GO',222,4);
INSERT INTO fare(code, amt, num, restric) 
  VALUES (42,2540,223,'null');
  
INSERT INTO leg_instance(date1, no_avlseats, a_id, acode, arr_time, dep_time, leg_no) 
  VALUES ('02-MAR-18',73,122,12,TO_DATE('03:40 P.M.','HH:MI P.M.'),TO_DATE('05:20 P.M.','HH:MI P.M.'),73); 
  
INSERT INTO seat(sno, acode, cname, cphone, date1) 
  VALUES (54,12,'Meet',9433138361,'02-MAR-18');


INSERT INTO airplane(a_id, tot_seats, typename) 
  VALUES (122,91,'Airbus224');
  

INSERT INTO airplane_type(company, maxseats, typename) 
  VALUES ('GO',300,'AIRBUS123');
  
SELECT cname
FROM seat
GROUP BY cname
HAVING max(count(name));

SELECT cname,count(sno)
FROM seat
GROUP BY cname
HAVING count (sno) in ( SELECT max(count(sno))
                  FROM seat
                  GROUP BY cname
                  );
                  
UPDATE airplane_type
SET typename='Airbus123'
WHERE typename='Airbus221';

UPDATE airport
SET city='B'
WHERE city='Ahmedabad';
                  
SELECT num 
FROM flight natural join airplane_type
where maxseats>200;

SELECT company
FROM airplane_type
WHERE typename='AIRBUS123';

SELECT sc_dep_time
FROM airport natural join flight_leg
WHERE city='X';

SELECT count(*)
FROM airport natural join leg_instance
WHERE date1='01-JAN-2014' AND city='X';

SELECT num
FROM flight
where city='A' and city='B';

