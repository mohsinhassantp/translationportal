/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.6.34-log : Database - projectxdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`projectxdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `projectxdb`;

/*Table structure for table `inside_app_redirect` */

DROP TABLE IF EXISTS `inside_app_redirect`;

CREATE TABLE `inside_app_redirect` (
  `redirect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary id',
  `title` varchar(30) NOT NULL COMMENT 'title of the redirect name',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 - Inactive',
  `creation_date` timestamp NOT NULL,
  `modification_date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`redirect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `inside_app_redirect` */

insert  into `inside_app_redirect`(`redirect_id`,`title`,`status`,`creation_date`,`modification_date`) values 
(1,'Nothing happen',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'Get starter pack',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'Get xtra data - global',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'Get xtra data - country plan',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'Refer friend page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'Account page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'Coverage page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'Connection status page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'Troubleshooting page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'Guide page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'Contact support page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'Apply promo code page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'Payment method page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'Transaction page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'Plan renewal options page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'Notification page',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'Others',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
