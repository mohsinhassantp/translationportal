-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2017 at 03:34 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `translationportal3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mohsin', 'Fy2Q0btjb7z1voVYkLAw2Vfud4weexde', '$2y$13$lut7VvkmhiQmHIa7PUK4tOJsZ0/bOPfULVrNRmwomql..2cpgBpgC', NULL, 'mohsin@flexiroam.org', 10, 1506305715, 1506305715),
(2, 'test', 'Iw1JzXlzSUsIblpEd_NofQcMtGz4Od8o', '$2y$13$.5A1MVKC.1xJo3qpLVcJa.akcsqUuZ/YzTTFBBGf7AiRcM3aC/SZ6', NULL, 'test@flexiroam.org', 10, 1506334023, 1506334023),
(3, 'test3', 'D6IFXtNoGDJR3-dTNdEtUxZ7JNQ5m4Vh', '$2y$13$pgEIrOfJn.Soo9Z5q3H4xOP92RmUDz4lDPGXhpO8eN.P/IrFv55QG', NULL, 'test3@flexiroam.com', 10, 1506569222, 1506569222);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) UNSIGNED NOT NULL,
  `language_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`, `created_at`) VALUES
(1, 'English', '2017-10-24 10:36:36'),
(2, 'Chinese traditional', '2017-10-24 10:36:46'),
(3, 'Chinese simplified', '2017-10-24 16:40:18'),
(4, 'Portuguese', '2017-10-24 16:40:27'),
(5, 'Urdu', '2017-10-24 16:40:40'),
(6, 'Chinese', '2017-10-31 11:50:31'),
(7, 'Turkish', '2017-11-03 11:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1505987487),
('m130524_201442_init', 1505987495),
('m140209_132017_init', 1508137043),
('m140403_174025_create_account_table', 1508137045),
('m140504_113157_update_tables', 1508137049),
('m140504_130429_create_token_table', 1508137051),
('m140830_171933_fix_ip_field', 1508137053),
('m140830_172703_change_account_table_name', 1508137053),
('m141222_110026_update_ip_field', 1508137054),
('m141222_135246_alter_username_length', 1508137054),
('m150614_103145_update_social_account_table', 1508137057),
('m150623_212711_fix_username_notnull', 1508137057),
('m151218_234654_add_timezone_to_profile', 1508137058),
('m160929_103127_add_last_login_at_to_user_table', 1508137059);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `screenshots`
--

CREATE TABLE `screenshots` (
  `screenshot_id` tinyint(11) UNSIGNED NOT NULL,
  `window_id` tinyint(11) UNSIGNED NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screenshots`
--

