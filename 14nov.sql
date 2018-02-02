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

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) values 
(1,'mohsin','Fy2Q0btjb7z1voVYkLAw2Vfud4weexde','$2y$13$lut7VvkmhiQmHIa7PUK4tOJsZ0/bOPfULVrNRmwomql..2cpgBpgC',NULL,'mohsin@flexiroam.org',10,1506305715,1506305715),
(2,'test','Iw1JzXlzSUsIblpEd_NofQcMtGz4Od8o','$2y$13$.5A1MVKC.1xJo3qpLVcJa.akcsqUuZ/YzTTFBBGf7AiRcM3aC/SZ6',NULL,'test@flexiroam.org',10,1506334023,1506334023),
(3,'test3','D6IFXtNoGDJR3-dTNdEtUxZ7JNQ5m4Vh','$2y$13$pgEIrOfJn.Soo9Z5q3H4xOP92RmUDz4lDPGXhpO8eN.P/IrFv55QG',NULL,'test3@flexiroam.com',10,1506569222,1506569222);

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
(1,'Arabic','2017-10-24 10:36:36'),
(2,'English','2017-10-24 10:36:46'),
(3,'French','2017-10-24 16:40:18'),
(4,'Hindi','2017-10-24 16:40:27'),
(5,'Urdu','2017-10-24 16:40:40'),
(6,'Chinese','2017-10-31 11:50:31'),
(7,'Turkish','2017-11-03 11:14:03');

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values 
('m000000_000000_base',1505987487),
('m130524_201442_init',1505987495),
('m140209_132017_init',1508137043),
('m140403_174025_create_account_table',1508137045),
('m140504_113157_update_tables',1508137049),
('m140504_130429_create_token_table',1508137051),
('m140830_171933_fix_ip_field',1508137053),
('m140830_172703_change_account_table_name',1508137053),
('m141222_110026_update_ip_field',1508137054),
('m141222_135246_alter_username_length',1508137054),
('m150614_103145_update_social_account_table',1508137057),
('m150623_212711_fix_username_notnull',1508137057),
('m151218_234654_add_timezone_to_profile',1508137058),
('m160929_103127_add_last_login_at_to_user_table',1508137059);

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
(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `screen_windows` */

DROP TABLE IF EXISTS `screen_windows`;

CREATE TABLE `screen_windows` (
  `window_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_name` varchar(50) DEFAULT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`window_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `screen_windows` */

insert  into `screen_windows`(`window_id`,`window_name`,`type_id`,`created_at`,`image`) values 
(1,'brochure for mobile',4,'2017-10-06 14:24:11','dummy_image.jpg'),
(2,'screen_window_2',3,'2017-10-06 14:25:33',''),
(3,'screen_window_3',2,'2017-10-06 16:13:59',''),
(5,'screen_window_4',2,'2017-10-06 16:17:04',''),
(6,'screen_window_5',1,'2017-10-06 16:18:35',''),
(12,'screen_window_6',2,'2017-10-20 10:17:24',''),
(13,'screen_window_7',2,'2017-10-20 10:20:53',''),
(16,'access login page',3,'2017-11-02 10:36:39',''),
(19,'check-in-window',1,'2017-11-02 17:19:23',''),
(20,'new user profile 1',5,'2017-11-08 14:52:08','');

/*Table structure for table `screenshots` */

DROP TABLE IF EXISTS `screenshots`;

CREATE TABLE `screenshots` (
  `screenshot_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_id` tinyint(11) unsigned NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`screenshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `screenshots` */

insert  into `screenshots`(`screenshot_id`,`window_id`,`image`,`created_at`) values 
(2,2,'DNynfSSL9nvSb0z33N2xgOSxvB64Huat.gif','2017-10-06 14:25:33'),
(3,3,'P4R_Ygx-EYC08yScGqbHs8j5z-fRBBgs.gif','2017-10-06 16:13:59'),
(8,6,'dFRu6MF_fBcXVs0TaEXxPgkKaY9kwtjs.gif','2017-10-06 16:18:35'),
(16,12,'FQ9LENtNLBRemd7UaGJr_MebofRqBzR9.gif','2017-10-20 10:17:24'),
(17,13,'00hN9xUPk9D3Q_-vs2yfSStcjEMq57Cu.gif','2017-10-20 10:20:53'),
(22,2,'3zNyMjQVDE71oOeR_V30QiXX4BlIZuDl.gif','2017-10-31 10:57:30'),
(29,16,'in-jpL-Q8Yocs0lOk8Le1CO0HcwXFagf.gif','2017-11-02 10:38:41'),
(32,19,'A5jjWJNhdo2buVYY4CkjCVfLwtID5Mzd.png','2017-11-02 17:19:23'),
(47,5,'plIbA_Mc4PVeor_jtkb1NKKavdphyKOj.jpg','2017-11-06 11:02:32'),
(48,5,'hZX_-DFaUCBM0Gt26zip5OufsSQoC3hk.png','2017-11-06 11:02:51'),
(49,20,'6cee3jJgdLqTef0SYHEc1X2HLiQQnly-.jpg','2017-11-08 14:52:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `system_labels` */

insert  into `system_labels`(`label_id`,`label`,`window_id`,`access_key_android`,`access_key_ios`,`created_at`,`updated_at`) values 
(1,'welcome',1,'login_message','','2017-10-24 10:55:46','2017-09-26 11:57:16'),
(2,'good morning',3,'welcome_android','','2017-10-24 10:55:46','2017-10-02 11:09:12'),
(3,'Please login',2,'Please_login_android','Please_login_ios','2017-10-24 10:55:46','2017-10-02 11:35:19'),
(5,'login please',5,'french_login_android','','2017-10-24 10:55:46','2017-10-02 11:39:03'),
(6,'please enter username again',6,'','please enter username again iphone','2017-10-24 10:55:46','2017-10-13 11:12:34'),
(7,'confirm password',12,'confirm_password_android','','2017-10-24 16:42:39','2017-10-24 16:42:39'),
(8,'logout',3,'logout_one','','2017-10-31 13:21:10','2017-10-31 13:21:10'),
(9,'access logout button',16,'access_key_android_access_logout_page','','2017-11-02 10:54:17','2017-11-02 10:54:17'),
(10,'please enter city',19,'checkout-2-android','checkout-2-ios','2017-11-03 11:18:26','2017-11-03 11:18:26'),
(11,'checkout-2 new ',19,'access_key_android_access_logout_page','','2017-11-03 11:27:59','2017-11-03 11:27:59'),
(13,'screen-window-7-1',13,'dfdsfdsfdsdsf','','2017-11-06 15:13:30','2017-11-06 15:13:30'),
(14,'screen-window-7-2',13,'cxvxcvce','','2017-11-06 15:13:54','2017-11-06 15:13:54'),
(15,'screen-window-7-3',13,'cxvxcvc33','','2017-11-06 15:14:10','2017-11-06 15:14:10'),
(16,'Please proceed',20,'new_user_profile_android','new_user_profile_ios','2017-11-08 14:53:07','2017-11-08 14:53:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `translation` */

insert  into `translation`(`translation_id`,`label_id`,`translation`,`is_approved`,`language_id`,`created_by`,`created_at`) values 
(1,1,'ترحيب',0,1,1,'2017-10-24 10:39:17'),
(2,2,'Greetings',0,2,2,'2017-10-24 10:48:16'),
(3,3,'الرجاء تسجيل الدخول',0,1,1,'2017-10-24 14:59:54'),
(4,7,'Confirmez le mot de passe',1,3,1,'2017-10-24 16:55:38'),
(5,2,'latest good morning translation',1,1,1,'2017-10-26 15:02:44'),
(6,7,'second translation from form',1,1,1,'2017-10-26 15:15:38'),
(7,6,'الترجمة الثالثة من النموذج',0,1,1,'2017-10-26 15:21:08'),
(8,5,'الترجمة الثالثة من الن',1,1,1,'2017-10-26 15:21:59'),
(9,1,'أهلا بك',0,1,1,'2017-10-26 16:54:05'),
(10,8,'注销',0,6,1,'2017-10-31 14:11:42'),
(11,6,'请再次输入用户名',1,6,1,'2017-11-01 16:43:34'),
(12,6,'कृपया लॉगिन करें',1,4,1,'2017-11-02 10:44:07'),
(13,1,'يرجى تسجيل الدخول',1,1,9,'2017-11-02 11:03:08'),
(15,10,'الرجاء إدخال المدينة',0,1,10,'2017-11-03 11:21:59'),
(16,10,'fdsfsdsdf',0,1,10,'2017-11-03 11:22:50'),
(17,2,'bonjour',0,1,10,'2017-11-07 15:07:48'),
(18,8,'se déconnecter',1,1,10,'2017-11-07 15:07:48'),
(19,3,'يرجى تسجيل الدخول',1,1,10,'2017-11-07 15:12:03'),
(20,3,'يرجى تسجيل الدخول',0,1,10,'2017-11-07 15:12:26'),
(21,3,'fvfdvf!~~!#@#$#',0,1,10,'2017-11-07 15:34:17'),
(22,16,'يرجى المتابعة',1,1,10,'2017-11-08 14:59:00'),
(23,13,'نحن أبدا الحصول على كبار السن',1,1,10,'2017-11-09 15:50:40'),
(24,14,'طفل سحب لي أقرب',1,1,10,'2017-11-09 15:50:40'),
(25,15,'على المقعد الخلفي من رور الخاص بك',1,1,10,'2017-11-09 15:50:40'),
(29,13,'نحن أبدا ا',0,1,10,'2017-11-09 15:58:51'),
(31,11,'checkout2 translation from createwithlabel',0,1,10,'2017-11-09 16:25:11'),
(32,11,'الخروج',0,1,10,'2017-11-10 16:12:29'),
(33,9,'الوصول إلى زر الخروج',1,1,1,'2017-11-10 16:33:25'),
(34,16,'कृपया आगे बढ़ें',0,4,7,'2017-11-13 17:10:05'),
(35,1,'स्वागत',0,4,7,'2017-11-13 17:10:42'),
(36,2,'शुभ सुबह',0,4,7,'2017-11-13 17:11:09'),
(37,5,'कृपया लॉगिन करें',0,4,7,'2017-11-13 17:14:01'),
(38,6,'कृपया उपयोगकर्ता का नाम दोबारा दर्ज करें',0,4,7,'2017-11-13 17:14:35'),
(39,1,'ترحيب',0,1,10,'2017-11-14 10:18:54');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `types` */

insert  into `types`(`type_id`,`type_name`,`created_at`,`updated_at`) values 
(1,'IOS','2017-10-19 17:01:37','2017-10-19 17:01:37'),
(2,'Android','2017-10-19 17:01:51','2017-10-19 17:01:51'),
(3,'Both','2017-10-20 09:51:39','2017-10-20 09:51:39'),
(4,'brochure','2017-10-26 16:18:32','2017-10-26 16:18:32'),
(5,'user guide','2017-11-03 11:20:23','2017-11-03 11:20:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`email`,`language_id`,`password_hash`,`auth_key`,`confirmed_at`,`unconfirmed_email`,`blocked_at`,`registration_ip`,`created_at`,`updated_at`,`flags`,`last_login_at`,`status`,`role`) values 
(1,'mohsin','mohsin@flexiroam.org',NULL,'$2y$10$IKq3b9vzQDj5Q3PUhU4BK.tPodKq9yvQSFRcuEUBjTdf5jrnu/p6u','r4kMToFrhMxFanIZ0VMYBdYGtDyzVzVX',16934455,'mohsin@flexiroam.org',NULL,'::1',1508137154,1508137154,0,1510625737,30,30),
(2,'hassan','hassan@flexiroam.org',2,'$2y$10$giI6mKFVdYyRMFxq04lOE.6j5T8nDvCaWDs5RbIj.8bq3rZK9j2Ei','wvW2dK-Rnknz-paVJmUF-eRMYCk1NNUC',1508137771,NULL,NULL,'::1',1508137771,1510560104,0,1508139572,20,20),
(3,'masood','masood@flexiroam.org',5,'$2y$10$M8YFJLRQO2rMzxb4iXvQUOPxhPmmTaKy9oYOX81JpFpy57geAd4ta','sWuhRbHek0kpmaBd0eOiDnJp-BP0-8lk',1508222780,NULL,NULL,'::1',1508222780,1510557399,0,1510558592,20,20),
(7,'test4','test4@online.com',4,'$2y$10$LZrLFaIK41bwv9XkWM13DeHwpDiqw3HlE4hXUZA.BZpkpAaLu36fK','Hvtjv6TjfClSgnP2jmcORBDtV2oEYUQa',1508231164,NULL,NULL,'::1',1508231164,1509422185,0,1510567801,20,20),
(8,'test6','test6@online.com',4,'$2y$10$REWmfLOOFNV6IOnlUHdCQOZIyHMT9wQlHjCi0bF2hzXgWr5U8r/p.','lAiEkOjJfv3buZC_LPkZKOhbnqXT2W6x',1508732706,NULL,NULL,'::1',1508732706,1508732706,0,1509607447,20,20),
(9,'test7','test7@flexiroam.com',6,'$2y$10$8PSvvyca.5bQWmB.hX4wX.GiVEKvTLloaPbQp7Mrnm9rURqHMQyPC','lOfEopkY18beZIdTNWatEMW2XXtFBxKi',1509429487,NULL,NULL,'::1',1509429487,1510557193,0,1510557199,20,20),
(10,'test9','test9@online.com',1,'$2y$10$rJccihxRV.JwseZ6iB70b.T1nhDBYopYYsb3Qt8zR3RWbcGOdb4O6','6d7usTeUAX6HV2GOsO3ueABFD_zYQcM8',1509678700,NULL,NULL,'::1',1509678700,1509678700,0,1510625750,20,20);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
