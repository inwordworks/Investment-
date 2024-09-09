-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2024 at 09:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farm_trader`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admin_access` text DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `image`, `image_driver`, `phone`, `address`, `admin_access`, `last_login`, `last_seen`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'MR Admin', 'admin', 'admin@website.com', '$2y$10$ZaoGDM1JBEa79gZgQMWImOz3HJDCgbcVFpC5.2cXbVVvoSDLFsJva', 'adminProfileImage/boCcPGck5zpscBdE9SLMfT1sbXpq3K.webp', 'local', '+4455541455', 'NY, USA', NULL, '2023-08-03 12:14:45', '2024-08-21 18:16:25', 1, 'QX92DdfjoH8kFw3xI642CLIVa5IORXVtRbjx45O9IRNzi2l04uBpIroGTSGZ', NULL, '2024-08-21 12:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `navbar_style` varchar(20) DEFAULT NULL,
  `primary_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `base_currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `admin_prefix` varchar(191) DEFAULT NULL,
  `is_currency_position` varchar(191) NOT NULL DEFAULT 'left' COMMENT 'left, right',
  `has_space_between_currency_and_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `paginate` int(11) DEFAULT NULL,
  `strong_password` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0,
  `fraction_number` int(11) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_email_name` varchar(255) DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `in_app_notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active',
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `tawk_id` varchar(255) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_page_id` varchar(255) DEFAULT NULL,
  `manual_recaptcha` tinyint(1) DEFAULT 0 COMMENT '0 =>inactive, 1 => active ',
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>inactive, 1 =>active',
  `recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active ',
  `reCaptcha_status_login` tinyint(1) DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `google_admin_login_recaptcha_status` tinyint(1) NOT NULL DEFAULT 0,
  `google_user_login_recaptcha_status` tinyint(1) NOT NULL DEFAULT 0,
  `google_user_registration_recaptcha_status` tinyint(1) DEFAULT 0,
  `reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `measurement_id` varchar(255) DEFAULT NULL,
  `analytic_status` tinyint(1) DEFAULT NULL,
  `error_log` tinyint(1) DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_driver` varchar(20) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `favicon_driver` varchar(20) DEFAULT NULL,
  `admin_logo` varchar(255) DEFAULT NULL,
  `admin_logo_driver` varchar(20) DEFAULT NULL,
  `admin_dark_mode_logo` varchar(255) DEFAULT NULL,
  `admin_dark_mode_logo_driver` varchar(50) DEFAULT NULL,
  `currency_layer_access_key` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update_at` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update` varchar(1) DEFAULT NULL,
  `coin_market_cap_app_key` varchar(255) DEFAULT NULL,
  `coin_market_cap_auto_update_at` varchar(255) NOT NULL,
  `coin_market_cap_auto_update` tinyint(1) DEFAULT NULL,
  `automatic_payout_permission` tinyint(1) NOT NULL DEFAULT 0,
  `date_time_format` varchar(255) DEFAULT NULL,
  `cookie_title` varchar(60) NOT NULL,
  `cookie_button_name` varchar(50) NOT NULL,
  `cookie_button_url` varchar(255) NOT NULL,
  `cookie_status` tinyint(4) NOT NULL DEFAULT 1,
  `cookie_short_text` varchar(255) NOT NULL,
  `cookie_image` varchar(150) NOT NULL,
  `cookie_driver` varchar(60) NOT NULL,
  `deposit_commission` tinyint(1) NOT NULL DEFAULT 0,
  `investment_commission` tinyint(1) NOT NULL DEFAULT 0,
  `profit_commission` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `theme`, `site_title`, `navbar_style`, `primary_color`, `secondary_color`, `time_zone`, `base_currency`, `currency_symbol`, `admin_prefix`, `is_currency_position`, `has_space_between_currency_and_amount`, `is_force_ssl`, `is_maintenance_mode`, `paginate`, `strong_password`, `registration`, `fraction_number`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `in_app_notification`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `manual_recaptcha`, `google_recaptcha`, `recaptcha_admin_login`, `reCaptcha_status_login`, `google_admin_login_recaptcha_status`, `google_user_login_recaptcha_status`, `google_user_registration_recaptcha_status`, `reCaptcha_status_registration`, `measurement_id`, `analytic_status`, `error_log`, `is_active_cron_notification`, `logo`, `logo_driver`, `favicon`, `favicon_driver`, `admin_logo`, `admin_logo_driver`, `admin_dark_mode_logo`, `admin_dark_mode_logo_driver`, `currency_layer_access_key`, `currency_layer_auto_update_at`, `currency_layer_auto_update`, `coin_market_cap_app_key`, `coin_market_cap_auto_update_at`, `coin_market_cap_auto_update`, `automatic_payout_permission`, `date_time_format`, `cookie_title`, `cookie_button_name`, `cookie_button_url`, `cookie_status`, `cookie_short_text`, `cookie_image`, `cookie_driver`, `deposit_commission`, `investment_commission`, `profit_commission`, `created_at`, `updated_at`) VALUES
(1, 'light', 'Agriwealth', 'navbar_1', '#2a2a2a', '#554906', 'Asia/Dhaka', 'TK', 'tk', 'admin', 'left', 0, 0, 0, 20, 0, 1, 2, 'support@achi.com', 'Bug Admin', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width\">\r\n<style type=\"text/css\">\r\n    @media only screen and (min-width: 620px) {\r\n        * [lang=x-wrapper] h1 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h3 {\r\n        }\r\n\r\n        * [lang=x-layout__inner] p,\r\n        * [lang=x-layout__inner] ol,\r\n        * [lang=x-layout__inner] ul {\r\n        }\r\n\r\n        * div [lang=x-size-8] {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important\r\n        }\r\n\r\n        * div [lang=x-size-9] {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important\r\n        }\r\n\r\n        * div [lang=x-size-10] {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important\r\n        }\r\n\r\n        * div [lang=x-size-11] {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-12] {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-13] {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-14] {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-15] {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important\r\n        }\r\n\r\n        * div [lang=x-size-16] {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important\r\n        }\r\n\r\n        * div [lang=x-size-17] {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-20] {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * div [lang=x-size-22] {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important\r\n        }\r\n\r\n        * div [lang=x-size-24] {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important\r\n        }\r\n\r\n        * div [lang=x-size-26] {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * div [lang=x-size-28] {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important\r\n        }\r\n\r\n        * div [lang=x-size-30] {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important\r\n        }\r\n\r\n        * div [lang=x-size-32] {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important\r\n        }\r\n\r\n        * div [lang=x-size-34] {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-36] {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-40] {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important\r\n        }\r\n\r\n        * div [lang=x-size-44] {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important\r\n        }\r\n\r\n        * div [lang=x-size-48] {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important\r\n        }\r\n\r\n        * div [lang=x-size-56] {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important\r\n        }\r\n\r\n        * div [lang=x-size-64] {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important\r\n        }\r\n    }\r\n</style>\r\n<style type=\"text/css\">\r\n    body {\r\n        margin: 0;\r\n        padding: 0;\r\n    }\r\n\r\n    table {\r\n        border-collapse: collapse;\r\n        table-layout: fixed;\r\n    }\r\n\r\n    * {\r\n        line-height: inherit;\r\n    }\r\n\r\n    [x-apple-data-detectors],\r\n    [href^=\"tel\"],\r\n    [href^=\"sms\"] {\r\n        color: inherit !important;\r\n        text-decoration: none !important;\r\n    }\r\n\r\n    .wrapper .footer__share-button a:hover,\r\n    .wrapper .footer__share-button a:focus {\r\n        color: #ffffff !important;\r\n    }\r\n\r\n    .btn a:hover,\r\n    .btn a:focus,\r\n    .footer__share-button a:hover,\r\n    .footer__share-button a:focus,\r\n    .email-footer__links a:hover,\r\n    .email-footer__links a:focus {\r\n        opacity: 0.8;\r\n    }\r\n\r\n    .preheader,\r\n    .header,\r\n    .layout,\r\n    .column {\r\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\r\n    }\r\n\r\n    .layout,\r\n    .header {\r\n        max-width: 400px !important;\r\n        -fallback-width: 95% !important;\r\n        width: calc(100% - 20px) !important;\r\n    }\r\n\r\n    div.preheader {\r\n        max-width: 360px !important;\r\n        -fallback-width: 90% !important;\r\n        width: calc(100% - 60px) !important;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        Float: none !important;\r\n    }\r\n\r\n    .column {\r\n        max-width: 400px !important;\r\n        width: 100% !important;\r\n    }\r\n\r\n    .fixed-width.has-border {\r\n        max-width: 402px !important;\r\n    }\r\n\r\n    .fixed-width.has-border .layout__inner {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        width: 50% !important;\r\n    }\r\n\r\n    .ie .btn {\r\n        width: 100%;\r\n    }\r\n\r\n    .ie .column,\r\n    [owa] .column,\r\n    .ie .gutter,\r\n    [owa] .gutter {\r\n        display: table-cell;\r\n        float: none !important;\r\n        vertical-align: top;\r\n    }\r\n\r\n    .ie div.preheader,\r\n    [owa] div.preheader,\r\n    .ie .email-footer,\r\n    [owa] .email-footer {\r\n        max-width: 560px !important;\r\n        width: 560px !important;\r\n    }\r\n\r\n    .ie .snippet,\r\n    [owa] .snippet,\r\n    .ie .webversion,\r\n    [owa] .webversion {\r\n        width: 280px !important;\r\n    }\r\n\r\n    .ie .header,\r\n    [owa] .header,\r\n    .ie .layout,\r\n    [owa] .layout,\r\n    .ie .one-col .column,\r\n    [owa] .one-col .column {\r\n        max-width: 600px !important;\r\n        width: 600px !important;\r\n    }\r\n\r\n    .ie .fixed-width.has-border,\r\n    [owa] .fixed-width.has-border,\r\n    .ie .has-gutter.has-border,\r\n    [owa] .has-gutter.has-border {\r\n        max-width: 602px !important;\r\n        width: 602px !important;\r\n    }\r\n\r\n    .ie .two-col .column,\r\n    [owa] .two-col .column {\r\n        width: 300px !important;\r\n    }\r\n\r\n    .ie .three-col .column,\r\n    [owa] .three-col .column,\r\n    .ie .narrow,\r\n    [owa] .narrow {\r\n        width: 200px !important;\r\n    }\r\n\r\n    .ie .wide,\r\n    [owa] .wide {\r\n        width: 400px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter .column,\r\n    [owa] .two-col.x_has-gutter .column {\r\n        width: 290px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter .column,\r\n    [owa] .three-col.x_has-gutter .column,\r\n    .ie .has-gutter .narrow,\r\n    [owa] .has-gutter .narrow {\r\n        width: 188px !important;\r\n    }\r\n\r\n    .ie .has-gutter .wide,\r\n    [owa] .has-gutter .wide {\r\n        width: 394px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter.has-border .column,\r\n    [owa] .two-col.x_has-gutter.x_has-border .column {\r\n        width: 292px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter.has-border .column,\r\n    [owa] .three-col.x_has-gutter.x_has-border .column,\r\n    .ie .has-gutter.has-border .narrow,\r\n    [owa] .has-gutter.x_has-border .narrow {\r\n        width: 190px !important;\r\n    }\r\n\r\n    .ie .has-gutter.has-border .wide,\r\n    [owa] .has-gutter.x_has-border .wide {\r\n        width: 396px !important;\r\n    }\r\n\r\n    .ie .fixed-width .layout__inner {\r\n        border-left: 0 none white !important;\r\n        border-right: 0 none white !important;\r\n    }\r\n\r\n    .ie .layout__edges {\r\n        display: none;\r\n    }\r\n\r\n    .mso .layout__edges {\r\n        font-size: 0;\r\n    }\r\n\r\n    .layout-fixed-width,\r\n    .mso .layout-full-width {\r\n        background-color: #ffffff;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n\r\n        .column,\r\n        .gutter {\r\n            display: table-cell;\r\n            Float: none !important;\r\n            vertical-align: top;\r\n        }\r\n\r\n        div.preheader,\r\n        .email-footer {\r\n            max-width: 560px !important;\r\n            width: 560px !important;\r\n        }\r\n\r\n        .snippet,\r\n        .webversion {\r\n            width: 280px !important;\r\n        }\r\n\r\n        .header,\r\n        .layout,\r\n        .one-col .column {\r\n            max-width: 600px !important;\r\n            width: 600px !important;\r\n        }\r\n\r\n        .fixed-width.has-border,\r\n        .fixed-width.ecxhas-border,\r\n        .has-gutter.has-border,\r\n        .has-gutter.ecxhas-border {\r\n            max-width: 602px !important;\r\n            width: 602px !important;\r\n        }\r\n\r\n        .two-col .column {\r\n            width: 300px !important;\r\n        }\r\n\r\n        .three-col .column,\r\n        .column.narrow {\r\n            width: 200px !important;\r\n        }\r\n\r\n        .column.wide {\r\n            width: 400px !important;\r\n        }\r\n\r\n        .two-col.has-gutter .column,\r\n        .two-col.ecxhas-gutter .column {\r\n            width: 290px !important;\r\n        }\r\n\r\n        .three-col.has-gutter .column,\r\n        .three-col.ecxhas-gutter .column,\r\n        .has-gutter .narrow {\r\n            width: 188px !important;\r\n        }\r\n\r\n        .has-gutter .wide {\r\n            width: 394px !important;\r\n        }\r\n\r\n        .two-col.has-gutter.has-border .column,\r\n        .two-col.ecxhas-gutter.ecxhas-border .column {\r\n            width: 292px !important;\r\n        }\r\n\r\n        .three-col.has-gutter.has-border .column,\r\n        .three-col.ecxhas-gutter.ecxhas-border .column,\r\n        .has-gutter.has-border .narrow,\r\n        .has-gutter.ecxhas-border .narrow {\r\n            width: 190px !important;\r\n        }\r\n\r\n        .has-gutter.has-border .wide,\r\n        .has-gutter.ecxhas-border .wide {\r\n            width: 396px !important;\r\n        }\r\n    }\r\n\r\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\r\n        .fblike {\r\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\r\n        }\r\n\r\n        .tweet {\r\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\r\n        }\r\n\r\n        .linkedinshare {\r\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\r\n        }\r\n\r\n        .forwardtoafriend {\r\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 321px) {\r\n        .fixed-width.has-border .layout__inner {\r\n            border-width: 1px 0 !important;\r\n        }\r\n\r\n        .layout,\r\n        .column {\r\n            min-width: 320px !important;\r\n            width: 320px !important;\r\n        }\r\n\r\n        .border {\r\n            display: none;\r\n        }\r\n    }\r\n\r\n    .mso div {\r\n        border: 0 none white !important;\r\n    }\r\n\r\n    .mso .w560 .divider {\r\n        margin-left: 260px !important;\r\n        margin-right: 260px !important;\r\n    }\r\n\r\n    .mso .w360 .divider {\r\n        margin-left: 160px !important;\r\n        margin-right: 160px !important;\r\n    }\r\n\r\n    .mso .w260 .divider {\r\n        margin-left: 110px !important;\r\n        margin-right: 110px !important;\r\n    }\r\n\r\n    .mso .w160 .divider {\r\n        margin-left: 60px !important;\r\n        margin-right: 60px !important;\r\n    }\r\n\r\n    .mso .w354 .divider {\r\n        margin-left: 157px !important;\r\n        margin-right: 157px !important;\r\n    }\r\n\r\n    .mso .w250 .divider {\r\n        margin-left: 105px !important;\r\n        margin-right: 105px !important;\r\n    }\r\n\r\n    .mso .w148 .divider {\r\n        margin-left: 54px !important;\r\n        margin-right: 54px !important;\r\n    }\r\n\r\n    .mso .font-avenir,\r\n    .mso .font-cabin,\r\n    .mso .font-open-sans,\r\n    .mso .font-ubuntu {\r\n        font-family: sans-serif !important;\r\n    }\r\n\r\n    .mso .font-bitter,\r\n    .mso .font-merriweather,\r\n    .mso .font-pt-serif {\r\n        font-family: Georgia, serif !important;\r\n    }\r\n\r\n    .mso .font-lato,\r\n    .mso .font-roboto {\r\n        font-family: Tahoma, sans-serif !important;\r\n    }\r\n\r\n    .mso .font-pt-sans {\r\n        font-family: \"Trebuchet MS\", sans-serif !important;\r\n    }\r\n\r\n    .mso .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper .size-8 {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important;\r\n        }\r\n\r\n        .wrapper .size-9 {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important;\r\n        }\r\n\r\n        .wrapper .size-10 {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important;\r\n        }\r\n\r\n        .wrapper .size-11 {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-12 {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-13 {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-14 {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-15 {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important;\r\n        }\r\n\r\n        .wrapper .size-16 {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important;\r\n        }\r\n\r\n        .wrapper .size-17 {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-18 {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-20 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important;\r\n        }\r\n\r\n        .wrapper .size-22 {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important;\r\n        }\r\n\r\n        .wrapper .size-24 {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important;\r\n        }\r\n\r\n        .wrapper .size-26 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important;\r\n        }\r\n\r\n        .wrapper .size-28 {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important;\r\n        }\r\n\r\n        .wrapper .size-30 {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important;\r\n        }\r\n\r\n        .wrapper .size-32 {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important;\r\n        }\r\n\r\n        .wrapper .size-34 {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-36 {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-40 {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important;\r\n        }\r\n\r\n        .wrapper .size-44 {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important;\r\n        }\r\n\r\n        .wrapper .size-48 {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important;\r\n        }\r\n\r\n        .wrapper .size-56 {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important;\r\n        }\r\n\r\n        .wrapper .size-64 {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important;\r\n        }\r\n    }\r\n\r\n    .mso .size-8,\r\n    .ie .size-8 {\r\n        font-size: 8px !important;\r\n        line-height: 14px !important;\r\n    }\r\n\r\n    .mso .size-9,\r\n    .ie .size-9 {\r\n        font-size: 9px !important;\r\n        line-height: 16px !important;\r\n    }\r\n\r\n    .mso .size-10,\r\n    .ie .size-10 {\r\n        font-size: 10px !important;\r\n        line-height: 18px !important;\r\n    }\r\n\r\n    .mso .size-11,\r\n    .ie .size-11 {\r\n        font-size: 11px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-12,\r\n    .ie .size-12 {\r\n        font-size: 12px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-13,\r\n    .ie .size-13 {\r\n        font-size: 13px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-14,\r\n    .ie .size-14 {\r\n        font-size: 14px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-15,\r\n    .ie .size-15 {\r\n        font-size: 15px !important;\r\n        line-height: 23px !important;\r\n    }\r\n\r\n    .mso .size-16,\r\n    .ie .size-16 {\r\n        font-size: 16px !important;\r\n        line-height: 24px !important;\r\n    }\r\n\r\n    .mso .size-17,\r\n    .ie .size-17 {\r\n        font-size: 17px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-18,\r\n    .ie .size-18 {\r\n        font-size: 18px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-20,\r\n    .ie .size-20 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important;\r\n    }\r\n\r\n    .mso .size-22,\r\n    .ie .size-22 {\r\n        font-size: 22px !important;\r\n        line-height: 31px !important;\r\n    }\r\n\r\n    .mso .size-24,\r\n    .ie .size-24 {\r\n        font-size: 24px !important;\r\n        line-height: 32px !important;\r\n    }\r\n\r\n    .mso .size-26,\r\n    .ie .size-26 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important;\r\n    }\r\n\r\n    .mso .size-28,\r\n    .ie .size-28 {\r\n        font-size: 28px !important;\r\n        line-height: 36px !important;\r\n    }\r\n\r\n    .mso .size-30,\r\n    .ie .size-30 {\r\n        font-size: 30px !important;\r\n        line-height: 38px !important;\r\n    }\r\n\r\n    .mso .size-32,\r\n    .ie .size-32 {\r\n        font-size: 32px !important;\r\n        line-height: 40px !important;\r\n    }\r\n\r\n    .mso .size-34,\r\n    .ie .size-34 {\r\n        font-size: 34px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-36,\r\n    .ie .size-36 {\r\n        font-size: 36px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-40,\r\n    .ie .size-40 {\r\n        font-size: 40px !important;\r\n        line-height: 47px !important;\r\n    }\r\n\r\n    .mso .size-44,\r\n    .ie .size-44 {\r\n        font-size: 44px !important;\r\n        line-height: 50px !important;\r\n    }\r\n\r\n    .mso .size-48,\r\n    .ie .size-48 {\r\n        font-size: 48px !important;\r\n        line-height: 54px !important;\r\n    }\r\n\r\n    .mso .size-56,\r\n    .ie .size-56 {\r\n        font-size: 56px !important;\r\n        line-height: 60px !important;\r\n    }\r\n\r\n    .mso .size-64,\r\n    .ie .size-64 {\r\n        font-size: 64px !important;\r\n        line-height: 63px !important;\r\n    }\r\n\r\n    .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n</style>\r\n\r\n<title></title>\r\n<!--[if !mso]><!-->\r\n<style type=\"text/css\">\r\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\r\n</style>\r\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\r\n<!--<![endif]-->\r\n<style type=\"text/css\">\r\n    body {\r\n        background-color: #f5f7fa\r\n    }\r\n\r\n    .mso h1 {\r\n    }\r\n\r\n    .mso h1 {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso h2 {\r\n    }\r\n\r\n    .mso h3 {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .btn a {\r\n    }\r\n\r\n    .mso .btn a {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .logo {\r\n    }\r\n\r\n    .mso .logo {\r\n        font-family: Tahoma, sans-serif !important\r\n    }\r\n\r\n    .logo a:hover,\r\n    .logo a:focus {\r\n        color: #859bb1 !important\r\n    }\r\n\r\n    .mso .layout-has-border {\r\n        border-top: 1px solid #b1c1d8;\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .layout-has-bottom-border {\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .border,\r\n    .ie .border {\r\n        background-color: #b1c1d8\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper h1 {\r\n        }\r\n\r\n        .wrapper h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        .wrapper h2 {\r\n        }\r\n\r\n        .wrapper h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        .wrapper h3 {\r\n        }\r\n\r\n        .column p,\r\n        .column ol,\r\n        .column ul {\r\n        }\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important\r\n    }\r\n\r\n    .mso h3,\r\n    .ie h3 {\r\n    }\r\n\r\n    .mso .layout__inner p,\r\n    .ie .layout__inner p,\r\n    .mso .layout__inner ol,\r\n    .ie .layout__inner ol,\r\n    .mso .layout__inner ul,\r\n    .ie .layout__inner ul {\r\n    }\r\n</style>\r\n<meta name=\"robots\" content=\"noindex,nofollow\">\r\n\r\n<meta property=\"og:title\" content=\"Just One More Step\">\r\n\r\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\r\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\r\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            <img style=\"width: 200px;\" src=\"https://bug-finder.s3.ap-southeast-1.amazonaws.com/assets/logo/header-logo.svg\" data-filename=\"imageedit_76_3542310111.png\"></h1>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\r\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\r\n\r\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\r\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\r\n                        </div>\r\n\r\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\r\n\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\r\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>Pay Secure</b></font></p>\r\n                        </div>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\r\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            2022 ©  All Right Reserved</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', 1, 1, 0, 0, 0, 0, 'OSLDSF465', 0, 0, 'KLSDKF789', '654646977', 0, 0, 1, 1, 1, 1, 1, 1, 'aaaaaa', 0, 1, 1, 'logo/9YmSyZAMSjgNwimRTsVg5yG5EjZlHZ.webp', 'local', 'logo/cJvqHEOE1jX77ciAvRI4wuJUOMygTL.avif', 'local', 'logo/Lt0HJzQeVDBn44HrqaGPljsd56PppG.webp', 'local', 'logo/Mq5Z1K3tDn2NYFwRJ899CXmA1sKkwB.webp', 'local', 'c4d1082c39633125a67a2b9dd979f7ce', 'everyMinute', '1', '726ffba5-8523-4071-92d4-1775dbc481c4', 'everyMinute', 1, 0, 'd M Y', 'We use cookies!', 'See more', 'http://localhost/project/cookie-policy', 1, 'We use cookies to ensure that give you the best experience on your website.', 'cookie/zrzBvRgSePiR9s7P7McjOB6NlN1RHZ.webp', 'local', 1, 1, 1, '2023-06-13 18:35:41', '2024-08-21 11:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `blog_image_driver` varchar(255) DEFAULT NULL,
  `breadcrumb_status` varchar(255) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(255) DEFAULT NULL,
  `page_title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `created_by`, `blog_image`, `blog_image_driver`, `breadcrumb_status`, `breadcrumb_image`, `breadcrumb_image_driver`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `meta_image`, `meta_image_driver`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 'blog/kiXG0NkVWYzcRpoH5pnY8DBGd7chpp.webp', 'local', '1', 'blog/uz2uY704axHeuJQNe1ptMjVUmwjQDp.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 03:44:43', '2024-06-12 09:11:50'),
