create database sgs;

use sgs;

CREATE TABLE `sgs`.`login` (
  `loginId` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`loginId`));
  
INSERT INTO `sgs`.`login` (`username`, `password`) VALUES ('admin', 'admin');

CREATE TABLE `sgs`.`studentdetails` (
  `studentId` INT NOT NULL AUTO_INCREMENT,
  `rollNo` VARCHAR(45) NULL,
  `name` VARCHAR(255) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(45) NULL,
  `fatherName` VARCHAR(255) NULL,
  `semester` INT NULL,
  `department` VARCHAR(255) NULL,
  PRIMARY KEY (`studentId`));

CREATE TABLE `sgs`.`subjectdetails` (
  `subjectId` INT NOT NULL AUTO_INCREMENT,
  `subjectCode` VARCHAR(45) NULL,
  `subjectName` VARCHAR(255) NULL,
  `departmnet` VARCHAR(255) NULL,
  `semesterId` INT NULL,
  PRIMARY KEY (`subjectId`));

CREATE TABLE `sgs`.`markdetails` (
  `markId` INT NOT NULL AUTO_INCREMENT,
  `studentId` INT NULL,
  `semesterId` INT NULL,
  `department` VARCHAR(255) NULL,
  `subjectId` INT NULL,
  `mark` INT NULL,
  PRIMARY KEY (`markId`),
  INDEX `fk_sudent_idx` (`studentId` ASC) VISIBLE,
  INDEX `fk_subject_idx` (`subjectId` ASC) VISIBLE,
  CONSTRAINT `fk_sudent`
    FOREIGN KEY (`studentId`)
    REFERENCES `sgs`.`studentdetails` (`studentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject`
    FOREIGN KEY (`subjectId`)
    REFERENCES `sgs`.`subjectdetails` (`subjectId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
--- insert student details
INSERT INTO `sgs`.`studentdetails` (`name`, `dob`, `gender`, `fatherName`, `semester`, `department`) VALUES ('Raj', '2000-03-07', 'Male', 'Selvem', '6', 'BCA');
INSERT INTO `sgs`.`studentdetails` (`name`, `dob`, `gender`, `fatherName`, `semester`, `department`) VALUES ('Ram', '2000-11-11', 'Male', 'Murugan', '2', 'BSc');
INSERT INTO `sgs`.`studentdetails` (`name`, `dob`, `gender`, `fatherName`, `semester`, `department`) VALUES ('Rose', '2000-04-18', 'Female', 'Sivam', '5', 'BBA');
INSERT INTO `sgs`.`studentdetails` (`name`, `dob`, `gender`, `fatherName`, `semester`, `department`) VALUES ('Priya', '2000-05-20', 'Female', 'Samy', '6', 'BCA');

--- insert subject details
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0601', 'Java', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0602', 'Digital Processing', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0603', 'Photoshop', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0604', 'Artificial Intelegence', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0605', 'Lab-Java', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0606', 'Lab-Photshop', 'BCA', '6');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0501', 'Finacce Management', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0502', 'Marketing Principles', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0503', 'Digital Marketing', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0504', 'E-Commerce', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0505', 'International Business', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BBA0506', 'Tour and Travel Management', 'BBA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0101', 'Programming in C', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0102', 'PC Applications and Internet Technology', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0103', 'Programming Language through C', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0104', 'Digital Computer Fundamentals', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0105', 'Introduction to Information Technology', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0106', 'Mathematics-I (Bridge Course) ', 'BCA', '1');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0201', 'Personality and Soft Skills Development', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0202', 'Mathematics � II (Discrete Mathematics)', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0203', 'Data Structure using C', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0204', 'System Analysis and Design', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0205', 'Accounting and Financial Management ', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0206', 'Data Structure using C', 'BCA', '2');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0301', 'Management Information Systems', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0302', 'Mathematics � III (Numerical Analysis)', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0303', 'Operating Systems', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0304', 'Object-Oriented Programming in C++', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0305', 'Computer Organization and Architecture', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0306', 'Unix and Shell Programming', 'BCA', '3');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0401', 'Environment and Ecology', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0402', 'Database Management Systems', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0403', 'Computer Networking', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0404', 'Software Engineering', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0405', 'GUI Programming', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0406', 'Oracle Laboratory', 'BCA', '4');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0501', 'Operation Research', 'BCA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0502', 'Theory of Computing', 'BCA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0503', 'Fundamentals of TCP/IP', 'BCA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0504', 'IT Acts and Cyber Laws', 'BCA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0505', 'Artificial Intelligence', 'BCA', '5');
INSERT INTO `sgs`.`subjectdetails` (`subjectCode`, `subjectName`, `departmnet`, `semesterId`) VALUES ('BCA0506', 'Internet and e-Commerce', 'BCA', '4');


-- Mark Details insert
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '1', '66');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '2', '70');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '3', '77');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '4', '68');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '5', '90');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('1', '6', 'BCA', '6', '91');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '1', '77');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '2', '61');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '3', '64');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '4', '70');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '5', '80');
INSERT INTO `sgs`.`markdetails` (`studentId`, `semesterId`, `department`, `subjectId`, `mark`) VALUES ('3', '5', 'BBA', '6', '60');


--- New 12/03/2024
ALTER TABLE `sgs`.`studentdetails` 
ADD COLUMN `completedYear` VARCHAR(45) NULL AFTER `department`;


