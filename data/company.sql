/*
*********************************************************************
Name: MySQL Sample Database company
Link: https://liveascoder.com/mysql-tutorial/download-mysql-sample-database
MySQL - 5.7.13-log : Database - company
*********************************************************************
*/
SET NAMES utf8;

DROP DATABASE IF EXISTS company;

CREATE DATABASE IF NOT EXISTS company DEFAULT CHARACTER SET utf8;

USE company;

/*Table structure for table branches */

DROP TABLE IF EXISTS branches;

CREATE TABLE branches (
  branchid int(11) NOT NULL,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  address VARCHAR(100) DEFAULT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  postalcode VARCHAR(15) NOT NULL,
  PRIMARY KEY (branchid)
);

/*Data for the table branches */

INSERT INTO branches(branchid,city,phone,address,state,country,postalcode) VALUES (1,'Bangalore','12312','BTM Layout','Karnataka','India','560012'),(2,'Pune','12458','Ring Road','Maharastra','India','123456'),(3,'Bhubaneswar','112321','Main Town','Orissa','India','760001'),(4,'Cuttack','123153','Templw Road','Orissa','India','305008'),(5,'Bhopal','225252','MP Nagar','Madhya Pradesh','India','305601'),(6,'Guwahati','245666','Brij Tower','Aasam','India','305412'),(7,'Goa','7545456','Royals Plaza','Mumbai','India','305408'),(8,'Guntur','112553','Highway','Andhra Pradesh','India','522002'),(9,'Agra','956854','Fort Road','Utter Pradesh','India','282001'),(10,'Chennai','556566','Kolaapalem','Tamilnadu','India','600040'),(11,'Ahmedabad','666527','Ahmad Nagar','Gujarat','India','400210'),(12,'Chandigad','888214','Samadiya Colony','Punjab','India','563214'),(13,'Shimala','666324','National Higway','Himachal Pradesh','India','422022'),(14,'Yadardi','400213','Maddilanagar','Telangana','India','555474'),(15,'Kolkata','956856','Railway Station Road','West Bengal','India','100224'),(16,'Hydrabad','868654','IT Park','Telangana','India','451245'),(17,'Jagtial','845612','Hari Nagar','Telangana','India','451425'),(18,'Santa Fe','454154','Gold Town','New Mexico','U.S','215451'),(19,'Seto','121231','Reg Flyover','Bogra','Bangladesh','454646'),(20,'Norfolk','787896','Norrassa','Alaska','U.S','858586'),(21,'Victoria','656593','Stadium Road','Victoria','Australia','141564'),(22,'Thimphu','133525','Thunnusku','Thimphu','Bhutan','846474'),(23,'Kathmandu','876541','Budda Temple','Kathmandu','Nepal','696984'),(24,'Pokhara','652142','Shushan Town','Pokhara','Nepal','741253'),(25,'Aisai','959698','Ninnijupel','Toyota','Japan','847123');

/*Table structure for table department */

DROP TABLE IF EXISTS department;

CREATE TABLE department (
  departmentid INT(11) NOT NULL,
  departmentname VARCHAR(50) NOT NULL,
  PRIMARY KEY (departmentid)
);

/*Data for the table department */

INSERT INTO department(departmentid,departmentname) VALUES (101,'IT'),(102,'HR'),(103,'Finance'),(104,'Sales'),(105,'marketing');

/*Table structure for table employees */

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  employeeid INT(11) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  dob date NOT NULL,
  email VARCHAR(100) NOT NULL,
  jobtitle VARCHAR(50) NOT NULL,
  salary FLOAT(10,2) DEFAULT NULL,
  reportto INT(11) DEFAULT NULL,
  branchid INT(11) DEFAULT NULL,
  departmentid INT(11) DEFAULT NULL,
  PRIMARY KEY (employeeid),
  KEY emp_branch_FK (branchid),
  KEY emp_department_FK (departmentid),
  CONSTRAINT emp_branch_FK FOREIGN KEY (branchid) REFERENCES branches (branchid),
  CONSTRAINT emp_department_FK FOREIGN KEY (departmentid) REFERENCES department (departmentid)
);

/*Data for the table employees */

INSERT INTO employees(employeeid,firstname,lastname,dob,email,jobtitle,salary,reportto,branchid,departmentid) VALUES (1001,'Ravi','Gupta','1969-12-03','ravigupta@company.com','CEO',850000.00,1001,18,103),(1002,'Ram','charan','1985-02-20','charanram@company.com','Director',650000.00,1001,18,103),(1003,'Ramesh','jha','1977-02-11','remash.j@company.com','President',625000.00,1002,1,103),(1004,'Maheswar ','Patra','1979-12-16','Mahesh.p@company.com','Vice President',215000.00,1003,1,102),(1005,'Murphy','Diane','1984-01-11','dmurphy@company.com','Sr. Manager',115000.00,1004,2,102),(1006,'Ashok','Parhihar','1983-04-03','ashok@company.com','Accountant',38000.00,1005,2,104),(1007,'Patterson','William','1988-12-20','wpatterson@company.com','Sales Manager',65000.00,1005,2,104),(1008,'Sam','Gahoi','1986-11-23','sam.g@company.com','Reporting Manager',75000.00,1005,2,101),(1009,'Rakul','Agarwal','1990-09-08','r.agar@company.com','Team Leader',45000.00,1008,1,104),(1010,'Hari','Thakur','1991-07-13','ht@company.com','Sales Rep',15000.00,1007,1,104),(1011,'Addision','Lohan','1994-06-19','lohan.a@company.com','Sales Rep',15000.00,1007,1,104),(1012,'Fothine','Julie','1992-08-22','f_julie@company.com','Sales Rep',15000.00,1007,1,104),(1013,'Steve','Patt','1993-02-24','spatt@company.com','Sales Rep',15000.00,1007,1,104),(1014,'Tilak','Jain','1990-03-17','t.jain@company.com','Software Engineer',35000.00,1008,2,101),(1015,'vanky','Guru','1989-04-09','vanky.g@company.com','Software Engineer',35000.00,1008,2,101),(1016,'Baldev','Loui','1991-12-02','lbaldev@company.com','Software Engineer',25000.00,1008,1,101),(1017,'Hernandez','Gerard','1989-11-14','ghernande@company.com','Software Engineer',25000.00,1008,1,101),(1018,'Catty','Pamela','1992-10-17','imcatty@company.com','Sales Rep',18000.00,1007,2,104),(1019,'Bott','Larry','1993-07-21','lbott@company.com','Sales Rep',25000.00,1007,2,104),(1020,'Jones','Barry','1988-05-30','bjones@company.com','Sales Rep',22000.00,1007,2,104),(1021,'Fixter','Andy','1989-04-29','afixter@company.com','Sales Rep',21000.00,1007,2,104),(1022,'Marsh','Poddi','1993-02-25','pmarsh@company.com','Sales Rep',19000.00,1007,2,104),(1023,'King','Perry','1984-01-07','perry.king@company.com','Admin',55000.00,1005,1,101),(1024,'Nishi','Kushwah','1989-05-14','k.nishi@company.com','Network Engineer',17000.00,1008,1,101),(1025,'Kato','Yoshimi','1991-03-12','ykato@company.com','Network Engineer',25000.00,1008,2,101);
