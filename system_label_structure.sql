/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.7.19 : Database - translationportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`translationportal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `translationportal`;

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `language_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `languages` */

insert  into `languages`(`language_id`,`language_name`,`created_at`) values 
(1,'English','2017-10-24 10:36:36'),
(2,'Chinese traditiona','2017-10-24 10:36:46'),
(3,'Chinese simplified','2017-10-24 16:40:18'),
(4,'Portuguese','2017-10-24 16:40:27'),
(5,'Urdu','2017-10-24 16:40:40'),
(6,'Chinese','2017-10-31 11:50:31'),
(7,'Turkish','2017-11-03 11:14:03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
