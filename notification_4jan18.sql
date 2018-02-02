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

/*Table structure for table `notification_data` */

DROP TABLE IF EXISTS `notification_data`;

CREATE TABLE `notification_data` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_query_id` int(11) NOT NULL DEFAULT '0' COMMENT 'primary id from notification_filter_qry table',
  `title` varchar(50) NOT NULL,
  `message_notification` varchar(350) NOT NULL COMMENT 'message show in notification page',
  `message_popup` varchar(500) NOT NULL COMMENT 'message show for popup',
  `left_button_title` varchar(250) NOT NULL,
  `right_button_title` varchar(250) NOT NULL,
  `left_button_redirect` varchar(250) NOT NULL,
  `right_button_redirect` varchar(250) NOT NULL,
  `notification_tag` varchar(50) DEFAULT NULL COMMENT 'unique string',
  `promotion_id` int(11) NOT NULL COMMENT 'promotion table primery key using as foreign key here',
  `notification_img` varchar(100) DEFAULT '',
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Non active, 1 - Active, 2 - Archieve',
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'start date of sending notifications',
  `end_date` timestamp NULL DEFAULT NULL COMMENT 'stop the notification on this date and time',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `notification_data` */

insert  into `notification_data`(`notification_id`,`filter_query_id`,`title`,`message_notification`,`message_popup`,`left_button_title`,`right_button_title`,`left_button_redirect`,`right_button_redirect`,`notification_tag`,`promotion_id`,`notification_img`,`creation_date`,`modification_date`,`status`,`start_date`,`end_date`) values 
(1,1,'test notification','notification with <br> <b> html </b>','message to nl2br\r\n\\n\\r new line','OK','More info','1','3',NULL,0,'http://localhost/notification/themes/img/notification/0lfEKRIjqS0STjpTjLNgEy630LZrmXJm.jpg','2017-12-21 15:06:54','2017-12-21 07:08:02',2,'2017-12-20 15:19:47','2017-12-21 15:20:05'),
(2,2,'test 2 notification','test2','pop test 2 nl2br \r\n\\n\\r\r\nnext next ','yes','confirm','1','3','test 2 notification-20171220060125',0,'http://localhost/notification/themes/img/notification/1379622964445-2013-09-19_09_24_37.png','2017-12-21 12:41:52','2018-01-02 04:08:49',1,'2017-12-20 18:00:57','2017-12-21 18:01:09'),
(3,1,'test 3 image url','test 3 image url','test 3 image url','ok','','1','0','test 3 image url-20171221123053',0,'http://localhost/notification/themes/img/notification/1379622964445-2013-09-19_09_24_371.png','2017-12-21 12:42:19','2017-12-21 04:42:21',1,'2017-12-21 12:30:41','2017-12-22 12:30:48'),
(4,1,'test 4 img url','test 4 image url ','test 4 image url ','okay','','1','0','test 4 img url-20171221123611',0,'http://52.74.142.173/notification/themes/img/notification/intro.png','2018-01-03 16:50:58','2018-01-03 08:50:59',1,'2017-12-21 12:36:01','2017-12-22 12:36:04'),
(5,1,'test with promition','test with promotion <b>message </b>','test with promotion \\n\\rmessage ','okay','','1','0','test with promition-20171226112801',2,'','2017-12-26 11:30:17','2017-12-26 03:30:19',1,'2017-12-27 11:27:51','2017-12-28 11:27:54'),
(32,1,'Buy 1 Free 1 Year End Deal','Use code: <strong>MMXVY8</strong> TO BUY ONE FREE ONE OF ANYTHING!<br><br>Dear valued customer<br><br>Thank you for your continuous support and use of Flexiroam X.<br>As a token of our appreciation, we are offering you the last deal of the year FOR 24 HOURS ONLY.<br><br>Buy One Free One: MMXVY8<br><br>*Not applicable for local data plans.<br><br><s','Use code: MMXVY8 TO BUY ONE FREE ONE OF ANYTHING!\r\n\r\nDear valued customer\r\n\r\nThank you for your continuous support and use of Flexiroam X.\r\nAs a token of our appreciation, we are offering you the last deal of the year FOR 24 HOURS ONLY.\r\n\r\nBuy One Free One: MMXVY8\r\n\r\n*Not applicable for local data plans.\r\n\r\nValid till 31 Dec 2017 GMT+0\r\n\r\n','OK','Check it out','0','1','NEWYEAR18-01',3,'http://www.flexiroamx.com/img/2017-12-newyear2018.jpg','2017-12-29 11:01:47','2017-12-29 03:01:48',1,'2017-12-29 16:00:00','2017-12-31 10:00:00');

/*Table structure for table `notification_filter_qry` */

DROP TABLE IF EXISTS `notification_filter_qry`;

CREATE TABLE `notification_filter_qry` (
  `filter_query_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT 'query title',
  `user_id` int(11) DEFAULT '0' COMMENT 'user_id from paste users table',
  `device_platform` int(11) DEFAULT '0' COMMENT '1 - Android, 2- IOS, 3 - All',
  `app_version` varchar(25) DEFAULT NULL,
  `have_microchip` int(11) DEFAULT '0' COMMENT '1-yes, 2- no',
  `active_plan` tinyint(4) DEFAULT '0' COMMENT '1-yes, 2-no',
  `product_plan` int(11) DEFAULT '0' COMMENT 'id from paste_products',
  `plan_expiring_in` int(11) DEFAULT '0' COMMENT 'plan will expire in how many days',
  `remaining_balance_greater` varchar(50) DEFAULT '0' COMMENT 'remaining user data balance in mb',
  `remaining_balance_lesser` varchar(50) DEFAULT '0' COMMENT 'remaining user data balance in mb',
  `payment_done` int(11) DEFAULT '0' COMMENT '1-yes, 2-no',
  `payment_done_within` int(11) DEFAULT '0' COMMENT 'payment done in how many days',
  `payment_not_done_within` int(11) DEFAULT '0' COMMENT 'payment not done in how many days',
  `discount_code` varchar(50) DEFAULT NULL COMMENT 'Discount used user , code from paste_discount_codes',
  `include_countries` text,
  `exclude_countries` text,
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Inactive, 1 - Active, 2 - Archive',
  PRIMARY KEY (`filter_query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `notification_filter_qry` */

insert  into `notification_filter_qry`(`filter_query_id`,`title`,`user_id`,`device_platform`,`app_version`,`have_microchip`,`active_plan`,`product_plan`,`plan_expiring_in`,`remaining_balance_greater`,`remaining_balance_lesser`,`payment_done`,`payment_done_within`,`payment_not_done_within`,`discount_code`,`include_countries`,`exclude_countries`,`creation_date`,`modification_date`,`status`) values 
(1,'All user having micro chip',0,0,'',1,NULL,0,0,'','',NULL,0,0,'',NULL,NULL,'2018-01-02 10:47:03','2018-01-02 02:47:02',1),
(2,'All User those have no  microchip',0,0,'',0,0,0,0,'','',NULL,0,0,'',NULL,NULL,'2018-01-04 14:18:37','2018-01-04 06:18:04',1),
(3,'For In App Users - with expired data plans',0,0,'',1,2,0,0,'','',NULL,0,0,'',NULL,NULL,'2018-01-04 14:51:38','2018-01-04 06:47:44',1),
(4,'For In App Users - with plans expiring in 30 days',0,0,'',0,0,0,30,'','',NULL,0,0,'',NULL,NULL,'2018-01-04 14:48:56','2018-01-04 06:45:03',1),
(5,'Balance greater than 501 and less than 1000',0,0,'',0,0,0,0,'501','1000',NULL,0,0,'',NULL,NULL,'2018-01-04 14:46:26','2018-01-04 06:42:33',1),
(6,'Balance greater than 10 and less than 500',0,3,'',0,0,0,0,'10','500',NULL,0,0,'',NULL,NULL,'2018-01-04 14:43:25','2018-01-04 06:39:31',1),
(7,'Have active plan',0,0,'',0,1,0,0,'','',NULL,0,0,'',NULL,NULL,'2018-01-04 14:41:27','2018-01-04 06:37:34',1),
(8,'Have No Active Plan',0,0,'',0,2,0,0,'','',NULL,0,0,'',NULL,NULL,'2018-01-04 14:30:08','2018-01-04 06:26:15',1),
(9,'For In App Users who have not purchased anything in the last 3 months',0,0,'',0,0,0,0,'','',NULL,0,90,'','','','2018-01-04 14:53:37','2018-01-04 06:59:26',1),
(10,'All Registered In App User',0,0,'',0,0,0,0,'','',NULL,0,0,'','','','2018-01-04 15:05:16',NULL,1),
(11,'Balance less than 500',0,0,'',0,0,0,0,'','500',NULL,0,0,'','','','2018-01-04 15:18:08',NULL,1),
(12,'All Country except Malaysia',0,0,'',0,0,0,0,'','',NULL,0,0,'','','129','2018-01-04 15:24:34',NULL,1),
(13,'All user MADE NO PURCHASE',0,0,'',0,0,0,0,'','',2,0,0,'','','','2018-01-04 15:28:10','2018-01-04 07:30:11',1);

/*Table structure for table `notification_promotion` */

DROP TABLE IF EXISTS `notification_promotion`;

CREATE TABLE `notification_promotion` (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promotion_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `notification_promotion` */

insert  into `notification_promotion`(`promotion_id`,`title`,`promotion_code`,`start_date`,`end_date`) values 
(1,'first test',NULL,'2017-07-01 15:59:53','2017-07-31 15:59:58'),
(2,'second test',NULL,'2017-07-20 06:00:00','2017-07-20 08:05:59'),
(3,'test promotion 4','NOVEMBER10','2016-11-15 18:07:24','2016-11-17 18:07:26'),
(4,'test form',NULL,'2017-12-21 16:42:18','2017-12-22 16:42:20'),
(5,'from staging',NULL,'2017-12-01 18:23:58','2017-12-31 18:24:00'),
(6,'st test',NULL,'2017-12-29 23:00:51','2017-12-31 18:30:42'),
(7,'test 3 jan','promotion_my_code','2018-01-03 14:52:43','2018-01-02 16:25:54');

/*Table structure for table `notification_test_users` */

DROP TABLE IF EXISTS `notification_test_users`;

CREATE TABLE `notification_test_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_user_details` varchar(250) NOT NULL COMMENT 'User details maybe userid,email,name,mobile',
  `test_user_id` int(11) NOT NULL COMMENT 'user id from paste_users table',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-active, 2- archive',
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `notification_test_users` */

insert  into `notification_test_users`(`id`,`test_user_details`,`test_user_id`,`status`,`creation_date`,`modification_date`) values 
(2,'pugal',1531,1,'2017-12-18 16:02:30',NULL),
(3,'afzal',1,1,'2017-12-19 11:03:07','2017-12-20 10:15:20'),
(6,'mastermind_mohsin@hotmail.com',109660,1,'2017-12-29 10:49:09',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
