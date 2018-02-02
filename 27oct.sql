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

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `profile` */

insert  into `profile`(`user_id`,`name`,`public_email`,`gravatar_email`,`gravatar_id`,`location`,`website`,`bio`,`timezone`) values 
(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `screen_windows` */

DROP TABLE IF EXISTS `screen_windows`;

CREATE TABLE `screen_windows` (
  `window_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_name` varchar(50) DEFAULT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`window_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `screen_windows` */

insert  into `screen_windows`(`window_id`,`window_name`,`type_id`,`created_at`,`image`) values 
(1,'brochure for mobile',4,'2017-10-06 14:24:11','dummy_image.jpg'),
(2,'screen_window_2',3,'2017-10-06 14:25:33',''),
(3,'screen_window_3',2,'2017-10-06 16:13:59',''),
(5,'screen_window_4',2,'2017-10-06 16:17:04',''),
(6,'screen_window_5',1,'2017-10-06 16:18:35',''),
(12,'screen_window_6',2,'2017-10-20 10:17:24',''),
(13,'screen_window_7',2,'2017-10-20 10:20:53','');

/*Table structure for table `screenshots` */

DROP TABLE IF EXISTS `screenshots`;

CREATE TABLE `screenshots` (
  `screenshot_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_id` tinyint(11) unsigned NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`screenshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `screenshots` */

insert  into `screenshots`(`screenshot_id`,`window_id`,`image`,`created_at`) values 
(1,1,'q1TexSW59T3hqOtaed2LcIIXXqekD--5.gif','2017-10-06 14:24:11'),
(2,2,'DNynfSSL9nvSb0z33N2xgOSxvB64Huat.gif','2017-10-06 14:25:33'),
(3,3,'P4R_Ygx-EYC08yScGqbHs8j5z-fRBBgs.gif','2017-10-06 16:13:59'),
(5,2,'hWtc4qsnpZ1wvFbkGG73wkJQsN0dFb-I.gif','2017-10-06 16:14:57'),
(7,5,'SV-2BERB_ZyPB472km5TCO_oaPTMQwGH.gif','2017-10-06 16:17:04'),
(8,6,'dFRu6MF_fBcXVs0TaEXxPgkKaY9kwtjs.gif','2017-10-06 16:18:35'),
(10,3,'9o6Ab0NdfEsRo8j91KXWuezo_gK0BxkD.gif','2017-10-06 16:20:49'),
(13,3,'vibERWkc7954jEVLQmd7BeM7hjvoB6bj.gif','2017-10-13 15:32:06'),
(16,12,'FQ9LENtNLBRemd7UaGJr_MebofRqBzR9.gif','2017-10-20 10:17:24'),
(17,13,'00hN9xUPk9D3Q_-vs2yfSStcjEMq57Cu.gif','2017-10-20 10:20:53');

/*Table structure for table `social_account` */

DROP TABLE IF EXISTS `social_account`;

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `social_account` */

/*Table structure for table `system_labels` */

DROP TABLE IF EXISTS `system_labels`;

CREATE TABLE `system_labels` (
  `label_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `window_id` tinyint(11) unsigned NOT NULL,
  `access_key_android` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `access_key_ios` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `system_labels` */

insert  into `system_labels`(`label_id`,`label`,`window_id`,`access_key_android`,`access_key_ios`,`created_at`,`updated_at`) values 
(1,'welcome',1,'login_message','','2017-10-24 10:55:46','2017-09-26 11:57:16'),
(2,'good morning',3,'welcome_android','','2017-10-24 10:55:46','2017-10-02 11:09:12'),
(3,'Please login',2,'Please_login_android','Please_login_ios','2017-10-24 10:55:46','2017-10-02 11:35:19'),
(5,'login please',5,'french_login_android','','2017-10-24 10:55:46','2017-10-02 11:39:03'),
(6,'please enter username again',6,'','please enter username again iphone','2017-10-24 10:55:46','2017-10-13 11:12:34'),
(7,'confirm password',12,'confirm_password_android','','2017-10-24 16:42:39','2017-10-24 16:42:39');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `token` */

insert  into `token`(`user_id`,`code`,`created_at`,`type`) values 
(1,'sJSMVQQAz8V9KibtuZSBhGTKxeh4z0rQ',1508137154,0),
(2,'XkPemZFwyBv6Vi_3l_F7KoCs1_rcKBcR',1508139536,1);

/*Table structure for table `translation` */

DROP TABLE IF EXISTS `translation`;

CREATE TABLE `translation` (
  `translation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label_id` int(11) unsigned NOT NULL,
  `translation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `language_id` int(11) unsigned NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`translation_id`),
  KEY `label_const` (`label_id`),
  KEY `language_const` (`language_id`),
  CONSTRAINT `label_const` FOREIGN KEY (`label_id`) REFERENCES `system_labels` (`label_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_const` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `translation` */

insert  into `translation`(`translation_id`,`label_id`,`translation`,`is_approved`,`language_id`,`created_by`,`created_at`) values 
(1,1,'ترحيب',1,1,1,'2017-10-24 10:39:17'),
(2,2,'Greetings',0,2,2,'2017-10-24 10:48:16'),
(3,3,'الرجاء تسجيل الدخول',1,1,1,'2017-10-24 14:59:54'),
(4,7,'Confirmez le mot de passe',1,3,1,'2017-10-24 16:55:38'),
(5,2,'latest good morning translation',0,1,1,'2017-10-26 15:02:44'),
(6,7,'second translation from form',0,1,1,'2017-10-26 15:15:38'),
(7,6,'الترجمة الثالثة من النموذج',0,1,1,'2017-10-26 15:21:08'),
(8,5,'الترجمة الثالثة من الن',0,1,1,'2017-10-26 15:21:59'),
(9,1,'أهلا بك',0,1,1,'2017-10-26 16:54:05');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `types` */

insert  into `types`(`type_id`,`type_name`,`created_at`,`updated_at`) values 
(1,'IOS','2017-10-19 17:01:37','2017-10-19 17:01:37'),
(2,'Android','2017-10-19 17:01:51','2017-10-19 17:01:51'),
(3,'Both','2017-10-20 09:51:39','2017-10-20 09:51:39'),
(4,'brochure','2017-10-26 16:18:32','2017-10-26 16:18:32');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) unsigned DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '20',
  `role` smallint(2) DEFAULT '20',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`email`,`language_id`,`password_hash`,`auth_key`,`confirmed_at`,`unconfirmed_email`,`blocked_at`,`registration_ip`,`created_at`,`updated_at`,`flags`,`last_login_at`,`status`,`role`) values 
(1,'mohsin','mohsin@flexiroam.org',NULL,'$2y$10$IKq3b9vzQDj5Q3PUhU4BK.tPodKq9yvQSFRcuEUBjTdf5jrnu/p6u','r4kMToFrhMxFanIZ0VMYBdYGtDyzVzVX',16934455,'mohsin@flexiroam.org',NULL,'::1',1508137154,1508137154,0,1508840750,30,30),
(2,'hassan','hassan@flexiroam.org',NULL,'$2y$10$giI6mKFVdYyRMFxq04lOE.6j5T8nDvCaWDs5RbIj.8bq3rZK9j2Ei','wvW2dK-Rnknz-paVJmUF-eRMYCk1NNUC',1508137771,NULL,NULL,'::1',1508137771,1508137771,0,1508139572,20,20),
(3,'masood','masood@flexiroam.org',NULL,'$2y$10$eO197AgMf35PY.qcOyVk9.lq/4KnN2zpwtbCGqql8zlhEmT/wiF12','sWuhRbHek0kpmaBd0eOiDnJp-BP0-8lk',1508222780,NULL,NULL,'::1',1508222780,1508222780,0,1508223937,20,20),
(4,'asad','asad@flexiroam.org',1,'$2y$10$J3sHNFANOfDioJBkUuxPlOLNSQFLNIgAP/5H2.mXQutFtCv5jiSZC','Tiep-_8iYuGbpiIs8Bt0Llv8mC4RpYOo',1508226308,NULL,NULL,'::1',1508226308,1508226308,0,NULL,20,20),
(5,'ali','ali@flexiroam.org',NULL,'$2y$10$sNUVTw3lRzKUJ/C6Ix96sOnlJmip6DXr7lxZkr.3WAhzMPFaHYT3i','NHoRYr5RQBJyZGYCzLJ2NFAU1wWeytO9',1508226542,NULL,NULL,'::1',1508226542,1508226542,0,NULL,20,20),
(6,'test5','test5@online.com',NULL,'$2y$10$lwLPCaFLKkJyMGdsuxppM.gQTDpSvEMDaAJD1/mg8zKUWtrobbCGi','0hoR-iTAtqLO68NclkWiU2hSbDoW9Hvl',1508227914,NULL,NULL,'::1',1508227914,1508227914,0,NULL,20,20),
(7,'test4','test4@online.com',4,'$2y$10$w8wXXnDcDBLbcaSnnjPhueWkBmBJpaKxCmlGN3f58.O6sJK3E8jNe','Hvtjv6TjfClSgnP2jmcORBDtV2oEYUQa',1508231164,NULL,NULL,'::1',1508231164,1508231164,0,1508732441,20,20),
(8,'test6','test6@online.com',4,'$2y$10$0LuDrXfkIiLIc/De6PO90u1iNXx8f3/nlx.6sgkUDmLs.8.8Hqyd2','lAiEkOjJfv3buZC_LPkZKOhbnqXT2W6x',1508732706,NULL,NULL,'::1',1508732706,1508732706,0,1508743302,20,20);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