INSERT INTO `screenshots` (`screenshot_id`, `window_id`, `image`, `created_at`) VALUES
(2, 2, 'DNynfSSL9nvSb0z33N2xgOSxvB64Huat.gif', '2017-10-06 14:25:33'),
(3, 3, 'P4R_Ygx-EYC08yScGqbHs8j5z-fRBBgs.gif', '2017-10-06 16:13:59'),
(8, 6, 'dFRu6MF_fBcXVs0TaEXxPgkKaY9kwtjs.gif', '2017-10-06 16:18:35'),
(16, 12, 'FQ9LENtNLBRemd7UaGJr_MebofRqBzR9.gif', '2017-10-20 10:17:24'),
(17, 13, '00hN9xUPk9D3Q_-vs2yfSStcjEMq57Cu.gif', '2017-10-20 10:20:53'),
(22, 2, '3zNyMjQVDE71oOeR_V30QiXX4BlIZuDl.gif', '2017-10-31 10:57:30'),
(29, 16, 'in-jpL-Q8Yocs0lOk8Le1CO0HcwXFagf.gif', '2017-11-02 10:38:41'),
(32, 19, 'A5jjWJNhdo2buVYY4CkjCVfLwtID5Mzd.png', '2017-11-02 17:19:23'),
(47, 5, 'plIbA_Mc4PVeor_jtkb1NKKavdphyKOj.jpg', '2017-11-06 11:02:32'),
(48, 5, 'hZX_-DFaUCBM0Gt26zip5OufsSQoC3hk.png', '2017-11-06 11:02:51'),
(49, 20, '6cee3jJgdLqTef0SYHEc1X2HLiQQnly-.jpg', '2017-11-08 14:52:09'),
(50, 1, 'I7aqN2AgztAVUanH5-jLtUL3DznAK1F9.png', '2017-11-16 16:21:30'),
(51, 21, 'XSwb-ziWM10X8Ubl-QdVHv7d3PtOEH70.png', '2017-11-21 13:53:27'),
(52, 21, 'NznYrn07pzhalb5gwl8cZCGvUDKI1Y-3.png', '2017-11-21 13:53:27'),
(53, 21, 'lKvW9dPKml7D4xeMgp7mP2X_aKBYMMCB.jpg', '2017-11-21 13:53:27'),
(54, 22, 'WqEQjPaXZHVUaV9EkX9o6j6ZTmF3wVQ0.jpg', '2017-11-21 14:35:48'),
(61, 24, 'vIse0UtAOasgSs1ZNhcIycUjyRS24VnK.png', '2017-11-21 16:18:02'),
(62, 24, 'FtjVsbdm8iT_gmQ2Dkq7uGGHLCxf-zZJ.png', '2017-11-21 16:18:02'),
(63, 24, 'nhp0zV6Zd6QEIgeMhXfeedZfnnAlauEA.png', '2017-11-21 16:18:02'),
(67, 26, '9ZZCpA1f7MwMGp2cHa4wLEE3omdfUusd.png', '2017-11-21 17:08:58'),
(68, 26, 'JL0sEIUwZu3bHF-sgwAjEmAAac1HNFzC.png', '2017-11-21 17:08:58'),
(69, 27, 'l66iwWGUH7k4HQ-x3JyCkMW_BqPoPQn0.png', '2017-11-21 17:20:48'),
(70, 28, 'XEGC-B_tlOgbnYS6vs0x_L5ZiinY4uzO.png', '2017-11-21 17:22:20'),
(71, 29, 'oALkdTQRsOdcs_dXJQJ2kS9-ZWspAOZi.png', '2017-11-21 17:26:27'),
(72, 30, 'Ll98AWYGQ9HDH31pHbuLHYNtGpxK1P-H.png', '2017-11-21 17:28:17'),
(73, 25, 'O3tN09Pduidox1TpywxC41eI9eOghlyn.png', '2017-11-22 09:10:22'),
(74, 25, 'yQhbQ9GWDVWIyWWZf16bQGG2AFKWmhRs.png', '2017-11-22 09:10:22'),
(75, 31, '-q0wBQUH6hB7IpIwzWcGGnFTEZtXeSFC.png', '2017-11-22 09:40:48'),
(76, 32, 'JNfNrGw8fwFaZE5nXyUyGQCr8DTLKwSp.png', '2017-11-22 09:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `screen_windows`
--

CREATE TABLE `screen_windows` (
  `window_id` tinyint(11) UNSIGNED NOT NULL,
  `window_name` varchar(50) DEFAULT NULL,
  `type_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screen_windows`
--

INSERT INTO `screen_windows` (`window_id`, `window_name`, `type_id`, `created_at`, `image`) VALUES
(1, 'brochure for mobile', 4, '2017-10-06 14:24:11', 'dummy_image.jpg'),
(2, 'screen_window_2', 3, '2017-10-06 14:25:33', ''),
(3, 'screen_window_3', 2, '2017-10-06 16:13:59', ''),
(5, 'screen_window_4', 2, '2017-10-06 16:17:04', ''),
(6, 'screen_window_5', 1, '2017-10-06 16:18:35', ''),
(12, 'screen_window_6', 2, '2017-10-20 10:17:24', ''),
(13, 'screen_window_7', 2, '2017-10-20 10:20:53', ''),
(16, 'access login page', 3, '2017-11-02 10:36:39', ''),
(19, 'check-in-window', 1, '2017-11-02 17:19:23', ''),
(20, 'new user profile 1', 5, '2017-11-08 14:52:08', ''),
(21, 'login window android', 2, '2017-11-21 13:53:27', ''),
(22, 'Logout', 2, '2017-11-21 14:35:48', ''),
(24, 'Welcome', 1, '2017-11-21 15:06:49', ''),
(25, 'Login', 1, '2017-11-21 16:24:35', ''),
(26, 'Home', 1, '2017-11-21 17:08:58', ''),
(27, 'Coverage', 1, '2017-11-21 17:20:48', ''),
(28, 'Connection Statu', 1, '2017-11-21 17:22:20', ''),
(29, 'Call', 1, '2017-11-21 17:26:26', ''),
(30, 'Account', 1, '2017-11-21 17:28:17', ''),
(31, 'What can you do with 1GB data?', 1, '2017-11-22 09:40:48', ''),
(32, 'Refer Friends', 1, '2017-11-22 09:56:43', '');

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_labels`
--

CREATE TABLE `system_labels` (
  `label_id` int(11) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `window_id` tinyint(11) UNSIGNED NOT NULL,
  `access_key_android` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `access_key_ios` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `translatable` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_labels`
--

INSERT INTO `system_labels` (`label_id`, `label`, `window_id`, `access_key_android`, `access_key_ios`, `translatable`, `created_at`, `updated_at`) VALUES
(1, 'Flexiroam X', 1, 'app_name', NULL, 1, '2017-11-16 10:34:11', '2017-11-16 10:34:11'),
(2, 'frx', 1, 'app_scheme', NULL, 0, '2017-11-16 10:34:11', '2017-11-16 10:34:11'),
(3, 'magic', 1, 'app_magic_host', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(4, 'stripe', 1, 'app_stripe_host', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(5, '1352970271383331', 1, 'facebook_app_id', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(6, 'fb1352970271383331', 1, 'fb_login_protocol_scheme', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(7, 'USD', 1, 'default_name_currency', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(8, 'US$%s', 1, 'default_sign_currency', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(9, '%s%%', 1, 'default_sign_percentage', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(10, '1', 1, 'numeric_1', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(11, '2', 1, 'numeric_2', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(12, '3', 1, 'numeric_3', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(13, '4', 1, 'numeric_4', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(14, '5', 1, 'numeric_5', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(15, '6', 1, 'numeric_6', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(16, '7', 1, 'numeric_7', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(17, '8', 1, 'numeric_8', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(18, '9', 1, 'numeric_9', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(19, '0', 1, 'numeric_0', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(20, '#', 1, 'numeric_hash', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(21, '*', 1, 'numeric_asterisk', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(22, 'Flexiroam X Logo', 1, 'cd_frx_logo', NULL, 0, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(23, 'SIGN UP / LOGIN', 24, 'login', 'intro_page_login_btn_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(24, 'What is Flexiroam X?', 24, 'slide_1_title', 'slide_1_title ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(25, 'Stick the X microchip on your sim card to get data when you travel.', 1, 'slide_1_desc', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(26, 'Unlock Free Data', 24, 'slide_2_title', 'slide_2_title ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(27, 'Refer friends to get free data for every friend who joins!', 24, 'slide_2_desc', 'slide_2_desc ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(28, 'Roam in over 100 countries', 24, 'slide_3_title', 'slide_3_title ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(29, 'With our 580 telco partners in the world', 24, 'slide_3_desc', 'slide_3_desc ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(30, 'Explore & Discover', 1, 'slide_4_title', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(31, 'Find latest travel deals & promotions', 1, 'slide_4_desc', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(32, 'Welcome!', 1, 'about_slide1_title', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(33, 'Apply the X-Microchip just once. No more wasting time buying a new SIM every time you travel', 1, 'about_slide1_desc', 'welcome_1_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(34, 'Switch between your local SIM and the Flexiroam X network easily', 1, 'about_slide2_desc', 'welcome_2_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(35, 'Roam in over 100 countries anytime anywhere with Flexiroam X', 1, 'about_slide3_desc', 'welcome_3_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(36, 'Add Card', 1, 'payment_add_card', 'add_card_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(37, 'Save', 1, 'payment_edit_save', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(38, '❮  Payment Method', 1, 'payment_payment_method', NULL, 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(39, 'We Accept', 1, 'payment_we_accept', 'we_accept_text ', 1, '2017-11-16 10:34:12', '2017-11-16 10:34:12'),
(40, 'Please begin by entering your card number above and follow the steps. We will never charge you without your permission.', 1, 'payment_cc_message', 'enter_card_msg_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(41, 'Card Number', 1, 'payment_card_number', 'card_number_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(42, 'MM', 1, 'payment_hint_mm', NULL, 0, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(43, 'YY', 1, 'payment_hint_yy', NULL, 0, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(44, 'CVV', 1, 'payment_hint_cvv', NULL, 0, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(45, 'Select Country', 1, 'payment_select_country', 'shipping_country_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(46, 'Unable to log in with Google.\\nPlease try again later.', 1, 'error_log_in_google', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(47, 'Unable to log in with Facebook because you have not verified your Facebook email.', 1, 'error_log_in_facebook', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(48, 'Unable to log in with Facebook because you have not verified your Facebook email.', 1, 'error_log_in_facebook_no_email', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(49, 'This field is required', 1, 'error_name', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(50, 'This field is required. Put - if not applicable.', 1, 'error_name_na', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(51, 'Please enter a valid mobile number', 1, 'error_pattern_mobile', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(52, 'Please enter a valid email', 1, 'error_pattern_email', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(53, 'Unable to add/edit card.\\nPlease try again later.', 1, 'error_add_edit_card', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(54, 'Unable to apply promo code.\\nPlease try again later.', 1, 'error_apply_promo_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(55, 'Unable to apply referral code.\\nPlease try again later.', 1, 'error_apply_referral_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(56, 'Unable to process your order at the moment.\\nPlease try again later.', 1, 'error_membership_checkout', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(57, 'Unable to skip shipment.\\nPlease try again later.', 1, 'error_apply_shipping_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(58, 'Please enter a valid shipping code.', 1, 'error_invalid_shipping_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(59, 'Unable to apply discount code.\\nPlease try again later.', 1, 'error_apply_discount_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(60, 'Please enter a valid discount code.', 1, 'error_invalid_discount_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(61, 'Unable to remove discount code.\\nPlease try again later.', 1, 'error_remove_discount_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(62, 'Unable to load payment method.\\nPlease try again later.', 1, 'error_retrieve_saved_card', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(63, 'Unable to process your payment.\\nPlease try again later.', 1, 'error_checkout_pay', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(64, 'Unable to retrieve products.\\nPlease try again later.', 1, 'error_select_xtra_data', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(65, 'Unable to retrieve products.\\nPlease try again later.', 1, 'error_select_starter_pack', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(66, 'An unexpected error has occurred.\\nPlease try again later.', 1, 'error_intent_extra', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(67, 'Highlights of %s', 1, 'country_details_highlights', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(68, 'Referrals | ', 1, 'fragment_account_tvReferrals', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(69, 'Global Balance | ', 1, 'fragment_account_databal', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(70, 'GET', 1, 'fragment_account_getMembership', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(71, 'Refer Friends', 30, 'fragment_account_refer_friends', 'refer_friends_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(72, 'Apply Referral Code', 1, 'fragment_account_apply_ref_code', NULL, 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(73, 'Apply Promo Code', 30, 'fragment_account_promotions', 'apply_promo_code_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(74, 'Payment Method', 30, 'fragment_account_payment_method', 'payment_method_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(75, 'Transactions', 30, 'fragment_account_transactions', 'transactions_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(76, 'Guide', 28, 'fragment_account_guide', 'guide_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(77, 'Support', 30, 'fragment_account_support', 'support_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(78, 'Change Password', 1, 'fragment_account_changepass', 'change_pwd_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(79, 'About', 30, 'fragment_account_about', 'about_text ', 1, '2017-11-16 10:34:13', '2017-11-16 10:34:13'),
(80, 'Log Out', 30, 'fragment_account_log_out', 'log_out_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(81, 'Global Plan Valid Til', 1, 'fragment_account_valid_till', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(82, 'No Global Data Plan', 1, 'fragment_account_membership_plan_status', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(83, 'Plan Renewal', 1, 'fragment_account_plan_renewal', 'plan_renewal_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(84, 'Language', 1, 'fragment_account_language', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(85, 'Currently can\\\'t turn on/off membership subscription. Please try again later.', 1, 'fragment_account_error_cant_toggle_membership_subscription', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(86, 'Help Center', 1, 'fragment_account_help_center', NULL, 0, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(87, 'Travel Inspiration by TripAdvisor', 27, 'fragment_coverage_travel_inspiration', 'travel_inspiration_tripadvisor_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(88, 'Version %s', 1, 'activity_about_version', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(89, 'Rate us on App Store', 1, 'activity_about_rate_us', 'rate_us_on_app_store_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(90, 'Visit Flexiroam.com', 1, 'activity_about_visit_website', 'visit_flexiroam_com_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(91, 'Terms and Conditions', 1, 'activity_about_terms', 'terms_conditions_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(92, '❮  About', 1, 'activity_about_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(93, 'Flexiroam X', 1, 'activity_about_appname', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(94, 'Avoid huge roaming fees when you\\\'re overseas.', 1, 'activity_about_avoid', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(95, 'Flexiroam is the latest data roaming solution for you to get data when you travel.', 1, 'activity_about_solution', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(96, 'Order an X Starter Pack with a free X microchip to start roaming in over 100 countries.', 1, 'activity_about_order', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(97, 'Have a promo code?\\nEnter the code below.', 1, 'activity_apply_promo_code_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(98, 'ENTER PROMO CODE', 1, 'activity_apply_promo_code_enter', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(99, 'Apply Promo', 1, 'activity_apply_promo_code_btn', 'apply_promo_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(100, '❮  Promotions', 1, 'activity_apply_promo_code_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(101, '❮  Apply Referral Code', 1, 'activity_apply_referral_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(102, 'ENTER REFERRAL CODE', 1, 'activity_apply_referral_enter', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(103, 'Apply Referral', 1, 'activity_apply_referral_btnApply', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(104, 'Have a promo code?\\nEnter the code below.', 1, 'activity_apply_referral_code_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(105, '❮  Troubleshooting', 1, 'activity_configure_apn_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(106, 'Configured APN Settings?', 1, 'activity_configure_apn_setting', 'configured_apn_settings_title_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(107, 'Switch to Flexiroam X before doing this step!', 1, 'activity_configure_apn_switch', 'configured_apn_settings_step0_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(108, 'Step 1', 1, 'activity_configure_apn_step_one', 'step1_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(109, 'Go to your phone Settings > Mobile Networks / Cellular Networks > Access Point Names', 1, 'activity_configure_apn_step_one_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(110, 'Step 2', 1, 'activity_configure_apn_step_two', 'step2_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(111, 'Create / Add new APN', 1, 'activity_configure_apn_step_two_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(112, 'Step 3', 1, 'activity_configure_apn_step_three', 'step3_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(113, 'Type in flexiroam for Name and APN > Save', 1, 'activity_configure_apn_step_three_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(114, 'Step 4', 1, 'activity_configure_apn_step_four', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(115, 'Select flexiroam APN to turn it on', 1, 'activity_configure_apn_step_four_details', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(116, '❮  Troubleshooting', 1, 'activity_connect_partner_network_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(117, 'Connected to our partner network?', 1, 'activity_connect_partner_network_connected', 'connected_to_partner_network_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(118, 'Please check our coverage to find our partner network in your destination.', 1, 'activity_connect_partner_network_coverage', 'connected_to_partner_network_1_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(119, 'Check Coverage', 1, 'activity_connect_partner_network_btnCheckCoverage', 'check_coverage_text ', 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(120, '❮  Coverage', 1, 'activity_country_details_btnBack', NULL, 1, '2017-11-16 10:34:14', '2017-11-16 10:34:14'),
(121, 'Country name', 1, 'activity_country_details_name', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(122, 'Highlights of ..', 1, 'activity_country_details_highlights', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(123, 'In partnership with TripAdvisor', 1, 'activity_country_details_tripadvisor', 'in_partnership_with_tripadvisor_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(124, 'DATA', 1, 'activity_data_usage_examples_data', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(125, '3.0GB', 1, 'activity_data_usage_examples_gb', NULL, 0, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(126, '* Approximate data usage examples\\nshown above, your actual usage may differ.', 31, 'activity_data_usage_examples_approximate', '', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(127, '❮  Data Usage Examples', 1, 'activity_data_usage_examples_btnBack', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(128, '❮  Get Starter Pack', 1, 'activity_get_starter_pack_select_btnBack', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(129, 'Proceed', 1, 'activity_get_starter_pack_select_btnProceed', 'proceed_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(130, 'Add Shipping Address', 1, 'activity_get_starter_pack_shipping_add', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(131, 'Apply Skip Shipment Code', 1, 'activity_get_starter_pack_shipping_code', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(132, 'Enter code', 1, 'activity_get_starter_pack_shipping_code_enter', 'enter_code_discount_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(133, 'Error', 1, 'activity_get_starter_pack_shipping_code_error', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(134, 'US$--.--', 1, 'activity_get_starter_pack_shipping_item_price', NULL, 0, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(135, 'Shipping', 1, 'activity_get_starter_pack_shipping_shipping', 'shipping_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(136, 'Apply Code', 1, 'activity_get_starter_pack_shipping_btnApplyCode', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(137, 'Shipping not required.', 1, 'activity_get_starter_pack_shipping_not_required', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(138, 'Name', 1, 'activity_get_starter_pack_shipping_etName', 'shipping_name_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(139, 'Address Line 1', 1, 'activity_get_starter_pack_shipping_etAddress1', 'shipping_address_1_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(140, 'Address Line 2', 1, 'activity_get_starter_pack_shipping_etAddress2', 'shipping_address_2_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(141, 'City', 1, 'activity_get_starter_pack_shipping_etCity', 'shippng_city_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(142, 'State', 1, 'activity_get_starter_pack_shipping_etState', 'shipping_state_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(143, 'Post Code', 1, 'activity_get_starter_pack_shipping_etPostCode', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(144, 'Select country:', 1, 'activity_get_starter_pack_shipping_select_country', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(145, 'Mobile Number', 1, 'activity_get_starter_pack_shipping_etMobileNumber', 'shipping_mobile_number_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(146, 'Next', 1, 'activity_get_starter_pack_shipping_btnNext', 'next_date_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(147, '❮  Order Starter Pack', 1, 'activity_get_starter_pack_shipping_btnBack', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(148, 'Note: We do not ship to P.O. Boxes.\\nEnter address in English.', 1, 'activity_get_starter_pack_shipping_note', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(149, '❮  Update your plan', 1, 'activity_get_xtra_data_select_btnBack', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(150, 'Stick microchip', 1, 'activity_guide_stick_microchip', 'stick_mircochip_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(151, 'How to attach the microchip to your SIM card', 1, 'activity_guide_stick_microchip_details', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(152, 'Switch to Flexiroam X', 1, 'activity_guide_switchsim', 'switch_to_flexiroamx_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(153, 'When you travel', 1, 'activity_guide_switchSim_details', 'when_you_travel_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(154, '2 mins', 1, 'activity_guide_stick_microchip_mins', 'two_minute_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(155, '1 min', 1, 'activity_guide_switchSim_mins', 'one_minute_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(156, '❮  Guide', 1, 'activity_guide_btnBack', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(157, 'First-time setup', 1, 'activity_guide_setup_first_time', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(158, 'Configure your APN settings', 1, 'activity_guide_setup_configure', 'firsttime_setup_apn_guide_text ', 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(159, '2 mins', 1, 'activity_guide_setup_mins', NULL, 1, '2017-11-16 10:34:15', '2017-11-16 10:34:15'),
(160, 'When you return home', 1, 'activity_guide_switchsim_return', 'when_you_home_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(161, 'Switch back to Home SIM', 1, 'activity_guide_switchsim_home', 'when_you_home_guide_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(162, '❮  Help Center', 1, 'activity_help_center_btnBack', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(163, 'FAQ', 1, 'activity_help_center_faq', 'faq_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(164, 'Support', 1, 'activity_help_center_support', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(165, 'Configure APN Guide', 1, 'activity_help_center_configure', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(166, 'Terms and Conditions', 1, 'activity_help_center_terms', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(167, 'Login or Sign Up', 1, 'activity_login_login', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(168, 'By logging in or signing up, you agree to Flexiroam\\\'s', 1, 'activity_login_agree', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(169, 'Terms of Service', 1, 'activity_login_tos', NULL, 0, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(170, ' and ', 1, 'activity_login_and', NULL, 0, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(171, 'Privacy Policy', 1, 'activity_login_policy', NULL, 0, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(172, 'Where are you from?', 1, 'activity_login_country_question', 'where_are_you_from_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(173, 'Continue', 25, 'activity_login_country_btnContinue', 'continue_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(174, 'Login / Sign Up with Email', 25, 'activity_login_email_login', 'login_signup_email_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(175, 'Continue', 1, 'activity_login_email_btnLoginContinue', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(176, 'By logging in or signing up, you agree to Flexiroam\\\'s Terms of Service and Privacy Policy', 1, 'activity_login_email_agree', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(177, 'Email', 25, 'activity_login_email_hint', 'email_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(178, 'Log in With Mobile No.', 1, 'activity_login_mobile_login', 'login_with_mobile_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(179, 'Forgot password?', 1, 'activity_login_mobile_forgot', 'forgot_password_question_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(180, 'Log In', 1, 'activity_login_mobile_btnContinue', 'login_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(181, 'Forgot Password', 1, 'activity_login_mobile_forgot_pwd_title', 'forgot_password_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(182, 'REQUEST RECOVERY SMS', 1, 'activity_login_mobile_forgot_pwd_btnContinue', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(183, 'Can we have your name?', 1, 'activity_login_name_question', 'can_have_name_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(184, 'Continue', 1, 'activity_login_name_btnContinue', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(185, 'Set Your Password', 1, 'activity_reset_password', 'set_pwd_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(186, '❮  Notifications', 1, 'activity_notifications_btnBack', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(187, 'Welcome', 1, 'activity_onboarding_welcome', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(188, 'Here\\\'s 100MB\\nto get you started', 1, 'activity_onboarding_started', NULL, 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(189, 'OK', 1, 'activity_onboarding_btnOK', 'ok_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(190, 'Your Card', 1, 'activity_order_payment_card', 'your_card_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(191, 'Total', 1, 'activity_order_payment_total', 'total_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(192, '$0.00', 1, 'activity_order_payment_total_price', NULL, 0, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(193, 'Edit', 1, 'activity_order_payment_btnYourCard', 'edit_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(194, 'Back', 1, 'activity_order_payment_btnNewCardBack', 'back_text ', 1, '2017-11-16 10:34:16', '2017-11-16 10:34:16'),
(195, 'Confirm and Pay', 1, 'activity_order_payment_btnNext', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(196, '❮  Payment', 1, 'activity_order_payment_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(197, '❮  Payment Method', 1, 'activity_payment_method_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(198, 'Your Card(s)', 1, 'activity_payment_method_yourcard', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(199, 'Edit', 1, 'activity_payment_method_btnEdit', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(200, '1GB Free Data Challenge', 1, 'activity_refer_friends_24_title', '1gb_free_data_challenge_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(201, 'Refer 5 friends to sign up to unlock 1GB free! Your friend gets 100MB free too', 1, 'activity_refer_friends_24_details', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(202, 'Time left to unlock', 1, 'activity_refer_friends_24_time_left_to_unlock', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(203, 'friend(s) signed up', 1, 'activity_refer_friends_24_friends_signed_up', 'friend_sign_up_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(204, 'Refer friends', 1, 'activity_refer_friends_24_btnReferFriends', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(205, 'or copy and paste your link anywhere', 32, 'activity_refer_friends_24_copypaste', 'copy_paste_link_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(206, '❮  Get Free Data', 1, 'activity_refer_friends_24_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(207, '0', 1, 'activity_refer_friends_24_number', NULL, 0, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(208, 'Claim 400MB in --:--:--', 1, 'activity_refer_friends_24_claim', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(209, 'Claim 400MB Free Data', 1, 'activity_refer_friends_24_tvBtnTitle', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(210, 'Tip: Continue to earn 100MB free data for each friend who downloads and signs up.', 1, 'activity_refer_friends_24_tip', 'continue_to_earn_tip_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(211, 'roam.my/r/KASDC8LKM0', 1, 'activity_refer_friends_24_referral_link', NULL, 0, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(212, 'COPY', 1, 'activity_refer_friends_24_btnCopy', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(213, '\"--:--:--', 1, 'activity_refer_friends_24_time_remaining', NULL, 0, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(214, 'Refer friends to sign up for %s data free each!', 32, 'activity_refer_friends_normal_refer', '', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(215, 'Your friend gets %s free too!', 32, 'activity_refer_friends_normal_description', '', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(216, 'Refer friends', 1, 'activity_refer_friends_normal_refer_friends', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(217, 'or copy and paste your link anywhere', 1, 'activity_refer_friends_normal_copy', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(218, 'roam.my/r/KASDC8LKM0', 1, 'activity_refer_friends_normal_referral_link', NULL, 0, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(219, 'COPY', 1, 'activity_refer_friends_normal_btnCopy', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(220, 'View Referral History', 32, 'activity_refer_friends_normal_btnReferralHistory', 'view_referral_history_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(221, '❮  Refer Friends', 1, 'activity_refer_friends_normal_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(222, 'FREE DATA!', 1, 'activity_referral_title', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(223, 'Just refer friends to download the app for 100mb each!', 1, 'activity_referral_details', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(224, 'Share Referral Link', 1, 'activity_referral_share_link', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(225, 'You and your friend will both receive 100mb each when they download and sign up with your referral link.', 1, 'activity_referral_details_two', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(226, 'SKIP', 1, 'activity_referral_skip', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(227, 'COPY', 1, 'activity_referral_copy', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(228, 'Total Free Data Earned From Referrals', 1, 'activity_referral_history_total', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(229, '0MB', 1, 'activity_referral_history_total_data', NULL, 0, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(230, '❮  Referral History', 1, 'activity_referral_history_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(231, 'Once you\\\'ve received the starter pack', 1, 'activity_scanner_onceyouvereceived', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(232, 'Scan Code to Link Starter Pack', 1, 'activity_scanner_btnScan', 'scan_code_link_starter_pack_text ', 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(233, '❮  Link Starter Pack', 1, 'activity_scanner_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(234, '❮  Troubleshooting', 1, 'activity_signal_strength_btnBack', NULL, 1, '2017-11-16 10:34:17', '2017-11-16 10:34:17'),
(235, 'Do you have good signal strength?', 1, 'activity_signal_strength_good_signal', 'do_you_have_good_signal_strength_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(236, 'Ensure that you have good signal strength.', 1, 'activity_signal_strength_ensure', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(237, 'Staying indoors or underground quite often disrupts your mobile network signal.', 1, 'activity_signal_strength_stay', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(238, '❮  Support', 1, 'activity_support_btnBack', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(239, 'Let us know', 1, 'activity_support_letusknow', 'let_us_know_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(240, 'Please describe your issue', 1, 'activity_support_hint', 'please_describe_your_issue_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(241, 'Tap to attach image (optional)', 1, 'activity_support_taptoattachimage', 'tap_attach_image_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(242, 'Send email to support team', 1, 'activity_support_btnSubmit', 'send_email_to_support_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(243, 'or', 31, 'activity_support_or', 'or_text ', 0, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(244, 'Alternatively, you can reach to our support team via Whatsapp', 1, 'activity_support_alternate', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(245, 'WhatsApp +6019 291 2692', 1, 'activity_support_btnContact', NULL, 0, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(246, '❮  Troubleshooting', 1, 'activity_supported_country_btnBack', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(247, 'Are you in a supported country?', 1, 'activity_supported_country_question', 'are_you_in_supported_country_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(248, 'Please check our coverage to find our supported countries.', 1, 'activity_supported_country_check', 'connected_to_partner_network_2_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(249, 'Check Coverage', 1, 'activity_supported_country_btnCheckCoverage', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(250, '❮  Troubleshooting', 1, 'activity_switch_network_btnBack', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(251, 'Switch to Flexiroam X', 1, 'activity_switch_network_switch', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(252, 'Step 1', 1, 'activity_switch_network_step_one', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(253, 'First, check if you have switched to Flexiroam X in the SIM toolkit.', 1, 'activity_switch_network_step_one_a', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(254, 'Click to go to SIM toolkit', 1, 'activity_switch_network_step_one_b', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(255, 'If the button above does not work, find the SIM toolkit in your app drawer.', 1, 'activity_switch_network_step_one_c', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(256, 'Step 2', 1, 'activity_switch_network_step_two', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(257, 'Tap on FLEXIROAM X-KIT > Switch SIM > Flexiroam X', 1, 'activity_switch_network_step_two_detail', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(258, 'Step 3', 1, 'activity_switch_network_step_three', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(259, 'Restart your phone to apply the changes.', 1, 'activity_switch_network_step_three_detail', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(260, '❮  Troubleshooting', 1, 'activity_switch_off_wifi_btnBack', NULL, 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(261, 'Have you switched off Wi-Fi?', 1, 'activity_switch_off_wifi_question', 'have_switched_off_wifi_title_text ', 1, '2017-11-16 10:34:18', '2017-11-16 10:34:18'),
(262, 'Turn off Wi-Fi to access data via Flexiroam X mobile data instead of Wi-Fi.', 1, 'activity_switch_off_wifi_turn_off', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(263, 'We won\\\'t be able to indicate if you\\\'re connected to our networks if your Wi-Fi is turned on and connected.', 1, 'activity_switch_off_wifi_connected', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(264, '❮  Terms and Conditions', 1, 'activity_terms_btnBack', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(265, 'Order Summary', 1, 'activity_get_starter_pack_summary_title', 'order_summary_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(266, 'Shipping', 1, 'activity_get_starter_pack_summary_shipping_title', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(267, 'No code applied', 1, 'activity_get_starter_pack_summary_shipping_code', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(268, 'to %s', 1, 'activity_get_starter_pack_summary_shipping_to', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(269, 'Shipping not required', 1, 'activity_get_starter_pack_summary_shipping_code_applied', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(270, 'Address', 1, 'activity_get_starter_pack_summary_address_title', 'address_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(271, 'Edit', 1, 'activity_get_starter_pack_summary_address_edit', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(272, 'Subtotal', 1, 'activity_get_starter_pack_summary_subtotal_title', 'subtotal_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(273, 'Discount', 1, 'activity_get_starter_pack_summary_discount_title', 'discount_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(274, 'Apply Discount', 1, 'activity_get_starter_pack_summary_btnApplyDiscount', 'apply_discount_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(275, 'Remove', 1, 'activity_get_starter_pack_summary_btnRemoveDiscount', 'remove_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(276, 'Total', 1, 'activity_get_starter_pack_summary_total_title', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(277, 'Confirm Order', 1, 'activity_get_starter_pack_summary_btnConfirmOrder', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(278, '❮  Order Summary', 1, 'activity_get_starter_pack_summary_btnBack', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(279, 'Track Order', 1, 'activity_track_order_title', 'track_order_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(280, 'Shipping and Order status', 1, 'activity_track_order_details', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(281, 'Invoice No.:', 1, 'activity_track_order_invoice_no', 'invoice_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(282, 'Tracking Code:', 1, 'activity_track_order_trackingCodeTitle', 'tracking_code_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(283, 'Shipment Status:', 1, 'activity_track_order_trackingStatusTitle', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(284, 'Check status', 1, 'activity_track_order_btnCheckStatus', 'check_status_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(285, '❮  Track Order', 1, 'activity_track_order_btnBack', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(286, 'Address:', 1, 'activity_track_order_addressTitle', 'tracking_address_text ', 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(287, '❮  Transactions', 1, 'activity_transactions_btnBack', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(288, '❮  Troubleshooting', 1, 'activity_troubleshooting_btnBack', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(289, 'If you\\\'re unable to connect to a network,\\nplease go through the checklist below:', 1, 'activity_troubleshooting_check_list', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(290, 'Switch to Flexiroam X', 1, 'activity_troubleshooting_switch', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(291, 'Configured APN settings?', 1, 'activity_troubleshooting_configure', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(292, 'Turned on Mobile Data and Data Roaming?', 1, 'activity_troubleshooting_data', NULL, 1, '2017-11-16 10:34:19', '2017-11-16 10:34:19'),
(293, 'Have you switched off Wi-Fi?', 1, 'activity_troubleshooting_off_wifi', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(294, 'Do you have good signal strength?', 1, 'activity_troubleshooting_signal', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(295, 'Connected to our partner network?', 1, 'activity_troubleshooting_connected', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(296, 'Are you in a supported country?', 1, 'activity_troubleshooting_supported', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(297, 'Check List', 1, 'activity_troubleshooting_check_list_title', 'checklist_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(298, '❮  Troubleshooting', 1, 'activity_turn_on_data_btnBack', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(299, 'Turned on Mobile Data and Data Roaming?', 1, 'activity_turn_on_data_question', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(300, 'Switch to Flexiroam X before doing this step!\"', 1, 'activity_turn_on_data_switch', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(301, 'Step 1', 1, 'activity_turn_on_data_step_one', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(302, 'Go to your phone Settings > Mobile Networks / Cellular Networks', 1, 'activity_turn_on_data_step_one_detail', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(303, 'Step 2', 1, 'activity_turn_on_data_step_two', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(304, 'Turn on Mobile Data and turn on Data Roaming', 1, 'activity_turn_on_data_step_two_detail', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(305, 'Next', 1, 'activity_order_payment_cardForm_action', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(306, 'Get %s data free!', 1, 'activity_unlock_connect_with_fb_get_data', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(307, 'Just connect with Facebook\\nto claim %s', 1, 'activity_unlock_connect_with_fb_connect', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(308, '❮  Unlock Free Data', 1, 'activity_unlock_connect_with_fb_btnBack', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(309, 'Please allow Facebook permissions\\nto unlock free data.', 1, 'activity_unlock_connect_with_fb_permission', NULL, 0, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(310, '❮  Guides', 1, 'activity_web_view_btnBack', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(311, 'Apply Discount Code', 1, 'dialog_apply_code_discount_title', 'apply_discount_code_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(312, 'Do you have a discount code?', 1, 'dialog_apply_code_discount_question', 'do_you_have_discount_code_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(313, 'Error', 1, 'dialog_apply_code_discount_error', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(314, 'CANCEL', 1, 'dialog_apply_code_discount_btnCancel', 'cancel_camera_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(315, 'APPLY', 1, 'dialog_apply_code_discount_btnApply', 'apply_code_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(316, 'CANCEL', 1, 'dialog_apply_code_shipping_btnCancel', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(317, 'APPLY', 1, 'dialog_apply_code_shipping_btnApply', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(318, 'Check your email', 25, 'dialog_check_email_title', 'check_email_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(319, 'and click the link in the email to login.', 25, 'dialog_check_email_click', 'click_link_login_email_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(320, 'Did not receive the email?', 25, 'dialog_check_email_not_received', 'did_not_receive_email_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(321, 'Resend Link', 25, 'dialog_check_email_resend', 'resend_link_text ', 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(322, 'Open Mail App', 1, 'dialog_check_email_btnOpenMail', NULL, 1, '2017-11-16 10:34:20', '2017-11-16 10:34:20'),
(323, 'We\\\'ve sent an SMS to', 1, 'dialog_check_sms_title', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(324, 'Click the link in the SMS to login.', 1, 'dialog_check_sms_click', 'click_link_sms_login_text ', 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(325, 'Did not receive the SMS?', 1, 'dialog_check_sms_not_received', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(326, 'Resend SMS', 1, 'dialog_check_sms_resend', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(327, 'Open SMS', 1, 'dialog_check_sms_btnOpenSMS', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(328, 'DATA ADDED!', 1, 'dialog_data_added_notice', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(329, 'Thanks for connecting to Facebook.', 1, 'dialog_data_added_thank', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(330, 'Free Data Earned', 1, 'dialog_data_added_earned', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(331, '0', 1, 'dialog_data_added_free_data_amount', NULL, 0, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(332, 'MB', 1, 'dialog_data_added_unit', NULL, 0, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(333, 'Your Balance', 1, 'dialog_data_added_your_balance', 'your_balance_text ', 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(334, '100', 1, 'dialog_data_added_new_data_amount', NULL, 0, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(335, 'MB', 1, 'dialog_data_added_new_unit', NULL, 0, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(336, 'OK', 1, 'dialog_data_added_btnOK', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(337, 'NEW VERSION AVAILABLE', 1, 'dialog_force_update_available', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(338, 'Please update to the latest version of Flexiroam X.', 1, 'dialog_force_update_please_update', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(339, 'OK', 1, 'dialog_force_update_btnOK', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(340, 'LEAVE PAGE', 1, 'dialog_leave_page_title', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(341, 'Are you sure you want\\nto leave this page?\\n\\nYour details will not be saved.', 1, 'dialog_leave_page_question', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(342, 'OK', 1, 'dialog_leave_page_btnOK', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(343, 'CANCEL', 1, 'dialog_leave_page_btnCancel', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(344, 'LOG OUT', 1, 'dialog_logout_confirm_title', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(345, 'Are you sure you want to log out?', 1, 'dialog_logout_confirm_question', 'log_out_msg_text ', 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(346, 'LOG OUT', 1, 'dialog_logout_confirm_btnOK', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(347, 'CANCEL', 1, 'dialog_logout_confirm_btnCancel', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(348, 'OK', 1, 'dialog_notification_btnNotificationOk', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(349, 'Thank you', 1, 'dialog_order_success_thank_you', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(350, 'for your purchase', 1, 'dialog_order_success_for_your_purchase', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(351, 'A copy of this invoice has been sent to your email.', 1, 'dialog_order_success_msg', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(352, 'Invoice No: ', 1, 'dialog_order_success_invoice_no', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(353, 'Address', 1, 'dialog_order_success_address', NULL, 1, '2017-11-16 10:34:21', '2017-11-16 10:34:21'),
(354, 'OK', 1, 'dialog_order_success_ok', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(355, 'OK', 1, 'dialog_refer_glossary_btnOk', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(356, 'To access and use Flexiroam X data in over 100 countries, you\\\'ll need to get a Starter Pack which contains the X microchip.', 1, 'dialog_status_whygetpack_access', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(357, 'Then just attach the X microchip onto your existing SIM card to start roaming.', 1, 'dialog_status_whygetpack_attach', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(358, 'OK', 1, 'dialog_status_whygetpack_btnOk', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(359, 'SUPPORT REQUEST SENT', 1, 'dialog_support_sent_title', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(360, 'OK', 1, 'dialog_support_sent_btnOk', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(361, 'Stop Plan Renewal?', 1, 'dialog_unsubscribe_confirm_title', 'stop_renewal_plan_title_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(362, 'If you proceed, the auto-renewal of your Flexiroam X data plan will be stopped.\\n\\nYou will lose remaining data upon expiry of the plan.', 1, 'dialog_unsubscribe_confirm_detail', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(363, 'PROCEED', 1, 'dialog_unsubscribe_confirm_proceed', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(364, 'CANCEL', 1, 'dialog_unsubscribe_confirm_cancel', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(365, 'Dial', 29, 'fragment_call_dial', 'dial_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(366, 'Contacts', 29, 'fragment_call_contacts', 'contacts_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(367, 'History', 29, 'fragment_call_history', 'history_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(368, 'Unable to access contacts due to no permission.', 1, 'fragment_contacts_unable', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(369, 'Search contacts', 1, 'fragment_contacts_search', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(370, 'Add your\\nCaller ID', 1, 'fragment_dial_btnAddCallerID', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(371, 'Rate: ', 29, 'fragment_dial_rate', 'call_rate_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(372, 'Select country', 1, 'fragment_dial_selectcountry', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(373, 'Currently unable to retrieve call rate information for selected country.', 1, 'fragment_dial_error_unable_to_retrieve', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(374, 'Please make sure that you have selected a country and input a valid phone number to call.', 1, 'fragment_dial_error_select_country', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(375, '350MB /min', 1, 'fragment_dial_rate_value', NULL, 0, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(376, 'PROCEED AT %s', 1, 'fragment_dial_proceed_at', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(377, 'You currently have no call history.\\nSwipe down to refresh.', 1, 'fragment_history_no', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(378, 'How can I use my free data?', 1, 'fragment_home_howtousefreedata', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(379, 'Not Connected', 28, 'fragment_status_not_connected', 'not_connected_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(380, 'CARRIER', 1, 'fragment_status_carrier', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(381, 'Country', 1, 'fragment_status_country', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(382, 'Switch to Flexiroam X', 1, 'fragment_status_switch_flexiroam', NULL, 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(383, 'Troubleshooting', 28, 'fragment_status_troubleshooting', 'troubleshooting_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(384, 'Contact Support', 28, 'fragment_status_contact_support', 'contact_support_text ', 1, '2017-11-16 10:34:22', '2017-11-16 10:34:22'),
(385, 'Switch back to Home SIM', 1, 'fragment_status_switch_home', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(386, 'Note: You\\\'re not reachable on your home SIM while switched to Flexiroam X.', 1, 'fragment_status_note', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23');
INSERT INTO `system_labels` (`label_id`, `label`, `window_id`, `access_key_android`, `access_key_ios`, `translatable`, `created_at`, `updated_at`) VALUES
(387, 'Get a starter pack to\\nuse your free data', 1, 'fragment_status_get_pack', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(388, 'How does it work?', 1, 'fragment_status_how', 'how_does_it_work_text ', 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(389, 'Get Starter Pack', 1, 'fragment_status_get_starter_pack', 'get_starter_pack_text ', 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(390, 'Already have a Starter Pack?', 1, 'fragment_status_already', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(391, 'Link Starter Pack', 1, 'fragment_status_link_starter_pack', 'link_starter_pack_text ', 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(392, 'Once you\\\'ve received the starter pack', 1, 'fragment_status_once_received', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(393, 'Switch SIM', 1, 'fragment_status_switch_sim', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(394, 'Configure APN', 1, 'fragment_status_configure', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(395, 'Pull down to refresh', 1, 'fragment_status_pull', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(396, 'No Answer', 1, 'list_item_call_history_no_answer', NULL, 1, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(397, 'name', 1, 'list_item_contact_name', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(398, 'number', 1, 'list_item_contact_number', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(399, 'type', 1, 'list_item_contact_type', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(400, 'Country name', 1, 'list_item_country_name', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(401, '4G', 1, 'list_item_country_4g', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(402, 'Title', 1, 'list_item_notification_title', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(403, 'Partner Name', 1, 'list_item_partner_name', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(404, '4G', 1, 'list_item_partner_4g', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(405, 'TextView', 1, 'list_item_product_id', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(406, '1GB Starter Pack', 1, 'list_item_product_name', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(407, 'Preloaded with 1GB | Valid for 1 year', 1, 'list_item_product_desc', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(408, '$29.99', 1, 'list_item_product_price', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(409, 'Anderson Cooper', 1, 'list_item_referral_history_name', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(410, '12 Dec 2016', 1, 'list_item_referral_history_date', NULL, 0, '2017-11-16 10:34:23', '2017-11-16 10:34:23'),
(411, '+0MB', 1, 'list_item_referral_history_data', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(412, '1GB Starter Pack', 1, 'list_item_transaction_title', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(413, '12 Dec 2016', 1, 'list_item_transaction_date', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(414, '$0.00', 1, 'list_item_transaction_price', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(415, 'Highlight Name', 1, 'list_item_tripadvisor_highlights_name', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(416, 'Location', 1, 'list_item_tripadvisor_highlights_location', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(417, 'Rank', 1, 'list_item_tripadvisor_highlights_rank', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(418, 'Rating', 1, 'list_item_tripadvisor_highlights_rating2', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(419, 'Type', 1, 'list_item_tripadvisor_highlights_type2', NULL, 0, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(420, 'Rating:', 1, 'list_item_tripadvisor_highlights_rating', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(421, 'Type:', 1, 'list_item_tripadvisor_highlights_type', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(422, 'No award', 1, 'list_item_tripadvisor_highlights_award', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(423, 'Unable to detect default web browser app. You may visit www.flexiroam.com for more information.', 1, 'error_undetected_browser', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(424, 'SELECT COUNTRY', 1, 'dialog_select_country_title', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(425, 'Please select the country of the number you are dialing to proceed.', 1, 'dialog_select_country_desc', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(426, 'PROCEED', 1, 'dialog_select_country_btnProceed', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(427, '❮  Add Your Caller ID', 1, 'activity_call_verify_mobile_btnBack', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(428, 'Mobile Number', 1, 'activity_hint_mobile', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(429, 'Password', 1, 'activity_hint_password', 'password_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(430, 'First Name', 1, 'activity_hint_first_name', 'first_name_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(431, 'Last Name', 1, 'activity_hint_last_name', 'last_name_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(432, 'FAQ', 1, 'activity_about_faq', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(433, 'New Password', 1, 'activity_resetpassword_hint_new_password', 'new_pwd_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(434, 'Confirm Password', 1, 'activity_resetpassword_hint_confirm_password', 'confirm_new_pwd_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(435, 'Your passwords do not match.', 1, 'activity_resetpassword_confirm_password_not_match_msg', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(436, 'Unable to reset password. Please try again.', 1, 'activity_resetpassword_system_error_msg', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(437, 'Please enter password', 1, 'activity_resetpassword_new_password_msg', 'please_enter_password_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(438, 'Please enter confirm password', 1, 'activity_resetpassword_confirm_password_msg', 'please_enter_confirm_password_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(439, 'Your password must be between 6\"-\"15 characters.', 1, 'activity_resetpassword_new_password_length_msg', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(440, 'What can you do\\nwith your starter plan?', 1, 'dialog_trial_plan_usage_title', NULL, 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(441, 'Need more data? Try the full plan', 1, 'dialog_trial_plan_usage_needmoredata', 'need_more_data_try_full_plan_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(442, 'Connecting…', 1, 'activity_call_connect_connecting', 'connecting_text ', 1, '2017-11-16 10:34:24', '2017-11-16 10:34:24'),
(443, 'One Time Set Up', 1, 'activity_call_verify_code_onetimesetup', 'one_time_set_up_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(444, 'You will receive a call in 1 minute.\\nPlease key in the number below when prompted.', 1, 'activity_call_verify_code_description', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(445, 'I did not receive the call', 1, 'activity_call_verify_code_nocall', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(446, 'Call Again', 1, 'activity_call_verify_code_callagain', 'call_again_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(447, 'Verify Mobile No.', 1, 'activity_call_verify_mobile_title', 'verify_mobile_no_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(448, 'to add your caller ID', 1, 'activity_call_verify_mobile_subtitle', 'to_add_caller_id_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(449, 'Mobile Number', 1, 'activity_call_verify_mobile_mobilenumber_hint', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(450, 'By clicking the button above, you will receive a\\n6-digit code and a phone call to verify your mobile.', 1, 'activity_call_verify_mobile_glossary', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(451, 'Select a plan below', 1, 'activity_get_xtra_data_select_upgrade_selectdataplanbelow', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(452, '❮  Upgrade to the full plan', 1, 'activity_get_xtra_data_select_upgrade_btnBack', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(453, 'Your trial is ending in - days.', 1, 'activity_get_xtra_data_select_upgrade_ending', NULL, 0, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(454, '❮  Set Plan Renewal', 1, 'activity_set_plan_renewal_btnBack', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(455, 'Set Plan Renewal', 1, 'activity_set_plan_renewal_btnSetPlanRenewal', 'set_plan_renewal_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(456, 'You will not be charged until your plan ends.', 1, 'activity_set_plan_renewal_glossary', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(457, 'Current plan ending in %1$s day(s) - %2$s', 1, 'activity_set_plan_renewal_warining', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(458, 'Current plan ending today', 1, 'activity_set_plan_renewal_warining_today', 'current_plan_end_today ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(459, 'Current plan valid till %1$s', 1, 'activity_set_plan_renewal_currentplanvalidtil', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(460, 'Verify your mobile number so that the call receiver can view your caller ID (mobile number)\\n\\nYou will receive a 6-digit code and a\\nphone call to verify your mobile', 1, 'dialog_verify_confirm_desc', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(461, 'Later', 1, 'dialog_verify_confirm_btnLater', 'later_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(462, 'WARNING', 1, 'dialog_warning_title', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(463, 'CONTINUE', 1, 'dialog_warning_continue', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(464, 'Welcome to the\\n1GB Free Data Challenge', 1, 'fragment_challenge_about_slide1_title', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(465, 'Refer 5 friends to sign up in 24 hours to unlock 1GB free! Each friend gets 100MB free too.', 1, 'fragment_challenge_about_slide1_desc', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(466, 'VIEW PROGRESS', 1, 'fragment_challenge_about_slide2', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(467, 'Check back on your progress from time to time to see if anyone had signed up.', 1, 'fragment_challenge_about_slide2_desc', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(468, 'UNLOCK FREE DATA', 1, 'fragment_challenge_about_slide3', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(469, 'Congratulations! You have unlocked 1GB of FREE DATA! Continue to refer even more friends to unlock even more FREE DATA!', 1, 'fragment_challenge_about_slide3_desc', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(470, 'LATER', 1, 'dialog_challenge_about_btnLater', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(471, 'I\\\'M IN', 1, 'dialog_challenge_about_btnImIn', NULL, 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(472, '<b>You\\\'re offline.</b> Your balance may not be updated.', 1, 'offline_snackbar', '', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(473, 'Your Starter Plan', 1, 'fragment_home_status_trial_title', 'your_starter_plan_text ', 1, '2017-11-16 10:34:25', '2017-11-16 10:34:25'),
(474, 'Travelling soon?', 1, 'fragment_home_status_travellingsoon_title', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(475, 'No Starter Pack', 1, 'fragment_home_status_travellingsoon_msg_nostarterpack', 'no_starter_pack_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(476, 'No Active Plan', 1, 'fragment_home_status_travellingsoon_msg_noactiveplan', 'no_active_plan_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(477, 'You are offline', 1, 'fragment_home_status_validity_youareoffline', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(478, 'Link starter pack', 1, 'fragment_home_status_validity_linkstarterpack', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(479, 'Get Starter Pack to Roam', 1, 'fragment_home_status_validity_getpacktoroam', 'get_starter_pack_to_roam_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(480, 'Check out our data plans', 1, 'fragment_home_status_validity_checkoutourdataplans', 'check_out_data_plans_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(481, 'Valid til', 1, 'fragment_home_status_validity_validtil', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(482, 'Unable to retrieve balance from service.', 1, 'fragment_home_toast_cantgetbalance', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(483, 'Upgrade to full plan', 1, 'fragment_home_validity_trial_upgradetofullplan', 'upgrade_full_plan_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(484, 'Your Starter Plan has ended', 1, 'fragment_home_status_trial_yourstarterplanhasended', 'your_starter_plan_ended_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(485, 'UPGRADE', 1, 'dialog_warning_btnUpgrade', 'upgrade_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(486, 'X microchip', 1, 'fragment_account_xmicrochip', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(487, 'Lifetime validity', 1, 'fragment_account_xmicrochip_validity', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(488, 'Please provide your e-mail below', 1, 'activity_login_get_email_title', 'please_provide_your_email_below ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(489, 'E-mail', 1, 'activity_hint_email', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(490, 'Sign Up with Mobile No.', 1, 'activity_signup_mobile_title', 'sign_up_with_mobile_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(491, 'SIGN UP', 1, 'activity_signup_mobile_btnContinue', 'sign_up_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(492, 'Confirm Password', 1, 'activity_hint_password_confirm', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(493, '❮  Support', 1, 'activity_support_select_btnBack', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(494, 'Self Support', 1, 'activity_support_select_selfsupport_title', 'self_support_title_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(495, 'Troubleshoot your issues now', 1, 'activity_support_select_selfsupport_desc', 'self_support_desc_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(496, 'Contact Support', 1, 'activity_support_select_contactsupport_title', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(497, 'Couldn\\\'t troubleshoot your issue? Raise a ticket to our support staff', 1, 'activity_support_select_contactsupport_desc', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(498, '❮  Verify e-mail', 1, 'activity_login_get_email_btnBack', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(499, '❮  Select Language', 1, 'activity_change_language_btnBack', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(500, 'Please make sure that your SIM card is inserted.', 1, 'status_make_sure_sim_inserted', 'make_sure_sim_insert_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(501, 'Unable to locate SIM toolkit, please follow alternate steps as in the guide.', 1, 'status_switch_sim_no_toolkit', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(502, 'CONNECTED', 1, 'status_connection_connected', 'connected_text ', 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(503, 'Not Connected', 1, 'status_connection_not_connected', NULL, 1, '2017-11-16 10:34:26', '2017-11-16 10:34:26'),
(504, 'Please allow Phone permission so that the app can function properly.', 1, 'error_permission_phone_allow', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(505, 'Choose your preferred language', 1, 'activity_change_language_title', 'choose_your_preferred_language_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(506, 'Referral Terms and Conditions', 1, 'activity_refer_friends_termsandconditions', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(507, 'Please select a product', 1, 'toast_please_select_product', 'select_plan_below_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(508, 'Home', 1, 'dash_tab_home', 'tab_1_title ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(509, 'Coverage', 1, 'dash_tab_coverage', 'tab_2_title ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(510, 'Status', 1, 'dash_tab_status', 'status_title_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(511, 'Call', 1, 'dash_tab_call', 'tab_4_title ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(512, 'Account', 1, 'dash_tab_account', 'tab_5_title ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(513, 'Loading...', 1, 'dialog_loading', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(514, 'New user?', 1, 'activity_login_mobile_new_user', 'new_user_signup_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(515, 'SIGN UP', 1, 'activity_login_mobile_signup', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(516, '* Terms and Conditions Apply', 1, 'activity_refer_friends_normal_tnc', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(517, 'Ending call...', 1, 'activity_call_connect_ending_call', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(518, 'Call disconnected', 1, 'activity_call_connect_call_disconnected', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(519, 'Can\\\'t reach services. Please try again later.', 1, 'error_cant_reach_services', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(520, 'In order to perform a call, the app requires permission to use the microphone. Please allow in the application settings.', 1, 'error_mic_permission', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(521, 'Micro SIM', 1, 'guide_microsim', 'micro_sim_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(522, 'Nano SIM (smallest)', 1, 'guide_nanosim', 'nano_sim_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(523, 'Which type of SIM card do you have?', 1, 'guide_what_kind_of_sim', 'which_type_sim_card_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(524, 'Stick Microchip', 1, 'guide_stick_microchip', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(525, 'Turned on Data Roaming?', 1, 'activity_troubleshooting_turned_on_data_roaming', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(526, 'Turned on Mobile Data?', 1, 'activity_troubleshooting_turned_on_mobile_data', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(527, 'Your plan is ending in %s day(s).\\nIf you wish to retain your data, <b>Set Plan Renewal ></b>-', 1, 'fragment_home_warning_plan_expiry', '', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(528, 'Your plan is ending today.\\nIf you wish to retain your data, <b>Set Plan Renewal ></b>', 1, 'fragment_home_warning_plan_expiry_today', '', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(529, 'Your plan is ending in %1$s day(s).\\nYour account is set to renew with %2$s', 1, 'fragment_home_warning_plan_expiry_subscription', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(530, 'Your plan is ending today.\\nYour account is set to renew with %s', 1, 'fragment_home_warning_plan_expiry_today_subscription', NULL, 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(531, 'Please add a payment method', 1, 'dialog_add_card_title', 'please_add_payment_method_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(532, 'In order to set plan renewal, you will need to a add a valid credit card.', 1, 'dialog_add_card_msg', 'need_valid_credit_card_text ', 1, '2017-11-16 10:34:27', '2017-11-16 10:34:27'),
(533, 'FAQ', 1, 'webview_faq_btnBack', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(534, '❮  Get Xtra Data', 1, 'activity_xtracheaphome_btnBack', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(535, '❮  %s Data Plans', 1, 'activity_get_short_trip_data_select_btnBack', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(536, 'FROM %s', 1, 'activity_get_short_trip_data_select_txtFrom', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(537, 'SET', 1, 'activity_get_short_trip_data_select_btnSet', 'set_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(538, 'Set arrival date', 1, 'activity_get_short_trip_data_select_tvFromDate', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(539, 'Loading available plans..', 1, 'indicator_loading_plans', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(540, 'FROM', 1, 'list_item_product_from', 'from_text_2 ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(541, 'Global Balance', 1, 'fragment_home_your_balance', 'global_balance_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(542, 'Your Balance', 1, 'fragment_home_cardstatuscountryplan_your_balance', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(543, 'ACTIVE', 1, 'fragment_home_cardstatuscp_tvstatuscpvalidtil', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(544, 'days left', 1, 'fragment_home_cardstatuscp_daysleft', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(545, 'GLOBAL DATA', 1, 'tab_global_data', 'global_data_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(546, 'LOCAL DATA', 1, 'tab_country_data', 'local_data_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(547, 'Search country', 27, 'search_country', 'search_country_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(548, 'Popular Countries', 1, 'popular_countries', 'popular_country_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(549, 'No plans available', 1, 'no_plans_available', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(550, 'Special Offers', 1, 'special_offers', 'special_offers_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(551, 'Unable to retrieve offers.\\nTap here to try again.', 1, 'unable_to_get_offers_tap_retry', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(552, 'plans available', 1, 'plans_available', 'plans_available_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(553, 'Date:', 1, 'txt_date', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(554, 'Get up to 50% off when you book 1-3 months ahead.', 1, 'activity_get_short_trip_data_select_tvInfo', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(555, 'BOOK NOW', 1, 'book_now', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(556, '❮  Plan History', 1, 'activity_planhistory_btnBack', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(557, 'Something went wrong while processing your payment, please check your email for verification before retrying payment. Thank you', 1, 'error_checkout_connection', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(558, 'Unable to establish connection. Please make sure you have internet connectivity. Thank you', 1, 'error_network_connection', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(559, 'Unable to detect default email app. Please find your email app and check for an email from Flexiroam.', 1, 'error_login_email_get_app', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(560, '❮  Notification', 1, 'activity_notification_detail_btnBack', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(561, 'Select Payment Method', 1, 'activity_payment_method_select', 'select_payment_method_text ', 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(562, 'Purchased: %s', 1, 'activity_transactions_adapter_purchase', NULL, 1, '2017-11-16 10:34:28', '2017-11-16 10:34:28'),
(563, 'DELETE ALL', 1, 'dialog_Delete_all_title', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(564, 'Are you sure you want\\nto Delete all messages?\\n\\nThis action cannot be reverted.', 1, 'dialog_Delete_all_question', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(565, 'DELETE', 1, 'dialog_Delete_all_btnOk', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(566, 'DELETE MESSAGE', 1, 'dialog_Delete_title', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(567, 'Are you sure you want\\nto Delete this message?\\n\\nThis action cannot be reverted.', 1, 'dialog_Delete_question', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(568, 'DELETE', 1, 'dialog_Delete_btnOk', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(569, 'CANCEL', 1, 'dialog_Delete_btCancel', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(570, 'Check Availability', 1, 'request_plan', 'check_availability_text ', 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(571, 'Back', 1, 'request_btn_back', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(572, 'failed to send request \\nPlease try again later. Thank you \\n\\nTap here to go back', 1, 'plan_request_failed', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(573, 'No plans available for %s at the moment. We will process your request and update you once it is available. Thank you!', 1, 'plan_request_notify', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(574, 'Traveling Soon? Check plan availability for %s', 1, 'no_plans_available_question', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(575, '❮  Plan Renewal Options', 1, 'plan_renewal_btnBack', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(576, 'Could not obtain renewal options, please try again later', 1, 'plan_renewal_options_error', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(577, 'No notification', 1, 'activity_no_notification_background_title', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(578, 'Pull down to refresh', 1, 'activity_no_notification_background_detail', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(579, 'or', 1, 'txt_OR', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(580, 'Key in the 20 digit code', 1, 'txt_key_in_xid', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(581, 'Click to Link Starter Pack', 1, 'txt_click_to_link_starter_pack', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(582, 'Show', 1, 'txt_show', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(583, 'Global Data Plans', 1, 'txt_plan_history_global', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(584, 'Local Data Plans', 1, 'txt_plan_history_country', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(585, 'Problem Persist ?', 1, 'txt_contact_support_question', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(586, 'Unable to connect, Please try troubleshooting or contact support', 1, 'msg_status_not_connected', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(587, 'Please turn off your WiFi to check connection status', 1, 'msg_status_wifi_on', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(588, 'Connecting... %d', 1, 'msg_status_countdown', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(589, 'Please wait!', 1, 'msg_wait', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(590, 'You\\\'re offline, Please ensure you have switched to Flexiroam X', 1, 'msg_status_offline', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(591, 'Your Flexiroam X isn\\\'t linked to this account, please sign in to the account linked to it to see it\\\'s status.', 1, 'msg_status_invalid_sim', NULL, 0, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(592, 'Press back again to exit app', 1, 'msg_back_to_exit', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(593, 'Try Again...', 1, 'msg_try_again', NULL, 1, '2017-11-16 10:34:29', '2017-11-16 10:34:29'),
(594, 'Login Link Expired', 1, 'msg_login_expired', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(595, 'Error verifying login token', 1, 'msg_token_error', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(596, 'Could not validate your e-mail address. Please try again', 1, 'msg_validate_email_error', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(597, 'Don\\\'t reset password now', 1, 'txt_reset_pass_login', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(598, 'Log Me In', 1, 'btn_reset_pass_login', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(599, 'Hot!', 1, 'txt_hot', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(600, 'Please turn on your Mobile Data to check connection status', 1, 'msg_status_mobile_data_off', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(601, 'Please turn on your Data Roaming to check connection status', 1, 'msg_status_data_roaming_off', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(602, 'Get Xtra Data', 1, 'cards_get_extra_data', 'get_xtra_data_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(603, 'Low Data Balance?', 26, 'cards_load_data_balance_question', 'low_data_balance_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(604, 'Low Data Balance? Get more data to use while traveling', 1, 'cards_load_data_balance_question2', 'low_data_balance_more_data_use_travelling_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(605, 'Get More Data', 1, 'cards_get_more_data', 'get_more_data_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(606, 'Data Usage Example', 1, 'cards_data_usage_example', 'data_usage_example_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(607, 'What can you do with your data?', 1, 'cards_data_usage_question', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(608, 'Check Now', 26, 'cards_check_now', 'check_now_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(609, 'Track your order', 1, 'cards_track_your_order', 'track_your_order_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(610, 'Shipping and order status', 1, 'cards_shipping_and_order_status', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(611, 'Check Status', 1, 'cards_check_status', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(612, '1GB Free Data', 1, 'cards_1gb_free_data', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(613, 'Refer 5 friends in 24 hours', 1, 'cards_refer_5_friends', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(614, 'Get Free Data', 26, 'cards_get_free_data', 'get_free_data_btn_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(615, 'Get Starter Pack', 1, 'cards_get_starter_pack', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(616, 'To start roaming in more than 100 countries', 1, 'cards_get_starter_pack_text', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(617, 'Buy Now', 1, 'cards_buy_now', 'buy_now_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(618, 'Start Roaming now', 1, 'cards_start_roaming', 'start_roaming_now_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(619, 'Every Starter pack comes with a free X microchip', 1, 'cards_free_x_chip_msg', 'starter_pack_come_with_microchip_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(620, 'Link Starter Pack', 1, 'cards_link_starter_pack', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(621, 'Received your Start Pack?', 1, 'cards_link_starter_pack_question', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(622, 'Upgrade to full plan', 1, 'cards_upgrade_plan', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(623, 'Enjoy full access when you upgrade to full plan', 1, 'cards_upgrade_plan_text', NULL, 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(624, 'How to Use?', 26, 'cards_guide', 'how_to_use_text ', 1, '2017-11-16 10:34:30', '2017-11-16 10:34:30'),
(625, 'Read the steps in the guide here', 1, 'cards_guide_text', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(626, 'Step by Step Guide', 26, 'cards_steps_by_step_guide', 'step_by_step_guide_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(627, '100MB when a friend signs up', 26, 'cards_100mb_on_signUp', 'when_friend_sign_up_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(628, 'Verify email to complete your profile', 1, 'cards_verify_email_text', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(629, 'Verify Email', 1, 'cards_verify_email', 'verify_email_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(630, 'Just connect to facebook to claim free data!', 1, 'cards_connect_to_fb', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(631, 'Special Offer', 1, 'cards_special_offer', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(632, 'Get data plan in the selected country at an irresistible price', 1, 'cards_special_offer_msg', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(633, 'Unable to change your language. Please try again', 1, 'error_change_language', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(634, '* Approximate data usage shown above, your actual usage may differ', 1, 'data_usage_message', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(635, 'instant messages \\n(text only)', 31, 'data_usage_ins_msg', '', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(636, 'emails \\n(send/receive)', 31, 'data_usage_email', '', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(637, 'photo upload on social media', 31, 'data_usage_photo', '', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(638, 'internet voice calls', 31, 'data_usage_voice_call', '', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(639, 'map navigation', 31, 'data_usage_map', 'map_navigation_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(640, 'web browsing', 31, 'data_usage_web', 'web_browsing_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(641, 'Upgrade Now', 1, 'data_usage_trial_bt', 'upgrade_now_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(642, '~ 50k', 1, 'data_usage_ins_mess_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(643, '~ 550', 1, 'data_usage_email_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(644, '~ 200', 1, 'data_usage_photo_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(645, '~ 30m', 1, 'data_usage_voice_call_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(646, '~ 1hr', 1, 'data_usage_web_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(647, '~ 5hrs', 1, 'data_usage_map_trial_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(648, '~ 250k', 1, 'data_usage_ins_mess_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(649, '~ 2.75k', 1, 'data_usage_email_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(650, '~ 1k', 1, 'data_usage_photo_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(651, '~ 150m', 1, 'data_usage_voice_call_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(652, '~ 5hr', 1, 'data_usage_web_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(653, '~ 25hrs', 1, 'data_usage_map_fiveHundredMb_val', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(654, 'What can you do with 1 Gb data?', 1, 'data_usage_oneGb_title', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(655, 'Get Starter Pack to start roaming', 1, 'data_usage_oneGb_getPack_msg', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(656, 'Get Starter Pack', 1, 'data_usage_oneGb_getPack_bt', NULL, 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(657, 'Need more data?', 1, 'data_usage_oneGb_xtra_msg', 'need_more_data_text ', 1, '2017-11-16 10:34:31', '2017-11-16 10:34:31'),
(658, 'Get Xtra Data', 1, 'data_usage_oneGb_xtra_bt', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(659, '~ 500k', 1, 'data_usage_ins_mess_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(660, '~ 5.5k', 1, 'data_usage_email_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(661, '~ 2k', 1, 'data_usage_photo_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(662, '~ 300m', 1, 'data_usage_voice_call_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(663, '~ 10hrs', 1, 'data_usage_web_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(664, '~ 50hrs', 1, 'data_usage_map_oneGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(665, '~ 1.5mil', 1, 'data_usage_ins_mess_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(666, '~ 16.5k', 1, 'data_usage_email_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(667, '~ 6k', 1, 'data_usage_photo_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(668, '~ 15hrs', 1, 'data_usage_voice_call_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(669, '~ 30hrs', 1, 'data_usage_web_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(670, '~ 150hrs', 1, 'data_usage_map_threeGb_val', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(671, 'Enable Permission', 1, 'btn_setPermission', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(672, 'Please enable Phone permission manually or email our support team at support@flexiroam.com or WhatsApp at +6019 291 2692 ', 1, 'error_phone_permission_request', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(673, 'Selected country prefix does not match prefix of contact selected. \\nPlease select the right country', 1, 'error_mismatch_country_prefix', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(674, 'Please select a country in order to proceed.', 1, 'error_select_country', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(675, 'Saved Cards', 1, 'tv_saved_cards', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(676, 'Other Payment Methods', 1, 'tv_other_payment', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(677, 'Credit/Debit Card', 1, 'tv_credit_debit_card', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(678, 'AliPay', 1, 'tv_alipay', NULL, 0, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(679, 'default', 1, 'tv_default', 'default_text ', 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(680, 'Set Default', 1, 'tv_set_default', 'set_default_text ', 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(681, 'Changing Language . . .', 1, 'txt_changing_language', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(682, 'Please select a payment method to proceed', 1, 'toast_please_select_payment_method', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(683, 'Invalid Card', 1, 'error_invalid_card', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(684, 'Failed to process payment, please try again later', 1, 'error_payment_failed', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(685, 'Failed to authorize card, please try again later', 1, 'error_authorize_card', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(686, 'Failed to retrieve response from server, please check your email for confirmation before retrying payment. Thank you', 1, 'error_payment_response', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(687, 'Verifying Card...', 1, 'msg_status_verifying_card', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(688, 'Initializing card authorization...', 1, 'msg_status_authorizing', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(689, 'Redirecting...', 1, 'msg_status_redirecting', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(690, 'Processing Payment...', 1, 'msg_status_processing_payment', NULL, 1, '2017-11-16 10:34:32', '2017-11-16 10:34:32'),
(691, 'Confirm Payment', 1, 'msg_confirm_payment_title', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(692, 'Do you want to continue ?', 1, 'msg_confirm_payment', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(693, 'Do you want to continue payment with this card %s?', 1, 'msg_confirm_payment_with_saved_card', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(694, 'Enter card details to continue', 1, 'msg_confirm_payment_with_card', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(695, 'Do you want to continue ? \\nYou will be redirected to a browser application to continue payment', 1, 'msg_confirm_payment_with_redirect', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(696, 'Pay', 1, 'label_pay', 'pay_text ', 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(697, 'Unable to add your e-mail. \\nPlease try again later.', 1, 'error_add_email', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(698, 'Unable to update your name. \\nPlease try again.', 1, 'error_update_name', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(699, 'Unable to update your country. \\nPlease try again.', 1, 'error_update_country', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(700, 'Sorry, this card requires manual authentication, hence can\\\'t be used for automated payments. \\nPlease save another card or contact support for more information. Thank you', 1, 'error_cant_save_threeD_card', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(701, 'DELETE CARD', 1, 'dialog_delete_card_title', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(702, 'Are you sure you want\\nto Delete this card?\\n\\nThis action cannot be reverted.', 1, 'dialog_delete_card_question', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(703, '* Default card would be used for auto-renewal charges if you have subscribed for an auto renewal', 1, 'msg_default_card', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(704, 'Confirm Save Card', 1, 'dialog_save_card_title', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(705, 'Do you want to save this card?', 1, 'dialog_save_card_question', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(706, 'Yes', 1, 'tv_yes', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(707, 'No', 1, 'tv_no', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(708, 'Please provide your e-mail below', 1, 'dialog_add_email_support_title', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(709, 'OK', 1, 'dialog_add_email_support_btnOK', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(710, 'CANCEL', 1, 'dialog_add_email_support_btnCancel', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(711, 'Enter email', 1, 'dialog_add_email_support_enter', NULL, 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(712, 'Invalid email', 1, 'dialog_add_email_support_error', 'invalid_email_title_text ', 1, '2017-11-16 10:34:33', '2017-11-16 10:34:33'),
(713, 'Stick X microchip on your sim card to get data when you travel', 24, '', 'slide_1_desc ', 1, '2017-11-16 11:47:36', '2017-11-16 11:47:36'),
(714, 'Select Language', 30, '', 'select_language_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(715, 'Referrals', 1, NULL, 'referrals_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(716, 'Balance', 1, NULL, 'balance_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(717, 'Sign Up or Log In', 1, NULL, 'signup_or_login_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(718, 'By logging in or signing up,', 1, NULL, 'login_tc_1_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(719, 'you agree to Flexiroam\'s', 1, NULL, 'login_tc_2_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(720, 'Terms of Service and Privacy Policy', 1, NULL, 'login_tc_3_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(721, 'Open Apple Mail App', 25, '', 'open_mail_app_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(722, 'Request SMS', 1, NULL, 'request_sms_text ', 1, '2017-11-16 11:47:37', '2017-11-16 11:47:37'),
(723, 'Please enter mobile number', 1, NULL, 'please_enter_mobile_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(724, 'Please select country', 1, NULL, 'please_select_country_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(725, 'We\'ve sent an SMS text to', 1, NULL, 'sent_sms_to_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(726, 'English', 1, NULL, 'english_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(727, '中文 (简体)', 1, NULL, 'chinese_simplified_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(728, 'Try Again!', 1, NULL, 'tryagain_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(729, 'Valid till', 26, '', 'valid_till_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(730, 'How to attach the micrchip to your SIM card', 1, NULL, 'stick_microchip_guide_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(731, 'First-time Setup APN', 1, NULL, 'firsttime_setup_apn_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(732, 'SIM Type Selection', 1, NULL, 'which_type_sim_Card_title_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(733, 'Refer Friends to sign up for', 1, NULL, 'refer_friends_title_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(734, 'Referral History', 1, NULL, 'referral_history_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(735, 'Have a promo code?', 1, NULL, 'have_a_promo_code_text ', 1, '2017-11-16 11:47:38', '2017-11-16 11:47:38'),
(736, 'Enter code to claim free data', 1, NULL, 'enter_code_to_claim_data_text ', 1, '2017-11-16 11:47:39', '2017-11-16 11:47:39'),
(737, 'Expiration Date', 1, NULL, 'expiration_date_text ', 1, '2017-11-16 11:47:39', '2017-11-16 11:47:39'),
(738, 'Confirm & Pay', 1, NULL, 'confirm_pay_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(739, 'Please enter code', 1, NULL, 'please_enter_code_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(740, 'Invalid code', 1, NULL, 'invalid_discount_code_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(741, 'What can you do with your starter plan?', 1, NULL, 'with_your_starter_plan_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(742, 'What can you do with 1GB data?', 31, '', 'with_1gb_data_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(743, 'GET XTRA DATA NOW', 1, NULL, 'get_xtra_data_now_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(744, 'data_usage_500mb', 1, NULL, 'data_usage_500mb_image ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(745, 'data_usage_1gb', 1, NULL, 'data_usage_1gb_image ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(746, 'data_usage_3gb', 1, NULL, 'data_usage_3gb_image ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(747, 'Order Starter Pack', 1, NULL, 'order_starter_pack_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(748, 'Note: We do not ship to P.O Boxes', 1, NULL, 'shipping_note_1_text ', 1, '2017-11-16 11:47:40', '2017-11-16 11:47:40'),
(749, 'Enter address in English.', 1, NULL, 'shipping_note_2_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(750, 'Postal Code', 1, NULL, 'shipping_postal_code_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(751, 'Please enter name', 1, NULL, 'please_enter_name_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(752, 'Please enter address', 1, NULL, 'please_enter_address_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(753, 'Please enter city', 1, NULL, 'please_enter_city_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(754, 'Please enter state', 1, NULL, 'please_enter_state_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(755, 'Please enter postal code', 1, NULL, 'please_enter_postal_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(756, 'Please enter mobile', 1, NULL, 'please_enter_mobile_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(757, 'Apply Shipping Code', 1, NULL, 'apply_shipping_code_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(758, 'Do you have a skip shipment code?', 1, NULL, 'do_you_have_shipping_code_text ', 1, '2017-11-16 11:47:41', '2017-11-16 11:47:41'),
(759, 'Set Renewal Plan', 1, NULL, 'set_renewal_plan_text ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(760, 'data_usage_app', 1, NULL, 'data_usage_app_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(761, 'data_usage_onegb_app', 1, NULL, 'data_usage_onegb_app_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(762, 'Once you\'ve received the starter pack', 1, NULL, 'once_you_received_starter_pack_text ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(763, 'Shipping & Order Status', 1, NULL, 'shipping_order_status_text ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(764, 'Add your Caller ID', 29, '', 'add_your_caller_id_text ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(765, 'Traveling Soon?', 1, NULL, 'traveling_soon_text ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(766, 'data_usage_banner', 1, NULL, 'data_usage_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(767, 'get_free_data_after_challenge_banner', 1, NULL, 'get_free_data_after_challenge_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(768, 'get_xtra_data_banner', 1, NULL, 'get_xtra_data_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(769, 'get_xtra_data_usage_banner', 1, NULL, 'get_xtra_data_usage_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(770, 'guide_banner', 1, NULL, 'guide_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(771, 'free_data_banner', 1, NULL, 'free_data_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(772, 'link_starter_pack_banner', 1, NULL, 'link_starter_pack_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(773, 'get_starter_pack_banner', 1, NULL, 'get_starter_pack_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(774, 'start_roaming_now_usage_banner', 1, NULL, 'start_roaming_now_usage_banner_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(775, 'upgrade_to_full_plan_card', 1, NULL, 'upgrade_to_full_plan_card_image ', 1, '2017-11-16 11:47:42', '2017-11-16 11:47:42'),
(776, 'upgrade_to_full_plan', 1, NULL, 'upgrade_to_full_plan_image ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(777, 'Partner List', 1, NULL, 'partner_list_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(778, '* Partner list is subject to change', 1, NULL, 'partner_list_subject_to_change_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43');
INSERT INTO `system_labels` (`label_id`, `label`, `window_id`, `access_key_android`, `access_key_ios`, `translatable`, `created_at`, `updated_at`) VALUES
(779, 'TripAdvisor traveler rating:', 1, NULL, 'tripadvisor_traveler_rating_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(780, 'Add your', 1, NULL, 'add_your_caller_id_1_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(781, 'Caller ID', 1, NULL, 'add_your_caller_id_2_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(782, 'get_free_data_banner', 1, NULL, 'get_free_data_banner_image ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(783, 'track_your_order_banner', 1, NULL, 'track_your_order_banner_image ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(784, 'Get a starter pack to use your free data', 1, NULL, 'get_starter_pack_to_use_free_data_text ', 1, '2017-11-16 11:47:43', '2017-11-16 11:47:43'),
(785, 'Once you receive your starter pack', 1, NULL, 'once_you_receive_starter_pack_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(786, 'Save Card', 1, NULL, 'save_card_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(787, 'Current plan valid till', 1, NULL, 'current_plan_valid_till_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(788, 'Data Plan Valid Til', 1, NULL, 'data_plan_valid_til_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(789, 'By clicking the button above, you will receive a 6-digit code and a phone call to verify your mobile.', 1, NULL, 'by_clicking_button_adove_caller_id_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(790, 'You will receive a call in 30 seconds. Please key in the number below when prompted.', 1, NULL, 'you_will_receive_call_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(791, 'Did not receive the call?', 1, NULL, 'did_not_receive_call_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(792, 'Verify', 1, NULL, 'verify_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(793, 'Add Caller ID', 1, NULL, 'verify_mobile_title_text ', 1, '2017-11-16 11:47:44', '2017-11-16 11:47:44'),
(794, 'Verify your mobile number so that the call receiver can view your caller ID (mobile number). \\n\\n You will receive a 6-digit code and a phone call to verify your mobile', 1, NULL, 'verify_mobile_desc_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(795, 'Success', 1, NULL, 'success_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(796, 'You have successfully added your Caller ID.', 1, NULL, 'you_have_succesfully_added_caller_id_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(797, 'Refer 5 friends to sign up to unlock 1GB free!', 1, NULL, 'refer_5_friends_to_sign_up_1_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(798, 'You friend gets 100MB free too', 1, NULL, 'refer_5_friends_to_sign_up_2_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(799, 'Time left', 1, NULL, 'time_left_to_unlock_1_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(800, 'to unlock', 1, NULL, 'time_left_to_unlock_2_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(801, 'or copy & paste your link anywhere', 1, NULL, 'or_copy_paste_your_link_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(802, 'Just connect with Facebook to claim free data!', 1, NULL, 'just_connect_fb_to_claim_data_text  ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(803, 'You’re offline. Your balance may not be updated.', 1, NULL, 'you_are_offline_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(804, 'Turned on Mobile Data & Data Roaming?', 1, NULL, 'turned_on_mobile_data_roaming_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(805, 'If you\'re unable to connect to a network,', 1, NULL, 'if_you_unable_connect_network ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(806, 'please go through the checklist below:', 1, NULL, 'please_go_checklist_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(807, 'If problems persist', 1, NULL, 'if_problems_persist_text ', 1, '2017-11-16 11:47:45', '2017-11-16 11:47:45'),
(808, 'First, check if you have switched to Flexiroam X in the SIM toolkit. \\n\\nGo to your phone Settings > Phone > SIM Application > Flexiroam X-kit', 1, NULL, 'switch_to_flexiroamx_step1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(809, 'Tap on Switch SIM > Select Flexiroam X > Accept', 1, NULL, 'switch_to_flexiroamx_step2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(810, 'Restart your phone', 1, NULL, 'switch_to_flexirmax_step3_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(811, 'Go to your phone Settings > Mobile Data or Cellular Data > Mobile Data Options > Mobile Data Networks', 1, NULL, 'configured_apn_settings_step1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(812, 'Under APN > type in \'flexiroam\' > go back', 1, NULL, 'configured_apn_settings_step2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(813, 'Go to your phone Settings > Mobile Data or Cellular Data > Mobile Data Options', 1, NULL, 'turned_on_data_roaming_step1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(814, 'Turn on mobile data', 1, NULL, 'turned_on_data_roaming_step2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(815, 'Tap Mobile Data Options > Turn on Data Roaming', 1, NULL, 'turned_on_data_roaming_step3_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(816, 'Turned on Mobile Data', 1, NULL, 'turned_on_data_roaming_title_1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(817, '& Data Roaming?', 1, NULL, 'turned_on_data_roaming_title_2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(818, 'Turn off Wi-Fi to access data via Flexiroam X mobile data instead of Wi-Fi.\\n\\nWe won\'t be able to indicate if you\'re connected to our networks if your Wi-Fi is turned on and connected.', 1, NULL, 'have_switched_off_wifi_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(819, 'Do you have good signal', 1, NULL, 'have_good_signal_title_1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(820, 'strength?', 1, NULL, 'have_good_signal_title_2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(821, 'Ensure that you have good signal strength.\\n\\nStaying indoors or underground quite often distrupts your mobile network signal.', 1, NULL, 'have_good_signal_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(822, 'Connected to our partner', 1, NULL, 'connected_to_partner_network_title_1_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(823, 'network?', 1, NULL, 'connected_to_partner_network_title_2_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(824, 'Couldn\'t troubleshoot your issue? Raise a ticket to our support staff', 1, NULL, 'contact_support_desc_text ', 1, '2017-11-16 11:47:46', '2017-11-16 11:47:46'),
(825, 'Alternatively, you can reach to our', 1, NULL, 'alternatively_reach_support_whatsapp_1_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(826, 'support team via Whatsapp', 1, NULL, 'alternatively_reach_support_whatsapp_2_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(827, 'Refresh', 28, '', 'refresh_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(828, 'Search Contact', 1, NULL, 'search_contact_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(829, 'click the link in the SMS to sign up.', 1, NULL, 'click_link_sms_signup_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(830, 'Please check your email address and try again.', 1, NULL, 'invalid_email_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(831, 'Password must be at least 6 characters', 1, NULL, 'password_must_be_6_characters_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(832, 'Password must be less or equal to 15 characters', 1, NULL, 'password_must_be_less_characters_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(833, 'Password does not match. Please check again.', 1, NULL, 'password_not_match_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(834, 'Facebook Permission Required', 1, NULL, 'facebook_permission_required_text ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(835, 'guide_banner_2', 1, NULL, 'guide_banner_2_image ', 1, '2017-11-16 11:47:47', '2017-11-16 11:47:47'),
(836, 'Please allow the required Facebook permissions to connect with your Facebook account', 1, NULL, 'facebook_permission_allow_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(837, 'Unable to login with your Facebook acocunt. Please check your Facebook account and try again.', 1, NULL, 'facebook_unable_login_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(838, 'No Internet connection. Please check your device connection.', 1, NULL, 'no_internet_connection_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(839, 'Unable to connect to server. Please try again later.', 1, NULL, 'unable_connect_server_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(840, 'Please fill in your first name', 1, NULL, 'fill_first_name_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(841, 'Please fill in your last name', 1, NULL, 'fill_last_name_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(842, 'Referral link successfully copied!', 1, NULL, 'referral_link_copied_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(843, 'No transaction', 1, NULL, 'no_transaction_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(844, 'Please enter your credit card number', 1, NULL, 'please_enter_cc_number_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(845, 'Please enter your credit card expiration date', 1, NULL, 'please_enter_cc_expiration_date_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(846, 'Please enter your credit card CVV number', 1, NULL, 'please_enter_cc_cvv_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(847, 'Invalid credit card number. Please check your credit card.', 1, NULL, 'invalid_cc_number_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(848, 'Problem purchasing Xtra Data. Please log out and relogin to try again.', 1, NULL, 'problem_purchase_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(849, 'red_hot_button', 1, NULL, 'red_hot_button_image ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(850, 'Successfully applied shipping code', 1, NULL, 'successfully_applied_shipping_code_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(851, 'To access and use Flexiroam X data over 100 countries, you\'ll need to get a Starter Pack which contains the X microchip. \\n\\n Just stick on the X microchip onto your existing SIM card to start roaming.', 1, NULL, 'how_it_works_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(852, 'If you proceed, the auto-renewal of your Flexiroam X data plan will be stopped. \\n\\n You will lose remaining data upon expiry of your plan.', 1, NULL, 'stop_renewal_plan_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(853, 'NO PROMO CODE', 1, NULL, 'no_promo_code_title_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(854, 'Please enter promo code', 1, NULL, 'no_promo_code_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(855, 'Looking for your pack...', 1, NULL, 'looking_for_pack_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(856, 'No pack found.', 1, NULL, 'no_pack_found_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(857, 'Could not start phone camera. Please check your phone camera.', 1, NULL, 'check_phone_camera_text ', 1, '2017-11-16 11:47:48', '2017-11-16 11:47:48'),
(858, 'MESSAGE', 1, NULL, 'message_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(859, 'Select Image', 1, NULL, 'select_image_title_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(860, 'Select image to send to our support team', 1, NULL, 'select_image_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(861, 'CAMERA', 1, NULL, 'camera_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(862, 'GALLERY', 1, NULL, 'gallery_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(863, 'No Referral History', 1, NULL, 'no_referral_history_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(864, 'http://web.flexiroamx.com/m/faq/', 1, NULL, 'faq_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(865, 'http://web.flexiroamx.com/m/guides/micro.html', 1, NULL, 'guide_micro_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(866, 'http://web.flexiroamx.com/m/guides/nano.html', 1, NULL, 'guide_nano_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(867, 'http://web.flexiroamx.com/m/guides/ios_first_time_setup.html', 1, NULL, 'guide_first_time_setup_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(868, 'http://web.flexiroamx.com/m/guides/ios_switch.html', 1, NULL, 'guide_switch_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(869, 'http://web.flexiroamx.com/m/guides/ios_switch_back_to_home_sim.html', 1, NULL, 'guide_switch_home_link ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(870, 'Your plan is ending today', 1, NULL, 'your_plan_is_ending_today_dashboard_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(871, 'If you wish to retain your data, Set Plan Renewal', 1, NULL, 'if_you_wish_retain_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(872, 'verify_email_banner', 1, NULL, 'verify_email_banner_image ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(873, 'Frequently Asked Question', 1, NULL, 'faq_title_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(874, 'Avoid huge roaming fees when you\'re overseas.\\n\\nFlexiroam is the latest data roaming solution for you to get data when you travel.\\n\\nOrder an X Starter Pack with a free X microchip to start roaming in over 100 countries.', 1, NULL, 'about_desc_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(875, 'Your Global Balance', 26, '', 'your_global_balance_text ', 1, '2017-11-16 11:47:49', '2017-11-16 11:47:49'),
(876, 'Promotions', 1, NULL, 'promotions_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(877, 'Date', 1, NULL, 'date_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(878, 'Select Travel Date', 1, NULL, 'select_travel_date_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(879, 'Purchase', 1, NULL, 'purchase_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(880, 'No Plan Found', 1, NULL, 'no_plan_found_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(881, 'Select', 1, NULL, 'select_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(882, 'special_offer_banner', 1, NULL, 'special_offer_banner_image ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(883, 'Get Local Data', 1, NULL, 'get_local_data_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(884, 'Plan History', 1, NULL, 'plan_history_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(885, 'No plan history available', 1, NULL, 'no_plan_history_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(886, 'Notifications', 1, NULL, 'notifications_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(887, 'No Notifications', 1, NULL, 'no_notification_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(888, 'Plan Renewal Options', 30, '', 'plan_renewal_options_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(889, 'We will process your request and update you once it is available. Thank you!', 1, NULL, 'country_plan_request_msg_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(890, 'An error occurred processing the payment.', 1, NULL, 'payment_error_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(891, 'Something went wrong while processing the order, Please check your inbox for confirmation email before retrying', 1, NULL, 'payment_error_2_text ', 1, '2017-11-16 11:47:50', '2017-11-16 11:47:50'),
(892, 'Terms and Conditions Apply', 32, '', 'terms_conditions_apply_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(893, '中文 (繁體)', 1, NULL, 'chinese_traditional_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(894, 'What can you do', 26, '', 'what_can_you_do_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(895, 'With your data?', 26, '', 'with_your_data_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(896, 'To start roaming', 1, NULL, 'to_start_roaming_countries_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(897, 'Get Data Plans', 26, '', 'get_data_plans_text ', 1, '2017-11-16 11:47:51', '2017-11-16 11:47:51'),
(898, 'Get now', 26, '', 'get_now_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(899, 'View userguides & manuals', 1, NULL, 'view_guide_manual_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(900, 'Read the guide here', 26, '', 'read_guide_here_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(901, 'Received your Starter Pack?', 1, NULL, 'received_your_starter_pack_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(902, 'Get data plans in a selected country at an irresistable price', 1, NULL, 'get_data_selected_country_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(903, 'Enjoy full access when you upgrade to the full plan', 1, NULL, 'full_acess_full_plan_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(904, 'Verify your email', 1, NULL, 'verify_your_email_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(905, 'to complete your profile', 1, NULL, 'complete_your_profile_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(906, 'Usage Example', 1, NULL, 'usage_example_btn_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(907, 'Traveling Soon? Check plan availability for your next destination', 1, NULL, 'traveling_soon_full_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(908, 'Total Free Data Earned', 1, NULL, 'total_free_data_earned_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(909, 'instant messages', 31, '', 'instant_message_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(910, '(text only)', 1, NULL, 'text_only_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(911, 'emails', 31, '', 'emails_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(912, '(send/receive)', 1, NULL, 'send_receive_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(913, 'photo upload', 31, '', 'photo_upload_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(914, 'on social media', 1, NULL, 'on_social_media_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(915, 'internet', 31, '', 'internet_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(916, 'voice calls', 1, NULL, 'voice_calls_text ', 1, '2017-11-16 11:47:52', '2017-11-16 11:47:52'),
(917, '* Approxmimate data usage examples shown above, your actual usage may differ.', 1, NULL, 'info_data_usage_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(918, 'Previous', 1, NULL, 'previous_date_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(919, '~250k', 1, NULL, 'message_500mb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(920, '~2.75k', 1, NULL, 'emails_500mb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(921, '~1k', 1, NULL, 'photo_500mb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(922, '~150m', 1, NULL, 'internet_500mb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(923, '~5hrs', 1, NULL, 'map_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(924, '~25hrs', 1, NULL, 'map_500mb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(925, '~500k', 1, NULL, 'message_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(926, '~5.5k', 1, NULL, 'emails_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(927, '~2k', 1, NULL, 'photo_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(928, '~300m', 1, NULL, 'internet_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(929, '~10hrs', 1, NULL, 'web_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(930, '~50hrs', 1, NULL, 'map_1gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(931, '~1.5mil', 1, NULL, 'message_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(932, '~16.5k', 1, NULL, 'emails_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(933, '~6k', 1, NULL, 'photo_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(934, '~15hrs', 1, NULL, 'internet_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(935, '~30hrs', 1, NULL, 'web_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(936, '~150hrs', 1, NULL, 'map_3gb_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(937, '~50k', 1, NULL, 'message_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(938, '~550', 1, NULL, 'emails_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(939, '~200', 1, NULL, 'photo_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(940, '~30m', 1, NULL, 'internet_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(941, '~1hrs', 1, NULL, 'web_trial_text ', 1, '2017-11-16 11:47:53', '2017-11-16 11:47:53'),
(942, '*Default card would be used for auto-renewal charges if you have subscribed for an auto renewal', 1, NULL, 'default_card_info_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(943, 'Add', 1, NULL, 'add_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(944, 'Done', 1, NULL, 'done_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(945, 'Remove Credit Card', 1, NULL, 'remove_credit_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(946, 'Do you want to remove your credit card details?', 20, '', 'do_you_want_remove_credit_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(947, 'Saved Card', 19, '', 'saved_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(948, 'Other Payment Method', 16, '', 'other_payment_method_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(949, 'Credit Card / Debit Card', 13, '', 'credit_card_debit_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(950, 'No saved card', 12, '', 'no_saved_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(951, 'Confirmation', 6, '', 'confirmation_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(952, 'Save Credit Card', 5, '', 'save_credit_card_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(953, 'Do you want to save your credit card details for future payments?', 3, '', 'save_credit_card_for_future_payment_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(954, 'Please check your credit card details and try again.', 2, '', 'check_credit_card_and_try_again_text ', 1, '2017-11-16 11:47:54', '2017-11-16 11:47:54'),
(955, 'Your Global Balance', 22, 'item_country_plan_your_global_balance', '', 1, '2017-11-20 10:43:07', '2017-11-20 10:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, 'sJSMVQQAz8V9KibtuZSBhGTKxeh4z0rQ', 1508137154, 0),
(2, 'XkPemZFwyBv6Vi_3l_F7KoCs1_rcKBcR', 1508139536, 1);

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

CREATE TABLE `translation` (
  `translation_id` int(11) UNSIGNED NOT NULL,
  `label_id` int(11) UNSIGNED NOT NULL,
  `translation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `language_id` int(11) UNSIGNED NOT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) UNSIGNED NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'IOS', '2017-10-19 17:01:37', '2017-10-19 17:01:37'),
(2, 'Android', '2017-10-19 17:01:51', '2017-10-19 17:01:51'),
(3, 'Both', '2017-10-20 09:51:39', '2017-10-20 09:51:39'),
(4, 'brochure', '2017-10-26 16:18:32', '2017-10-26 16:18:32'),
(5, 'user guide', '2017-11-03 11:20:23', '2017-11-03 11:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
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
  `status` int(11) UNSIGNED NOT NULL DEFAULT '20',
  `role` smallint(2) DEFAULT '20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `language_id`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`, `status`, `role`) VALUES
(1, 'mohsin', 'mohsin@flexiroam.org', NULL, '$2y$10$IKq3b9vzQDj5Q3PUhU4BK.tPodKq9yvQSFRcuEUBjTdf5jrnu/p6u', 'r4kMToFrhMxFanIZ0VMYBdYGtDyzVzVX', 16934455, 'mohsin@flexiroam.org', NULL, '::1', 1508137154, 1508137154, 0, 1511312307, 30, 30),
(2, 'chinese_tr', 'chinese_tr@flexiroam.org', 2, '$2y$10$W2W2iLz0DXKeVtcILOpJPeMkDjEG4xBy.ir5OhynG.Q6i2SNQjfyu', 'wvW2dK-Rnknz-paVJmUF-eRMYCk1NNUC', 1508137771, NULL, NULL, '::1', 1508137771, 1511145977, 0, 1508139572, 20, 20),
(3, 'masood', 'masood@flexiroam.org', 5, '$2y$10$M8YFJLRQO2rMzxb4iXvQUOPxhPmmTaKy9oYOX81JpFpy57geAd4ta', 'sWuhRbHek0kpmaBd0eOiDnJp-BP0-8lk', 1508222780, NULL, NULL, '::1', 1508222780, 1510557399, 0, 1510558592, 20, 20),
(7, 'test4', 'test4@online.com', 4, '$2y$10$yZDbXqwK9x4OJjL4sjUOOeaZ5GBXhu6GpI9GYE0uoV5hHUnzYJ/zC', 'Hvtjv6TjfClSgnP2jmcORBDtV2oEYUQa', 1508231164, NULL, NULL, '::1', 1508231164, 1510804869, 0, 1511171675, 20, 20),
(8, 'test6', 'test6@online.com', 4, '$2y$10$REWmfLOOFNV6IOnlUHdCQOZIyHMT9wQlHjCi0bF2hzXgWr5U8r/p.', 'lAiEkOjJfv3buZC_LPkZKOhbnqXT2W6x', 1508732706, NULL, NULL, '::1', 1508732706, 1508732706, 0, 1509607447, 20, 20),
(9, 'chinese_sm', 'chinese_sm@flexiroam.com', 3, '$2y$10$HC/zFnSwizU/HoVOSlL8nOW2/WA7APrMP0HiJa0uqykhAi0ndEsyK', 'lOfEopkY18beZIdTNWatEMW2XXtFBxKi', 1509429487, NULL, NULL, '::1', 1509429487, 1511145949, 0, 1511146056, 20, 20),
(10, 'test9', 'test9@online.com', 1, '$2y$10$rJccihxRV.JwseZ6iB70b.T1nhDBYopYYsb3Qt8zR3RWbcGOdb4O6', '6d7usTeUAX6HV2GOsO3ueABFD_zYQcM8', 1509678700, NULL, NULL, '::1', 1509678700, 1509678700, 0, 1511311692, 20, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `screenshots`
--
ALTER TABLE `screenshots`
  ADD PRIMARY KEY (`screenshot_id`);

--
-- Indexes for table `screen_windows`
--
ALTER TABLE `screen_windows`
  ADD PRIMARY KEY (`window_id`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `system_labels`
--
ALTER TABLE `system_labels`
  ADD PRIMARY KEY (`label_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`translation_id`),
  ADD KEY `label_const` (`label_id`),
  ADD KEY `language_const` (`language_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `screenshots`
--
ALTER TABLE `screenshots`
  MODIFY `screenshot_id` tinyint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `screen_windows`
--
ALTER TABLE `screen_windows`
  MODIFY `window_id` tinyint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_labels`
--
ALTER TABLE `system_labels`
  MODIFY `label_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=956;
--
-- AUTO_INCREMENT for table `translation`
--
ALTER TABLE `translation`
  MODIFY `translation_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `label_const` FOREIGN KEY (`label_id`) REFERENCES `system_labels` (`label_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `language_const` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
