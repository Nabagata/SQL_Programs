
CREATE TABLE airport (
  acode NUMBER(4),
  city VARCHAR2(10),
  name VARCHAR2(10),
  state VARCHAR2(10),
  CONSTRAINT ap_acode_pk PRIMARY KEY(acode)
  );

CREATE TABLE airplane_type (
  maxseats NUMBER(4),
  company VARCHAR2(10),
  typename VARCHAR2(10),
  CONSTRAINT at_typename_pk PRIMARY KEY(typename)
  );
  
CREATE TABLE can_land (
  acode NUMBER(4),
  typename VARCHAR2(10),
  CONSTRAINT cl_acode_fk FOREIGN KEY(acode) REFERENCES airport(acode), 
  CONSTRAINT cl_typename_fk FOREIGN KEY(typename) REFERENCES airplane_type(typename), 
  CONSTRAINT cl_acode_tn_pk PRIMARY KEY(acode,typename)
  );
  
CREATE TABLE airplane (
  a_id NUMBER(4),
  tot_seats NUMBER(4),
  typename VARCHAR2(10),
  CONSTRAINT apl_typename_fk FOREIGN KEY(typename) REFERENCES airplane_type(typename),
  CONSTRAINT apl_a_id_pk PRIMARY KEY(a_id)
  );
  
CREATE TABLE flight (
  num NUMBER(4),
  airline VARCHAR2(10),
  weekdays VARCHAR2(10),
  CONSTRAINT flight_num_pk PRIMARY KEY(num)
  );
  
CREATE TABLE flight_leg (
  leg_no NUMBER(4),
  sc_arr_time date,
  sc_dep_time date,
  acode NUMBER(4),
  num NUMBER(4),
  CONSTRAINT fl_num_fk FOREIGN KEY(num) REFERENCES flight(num), 
  CONSTRAINT fl_acode_fk FOREIGN KEY(acode) REFERENCES airport(acode), 
  CONSTRAINT fl_leg_no_pk PRIMARY KEY(leg_no,acode)
  );
  
CREATE TABLE leg_instance (
  no_avlseats NUMBER(4),
  date1 date,
  acode NUMBER(4),
  a_id NUMBER(4),
  leg_no NUMBER(4),
  arr_time date,
  dep_time date,
  CONSTRAINT li_acode_fk FOREIGN KEY(acode) REFERENCES airport(acode),
  CONSTRAINT li_a_id_fk FOREIGN KEY(a_id) REFERENCES airplane(a_id),
  CONSTRAINT li_leg_no_fk FOREIGN KEY(leg_no,acode) REFERENCES flight_leg(leg_no,acode), 
  CONSTRAINT li_date1_pk PRIMARY KEY(date1,acode)
  );
  
CREATE TABLE seat (
  sno NUMBER(4),
  acode NUMBER(4),
  cphone NUMBER(10),
  cname VARCHAR2(10),
  date1 date,
  CONSTRAINT seat_date1_fk FOREIGN KEY(date1,acode) REFERENCES leg_instance(date1,acode),
  CONSTRAINT seat_sno_pk PRIMARY KEY(sno,date1,acode)
  );
 
CREATE TABLE fare (
  amt NUMBER(4),
  restric VARCHAR2(10),
  code NUMBER(4),
  num NUMBER(4),
  CONSTRAINT fare_num_fk FOREIGN KEY(num) REFERENCES flight(num),
  CONSTRAINT fare_code_pk PRIMARY KEY(code,num)
  );  


INSERT INTO airport(acode, city, name, state) 
  VALUES (13,'Jaipur','Himanshu','Rajasthan');
  
SELECT * from airport;

INSERT INTO airplane_type(company, maxseats, typename) 
  VALUES ('GO',99,'Airbus222');
  
SELECT * from airplane_type;

INSERT INTO airplane(a_id, tot_seats, typename) 
  VALUES (115,85,'Airbus221');
  
SELECT * from airplane;

INSERT INTO flight(airline, num, weekdays) 
  VALUES ('JA',223,7);
  
SELECT * from flight;

INSERT INTO fare(code, amt, restric, num) 
  VALUES (63,3490,'Hi',223);
  
SELECT * from fare;

INSERT INTO flight_leg(leg_no, acode, num, sc_arr_time, sc_dep_time) 
  VALUES (71,10,221,TO_DATE('01-MAR-18 03:40 P.M.','DD-MON-YY HH:MI P.M.'),TO_DATE('01-MAR-18 05:20 P.M.','DD-MON-YY HH:MI P.M.') );
