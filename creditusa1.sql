/*
SQLyog Enterprise Trial - MySQL GUI v6.14
MySQL - 5.0.45-community : Database - creditusa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `creditusa`;

USE `creditusa`;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `action_details` */

DROP TABLE IF EXISTS `action_details`;

CREATE TABLE `action_details` (
  `Action_Name` varchar(100) default NULL,
  `Role_Id` int(11) default NULL,
  `Available` char(1) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` int(11) default NULL,
  `Last_Modified_Date` date default NULL,
  `Action_Id` int(11) NOT NULL auto_increment,
  UNIQUE KEY `Action_Id` (`Action_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `action_details` */

/*Table structure for table `address_book` */

DROP TABLE IF EXISTS `address_book`;

CREATE TABLE `address_book` (
  `address_id` mediumint(9) NOT NULL auto_increment,
  `address_type` int(11) default NULL,
  `name` char(50) default NULL,
  `phone_number` char(12) default NULL,
  `mobile_no` char(12) default NULL,
  `dist` char(15) default NULL,
  PRIMARY KEY  (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `address_book` */

/*Table structure for table `address_details` */

DROP TABLE IF EXISTS `address_details`;

CREATE TABLE `address_details` (
  `Contact_Person_Name` varchar(100) default NULL,
  `Address1` varchar(100) default NULL,
  `Address2` varchar(100) default NULL,
  `City` varchar(100) default NULL,
  `Zip` varchar(10) default NULL,
  `State` varchar(100) default NULL,
  `Country` varchar(100) default NULL,
  `Phone` varchar(20) default NULL,
  `Mobile` varchar(20) default NULL,
  `Work` varchar(20) default NULL,
  `EMail` varchar(100) default NULL,
  `Address_Id` int(11) NOT NULL auto_increment,
  UNIQUE KEY `Address_Id` (`Address_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `address_details` */

insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'creditusaAdmin','creditusaAdmin','creditusaAdmin','500018','State','US','999999','999999123','999999','admin@thecreditusa.com',1);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'creditdist','creditdist','creditdist','500018','State','US','999999','999999','999999','creditdist@thecreditusa.com',2);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'ca','scs','ca','123456','ca','us',NULL,NULL,NULL,NULL,3);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','US','9999',NULL,NULL,NULL,4);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','60001',NULL,'US',NULL,NULL,NULL,NULL,5);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'ca','ca','ca','ca','ca','ca',NULL,NULL,NULL,NULL,6);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'SA','SA','SA','SA','SA','SA',NULL,NULL,NULL,NULL,7);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','CA','CA',NULL,NULL,NULL,8);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','CA',NULL,NULL,NULL,NULL,9);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','CA',NULL,NULL,NULL,NULL,10);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','CA',NULL,NULL,NULL,NULL,11);
insert  into `address_details`(`Contact_Person_Name`,`Address1`,`Address2`,`City`,`Zip`,`State`,`Country`,`Phone`,`Mobile`,`Work`,`EMail`,`Address_Id`) values (NULL,'CA','CA','CA','CA','CA','CA',NULL,NULL,NULL,NULL,12);

/*Table structure for table `commision_details` */

DROP TABLE IF EXISTS `commision_details`;

CREATE TABLE `commision_details` (
  `Distributor_Id` int(11) default NULL,
  `Payment_Id` int(11) default NULL,
  `Percentage_Commision` decimal(10,0) default NULL,
  `Status` varchar(20) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` int(11) default NULL,
  `Last_Modified_Date` date default NULL,
  `Commision_Id` int(11) NOT NULL auto_increment,
  UNIQUE KEY `Commision_Id` (`Commision_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `commision_details` */

/*Table structure for table `commission_details` */

DROP TABLE IF EXISTS `commission_details`;

CREATE TABLE `commission_details` (
  `Distributor_Id` int(11) default NULL,
  `Payment_Id` int(11) default NULL,
  `Percentage_Commision` decimal(10,0) default NULL,
  `Status` varchar(20) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` int(11) default NULL,
  `Last_Modified_Date` date default NULL,
  `Commision_Id` int(11) NOT NULL auto_increment,
  `Customer_id` int(11) default NULL,
  `type` varchar(10) default NULL,
  `unrealizedcommision` text,
  `realizedcommision` varchar(300) default NULL,
  `parent_id` int(11) default NULL,
  UNIQUE KEY `Commision_Id` (`Commision_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `commission_details` */

/*Table structure for table `customer_details` */

DROP TABLE IF EXISTS `customer_details`;

CREATE TABLE `customer_details` (
  `First_Name` varchar(100) default NULL,
  `Middle_Name` varchar(100) default NULL,
  `Last_Name` varchar(100) default NULL,
  `SSN` varchar(100) default NULL,
  `Address_Id` int(11) default NULL,
  `Payment_Id` int(11) default NULL,
  `Status` varchar(20) default 'N',
  `Start_Date` date default NULL,
  `Active` varchar(10) default NULL,
  `End_Date` date default NULL,
  `Distributor_Id` int(11) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` int(11) default NULL,
  `Last_Modified_Date` date default NULL,
  `Customer_Id` int(11) NOT NULL auto_increment,
  `orderstatus` varchar(10) default 'Started',
  `SSN_proof` varchar(10) default 'N',
  `Address_proof` varchar(10) default 'N',
  `Completed_application` varchar(10) default 'N',
  `T_C_acceptance` varchar(10) default 'N',
  `ltd_poa_signed` varchar(10) default 'N',
  `dob` date default NULL,
  UNIQUE KEY `Customer_Id` (`Customer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `customer_details` */

insert  into `customer_details`(`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Address_Id`,`Payment_Id`,`Status`,`Start_Date`,`Active`,`End_Date`,`Distributor_Id`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Customer_Id`,`orderstatus`,`SSN_proof`,`Address_proof`,`Completed_application`,`T_C_acceptance`,`ltd_poa_signed`,`dob`) values ('Cust1','G','C','999999999',5,4,'P','2007-12-26',NULL,'2007-12-26',1,0,0,'2007-12-26',1,'WIP','N','N','N','N','N','2007-12-04');

/*Table structure for table `distributor_details` */

DROP TABLE IF EXISTS `distributor_details`;

CREATE TABLE `distributor_details` (
  `Type` varchar(50) default NULL,
  `Parent` int(11) default NULL,
  `First_Name` varchar(100) default NULL,
  `Middle_Name` varchar(100) default NULL,
  `Last_Name` varchar(100) default NULL,
  `SSN` varchar(50) default NULL,
  `Primary_Contact_Id` int(11) default NULL,
  `Address_Id` int(11) default NULL,
  `Payment_Id` int(11) default NULL,
  `ApprovalStatus` varchar(20) default NULL,
  `Start_Date` date default NULL,
  `Active` varchar(10) default NULL,
  `End_Date` date default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` int(11) default NULL,
  `Last_Modified_Date` date default NULL,
  `Distributor_Id` int(11) NOT NULL auto_increment,
  `JoiningDate` date default NULL,
  `RegisteredDate` date default NULL,
  `dob` date default NULL,
  `realizedcommisions` text,
  `unrealizedcommisions` text,
  `userid` varchar(10) default NULL,
  `transactioncount` varchar(4000) default '0',
  `loginid` varchar(20) default NULL,
  UNIQUE KEY `Distributor_Id` (`Distributor_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `distributor_details` */

insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',0,'Head','D','Distributor','999999999',2,2,1,'Approved','2007-12-25','Y','2007-12-25',0,0,'2007-12-25',1,'2007-12-25','2007-12-25','2007-12-31',NULL,NULL,'2','1','Dist');
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',1,'SecDist',NULL,'SecDist','123123123',0,8,7,'Approved','2007-12-26','Y','2007-12-26',0,0,'2007-12-26',6,'2007-12-26','2007-12-26','1972-12-01',NULL,NULL,'10','1','SecD1');
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',6,'thirdDist',NULL,'thirdDist','222222222',0,9,8,'Approved','2007-12-26','Y','2007-12-26',0,0,'2007-12-26',7,'2007-12-26','2007-12-26','1968-12-07',NULL,NULL,'11','1','thir1');
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',7,'FourthDist',NULL,'FourthDist','123123123',0,10,9,'Approved','2007-12-26','Y','2007-12-26',0,0,'2007-12-26',8,'2007-12-26','2007-12-26','1978-12-22',NULL,NULL,'14','1','Four3');
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL);
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',8,'FIFTHDist',NULL,'FIFTHDist','999999999',0,11,10,'Approved','2007-12-26','Y','2007-12-26',0,0,'2007-12-26',10,'2007-12-26','2007-12-26','2007-12-10',NULL,NULL,'15','0','FIFT1');
insert  into `distributor_details`(`Type`,`Parent`,`First_Name`,`Middle_Name`,`Last_Name`,`SSN`,`Primary_Contact_Id`,`Address_Id`,`Payment_Id`,`ApprovalStatus`,`Start_Date`,`Active`,`End_Date`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Distributor_Id`,`JoiningDate`,`RegisteredDate`,`dob`,`realizedcommisions`,`unrealizedcommisions`,`userid`,`transactioncount`,`loginid`) values ('I',10,'sixthDist',NULL,'sixthDist','444444444',0,12,11,'Approved','2007-12-26','Y','2007-12-26',0,0,'2007-12-26',11,'2007-12-26','2007-12-26','2007-12-12',NULL,NULL,'16','0','sixt1');

/*Table structure for table `document_details` */

DROP TABLE IF EXISTS `document_details`;

CREATE TABLE `document_details` (
  `customerid` int(11) default NULL,
  `documentid` int(11) default NULL,
  `available` varchar(10) default NULL,
  `testcol` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `document_details` */

/*Table structure for table `document_types` */

DROP TABLE IF EXISTS `document_types`;

CREATE TABLE `document_types` (
  `documentid` int(11) NOT NULL auto_increment,
  `documentname` varchar(30) default NULL,
  `description` varchar(300) default NULL,
  UNIQUE KEY `documentid` (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `document_types` */

/*Table structure for table `payment_details` */

DROP TABLE IF EXISTS `payment_details`;

CREATE TABLE `payment_details` (
  `Amount` decimal(10,0) default NULL,
  `Mode` varchar(20) default NULL,
  `Routing_Number` varchar(50) default NULL,
  `Account_Number` varchar(50) default NULL,
  `Cheque_Number` varchar(50) default NULL,
  `Credit_Card_Number` varchar(50) default NULL,
  `Holder_Name` varchar(50) default NULL,
  `Expiration_Date` date default NULL,
  `Address` varchar(50) default NULL,
  `City` varchar(50) default NULL,
  `State` varchar(50) default NULL,
  `Zip` varchar(20) default NULL,
  `CVV` varchar(100) default NULL,
  `Status` varchar(20) default NULL,
  `Distriutor_Name` varchar(100) default NULL,
  `Customer_Name` varchar(100) default NULL,
  `Type` varchar(40) default NULL,
  `Payment_Made_By` varchar(100) default NULL,
  `Created_By` varchar(100) default NULL,
  `Modified_By` varchar(100) default NULL,
  `Last_Modified_Date` date default NULL,
  `Payment_Id` int(11) NOT NULL auto_increment,
  `Distributor` int(11) default NULL,
  `paymenttype` varchar(10) default 'R',
  `description` varchar(40) default NULL,
  `payment_date` date default NULL,
  `amount_received` decimal(10,0) default NULL,
  UNIQUE KEY `Payment_Id` (`Payment_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `payment_details` */

insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('0','MO',NULL,'999999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','Head',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,1,NULL,'R',NULL,'2007-08-07','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('123123','C',NULL,'123213123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','secdist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,2,NULL,'R',NULL,'2007-12-04','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('200','C',NULL,'999999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','ThirdDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,3,NULL,'R',NULL,'2007-12-04','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('1000','C',NULL,'1234566',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed',NULL,'Cust1','Customer Enrollment',NULL,NULL,NULL,'2007-12-26',4,NULL,'R',NULL,'2007-12-04','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('123123120','C',NULL,'123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','fourthDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,5,NULL,'R',NULL,'2007-12-04','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('1231231230','C',NULL,'123456678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','FifthDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,6,NULL,'R',NULL,'2007-12-04','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('90909088','C',NULL,'123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','SecDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,7,NULL,'R',NULL,'2007-12-03','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('9090900','C',NULL,'123123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','thirdDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,8,NULL,'R',NULL,'2007-12-03','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('123123120','C',NULL,'123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','FourthDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,9,NULL,'R',NULL,'2007-12-05','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('234456560','C',NULL,'123456678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','FIFTHDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,10,NULL,'R',NULL,'2007-12-05','0');
insert  into `payment_details`(`Amount`,`Mode`,`Routing_Number`,`Account_Number`,`Cheque_Number`,`Credit_Card_Number`,`Holder_Name`,`Expiration_Date`,`Address`,`City`,`State`,`Zip`,`CVV`,`Status`,`Distriutor_Name`,`Customer_Name`,`Type`,`Payment_Made_By`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Payment_Id`,`Distributor`,`paymenttype`,`description`,`payment_date`,`amount_received`) values ('123123120','C',NULL,'123123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Confirmed','sixthDist',NULL,'Distributor Registration',NULL,NULL,NULL,NULL,11,NULL,'R',NULL,'2007-12-05','0');

/*Table structure for table `role_details` */

DROP TABLE IF EXISTS `role_details`;

CREATE TABLE `role_details` (
  `Role_Name` varchar(100) default NULL,
  `Start_Date` date default NULL,
  `End_Date` date default NULL,
  `Active` varchar(5) default NULL,
  `view_users` varchar(5) default NULL,
  `edit_users` varchar(5) default NULL,
  `add_Role` varchar(5) default NULL,
  `view_Role` varchar(5) default NULL,
  `enroll_Customer` varchar(5) default NULL,
  `approve_Customer` varchar(5) default NULL,
  `customer_Status` varchar(5) default NULL,
  `add_Distributor` varchar(5) default NULL,
  `view_Distributor` varchar(5) default NULL,
  `approve_Distributor` varchar(5) default NULL,
  `payments_made` varchar(5) default NULL,
  `payment_Received` varchar(5) default NULL,
  `add_Payment` varchar(5) default NULL,
  `paymentReceivedfrmCU` varchar(5) default NULL,
  `paymentReceivedbyCU` varchar(5) default NULL,
  `makepayment` varchar(5) default NULL,
  `usermgmt` varchar(5) default NULL,
  `viewmyhirearchy` varchar(5) default NULL,
  `viewothershirearchy` varchar(5) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` date default NULL,
  `Last_Modified_Date` date default NULL,
  `Role_Id` int(11) NOT NULL auto_increment,
  UNIQUE KEY `Role_Id` (`Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role_details` */

insert  into `role_details`(`Role_Name`,`Start_Date`,`End_Date`,`Active`,`view_users`,`edit_users`,`add_Role`,`view_Role`,`enroll_Customer`,`approve_Customer`,`customer_Status`,`add_Distributor`,`view_Distributor`,`approve_Distributor`,`payments_made`,`payment_Received`,`add_Payment`,`paymentReceivedfrmCU`,`paymentReceivedbyCU`,`makepayment`,`usermgmt`,`viewmyhirearchy`,`viewothershirearchy`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Role_Id`) values ('ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'on','on','on','on','on','on','on',NULL,NULL,NULL,'on','on','on',NULL,'on',0,NULL,'2007-12-24',1);
insert  into `role_details`(`Role_Name`,`Start_Date`,`End_Date`,`Active`,`view_users`,`edit_users`,`add_Role`,`view_Role`,`enroll_Customer`,`approve_Customer`,`customer_Status`,`add_Distributor`,`view_Distributor`,`approve_Distributor`,`payments_made`,`payment_Received`,`add_Payment`,`paymentReceivedfrmCU`,`paymentReceivedbyCU`,`makepayment`,`usermgmt`,`viewmyhirearchy`,`viewothershirearchy`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`Role_Id`) values ('DISTRIBUTOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'on',NULL,'on','on','on',NULL,NULL,'on',NULL,'on',NULL,NULL,NULL,'on',NULL,0,NULL,'2007-12-24',2);

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `First_Name` varchar(100) default NULL,
  `Middle_Name` varchar(100) default NULL,
  `Last_Name` varchar(100) default NULL,
  `Date_Of_Birth` date default NULL,
  `Address_Id` int(11) default NULL,
  `Role_Id` int(11) default NULL,
  `SSN` varchar(100) default NULL,
  `Created_By` int(11) default NULL,
  `Modified_By` date default NULL,
  `Last_Modified_Date` date default NULL,
  `User_Id` int(11) NOT NULL auto_increment,
  `Active` varchar(10) default NULL,
  `login_id` varchar(20) default NULL,
  `pwd` varchar(250) default NULL,
  `distributor_id` int(11) default NULL,
  UNIQUE KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('CreditUSA','D','Admin','2007-12-11',1,1,'999999999',NULL,'2007-12-25','2007-12-25',1,'Y','Admin','21232f297a57a5a743894a0e4a801fc3',NULL);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('Head','D','Distributor','2007-12-01',2,2,'999999999',NULL,'2007-12-25','2007-12-25',2,'Y','HeadDist','bf082024f8fb5161217c207023d1fdf5',1);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('SecDist','SecDist','SecDist','1972-12-01',8,2,'123123123',NULL,NULL,'2007-12-26',10,'Y','SecD1','45a58c39201091a5d3f14d75e954be58',6);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('thirdDist','thirdDist','thirdDist','1968-12-07',9,2,'222222222',NULL,NULL,'2007-12-26',11,'Y','thir1','547f27cde51a25583971b44533129f68',7);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('FourthDist','FourthDist','FourthDist','1978-12-22',10,2,'123123123',NULL,NULL,'2007-12-26',12,'Y','Four1','124e96006f9a97c9d25d62d8698a267d',8);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('FourthDist','FourthDist','FourthDist','1978-12-22',10,2,'123123123',NULL,NULL,'2007-12-26',13,'Y','Four2','8439c4ea1fe15472e8794952ae03d7ea',8);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('FourthDist','FourthDist','FourthDist','1978-12-22',10,2,'123123123',NULL,NULL,'2007-12-26',14,'Y','Four3','2e24c92131d9b13e21b548e5d0688bbc',8);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('FIFTHDist','FIFTHDist','FIFTHDist','2007-12-10',11,2,'999999999',NULL,NULL,'2007-12-26',15,'Y','FIFT1','37a7a6cba0b429516c3ccfa5cb0df601',10);
insert  into `user_details`(`First_Name`,`Middle_Name`,`Last_Name`,`Date_Of_Birth`,`Address_Id`,`Role_Id`,`SSN`,`Created_By`,`Modified_By`,`Last_Modified_Date`,`User_Id`,`Active`,`login_id`,`pwd`,`distributor_id`) values ('sixthDist','sixthDist','sixthDist','2007-12-12',12,2,'444444444',NULL,NULL,'2007-12-26',16,'Y','sixt1','5f287cd492ac929cd22273fb64c1c465',11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;