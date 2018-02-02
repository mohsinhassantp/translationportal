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
  `language_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `languages` */

insert  into `languages`(`language_id`,`language_name`,`created_at`) values 
(1,'English','2017-09-25 14:25:00'),
(2,'French','2017-09-25 14:25:34'),
(4,'Arabic','2017-09-25 18:46:35'),
(5,'Dutch','2017-10-03 16:33:11'),
(10,'Urdu','2017-10-03 17:17:58');

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
('m130524_201442_init',1505987495);

/*Table structure for table `screen_windows` */

DROP TABLE IF EXISTS `screen_windows`;

CREATE TABLE `screen_windows` (
  `window_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_name` varchar(50) DEFAULT NULL,
  `type` enum('IOS','Android','Both') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`window_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `screen_windows` */

insert  into `screen_windows`(`window_id`,`window_name`,`type`,`created_at`,`image`) values 
(1,'profile_4','IOS','2017-10-06 14:24:11','dummy_image.jpg'),
(2,'Signup_2','Android','2017-10-06 14:25:33',''),
(3,'Signup_3','Android','2017-10-06 16:13:59',''),
(4,'Signup_2','IOS','2017-10-06 16:14:57',''),
(5,'Signup_2','IOS','2017-10-06 16:17:04',''),
(6,'profile_1','IOS','2017-10-06 16:18:35',''),
(7,'profile_2','Android','2017-10-06 16:20:49','');

/*Table structure for table `screenshots` */

DROP TABLE IF EXISTS `screenshots`;

CREATE TABLE `screenshots` (
  `screenshot_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `screen_windows_id` tinyint(11) unsigned NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`screenshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `screenshots` */

insert  into `screenshots`(`screenshot_id`,`screen_windows_id`,`image`,`created_at`) values 
(1,1,'TJqmxQxYA6bTof91iqPnJBdT2thIz6ID.gif','2017-10-06 14:24:11'),
(2,2,'Ox7rZZQUr6mSUdzTlpnIbisyt1pESEho.gif','2017-10-06 14:25:33'),
(3,3,'nXAyDrI89FfV-ByoP8Bn4hVNX3vxbpVH.jpg','2017-10-06 16:13:59'),
(5,4,'t8LpZ70Vy7rJ_yQVEppX9GAmb0tQ5cC4.png','2017-10-06 16:14:57'),
(6,4,'wnS2iIywQqcwPmGr77kQATV_u-YTsVQp.gif','2017-10-06 16:14:57'),
(7,5,'AHYmgC1cAYCAQnJ_90NWV_LG2FqneuhK.jpg','2017-10-06 16:17:04'),
(8,6,'4Vg7DrO_2JqO0AfRS7UPsVNW4-QEbJco.jpg','2017-10-06 16:18:35'),
(9,6,'ykkIypEgaH_khjHFzWUx1oC6r5umc1rl.jpg','2017-10-06 16:18:35'),
(10,7,'KkMtHhJyM0Dwm2OaT5js0qP0s9aAx1r3.jpg','2017-10-06 16:20:49'),
(11,1,'kqlqyJkJGWumndD_D5iXmqMSc9_M_UBq.jpg','2017-10-06 17:07:18'),
(12,2,'ZztF4smMIho9rEQbaVtxL9nS6VxhHPkQ.png','2017-10-06 17:07:35'),
(13,1,'rJPGnsiGreToj_YLItIl_8C0-VIRxqEb.jpg','2017-10-13 15:32:06'),
(14,4,'SsJ8f23IzYnukeYNBfH1zWrKMjLsBA6V.jpg','2017-10-13 15:37:33'),
(15,5,'yCSzPDX4I1TCDDg1OZ6MOqGHx6ZIPrJi.jpg','2017-10-13 16:19:55');

/*Table structure for table `translation` */

DROP TABLE IF EXISTS `translation`;

CREATE TABLE `translation` (
  `translation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` tinyint(11) unsigned NOT NULL,
  `window_id` tinyint(11) unsigned NOT NULL,
  `access_key_android` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `access_key_ios` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `label` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `translation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `previous_translation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` tinyint(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `translation` */

insert  into `translation`(`translation_id`,`language_id`,`window_id`,`access_key_android`,`access_key_ios`,`label`,`translation`,`previous_translation`,`created_at`,`updated_at`,`updated_by`,`status`) values 
(1,4,1,'login_message','login_message','welcome','स्वागत हे','स्वागत ह','2017-09-26 11:57:16','2017-09-26 11:57:16',1,1),
(2,1,1,'welcome_android','welcome_ios','welcome','nice to see you!','ee','2017-10-02 11:09:12','2017-10-02 11:09:12',NULL,1),
(3,1,2,'Please_login_android','Please_login_ios','Please login','login please','','2017-10-02 11:35:19','2017-10-02 11:35:19',1,1),
(5,2,1,'french_login_android','french_login_ios','login please','Connectez-vous','','2017-10-02 11:39:03','2017-10-02 11:39:03',1,1),
(6,5,2,'please enter username again android','please enter username again iphone','please enter username again','Vul alstublieft uw gebruikersnaam in','','2017-10-13 11:12:34','2017-10-13 11:12:34',1,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` tinyint(11) unsigned NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`language_id`,`status`,`created_at`,`updated_at`) values 
(1,'mohsin','Fy2Q0btjb7z1voVYkLAw2Vfud4weexde','$2y$13$lut7VvkmhiQmHIa7PUK4tOJsZ0/bOPfULVrNRmwomql..2cpgBpgC',NULL,'mohsin@flexiroam.org',0,10,1506305715,1506305715),
(2,'hassan','T98p4X1LeYdxhyYzYS9VN5ltMtYu2ux8','$2y$13$uZDBMxCgL9yjtpmV3UoK9OxRROhR7VjwuufXh6KEj47bOe/GuohTa',NULL,'hassan@flexiroam.org',0,10,1506312952,1506312952),
(3,'test3','EMytXKfLdF91zTaaFK8KXEpbtvmEr711','$2y$13$w1MJhdEp5LDB1i6Zi1IK4u5gzd7DfT6ez.n/l5Ws0wXphbpIPyGv.',NULL,'test3@flexiroam.com',0,10,1506569339,1506569339),
(4,'test3online','45skTVfYZr-u711GdKFXId28XaqdXVzL','$2y$13$8LZdBW7V0g/r6IuxmWMJGOZQ4.3xWLDAmxOAnVCsKRLa8XvxFdmRu',NULL,'test3@online.com',2,10,1506584906,1506584906),
(5,'mohsin2','Fy2Q0btjb7z1voVYkLAw2Vfud4weexde','$2Y$13$lut7VvkmhiQmHIa7PUK4tOJsZ0/bOPfULVrNRmwomql..2cpgBpgC',NULL,'mohsin2@flexiroam.org',2,10,1506305715,1506305715);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
