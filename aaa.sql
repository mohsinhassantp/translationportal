/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.6.34-log : Database - translationportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`translationportal` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `translationportal`;

/*Table structure for table `screen_windows` */

DROP TABLE IF EXISTS `screen_windows`;

CREATE TABLE `screen_windows` (
  `window_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_name` varchar(50) DEFAULT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`window_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `screen_windows` */

insert  into `screen_windows`(`window_id`,`window_name`,`type_id`,`created_at`,`image`) values 
(24,'Welcome-ios',1,'2017-11-21 15:06:49',''),
(25,'Login-ios',1,'2017-11-21 16:24:35',''),
(26,'Home-all',3,'2017-11-21 17:08:58',''),
(27,'Coverage-ios',1,'2017-11-21 17:20:48',''),
(28,'Status-both',3,'2017-11-21 17:22:20',''),
(29,'Call-both',3,'2017-11-21 17:26:26',''),
(30,'Account-both',3,'2017-11-21 17:28:17',''),
(31,'What can you do with 1GB data?-both',3,'2017-11-22 09:40:48',''),
(32,'Refer Friends-both',3,'2017-11-22 09:56:43',''),
(33,'Global Data-both',3,'2017-11-22 10:51:33',''),
(34,'Local Data-both',3,'2017-11-22 11:24:41',''),
(35,'Guides',1,'2017-11-22 12:02:12',''),
(36,'Troubleshooting',1,'2017-11-22 12:23:37',''),
(37,'Contact Support-both',3,'2017-11-22 12:31:51',''),
(38,'Language-both',3,'2017-11-22 14:08:15',''),
(39,'Payment Method-both',3,'2017-11-22 14:11:26',''),
(40,'Plan Renewal Option',1,'2017-11-22 14:24:42',''),
(41,'Apply Promo Code',1,'2017-11-22 14:28:51',''),
(42,'Support',1,'2017-11-22 14:32:08',''),
(43,'Transaction',1,'2017-11-22 14:36:19',''),
(44,'About-both',3,'2017-11-22 14:45:25',''),
(45,'Plan History',1,'2017-11-22 14:49:04',''),
(46,'Referral History',1,'2017-11-22 14:51:01',''),
(47,'Login-android',2,'2017-11-23 09:25:22',''),
(48,'Welcome-all',3,'2017-11-23 11:45:31',''),
(49,'Welcome-android',2,'2017-11-23 11:46:13',''),
(51,'Login-all',3,'2017-11-23 12:07:12',''),
(52,'Home-android',2,'2017-11-23 12:30:11',''),
(53,'Home-ios',1,'2017-11-23 12:30:25',''),
(54,'Coverage-both',3,'2017-11-23 15:19:34',''),
(55,'Status-ios',1,'2017-11-23 15:26:42',''),
(56,'Status-android',2,'2017-11-23 15:27:06',''),
(57,'Account-ios',1,'2017-11-23 15:47:09',''),
(58,'Account-android',2,'2017-11-23 15:47:37',''),
(59,'What can you do with 1GB data?-ios',1,'2017-11-23 16:09:03',''),
(60,'What can you do with 1GB data?-android',2,'2017-11-23 16:09:33',''),
(61,'Refer Friends-android',2,'2017-11-23 16:37:13',''),
(62,'Refer Friends-ios',1,'2017-11-23 16:39:17',''),
(63,'Global Data-ios',1,'2017-11-23 16:48:09',''),
(64,'Global Data-android',2,'2017-11-23 16:49:48',''),
(65,'Local data-ios',1,'2017-11-24 09:33:01',''),
(66,'Local data-android',2,'2017-11-24 09:34:19',''),
(67,'Transaction-android',2,'2017-11-28 06:46:08',''),
(68,'about-ios',1,'2017-11-28 06:52:28',''),
(69,'about-android',2,'2017-11-28 06:52:55',''),
(70,'Payment Method-android',2,'2017-11-28 07:02:10',''),
(71,'Payment Method-ios',1,'2017-11-28 07:03:24',''),
(72,'Apply Promo Code-android',2,'2017-11-28 07:08:01',''),
(73,'Language-android',2,'2017-11-28 07:11:10',''),
(74,'Contact Support-ios',1,'2017-11-28 09:26:13','');

/*Table structure for table `screenshots` */

DROP TABLE IF EXISTS `screenshots`;

CREATE TABLE `screenshots` (
  `screenshot_id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `window_id` tinyint(11) unsigned NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`screenshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

/*Data for the table `screenshots` */

insert  into `screenshots`(`screenshot_id`,`window_id`,`image`,`created_at`) values 
(85,35,'56od1VLB-LqJ-Z1meMXzvbZx_0XPnPaT.png','2017-11-22 12:02:12'),
(86,36,'Ox2g5Jx7f6LFdbt7TuXiQBUypsRb_tmi.png','2017-11-22 12:23:37'),
(87,36,'XgTeH23Vwws9EtLLegLkXJH6DuIQeFBc.png','2017-11-22 12:23:37'),
(91,40,'BzBW0OH-OAbEOLjwebK_5bzGzQzBT16j.png','2017-11-22 14:24:42'),
(92,41,'J51FdanbmFXE0FeSxDjRumMvrgW_41I-.png','2017-11-22 14:28:51'),
(93,42,'6wdTxCAwsd1582tjdZXPNH9yhh8XUD7V.png','2017-11-22 14:32:08'),
(94,43,'rSSwB8IYzUdoVb5jB0P3gfLlSRlXnUOl.png','2017-11-22 14:36:19'),
(96,45,'ln0grRRSfr2Ymo7U5sc52Vu_8sZJoVgQ.png','2017-11-22 14:49:04'),
(97,46,'iraWqrjsLdubQtOljSCCO01gaRxnrviQ.png','2017-11-22 14:51:01'),
(98,24,'tneaf8iPbP92dQGnDhZcPIgBlMtP_TL4.png','2017-11-22 15:44:49'),
(99,24,'6Bv-yOjmZ18chMQArFjXpq3CyNiH4Tvm.png','2017-11-22 15:44:50'),
(100,24,'nuhA6ATeYWcIr-qcLZMP6DI14FAdTKOT.png','2017-11-22 15:44:50'),
(106,25,'SmF0gkdyn1xI2msgWdadD-z68WxUDBNG.png','2017-11-23 09:45:40'),
(107,25,'pfxq0EFW4i9UyOygltQUydkEsaveg9TN.png','2017-11-23 09:45:40'),
(109,26,'dauYuFbJ-Bi157ykpXSQgS-P_2vvKvkz.png','2017-11-23 09:54:26'),
(110,26,'R_zjeaAWl-jVO8dEsVTsM8HXxYsS-U48.png','2017-11-23 09:54:26'),
(111,26,'m-MS8RpMrKnQEbSGnWJtT3zD8-5yMBvV.png','2017-11-23 09:54:26'),
(112,27,'wmGNdvG7vAsdp0czYblbI_nEO6feUVZv.png','2017-11-23 10:10:15'),
(114,28,'WLarZOFWjq8RYksWxJ7OYL4tsN5P6W3y.png','2017-11-23 10:21:19'),
(115,28,'FxAdVNrAvFo4wAr4ng4NyRznCXGeHWnl.png','2017-11-23 10:21:19'),
(116,47,'VTDUxyRuPvlwkN5BBCw-xUEa9XwRWqhe.png','2017-11-23 10:53:48'),
(117,49,'Yjl_XkaXUXnvQwr0Tzrp7z6C-31da1xI.png','2017-11-23 11:58:34'),
(118,49,'W2y4eEhlEtNWmdG6bnTFoIZwih8BkYB4.png','2017-11-23 11:58:34'),
(119,49,'H-HtquqFE--ABnw8CdZXieWqF57xtTn0.png','2017-11-23 11:58:34'),
(126,48,'EoNS3moD2VT5VuBarkDHlgZQozH1-pZt.png','2017-11-23 12:05:46'),
(127,48,'b29f_pFxWYYaTwg2zj2VD4WeuyNw--6K.png','2017-11-23 12:05:46'),
(128,48,'OOf9vFaG06LS1Ro4o3op7q1kiAxZkFqV.png','2017-11-23 12:05:46'),
(129,48,'C66aSAEdDWYnrB0pMeDjL8JvqJmt30EU.png','2017-11-23 12:05:47'),
(130,48,'SsGhB-IWl_P8lGNeJ3LvBsAuIXbRDef_.png','2017-11-23 12:05:47'),
(131,48,'tm8-tItfezypAJzMPHQHqoTAzNGz1A5i.png','2017-11-23 12:05:47'),
(132,51,'l8Prhzda4DD-Amt3Eoz6WQBggzlpSzWq.png','2017-11-23 12:11:43'),
(133,51,'H7S6HHFIDtuX0H7SdIUV2Nvdo4qygofU.png','2017-11-23 12:11:43'),
(134,51,'w0ILUDfvdehwW0ctu9VOAnZ8yCNKEED1.png','2017-11-23 12:11:43'),
(135,52,'hhGkRavzoOzDRqGMa2OO3t8bHEmGLlCc.png','2017-11-23 13:31:56'),
(136,52,'JRn9VWl3P0TNGSZYvcsnhfp7-_7NPE7a.png','2017-11-23 13:31:56'),
(137,53,'4Tov0qQI59OGZoYJaOcgyRgtqqRUGG5Y.png','2017-11-23 13:32:53'),
(138,53,'3HKZGiNUgjuJyU1higjpJMigic_7PgzM.png','2017-11-23 13:32:53'),
(139,54,'nmoSGAIXUZWj5nCBV4ozT0NXIZpqo0th.png','2017-11-23 15:19:34'),
(140,54,'okcrFl9Ts0AV5VKhUvZ3o74ycDDVldJP.png','2017-11-23 15:19:34'),
(141,55,'8wP12zWwRxOtMEH1EC6c62ItHNVoDzPf.png','2017-11-23 15:26:42'),
(142,56,'yfjHReF4gm-8iI1EhD_WL2yM6ZG-B2B7.png','2017-11-23 15:27:06'),
(143,29,'ZeP8fFcd9kneFM2DoeJ-8TTQ_Pd0BEq5.png','2017-11-23 15:38:18'),
(144,29,'6sWS_QfUeSJ3DTw4lpAWqzomsoaK74rL.png','2017-11-23 15:38:18'),
(145,30,'lY_b6qi4ocsbwfmBHRp9JTTo7hG3upFt.png','2017-11-23 15:44:28'),
(146,30,'BwUIlzJHMy_K6cr8hRSqvmP-IwQh1eVi.png','2017-11-23 15:44:28'),
(147,30,'g7ZeVgcnQqpKJ_9jcKWIOU2GfHKidkhX.png','2017-11-23 15:44:29'),
(148,57,'8dtaZtfy1-Q1n7JuoS6RE2nfy89kivnN.png','2017-11-23 15:47:09'),
(149,58,'uosIW04pDpNu36jo5iWupfHcc356siie.png','2017-11-23 15:47:37'),
(150,58,'YCYXs9kutl62zfflGkLhbFDasST3BpYh.png','2017-11-23 15:47:37'),
(151,31,'ylThoYWrpxRbtwdQ1vRIYzj37j4zyBVD.png','2017-11-23 16:08:35'),
(152,31,'1UAPSnXQbp0t9xSN5fA2W87dJARifF7B.png','2017-11-23 16:08:35'),
(153,59,'BGVRsgiD14Fl8C9AP7i9wsBOVLxyNJc0.png','2017-11-23 16:09:04'),
(154,60,'OW-ou85f5ACX2Gv50zb21WINxh-Jg-mi.png','2017-11-23 16:09:33'),
(155,32,'ZQI_d2fU6otDsb1N2h6jL2ukdM6iIVGM.png','2017-11-23 16:28:24'),
(156,32,'vkY9Y0Ck07B5tQh7HTsWd17Ir9vZQISS.png','2017-11-23 16:28:24'),
(157,61,'AKTx2vI2yjG8Iu00l3wu1iVd3lZngV89.png','2017-11-23 16:37:13'),
(158,62,'QuOG0IKFzxsTWG873R4XvI8GVZ7OtkpQ.png','2017-11-23 16:39:17'),
(159,63,'dJK3ijfKiktH_IDkjO-7OmI3YByHwePv.png','2017-11-23 16:48:09'),
(160,63,'-cDBmZi-vwNkeV4QDbg8yUxzYV147LZn.png','2017-11-23 16:48:09'),
(161,63,'Nuyf1eU-BQzyIYyA2_q9YFOuiDda_t5d.png','2017-11-23 16:48:09'),
(162,63,'27uu6o2jkd3L32nn7wdlqrP4in63Rwch.png','2017-11-23 16:48:09'),
(163,33,'bxGaV46dhqvJI-z05hSbMJnV_4Bj3lJa.png','2017-11-23 16:49:03'),
(164,33,'a9gtgNDkCOyhYBSiyczwNnyYG6fKsEoQ.png','2017-11-23 16:49:03'),
(165,33,'iE3bhRta2neP4b0LineS9NXIlpDxcB6g.png','2017-11-23 16:49:03'),
(166,33,'u5PGStfv2VEsSZ_zQS-26Mr1jS-dSZv-.png','2017-11-23 16:49:03'),
(167,33,'DdvAffSpDD7rqZiX77tXz5dnO5iT_Z8p.png','2017-11-23 16:49:03'),
(168,33,'VAXvqfXuJ_WacJdq8yq5EXvV6sAVr86U.png','2017-11-23 16:49:03'),
(169,33,'GKLlh1xOEqObCJLmr5HuqJECv_sEYy94.png','2017-11-23 16:49:03'),
(170,64,'DDzjumZ1I6bIlEHGT9AcTMRrhM_WkCH4.png','2017-11-23 16:49:48'),
(171,64,'abW-PzNG6i1Is808SJuCxM1tQC0lhsRa.png','2017-11-23 16:49:49'),
(172,64,'rtByK2QImFjNtyhmxVEMeDPYg41qGVbd.png','2017-11-23 16:49:49'),
(173,34,'nzHN0ZrHfDk6DEcByziC3ACpsC9S3JjM.png','2017-11-24 09:31:08'),
(174,34,'d9ltrAYoXGi1iCUZ88J3OffyAmmeLorz.png','2017-11-24 09:31:08'),
(175,34,'80ezExQUl7padxy0viYJvUdxuIe-Z7RS.png','2017-11-24 09:31:09'),
(176,34,'zmGM1wwo6yCTecF3NyyHPWYsE17PWtIy.png','2017-11-24 09:31:09'),
(177,34,'UTaRq9MnQGOnOtQfQCLe9aDlLb-c7nlc.png','2017-11-24 09:31:09'),
(178,34,'WRAyIAp3RvcQfNex2a1zSH7PbCgK24XD.png','2017-11-24 09:31:09'),
(179,34,'mrG8PUywiwY42xQuRnDcVw1cG39lNnbJ.png','2017-11-24 09:31:09'),
(180,65,'PL3_VSTVq6IRx2S6l5Y8R6McR9HD2s1a.png','2017-11-24 09:33:02'),
(181,65,'08Nrz-Ee74GpovjgIIde1bfDaYO2TscZ.png','2017-11-24 09:33:02'),
(182,65,'eQSSTmaj9y0_vKf42ht7lBTUjhZrQy6m.png','2017-11-24 09:33:02'),
(183,65,'BYZ6mgAI3jgSlO_DgD9v0ruRvY1QAgkT.png','2017-11-24 09:33:02'),
(184,66,'IAi3YOncVuTr4P4BsgJIc80jWyWT3p4u.png','2017-11-24 09:34:19'),
(185,66,'_GXUvrcu3230AdFvZLpLsZW9hyWNsMbf.png','2017-11-24 09:34:19'),
(186,66,'VVVUdMEci324-DgOJuzRJAJkUKw5Tf3Q.png','2017-11-24 09:34:19'),
(187,67,'FWZY1NQNAXvZUqVFmRtxwYmob1_c_oYC.png','2017-11-28 06:46:08'),
(188,44,'-10rd4VuUsczKY7FjqzbR9PX2cqcqbAU.png','2017-11-28 06:51:50'),
(189,44,'9eJuIb-rSCGigm41QSaLv1LSgsjUPnjo.png','2017-11-28 06:51:50'),
(190,68,'cMkSd-MaAikPs9WRLnblSSOIiLiVSZtf.png','2017-11-28 06:52:28'),
(191,69,'qqHbnNOB7qf6LrC9xDApDNqIDulBcgGw.png','2017-11-28 06:52:55'),
(192,39,'tgTielAFpGT2Iy_aYBcvidAxfqy6DNHL.png','2017-11-28 07:01:11'),
(193,39,'1n8RhUl8ITaJo5h62LN8QbOBhFm-E2Tf.png','2017-11-28 07:01:11'),
(194,70,'BBlijT3qMQan6wEjJPZP28FlwCz8IuVE.png','2017-11-28 07:02:10'),
(195,71,'DupMKFw-JrAFSRjuNexcPz8MZPPQHUNH.png','2017-11-28 07:03:24'),
(196,72,'2s-cKLvF78ni43TjBxzY07n5lnTWYBG1.png','2017-11-28 07:08:01'),
(197,38,'ut5Bi9COcH6pGtvguR6humK34FPo6h8B.png','2017-11-28 07:10:43'),
(198,38,'O0NKhO5G0rU5HeO8B7NvO-aq_EuP-G02.png','2017-11-28 07:10:43'),
(199,73,'eLHBxjf3t-OcMZ13QdG-t4Biq4ijOGme.png','2017-11-28 07:11:10'),
(200,37,'I2EC3K-Bd96thB36f4wX53gOvhTWmPtk.png','2017-11-28 09:25:46'),
(201,37,'_Ysc5rWamerRVv9QVbM3-qiLzhnkaWNh.png','2017-11-28 09:25:46'),
(202,74,'nMlBgsioPkaNf1L7GYEnQOsP47tLSwoJ.png','2017-11-28 09:26:13');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