(2, 7, 1, 'blog/0jPxwFRukheJfjs2MsvcqfFLg93nOZ.webp', 'local', '1', 'blog/ZcHVfvVMmRt5HVOTN0MczGd6qdwNxz.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 06:04:50', '2024-06-12 09:11:09'),
(3, 6, 1, 'blog/OhqrirEbGtv3jm9QGbtBfL0WuxAJJP.webp', 'local', '1', 'blog/tmU4nMg35ht7q4anQcG1MjC0Q9jMzv.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 06:08:09', '2024-06-12 09:10:05'),
(4, 5, 1, 'blog/A7uWY1AE61sdAtCOgCcTVdt3V15wZl.webp', 'local', '1', 'blog/Y1Kw0H4ZZVAeOExiTt1Pz5Xq8Mz3qH.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 06:09:36', '2024-06-12 09:09:07'),
(5, 4, 1, 'blog/snhMMwisRGU3avbX9nxl1TMr7gnpOh.webp', 'local', '1', 'blog/C5lcbzYhx79w96snVdJ07pMgDTx76i.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 06:11:45', '2024-06-12 08:58:16'),
(6, 3, 1, 'blog/yYSHq1N5nuU6DEsYrDSJyUmxpHdfyD.webp', 'local', '1', 'blog/4RNVwGSn527Q0rPsMaSwOBQJaHWLsk.webp', 'local', 'Blog Details', 'Blog Details', '[\"Blog Details\"]', 'Blog Details', NULL, NULL, 1, '2024-06-10 06:13:14', '2024-08-20 14:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Mountain', 'mountain', '2023-12-10 03:06:23', '2024-06-10 03:29:08'),
(2, 'Investors', 'investors', '2023-12-10 03:06:32', '2024-06-10 03:27:35'),
(3, 'Business', 'business', '2023-12-10 03:15:03', '2024-06-10 03:27:24'),
(4, 'Family', 'family', '2024-06-10 03:29:21', '2024-06-10 03:29:21'),
(5, 'People', 'people', '2024-06-10 03:29:33', '2024-06-10 03:29:33'),
(6, 'Sports', 'sports', '2024-06-10 03:29:41', '2024-06-10 03:29:41'),
(7, 'Hiking', 'hiking', '2024-06-10 03:29:48', '2024-06-10 03:29:48'),
(8, 'Swimming', 'swimming', '2024-06-10 03:29:55', '2024-06-10 03:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_details`
--

INSERT INTO `blog_details` (`id`, `blog_id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 'California Farmland: The Largest Food Producer In The US', 'california-farmland-the-largest-food-producer-in-the-us', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-06-10 03:44:43', '2024-07-30 11:01:14'),
(5, 1, 1, 'Forestland Invest: Largest Booked Land to Plant', 'california-farmland', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-06-10 04:18:05', '2024-08-21 07:35:22'),
(6, 2, 2, 'USA Livestock : What Driving The Growth Invest', 'usa-livestock-what-driving-the-growth-invest-spanish', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-06-10 06:04:50', '2024-07-30 11:00:39'),
(7, 3, 2, 'Forestland Invest: Largest Booked Land to Plant', 'forestland-invest-largest-booked-land-to-plant-english', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-06-10 06:08:09', '2024-08-21 07:34:09'),
(8, 4, 2, 'California Farmland: The Largest Food Producer In The US', 'the-largest-food-producer-in-the-us-english', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-06-10 06:09:36', '2024-08-21 07:33:16'),
(9, 5, 2, 'USA Livestock : What Driving The Growth Invest', 'what-driving-the-growth-invest', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-06-10 06:11:45', '2024-07-06 13:02:22'),
(11, 6, 1, 'Forestland Invest: Largest Booked Land to Plant', 'largest-booked-land-to-plant-english', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-07-06 13:01:43', '2024-08-21 07:28:34'),
(12, 5, 1, 'USA Livestock : What Driving The Growth Invest', 'what-driving-the-growth-invest-english', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-06 13:02:24', '2024-08-21 07:32:28'),
(13, 4, 1, 'California Farmland: The Largest Food Producer In The US', 'the-largest-food-producer-in-the-us-spanish', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-06 13:03:08', '2024-08-21 07:33:30'),
(14, 3, 1, 'Forestland Invest: Largest Booked Land to Plant', 'forestland-invest-largest-booked-land-to-plant-english-version', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-07-06 13:03:53', '2024-08-21 07:34:21'),
(15, 2, 1, 'USA Livestock : What Driving The Growth Invest', 'usa-livestock-what-driving-spainsh', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-06 13:04:31', '2024-08-21 07:35:08'),
(16, 6, 23, 'Forestland Invest: Largest Booked Land to Plant', 'largest-booked-land-to-plant', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-07-30 10:58:06', '2024-08-21 07:29:34'),
(17, 5, 23, 'USA Livestock : What Driving The Growth Invest', 'what-driving-the-growth-invest-spanish', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-30 10:58:42', '2024-07-30 10:58:42'),
(18, 4, 23, 'California Farmland: The Largest Food Producer In The US', 'the-largest-food-producer-in-the-us', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-30 10:59:21', '2024-08-21 07:33:47'),
(19, 3, 23, 'Forestland Invest: Largest Booked Land to Plant', 'forestland-invest-largest-booked', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com </p>', '2024-07-30 10:59:54', '2024-08-21 07:34:32'),
(20, 2, 23, 'USA Livestock : What Driving The Growth Invest', 'usa-livestock-what-driving-the-growth-invest-spanish', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-30 11:00:39', '2024-07-30 11:00:39'),
(21, 1, 23, 'Forestland Invest: Largest Booked Land to Plant', 'california-farmland-the-largest-food-producer', '<p style=\"font-size:16px;\">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed mamnunkhan40@gmai.com</p><p style=\"font-size:16px;\">But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p><p style=\"font-size:16px;\">Climate is uniquely well-suited to producing a variety of crops, making it a national leader in both the number and sheer diversity of crops grown. The state is one of only five regions located within a Mediterranean climate zone. Roughly speaking, these regions are located between 31 and 40 degrees latitude north and south of the equator and include Chile, South Africa, Australia, mamnunkhan40@gmai.com</p>', '2024-07-30 11:01:16', '2024-08-21 07:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `media` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `type`, `media`, `created_at`, `updated_at`) VALUES
(1, 'banner_section_1', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"banner_right_image_1\":{\"path\":\"contents\\/6ocDHikEi8KlQdhSaP6BTWl7Cw9EK6.webp\",\"driver\":\"local\"},\"banner_right_image_2\":{\"path\":\"contents\\/p9Ozgb3fT3ahqcVlBsUGmOdRjoM2BA.webp\",\"driver\":\"local\"},\"client_image_1\":{\"path\":\"contents\\/Z1dZdGleCGfOJC5MiT56RlmjkCOqQh.webp\",\"driver\":\"local\"},\"client_image_2\":{\"path\":\"contents\\/YvthcHNusZUVhfjfaFbZIMA8sMUT2O.webp\",\"driver\":\"local\"},\"client_image_3\":{\"path\":\"contents\\/htyGM9ZLIpn99snhQYu23JcDrlCU6c.webp\",\"driver\":\"local\"},\"client_image_4\":{\"path\":\"contents\\/nRrxfzewcNBLwrxl2ug2rcrpEfQoki.webp\",\"driver\":\"local\"},\"number_of_ratings\":\"4.8\"}', '2024-07-14 05:48:30', '2024-07-31 12:53:48'),
(2, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/qRyaK5C2GjgZLkVlnMq14nHvBZtl2J.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:12', '2024-07-14 05:49:12'),
(3, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/zKu41PE9HJrJ0B4CXcD8wmUNZxLIkU.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:18', '2024-07-14 05:49:18'),
(4, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/bWQjBj8LkreFpm0VINUps7NTGChqMv.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:21', '2024-07-14 05:49:21'),
(5, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/7K5HBj2cuHmaPtGUJxTOF4YuKXLnUc.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:25', '2024-07-14 05:49:25'),
(6, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/ssc56RKKBaveNXjaZN0OGtEjqjeGMS.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:29', '2024-07-14 05:49:29'),
(7, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/g0WkJpI1Dt9Vrkd0DYRA1h5BnQqLj5.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:34', '2024-07-14 05:49:34'),
(8, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/0HKaBihBU1PIFt9lzocOvfogUImcrR.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:41', '2024-07-14 05:49:41'),
(9, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/8a9PvpqqbleuGsizZv8UmbMLtrGSHA.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:45', '2024-07-14 05:49:45'),
(10, 'banner_section_1', 'multiple', '{\"partner_logo\":{\"path\":\"contents\\/OEifQlGINjaBrXcpTUDUdceFkDPl50.webp\",\"driver\":\"local\"}}', '2024-07-14 05:49:50', '2024-07-14 05:49:50'),
(11, 'subscribe_section', 'single', '{\"image\":{\"path\":\"contents\\/jXm6eDOqvAqNHjJ1PF32yy1FtUkmnZ.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\"}', '2024-07-14 07:00:12', '2024-07-28 12:19:24'),
(12, 'how_work_section', 'single', NULL, '2024-07-14 07:23:06', '2024-07-14 07:23:06'),
(13, 'how_work_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/wPdePJubMsXlMmTptJN0yUJ1X28BGN.webp\",\"driver\":\"local\"}}', '2024-07-14 07:24:21', '2024-07-14 07:24:21'),
(14, 'how_work_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/b5MU9T7Wvr11Z1VETr4MhDJuDB6Abm.webp\",\"driver\":\"local\"}}', '2024-07-14 07:24:47', '2024-07-14 07:24:47'),
(15, 'how_work_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/iZin1ZB76ZDbS0EZPhSKbq5YL1qrRq.webp\",\"driver\":\"local\"}}', '2024-07-14 07:25:25', '2024-07-14 07:25:25'),
(16, 'how_work_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/DCC1bEzoXkMTkmB6slhGcaZSNuh8zI.webp\",\"driver\":\"local\"}}', '2024-07-14 07:25:46', '2024-07-14 07:25:46'),
(17, 'position_apart_section', 'single', '{\"image\":{\"path\":\"contents\\/7Ftk2tJP4M2AIArGjfE2yax7DBSoxU.webp\",\"driver\":\"local\"},\"background_image\":{\"path\":\"contents\\/Cyjsl3eiMZJrBd178DRZA3sK0wvtQ8.webp\",\"driver\":\"local\"}}', '2024-07-14 07:38:38', '2024-07-14 07:38:38'),
(18, 'position_apart_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/wXhmQ6e5rS0p7nMHXkJzVRE9VHpKUh.webp\",\"driver\":\"local\"}}', '2024-07-14 07:41:03', '2024-07-14 07:41:03'),
(19, 'position_apart_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/B9nEH0WsF21cCJMK4ZWrj2yqsKHspS.webp\",\"driver\":\"local\"}}', '2024-07-14 07:42:42', '2024-07-14 07:42:42'),
(20, 'position_apart_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/m41yPJKh5TpEmjTlC25w2B0ehDMJmI.webp\",\"driver\":\"local\"}}', '2024-07-14 07:43:55', '2024-07-14 07:43:55'),
(21, 'position_apart_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/woW6pHTNo25VTl1C8IE1v2WKGAG9L0.webp\",\"driver\":\"local\"}}', '2024-07-14 07:44:17', '2024-07-14 07:44:17'),
(22, 'project_section', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\"}', '2024-07-14 09:10:52', '2024-07-14 09:10:52'),
(23, 'agriculture_section', 'single', '{\"image\":{\"path\":\"contents\\/Ueo3X9wMrLFTBZFitjxZUjqZfkxlsT.webp\",\"driver\":\"local\"}}', '2024-07-14 11:40:18', '2024-07-14 11:40:18'),
(24, 'agriculture_section', 'multiple', NULL, '2024-07-14 11:40:39', '2024-07-14 11:40:39'),
(25, 'agriculture_section', 'multiple', NULL, '2024-07-14 11:40:46', '2024-07-14 11:40:46'),
(26, 'agriculture_section', 'multiple', NULL, '2024-07-14 11:40:58', '2024-07-14 11:40:58'),
(27, 'farming_section', 'single', NULL, '2024-07-14 11:52:35', '2024-07-14 11:52:35'),
(28, 'pricing_section', 'single', NULL, '2024-07-14 12:06:42', '2024-07-14 12:06:42'),
(29, 'testimonial_section', 'single', NULL, '2024-07-14 12:24:45', '2024-07-14 12:24:45'),
(30, 'testimonial_section', 'multiple', '{\"image\":{\"path\":\"contents\\/skoXBtoOsAn6YOPdg57Pyo2kT6J3S9.webp\",\"driver\":\"local\"},\"rating\":\"4\"}', '2024-07-14 12:25:35', '2024-07-14 12:25:35'),
(31, 'testimonial_section', 'multiple', '{\"image\":{\"path\":\"contents\\/pFdo4ptqourSzy21NvdTWx1RKqVf8D.webp\",\"driver\":\"local\"},\"rating\":\"4\"}', '2024-07-14 12:26:06', '2024-07-14 12:26:06'),
(32, 'testimonial_section', 'multiple', '{\"image\":{\"path\":\"contents\\/yWjRvkGyS5xr6zwu00AO5fKGyOed4g.webp\",\"driver\":\"local\"},\"rating\":\"4\"}', '2024-07-14 12:26:38', '2024-07-14 12:26:38'),
(33, 'blog_section', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\"}', '2024-07-14 12:33:18', '2024-07-14 12:33:18'),
(34, 'counter_section', 'multiple', '{\"count\":\"182\"}', '2024-07-14 12:42:06', '2024-07-14 12:42:06'),
(35, 'counter_section', 'multiple', '{\"count\":\"162\"}', '2024-07-14 12:43:05', '2024-07-14 12:43:05'),
(36, 'counter_section', 'multiple', '{\"count\":\"16\"}', '2024-07-14 12:43:28', '2024-07-14 12:43:28'),
(37, 'counter_section', 'multiple', '{\"count\":\"30\"}', '2024-07-14 12:44:04', '2024-07-14 12:44:04'),
(38, 'banner_section_2', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"banner_right_image\":{\"path\":\"contents\\/seRgE1bY0ZbnP8HLVgeBytWfbRhE84.webp\",\"driver\":\"local\"},\"background_image\":{\"path\":\"contents\\/K5W1NCohoVpJPRDhKN8eDKZeRMzDdF.webp\",\"driver\":\"local\"},\"video_link\":\"https:\\/\\/www.youtube.com\\/watch?v=uxxjDiC1pg8\"}', '2024-07-14 13:13:49', '2024-07-30 11:22:22'),
(39, 'about_section_2', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"banner_image\":{\"path\":\"contents\\/7S9SaaiMd9jrJpxhkXT4ZkobclqT2z.webp\",\"driver\":\"local\"}}', '2024-07-15 04:27:22', '2024-07-15 04:27:22'),
(40, 'about_section_2', 'multiple', '{\"image\":{\"path\":\"contents\\/V6DX0aw6uS9zGdhPzEarjtyYWs5XmQ.webp\",\"driver\":\"local\"}}', '2024-07-15 04:27:35', '2024-07-15 04:27:35'),
(41, 'about_section_2', 'multiple', '{\"image\":{\"path\":\"contents\\/JnisS3d3S039sjEdrqndykrtKYCJMN.webp\",\"driver\":\"local\"}}', '2024-07-15 04:27:38', '2024-07-15 04:27:38'),
(42, 'about_section_2', 'multiple', '{\"image\":{\"path\":\"contents\\/YqvPvkYTA9s7lGIMLCdh50wi1V8oXo.webp\",\"driver\":\"local\"}}', '2024-07-15 04:27:41', '2024-07-15 04:27:41'),
(43, 'investment_way_section', 'single', NULL, '2024-07-15 04:43:40', '2024-07-15 04:43:40'),
(44, 'investment_way_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/Ldmb2AuTuJGo76Zz3LP1qcAZvSFJlr.webp\",\"driver\":\"local\"}}', '2024-07-15 04:44:19', '2024-07-15 04:44:19'),
(45, 'investment_way_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/MbjhhLiKUaYWVlzOTaAMas8legOWNX.webp\",\"driver\":\"local\"}}', '2024-07-15 04:44:36', '2024-07-15 04:44:36'),
(46, 'investment_way_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/36YgEEydO3SUoeWWjamnulkxH8Ayxu.webp\",\"driver\":\"local\"}}', '2024-07-15 04:44:51', '2024-07-15 04:44:51'),
(47, 'investment_way_section', 'multiple', '{\"icon_image\":{\"path\":\"contents\\/CBVf0kSsJEbOzUq2szRExKHT8Edz1Z.webp\",\"driver\":\"local\"}}', '2024-07-15 04:45:05', '2024-07-15 04:45:05'),
(48, 'product_section', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\"}', '2024-07-15 04:57:38', '2024-07-15 04:59:41'),
(49, 'counter_section_2', 'single', '{\"background_image\":{\"path\":\"contents\\/Yl76VeGgbQNvyVdaeuzLduazGG3z4F.webp\",\"driver\":\"local\"}}', '2024-07-15 05:15:19', '2024-07-15 05:18:05'),
(50, 'counter_section_2', 'multiple', '{\"count\":\"182\"}', '2024-07-15 05:15:52', '2024-07-15 05:15:52'),
(51, 'counter_section_2', 'multiple', '{\"count\":\"162\"}', '2024-07-15 05:16:12', '2024-07-15 05:16:12'),
(52, 'counter_section_2', 'multiple', '{\"count\":\"16\"}', '2024-07-15 05:16:36', '2024-07-15 05:16:36'),
(53, 'counter_section_2', 'multiple', '{\"count\":\"30\"}', '2024-07-15 05:16:53', '2024-07-15 05:16:53'),
(54, 'pricing_section_2', 'single', NULL, '2024-07-15 05:44:57', '2024-07-15 05:44:57'),
(55, 'investor_review_section', 'single', NULL, '2024-07-15 05:56:58', '2024-07-15 05:56:58'),
(56, 'investor_review_section', 'multiple', '{\"rating\":\"4.8\",\"investor_image\":{\"path\":\"contents\\/Biip2yNRpL2n6TO7OUvaLSc0nL7Run.webp\",\"driver\":\"local\"}}', '2024-07-15 05:58:13', '2024-07-15 05:58:13'),
(57, 'investor_review_section', 'multiple', '{\"rating\":\"4.8\",\"investor_image\":{\"path\":\"contents\\/38SLxYpv6KMO7m1wmZKSN6dFo8B5Ty.webp\",\"driver\":\"local\"}}', '2024-07-15 05:59:09', '2024-07-15 05:59:09'),
(58, 'investor_review_section', 'multiple', '{\"rating\":\"5\",\"investor_image\":{\"path\":\"contents\\/uIjvpeAQAcHZ6U0w4sTHPufOQAx93m.webp\",\"driver\":\"local\"}}', '2024-07-15 05:59:40', '2024-07-15 05:59:40'),
(59, 'investor_review_section', 'multiple', '{\"rating\":\"4\",\"investor_image\":{\"path\":\"contents\\/0ZRSJYJ7zeaquDJRPzIL8fTEUnLrxS.webp\",\"driver\":\"local\"}}', '2024-07-15 06:00:05', '2024-07-15 06:00:05'),
(60, 'investor_review_section', 'multiple', '{\"rating\":\"4.8\",\"investor_image\":{\"path\":\"contents\\/nELfkQTdigkB3HRRR3IgNPTbdZcNCg.webp\",\"driver\":\"local\"}}', '2024-07-15 06:00:46', '2024-07-15 06:00:46'),
(61, 'investor_review_section', 'multiple', '{\"rating\":\"4.8\",\"investor_image\":{\"path\":\"contents\\/aLO7KqaIzRMnqzhoHJWH4AMlk0Delk.webp\",\"driver\":\"local\"}}', '2024-07-15 06:01:21', '2024-07-15 06:01:21'),
(62, 'investor_review_section', 'multiple', '{\"rating\":\"4.8\",\"investor_image\":{\"path\":\"contents\\/BkivDN1Q3mADxEXaLTJn3hTvT7wDWx.webp\",\"driver\":\"local\"}}', '2024-07-15 06:01:58', '2024-07-15 06:01:58'),
(63, 'investor_review_section', 'multiple', '{\"rating\":\"5\",\"investor_image\":{\"path\":\"contents\\/gEHk3ILjE7F0cLUmBhf07uO1SHbvgn.webp\",\"driver\":\"local\"}}', '2024-07-15 06:02:28', '2024-07-15 06:02:28'),
(64, 'blog_section_2', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\"}', '2024-07-15 06:15:53', '2024-07-15 06:15:53'),
(65, 'about_section', 'single', '{\"about_image\":{\"path\":\"contents\\/5cNFlE5hGCJCSwFcPDbodIFPaZi9uZ.webp\",\"driver\":\"local\"}}', '2024-07-15 06:20:56', '2024-07-15 06:20:56'),
(66, 'about_section', 'multiple', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"icon\":\"fa-regular fa-bullseye-arrow\"}', '2024-07-15 06:21:33', '2024-07-15 06:21:33'),
(67, 'about_section', 'multiple', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"icon\":\"fa-regular fa-eye\"}', '2024-07-15 06:21:53', '2024-07-15 06:21:53'),
(68, 'about_section', 'multiple', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"icon\":\"fa-regular fa-thumbs-up\"}', '2024-07-15 06:22:06', '2024-07-15 06:22:06'),
(69, 'about_section', 'multiple', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/products?category=php-scripts\",\"icon\":\"fa-solid fa-hand-holding-seedling\"}', '2024-07-15 06:22:21', '2024-07-15 06:22:21'),
(70, 'contact_section', 'single', '{\"contact_image\":{\"path\":\"contents\\/Elhha3V13qMWf1PrCXpt2U78ntyg8G.webp\",\"driver\":\"local\"}}', '2024-07-15 06:30:40', '2024-07-15 06:30:40'),
(71, 'address_section', 'single', '{\"location_url\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d2970.2214064520235!2d-87.62528026188396!3d41.888095272133185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880fcd829e1f58d9%3A0x7c115a62c7f249e6!2sChicago%20River!5e0!3m2!1sen!2sbd!4v1715840516443!5m2!1sen!2sbd\",\"phone\":\"1645364879\",\"address_page_image\":{\"path\":\"contents\\/jxWh4XoKzdDaqMIGwZThVRfwTSMkyC.webp\",\"driver\":\"local\"}}', '2024-07-15 06:34:29', '2024-07-15 06:34:29'),
(72, 'faq_section', 'single', '{\"faq_image\":{\"path\":\"contents\\/DvTYyOF1gqK6YoLEGTXJgX7MkYzxXJ.webp\",\"driver\":\"local\"}}', '2024-07-15 06:39:41', '2024-07-15 06:39:41'),
(73, 'faq_section', 'multiple', NULL, '2024-07-15 06:40:53', '2024-07-15 06:40:53'),
(74, 'faq_section', 'multiple', NULL, '2024-07-15 06:41:20', '2024-07-15 06:41:20'),
(75, 'faq_section', 'multiple', NULL, '2024-07-15 06:41:33', '2024-07-15 06:41:33'),
(76, 'faq_section', 'multiple', NULL, '2024-07-15 06:41:47', '2024-07-15 06:41:47'),
(77, 'faq_section', 'multiple', NULL, '2024-07-15 06:41:57', '2024-07-15 06:41:57'),
(78, 'login_registration', 'single', '{\"login_page_image\":{\"path\":\"contents\\/VpK7EXeKluYyuvK00B36Td8BFO2Mgt.webp\",\"driver\":\"local\"},\"register_page_image\":{\"path\":\"contents\\/2GDbzR2sclEs6GCbfkHkcFl987TQ6Z.webp\",\"driver\":\"local\"}}', '2024-07-15 06:49:16', '2024-07-15 06:49:16'),
(79, 'footer_section', 'single', '{\"phone_number\":\"1645364879\"}', '2024-07-15 06:58:56', '2024-07-15 06:58:56'),
(80, 'footer_section', 'multiple', '{\"icon\":\"fa-brands fa-facebook-f\",\"link\":\"https:\\/\\/www.facebook.com\\/\"}', '2024-07-15 06:59:35', '2024-07-15 06:59:35'),
(81, 'footer_section', 'multiple', '{\"icon\":\"icon-x-twitter\",\"link\":\"https:\\/\\/twitter.com\\/\"}', '2024-07-15 06:59:47', '2024-07-15 06:59:47'),
(82, 'footer_section', 'multiple', '{\"icon\":\"fa-brands fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}', '2024-07-15 06:59:59', '2024-07-15 06:59:59'),
(83, 'footer_section', 'multiple', '{\"icon\":\"fa-brands fa-linkedin-in\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"}', '2024-07-15 07:00:10', '2024-07-15 07:00:10'),
(84, 'top_section', 'single', NULL, '2024-07-15 07:21:39', '2024-07-15 07:21:39'),
(85, 'terms_condition', 'multiple', NULL, '2024-07-15 10:11:21', '2024-07-15 10:11:21'),
(86, 'terms_condition', 'multiple', NULL, '2024-07-15 10:11:34', '2024-07-15 10:11:34'),
(87, 'terms_condition', 'multiple', NULL, '2024-07-15 10:11:48', '2024-07-15 10:11:48'),
(88, 'terms_condition', 'multiple', NULL, '2024-07-15 10:12:00', '2024-07-15 10:12:00'),
(89, 'terms_condition', 'multiple', NULL, '2024-07-15 10:12:13', '2024-07-15 10:12:13'),
(90, 'terms_condition', 'multiple', NULL, '2024-07-15 10:12:22', '2024-07-15 10:12:22'),
(91, 'terms_condition', 'multiple', NULL, '2024-07-15 10:12:35', '2024-07-15 10:12:35'),
(92, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:13:10', '2024-07-15 10:13:10'),
(93, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:13:20', '2024-07-15 10:13:20'),
(94, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:13:31', '2024-07-15 10:13:31'),
(95, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:13:41', '2024-07-15 10:13:41'),
(96, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:13:55', '2024-07-15 10:13:55'),
(97, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:14:07', '2024-07-15 10:14:07'),
(98, 'cookie_policy', 'multiple', NULL, '2024-07-15 10:14:26', '2024-07-15 10:14:26'),
(99, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:15:27', '2024-07-15 10:15:27'),
(100, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:15:38', '2024-07-15 10:15:38'),
(101, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:15:50', '2024-07-15 10:15:50'),
(102, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:16:01', '2024-07-15 10:16:01'),
(103, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:16:14', '2024-07-15 10:16:14'),
(104, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:16:24', '2024-07-15 10:16:24'),
(105, 'privacy_policy', 'multiple', NULL, '2024-07-15 10:16:53', '2024-07-15 10:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"heading_1\":\"Sustainable Farm Investing Made Simple\",\"short_description\":\"Join a community of forward-thinking investors and farmers committed to sustainable and profitable agricultural ventures. At Agriwealth, we connect you with innovative projects that drive growth, promote sustainability, and ensure food security.\",\"button_name\":\"Get Started\",\"heading_2\":\"24.5k\",\"short_text\":\"Successful Project\",\"heading_3\":\"Invest for Future\",\"short_text_2\":\"Lorem ipsum dolor sit amet\",\"heading_4\":\"Safe and Secure Farm\",\"short_text_3\":\"Lorem ipsum dolor sit amet\",\"heading_5\":\"Happy Investors\",\"short_text_4\":\"(12.5k Reviews)\"}', '2024-07-14 05:48:30', '2024-07-28 10:37:20'),
(2, 2, 1, NULL, '2024-07-14 05:49:12', '2024-07-14 05:49:12'),
(3, 3, 1, NULL, '2024-07-14 05:49:18', '2024-07-14 05:49:18'),
(4, 4, 1, NULL, '2024-07-14 05:49:21', '2024-07-14 05:49:21'),
(5, 5, 1, NULL, '2024-07-14 05:49:25', '2024-07-14 05:49:25'),
(6, 6, 1, NULL, '2024-07-14 05:49:29', '2024-07-14 05:49:29'),
(7, 7, 1, NULL, '2024-07-14 05:49:34', '2024-07-14 05:49:34'),
(8, 8, 1, NULL, '2024-07-14 05:49:41', '2024-07-14 05:49:41'),
(9, 9, 1, NULL, '2024-07-14 05:49:45', '2024-07-14 05:49:45'),
(10, 10, 1, NULL, '2024-07-14 05:49:50', '2024-07-14 05:49:50'),
(11, 11, 1, '{\"heading\":\"Create an account and start growing your Money\",\"short_text\":\"Stay updated with the latest insights and opportunities in agricultural investments. Subscribe to our newsletter for expert advice, exclusive offers, and more\",\"button_name\":\"Create An Account\"}', '2024-07-14 07:00:12', '2024-07-28 12:18:13'),
(12, 12, 1, '{\"heading\":\"How we work Together\",\"short_description\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-14 07:23:06', '2024-07-14 07:23:33'),
(13, 13, 1, '{\"heading\":\"Farm Selection &amp; Entity Creation\",\"short_description\":\"We carefully select high-potential farms and create investment entities that match your financial goals.\"}', '2024-07-14 07:24:21', '2024-07-28 10:40:59'),
(14, 14, 1, '{\"heading\":\"Farm Investment -Easily and Safely\",\"short_description\":\"Invest confidently with our secure platform, ensuring your money is safe and optimally invested.\"}', '2024-07-14 07:24:47', '2024-07-28 10:42:28'),
(15, 15, 1, '{\"heading\":\"Farm Management- Produce Goods &amp; Sell\",\"short_description\":\"Our experienced farm managers oversee the cultivation, production, and sale of agricultural goods.\"}', '2024-07-14 07:25:25', '2024-07-28 10:43:06'),
(16, 16, 1, '{\"heading\":\"Distributions - Withdraw or Reinvests\",\"short_description\":\"Our experienced farm managers oversee the cultivation, production, and sale of agricultural goods.\"}', '2024-07-14 07:25:46', '2024-08-19 12:29:28'),
(17, 17, 1, '{\"heading\":\"What Sets Our Position Apart\",\"short_description\":\"At Agriwealth, we offer unique advantages that make our agricultural investments stand out. Explore the key benefits of partnering with us\"}', '2024-07-14 07:38:38', '2024-07-28 10:49:03'),
(18, 18, 1, '{\"heading\":\"Safe Haven Investment\",\"short_description\":\"Invest with peace of mind knowing your assets are in a secure and stable environment.\"}', '2024-07-14 07:41:03', '2024-07-28 10:49:41'),
(19, 19, 1, '{\"heading\":\"Uncorrelated Returns\",\"short_description\":\"Benefit from returns that are independent of traditional market fluctuations, providing stability and\"}', '2024-07-14 07:42:42', '2024-07-28 10:49:53'),
(20, 20, 1, '{\"heading\":\"Superior Inflation Hedge\",\"short_description\":\"Protect your investments against inflation with agricultural assets that tend to increase in value over time.\"}', '2024-07-14 07:43:55', '2024-07-28 10:50:04'),
(21, 21, 1, '{\"heading\":\"Attractive Yields\",\"short_description\":\"Enjoy competitive yields from well-managed agricultural investments, designed to maximize your returns.\"}', '2024-07-14 07:44:17', '2024-07-28 10:50:16'),
(22, 22, 1, '{\"heading\":\"Our Top Project For Investors\",\"short_description\":\"Explore our premier investment opportunity, designed for growth and sustainability. Join Agriwealth in a thriving, future-focused agricultural venture\",\"button_name\":\"View All\"}', '2024-07-14 09:10:52', '2024-07-28 10:51:47'),
(23, 23, 1, '{\"heading\":\"Sustainable Agriculture practices\",\"short_description\":\"Promoting environmentally-friendly farming methods to ensure long-term productivity and ecological balance.\",\"heading_2\":\"25 Years Expert\",\"sub_heading\":\"Crop Rotation and Diversity\",\"short_text\":\"With over 25 years of expertise, we implement crop rotation and diversity practices to enhance soil health and boost crop yields, ensuring sustainable and productive farming.\"}', '2024-07-14 11:40:18', '2024-07-28 10:54:53'),
(24, 24, 1, '{\"heading\":\"Expert investment team\",\"short_description\":\"Our team of seasoned experts brings years of experience and deep knowledge in agricultural investments, ensuring your investments are in capable hands.\"}', '2024-07-14 11:40:39', '2024-07-28 10:53:20'),
(25, 25, 1, '{\"heading\":\"Disciplined investment philosophy\",\"short_description\":\"We adhere to a disciplined investment approach, focusing on sustainable and profitable agricultural ventures to maximize your returns.\"}', '2024-07-14 11:40:46', '2024-07-28 10:53:36'),
(26, 26, 1, '{\"heading\":\"Proprietary sourcing technology\",\"short_description\":\"Utilizing advanced technology, we identify the best agricultural opportunities, providing you with exclusive investment options.\"}', '2024-07-14 11:40:58', '2024-07-28 10:53:46'),
(27, 27, 1, '{\"heading\":\"Running Project Farming Technology\",\"short_description\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-14 11:52:35', '2024-07-14 11:52:35'),
(28, 28, 1, '{\"heading\":\"Choose Best Offered Plan From Agriwealth\",\"short_description\":\"Gain unparalleled access to farmland investments, carefully vetted through rigorous due diligence to ensure optimal returns.\"}', '2024-07-14 12:06:43', '2024-07-29 11:42:47'),
(29, 29, 1, '{\"heading\":\"Our Investor Delightful History Here\",\"short_description\":\"Discover the success stories of our investors and see why Agriwealth is the preferred choice for agricultural investments.\"}', '2024-07-14 12:24:45', '2024-07-28 10:58:29'),
(30, 30, 1, '{\"investor_name\":\"Andrew Nicol\",\"position\":\"COO, Global Farming Solutions\",\"heading\":\"Best Profitable Invest Return\",\"short_text\":\"Agriwealth has significantly boosted my financial portfolio. Their commitment to delivering high returns is unmatched. I highly recommend their services.\"}', '2024-07-14 12:25:35', '2024-08-19 12:33:05'),
(31, 31, 1, '{\"investor_name\":\"Thomson David\",\"position\":\"Director, American Tobaka\",\"heading\":\"Consistent and High Returns\",\"short_text\":\"Agriwealth\'s investment strategies are top-notch. They have consistently delivered high returns, making them my go-to choice for agricultural investments.\"}', '2024-07-14 12:26:06', '2024-07-28 11:02:10'),
(32, 32, 1, '{\"investor_name\":\"Silvana Siliya\",\"position\":\"Director, American Tobaka\",\"heading\":\"Outstanding Investment\",\"short_text\":\"Agriwealth\'s investment strategies are top-notch. They have consistently delivered high returns, making them my go-to choice for agricultural investments.\"}', '2024-07-14 12:26:38', '2024-08-19 13:02:52'),
(33, 33, 1, '{\"heading\":\"Learn About Agriwealth Stories\",\"short_description\":\"Stay informed with the latest insights and trends in agricultural investments. Explore expert articles, success stories, and tips to maximize your returns with Agriwealth\",\"button_name\":\"View All\"}', '2024-07-14 12:33:18', '2024-07-29 11:43:12'),
(34, 34, 1, '{\"countable_item_name\":\"Total Asset Raised\",\"prefix\":\"M+\"}', '2024-07-14 12:42:06', '2024-07-14 12:42:06'),
(35, 35, 1, '{\"countable_item_name\":\"Properties Funded\",\"prefix\":\"+\"}', '2024-07-14 12:43:05', '2024-07-14 12:44:13'),
(36, 36, 1, '{\"countable_item_name\":\"Target Net IRR\",\"prefix\":\"%\"}', '2024-07-14 12:43:28', '2024-07-14 12:43:28'),
(37, 37, 1, '{\"countable_item_name\":\"Total Investor\",\"prefix\":\"K+\"}', '2024-07-14 12:44:04', '2024-07-14 12:44:04'),
(38, 38, 1, '{\"heading\":\"Earn More From Farming Investment\",\"short_description\":\"Join a community of forward-thinking investors and farmers committed to sustainable and profitable agricultural ventures. At Agriwealth, we connect you with innovative projects that drive growth, promote sustainability, and ensure food security.\",\"button_name\":\"Get Started\"}', '2024-07-14 13:13:49', '2024-07-28 11:09:46'),
(39, 39, 1, '{\"heading\":\"Farming Investment Growing Success\",\"short_description\":\"With decades of experience in the agricultural sector, our team is dedicated to identifying and managing profitable investment opportunities. Our experts bring extensive knowledge and hands-on experience to every project.\",\"button_name\":\"View More\"}', '2024-07-15 04:27:22', '2024-07-28 11:10:31'),
(40, 40, 1, NULL, '2024-07-15 04:27:35', '2024-07-15 04:27:35'),
(41, 41, 1, NULL, '2024-07-15 04:27:38', '2024-07-15 04:27:38'),
(42, 42, 1, NULL, '2024-07-15 04:27:41', '2024-07-15 04:27:41'),
(43, 43, 1, '{\"heading\":\"Investment Way To Farmtrader\",\"short_text\":\"Different investment terms ensure your money is secure, allowing you to choose the best plan for your future assets.\"}', '2024-07-15 04:43:40', '2024-07-28 11:11:47'),
(44, 44, 1, '{\"heading\":\"Pick Your Project &amp; Sponsor Accordingly\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-15 04:44:19', '2024-08-19 12:34:28'),
(45, 45, 1, '{\"heading\":\"Farm Investment And Maintain\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-15 04:44:36', '2024-07-28 11:13:46'),
(46, 46, 1, '{\"heading\":\"Get Farm Update from Our Software\",\"short_text\":\"Stay informed with real-time updates on your investments. Our advanced software provides detailed reports and  helping you track progress and returns.\"}', '2024-07-15 04:44:51', '2024-07-28 11:14:10'),
(47, 47, 1, '{\"heading\":\"Get Your Return After Fixed Duration\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-15 04:45:05', '2024-08-19 12:34:34'),
(48, 48, 1, '{\"heading\":\"Agriwealth Products For Investors\",\"short_text\":\"Explore our premier investment opportunity, designed for growth and sustainability. Join Agriwealth in a thriving, future-focused agricultural venture\",\"button_name\":\"View All\"}', '2024-07-15 04:57:38', '2024-07-29 11:44:22'),
(49, 49, 1, '{\"heading\":\"Growing For The Future Agriwealth\",\"short_text\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-15 05:15:19', '2024-07-29 11:45:20'),
(50, 50, 1, '{\"countable_item_name\":\"Total Asset Raised\",\"prefix\":\"M+\"}', '2024-07-15 05:15:52', '2024-07-15 05:15:52'),
(51, 51, 1, '{\"countable_item_name\":\"Properties Funded\",\"prefix\":\"+\"}', '2024-07-15 05:16:12', '2024-07-15 05:16:12'),
(52, 52, 1, '{\"countable_item_name\":\"Target Net IRR\",\"prefix\":\"%\"}', '2024-07-15 05:16:36', '2024-07-15 05:16:36'),
(53, 53, 1, '{\"countable_item_name\":\"Total Investor\",\"prefix\":\"K+\"}', '2024-07-15 05:16:53', '2024-07-15 05:16:53'),
(54, 54, 1, '{\"heading\":\"Flexible Pricing Solution Agriwealth\",\"short_text\":\"Unparalleled access to farmland investments vetted by rigorous due-diligence.\"}', '2024-07-15 05:44:57', '2024-07-29 11:45:37'),
(55, 55, 1, '{\"heading\":\"Investors Reviews\",\"short_text\":\"Hear from our satisfied investors who have experienced exceptional returns and sustainable growth with Agriwealth.\"}', '2024-07-15 05:56:58', '2024-07-28 11:17:21'),
(56, 56, 1, '{\"investor_name\":\"Darell Seward\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 05:58:13', '2024-08-19 12:37:01'),
(57, 57, 1, '{\"investor_name\":\"Michael Rodriguez\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 05:59:09', '2024-08-19 12:42:52'),
(58, 58, 1, '{\"investor_name\":\"Sophia Chen\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 05:59:40', '2024-08-19 12:43:01'),
(59, 59, 1, '{\"investor_name\":\"James Anderson\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 06:00:05', '2024-08-19 12:44:46'),
(60, 60, 1, '{\"investor_name\":\"Laura Martinez\",\"position\":\"Partner, FutureFarms Capital\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 06:00:46', '2024-08-19 12:37:24'),
(61, 61, 1, '{\"investor_name\":\"David Lee\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 06:01:21', '2024-08-19 12:43:47'),
(62, 62, 1, '{\"investor_name\":\"Olivia Brown\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 06:01:58', '2024-08-19 12:44:06'),
(63, 63, 1, '{\"investor_name\":\"Liam Wilson\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-15 06:02:28', '2024-08-19 12:44:25'),
(64, 64, 1, '{\"heading\":\"Agricultural Agriwealth Stories\",\"short_text\":\"Stay informed with the latest insights and trends in agricultural investments. Explore expert articles, success stories, and tips to maximize your returns with Agriwealth\",\"button_name\":\"View All\"}', '2024-07-15 06:15:53', '2024-07-29 11:45:56'),
(65, 65, 1, '{\"heading\":\"Best Investment Experience\",\"short_description\":\"<p><strong>Leading Agricultural Investments<\\/strong><br>At Agriwealth, we believe in harnessing the power of agriculture to generate sustainable wealth and secure the future. Our mission is to connect investors with high-potential agricultural projects that offer both financial returns and positive environmental impact.<\\/p><p><strong>Our Vision<\\/strong><br>To lead the agricultural investment industry by fostering sustainable practices and delivering exceptional returns for our investors.<\\/p><p><strong>Our Mission<\\/strong><br>To provide unparalleled investment opportunities in agriculture, driven by rigorous due diligence, expert management, and innovative solutions.<\\/p>\"}', '2024-07-15 06:20:56', '2024-07-28 11:08:50'),
(66, 66, 1, '{\"button_name\":\"Our Mission\"}', '2024-07-15 06:21:33', '2024-07-15 06:21:33'),
(67, 67, 1, '{\"button_name\":\"Our Vision\"}', '2024-07-15 06:21:53', '2024-07-15 06:21:53'),
(68, 68, 1, '{\"button_name\":\"Client Trust\"}', '2024-07-15 06:22:06', '2024-07-15 06:22:06'),
(69, 69, 1, '{\"button_name\":\"Support Team\"}', '2024-07-15 06:22:21', '2024-07-15 06:22:21'),
(70, 70, 1, NULL, '2024-07-15 06:30:40', '2024-07-15 06:30:40'),
(71, 71, 1, '{\"heading\":\"Address Details\",\"short_text\":\"We have so many address to execute different work properly and we would like to share our head office address below\",\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"email\":\"farmtrader@global.com\"}', '2024-07-15 06:34:29', '2024-07-15 06:34:29'),
(72, 72, 1, NULL, '2024-07-15 06:39:41', '2024-07-15 06:39:41'),
(73, 73, 1, '{\"question\":\"How Does This Work?\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-15 06:40:53', '2024-07-15 06:40:53'),
(74, 74, 1, '{\"question\":\"How Safe Are My Fund After Submission\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-15 06:41:20', '2024-07-15 06:41:20'),
(75, 75, 1, '{\"question\":\"Are This Farm Secured  for Long Term\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-15 06:41:33', '2024-07-15 06:41:33'),
(76, 76, 1, '{\"question\":\"Is The Rio Of The Firm be Stable over the Years\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-15 06:41:47', '2024-07-15 06:41:47'),
(77, 77, 1, '{\"question\":\"Sustainable Farm Investment Process\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-15 06:41:57', '2024-07-15 06:41:57'),
(78, 78, 1, '{\"login_heading\":\"Welcome back, Log In\",\"login_subheading\":\"Sign in to your account ans make booking faster and easy process.\",\"register_heading\":\"Creative Account\",\"register_subheading\":\"Discover the world\\u2019s best Farm investment Platform for the future Asset .\"}', '2024-07-15 06:49:16', '2024-07-15 06:49:16'),
(79, 79, 1, '{\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"subscribe_heading\":\"Stay Update\",\"subscribe_text\":\"Get real time Update from us.\"}', '2024-07-15 06:58:56', '2024-07-15 06:58:56'),
(80, 80, 1, NULL, '2024-07-15 06:59:35', '2024-07-15 06:59:35'),
(81, 81, 1, NULL, '2024-07-15 06:59:47', '2024-07-15 06:59:47'),
(82, 82, 1, NULL, '2024-07-15 06:59:59', '2024-07-15 06:59:59'),
(83, 83, 1, NULL, '2024-07-15 07:00:10', '2024-07-15 07:00:10'),
(84, 84, 1, '{\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"email\":\"agriwealth@global.com\"}', '2024-07-15 07:21:39', '2024-07-15 07:21:39'),
(85, 85, 1, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/span><br><\\/p>\"}', '2024-07-15 10:11:21', '2024-07-15 10:11:21'),
(86, 86, 1, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-15 10:11:34', '2024-07-15 10:11:34'),
(87, 87, 1, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-15 10:11:48', '2024-07-15 10:11:48'),
(88, 88, 1, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-15 10:12:00', '2024-07-15 10:12:00'),
(89, 89, 1, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-15 10:12:13', '2024-07-15 10:12:13'),
(90, 90, 1, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-15 10:12:22', '2024-07-15 10:12:22'),
(91, 91, 1, '{\"heading\":\"CONTACT US\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/span><br><\\/p>\"}', '2024-07-15 10:12:35', '2024-07-15 10:12:35'),
(92, 92, 1, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/span><br><\\/p>\"}', '2024-07-15 10:13:10', '2024-07-15 10:13:10'),
(93, 93, 1, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-15 10:13:20', '2024-07-15 10:13:20'),
(94, 94, 1, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-15 10:13:31', '2024-07-15 10:13:31'),
(95, 95, 1, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-15 10:13:41', '2024-07-15 10:13:41'),
(96, 96, 1, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-15 10:13:55', '2024-07-15 10:13:55'),
(97, 97, 1, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-15 10:14:07', '2024-07-15 10:14:07'),
(98, 98, 1, '{\"heading\":\"CONTACT US\",\"description\":\"<p style=\\\"font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/p><p style=\\\"font-size:15px;\\\"><a href=\\\"mailto:Email:supportRESTINA@gmail.com\\\">Email:\\u00a0support.Agriwealth@gmail.com<\\/a><span style=\\\"font-size:16px;color:rgb(33,37,41);font-family:\'system-ui\', \'-apple-system\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Noto Sans\', \'Liberation Sans\', Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\';\\\"><\\/span><\\/p><p style=\\\"font-size:15px;\\\">Location: 800S, Salt Lake City, USA<\\/p>\"}', '2024-07-15 10:14:26', '2024-07-30 10:55:52'),
(99, 99, 1, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/span><br><\\/p>\"}', '2024-07-15 10:15:27', '2024-07-15 10:15:27'),
(100, 100, 1, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-15 10:15:38', '2024-07-15 10:15:38'),
(101, 101, 1, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-15 10:15:50', '2024-07-15 10:15:50'),
(102, 102, 1, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-15 10:16:01', '2024-07-15 10:16:01'),
(103, 103, 1, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-15 10:16:14', '2024-07-15 10:16:14'),
(104, 104, 1, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-15 10:16:24', '2024-07-15 10:16:24'),
(105, 105, 1, '{\"heading\":\"CONTACT US\",\"description\":\"<p style=\\\"font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/p><p style=\\\"font-size:15px;\\\"><a href=\\\"mailto:Email:supportRESTINA@gmail.com\\\">Email:\\u00a0support.Agriwealth@gmail.com<\\/a><span style=\\\"font-size:16px;color:rgb(33,37,41);font-family:\'system-ui\', \'-apple-system\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Noto Sans\', \'Liberation Sans\', Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\';\\\"><\\/span><\\/p><p style=\\\"font-size:15px;\\\">Location: 800S, Salt Lake City, USA<\\/p>\"}', '2024-07-15 10:16:53', '2024-07-30 10:48:11'),
(106, 1, 23, '{\"heading_1\":\"Sustainable Farm Investing Made Simple\",\"short_description\":\"Join a community of forward-thinking investors and farmers committed to sustainable and profitable agricultural ventures. At Agriwealth, we connect you with innovative projects that drive growth, promote sustainability, and ensure food security.\",\"button_name\":\"Get Started\",\"heading_2\":\"24.5k\",\"short_text\":\"Successful Project\",\"heading_3\":\"Invest for Future\",\"short_text_2\":\"Lorem ipsum dolor sit amet\",\"heading_4\":\"Safe and Secure Farm\",\"short_text_3\":\"Lorem ipsum dolor sit amet\",\"heading_5\":\"Happy Investors\",\"short_text_4\":\"(12.5k Reviews)\"}', '2024-07-30 09:43:58', '2024-07-30 09:43:58'),
(107, 2, 23, NULL, '2024-07-30 09:44:18', '2024-07-30 09:44:18'),
(108, 3, 23, NULL, '2024-07-30 09:44:27', '2024-07-30 09:44:27'),
(109, 4, 23, NULL, '2024-07-30 09:44:31', '2024-07-30 09:44:31'),
(110, 5, 23, NULL, '2024-07-30 09:44:39', '2024-07-30 09:44:39'),
(111, 6, 23, NULL, '2024-07-30 09:44:44', '2024-07-30 09:44:44'),
(112, 7, 23, NULL, '2024-07-30 09:44:50', '2024-07-30 09:44:50'),
(113, 8, 23, NULL, '2024-07-30 09:44:57', '2024-07-30 09:44:57'),
(114, 9, 23, NULL, '2024-07-30 09:45:02', '2024-07-30 09:45:02'),
(115, 10, 23, NULL, '2024-07-30 09:45:08', '2024-07-30 09:45:08'),
(116, 38, 23, '{\"heading\":\"Earn More From Farming Investment\",\"short_description\":\"Join a community of forward-thinking investors and farmers committed to sustainable and profitable agricultural ventures. At Agriwealth, we connect you with innovative projects that drive growth, promote sustainability, and ensure food security.\",\"button_name\":\"Get Started\"}', '2024-07-30 09:45:43', '2024-07-30 09:45:43'),
(117, 39, 23, '{\"heading\":\"Farming Investment Growing Success\",\"short_description\":\"With decades of experience in the agricultural sector, our team is dedicated to identifying and managing profitable investment opportunities. Our experts bring extensive knowledge and hands-on experience to every project.\",\"button_name\":\"View More\"}', '2024-07-30 09:46:12', '2024-07-30 09:46:12'),
(118, 40, 23, NULL, '2024-07-30 09:46:17', '2024-07-30 09:46:17'),
(119, 41, 23, NULL, '2024-07-30 09:46:21', '2024-07-30 09:46:21'),
(120, 42, 23, NULL, '2024-07-30 09:46:27', '2024-07-30 09:46:27'),
(121, 12, 23, '{\"heading\":\"How we work Together\",\"short_description\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-30 09:46:52', '2024-07-30 09:46:52'),
(122, 13, 23, '{\"heading\":\"Farm Selection &amp; Entity Creation\",\"short_description\":\"We carefully select high-potential farms and create investment entities that match your financial goals.\"}', '2024-07-30 09:47:05', '2024-07-30 09:47:05'),
(123, 14, 23, '{\"heading\":\"Farm Investment -Easily and Safely\",\"short_description\":\"Invest confidently with our secure platform, ensuring your money is safe and optimally invested.\"}', '2024-07-30 09:47:21', '2024-07-30 09:47:21'),
(124, 15, 23, '{\"heading\":\"Farm Management- Produce Goods &amp; Sell\",\"short_description\":\"Our experienced farm managers oversee the cultivation, production, and sale of agricultural goods.\"}', '2024-07-30 09:47:42', '2024-07-30 09:47:42'),
(125, 16, 23, '{\"heading\":\"Distributions - Withdraw or Reinvests\",\"short_description\":\"Our experienced farm managers oversee the cultivation, production, and sale of agricultural goods.\"}', '2024-07-30 09:47:59', '2024-08-19 13:01:15'),
(126, 17, 23, '{\"heading\":\"What Sets Our Position Apart\",\"short_description\":\"At Agriwealth, we offer unique advantages that make our agricultural investments stand out. Explore the key benefits of partnering with us\"}', '2024-07-30 09:48:35', '2024-07-30 09:48:35'),
(127, 18, 23, '{\"heading\":\"Safe Haven Investment\",\"short_description\":\"Invest with peace of mind knowing your assets are in a secure and stable environment.\"}', '2024-07-30 09:48:50', '2024-07-30 09:48:50'),
(128, 19, 23, '{\"heading\":\"Uncorrelated Returns\",\"short_description\":\"Benefit from returns that are independent of traditional market fluctuations, providing stability and\"}', '2024-07-30 09:49:03', '2024-07-30 09:49:03'),
(129, 20, 23, '{\"heading\":\"Superior Inflation Hedge\",\"short_description\":\"Protect your investments against inflation with agricultural assets that tend to increase in value over time.\"}', '2024-07-30 09:49:27', '2024-07-30 09:49:27'),
(130, 21, 23, '{\"heading\":\"Attractive Yields\",\"short_description\":\"Enjoy competitive yields from well-managed agricultural investments, designed to maximize your returns.\"}', '2024-07-30 09:50:29', '2024-07-30 09:50:29'),
(131, 22, 23, '{\"heading\":\"Our Top Project For Investors\",\"short_description\":\"Explore our premier investment opportunity, designed for growth and sustainability. Join Agriwealth in a thriving, future-focused agricultural venture\",\"button_name\":\"View All\"}', '2024-07-30 09:50:56', '2024-07-30 09:50:56'),
(132, 23, 23, '{\"heading\":\"Sustainable Agriculture practices\",\"short_description\":\"Promoting environmentally-friendly farming methods to ensure long-term productivity and ecological balance.\",\"heading_2\":\"25 Years Expert\",\"sub_heading\":\"Crop Rotation and Diversity\",\"short_text\":\"With over 25 years of expertise, we implement crop rotation and diversity practices to enhance soil health and boost crop yields, ensuring sustainable and productive farming.\"}', '2024-07-30 09:51:54', '2024-07-30 09:51:54'),
(133, 28, 23, '{\"heading\":\"Choose Best Offered Plan From Agriwealth\",\"short_description\":\"Gain unparalleled access to farmland investments, carefully vetted through rigorous due diligence to ensure optimal returns.\"}', '2024-07-30 09:52:32', '2024-07-30 09:52:32'),
(134, 54, 23, '{\"heading\":\"Flexible Pricing Solution Agriwealth\",\"short_text\":\"Unparalleled access to farmland investments vetted by rigorous due-diligence.\"}', '2024-07-30 09:53:31', '2024-07-30 09:53:31'),
(135, 27, 23, '{\"heading\":\"Running Project Farming Technology\",\"short_description\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-30 09:53:49', '2024-07-30 09:53:49'),
(136, 29, 23, '{\"heading\":\"Our Investor Delightful History Here\",\"short_description\":\"Discover the success stories of our investors and see why Agriwealth is the preferred choice for agricultural investments.\"}', '2024-07-30 09:54:06', '2024-07-30 09:54:06'),
(137, 33, 23, '{\"heading\":\"Learn About Agriwealth Stories\",\"short_description\":\"Stay informed with the latest insights and trends in agricultural investments. Explore expert articles, success stories, and tips to maximize your returns with Agriwealth\",\"button_name\":\"View All\"}', '2024-07-30 09:54:24', '2024-07-30 09:54:24'),
(138, 64, 23, '{\"heading\":\"Agricultural Agriwealth Stories\",\"short_text\":\"Stay informed with the latest insights and trends in agricultural investments. Explore expert articles, success stories, and tips to maximize your returns with Agriwealth\",\"button_name\":\"View All\"}', '2024-07-30 09:55:13', '2024-07-30 09:55:13'),
(139, 34, 23, '{\"countable_item_name\":\"Total Asset Raised\",\"prefix\":\"M+\"}', '2024-07-30 09:55:31', '2024-07-30 09:55:31'),
(140, 35, 23, '{\"countable_item_name\":\"Properties Funded\",\"prefix\":\"+\"}', '2024-07-30 09:55:44', '2024-07-30 09:55:44'),
(141, 36, 23, '{\"countable_item_name\":\"Target Net IRTarget Net IRRR\",\"prefix\":\"%\"}', '2024-07-30 09:55:56', '2024-07-30 09:56:15'),
(142, 37, 23, '{\"countable_item_name\":\"Total Investor\",\"prefix\":\"K+\"}', '2024-07-30 09:56:34', '2024-07-30 09:56:34'),
(143, 49, 23, '{\"heading\":\"Growing For The Future Agriwealth\",\"short_text\":\"Different term invest made your money secure and choice the best plan for your future asset\"}', '2024-07-30 10:30:43', '2024-07-30 10:30:43'),
(144, 50, 23, '{\"countable_item_name\":\"Total Asset Raised\",\"prefix\":\"M+\"}', '2024-07-30 10:30:57', '2024-07-30 10:30:57'),
(145, 51, 23, '{\"countable_item_name\":\"Properties Funded\",\"prefix\":\"+\"}', '2024-07-30 10:31:11', '2024-07-30 10:31:11'),
(146, 52, 23, '{\"countable_item_name\":\"Target Net IRR\",\"prefix\":\"%\"}', '2024-07-30 10:31:28', '2024-07-30 10:31:28'),
(147, 53, 23, '{\"countable_item_name\":\"Total Investor\",\"prefix\":\"K+\"}', '2024-07-30 10:31:40', '2024-07-30 10:31:40'),
(148, 11, 23, '{\"heading\":\"Create an account and start growing your Money\",\"short_text\":\"Stay updated with the latest insights and opportunities in agricultural investments. Subscribe to our newsletter for expert advice, exclusive offers, and more\",\"button_name\":\"Create An Account\"}', '2024-07-30 10:32:07', '2024-07-30 10:32:07'),
(149, 43, 23, '{\"heading\":\"Investment Way To Farmtrader\",\"short_text\":\"Different investment terms ensure your money is secure, allowing you to choose the best plan for your future assets.\"}', '2024-07-30 10:32:23', '2024-07-30 10:32:23'),
(150, 44, 23, '{\"heading\":\"Pick Your Project &amp; Sponsor Accordingly\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-30 10:32:45', '2024-08-19 12:41:55'),
(151, 45, 23, '{\"heading\":\"Farm Investment And Maintain\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-30 10:33:14', '2024-07-30 10:33:14'),
(152, 46, 23, '{\"heading\":\"Get Farm Update from Our Software\",\"short_text\":\"Stay informed with real-time updates on your investments. Our advanced software provides detailed reports and  helping you track progress and returns.\"}', '2024-07-30 10:33:30', '2024-07-30 10:33:30'),
(153, 47, 23, '{\"heading\":\"Get Your Return After Fixed Duration\",\"short_text\":\"Invest in farms with confidence. The funds raised from all clients are used to purchase farm buildings, equipment , ensuring optimal operation and growth.\"}', '2024-07-30 10:33:43', '2024-08-19 12:42:04'),
(154, 48, 23, '{\"heading\":\"Agriwealth Products For Investors\",\"short_text\":\"Explore our premier investment opportunity, designed for growth and sustainability. Join Agriwealth in a thriving, future-focused agricultural venture\",\"button_name\":\"View All\"}', '2024-07-30 10:34:03', '2024-07-30 10:34:03'),
(155, 55, 23, '{\"heading\":\"Investors Reviews\",\"short_text\":\"Hear from our satisfied investors who have experienced exceptional returns and sustainable growth with Agriwealth.\"}', '2024-07-30 10:34:28', '2024-07-30 10:34:28'),
(156, 56, 23, '{\"investor_name\":\"Darell Seward\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:34:54', '2024-08-19 12:40:57'),
(157, 57, 23, '{\"investor_name\":\"Michael Rodriguez\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:35:31', '2024-08-19 12:43:10'),
(158, 58, 23, '{\"investor_name\":\"Sophia Chen\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:36:53', '2024-08-19 12:43:19'),
(159, 59, 23, '{\"investor_name\":\"James Anderson\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:37:14', '2024-08-19 12:43:28'),
(160, 60, 23, '{\"investor_name\":\"Laura Martinez\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:37:40', '2024-08-19 12:43:37'),
(161, 61, 23, '{\"investor_name\":\"David Lee\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:38:12', '2024-08-19 12:43:52'),
(162, 62, 23, '{\"investor_name\":\"Olivia Brown\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:38:41', '2024-08-19 12:44:11'),
(163, 63, 23, '{\"investor_name\":\"Liam Wilson\",\"position\":\"Director, Tobaka\",\"review\":\"<p>Agriwealth has exceeded my expectations in every way. Their focus on sustainable agriculture and high returns has made them my preferred investment choice.<br><\\/p>\"}', '2024-07-30 10:39:15', '2024-08-19 12:44:29'),
(164, 65, 23, '{\"heading\":\"Best Investment Experience\",\"short_description\":\"<p><span style=\\\"font-weight:bolder;\\\">Leading Agricultural Investments<\\/span><br>At Agriwealth, we believe in harnessing the power of agriculture to generate sustainable wealth and secure the future. Our mission is to connect investors with high-potential agricultural projects that offer both financial returns and positive environmental impact.<\\/p><p><span style=\\\"font-weight:bolder;\\\">Our Vision<\\/span><br>To lead the agricultural investment industry by fostering sustainable practices and delivering exceptional returns for our investors.<\\/p><p><span style=\\\"font-weight:bolder;\\\">Our Mission<\\/span><br>To provide unparalleled investment opportunities in agriculture, driven by rigorous due diligence, expert management, and innovative solutions.<\\/p>\"}', '2024-07-30 10:39:40', '2024-07-30 10:39:40'),
(165, 66, 23, '{\"button_name\":\"Our Mission\"}', '2024-07-30 10:40:10', '2024-07-30 10:40:10'),
(166, 67, 23, '{\"button_name\":\"Our Vision\"}', '2024-07-30 10:40:28', '2024-07-30 10:40:28'),
(167, 68, 23, '{\"button_name\":\"Client Trust\"}', '2024-07-30 10:40:52', '2024-07-30 10:40:52'),
(168, 69, 23, '{\"button_name\":\"Support Team\"}', '2024-07-30 10:41:05', '2024-07-30 10:41:05'),
(169, 73, 23, '{\"question\":\"How Does This Work?\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-30 10:43:39', '2024-07-30 10:43:39'),
(170, 74, 23, '{\"question\":\"How Safe Are My Fund After Submission\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-30 10:43:59', '2024-07-30 10:43:59'),
(171, 75, 23, '{\"question\":\"Are This Farm Secured  for Long Term\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-30 10:44:20', '2024-07-30 10:44:20'),
(172, 76, 23, '{\"question\":\"Is The Rio Of The Firm be Stable over the Years\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-30 10:44:40', '2024-07-30 10:44:40'),
(173, 77, 23, '{\"question\":\"Sustainable Farm Investment Process\",\"answer\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Your funds are safe with us, our teams ensure best agricultural and technology practices. We are datadriven in all processes, coupled with the implementation .<br><\\/p>\"}', '2024-07-30 10:44:54', '2024-07-30 10:44:54'),
(174, 70, 23, NULL, '2024-07-30 10:45:09', '2024-07-30 10:45:09'),
(175, 71, 23, '{\"heading\":\"Address Details\",\"short_text\":\"We have so many address to execute different work properly and we would like to share our head office address below\",\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"email\":\"farmtrader@global.com\"}', '2024-07-30 10:45:57', '2024-07-30 10:45:57'),
(176, 99, 23, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/span><br><\\/p>\"}', '2024-07-30 10:46:25', '2024-07-30 10:46:25'),
(177, 100, 23, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-30 10:46:38', '2024-07-30 10:46:38');
INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(178, 101, 23, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-30 10:46:50', '2024-07-30 10:46:50'),
(179, 102, 23, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-30 10:47:03', '2024-07-30 10:47:03'),
(180, 103, 23, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-30 10:47:15', '2024-07-30 10:47:15'),
(181, 104, 23, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-30 10:47:29', '2024-07-30 10:47:29'),
(182, 105, 23, '{\"heading\":\"CONTACT US\",\"description\":\"<p style=\\\"font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/p><p style=\\\"font-size:15px;\\\"><a href=\\\"mailto:Email:supportRESTINA@gmail.com\\\">Email:\\u00a0support.Agriwealth@gmail.com<\\/a><span style=\\\"font-size:16px;color:rgb(33,37,41);font-family:\'system-ui\', \'-apple-system\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Noto Sans\', \'Liberation Sans\', Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\';\\\"><\\/span><\\/p><p style=\\\"font-size:15px;\\\">Location: 800S, Salt Lake City, USA<\\/p>\"}', '2024-07-30 10:48:03', '2024-07-30 10:48:03'),
(183, 85, 23, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our service<\\/span><br><\\/p>\"}', '2024-07-30 10:49:35', '2024-07-30 10:49:35'),
(184, 86, 23, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-30 10:49:52', '2024-07-30 10:49:52'),
(185, 87, 23, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-30 10:50:04', '2024-07-30 10:50:04'),
(186, 88, 23, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-30 10:50:19', '2024-07-30 10:50:19'),
(187, 89, 23, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-30 10:50:32', '2024-07-30 10:50:32'),
(188, 90, 23, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-30 10:50:46', '2024-07-30 10:50:46'),
(189, 91, 23, '{\"heading\":\"CONTACT US\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/span><br><\\/p>\"}', '2024-07-30 10:51:08', '2024-07-30 10:51:08'),
(190, 92, 23, '{\"heading\":\"INFORMATION WE COLLECT\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/span><br><\\/p>\"}', '2024-07-30 10:51:35', '2024-07-30 10:51:35'),
(191, 93, 23, '{\"heading\":\"HOW WE USE YOUR INFORMATION\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">Are may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required.<\\/span><br><\\/p>\"}', '2024-07-30 10:51:55', '2024-07-30 10:51:55'),
(192, 94, 23, '{\"heading\":\"SHARING YOUR INFORMATION\",\"description\":\"<p style=\\\"font-size:15px;\\\">We may share your information with trusted service providers to facilitate our services. We ensure that these partners maintain the same level of data protection and security as us. Additionally, we may disclose information as required by law or to protect our rights and interests.We may share your information with trusted service providers to facilitate our services.<\\/p><ul><li>The implement industry-standard security measures to protect your information.<\\/li><li>Out of marketing communications, and request the deletion of your data.<\\/li><li>Please contact us to exercise these rights.<\\/li><li>If you have any questions or concerns about our Privacy Policy.<\\/li><li>To Cancellation and Rescheduling<\\/li><li>To Feedback and Reviews<\\/li><\\/ul>\"}', '2024-07-30 10:52:09', '2024-07-30 10:52:09'),
(193, 95, 23, '{\"heading\":\"YOUR CHOICES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We implement industry-standard security measures to protect your information from unauthorized access, alteration, or disclosure. However, please be aware that no data transmission over the internet is entirely secure.<\\/span><br><\\/p>\"}', '2024-07-30 10:52:22', '2024-07-30 10:52:22'),
(194, 96, 23, '{\"heading\":\"SECURITY MEASURES\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">You have the right to update or correct your information, opt out of marketing communications, and request the deletion of your data. Please contact us to exercise these rights.<\\/span><br><\\/p>\"}', '2024-07-30 10:52:57', '2024-07-30 10:52:57'),
(195, 97, 23, '{\"heading\":\"CHANGES TO THIS POLICY\",\"description\":\"<p><span style=\\\"color:rgb(82,80,100);font-size:15px;\\\">We may update our Privacy Policy as our practices evolve. We will notify you of any significant changes and provide the updated policy on our website You have the right to update or correct your information<\\/span><br><\\/p>\"}', '2024-07-30 10:53:16', '2024-07-30 10:53:16'),
(196, 78, 23, '{\"login_heading\":\"Welcome back, Log In\",\"login_subheading\":\"Sign in to your account ans make booking faster and easy process.\",\"register_heading\":\"Creative Account\",\"register_subheading\":\"Discover the world\\u2019s best Farm investment Platform for the future Asset .\"}', '2024-07-30 10:53:47', '2024-07-30 10:53:47'),
(197, 98, 23, '{\"heading\":\"CONTACT US\",\"description\":\"<p style=\\\"font-size:15px;\\\">If you have any questions or concerns about our Privacy Policy or data practices, please contact us at<\\/p><p style=\\\"font-size:15px;\\\"><a href=\\\"mailto:Email:supportRESTINA@gmail.com\\\">Email:\\u00a0support.Agriwealth@gmail.com<\\/a><span style=\\\"font-size:16px;color:rgb(33,37,41);font-family:\'system-ui\', \'-apple-system\', \'Segoe UI\', Roboto, \'Helvetica Neue\', \'Noto Sans\', \'Liberation Sans\', Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\';\\\"><\\/span><\\/p><p style=\\\"font-size:15px;\\\">Location: 800S, Salt Lake City, USA<\\/p>\"}', '2024-07-30 10:54:37', '2024-07-30 10:54:37'),
(198, 79, 23, '{\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"subscribe_heading\":\"Stay Update\",\"subscribe_text\":\"Get real time Update from us.\"}', '2024-07-30 10:56:27', '2024-07-30 10:56:27'),
(199, 80, 23, NULL, '2024-07-30 10:56:36', '2024-07-30 10:56:36'),
(200, 81, 23, NULL, '2024-07-30 10:56:43', '2024-07-30 10:56:43'),
(201, 82, 23, NULL, '2024-07-30 10:56:50', '2024-07-30 10:56:50'),
(202, 83, 23, NULL, '2024-07-30 10:56:57', '2024-07-30 10:56:57'),
(203, 84, 23, '{\"address\":\"13th Street. 47 W 13th St, New York ,USA\",\"email\":\"agriwealth@global.com\"}', '2024-07-30 10:57:12', '2024-07-30 10:57:12'),
(204, 72, 23, NULL, '2024-07-30 11:49:48', '2024-07-30 11:49:48'),
(205, 24, 23, '{\"heading\":\"Expert investment team\",\"short_description\":\"Our team of seasoned experts brings years of experience and deep knowledge in agricultural investments, ensuring your investments are in capable hands.\"}', '2024-07-30 11:59:24', '2024-07-30 11:59:24'),
(206, 25, 23, '{\"heading\":\"Disciplined investment philosophy\",\"short_description\":\"We adhere to a disciplined investment approach, focusing on sustainable and profitable agricultural ventures to maximize your returns.\"}', '2024-07-30 11:59:37', '2024-07-30 11:59:37'),
(207, 26, 23, '{\"heading\":\"Proprietary sourcing technology\",\"short_description\":\"Utilizing advanced technology, we identify the best agricultural opportunities, providing you with exclusive investment options.\"}', '2024-07-30 11:59:49', '2024-07-30 11:59:49'),
(208, 30, 23, '{\"investor_name\":\"Andrew Nicol\",\"position\":\"COO, Global Farming Solutions\",\"heading\":\"Best Profitable Invest Return\",\"short_text\":\"Agriwealth has significantly boosted my financial portfolio. Their commitment to delivering high returns is unmatched. I highly recommend their services.\"}', '2024-07-30 12:05:42', '2024-08-19 12:41:21'),
(209, 31, 23, '{\"investor_name\":\"Thomson David\",\"position\":\"Director, American Tobaka\",\"heading\":\"Consistent and High Returns\",\"short_text\":\"Agriwealth\'s investment strategies are top-notch. They have consistently delivered high returns, making them my go-to choice for agricultural investments.\"}', '2024-07-30 12:06:11', '2024-07-30 12:06:11'),
(210, 32, 23, '{\"investor_name\":\"Silvana Siliya\",\"position\":\"Director, American Tobaka\",\"heading\":\"Outstanding Investment\",\"short_text\":\"Agriwealth\'s investment strategies are top-notch. They have consistently delivered high returns, making them my go-to choice for agricultural investments.\"}', '2024-07-30 12:06:38', '2024-08-19 13:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depositable_id` int(11) DEFAULT NULL,
  `depositable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount payed',
  `base_currency_charge` double(18,8) DEFAULT 0.00000000,
  `payable_amount_in_base_currency` double(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `trx_id` char(36) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=success, 2=request, 3=rejected',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storages`
--

CREATE TABLE `file_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => active, 0 => inactive',
  `parameters` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storages`
--

INSERT INTO `file_storages` (`id`, `code`, `name`, `logo`, `driver`, `status`, `parameters`, `created_at`, `updated_at`) VALUES
(1, 's3', 'Amazon S3', 'driver/GJrBdvIxtnEprk0kHylgzNh6LcGcfOUcA205IIK5.png', 'local', 0, '{\"access_key_id\":\"xys6\",\"secret_access_key\":\"xys\",\"default_region\":\"xys5\",\"bucket\":\"xys6\",\"url\":\"xysds\"}', NULL, '2023-10-14 21:24:29'),
(2, 'sftp', 'SFTP', 'driver/q8E08YsobyRZGOLHHeKGhwysWsi25F186EbaNNRx.png', 'local', 0, '{\"sftp_username\":\"xys6\",\"sftp_password\":\"xys\"}', NULL, '2023-06-10 17:28:03'),
(3, 'do', 'Digitalocean Spaces', 'driver/iA8q685PBCnOAkmctLXZWhyqSoh7cJMOewpW4S8r.png', 'local', 0, '{\"spaces_key\":\"hj\",\"spaces_secret\":\"vh\",\"spaces_endpoint\":\"jk\",\"spaces_region\":\"sfo2\",\"spaces_bucket\":\"assets-coral\"}', NULL, '2023-06-10 17:45:21'),
(4, 'ftp', 'FTP', 'driver/wIwEOAJ45KgVGw0PL80WNfcbosB4IuUlxStfeHCX.png', 'local', 0, '{\"ftp_host\":\"xys6\",\"ftp_username\":\"xys\",\"ftp_password\":\"xys6\"}', NULL, '2023-06-10 17:27:43'),
(5, 'local', 'Local Storage', '', NULL, 1, NULL, NULL, '2023-06-19 03:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `fire_base_tokens`
--

CREATE TABLE `fire_base_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_id` int(11) DEFAULT NULL,
  `tokenable_type` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `gateway_id` int(11) UNSIGNED DEFAULT NULL,
  `fundable_id` int(11) UNSIGNED DEFAULT NULL,
  `fundable_type` varchar(91) NOT NULL,
  `gateway_currency` varchar(191) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) DEFAULT 0.00000000,
  `final_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(191) DEFAULT NULL,
  `transaction` varchar(25) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Complete, 2=> Pending, 3 => Cancel, 4=> failed',
  `detail` text DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `validation_token` varchar(191) DEFAULT NULL,
  `referenceno` varchar(191) DEFAULT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `api_response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `supported_currency` varchar(255) DEFAULT NULL,
  `receivable_currencies` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `is_manual` tinyint(1) DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 10, 'gateway/cCmKX4VMzHorJkQ9omsZdOLIZLXA56.avif', 'local', 0, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(2, 'stripe', 'Stripe ', 1, 'gateway/Fpn6DbOj8Kh0qEqmDcqzPLaYetzHdU.avif', 'local', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, '[\"USD\",\"GBP\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0085\",\"min_limit\":\"0.001\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"},{\"name\":\"GBP\",\"currency_symbol\":\"GBP\",\"conversion_rate\":\"0.0065\",\"min_limit\":\"0.001\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(3, 'skrill', 'Skrill', 3, 'gateway/sFW8RqOtyTiIo8369MLJFmMsfHtYHX.avif', 'local', 0, '{\"pay_to_email\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, '[\"AUD\",\"USD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(4, 'perfectmoney', 'Perfect Money', 8, 'gateway/B1uwuCo5fk4FVyBSm8yxErDtezvo9R.avif', 'local', 0, '{\"passphrase\":\"\",\"payee_account\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(5, 'paytm', 'PayTM', 22, 'gateway/9OxY8ZDv4JGt3MS7zPEquDtQ9b1vWU.avif', 'local', 0, '{\"MID\":\"\",\"merchant_key\":\"\",\"WEBSITE\":\"\",\"INDUSTRY_TYPE_ID\":\"\",\"CHANNEL_ID\":\"\",\"environment_url\":\"\",\"process_transaction_url\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(6, 'payeer', 'Payeer', 17, 'gateway/7HTCjJpFcRmHqM1kJSpaRuTA0MzNqG.avif', 'local', 0, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', '[\"USD\",\"RUB\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"RUB\",\"currency_symbol\":\"RUD\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(7, 'paystack', 'PayStack', 5, 'gateway/Km8ogMTUmpEdjbHRvLma7enfvafO3N.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(8, 'voguepay', 'VoguePay', 33, 'gateway/x6HOsziQhmuJ7iu46zMKdBEewDSesm.avif', 'local', 0, '{\"merchant_id\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, '[\"NGN\",\"EUR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(9, 'flutterwave', 'Flutterwave', 4, 'gateway/SUpub5TEkx7MOcetX340zn7LGSH0Sa.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, '[\"GHS\",\"NGN\",\"USD\"]', '[{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(10, 'razorpay', 'RazorPay', 6, 'gateway/HvTfH2WAQtw0pcN4ZzssUT5l86FMCZ.avif', 'local', 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(11, 'instamojo', 'instamojo', 13, 'gateway/rwXQ1P62ePQcvJBIUZRkHMumLbWF73.avif', 'local', 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(12, 'mollie', 'Mollie', 26, 'gateway/S83QZxmVtxCkvl8OGWFGgChxmUcQhc.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, '[\"AUD\",\"BRL\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"BRL\",\"currency_symbol\":\"BRL\",\"conversion_rate\":\"0.045\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(13, 'twocheckout', '2checkout', 11, 'gateway/bmAgQ5rUbx2rktlaztA89GEQCKYTxJ.avif', 'local', 0, '{\"merchant_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', '[\"AFN\",\"ARS\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":\"0.63\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(14, 'authorizenet', 'Authorize.Net', 7, 'gateway/kY6uyYr0nPgU0SyM69Yy4ei7aAowCu.avif', 'local', 0, '{\"login_id\":\"\",\"current_transaction_key\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(15, 'securionpay', 'SecurionPay', 32, 'gateway/MZexTcUjZftszr1jA2xG9y8ntD2bA2.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\", \"DZD\":\"DZD\", \"ARS\":\"ARS\", \"AUD\":\"AUD\", \"BHD\":\"BHD\", \"BDT\":\"BDT\", \"BYR\":\"BYR\", \"BAM\":\"BAM\", \"BWP\":\"BWP\", \"BRL\":\"BRL\", \"BND\":\"BND\", \"BGN\":\"BGN\", \"CAD\":\"CAD\", \"CLP\":\"CLP\", \"CNY\":\"CNY\", \"COP\":\"COP\", \"KMF\":\"KMF\", \"HRK\":\"HRK\", \"CZK\":\"CZK\", \"DKK\":\"DKK\", \"DJF\":\"DJF\", \"DOP\":\"DOP\", \"EGP\":\"EGP\", \"ETB\":\"ETB\", \"ERN\":\"ERN\", \"EUR\":\"EUR\", \"GEL\":\"GEL\", \"HKD\":\"HKD\", \"HUF\":\"HUF\", \"ISK\":\"ISK\", \"INR\":\"INR\", \"IDR\":\"IDR\", \"IRR\":\"IRR\", \"IQD\":\"IQD\", \"ILS\":\"ILS\", \"JMD\":\"JMD\", \"JPY\":\"JPY\", \"JOD\":\"JOD\", \"KZT\":\"KZT\", \"KES\":\"KES\", \"KWD\":\"KWD\", \"KGS\":\"KGS\", \"LVL\":\"LVL\", \"LBP\":\"LBP\", \"LTL\":\"LTL\", \"MOP\":\"MOP\", \"MKD\":\"MKD\", \"MGA\":\"MGA\", \"MWK\":\"MWK\", \"MYR\":\"MYR\", \"MUR\":\"MUR\", \"MXN\":\"MXN\", \"MDL\":\"MDL\", \"MAD\":\"MAD\", \"MZN\":\"MZN\", \"NAD\":\"NAD\", \"NPR\":\"NPR\", \"ANG\":\"ANG\", \"NZD\":\"NZD\", \"NOK\":\"NOK\", \"OMR\":\"OMR\", \"PKR\":\"PKR\", \"PEN\":\"PEN\", \"PHP\":\"PHP\", \"PLN\":\"PLN\", \"QAR\":\"QAR\", \"RON\":\"RON\", \"RUB\":\"RUB\", \"SAR\":\"SAR\", \"RSD\":\"RSD\", \"SGD\":\"SGD\", \"ZAR\":\"ZAR\", \"KRW\":\"KRW\", \"IKR\":\"IKR\", \"LKR\":\"LKR\", \"SEK\":\"SEK\", \"CHF\":\"CHF\", \"SYP\":\"SYP\", \"TWD\":\"TWD\", \"TZS\":\"TZS\", \"THB\":\"THB\", \"TND\":\"TND\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"AED\":\"AED\", \"GBP\":\"GBP\", \"USD\":\"USD\", \"VEB\":\"VEB\", \"VEF\":\"VEF\", \"VND\":\"VND\", \"XOF\":\"XOF\", \"YER\":\"YER\", \"ZMK\":\"ZMK\"}}', NULL, '[\"AFN\",\"DZD\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":\"0.63\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"DZD\",\"currency_symbol\":\"DZD\",\"conversion_rate\":\"1.22\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(16, 'payumoney', 'PayUmoney', 27, 'gateway/TjSy1hfABIV2RzIRECRJcwmN04sGEh.avif', 'local', 0, '{\"merchant_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(17, 'mercadopago', 'Mercado Pago', 37, 'gateway/2UlZWhhkfVSWQepk1uBKecw4FrepZx.avif', 'local', 0, '{\"access_token\":\"\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, '[\"ARS\"]', '[{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(18, 'coingate', 'Coingate', 18, 'gateway/uxKFypl7GtiL0YnJhshsLKyGzf2YKt.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 15, 'gateway/POaHQGEUctnNpM9YgAvIIwq0R9aXnw.avif', 'local', 0, '{\"api_key\":\"\",\"secret\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', '[\"AED\",\"ALL\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ALL\",\"currency_symbol\":\"ALL\",\"conversion_rate\":\"0.85\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(20, 'monnify', 'Monnify', 19, 'gateway/N9ZZ4F4YeYM4m78gZW0Gnm8HTu037v.avif', 'local', 0, '{\"api_key\":\"\",\"secret_key\":\"\",\"contract_code\":\"\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, '[\"NGN\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(22, 'coinpayments', 'CoinPayments', 20, 'gateway/truY5ILTjTIFunGBf7Hn5vcWSxYw6Q.avif', 'local', 0, '{\"merchant_id\":\"\",\"private_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', '[\"USD\",\"AUD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(23, 'blockchain', 'Blockchain', 23, 'gateway/20zn8YG4VPgOUSBQHvj0GeKMHwL4ZY.avif', 'local', 0, '{\"api_key\":\"\",\"xpub_code\":\"\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"50\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-08-21 12:15:24'),
(25, 'cashmaal', 'cashmaal', 24, 'gateway/7Y3IZE7VY61XHwNxRzrgWVFZx8zUu0.avif', 'local', 0, '{\"web_id\":\"\",\"ipn_key\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', '[\"PKR\",\"USD\"]', '[{\"name\":\"PKR\",\"currency_symbol\":\"PKR\",\"conversion_rate\":\"2.56\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, NULL, '2024-08-21 12:15:24'),
(26, 'midtrans', 'Midtrans', 2, 'gateway/7fRFCClfGcMefCb35AVzgnEJevUi37.avif', 'local', 0, '{\"client_key\":\"\",\"server_key\":\"\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', '[\"IDR\"]', '[{\"name\":\"IDR\",\"currency_symbol\":\"IDR\",\"conversion_rate\":\"141.38\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(27, 'peachpayments', 'peachpayments', 34, 'gateway/4aJggeZFR2SBLYMw9DewRUOByPaRez.avif', 'local', 0, '{\"Authorization_Bearer\":\"\",\"Entity_ID\":\"\",\"Recur_Channel\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, '[\"CAD\",\"AED\"]', '[{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-09 03:05:02', '2024-08-21 12:15:24'),
(28, 'nowpayments', 'Nowpayments', 25, 'gateway/Z5wvvbRZN7nZUC6GgPTqMyf1lM2WBf.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"1\":{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}}', '{\"cron\":\"ipn\"}', '[\"ETH\",\"XEM\"]', '[{\"name\":\"ETH\",\"currency_symbol\":\"XEM\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"XEM\",\"currency_symbol\":\"ETH\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(29, 'khalti', 'Khalti Payment', 28, 'gateway/x4BeAPBkYuM494NvWfAkrxTfk1tbUt.avif', 'local', 0, '{\"secret_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(30, 'swagger', 'MAGUA PAY', 21, 'gateway/j8bFL5e5LOn6YkquKQiy6com8w1uj2.avif', 'local', 0, '{\"MAGUA_PAY_ACCOUNT\":\"\",\"MerchantKey\":\"\",\"Secret\":\"\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, '[\"EUR\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(31, 'freekassa', 'Free kassa', 35, 'gateway/VqJR12ZLuhmisIpUbpm6p2OCqm4hHC.avif', 'local', 0, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"secret_word\":\"\",\"secret_word2\":\"\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', '[\"RUB\",\"USD\"]', '[{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(32, 'konnect', 'Konnect', 29, 'gateway/DIWitJin1UBjkwTLrSPcstnUDGmTz3.avif', 'local', 0, '{\"api_key\":\"\",\"receiver_wallet_Id\":\"\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', '[\"USD\",\"TND\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"TND\",\"currency_symbol\":\"TND\",\"conversion_rate\":\"0.028\",\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"60000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(33, 'mypay', 'Mypay Np', 31, 'gateway/kkBeSnA5MFdlLrrSOpF3dJp1JwMxIB.avif', 'local', 0, '{\"merchant_username\":\"\",\"merchant_api_password\":\"\",\"merchant_id\":\"\",\"api_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(35, 'imepay', 'IME PAY', 9, 'gateway/YuBFrsBWuxf17sqB6z8y039xgdxyat.avif', 'local', 0, '{\"MerchantModule\":\"\",\"MerchantCode\":\"\",\"username\":\"\",\"password\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-08-21 12:15:24'),
(36, 'cashonexHosted', 'Cashonex Hosted', 14, 'gateway/GAcL1CamWpPaeDGaD6aSInqXknXK50.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:31:33', '2024-08-21 12:15:24'),
(37, 'cashonex', 'cashonex', 30, 'gateway/rbbey8zLDMKdNPftwRdOSY79eVEGLi.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0.0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:34:54', '2024-08-21 12:15:24'),
(38, 'binance', 'Binance', 12, 'gateway/bZ7w2koAzATHG9gp8k6JzRhhusXTpH.avif', 'local', 0, '{\"mercent_api_key\":\"\",\"mercent_secret\":\"\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0085\",\"min_limit\":\"1\",\"max_limit\":\"10000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2023-04-02 19:36:14', '2024-08-21 12:15:24'),
(39, 'cinetpay', 'CinetPay ', 36, 'gateway/9WCd4Kn4EvlDX8y4V3bEV7eazCTlla.avif', 'local', 0, '{\"apiKey\":\"\",\"site_id\":\"\"}', '{\"0\":{\"XOF\":\"XOF\",\"XAF\":\"XAF\",\"CDF\":\"CDF\",\"GNF\":\"GNF\",\"USD\":\"USD\"}}', 'NULL', '[\"XOF\"]', '[{\"name\":\"XOF\",\"currency_symbol\":\"XOF\",\"conversion_rate\":\"5.45\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2023-04-02 19:36:14', '2024-08-21 12:15:24'),
(1000, 'bank-transfer', 'Bank Transfer', 1, 'gateway/A2zYpiPKpPWcByCCys7mpnCugQEHvv.avif', 'local', 1, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_label\":\"Beneficiary Name\",\"type\":\"text\",\"validation\":\"required\"},\"NID\":{\"field_name\":\"NID\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_label\":\"Address\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, NULL, '[\"USD\",\"EUR\"]', '[{\"currency\":\"USD\",\"conversion_rate\":\"0.0085\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"currency\":\"EUR\",\"conversion_rate\":\"0.95\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, 'Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.', NULL, '2024-08-07 06:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `investment_plans`
--

CREATE TABLE `investment_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `plan_price` decimal(10,2) DEFAULT NULL,
  `plan_period` int(11) DEFAULT NULL,
  `plan_period_type` varchar(10) DEFAULT NULL,
  `min_invest` decimal(10,2) DEFAULT NULL,
  `max_invest` decimal(10,2) DEFAULT NULL,
  `return_typ_has_lifetime` tinyint(4) DEFAULT 0,
  `amount_has_fixed` tinyint(4) NOT NULL DEFAULT 0,
  `return_period` int(11) DEFAULT NULL,
  `return_period_type` varchar(10) DEFAULT NULL,
  `unlimited_period` tinyint(4) DEFAULT 0,
  `number_of_profit_return` int(11) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `profit_type` varchar(10) DEFAULT NULL,
  `capital_back` tinyint(1) NOT NULL DEFAULT 0,
  `maturity` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `soft_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invest_histories`
--

CREATE TABLE `invest_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `invest_amount` decimal(11,2) NOT NULL,
  `profit` decimal(11,2) NOT NULL,
  `number_of_return` int(11) NOT NULL,
  `is_life_time` tinyint(1) NOT NULL,
  `return_period` int(11) NOT NULL,
  `return_period_type` varchar(255) NOT NULL,
  `next_return` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `capital_back` tinyint(1) NOT NULL,
  `plan_expiry_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `plan_period_is_lifetime` tinyint(1) NOT NULL DEFAULT 0,
  `last_profit` datetime DEFAULT NULL,
  `total_return` int(11) NOT NULL,
  `trx` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `in_app_notificationable_id` int(11) NOT NULL,
  `in_app_notificationable_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `name`, `slug`, `input_form`, `status`, `created_at`, `updated_at`) VALUES
(12, 'NID Vefication', 'nid-vefication', '{\"FullName\":{\"field_name\":\"FullName\",\"field_label\":\"Full Name\",\"type\":\"text\",\"validation\":\"required\"},\"NIDNumber\":{\"field_name\":\"NIDNumber\",\"field_label\":\"NID Number\",\"type\":\"text\",\"validation\":\"required\"},\"DateOfBirth\":{\"field_name\":\"DateOfBirth\",\"field_label\":\"Date Of Birth\",\"type\":\"date\",\"validation\":\"required\"},\"NID\":{\"field_name\":\"NID\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"}}', 0, '2023-09-26 20:53:50', '2024-08-17 12:36:46'),
(13, 'Address Verification', 'address-verification', '{\"Name\":{\"field_name\":\"Name\",\"field_label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"PermanentAddress\":{\"field_name\":\"PermanentAddress\",\"field_label\":\"Permanent Address\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '2023-10-22 02:35:17', '2024-08-11 12:14:38'),
(14, 'Passport Verification', 'passport-verification', '{\"Name\":{\"field_name\":\"Name\",\"field_label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"PN\":{\"field_name\":\"PN\",\"field_label\":\"PN\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '2023-12-18 06:28:16', '2024-08-11 12:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `flag_driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => Inactive, 1 => Active',
  `rtl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => Inactive, 1 => Active ',
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `flag_driver`, `status`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'language/1JmNk9X6KPfO2nmMIOJU3qBpZvGNql.webp', 'local', 1, 0, 1, '2023-06-16 22:35:53', '2024-07-30 11:57:11'),
(23, 'Spanish', 'es', 'language/cV0XwHAMWSMqIcCmP4aZoB13z3OdMp.webp', 'local', 1, 0, 0, '2024-07-28 07:38:40', '2024-07-28 07:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_modes`
--

CREATE TABLE `maintenance_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_modes`
--

INSERT INTO `maintenance_modes` (`id`, `heading`, `description`, `image`, `image_driver`, `created_at`, `updated_at`) VALUES
(1, 'The website under maintenance!', '<p>We are currently undergoing scheduled maintenance to improve our services and enhance your user experience. During this time, our website/system will be temporarily unavailable.\r\n</p><p><br></p><p>\r\nWe apologize for any inconvenience this may cause and appreciate your patience. Please rest assured that we are working diligently to complete the maintenance as quickly as possible.</p>', 'maintenanceMode/3jXAnm42OZuYy3kVDcHKUjW3gyiG8eSo96rlgg19.png', 'local', '2023-10-03 22:44:32', '2024-02-05 04:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `manage_menus`
--

CREATE TABLE `manage_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_section` varchar(50) DEFAULT NULL,
  `menu_items` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_menus`
--

INSERT INTO `manage_menus` (`id`, `menu_section`, `menu_items`, `created_at`, `updated_at`) VALUES
(3, 'header', '[\"home\",\"about us\",\"projects\",\"faq\",\"contact\"]', '2023-10-15 20:54:10', '2024-08-19 12:27:36'),
(4, 'footer', '{\"useful_link\":[\"home\",\"home 02\",\"blog\",\"faq\"],\"support_link\":[\"blog\",\"privacy policy\",\"terms &amp; condition\",\"cookie &amp; policy\"]}', '2023-10-15 20:54:10', '2024-08-19 12:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `manual_sms_configs`
--

CREATE TABLE `manual_sms_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_method` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `header_data` text DEFAULT NULL,
  `param_data` text DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_sms_configs`
--

INSERT INTO `manual_sms_configs` (`id`, `action_method`, `action_url`, `header_data`, `param_data`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', NULL, '2023-10-19 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_07_064911_create_admins_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3),
(7, '2023_06_10_061241_create_basic_controls_table', 4),
(8, '2023_06_10_123329_create_file_storages_table', 4),
(9, '2023_06_15_102426_create_firebase_notifies_table', 5),
(10, '2023_06_17_085447_create_languages_table', 6),
(11, '2023_06_19_082042_create_sms_controls_table', 7),
(12, '2023_06_20_080624_create_support_tickets_table', 8),
(13, '2023_06_20_080731_create_support_ticket_messages_table', 8),
(14, '2023_06_20_080833_create_support_ticket_attachments_table', 8),
(15, '2023_06_20_212143_create_fire_base_tokens_table', 9),
(16, '2023_06_21_124322_create_in_app_notifications_table', 10),
(17, '2023_06_22_084256_create_gateways_table', 11),
(18, '2023_07_15_162549_create_kycs_table', 12),
(19, '2023_07_17_094844_create_manage_pages_table', 13),
(20, '2023_07_17_101515_create_manage_sections_table', 14),
(21, '2023_07_18_084411_create_pages_table', 15),
(22, '2023_07_22_130913_create_manage_menus_table', 16),
(23, '2023_07_26_193156_create_email_controls_table', 17),
(24, '2023_08_10_153005_create_google_sheet_apis_table', 18),
(25, '2023_08_20_140757_create_contents_table', 19),
(26, '2023_08_20_140808_create_content_details_table', 19),
(27, '2023_08_20_140815_create_content_media_table', 19),
(28, '2023_09_07_151706_create_user_logins_table', 20),
(29, '2023_09_09_105217_create_transactions_table', 21),
(30, '2023_09_09_105305_create_payout_logs_table', 21),
(31, '2023_09_09_105353_create_funds_table', 21),
(32, '2023_09_19_131540_create_deposits_table', 22),
(33, '2023_09_20_093121_create_payouts_table', 23),
(34, '2023_09_21_085103_create_wallets_table', 24),
(35, '2023_10_01_125109_create_pages_table', 25),
(36, '2023_10_02_162152_create_page_details_table', 26),
(37, '2023_10_04_102054_create_maintenance_modes_table', 27),
(38, '2023_10_05_124404_create_email_templates_table', 28),
(39, '2023_10_05_124445_create_notify_templates_table', 28),
(40, '2023_10_05_132313_create_email_sms_templates_table', 29),
(41, '2023_10_05_145420_create_push_notification_templates_table', 30),
(42, '2023_10_05_150447_create_in_app_notification_templates_table', 31),
(43, '2023_10_19_140559_create_manual_sms_configs_table', 32),
(44, '2023_10_19_161530_create_jobs_table', 33),
(45, '2023_12_10_085818_create_blog_categories_table', 34),
(46, '2023_12_10_094858_create_blogs_table', 35),
(47, '2023_12_10_094925_create_blog_details_table', 35),
(49, '2024_05_29_125357_create_investment_plans_table', 36),
(60, '2024_05_30_132337_create_projects_table', 37),
(61, '2024_06_01_072351_create_project_details_table', 37),
(62, '2024_06_03_124203_add_column_to_projects', 38),
(64, '2014_10_12_000000_create_users_table', 39),
(65, '2024_06_08_104304_create_user_kycs_table', 40),
(66, '2024_06_08_120212_create_payout_methods_table', 41),
(67, '2024_06_08_121015_create_razorpay_contacts_table', 42),
(68, '2024_06_11_094743_create_schedules_table', 43),
(69, '2024_06_22_100609_create_invest_histories_table', 44),
(70, '2024_06_25_144018_create_project_investments_table', 45),
(72, '2024_06_27_153443_create_notification_permissions_table', 46),
(73, '2024_06_30_163958_create_subscribers_table', 47),
(77, '2024_07_04_125439_create_referral_bonuses_table', 48),
(81, '2024_08_02_182854_create_referral_table', 49),
(82, '2024_08_21_121423_add_column_to_project_details', 50);

-- --------------------------------------------------------

--
-- Table structure for table `notification_permissions`
--

CREATE TABLE `notification_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notifyable_id` int(11) DEFAULT NULL,
  `notifyable_type` varchar(255) DEFAULT NULL,
  `template_email_key` text DEFAULT NULL,
  `template_sms_key` text DEFAULT NULL,
  `template_in_app_key` text DEFAULT NULL,
  `template_push_key` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email_from` varchar(191) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `sms` text DEFAULT NULL,
  `in_app` text DEFAULT NULL,
  `push` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL COMMENT 'mail = 0(inactive), mail = 1(active),\r\nsms = 0(inactive), sms = 1(active),\r\nin_app = 0(inactive), in_app = 1(active),\r\npush = 0(inactive), push = 1(active),\r\n ',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => user, 1 => admin',
  `lang_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `language_id`, `name`, `email_from`, `template_key`, `subject`, `short_keys`, `email`, `sms`, `in_app`, `push`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(11, 1, 'KYC Approved Successfully', 'support@achi.com', 'KYC_APPROVED', 'Your KYC has been approved', '{}', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-07-07 09:03:42'),
(12, 1, 'KYC Rejected Successfully', 'support@achi.com', 'KYC_REJECTED', 'Your KYC has been rejected', '{}', 'Your KYC has been rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-07-07 06:24:55'),
(15, 1, 'Payment Request', 'support@achi.com', 'PAYMENT_REQUEST', 'Payment Request', '{\"gateway\":\"gateway\",\"currency\":\"currency\",\"username\":\"username\"}', '[[username]] payment request [[amount]] via [[gateway]]\r\n', '[[username]] payment request [[amount]] via [[gateway]]\r\n', '[[username]] payment request [[amount]] via [[gateway]]\r\n', '[[username]] payment request [[amount]] via [[gateway]]\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(16, 1, 'Payment Approved', 'support@achi.com', 'PAYMENT_APPROVED', 'Payment Approved', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"charge\":\"Charge\",\"transaction\":\"Transaction\",\"username\":\"Username\",\"gateway\":\"Gateway\"}', '[[username]] payment request [[amount]] charge [[charge]] via [[gateway]] has been approved\r\n', '[[username]] payment request [[amount]] via [[gateway]] has been approved', '[[username]] payment request [[amount]] via [[gateway]] has been approved', '[[username]] payment request [[amount]] via [[gateway]] has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(17, 1, 'Payment Rejected', 'support@achi.com', 'PAYMENT_REJECTED', 'Payment Rejected', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"transaction\":\"Transaction\",\"username\":\"Username\",\"gateway\":\"Gateway\"}', '[[username]] payment request [[amount]] via [[gateway]] payment rejected\r\n', '[[username]] payment request [[amount]] via [[gateway]] payment rejected\r\n', '[[username]] payment request [[amount]] via [[gateway]] payment rejected\r\n', '[[username]] payment request [[amount]] via [[gateway]]\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(20, 1, 'Payout Request  Admin', 'support@achi.com', 'PAYOUT_REQUEST_TO_ADMIN', 'payout Request  Admin', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"transaction\":\"Transaction Number\"}', '[[sender]] payout money amount [[amount]] . Transaction: #[[transaction]] [[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] . Transaction: #[[transaction]] [[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] . Transaction: #[[transaction]] [[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] . Transaction: #[[transaction]] [[sender]] request for payment amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(21, 1, 'Payout Request from', 'support@achi.com', 'PAYOUT_REQUEST_FROM', 'Payout Request from', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-07-07 06:29:08'),
(22, 1, 'Payout Request Approved', 'support@achi.com', 'PAYOUT_APPROVED', 'Payout Request Approved', '{\"amount\":\"Received Amount\",\"transaction\":\"Transaction Number\",\r\n\"gateway_name\":\"Gateway\",\"charge\":\"Charge\",\"feedback\":\"Feedback\",\"currency\":\"Currency\"\r\n\r\n}', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(23, 1, 'Payout Request Cancel', 'support@achi.com', 'PAYOUT_CANCEL', 'Payout Request Cancel', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(24, 1, 'Reset Password Notification', 'support@achi.com', 'PASSWORD_RESET', 'Reset Password Notification', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(25, 1, 'Add Fund User', 'support@achi.com', 'ADD_FUND_USER_USER', 'Add Fund User', '{\"amount\":\"Request Amount\",\"transaction\":\"Transaction Number\"}', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]]. Transaction: #[[transaction]]', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(27, 1, 'Add Fund User Admin', 'support@achi.com', 'ADD_FUND_USER_ADMIN', 'Add Fund User Admin', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"username\":\"User Name\"}', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, NULL, NULL, NULL),
(28, 1, 'Plan Invest Notification', 'support@achi.com', 'PLAN_INVEST', 'Plan Invest Notification', '{\"username\":\"Username\",\"plan_name\":\"Plan Name\",\"amount\":\"Invest Amount\"}', '[[username]] invested [[amount]] from plan [[plan_name]]', '[[username]] invested [[amount]] from plan [[plan_name]]', '[[username]] invested [[amount]] from plan [[plan_name]]', '[[username]] invested [[amount]] from plan [[plan_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, NULL, NULL, NULL),
(29, 1, 'Project Invest Notification', 'support@achi.com', 'PROJECT_INVEST', 'Project Invest Notification', '{\"username\":\"Username\",\"project_name\":\"Project Name\",\"total_unit\":\"Total Unit\",\"unit_price\":\"Unit Price\",\"amount\":\"Invest Amount\"}', '[[username]] invest [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', '[[username]] invest [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', '[[username]] invest [[amount]] form Project [[project_name]] . Total Unit  : [[total_unit]]  , Per Unit Price  : [[unit_price]]', '[[username]] invest [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', NULL, '2024-07-09 10:24:25'),
(31, 1, 'Plan Return Notification', 'support@achi.com', 'PLAN_RETURN', 'Plan Return Notification', '{\"username\":\"Username\",\"plan_name\":\"Plan Name\",\"amount\":\"Return Amount\"}', '[[amount]] return from plan [[plan_name]].', '[[amount]] return from plan [[plan_name]].', '[[amount]] return from plan [[plan_name]].', '[[amount]] return from plan [[plan_name]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(32, 1, 'Project Return Notification', 'support@achi.com', 'PROJECT_RETURN', 'Project Return Notification', '{\"username\":\"Username\",\"project\":\"Project Name\",\"amount\":\"Return Amount\"}', '[[amount]] Return From Project [[project]].', '[[amount]] Return From Project [[project]].', '[[amount]] Return From Project [[project]].', '[[amount]] Return From Project [[project]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(33, 1, 'Plan Capital Back Notification', 'support@achi.com', 'PLAN_CAPITAL_BLACK', 'Plan Capital Back Notification', '{\"username\":\"Username\",\"plan\":\"Plan Name\",\"amount\":\"Capital Back Amount\"}', '[[amount]] Capital Back From Plan [[plan]].', '\r\n[[amount]] Capital Back From Plan [[plan]].\r\n', '\r\n[[amount]] Capital Back From Plan [[plan]].\r\n', '\r\n[[amount]] Capital Back From Plan [[plan]].\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(34, 1, 'Project Capital Back Notification.', 'support@achi.com', 'PROJECT_CAPITAL_BACK', 'Project Capital Back Notification.', '{\"username\":\"Username\",\"amount\":\"Capital Back Amount\",\"project\":\"Project Name\"}', '[[amount]] Capital Back From Project [[project]]', '[[amount]] Capital Back From Project [[project]]', '[[amount]] Capital Back From Project [[project]]', '[[amount]] Capital Back From Project [[project]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(35, 1, 'Referral Bonus Notification', 'support@achi.com', 'REFERRAL_BONUS', 'Referral Bonus Notification', '{\"transaction_id\":\"Transaction Id\",\"amount\":\"Amount\",\"bonus_from\":\"Bonus Form\",\"final_balance\":\"Final Balance\",\"level\":\"Level\"}', '[[amount]] Referral Bonus From [[bonus_from]] .Level: [[level]]', '[[amount]] Referral Bonus From [[bonus_from]] .Level: [[level]]', '[[amount]] Referral Bonus From [[bonus_from]] .Level: [[level]]', '[[amount]] Referral Bonus From [[bonus_from]] .Level: [[level]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(37, 1, 'Support Ticket Create', 'support@achi.com', 'SUPPORT_TICKET_CREATE', 'New Support Ticket', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, NULL, NULL, NULL),
(38, 1, 'Admin Replied Ticket', 'support@achi.com', 'ADMIN_REPLIED_TICKET', 'Admin Replied Ticket', '{\"ticket_id\":\"Support Ticket ID\"}', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(39, 1, 'Balance deducted by Admin', 'support@achi.com', 'DEDUCTED_BALANCE', 'Your Account has been debited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, NULL, NULL, NULL),
(40, 1, 'Add Balance', 'support@achi.com', 'ADD_BALANCE', 'Your Account has been credited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-07-07 06:24:55'),
(41, 1, 'Contact Info', 'support@achi.com', 'CONTACT_INFO', 'Contact Information', '{\"name\":\"User Name\",\"email\":\"Email Address\",\"phone\":\"Phone Number\",\"invest_type\":\"Invest Type\",\"message\":\"Message\"}', 'User Contact Info\r\n\r\nName : [[name]]\r\nEmail : [[email]]\r\nPhone : [[phone]]\r\nInvest Type :[[invest_type]]\r\nMessage : [[message]]', 'User Contact Info\r\n\r\nName : [[name]]\r\nEmail : [[email]]\r\nPhone : [[phone]]\r\nInvest Type :[[invest_type]]\r\nMessage : [[message]]', 'Please check the mail or SMS that the user\'s contact information has been sent', 'Please check the mail or SMS that the user\'s contact information has been sent', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', NULL, NULL),
(42, 1, 'Plan Invest Notification', 'support@achi.com', 'PLAN_INVEST_USER', 'Plan Invest Notification', '{\"username\":\"Username\",\"plan_name\":\"Plan Name\",\"amount\":\"Invest Amount\"}', 'You invested [[amount]] from plan [[plan_name]]', 'You invested [[amount]] from plan [[plan_name]]', 'You invested [[amount]] from plan [[plan_name]]', 'You invested [[amount]] from plan [[plan_name]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2024-05-22 07:02:28', '2024-05-22 07:02:28'),
(43, 1, 'Project Invest Notification for user', 'support@achi.com', 'PROJECT_INVEST_USER', 'Project Invest Notification for user', '{\"username\":\"Username\",\"project_name\":\"Project Name\",\"total_unit\":\"Total Unit\",\"unit_price\":\"Unit Price\",\"amount\":\"Invest Amount\"}', 'You invested [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', 'You invested [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', 'You invested [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', 'You invested [[amount]] form Project [[project_name]] . Total Unit : [[total_unit]] Per Unit Price :[[unit_price]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2024-08-03 10:45:55', '2024-08-03 10:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `template_name` varchar(191) DEFAULT NULL,
  `custom_link` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_status` tinyint(1) DEFAULT 1 COMMENT '0 => inactive, 1 => active',
  `status` tinyint(1) DEFAULT 1 COMMENT '0 => unpublish, 1 => publish',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => admin create, 1 => developer create, 2 => create for menus',
  `is_breadcrumb_img` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `template_name`, `custom_link`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `meta_image`, `meta_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `type`, `is_breadcrumb_img`, `created_at`, `updated_at`) VALUES
(1, 'home', '/', 'light', NULL, 'Home', 'Invest in AgriWealth | Secure Your Future with Profitable Farm Investments', '[\"agriculture investment\",\"farm investment platform\",\"sustainable farming\",\"investment opportunities\",\"agribusiness\",\"farm shares\",\"secure investment\",\"passive income\",\"green investments\",\"profitable farming\"]', 'Explore sustainable farm investment opportunities with [Your Platform Name]. Invest in agriculture to secure your financial future while supporting the environment. Start investing today and watch your wealth grow with profitable agricultural projects.', 'seo/mycWQ5e42o0Vg9x6fCCRaisdv6wDmH.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-05-27 06:54:41', '2024-08-20 13:09:00'),
(2, 'home 01', 'home-01', 'light', NULL, 'Home', 'Invest in AgriWealth | Secure Your Future with Profitable Farm Investments', '[\"agriculture investment\",\"farm investment platform\",\"sustainable farming\",\"investment opportunities\",\"agribusiness\",\"farm shares\",\"secure investment\",\"passive income\",\"green investments\",\"profitable farming\"]', 'Explore sustainable farm investment opportunities with [Your Platform Name]. Invest in agriculture to secure your financial future while supporting the environment. Start investing today and watch your wealth grow with profitable agricultural projects.', 'seo/6uXb9YYjgv30vLlUXAzu6JmfRRN42R.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-05-28 02:52:36', '2024-08-20 13:12:15'),
(3, 'home 02', 'home-02', 'light', NULL, 'Home', 'Invest in AgriWealth | Secure Your Future with Profitable Farm Investments', '[\"agriculture investment\",\"farm investment platform\",\"sustainable farming\",\"investment opportunities\",\"agribusiness\",\"farm shares\",\"secure investment\",\"passive income\",\"green investments\",\"profitable farming\"]', 'Explore sustainable farm investment opportunities with [Your Platform Name]. Invest in agriculture to secure your financial future while supporting the environment. Start investing today and watch your wealth grow with profitable agricultural projects.', 'seo/qtqePayKkOUCIdycMClBle7B2a9DkB.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-05-28 03:33:44', '2024-08-20 13:14:29'),
(4, 'about us', 'about-us', 'light', NULL, 'About Us', 'About Us | Empowering Sustainable Farm Investments', '[\"farm investment platform\",\"about us\",\"sustainable farming\",\"agricultural investments\",\"agribusiness\",\"ethical investing\",\"green investment platform\",\"investment opportunities\",\"eco-friendly investments\",\"financial growth\"]', 'Learn more about AgriWealth, a leading platform dedicated to sustainable farm investments. Discover our mission to empower investors with opportunities in profitable and environmentally responsible agriculture projects.', 'seo/xlE7JqBgiMBnlncnHTplG6Rhy6pWv6.webp', 'local', '/cOVA77pvnkkFMDg8kCnA7FIXmvw1n8.avif', 'local', 1, 1, 0, 1, '2024-05-28 09:33:06', '2024-08-20 13:19:31'),
(5, 'projects', 'projects', 'light', NULL, 'Projects', 'Explore Investment Projects | Profitable Agricultural Opportunities', '[\"investment projects\",\"agricultural investments\",\"farm investment opportunities\",\"sustainable farming projects\",\"agribusiness\",\"farm shares\",\"eco-friendly investments\",\"profitable agriculture\",\"project investment\",\"farm projects\"]', 'Explore a wide range of agricultural investment projects on AgriWealth. Invest in sustainable and profitable farm ventures, from crop production to livestock farming.', 'seo/PPyynovPkY2SyEbj4bIZxIY4Zf6clj.webp', 'local', 'pagesImage/pQmY3BseQRWzPLbebv6xJI7ttrk18x.avif', 'local', 1, 1, 0, 1, '2024-05-28 09:46:22', '2024-08-21 05:39:05'),
(6, 'faq', 'faq', 'light', NULL, 'FAQ', 'Frequently Asked Questions | Farm Investment Platform FAQs', '[\"FAQ\",\"farm investment platform\",\"agricultural investment questions\",\"sustainable farming\"]', 'Find answers to common questions about AgriWealth. Learn more about how to invest in agricultural projects, understand our platform, and get support for your investment journey.', 'seo/lKfpLCi8s2LcHEjlhD23h4nCfMNr56.webp', 'local', '/51yDNtv2ooNypfHiXuEbleMzBt0sPA.avif', 'local', 1, 1, 0, 1, '2024-05-28 10:49:47', '2024-08-20 13:24:26'),
(8, 'contact', 'contact', 'light', NULL, 'Contact', 'Contact Us | Get in Touch with AgriWealth', '[\"contact us\",\"farm investment platform\",\"reach out\",\"customer support\",\"investment inquiries\",\"agricultural investment questions\",\"contact information\",\"get in touch\",\"support\",\"agribusiness\"]', 'Need assistance or have questions about [Your Platform Name]? Contact us for support with your farm investment inquiries. Our team is here to help with any questions or concerns you may have.', 'seo/are39wUDXPEooMdbMnJLHKeTIv4n8M.webp', 'local', '/pE7OJJNu2edcPRn22yIS7mGcFq6aWb.avif', 'local', 1, 1, 0, 1, '2024-05-29 02:59:08', '2024-08-20 13:26:57'),
(9, 'Project Details', 'project_details', 'light', NULL, 'Project Details', 'Project Details | In-Depth Information on Agricultural Investments', '[\"project details\",\"agricultural investments\",\"farm investment information\"]', 'Get comprehensive details on our agricultural investment projects at AgriWealth. Explore in-depth information about each farm project, including investment opportunities, sustainability practices, and potential returns.', 'seo/ltHqglpDaXFbpYyYlbrBY1uVuRehG5.webp', 'local', 'pagesImage/6CDG1ot6uJ9LaD2fFbyQYqgdEHtV63.avif', 'local', 1, 1, 1, 1, '2024-06-09 09:20:38', '2024-08-20 13:28:36'),
(10, 'Blog', 'blogs', 'light', NULL, 'Blogs', 'Blog | Insights and Updates on Farm Investments and Agriculture', '[\"blog\",\"farm investment insights\",\"agricultural news\",\"sustainable farming\",\"investment tips\",\"agribusiness updates\",\"farming trends\",\"investment strategies\",\"eco-friendly agriculture\",\"farm investment advice\"]', 'Stay informed with the latest insights and updates from [Your Platform Name] blog. Explore articles on farm investments, sustainable agriculture, industry trends, and investment tips.', 'seo/TWhZTC316dHRfqKMxruLIwMzgwLd7T.webp', 'local', 'pagesImage/EgxvUMu5CPzMcnEfDGAXhXxfLSuALk.avif', 'local', 1, 1, 1, 1, '2024-06-10 08:45:11', '2024-08-20 13:30:58'),
(13, 'privacy policy', 'privacy-policy', 'light', NULL, 'Privacy Policy', 'Privacy Policy | AgriWealth Data Protection and Privacy', '[\"Privacy Policy\",\"privacy policy\",\"data protection\",\"user privacy\",\"farm investment platform\"]', 'Read the Privacy Policy of AgriWealth to understand how we protect your personal data and privacy. Learn about our data handling practices, security measures, and your rights regarding your information.', 'seo/Lol8wZCoIKUPgFPkqLtXHSq20DGEoV.webp', 'local', '/RxOpTjx3t9hu2BhdTlzisAQQV6pBQY.avif', 'local', 1, 1, 0, 1, '2024-06-30 12:01:33', '2024-08-20 13:32:48'),
(14, 'terms &amp; condition', 'terms-condition', 'light', NULL, 'Terms &amp; Condition', 'Terms &amp; Conditions | AgriWealth User Agreement', '[\"Terms &amp; Condition\",\"terms and conditions\",\"user agreement\",\"farm investment platform\",\"legal terms\",\"usage policies\",\"investment terms\"]', 'Review the Terms &amp; Conditions for AgriWealth  to understand the rules and agreements governing the use of our farm investment platform.', 'seo/2APPsqihtbC2DcM6smDmOiu3leGTeO.webp', 'local', '/C5E4AZLvlFVHi4pgHBzro7q77cLun4.avif', 'local', 1, 1, 0, 1, '2024-06-30 12:30:45', '2024-08-20 13:35:22'),
(15, 'cookie &amp; policy', 'cookie-policy', 'light', NULL, 'Cookie &amp; Policy', 'Cookie Policy | AgriWealth Cookie Usage and Management', '[\"Cookie &amp; Policy\",\"cookie policy\",\"cookie usage\",\"data privacy\",\"farm investment platform\",\"cookies management\",\"tracking technologies\",\"user consent\"]', 'Learn about AgriWealth\'s Cookie Policy and how we use cookies to enhance your experience on our farm investment platform.', 'seo/hPNzha1wgBXJWgx4m7tSBquFoxHYJ1.webp', 'local', '/BnZzG4xnLL501ZcTfXLfx10KrFSw3d.avif', 'local', 1, 1, 0, 1, '2024-06-30 12:36:41', '2024-08-20 13:38:57'),
(16, 'Login', 'login', 'light', NULL, 'Login', 'Login | Access Your AgriWealth Account', '[\"Login\",\"login\",\"user login\",\"farm investment account\",\"secure login\",\"account access\",\"investor login\",\"farm investment platform\",\"sign in\",\"account security\",\"user authentication\"]', 'Access your AgriWealth account with secure login. Sign in to manage your farm investments, view project details, and track your financial progress.', 'seo/gi9qNXIwZ1AGeRicEOXcUKTGup2FEw.webp', 'local', 'pagesImage/z5bFu7N1kCJDm0SLsK4eRptkxyIpTw.avif', 'local', 1, 1, 1, 1, '2024-07-01 05:03:53', '2024-08-20 13:41:35'),
(17, 'Register', 'register', 'light', NULL, 'Registration', 'Registration', '[\"Registration\",\"sign up\",\"create account\",\"farm investment platform\",\"register\",\"new user registration\",\"account creation\",\"investor sign up\"]', 'Sign up for [Your Platform Name] to start exploring farm investment opportunities. Create your account easily and securely to manage your investments, access project details, and benefit from our agricultural investment platform.', 'seo/oUk4dMG7PfVF0TxQ6kIp1sgkY63VG1.webp', 'local', 'pagesImage/1LWDByAkpMwDcFy37Og3hx94pEApX5.avif', 'local', 1, 1, 1, 1, '2024-07-01 05:03:53', '2024-08-20 13:43:39'),
(18, 'Forget Password', 'reset', 'light', NULL, 'Reset', 'Forgot Password | AgriWealth Account Recovery', '[\"forgot password\",\"password recovery\",\"account reset\"]', 'Recover access to your [Your Platform Name] account if you\'ve forgotten your password. Follow our secure process to reset your password and regain access to your farm investment platform.', 'seo/0OBYnYdtcu9XN78pvCwGZzX2EPZoHI.webp', 'local', 'pagesImage/uPkUaPKFVRVvJ7dyssS4HU43HhWKmF.avif', 'local', 1, 1, 1, 1, '2024-07-01 07:30:16', '2024-08-20 13:45:18'),
(19, 'Reset Password', 'reset_password', 'light', NULL, 'Reset Password', 'Reset Password | AgriWealth Account Recovery', '[\"Reset Password\",\"reset password\",\"password reset\",\"account recovery\",\"farm investment platform\",\"secure password\"]', 'Change your password securely on AgriWealth. Follow the instructions to reset your password and regain access to your farm investment account.', 'seo/KOEO2Gs0is422vOuDdUtBH30YSCpeO.webp', 'local', 'pagesImage/unCh4VQZOU6DyJTE0PfnLYIcMeMlkL.avif', 'local', 1, 1, 1, 1, '2024-07-01 09:34:09', '2024-08-20 13:47:12'),
(20, '2FA', '2fa', 'light', NULL, '2FA Verification', 'Two-Factor Authentication', '[\"2FA Verification\",\"two-factor authentication\"]', '2FA Verification', 'seo/MFJu1diIb8uDrjlm34G2WnjsILsnXr.webp', 'local', 'pagesImage/iXtA2MfHUGm6GTzswNwfHkfi9DLXe6.avif', 'local', 1, 1, 1, 1, '2024-07-01 10:13:42', '2024-08-20 13:48:24'),
(21, 'Email Verification', 'email_verification', 'light', NULL, 'Email Verification', 'Email Verification', '[\"Email Verification\"]', 'Enhance the security of your AgriWealth account with Two-Factor Authentication (2FA). Add an extra layer of protection to your login process to safeguard your farm investments and personal information.', 'seo/xiKfTuO7Z8PjHVe8GyJO037gSSGEC9.webp', 'local', 'pagesImage/VMs9oAxeI50VZcwinmuh7vUkgP1iPT.avif', 'local', 1, 1, 1, 1, '2024-07-01 10:53:05', '2024-08-20 13:49:07'),
(22, 'SMS Verification', 'sms_verification', 'light', NULL, 'SMS Verification', 'SMS Verification', '[\"SMS Verification\"]', 'Enhance the security of your AgriWealth account with Two-Factor Authentication (2FA). Add an extra layer of protection to your login process to safeguard your farm investments and personal information.', 'seo/rCaTeIZK6zRLbZcPkGtmwdScGtoFOc.webp', 'local', 'pagesImage/7QILQiQZaYRWtTGsgD4kOzElFHgjfI.avif', 'local', 1, 1, 1, 1, '2024-07-01 10:53:05', '2024-08-20 13:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `page_details`
--

CREATE TABLE `page_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sections` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_details`
--

INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(9, 9, 1, 'Project Details', NULL, NULL, '2024-06-09 09:21:10', '2024-06-09 09:21:10'),
(12, 10, 1, 'Blogs', NULL, NULL, '2024-06-10 08:45:54', '2024-08-21 05:40:06'),
(22, 20, 1, 'Two FA Verification', NULL, NULL, '2024-07-01 10:34:36', '2024-07-01 10:34:36'),
(25, 1, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_1]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_work_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[agriculture_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_1\",\"how_work_section\",\"position_apart_section\",\"project_section\",\"agriculture_section\",\"farming_section\",\"pricing_section\",\"testimonial_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-07 04:32:06', '2024-07-14 12:44:34'),
(26, 2, 1, 'Home 01', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_1]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_work_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[agriculture_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_1\",\"how_work_section\",\"position_apart_section\",\"project_section\",\"agriculture_section\",\"pricing_section\",\"farming_section\",\"testimonial_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-07 04:34:31', '2024-07-07 04:34:31'),
(27, 3, 1, 'Home 02', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investment_way_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[product_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investor_review_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_2\",\"about_section_2\",\"investment_way_section\",\"product_section\",\"counter_section_2\",\"pricing_section_2\",\"investor_review_section\",\"blog_section_2\",\"subscribe_section\"]', '2024-07-07 04:37:02', '2024-07-15 06:17:01'),
(28, 4, 1, 'About Us', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"about_section\",\"position_apart_section\",\"farming_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-07 04:39:12', '2024-07-07 04:39:12'),
(29, 5, 1, 'Project', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investor_review_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"project_section_2\",\"counter_section_2\",\"investor_review_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-07 04:41:43', '2024-07-29 11:46:32'),
(30, 6, 1, 'FAQ', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq_section\",\"subscribe_section\"]', '2024-07-07 04:42:43', '2024-07-07 04:42:43'),
(31, 8, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[address_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact_section\",\"address_section\",\"subscribe_section\"]', '2024-07-07 04:43:29', '2024-07-07 04:43:29'),
(32, 13, 1, 'Privacy Policy', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[privacy_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"privacy_policy\",\"subscribe_section\"]', '2024-07-07 04:44:09', '2024-07-07 04:44:09'),
(33, 14, 1, 'Terms &amp; Condition', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[terms_condition]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"terms_condition\",\"subscribe_section\"]', '2024-07-07 04:44:37', '2024-07-07 04:44:37'),
(34, 15, 1, 'Cookie &amp; Policy', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[cookie_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"cookie_policy\",\"subscribe_section\"]', '2024-07-07 04:45:07', '2024-07-07 04:45:07'),
(35, 16, 1, 'Login', NULL, NULL, '2024-07-07 04:45:27', '2024-07-07 04:45:27'),
(36, 17, 1, 'Registration', NULL, NULL, '2024-07-07 04:45:39', '2024-07-07 04:45:39'),
(37, 18, 1, 'Forget Password', NULL, NULL, '2024-07-07 04:45:49', '2024-07-07 04:45:49'),
(38, 19, 1, 'Reset Password', NULL, NULL, '2024-07-07 04:45:59', '2024-07-07 04:45:59'),
(39, 21, 1, 'Email Verification', NULL, NULL, '2024-07-07 04:46:08', '2024-07-07 04:46:08'),
(40, 22, 1, 'SMS Verification', NULL, NULL, '2024-07-07 04:46:16', '2024-07-07 04:46:16'),
(41, 1, 23, 'Hogar', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_1]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_work_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[agriculture_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_1\",\"how_work_section\",\"position_apart_section\",\"project_section\",\"agriculture_section\",\"farming_section\",\"pricing_section\",\"testimonial_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-30 11:15:58', '2024-07-30 11:15:58'),
(42, 2, 23, 'Hogar 01', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_1]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_work_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[agriculture_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_1\",\"how_work_section\",\"position_apart_section\",\"project_section\",\"agriculture_section\",\"pricing_section\",\"farming_section\",\"testimonial_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-30 11:40:08', '2024-07-30 11:40:08'),
(43, 3, 23, 'Hogar 02', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[banner_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investment_way_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[product_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[pricing_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investor_review_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"banner_section_2\",\"about_section_2\",\"investment_way_section\",\"product_section\",\"counter_section_2\",\"pricing_section_2\",\"investor_review_section\",\"blog_section_2\",\"subscribe_section\"]', '2024-07-30 11:43:32', '2024-07-30 11:43:32'),
(44, 4, 23, 'Sobre nosotros', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[position_apart_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[farming_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"about_section\",\"position_apart_section\",\"farming_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-30 11:45:43', '2024-07-30 11:45:43'),
(45, 5, 23, 'Proyecto', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[project_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section_2]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[investor_review_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"project_section_2\",\"counter_section_2\",\"investor_review_section\",\"blog_section\",\"counter_section\",\"subscribe_section\"]', '2024-07-30 11:48:17', '2024-07-30 11:48:17'),
(46, 6, 23, 'FAQ', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq_section\",\"subscribe_section\"]', '2024-07-30 11:49:26', '2024-07-30 11:49:26'),
(47, 8, 23, 'Contacto', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[address_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact_section\",\"address_section\",\"subscribe_section\"]', '2024-07-30 11:50:43', '2024-07-30 11:50:43'),
(48, 9, 23, 'detalles del proyecto', NULL, NULL, '2024-07-30 11:51:37', '2024-07-30 11:51:37'),
(49, 10, 23, 'Blogs', NULL, NULL, '2024-07-30 11:51:58', '2024-08-21 05:54:46'),
(50, 13, 23, 'política de privacidad', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[privacy_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"privacy_policy\",\"subscribe_section\"]', '2024-07-30 11:53:01', '2024-07-30 11:53:01'),
(51, 14, 23, 'Términos y Condiciones', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[terms_condition]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"terms_condition\",\"subscribe_section\"]', '2024-07-30 11:53:42', '2024-07-30 11:53:42'),
(52, 15, 23, 'Política de cookies', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[cookie_policy]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[subscribe_section]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"cookie_policy\",\"subscribe_section\"]', '2024-07-30 11:54:13', '2024-07-30 11:54:13'),
(53, 16, 23, 'Acceso', NULL, NULL, '2024-07-30 11:54:38', '2024-07-30 11:54:38'),
(54, 17, 23, 'Registro', NULL, NULL, '2024-07-30 11:54:54', '2024-07-30 11:54:54'),
(55, 18, 23, 'Contraseña olvidada', NULL, NULL, '2024-07-30 11:55:14', '2024-07-30 11:55:14'),
(56, 19, 23, 'Reset Password', NULL, NULL, '2024-07-30 11:55:36', '2024-07-30 11:55:36'),
(57, 20, 23, 'Verificación de dos FA', NULL, NULL, '2024-07-30 11:55:56', '2024-07-30 11:55:56'),
(58, 21, 23, 'Email Verification', NULL, NULL, '2024-07-30 11:56:17', '2024-07-30 11:56:17'),
(59, 22, 23, 'SMS Verification', NULL, NULL, '2024-07-30 11:56:28', '2024-07-30 11:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `payout_method_id` int(11) UNSIGNED DEFAULT NULL,
  `payout_currency_code` varchar(50) DEFAULT NULL,
  `amount` decimal(18,8) DEFAULT 0.00000000,
  `charge` decimal(18,8) DEFAULT 0.00000000,
  `net_amount` decimal(18,8) DEFAULT 0.00000000,
  `amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `net_amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `response_id` varchar(255) DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `meta_field` varchar(255) NOT NULL COMMENT 'for fullerwave',
  `feedback` text DEFAULT NULL,
  `trx_id` varchar(50) DEFAULT NULL,
  `balance_type` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0=> pending, 1=> generated, 2=>success 3=> cancel,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bank_name` text DEFAULT NULL COMMENT 'automatic payment for bank name',
  `banks` text DEFAULT NULL COMMENT 'admin bank permission',
  `parameters` text DEFAULT NULL COMMENT 'api parameters',
  `extra_parameters` text DEFAULT NULL,
  `inputForm` text DEFAULT NULL,
  `currency_lists` text DEFAULT NULL,
  `supported_currency` text DEFAULT NULL,
  `payout_currencies` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `is_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `is_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `confirm_payout` tinyint(4) NOT NULL DEFAULT 1,
  `is_auto_update` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'currency rate auto update',
  `currency_type` tinyint(4) NOT NULL DEFAULT 1,
  `logo` varchar(255) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `name`, `code`, `description`, `bank_name`, `banks`, `parameters`, `extra_parameters`, `inputForm`, `currency_lists`, `supported_currency`, `payout_currencies`, `is_active`, `is_automatic`, `is_sandbox`, `environment`, `confirm_payout`, `is_auto_update`, `currency_type`, `logo`, `driver`, `created_at`, `updated_at`) VALUES
(2, 'Bank Transfer', 'paypal-manual', 'Payment will receive within 9 hours', NULL, NULL, '[]', NULL, '{\"account_name\":{\"field_name\":\"account_name\",\"field_label\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_details\":{\"field_name\":\"account_details\",\"field_label\":\"Account Details\",\"type\":\"textarea\",\"validation\":\"required\"},\"n_i_d\":{\"field_name\":\"n_i_d\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, '[\"EUR\",\"CAD\"]', '[{\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"0.00003\",\"max_limit\":\"10000000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.013\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 0, 0, 'test', 1, 0, 1, 'payoutMethod/ak6zVFBh2VA9vLBwxKOZad8rklp79E4lO4P8aTji.png', 'local', '2020-12-23 07:40:51', '2024-08-21 12:16:25'),
(3, 'Bank', 'bank', 'Payment will receive within 8 days', NULL, NULL, '[]', NULL, '{\"d\":{\"field_name\":\"d\",\"field_label\":\"d\",\"type\":\"text\",\"validation\":\"required\"},\"f\":{\"field_name\":\"f\",\"field_label\":\"f\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, '[\"HUR\"]', '[{\"currency_symbol\":\"HUR\",\"conversion_rate\":\"100\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"1.2\",\"fixed_charge\":\"2\"}]', 0, 0, 0, 'test', 1, 0, 1, NULL, 'local', '2020-12-27 07:23:36', '2023-09-29 22:31:22'),
(9, 'Flutterwave', 'flutterwave', 'Payment will receive within 1 days', '{\"0\":{\"NGN BANK\":\"NGN BANK\",\"NGN DOM\":\"NGN DOM\",\"GHS BANK\":\"GHS BANK\",\"KES BANK\":\"KES BANK\",\"ZAR BANK\":\"ZAR BANK\",\"INTL EUR & GBP\":\"INTL EUR & GBP\",\"INTL USD\":\"INTL USD\",\"INTL OTHERS\":\"INTL OTHERS\",\"FRANCOPGONE\":\"FRANCOPGONE\",\"XAF/XOF MOMO\":\"XAF/XOF MOMO\",\"mPesa\":\"mPesa\",\"Rwanda Momo\":\"Rwanda Momo\",\"Uganda Momo\":\"Uganda Momo\",\"Zambia Momo\":\"Zambia Momo\",\"Barter\":\"Barter\",\"FLW\":\"FLW\"}}', '[\"NGN BANK\",\"NGN DOM\",\"GHS BANK\"]', '{\"Public_Key\":\"\",\"Secret_Key\":\"\",\"Encryption_Key\":\"\"}', NULL, '[]', '{\"USD\":\"USD\",\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', '[\"USD\",\"KES\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"KES\",\"conversion_rate\":\"1.38\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"KES\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/3ZHEVOuAMEKXfG2oeGesEkMEXua0isCJPDFbn6Ix.jpg', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(10, 'Razorpay', 'razorpay', 'Payment will receive within 1 days', '', NULL, '{\"account_number\":\"\",\"Key_Id\":\"\",\"Key_Secret\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"INR\":\"INR\"}', '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/KzWb68n0qIkz998tUDeiTj5T45idCJ7Vsz5rVr6O.jpg', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(11, 'Paystack', 'paystack', 'Payment will receive within 1 days', '', NULL, '{\"Public_key\":\"\",\"Secret_key\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"ZAR\":\"ZAR\"}', '[\"NGN\",\"GHS\",\"ZAR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ZAR\",\"currency_symbol\":\"ZAR\",\"conversion_rate\":\"0.17\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 1, 1, 'payoutMethod/R171DPtw6jtQL7tvf9NR2gtnwhMTRpFlW51aPjKP.png', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(12, 'Coinbase', 'coinbase', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"API_Secret\":\"\",\"Api_Passphrase\":\"\"}', '{\"webhook\":\"payout\"}', '{\"crypto_address\":{\"field_name\":\"crypto_address\",\"field_label\":\"Crypto Address\",\"type\":\"text\",\"validation\":\"required\"}}', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.068\",\"min_limit\":\"1000\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/moST8wELN5rooqTg1jO5KBeKPrpOn2be3FNeUziY.png', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(14, 'Perfect Money', 'perfectmoney', 'Payment will receive within 1 days', '', NULL, '{\"Passphrase\":\"\",\"Account_ID\":\"\",\"Payer_Account\":\"\"}', '', '[]', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 1, 1, 'payoutMethod/Y7nhbYHjmNnKXDFPQfCBbmGpHvrjH6L8clZXrLrX.jpg', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(15, 'Paypal', 'paypal', 'Payment will receive within 1 days', '', NULL, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"webhook\":\"payout\"}', '[]', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', '[\"EUR\",\"USD\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/UZ9Ask4ycKIT1XML896p035iDb1f3wGm5HebFALO.png', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25'),
(16, 'Binance', 'binance', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"\",\"KEY_Secret\":\"\"}', '', '[]', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.0043\",\"min_limit\":\"10\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/X6ZKvtR4xcxlSnHKS8FZQuTmOQy270hOyPeUbmSh.png', 'local', '2020-12-27 07:23:36', '2024-08-21 12:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `total_units` int(11) NOT NULL,
  `project_duration` int(11) DEFAULT NULL,
  `project_duration_type` varchar(10) DEFAULT NULL,
  `return` decimal(8,2) DEFAULT NULL,
  `return_type` varchar(10) DEFAULT NULL,
  `return_period` int(11) DEFAULT NULL,
  `return_period_type` varchar(10) DEFAULT NULL,
  `number_of_return` int(11) DEFAULT NULL,
  `minimum_invest` decimal(10,2) DEFAULT NULL,
  `maximum_invest` decimal(10,2) DEFAULT NULL,
  `fixed_invest` decimal(10,2) DEFAULT NULL,
  `thumbnail_image` varchar(255) DEFAULT NULL,
  `thumbnail_image_driver` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `images_driver` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `amount_has_fixed` tinyint(1) NOT NULL DEFAULT 0,
  `project_duration_has_unlimited` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_return_has_unlimited` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `available_units` int(11) DEFAULT NULL,
  `maturity` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `capital_back` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invest_last_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_investments`
--

CREATE TABLE `project_investments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `per_unit_price` decimal(11,2) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `return` decimal(11,2) DEFAULT NULL,
  `number_of_return` int(11) DEFAULT NULL,
  `is_life_time` tinyint(1) DEFAULT NULL,
  `return_period` int(11) DEFAULT NULL,
  `return_period_type` varchar(255) DEFAULT NULL,
  `next_return` timestamp NULL DEFAULT NULL,
  `capital_back` tinyint(1) DEFAULT NULL,
  `project_expiry_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `project_period_is_lifetime` tinyint(1) NOT NULL DEFAULT 0,
  `last_return` timestamp NULL DEFAULT NULL,
  `total_return` int(11) DEFAULT NULL,
  `trx` varchar(255) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commission_type` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `commission` decimal(8,2) NOT NULL,
  `amount_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user_id` bigint(20) UNSIGNED NOT NULL,
  `to_user_id` bigint(20) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `commission_type` varchar(255) DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 =>  Open, 1 => Answered, 2 => Replied, 3 => Closed',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_message_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `transactional_id` int(11) DEFAULT NULL,
  `transactional_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `balance` varchar(20) DEFAULT NULL,
  `charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `trx_type` varchar(10) DEFAULT NULL,
  `remarks` varchar(191) NOT NULL,
  `trx_id` varchar(50) NOT NULL,
  `wallet_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `balance` decimal(8,2) DEFAULT NULL,
  `profit_balance` decimal(10,2) DEFAULT NULL,
  `total_invest` decimal(10,2) DEFAULT NULL,
  `total_profit` decimal(10,2) DEFAULT NULL,
  `plan_invest` decimal(10,2) DEFAULT NULL,
  `project_invest` decimal(10,2) DEFAULT NULL,
  `plan_profit` decimal(10,2) DEFAULT NULL,
  `project_profit` decimal(10,2) DEFAULT NULL,
  `total_commission` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `identity_verify` tinyint(1) DEFAULT NULL,
  `address_verify` tinyint(1) DEFAULT NULL,
  `two_fa` tinyint(1) DEFAULT 0,
  `two_fa_verify` tinyint(1) DEFAULT NULL,
  `two_fa_code` varchar(255) DEFAULT NULL,
  `email_verification` tinyint(1) DEFAULT NULL,
  `sms_verification` tinyint(1) DEFAULT NULL,
  `verify_code` varchar(255) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `github_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_id` int(11) DEFAULT NULL,
  `kyc_type` varchar(191) DEFAULT NULL,
  `kyc_info` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext DEFAULT NULL COMMENT 'rejected reason',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `os` varchar(191) DEFAULT NULL,
  `get_device` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `basic_controls`
--
ALTER TABLE `basic_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_storages`
--
ALTER TABLE `file_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funds_user_id_foreign` (`user_id`),
  ADD KEY `funds_gateway_id_foreign` (`gateway_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Indexes for table `investment_plans`
--
ALTER TABLE `investment_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invest_histories`
--
ALTER TABLE `invest_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invest_histories_plan_id_foreign` (`plan_id`),
  ADD KEY `invest_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_menus`
--
ALTER TABLE `manage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_permissions`
--
ALTER TABLE `notification_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_id` (`trx_id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_details_project_id_foreign` (`project_id`),
  ADD KEY `project_details_language_id_foreign` (`language_id`);

--
-- Indexes for table `project_investments`
--
ALTER TABLE `project_investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_investments_user_id_foreign` (`user_id`),
  ADD KEY `project_investments_project_id_foreign` (`project_id`);

--
-- Indexes for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_bonuses_from_user_id_foreign` (`from_user_id`),
  ADD KEY `referral_bonuses_to_user_id_foreign` (`to_user_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storages`
--
ALTER TABLE `file_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `investment_plans`
--
ALTER TABLE `investment_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invest_histories`
--
ALTER TABLE `invest_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_menus`
--
ALTER TABLE `manage_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `notification_permissions`
--
ALTER TABLE `notification_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `page_details`
--
ALTER TABLE `page_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_investments`
--
ALTER TABLE `project_investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invest_histories`
--
ALTER TABLE `invest_histories`
  ADD CONSTRAINT `invest_histories_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `investment_plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invest_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD CONSTRAINT `notification_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_details`
--
ALTER TABLE `project_details`
  ADD CONSTRAINT `project_details_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_details_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_investments`
--
ALTER TABLE `project_investments`
  ADD CONSTRAINT `project_investments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_investments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD CONSTRAINT `referral_bonuses_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referral_bonuses_to_user_id_foreign` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
