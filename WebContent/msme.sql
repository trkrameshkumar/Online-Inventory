/*
SQLyog Community v11.23 (64 bit)
MySQL - 5.6.11-log : Database - msme
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`msme` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `msme`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `discription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`name`,`discription`) values (1,'Raw Meterials','This is Rawmeterials'),(2,'Package Meterials','This is package meteria'),(3,'Aditional Meterials','This is an aditional meterial');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(5) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

insert  into `item`(`item_id`,`item_name`) values (1,'first item'),(2,'oo'),(3,'vengayam'),(4,'pommai'),(5,'Item no 1'),(6,'0'),(7,''),(8,'this i'),(9,'Manga'),(10,'asd'),(11,'zds'),(12,'zds'),(13,'sdfsd'),(14,'Manga');

/*Table structure for table `item_details` */

DROP TABLE IF EXISTS `item_details`;

CREATE TABLE `item_details` (
  `item_id` int(5) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) NOT NULL,
  `category_id` int(5) DEFAULT NULL,
  `item_quantity` int(10) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `location_id` int(5) DEFAULT NULL,
  `item_description` varchar(500) DEFAULT NULL,
  KEY `category_id` (`category_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `location_id` (`location_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `item_details` */

insert  into `item_details`(`item_id`,`item_name`,`category_id`,`item_quantity`,`supplier_id`,`location_id`,`item_description`) values (5,'item1',1,5,1,1,'This is item 1'),(6,'item no 2',1,3,1,1,'This is item 2'),(7,'item no 3',2,9,2,3,'This is item 3'),(8,'item no 4',1,5,1,1,'this is item 4'),(9,'Bold',1,3,3,3,'making wheel');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `location_id` int(5) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert  into `location`(`location_id`,`location_name`) values (1,'Store Room'),(2,'Production Unit'),(3,'Stock Room'),(4,'Important');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplier_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

insert  into `supplier`(`supplier_id`,`name`,`email`,`phone`,`company`,`address`) values (1,'Sample Supplier Comapany Pvt Ltd 2','sample@company2.com','044-26565143','Sample Supplier Comapany Pvt Ltd 2','3rd Avenue\r\nAnna Nagar West\r\nChennai\r\n'),(2,'Sample Supplier Pvt Ltd 3','sample@supplier.com','9884858777','Sample Supplier Pvt Ltd 3','Anna nagar,Madurai.'),(3,'Ramesh','ccsoftwares','9986724154','ramesh.4575@gmail.com','Anna Nagar'),(4,'Satheshkumar T','Tvs','05333456454','sk@gmail.com','Mogapair');

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `username` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`username`,`email`,`phone`,`company`,`address`) values ('ramesh','ramesh@example.com','13456789','CcSoftwares','Anna Nagar West, Chennai');

/*Table structure for table `user_login` */

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user_details` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_login` */

insert  into `user_login`(`username`,`password`) values ('ramesh','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
