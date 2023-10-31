-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 06:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alasmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `banner_image`, `image`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/about-us-2023-08-23-06-22-18-5675.png', 'uploads/website-images/about-us-2023-07-18-04-44-23-6217.png', 'uploads/website-images/about-us-2023-07-18-04-26-26-1714.png', '2022-01-30 12:30:23', '2023-08-23 12:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `about_us_languages`
--

CREATE TABLE `about_us_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desgination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us_languages`
--

INSERT INTO `about_us_languages` (`id`, `about_id`, `lang_code`, `title`, `header1`, `header2`, `header3`, `about_us`, `name`, `desgination`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Welcome to the Alasmart marketplace', 'We’re Confident', 'You’d', 'Business Success.', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or a randomised woirds which don\'t look even.</p>\r\n<p>going to use a passage of Lorem Ipsum, you need to be sure there isn\'t a nything embarrassing hidden in the middle of text</p>', 'Shivang Preet', 'CEO & Founder', NULL, '2023-08-28 09:15:59'),
(17, 1, 'bn', 'এলাসমার্ট মার্কেটপ্লেসে স্বাগতম', 'আমরা আত্মবিশ্বাসী', 'আপনি', 'ব্যবসায়িক সাফল্য।', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তনের শিকার হয়েছে, ইনজেকশন করা হাস্যরস, বা এলোমেলোভাবে করা woirds যা দেখা যায় না।</p>\r\n<p>লরেম ইপসাম-এর একটি প্যাসেজ ব্যবহার করতে গেলে, আপনাকে নিশ্চিত হতে হবে পাঠ্যের মাঝখানে বিব্রতকর কোনো কিছু লুকিয়ে নেই</p>', 'শিবাং প্রীত', 'সিইও & ফাউন্ডার', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `additional_services`
--

CREATE TABLE `additional_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_services`
--

INSERT INTO `additional_services` (`id`, `service_id`, `service_name`, `image`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 2, 'Home Move', 'uploads/custom-images/service-add-2022-10-03-03-12-56-9482.jpg', 1, 10, '2022-10-03 09:12:56', '2022-10-03 09:12:56'),
(2, 2, 'Pc Repair', 'uploads/custom-images/service-add-2022-10-03-03-12-56-9074.jpg', 1, 5, '2022-10-03 09:12:56', '2022-10-03 09:12:56'),
(3, 3, 'Service One', 'uploads/custom-images/service-add-2022-10-03-03-17-30-6778.jpg', 1, 10, '2022-10-03 09:17:30', '2022-10-03 09:17:30'),
(4, 3, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-03-17-30-2641.jpg', 1, 8, '2022-10-03 09:17:30', '2022-10-03 09:17:30'),
(5, 3, 'Service Three', 'uploads/custom-images/service-add-2022-10-03-03-17-30-1451.jpg', 1, 15, '2022-10-03 09:17:30', '2022-10-03 09:17:30'),
(6, 3, 'Service Four', 'uploads/custom-images/service-add-2022-10-03-03-17-30-5205.jpg', 1, 4, '2022-10-03 09:17:30', '2022-10-03 09:17:30'),
(7, 5, 'Extra Service One', 'uploads/custom-images/service-add-2022-10-03-03-28-39-1242.jpg', 1, 3, '2022-10-03 09:28:39', '2022-10-03 09:28:39'),
(8, 5, 'Extra Service Two', 'uploads/custom-images/service-add-2022-10-03-03-28-39-5634.jpg', 1, 5, '2022-10-03 09:28:39', '2022-10-03 09:28:39'),
(9, 5, 'Extra Service Three', 'uploads/custom-images/service-add-2022-10-03-03-28-39-3764.jpg', 1, 4, '2022-10-03 09:28:39', '2022-10-03 09:28:39'),
(10, 6, 'Extra service one', 'uploads/custom-images/service-add-2022-10-03-03-34-32-5974.png', 1, 7, '2022-10-03 09:34:33', '2022-10-03 09:34:33'),
(11, 6, 'Extra service two', 'uploads/custom-images/service-add-2022-10-03-03-34-33-8795.png', 1, 5, '2022-10-03 09:34:33', '2022-10-03 09:34:33'),
(12, 6, 'Extra service three', 'uploads/custom-images/service-add-2022-10-03-03-34-33-2395.png', 1, 6, '2022-10-03 09:34:33', '2022-10-03 09:34:33'),
(13, 7, 'Service One', 'uploads/custom-images/service-add-2022-10-03-03-43-20-1580.png', 1, 12, '2022-10-03 09:43:20', '2022-10-03 09:43:20'),
(14, 7, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-03-43-20-3644.png', 1, 20, '2022-10-03 09:43:20', '2022-10-03 09:43:20'),
(15, 7, 'Service Three', 'uploads/custom-images/service-add-2022-10-03-03-43-20-4494.png', 1, 13, '2022-10-03 09:43:20', '2022-10-03 09:43:20'),
(16, 9, 'Service One', 'uploads/custom-images/service-add-2022-10-03-03-54-30-9396.png', 1, 20, '2022-10-03 09:54:31', '2022-10-03 09:54:31'),
(17, 9, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-03-54-31-4918.png', 1, 13, '2022-10-03 09:54:31', '2022-10-03 09:54:31'),
(18, 9, 'Service Three', 'uploads/custom-images/service-add-2022-10-03-03-54-31-7614.png', 1, 8, '2022-10-03 09:54:31', '2022-10-03 09:54:31'),
(19, 10, 'Service One', 'uploads/custom-images/service-add-2022-10-03-04-03-43-1630.png', 1, 5, '2022-10-03 10:03:43', '2022-10-03 10:03:43'),
(20, 10, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-04-03-43-9623.png', 1, 6, '2022-10-03 10:03:44', '2022-10-03 10:03:44'),
(21, 11, 'Service One', 'uploads/custom-images/service-add-2022-10-03-04-08-32-9378.png', 1, 10, '2022-10-03 10:08:32', '2022-10-03 10:08:32'),
(22, 11, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-04-08-32-1195.png', 1, 12, '2022-10-03 10:08:33', '2022-10-03 10:08:33'),
(23, 12, 'Service one', 'uploads/custom-images/service-add-2022-10-03-04-11-58-9305.png', 1, 12, '2022-10-03 10:11:58', '2022-10-03 10:11:58'),
(24, 12, 'Service two', 'uploads/custom-images/service-add-2022-10-03-04-11-58-3485.png', 1, 16, '2022-10-03 10:11:58', '2022-10-03 10:11:58'),
(25, 12, 'Service three', 'uploads/custom-images/service-add-2022-10-03-04-11-58-2352.png', 1, 8, '2022-10-03 10:11:58', '2022-10-03 10:11:58'),
(26, 13, 'Service One', 'uploads/custom-images/service-add-2022-10-03-04-17-45-1400.png', 1, 12, '2022-10-03 10:17:45', '2022-10-03 10:17:45'),
(27, 13, 'Service Two', 'uploads/custom-images/service-add-2022-10-03-04-17-45-1239.png', 1, 9, '2022-10-03 10:17:46', '2022-10-03 10:17:46'),
(28, 13, 'Service Three', 'uploads/custom-images/service-add-2022-10-03-04-17-46-7925.png', 1, 3, '2022-10-03 10:17:46', '2022-10-03 10:17:46'),
(29, 21, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-35-47-1935.jpeg', 1, 5, '2023-01-14 04:35:47', '2023-01-14 04:35:47'),
(30, 21, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-35-47-2424.jpeg', 1, 7, '2023-01-14 04:35:48', '2023-01-14 04:35:48'),
(31, 20, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-38-21-7962.jpeg', 1, 10, '2023-01-14 04:38:21', '2023-01-14 04:38:21'),
(32, 20, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-38-22-1651.jpeg', 1, 8, '2023-01-14 04:38:22', '2023-01-14 04:38:22'),
(33, 20, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-38-22-2896.jpeg', 1, 14, '2023-01-14 04:38:23', '2023-01-14 04:38:23'),
(34, 19, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-40-07-6132.jpeg', 1, 12, '2023-01-14 04:40:07', '2023-01-14 04:40:07'),
(35, 19, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-40-07-6399.jpeg', 1, 14, '2023-01-14 04:40:08', '2023-01-14 04:40:08'),
(36, 19, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-40-08-8105.jpeg', 1, 5, '2023-01-14 04:40:08', '2023-01-14 04:40:08'),
(37, 18, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-41-22-2543.jpeg', 1, 3, '2023-01-14 04:41:22', '2023-01-14 04:41:22'),
(38, 18, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-41-22-8164.jpeg', 1, 2, '2023-01-14 04:41:23', '2023-01-14 04:41:23'),
(39, 18, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-41-23-2513.jpeg', 1, 5, '2023-01-14 04:41:23', '2023-01-14 04:41:23'),
(40, 17, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-42-45-2192.jpeg', 1, 10, '2023-01-14 04:42:45', '2023-01-14 04:42:45'),
(41, 17, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-42-45-7669.jpeg', 1, 5, '2023-01-14 04:42:46', '2023-01-14 04:42:46'),
(42, 17, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-42-46-4320.jpeg', 1, 6, '2023-01-14 04:42:46', '2023-01-14 04:42:46'),
(43, 16, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-43-40-3193.jpeg', 1, 2, '2023-01-14 04:43:41', '2023-01-14 04:43:41'),
(44, 16, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-43-41-8190.jpeg', 1, 3, '2023-01-14 04:43:41', '2023-01-14 04:43:41'),
(45, 16, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-43-41-7647.jpeg', 1, 8, '2023-01-14 04:43:42', '2023-01-14 04:43:42'),
(46, 15, 'Service One', 'uploads/custom-images/service-add-2023-01-14-10-44-31-5768.jpeg', 1, 10, '2023-01-14 04:44:31', '2023-01-14 04:44:31'),
(47, 15, 'Service Two', 'uploads/custom-images/service-add-2023-01-14-10-44-31-2276.jpeg', 1, 5, '2023-01-14 04:44:31', '2023-01-14 04:44:31'),
(48, 15, 'Service Three', 'uploads/custom-images/service-add-2023-01-14-10-44-31-3957.jpeg', 1, 6, '2023-01-14 04:44:32', '2023-01-14 04:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_type` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  `forget_password_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `admin_type`, `name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `status`, `forget_password_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'John Doe', 'admin@gmail.com', 'uploads/website-images/john-doe-2022-12-25-04-13-32-5577.jpg', NULL, '$2y$10$E9vUQogef2us1sas54MD6e3Z5yBoTSerndPBBtC7438PIy2M3dhoO', '2jfv2br2ZakTbi9nQGtMRTp8plL4brOSFT8VUxuQerVQqWWeAM8h5wZD7cGZ', 1, NULL, NULL, '2023-01-14 10:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `image`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/ad--2023-08-03-02-14-16-6983.jpg', 'https://codecanyon.net/user/quomodotheme/portfolio', 1, '2023-05-24 07:33:19', '2023-10-01 09:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `bank_payments`
--

CREATE TABLE `bank_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `account_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_payments`
--

INSERT INTO `bank_payments` (`id`, `status`, `account_info`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bank Name: Your bank name\r\nAccount Number:  Your bank account number\r\nRouting Number: Your bank routing number\r\nBranch: Your bank branch name', 'uploads/website-images/bank-2022-09-25-10-06-03-8346.jpg', NULL, '2022-09-25 04:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `banner_images`
--

CREATE TABLE `banner_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `header` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_images`
--

INSERT INTO `banner_images` (`id`, `title`, `description`, `link`, `image`, `button_text`, `banner_location`, `status`, `header`, `created_at`, `updated_at`) VALUES
(1, 'Up To - 35% Off', 'Hot Deals', 'product', 'uploads/website-images/Mega-menu-2022-02-13-07-53-14-1062.png', 'Shop Now', 'Mega Menu Banner', 1, NULL, NULL, '2022-02-13 13:53:14'),
(2, 'Up To -20% Off', 'Hot Deals', 'product', 'uploads/website-images/banner--2022-02-10-10-24-47-2663.jpg', 'Shop Now', 'Home Page One Column Banner', 1, NULL, NULL, '2022-02-13 13:45:52'),
(3, 'Up To -35% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-06-03-42-16-1335.png', 'Shop Now', 'Home Page First Two Column Banner One', 1, NULL, NULL, '2022-02-13 13:46:01'),
(4, 'Up To -40% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-06-03-42-16-1434.png', 'Shop Now', 'Home Page First Two Column Banner Two', 1, NULL, NULL, '2022-02-13 13:46:01'),
(5, 'Up To -28% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-06-04-18-01-2862.jpg', 'Shop Now', 'Home Page Second Two Column Banner one', 1, NULL, NULL, '2022-02-13 13:46:15'),
(6, 'Up To -22% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-06-04-18-01-6995.jpg', 'Shop Now', 'Home Page Second Two Column Banner two', 1, NULL, NULL, '2022-02-13 13:46:15'),
(7, 'Up To -35% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-13-04-57-46-4114.jpg', 'Shop Now', 'Home Page Third Two Column Banner one', 1, NULL, NULL, '2022-02-13 13:46:27'),
(8, 'Up To -15% Off', 'Hot Deals', 'product', 'uploads/website-images/banner-2022-02-13-04-58-43-7437.jpg', 'Shop Now', 'Home Page Third Two Column Banner Two', 1, NULL, NULL, '2022-02-13 13:46:27'),
(9, 'This is Tittle', 'This is Description', 'product', 'uploads/website-images/banner-2022-02-06-04-24-44-6895.jpg', 'dd', 'Shopping cart bottom', 1, '', NULL, '2022-02-13 13:47:23'),
(10, 'This is Title', 'This is Description', 'product', 'uploads/website-images/banner-2022-02-06-04-25-59-9719.jpg', NULL, 'Shopping cart bottom', 0, NULL, NULL, '2022-02-13 13:47:23'),
(11, 'This is Tittle', 'This is Description', 'product', 'uploads/website-images/banner-2022-02-06-04-26-46-8505.jpg', 'dd', 'Campaign page', 1, '', NULL, '2022-02-13 13:47:31'),
(12, 'This is Tittle', 'This is Description', 'product', 'uploads/website-images/banner-2022-01-30-06-21-06-4562.png', 'dd', 'Campaign page', 0, '', NULL, '2022-02-13 13:47:31'),
(13, 'This is Tittle', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'Shop Now', 'uploads/website-images/banner-2022-02-07-10-48-37-9226.jpg', 'dd', 'Login page', 0, 'Our Achievement', NULL, '2022-02-07 04:48:39'),
(14, 'Black Friday Sale', 'Up To -70% Off', 'product', 'uploads/website-images/banner-2022-02-06-04-24-02-9777.jpg', NULL, 'Product Detail', 1, NULL, NULL, '2022-02-13 13:46:54'),
(15, 'Default Profile Image', NULL, NULL, 'uploads/website-images/default-avatar-2022-02-07-10-10-46-1477.jpg', NULL, 'Default Profile Image', 0, NULL, NULL, '2022-02-07 04:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `become_authors`
--

CREATE TABLE `become_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `become_authors`
--

INSERT INTO `become_authors` (`id`, `bg_image`, `image1`, `image2`, `image`, `signature`, `icon1`, `icon2`, `icon3`, `icon4`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/become_author-2023-07-22-06-08-38-5742.jpg', 'uploads/website-images/become_author-2023-07-18-05-59-27-9178.png', 'uploads/website-images/become_author-2023-07-18-05-59-27-8651.png', 'uploads/website-images/become_author-2023-07-18-05-59-27-6087.png', 'uploads/website-images/become_author-2023-07-18-05-59-27-1169.png', 'uploads/website-images/become_author-2023-01-22-03-37-43-9440.png', 'uploads/website-images/become_author-2023-01-22-03-39-27-7149.png', 'uploads/website-images/become_author-2023-01-22-03-41-18-3485.png', 'uploads/website-images/become_author-2023-01-22-03-41-28-6209.png', NULL, '2023-07-29 04:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `become_author_languages`
--

CREATE TABLE `become_author_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `become_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desgination` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `become_author_languages`
--

INSERT INTO `become_author_languages` (`id`, `become_id`, `lang_code`, `title`, `header1`, `header2`, `description`, `name`, `desgination`, `item1`, `item2`, `item3`, `item4`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Sell your Products with Our Digital Marketplace', 'Welcome to the Alasmart marketplace', 'We’re Confident You’d Feel Business Success.', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or a randomised woirds which don\'t look even.</p>\r\n<p>going to use a passage of Lorem Ipsum, you need to be sure there isn\'t a nything embarrassing hidden in the middle of text</p>', 'Shivang Preet', 'CEO & Founder', '3 Million Members', 'Easy Approved System', 'All Payout System', 'Community Support', NULL, '2023-09-25 03:49:28'),
(18, 1, 'bn', 'আমাদের ডিজিটাল মার্কেটপ্লেস দিয়ে আপনার পণ্য বিক্রি করুন', 'এলাসমার্ট মার্কেটপ্লেসে স্বাগতম', 'আমরা নিশ্চিত যে আপনি ব্যবসায়িক সাফল্য অনুভব করবেন।', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তনের শিকার হয়েছে, ইনজেকশন করা হাস্যরস, বা এলোমেলোভাবে করা শব্দ যা দেখা যায় না।</p>\r\n<p>লরেম ইপসাম-এর একটি প্যাসেজ ব্যবহার করতে গেলে, আপনাকে নিশ্চিত হতে হবে পাঠ্যের মাঝখানে বিব্রতকর কোনো কিছু লুকিয়ে নেই</p>', 'শিবাং প্রীত', 'সিইও & ফাউন্ডার', '৩ মিলিয়ন সদস্য', 'সহজ অনুমোদিত সিস্টেম', 'সমস্ত পেআউট সিস্টেম', 'কমিউনিটি সাপোর্ট', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `show_homepage` int(11) NOT NULL DEFAULT 0,
  `show_featured` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `admin_id`, `slug`, `blog_category_id`, `image`, `views`, `status`, `show_homepage`, `show_featured`, `created_at`, `updated_at`) VALUES
(1, 1, 'a-beginners-guide-to-digital-finance', 1, 'uploads/custom-images/blog--2023-09-23-10-37-37-1648.jpg', 0, 1, 1, 0, '2023-09-23 03:59:23', '2023-09-23 09:02:51'),
(2, 1, 'technology-devices-takes-our-personal-into-end', 2, 'uploads/custom-images/blog--2023-09-23-10-33-02-6659.jpg', 0, 1, 0, 0, '2023-09-23 04:06:09', '2023-09-23 09:02:51'),
(3, 1, 'system-developers-analyzing-code-on-wall-screen', 3, 'uploads/custom-images/blog--2023-09-23-10-34-19-2773.jpg', 0, 1, 1, 0, '2023-09-23 04:09:00', '2023-09-23 09:02:51'),
(4, 1, 'multimedia-creator-artist-on-videocall-with-client', 4, 'uploads/custom-images/blog--2023-09-23-10-35-09-4575.jpg', 0, 1, 0, 0, '2023-09-23 04:12:51', '2023-09-23 09:02:51'),
(5, 1, 'graphic-designer-working-in-office-with-laptop', 5, 'uploads/custom-images/blog--2023-09-23-10-36-01-7793.jpg', 0, 1, 0, 0, '2023-09-23 04:17:00', '2023-09-23 09:02:51'),
(6, 1, 'young-designer-looking-at-a-it-in-his-hand-while-sitting', 6, 'uploads/custom-images/blog--2023-09-23-10-21-13-9721.jpg', 0, 1, 0, 0, '2023-09-23 04:21:13', '2023-09-23 09:02:51'),
(7, 1, 'business-company-executive-manager-analyzing', 7, 'uploads/custom-images/blog--2023-09-23-10-23-46-8599.jpg', 0, 1, 0, 0, '2023-09-23 04:23:46', '2023-09-23 09:02:51'),
(8, 1, 'group-of-people-working-out-business-plan-in-an-office', 1, 'uploads/custom-images/blog--2023-09-23-10-26-38-1517.jpg', 0, 1, 1, 0, '2023-09-23 04:26:38', '2023-09-23 09:02:51'),
(9, 1, 'successful-business-partners-having-a-meeting', 2, 'uploads/custom-images/blog--2023-09-23-10-29-27-2126.jpg', 0, 1, 0, 0, '2023-09-23 04:29:27', '2023-09-23 09:02:51'),
(10, 1, 'you-can-also-find-trends-and-technique-the-from-other-uxers-group', 6, 'uploads/custom-images/blog--2023-09-23-10-43-49-8198.jpg', 0, 1, 0, 1, '2023-09-23 04:43:49', '2023-09-23 04:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'digital-tools', 1, '2023-09-23 03:43:32', '2023-09-23 03:43:32'),
(2, NULL, 'online-services', 1, '2023-09-23 03:43:46', '2023-09-23 03:43:46'),
(3, NULL, 'marketing-strategies', 1, '2023-09-23 03:45:03', '2023-09-23 03:45:03'),
(4, NULL, 'web-development', 1, '2023-09-23 03:45:13', '2023-09-23 03:45:13'),
(5, NULL, 'ecommerce', 1, '2023-09-23 03:45:27', '2023-09-23 03:45:27'),
(6, NULL, 'digital-creativity', 1, '2023-09-23 03:45:39', '2023-09-23 03:45:39'),
(7, NULL, 'digital-education', 1, '2023-09-23 03:45:56', '2023-09-23 03:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_languages`
--

CREATE TABLE `blog_category_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_category_languages`
--

INSERT INTO `blog_category_languages` (`id`, `category_id`, `lang_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Digital Tools', '2023-09-23 03:43:32', '2023-09-23 03:43:32'),
(2, 2, 'en', 'Online Services', '2023-09-23 03:43:46', '2023-09-23 03:43:46'),
(3, 3, 'en', 'Marketing Strategies', '2023-09-23 03:45:03', '2023-09-23 03:45:03'),
(4, 4, 'en', 'Web Development', '2023-09-23 03:45:13', '2023-09-23 03:45:13'),
(5, 5, 'en', 'E-commerce', '2023-09-23 03:45:27', '2023-09-23 03:45:27'),
(6, 6, 'en', 'Digital Creativity', '2023-09-23 03:45:39', '2023-09-23 03:45:39'),
(7, 7, 'en', 'Digital Education', '2023-09-23 03:45:56', '2023-09-23 03:45:56'),
(8, 1, 'bn', 'ডিজিটাল টুলস', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(9, 2, 'bn', 'অনলাইন সেবাসমূহ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(10, 3, 'bn', 'মার্কেটিং কৌশল', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(11, 4, 'bn', 'ওয়েব ডেভেলপমেন্ট', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(12, 5, 'bn', 'ই-কমার্স', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(13, 6, 'bn', 'ডিজিটাল ক্রিয়েটিভিটি', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(14, 7, 'bn', 'ডিজিটাল শিক্ষা', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `name`, `email`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 'Abdullah Mamun', 'mamun@gmail.com', 'This blog title highlights a crucial aspect of the UX field – the power of learning from fellow practitioners. UXers have so much to gain from sharing experiences and staying up-to-date with trends. I&#039;m excited to read the blog and discover how we can harness the collective wisdom of UX communities to continually improve our craft', 1, '2023-09-23 09:08:46', '2023-09-23 09:10:10'),
(2, 10, 'Shinzing Pang', 'shinzing@gmail.com', 'Connecting with fellow UXers for insights and trends—can&#039;t wait to read more!', 1, '2023-09-23 09:15:31', '2023-09-23 09:15:37'),
(3, 9, 'Ragantan Jhon', 'ragantan@gmail.com', 'Wow, this image perfectly captures the essence of a successful business meeting! It&#039;s clear that these partners are focused and engaged in a productive conversation. Communication and collaboration are key in any business, and this photo reminds us of the importance of working together to achieve success', 1, '2023-09-23 09:19:31', '2023-09-23 09:25:18'),
(4, 9, 'Abu Siddik AK', 'siddik@gmail.com', 'What an inspiring scene! These business partners are clearly in sync, and it&#039;s evident that their meeting is productive. This reminds us that teamwork and effective communication are the backbone of any successful venture.', 1, '2023-09-23 09:25:12', '2023-09-23 09:25:17'),
(5, 8, 'Abdur Rohman', 'rohman@gmail.com', 'Exciting! Can&#039;t wait to read this blog for some inspiration and tips on improving our business planning sessions.', 1, '2023-09-23 09:28:59', '2023-09-23 09:29:11'),
(6, 7, 'John Doe', 'johndoe@gmail.com', 'Great read! Executive managers truly play a vital role in business analysis.', 1, '2023-09-23 09:31:41', '2023-09-23 09:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `blog_languages`
--

CREATE TABLE `blog_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_languages`
--

INSERT INTO `blog_languages` (`id`, `blog_id`, `lang_code`, `title`, `short_description`, `description`, `tag`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'A Beginner\'s Guide to Digital Finance', 'Welcome to the exciting world of digital finance! In today\'s fast-paced, technology-driven economy, understanding digital finance is essential for anyone looking to manage their finances effectively, invest wisely, and navigate the ever-evolving financial landscape.', '<p>Welcome to the exciting world of digital finance! In today\'s fast-paced, technology-driven economy, understanding digital finance is essential for anyone looking to manage their finances effectively, invest wisely, and navigate the ever-evolving financial landscape.</p>\r\n<p>This comprehensive beginner\'s guide is designed to demystify digital finance and provide you with the knowledge and tools you need to make informed financial decisions in the digital age. Whether you\'re a novice investor, a budding entrepreneur, or simply someone who wants to take control of their financial future, this guide is your roadmap to success.</p>\r\n<p>Inside this book, you\'ll discover:</p>\r\n<p>Digital Payment Systems: Learn about the evolution of digital currencies and payment methods, including cryptocurrencies like Bitcoin and digital wallets, and how they are reshaping the way we conduct transactions.</p>\r\n<p>Online Banking and Personal Finance Apps: Explore the world of online banking, budgeting apps, and financial management tools that can help you streamline your financial life and achieve your financial goals.</p>\r\n<p>Investing in the Digital Era: Gain insights into the various investment options available in the digital realm, from stocks and bonds to alternative investments like peer-to-peer lending and robo-advisors.</p>\r\n<p>Blockchain and Decentralized Finance (DeFi): Understand the revolutionary technology behind blockchain and its applications beyond cryptocurrencies, such as decentralized finance (DeFi) and smart contracts.</p>\r\n<p>Security and Risk Management: Discover essential tips and best practices for safeguarding your digital assets and protecting yourself from financial scams and cyber threats.</p>\r\n<p>Regulations and Compliance: Navigate the complex world of financial regulations, including the latest developments in digital finance regulations and compliance.</p>\r\n<p>Future Trends and Opportunities: Get a glimpse into the future of digital finance, including emerging trends, innovative fintech startups, and the potential impact of technologies like artificial intelligence and quantum computing.</p>\r\n<p>Whether you\'re looking to embrace cryptocurrencies, optimize your digital banking experience, or explore new investment opportunities, this guide will equip you with the knowledge and confidence to thrive in the world of digital finance. It\'s time to embark on your financial journey with the power of digital technology at your fingertips. Start reading and take control of your financial future today!</p>', 'Digital, Finance, Beginner\'s Guide, Regulations, Opportunities, Data, ', 'A Beginner\'s Guide to Digital Finance', 'A Beginner\'s Guide to Digital Finance', '2023-09-23 03:59:23', '2023-09-23 06:46:20'),
(2, 2, 'en', 'Technology Devices Takes Our Personal Into End.', 'In an era characterized by constant connectivity and technological innovation, our personal lives have undergone a profound transformation.', '<p>In an era characterized by constant connectivity and technological innovation, our personal lives have undergone a profound transformation. The prevalence of technology devices, from smartphones and tablets to wearable tech and IoT (Internet of Things) gadgets, has ushered in a new age of convenience, efficiency, and interconnectedness. Yet, beneath this veneer of progress lies a complex and evolving landscape where our personal information and privacy hang in the balance.</p>\r\n<p>This extensive exploration delves deep into the multifaceted relationship between technology devices and our personal lives. It examines the myriad ways in which these devices have revolutionized the way we work, communicate, and entertain ourselves. From the power of artificial intelligence enhancing productivity to the comfort of smart home automation systems simplifying our daily chores, technology has seamlessly integrated into the fabric of our existence.</p>\r\n<p>However, this integration has not been without its challenges. Concerns over data privacy, cybersecurity, and the erosion of personal boundaries have become increasingly prominent. As technology devices collect vast amounts of information about us, questions arise about who has access to this data, how it is used, and how we can protect our most intimate details from prying eyes.</p>\r\n<p>This comprehensive narrative takes you on a journey through the impact of technology on our personal lives, exploring both the positive and negative aspects of this digital transformation. It addresses the blurred lines between convenience and surveillance, the ethical considerations surrounding data collection, and the steps we can take to safeguard our personal information in an interconnected world.</p>\r\n<p>Discover the intricate dance between technology and personal privacy, gain insights into the strategies and tools available to protect your data, and find inspiration in stories of individuals and organizations striving to strike a balance between innovation and safeguarding what matters most&mdash;our personal privacy. Join us as we navigate the ever-evolving landscape of technology devices and their profound influence on our lives.</p>', 'Technology, Devices, Takes, Personal, ', 'Technology Devices Takes Our Personal Into End.', 'Technology Devices Takes Our Personal Into End.', '2023-09-23 04:06:09', '2023-09-23 04:06:09'),
(3, 3, 'en', 'System Developers Analyzing Code On Wall Screen.', 'In this bustling, state-of-the-art development workspace, a team of highly skilled system developers is engaged in an in-depth analysis of intricate lines of code projected onto a vast wall screen.', '<p>In this bustling, state-of-the-art development workspace, a team of highly skilled system developers is engaged in an in-depth analysis of intricate lines of code projected onto a vast wall screen. The scene is a captivating blend of innovation, precision, and synergy, where these talented individuals are dedicated to the relentless pursuit of software excellence.</p>\r\n<p>The wall screen serves as the epicenter of their collaborative efforts, displaying an intricate tapestry of code that represents the backbone of their ambitious software project. From programming languages and algorithms to data structures and design patterns, every facet of their work is meticulously examined, tested, and refined.</p>\r\n<p>The developers, each a virtuoso in their own right, have come together as a cohesive unit, creating an environment where collective wisdom and diverse perspectives converge. Their heads bend over keyboards, hands darting across input devices, as they collectively decipher, debug, and enhance the code before them.</p>\r\n<p>Every line of code holds a story, a journey of innovation and problem-solving. As they scrutinize the codebase, discussions and brainstorming sessions fill the air, with ideas flowing freely and creative solutions emerging from the collective intellect of the team. Challenges are met with enthusiasm, and obstacles are seen as opportunities to push the boundaries of what is possible in software development.</p>\r\n<p>Beyond the wall screen, rows of workstations are adorned with monitors and countless lines of code, reflecting the depth of their commitment to crafting systems that are not only robust but also transformative. The energy in the room is palpable, driven by the shared vision of creating software that can change industries, improve lives, and drive progress.</p>\r\n<p>In this moment, the system developers are not merely analyzing code; they are sculptors of the digital world, pushing the boundaries of technology, and reshaping the future one line of code at a time. Their dedication to excellence and their unwavering belief in the power of technology is nothing short of inspirational, making this collaborative coding session a testament to human ingenuity and the limitless possibilities of the digital age.</p>', 'Developers, Analyzing, Wall Screen, ', 'System Developers Analyzing Code On Wall Screen.', 'System Developers Analyzing Code On Wall Screen.', '2023-09-23 04:09:00', '2023-09-23 04:09:00'),
(4, 4, 'en', 'Multimedia Creator Artist On Videocall With Client.', 'In the vast landscape of creative expression, multimedia creator artists stand as modern-day visionaries, sculpting narratives and experiences that transcend conventional boundaries.', '<p>In the vast landscape of creative expression, multimedia creator artists stand as modern-day visionaries, sculpting narratives and experiences that transcend conventional boundaries. However, their craft has evolved in profound ways, marked by an era where client collaborations are forged through the digital conduit of videocalls.</p>\r\n<p>Embarking on this multidimensional journey, we embark on an exploration of creativity, connection, and the nuanced interplay between artists and clients in an increasingly virtual world. This in-depth blog post immerses you in the captivating realm of multimedia creation, unveiling the intricate web of opportunities and challenges that emerge when artistry and commerce unite across digital screens.</p>\r\n<p>With an artist as our guide, we unravel the tapestry of remote collaboration, shedding light on the fascinating process from conception to delivery. Alongside this creative virtuoso, we navigate the artistic alchemy that transpires within the pixelated frames of a videocall, transforming abstract ideas into tangible, awe-inspiring masterpieces.</p>\r\n<p>As you traverse the pages of this blog, you\'ll witness the artist-client partnership as it unfolds in real-time. Discover the secrets to sustaining a seamless workflow and nurturing creativity while bridging geographical distances and time zones. Whether you are an aspiring multimedia creator artist seeking inspiration or a client yearning to embark on a journey of artistic collaboration, this narrative promises to be a compass guiding you through the digital labyrinth of creative expression and human connection.</p>', 'Multimedia, Creator, Artist, Videocall, Development, Business, ', 'Multimedia Creator Artist On Videocall With Client.', 'Multimedia Creator Artist On Videocall With Client.', '2023-09-23 04:12:51', '2023-09-23 06:45:45'),
(5, 5, 'en', 'Graphic Designer Working In Office With Laptop.', 'In a modern and dynamic office environment, a graphic designer is hard at work, immersed in a world of creativity and innovation.', '<p>In a modern and dynamic office environment, a graphic designer is hard at work, immersed in a world of creativity and innovation. This skilled professional is responsible for crafting visually compelling and aesthetically pleasing designs that captivate audiences, convey messages, and promote brands.</p>\r\n<p>Seated at a sleek and ergonomic desk, the graphic designer is surrounded by a carefully curated workspace that inspires productivity and creativity. The office is designed with a contemporary and minimalist aesthetic, featuring clean lines, neutral tones, and plenty of natural light streaming in through large, well-placed windows. The designer\'s workstation is clutter-free, fostering an environment of focus and efficiency.</p>\r\n<p>The centerpiece of the graphic designer\'s workspace is a high-end laptop, its slim profile and sleek aluminum casing reflecting the designer\'s commitment to both style and functionality. The laptop\'s screen radiates with a vivid display of colors, showcasing the intricate details of ongoing design projects. The keyboard, mouse, and graphic tablet are positioned strategically for ergonomic comfort, allowing the designer to work for extended periods without fatigue.</p>\r\n<p>Surrounding the laptop are various tools of the trade. A collection of graphic design software icons lines the desktop, demonstrating the designer\'s proficiency in industry-standard programs like Adobe Creative Suite. Stacks of neatly organized notebooks and sketchpads are within arm\'s reach, ready for jotting down ideas, sketching concepts, or making annotations.</p>\r\n<p>The designer\'s creative flair is apparent from the artwork displayed on the desk. Framed posters, mood boards, and inspirational prints adorn the walls, showcasing the designer\'s portfolio and serving as a constant source of motivation. A mood board for the current project is prominently pinned to a nearby corkboard, featuring a collage of images, color swatches, and typography samples that capture the essence of the ongoing design.</p>\r\n<p>A pair of noise-canceling headphones rests on a stylish headphone stand, ready to drown out any distractions in the bustling office environment. The background hum of colleagues collaborating and keyboards clicking fades into a distant murmur, allowing the designer to focus intently on the task at hand.</p>\r\n<p>The designer\'s attire reflects a blend of professionalism and individuality, with a carefully selected ensemble that strikes the right balance between comfort and style. A crisp, tailored shirt or blouse pairs effortlessly with well-fitted trousers or a skirt. The choice of attire is practical, allowing the designer to transition seamlessly from office tasks to client meetings or brainstorming sessions.</p>\r\n<p>A well-organized desk also boasts an assortment of design reference books, magazines, and a selection of design awards and certificates, attesting to the designer\'s expertise and recognition in the field. A meticulously maintained potted plant adds a touch of greenery to the workspace, providing a sense of tranquility amid the creative hustle and bustle.</p>\r\n<p>Overall, the graphic designer\'s office workspace embodies a harmonious blend of technology, creativity, and professionalism. It is a place where ideas come to life, where pixels are meticulously arranged to form compelling visuals, and where the fusion of art and design yields remarkable results in the ever-evolving world of graphic design.</p>', 'Graphic, Designer, Working In Office, ', 'Graphic Designer Working In Office With Laptop.', 'Graphic Designer Working In Office With Laptop.', '2023-09-23 04:17:00', '2023-09-23 04:17:00'),
(6, 6, 'en', 'Young Designer Looking At A It In His Hand While Sitting.', 'In a cozy, sunlit corner of a trendy, minimalist studio apartment, a young designer finds himself immersed in a world of creativity.', '<p>In a cozy, sunlit corner of a trendy, minimalist studio apartment, a young designer finds himself immersed in a world of creativity. The room exudes an aura of artistic inspiration, with white walls adorned with colorful, abstract paintings that serve as a testament to his passion for design. The atmosphere is tranquil, with a gentle breeze filtering through the half-drawn curtains, allowing the soft scent of fresh flowers from a nearby vase to waft through the air.</p>\r\n<p>Seated on a mid-century modern chair, the designer\'s posture exudes a sense of relaxed contemplation. His legs are crossed, and he leans back slightly, perfectly at ease. The chair\'s clean lines and warm wooden tones complement his youthful yet sophisticated demeanor.</p>\r\n<p>In his hand, he holds a sleek, state-of-the-art tablet&mdash;a marvel of modern technology that has become an indispensable tool for creative minds. The tablet\'s brushed aluminum finish reflects the soft, diffused sunlight, giving it an almost ethereal glow. Its large, high-resolution screen displays an intricate web of digital illustrations and design concepts, each pixel a testament to his talent and dedication.</p>\r\n<p>The designer\'s gaze is fixed intently on the tablet, his eyes scanning the screen with a laser-like focus. His face is a canvas of concentration, with furrowed brows and a slightly parted mouth, revealing the depth of his immersion in the task at hand. His fingers dance gracefully across the touchscreen, manipulating digital brushes and tools with a precision that only years of practice can attain.</p>\r\n<p>As he delves deeper into his work, the room around him seems to fade into the background, and all that remains is the symbiotic connection between the designer and his digital canvas. Ideas flow like a river, and with every stroke of the stylus, he brings his visions to life. The interplay of light and shadow on his face reflects the ebb and flow of his creative process, as he molds the virtual world into something uniquely his own.</p>\r\n<p>Time seems to stand still in this moment of artistic immersion. The young designer, lost in his own world of creation, is a testament to the power of human imagination and the boundless possibilities that technology offers to those with a passion for design. In his hand, the tablet is not just a device; it\'s a gateway to a realm of limitless creativity, and he is its master, shaping the future one digital brushstroke at a time.</p>', 'Young, Designer, Looking, Hand While Sitting, Technology, ', 'Young Designer Looking At A It In His Hand While Sitting.', 'Young Designer Looking At A It In His Hand While Sitting.', '2023-09-23 04:21:13', '2023-09-23 06:46:34'),
(7, 7, 'en', 'Business Company Executive Manager Analyzing.', 'The role of a Business Company Executive Manager is one of paramount importance in any organization.', '<p>The role of a Business Company Executive Manager is one of paramount importance in any organization. This position is typically situated at the upper echelons of the corporate hierarchy and carries substantial responsibilities and decision-making authority. The primary objective of an Executive Manager is to oversee the entire operation of a company, ensuring that it runs efficiently, effectively, and in alignment with the organization\'s strategic goals and objectives.</p>\r\n<p>Executive Managers are charged with a multitude of tasks and responsibilities that encompass various facets of the business. These responsibilities often include:</p>\r\n<p>Strategic Planning: One of the key responsibilities of an Executive Manager is to engage in strategic planning. This involves setting long-term goals and objectives for the company, devising strategies to achieve them, and regularly reviewing and adjusting these plans as necessary to adapt to changing market conditions.</p>\r\n<p>Leadership and Team Management: Executive Managers are responsible for building and leading a high-performing team. This includes hiring, training, and developing employees, as well as fostering a positive and productive work culture.</p>\r\n<p>Financial Management: Monitoring and managing the company\'s financial health is crucial. Executive Managers oversee budgeting, financial forecasting, and financial reporting. They are also responsible for making financial decisions that impact the company\'s profitability and sustainability.</p>\r\n<p>Operations Management: Ensuring that day-to-day operations run smoothly is essential. Executive Managers need to streamline processes, optimize resource allocation, and resolve operational challenges to enhance efficiency.</p>\r\n<p>Stakeholder Relations: Executive Managers often serve as the face of the company to external stakeholders, including investors, customers, suppliers, and regulatory authorities. They must maintain positive relationships and communicate effectively with these groups.</p>\r\n<p>Risk Management: Identifying and mitigating risks is an integral part of an Executive Manager\'s role. This includes assessing potential risks to the business, implementing risk management strategies, and making decisions to protect the company\'s assets and reputation.</p>\r\n<p>Innovation and Adaptation: Staying competitive in today\'s rapidly changing business environment requires innovation and adaptation. Executive Managers must promote a culture of innovation within the organization and be willing to pivot when necessary to meet market demands.</p>\r\n<p>Compliance and Ethics: Ensuring that the company operates in accordance with applicable laws and ethical standards is paramount. Executive Managers must set an example of ethical behavior and establish policies and procedures to maintain compliance.</p>\r\n<p>Performance Evaluation: Regularly assessing the company\'s performance against its goals and benchmarks is vital. Executive Managers use key performance indicators (KPIs) and other metrics to gauge success and make data-driven decisions.</p>\r\n<p>Strategic Partnerships: Developing and nurturing strategic partnerships can be essential for growth and expansion. Executive Managers explore opportunities for collaborations, alliances, and mergers or acquisitions that align with the company\'s strategic vision.</p>\r\n<p>In summary, the role of a Business Company Executive Manager is multifaceted and dynamic. It demands strong leadership skills, strategic thinking, financial acumen, and the ability to navigate complex challenges and opportunities. Success in this role requires a deep understanding of the industry, effective communication, and a commitment to the long-term success of the organization. The Executive Manager plays a pivotal role in shaping the company\'s future and ensuring its sustainability and prosperity.</p>', 'Business, Company, Executive, Analyzing, ', 'Business Company Executive Manager Analyzing.', 'Business Company Executive Manager Analyzing.', '2023-09-23 04:23:46', '2023-09-23 04:23:46'),
(8, 8, 'en', 'Group Of People Working Out Business Plan In An Office.', 'In a bustling office nestled within a sleek, modern skyscraper, a dynamic group of individuals is hard at work, collaborating fervently to craft a meticulously detailed business plan.', '<p>In a bustling office nestled within a sleek, modern skyscraper, a dynamic group of individuals is hard at work, collaborating fervently to craft a meticulously detailed business plan. The room exudes an aura of professionalism and ambition, with its glass walls offering panoramic views of the urban landscape below, allowing natural light to stream in and illuminate the bustling activity within.</p>\r\n<p>Around a massive, polished wooden table, adorned with stacks of documents, a team of diverse professionals has gathered. Each member brings their unique expertise to the table, representing a mosaic of talents and backgrounds, ranging from seasoned veterans to fresh-faced innovators. They embody a sense of shared purpose, driven by a collective vision for the future of their enterprise.</p>\r\n<p>The atmosphere is charged with anticipation, and the room hums with the low murmur of conversation and the tapping of keyboards. Laptops, tablets, and smartphones are scattered across the table, as digital tools seamlessly integrate with traditional stationery, reflecting the fusion of modern technology with timeless business acumen.</p>\r\n<p>The whiteboard on one wall is covered with colorful diagrams, flowcharts, and sticky notes bearing scribbled ideas and critical milestones. A projector screen opposite the table displays graphs, charts, and data visualizations, providing a visual roadmap for the team\'s strategic discussions.</p>\r\n<p>The leader of the group, a confident and charismatic individual, stands at the head of the table, guiding the discussion with authority. They skillfully facilitate the brainstorming session, ensuring that every member\'s voice is heard and considered. Sharp business attire and a well-prepared presentation reinforce their role as the driving force behind this endeavor.</p>\r\n<p>As the hours pass, the energy in the room remains high, despite the challenges and complexities of the task at hand. Coffee cups and water bottles are readily available to sustain the team\'s focus, and the aroma of freshly brewed coffee mingles with the scent of printed documents, creating an environment that encourages productivity.</p>\r\n<p>The team\'s commitment to excellence and their collective determination to shape a compelling business plan is palpable. The atmosphere is charged with intellectual rigor, innovation, and an unwavering belief in their ability to overcome obstacles and seize opportunities in the ever-evolving world of business.</p>\r\n<p>In this office, illuminated by the convergence of talent, technology, and ambition, a business plan is not merely a document but a testament to the dedication and collaborative spirit of a group of individuals on a mission to redefine the future of their organization.</p>', 'Group, People, Business, Plan, ', 'Group Of People Working Out Business Plan In An Office.', 'Group Of People Working Out Business Plan In An Office.', '2023-09-23 04:26:38', '2023-09-23 04:26:38'),
(9, 9, 'en', 'Successful Business Partners Having A Meeting.', 'In the heart of a bustling metropolis, two successful business partners, John and Sarah, are having a pivotal meeting that could shape the future of their thriving enterprise.', '<p>In the heart of a bustling metropolis, two successful business partners, John and Sarah, are having a pivotal meeting that could shape the future of their thriving enterprise. The scene is set in a sleek and modern boardroom, flooded with natural light streaming in through floor-to-ceiling windows that offer a breathtaking view of the city skyline. The room is adorned with tasteful, minimalist decor, conveying an air of professionalism and sophistication.</p>\r\n<p>John, a seasoned entrepreneur with a charismatic demeanor, sits at one end of a long, polished mahogany table. His tailored charcoal suit and power tie exude confidence and authority. Sarah, his equally accomplished counterpart, radiates competence in her elegant pantsuit, which complements her poised demeanor. The table between them is adorned with neatly arranged documents, laptops, and a notepad, ready for a productive discussion.</p>\r\n<p>Their expressions are a testament to the years of dedication and hard work that have led them to this moment. John\'s penetrating gaze and slight smile reveal his passion for innovation, while Sarah\'s focused expression reflects her meticulous attention to detail. As they exchange ideas, it\'s evident that their synergy is the driving force behind their business\'s incredible success.</p>\r\n<p>The air is charged with anticipation, and their discussion is punctuated by thoughtful pauses as they weigh each decision\'s potential impact. They speak in measured tones, demonstrating their mutual respect and the depth of their professional relationship. Their voices resonate with conviction, each point they make a testament to their unwavering commitment to the company\'s mission.</p>\r\n<p>In the background, the soft hum of city life serves as a reminder of the world beyond this boardroom, where their business has made a significant impact. The walls are adorned with framed accolades and awards, attesting to their industry recognition and the accolades they\'ve achieved together.</p>\r\n<p>Throughout the meeting, the partners draw from their collective expertise and complementary skill sets, shaping a vision for the company\'s future that\'s both ambitious and realistic. Their business acumen and ability to strategize are on full display as they chart a course that will not only sustain their current success but elevate it to new heights.</p>\r\n<p>Outside, the sun continues its journey across the sky, casting shifting patterns of light and shadow into the room. As the meeting progresses, it\'s clear that these two remarkable individuals are not just partners in business but kindred spirits on a shared journey of growth, innovation, and unwavering determination. Their meeting is a testament to the power of collaboration, vision, and the incredible heights that can be reached when successful business partners come together to shape the future.</p>', 'Successful, Business, Partners, Meeting, ', 'Successful Business Partners Having A Meeting.', 'Successful Business Partners Having A Meeting.', '2023-09-23 04:29:27', '2023-09-23 04:29:27'),
(10, 10, 'en', 'You Can also Find Trends and Technique the from Other UXers Group', 'Certainly! Finding trends and techniques from other UX (User Experience) professionals and groups can be a valuable source of inspiration and learning.', '<p>Certainly! Finding trends and techniques from other UX (User Experience) professionals and groups can be a valuable source of inspiration and learning. Here\'s a more detailed description of how you can go about it Start by joining online UX communities, forums, and social media groups where UX professionals gather. Platforms like LinkedIn, Reddit (r/userexperience), and specialized UX forums like UX Stack Exchange are great places to connect with fellow UXers.</p>\r\n<p>Follow Influential UXers: Identify influential UX professionals, designers, and researchers in your field and follow them on social media platforms like Twitter, LinkedIn, or Medium. They often share insights, trends, and techniques.</p>\r\n<p>Attend Conferences and Webinars: Participate in UX conferences, webinars, and virtual events. These events often feature talks and presentations by leading UX experts, where they discuss emerging trends and share their techniques.&nbsp;Read UX Blogs and Publications Stay updated by regularly reading UX blogs, books, and industry publications. Popular UX blogs include NN/g (Nielsen Norman Group), Smashing Magazine, and UX Design Institute.</p>\r\n<p>Engage in Online Workshops: Many UX professionals offer online workshops and courses. Participating in these can help you learn about the latest tools and techniques in the field.</p>\r\n<p>Collaborate with Colleagues: If you work in a UX team or alongside other UX professionals, don\'t hesitate to collaborate and share knowledge within your organization. Organize knowledge-sharing sessions or brown bag lunches where team members can discuss trends and techniques.</p>\r\n<p>UX Design Challenges: Participate in UX design challenges or competitions. These events often present unique design problems that require innovative solutions, exposing you to different techniques and approaches.</p>\r\n<p>UX Meetups and Local Groups: If possible, attend local UX meetups and networking events. These gatherings can be great opportunities to meet other UXers, exchange ideas, and learn about local UX trends and challenges.</p>\r\n<p>UX Research and Case Studies: Review UX research papers, case studies, and reports from renowned UX organizations and researchers. These documents often contain valuable insights into successful UX strategies and emerging trends.</p>\r\n<p>Online Courses and Certifications: Enroll in online courses and certifications related to UX design and research. Platforms like Coursera, edX, and Interaction Design Foundation offer comprehensive courses taught by industry experts.</p>\r\n<p>UX Design Tools: Keep an eye on the evolving landscape of UX design tools. New tools and features are released regularly, which can enhance your workflow and productivity.</p>\r\n<p>UX Design Challenges: Participate in UX design challenges or competitions. These events often present unique design problems that require innovative solutions, exposing you to different techniques and approaches.</p>\r\n<p>UX Podcasts and YouTube Channels: Subscribe to UX-focused podcasts and YouTube channels. These platforms often host interviews with UX professionals and discussions about current trends and techniques.</p>\r\n<p>Remember that the field of UX is constantly evolving, so it\'s essential to stay curious and open to new ideas and approaches. By actively engaging with the UX community and learning from others, you can keep your skills up to date and remain at the forefront of the industry.</p>', 'Trends, Technique, UXers, Agency, Creative, Data, Technology, ', 'You Can also Find Trends and Technique the from Other UXers Group', 'You Can also Find Trends and Technique the from Other UXers Group', '2023-09-23 04:43:49', '2023-09-23 09:02:51'),
(11, 1, 'bn', 'ডিজিটাল ফাইন্যান্সের জন্য একটি শিক্ষানবিস গাইড', 'ডিজিটাল ফাইন্যান্সের উত্তেজনাপূর্ণ বিশ্বে স্বাগতম! আজকের দ্রুত-গতিসম্পন্ন, প্রযুক্তি-চালিত অর্থনীতিতে, ডিজিটাল ফাইন্যান্স বোঝা অত্যাবশ্যকীয় যে কেউ তাদের অর্থকে কার্যকরভাবে পরিচালনা করতে, বিজ্ঞতার সাথে বিনিয়োগ করতে এবং সর্বদা বিকশিত আর্থিক ল্যান্ডস্কেপ নেভিগেট করতে চায়।', '<p>ডিজিটাল ফাইন্যান্সের উত্তেজনাপূর্ণ বিশ্বে স্বাগতম! আজকের দ্রুত-গতিসম্পন্ন, প্রযুক্তি-চালিত অর্থনীতিতে, ডিজিটাল ফাইন্যান্স বোঝা অত্যাবশ্যকীয় যে কেউ তাদের অর্থকে কার্যকরভাবে পরিচালনা করতে, বিজ্ঞতার সাথে বিনিয়োগ করতে এবং সর্বদা বিকশিত আর্থিক ল্যান্ডস্কেপ নেভিগেট করতে চায়।</p>\r\n<p>এই বিস্তৃত শিক্ষানবিস গাইডটি ডিজিটাল ফাইন্যান্সকে রহস্যময় করার জন্য ডিজাইন করা হয়েছে এবং ডিজিটাল যুগে তথ্যপূর্ণ আর্থিক সিদ্ধান্ত নেওয়ার জন্য আপনাকে প্রয়োজনীয় জ্ঞান এবং সরঞ্জাম সরবরাহ করার জন্য ডিজাইন করা হয়েছে। আপনি একজন নবীন বিনিয়োগকারী, একজন উদীয়মান উদ্যোক্তা, অথবা কেবলমাত্র এমন কেউ যিনি তাদের আর্থিক ভবিষ্যৎ নিয়ন্ত্রণ করতে চান, এই নির্দেশিকাটি আপনার সাফল্যের রোডম্যাপ।</p>\r\n<p>এই বইয়ের ভিতরে, আপনি আবিষ্কার করবেন:</p>\r\n<p>ডিজিটাল পেমেন্ট সিস্টেম: বিটকয়েন এবং ডিজিটাল ওয়ালেটের মতো ক্রিপ্টোকারেন্সি সহ ডিজিটাল মুদ্রা এবং অর্থপ্রদানের পদ্ধতির বিবর্তন সম্পর্কে জানুন এবং কীভাবে তারা আমাদের লেনদেন পরিচালনার পদ্ধতিকে নতুন আকার দিচ্ছে।</p>\r\n<p>অনলাইন ব্যাঙ্কিং এবং পার্সোনাল ফিনান্স অ্যাপস: অনলাইন ব্যাঙ্কিং, বাজেটিং অ্যাপস এবং ফিনান্সিয়াল ম্যানেজমেন্ট টুলের জগৎ অন্বেষণ করুন যা আপনাকে আপনার আর্থিক জীবনকে স্ট্রিমলাইন করতে এবং আপনার আর্থিক লক্ষ্যগুলি অর্জন করতে সাহায্য করতে পারে।</p>\r\n<p>ডিজিটাল যুগে বিনিয়োগ: স্টক এবং বন্ড থেকে শুরু করে পিয়ার-টু-পিয়ার লেন্ডিং এবং রোবো-উপদেষ্টার মতো বিকল্প বিনিয়োগ পর্যন্ত ডিজিটাল ক্ষেত্রে উপলব্ধ বিভিন্ন বিনিয়োগের বিকল্পগুলির অন্তর্দৃষ্টি অর্জন করুন।</p>\r\n<p>ব্লকচেইন এবং বিকেন্দ্রীভূত অর্থায়ন (DeFi): ব্লকচেইনের পিছনে বিপ্লবী প্রযুক্তি এবং ক্রিপ্টোকারেন্সির বাইরে এর অ্যাপ্লিকেশনগুলি, যেমন বিকেন্দ্রীভূত অর্থায়ন (DeFi) এবং স্মার্ট চুক্তিগুলিকে বুঝুন।</p>\r\n<p>নিরাপত্তা এবং ঝুঁকি ব্যবস্থাপনা: আপনার ডিজিটাল সম্পদের সুরক্ষা এবং আর্থিক কেলেঙ্কারি এবং সাইবার হুমকি থেকে নিজেকে রক্ষা করার জন্য প্রয়োজনীয় টিপস এবং সেরা অনুশীলনগুলি আবিষ্কার করুন।</p>\r\n<p>রেগুলেশনস এবং কমপ্লায়েন্স: ডিজিটাল ফিনান্স রেগুলেশন এবং কমপ্লায়েন্সের সাম্প্রতিক উন্নয়ন সহ আর্থিক বিধিগুলির জটিল বিশ্বে নেভিগেট করুন।</p>\r\n<p>ভবিষ্যৎ প্রবণতা এবং সুযোগ: উদীয়মান প্রবণতা, উদ্ভাবনী ফিনটেক স্টার্টআপ এবং কৃত্রিম বুদ্ধিমত্তা এবং কোয়ান্টাম কম্পিউটিং-এর মতো প্রযুক্তির সম্ভাব্য প্রভাব সহ ডিজিটাল ফাইন্যান্সের ভবিষ্যতের একটি আভাস পান।</p>\r\n<p>আপনি ক্রিপ্টোকারেন্সি গ্রহণ করতে, আপনার ডিজিটাল ব্যাঙ্কিং অভিজ্ঞতাকে অপ্টিমাইজ করতে বা নতুন বিনিয়োগের সুযোগ অন্বেষণ করতে চাইছেন না কেন, এই নির্দেশিকা আপনাকে ডিজিটাল ফাইন্যান্সের জগতে উন্নতির জন্য জ্ঞান এবং আত্মবিশ্বাস দিয়ে সজ্জিত করবে। আপনার নখদর্পণে ডিজিটাল প্রযুক্তির শক্তি নিয়ে আপনার আর্থিক যাত্রা শুরু করার সময়। পড়া শুরু করুন এবং আজ আপনার আর্থিক ভবিষ্যতের নিয়ন্ত্রণ নিন!</p>', 'ডিজিটাল, ফিনান্স, রেগুলেশন্স, অপর্চুনিটিজ, ডাটা, ', 'ডিজিটাল ফাইন্যান্সের জন্য একটি শিক্ষানবিস গাইড', 'ডিজিটাল ফাইন্যান্সের জন্য একটি শিক্ষানবিস গাইড', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(12, 2, 'bn', 'প্রযুক্তি ডিভাইসগুলি আমাদের ব্যক্তিগতকে শেষ করে দেয়।', 'ধ্রুবক সংযোগ এবং প্রযুক্তিগত উদ্ভাবনের বৈশিষ্ট্যযুক্ত একটি যুগে, আমাদের ব্যক্তিগত জীবনে গভীর রূপান্তর ঘটেছে।', '<p>ধ্রুবক সংযোগ এবং প্রযুক্তিগত উদ্ভাবনের বৈশিষ্ট্যযুক্ত একটি যুগে, আমাদের ব্যক্তিগত জীবনে গভীর রূপান্তর ঘটেছে। স্মার্টফোন এবং ট্যাবলেট থেকে শুরু করে পরিধানযোগ্য প্রযুক্তি এবং আইওটি (ইন্টারনেট অফ থিংস) গ্যাজেটগুলিতে প্রযুক্তি ডিভাইসগুলির প্রসার সুবিধা, দক্ষতা এবং আন্তঃসংযুক্ততার একটি নতুন যুগের সূচনা করেছে৷ তবুও, অগ্রগতির এই ব্যহ্যাবরণের নীচে একটি জটিল এবং বিকশিত ল্যান্ডস্কেপ রয়েছে যেখানে আমাদের ব্যক্তিগত তথ্য এবং গোপনীয়তা ভারসাম্য বজায় রাখে।</p>\r\n<p>এই বিস্তৃত অন্বেষণ প্রযুক্তি ডিভাইস এবং আমাদের ব্যক্তিগত জীবনের মধ্যে বহুমুখী সম্পর্কের গভীরে তলিয়ে যায়। এটি পরীক্ষা করে যে অগণিত উপায়ে এই ডিভাইসগুলি আমাদের কাজ করার, যোগাযোগ করার এবং নিজেদেরকে বিনোদন দেওয়ার পদ্ধতিতে বিপ্লব করেছে৷ কৃত্রিম বুদ্ধিমত্তার শক্তি থেকে উৎপাদনশীলতা বাড়ানো স্মার্ট হোম অটোমেশন সিস্টেমের আরাম থেকে আমাদের দৈনন্দিন কাজগুলোকে সহজ করে, প্রযুক্তি আমাদের অস্তিত্বের ফ্যাব্রিকে নির্বিঘ্নে একত্রিত হয়েছে।</p>\r\n<p>যাইহোক, এই একীকরণ এর চ্যালেঞ্জ ছাড়া হয়নি। ডেটা গোপনীয়তা, সাইবার নিরাপত্তা, এবং ব্যক্তিগত সীমানা ক্ষয় নিয়ে উদ্বেগ ক্রমশ বিশিষ্ট হয়ে উঠেছে। যেহেতু প্রযুক্তি ডিভাইসগুলি আমাদের সম্পর্কে প্রচুর পরিমাণে তথ্য সংগ্রহ করে, তাই এই ডেটাতে কার অ্যাক্সেস আছে, কীভাবে এটি ব্যবহার করা হয় এবং কীভাবে আমরা আমাদের সবচেয়ে ঘনিষ্ঠ বিবরণগুলিকে ভয়ঙ্কর চোখ থেকে রক্ষা করতে পারি সে সম্পর্কে প্রশ্ন ওঠে৷</p>\r\n<p>এই বিস্তৃত আখ্যানটি আপনাকে আমাদের ব্যক্তিগত জীবনে প্রযুক্তির প্রভাবের মাধ্যমে একটি যাত্রায় নিয়ে যায়, এই ডিজিটাল রূপান্তরের ইতিবাচক এবং নেতিবাচক উভয় দিকই অন্বেষণ করে। এটি সুবিধা এবং নজরদারি, ডেটা সংগ্রহের আশেপাশের নৈতিক বিবেচনা এবং আন্তঃসংযুক্ত বিশ্বে আমাদের ব্যক্তিগত তথ্য সুরক্ষিত করার জন্য আমরা যে পদক্ষেপ নিতে পারি তার মধ্যে অস্পষ্ট রেখাগুলিকে সম্বোধন করে৷</p>\r\n<p>প্রযুক্তি এবং ব্যক্তিগত গোপনীয়তার মধ্যে জটিল নৃত্য আবিষ্কার করুন, আপনার ডেটা সুরক্ষিত করার জন্য উপলব্ধ কৌশল এবং সরঞ্জামগুলির অন্তর্দৃষ্টি পান এবং উদ্ভাবনের মধ্যে ভারসাম্য বজায় রাখার চেষ্টা করে এমন ব্যক্তি এবং সংস্থার গল্পগুলিতে অনুপ্রেরণা পান যা আমাদের ব্যক্তিগত গোপনীয়তা সবচেয়ে গুরুত্বপূর্ণ। আমাদের সাথে যোগ দিন যখন আমরা প্রযুক্তি ডিভাইসগুলির ক্রমবর্ধমান ল্যান্ডস্কেপ এবং আমাদের জীবনে তাদের গভীর প্রভাব নেভিগেট করি৷</p>', 'টেকনোলজি, ট্যাক্স, পার্সোনাল, ', 'প্রযুক্তি ডিভাইসগুলি আমাদের ব্যক্তিগতকে শেষ করে দেয়', 'প্রযুক্তি ডিভাইসগুলি আমাদের ব্যক্তিগতকে শেষ করে দেয়', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(13, 3, 'bn', 'সিস্টেম ডেভেলপাররা ওয়াল স্ক্রিনে কোড বিশ্লেষণ করছে।', 'এই ব্যস্ততাপূর্ণ, অত্যাধুনিক উন্নয়ন কর্মক্ষেত্রে, অত্যন্ত দক্ষ সিস্টেম ডেভেলপারদের একটি দল একটি সুবিশাল প্রাচীরের পর্দায় প্রক্ষিপ্ত কোডের জটিল লাইনগুলির একটি গভীর বিশ্লেষণে নিযুক্ত রয়েছে৷', '<p>এই ব্যস্ততাপূর্ণ, অত্যাধুনিক উন্নয়ন কর্মক্ষেত্রে, অত্যন্ত দক্ষ সিস্টেম ডেভেলপারদের একটি দল একটি সুবিশাল প্রাচীরের পর্দায় প্রক্ষিপ্ত কোডের জটিল লাইনগুলির একটি গভীর বিশ্লেষণে নিযুক্ত রয়েছে৷ দৃশ্যটি উদ্ভাবন, নির্ভুলতা এবং সমন্বয়ের একটি চিত্তাকর্ষক মিশ্রণ, যেখানে এই প্রতিভাবান ব্যক্তিরা সফ্টওয়্যার শ্রেষ্ঠত্বের নিরলস সাধনায় নিবেদিত।</p>\r\n<p>প্রাচীর পর্দা তাদের সহযোগিতামূলক প্রচেষ্টার কেন্দ্রস্থল হিসাবে কাজ করে, কোডের একটি জটিল ট্যাপেস্ট্রি প্রদর্শন করে যা তাদের উচ্চাভিলাষী সফ্টওয়্যার প্রকল্পের মেরুদণ্ডকে প্রতিনিধিত্ব করে। প্রোগ্রামিং ল্যাঙ্গুয়েজ এবং অ্যালগরিদম থেকে শুরু করে ডেটা স্ট্রাকচার এবং ডিজাইন প্যাটার্ন পর্যন্ত, তাদের কাজের প্রতিটি দিক সাবধানতার সাথে পরীক্ষা, পরীক্ষিত এবং পরিমার্জিত হয়।</p>\r\n<p>বিকাশকারীরা, প্রত্যেকে তাদের নিজস্ব অধিকারে একজন গুণী, একটি সমন্বয়কারী ইউনিট হিসাবে একত্রিত হয়েছে, এমন একটি পরিবেশ তৈরি করেছে যেখানে সমষ্টিগত জ্ঞান এবং বিভিন্ন দৃষ্টিভঙ্গি একত্রিত হয়। তাদের মাথা কীবোর্ডের উপর বাঁকানো, হাতগুলি ইনপুট ডিভাইস জুড়ে ঝাঁকুনি দেয়, কারণ তারা সম্মিলিতভাবে ডিসিফার করে, ডিবাগ করে এবং তাদের সামনে কোডটি উন্নত করে।</p>\r\n<p>কোডের প্রতিটি লাইন একটি গল্প, উদ্ভাবন এবং সমস্যা সমাধানের একটি যাত্রা ধারণ করে। তারা কোডবেস যাচাই করার সাথে সাথে, আলোচনা এবং ব্রেনস্টর্মিং সেশনগুলি বাতাসকে পূর্ণ করে, ধারণাগুলি অবাধে প্রবাহিত হয় এবং দলের যৌথ বুদ্ধি থেকে সৃজনশীল সমাধানগুলি উদ্ভূত হয়। চ্যালেঞ্জগুলি উত্সাহের সাথে পূরণ করা হয়, এবং বাধাগুলিকে সফ্টওয়্যার বিকাশে যা সম্ভব তার সীমানা ঠেলে দেওয়ার সুযোগ হিসাবে দেখা হয়।</p>\r\n<p>প্রাচীরের পর্দার বাইরে, ওয়ার্কস্টেশনের সারি মনিটর এবং কোডের অগণিত লাইন দিয়ে সজ্জিত করা হয়েছে, যা কেবল শক্তিশালী নয় বরং রূপান্তরকারী সিস্টেমগুলি তৈরি করার প্রতি তাদের প্রতিশ্রুতির গভীরতা প্রতিফলিত করে। রুমের শক্তি স্পষ্ট, সফ্টওয়্যার তৈরির ভাগ করা দৃষ্টি দ্বারা চালিত যা শিল্পগুলিকে পরিবর্তন করতে পারে, জীবনকে উন্নত করতে পারে এবং অগ্রগতি চালাতে পারে।</p>\r\n<p>এই মুহুর্তে, সিস্টেম বিকাশকারীরা নিছক কোড বিশ্লেষণ করছে না; তারা ডিজিটাল বিশ্বের ভাস্কর, প্রযুক্তির সীমানা ঠেলে দেয়, এবং ভবিষ্যতের কোডের এক লাইনকে পুনরায় আকার দেয়। উৎকর্ষের প্রতি তাদের নিবেদন এবং প্রযুক্তির শক্তিতে তাদের অটল বিশ্বাস অনুপ্রেরণাদায়ক থেকে কম কিছু নয়, এই সহযোগিতামূলক কোডিং সেশনকে মানুষের বুদ্ধিমত্তা এবং ডিজিটাল যুগের সীমাহীন সম্ভাবনার প্রমাণ করে তোলে।</p>', 'ডেভেলপারস, এনালাইজিং, ওয়াল স্ক্রিন, ', 'সিস্টেম ডেভেলপাররা ওয়াল স্ক্রিনে কোড বিশ্লেষণ করছে', 'সিস্টেম ডেভেলপাররা ওয়াল স্ক্রিনে কোড বিশ্লেষণ করছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(14, 4, 'bn', 'ক্লায়েন্টের সাথে ভিডিও কলে মাল্টিমিডিয়া নির্মাতা শিল্পী।', 'সৃজনশীল অভিব্যক্তির বিশাল ল্যান্ডস্কেপে, মাল্টিমিডিয়া নির্মাতা শিল্পীরা আধুনিক দিনের স্বপ্নদর্শী, ভাস্কর্য বর্ণনা এবং অভিজ্ঞতা যা প্রচলিত সীমানা অতিক্রম করে।', '<p>সৃজনশীল অভিব্যক্তির বিশাল ল্যান্ডস্কেপে, মাল্টিমিডিয়া নির্মাতা শিল্পীরা আধুনিক দিনের স্বপ্নদর্শী, ভাস্কর্য বর্ণনা এবং অভিজ্ঞতার মতো দাঁড়িয়ে থাকে যা প্রচলিত সীমানা অতিক্রম করে। যাইহোক, তাদের নৈপুণ্য গভীর উপায়ে বিকশিত হয়েছে, একটি যুগ দ্বারা চিহ্নিত যেখানে ক্লায়েন্টের সহযোগিতা ভিডিওকলের ডিজিটাল কন্ডুইটের মাধ্যমে তৈরি করা হয়।</p>\r\n<p>এই বহুমাত্রিক যাত্রা শুরু করে, আমরা একটি ক্রমবর্ধমান ভার্চুয়াল বিশ্বে সৃজনশীলতা, সংযোগ এবং শিল্পী এবং ক্লায়েন্টদের মধ্যে সংক্ষিপ্ত আন্তঃপ্রক্রিয়ার অন্বেষণ শুরু করি। এই গভীর ব্লগ পোস্টটি আপনাকে মাল্টিমিডিয়া সৃষ্টির মনোমুগ্ধকর জগতে নিমজ্জিত করে, সুযোগ এবং চ্যালেঞ্জের জটিল ওয়েব উন্মোচন করে যা যখন শৈল্পিকতা এবং বাণিজ্য ডিজিটাল পর্দায় একত্রিত হয়।</p>\r\n<p>একজন শিল্পীকে আমাদের গাইড হিসাবে নিয়ে, আমরা দূরবর্তী সহযোগিতার ট্যাপেস্ট্রি উন্মোচন করি, গর্ভধারণ থেকে ডেলিভারি পর্যন্ত আকর্ষণীয় প্রক্রিয়ার উপর আলোকপাত করি। এই সৃজনশীল গুণের পাশাপাশি, আমরা শৈল্পিক আলকেমিতে নেভিগেট করি যা একটি ভিডিওকলের পিক্সেলেড ফ্রেমের মধ্যে রূপান্তরিত হয়, বিমূর্ত ধারণাগুলিকে বাস্তব, বিস্ময়-প্রেরণাদায়ক মাস্টারপিসে রূপান্তরিত করে।</p>\r\n<p>আপনি এই ব্লগের পৃষ্ঠাগুলি অতিক্রম করার সাথে সাথে, আপনি শিল্পী-ক্লায়েন্ট অংশীদারিত্বের সাক্ষী হবেন কারণ এটি রিয়েল-টাইমে উন্মোচিত হবে৷ ভৌগলিক দূরত্ব এবং সময় অঞ্চলগুলিকে সেতু করার সময় একটি নিরবচ্ছিন্ন কর্মপ্রবাহ বজায় রাখার এবং সৃজনশীলতাকে লালন করার গোপনীয়তাগুলি আবিষ্কার করুন৷ আপনি একজন উচ্চাকাঙ্ক্ষী মাল্টিমিডিয়া স্রষ্টা শিল্পী যা অনুপ্রেরণা খুঁজছেন বা শৈল্পিক সহযোগিতার যাত্রা শুরু করতে আগ্রহী একজন ক্লায়েন্ট, এই আখ্যানটি আপনাকে সৃজনশীল অভিব্যক্তি এবং মানব সংযোগের ডিজিটাল গোলকধাঁধায় পথনির্দেশক একটি কম্পাস হওয়ার প্রতিশ্রুতি দেয়।</p>', 'মাল্টিমিডিয়া, ক্রিয়েটর, আর্টিস্ট, ডেভেলপমেন্ট, বিসনেস, ', 'ক্লায়েন্টের সাথে ভিডিও কলে মাল্টিমিডিয়া নির্মাতা শিল্পী', 'ক্লায়েন্টের সাথে ভিডিও কলে মাল্টিমিডিয়া নির্মাতা শিল্পী', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(15, 5, 'bn', 'গ্রাফিক ডিজাইনার ল্যাপটপ নিয়ে অফিসে কাজ করছেন।', 'একটি আধুনিক এবং গতিশীল অফিস পরিবেশে, একজন গ্রাফিক ডিজাইনার কঠোর পরিশ্রম করে, সৃজনশীলতা এবং উদ্ভাবনের জগতে নিমজ্জিত।', '<p>একটি আধুনিক এবং গতিশীল অফিস পরিবেশে, একজন গ্রাফিক ডিজাইনার কঠোর পরিশ্রম করে, সৃজনশীলতা এবং উদ্ভাবনের জগতে নিমজ্জিত। এই দক্ষ পেশাদার দৃশ্যত আকর্ষক এবং নান্দনিকভাবে আনন্দদায়ক ডিজাইন তৈরি করার জন্য দায়ী যা দর্শকদের মোহিত করে, বার্তা দেয় এবং ব্র্যান্ডের প্রচার করে।</p>\r\n<p>একটি মসৃণ এবং ergonomic ডেস্কে উপবিষ্ট, গ্রাফিক ডিজাইনার একটি সাবধানে কিউরেটেড ওয়ার্কস্পেস দ্বারা বেষ্টিত যা উত্পাদনশীলতা এবং সৃজনশীলতাকে অনুপ্রাণিত করে। অফিসটি একটি সমসাময়িক এবং ন্যূনতম নান্দনিকতার সাথে ডিজাইন করা হয়েছে, যেখানে পরিষ্কার লাইন, নিরপেক্ষ টোন এবং বড়, সু-স্থাপিত জানালা দিয়ে প্রচুর প্রাকৃতিক আলো প্রবাহিত হয়। ডিজাইনারের ওয়ার্কস্টেশন বিশৃঙ্খল, ফোকাস এবং কর্মদক্ষতার পরিবেশ তৈরি করে।</p>\r\n<p>গ্রাফিক ডিজাইনারের ওয়ার্কস্পেসের কেন্দ্রবিন্দু হল একটি হাই-এন্ড ল্যাপটপ, এর স্লিম প্রোফাইল এবং মসৃণ অ্যালুমিনিয়াম কেসিং স্টাইল এবং কার্যকারিতা উভয়ের প্রতি ডিজাইনারের প্রতিশ্রুতি প্রতিফলিত করে। ল্যাপটপের স্ক্রিন রঙের একটি উজ্জ্বল প্রদর্শনের সাথে বিকিরণ করে, চলমান নকশা প্রকল্পগুলির জটিল বিবরণ প্রদর্শন করে। কীবোর্ড, মাউস, এবং গ্রাফিক ট্যাবলেট কৌশলগতভাবে ergonomic আরামের জন্য স্থাপন করা হয়েছে, ডিজাইনারকে ক্লান্তি ছাড়াই বর্ধিত সময়ের জন্য কাজ করার অনুমতি দেয়।</p>\r\n<p>ল্যাপটপের চারপাশে ব্যবসার বিভিন্ন সরঞ্জাম রয়েছে। গ্রাফিক ডিজাইন সফ্টওয়্যার আইকনগুলির একটি সংগ্রহ ডেস্কটপকে লাইন করে, যা অ্যাডোব ক্রিয়েটিভ স্যুটের মতো শিল্প-মানক প্রোগ্রামগুলিতে ডিজাইনারের দক্ষতা প্রদর্শন করে। সুন্দরভাবে সংগঠিত নোটবুক এবং স্কেচপ্যাডের স্তুপগুলি হাতের নাগালের মধ্যে, ধারণাগুলি লিখতে, ধারণাগুলি স্কেচ করা বা টীকা তৈরির জন্য প্রস্তুত৷</p>\r\n<p>ডিজাইনারের সৃজনশীল ফ্লেয়ার ডেস্কে প্রদর্শিত আর্টওয়ার্ক থেকে স্পষ্ট। ফ্রেমযুক্ত পোস্টার, মুড বোর্ড, এবং অনুপ্রেরণামূলক প্রিন্টগুলি দেয়ালে শোভা পায়, ডিজাইনারের পোর্টফোলিও প্রদর্শন করে এবং অনুপ্রেরণার একটি ধ্রুবক উৎস হিসেবে কাজ করে। বর্তমান প্রজেক্টের জন্য একটি মুড বোর্ড একটি কাছাকাছি কর্কবোর্ডে সুস্পষ্টভাবে পিন করা হয়েছে, যেখানে চলমান ডিজাইনের সারমর্ম ক্যাপচার করে এমন চিত্র, রঙের সোয়াচ এবং টাইপোগ্রাফির নমুনার একটি কোলাজ রয়েছে।</p>\r\n<p>একজোড়া শব্দ-বাতিলকারী হেডফোন একটি আড়ম্বরপূর্ণ হেডফোন স্ট্যান্ডে স্থির থাকে, অফিসের কোলাহলপূর্ণ পরিবেশে যেকোনো বিভ্রান্তি দূর করতে প্রস্তুত। সহকর্মীদের সহযোগিতার ব্যাকগ্রাউন্ড হাম এবং কীবোর্ডে ক্লিক করার শব্দ দূরের গোঙানির মধ্যে ম্লান হয়ে যায়, যা ডিজাইনারকে হাতের কাজটিতে মনোযোগ সহকারে ফোকাস করতে দেয়।</p>\r\n<p>ডিজাইনারের পোষাক পেশাদারিত্ব এবং ব্যক্তিত্বের মিশ্রণকে প্রতিফলিত করে, একটি সাবধানে বাছাই করা পোশাক যা আরাম এবং শৈলীর মধ্যে সঠিক ভারসাম্য বজায় রাখে। একটি খাস্তা, মানানসই শার্ট বা ব্লাউজ অনায়াসে ভালভাবে লাগানো ট্রাউজার্স বা একটি স্কার্টের সাথে জোড়া লাগে। পোশাকের পছন্দটি ব্যবহারিক, ডিজাইনারকে অফিসের কাজ থেকে ক্লায়েন্ট মিটিং বা ব্রেনস্টর্মিং সেশনে নির্বিঘ্নে স্থানান্তর করার অনুমতি দেয়।</p>\r\n<p>একটি সুসংগঠিত ডেস্ক ডিজাইনের রেফারেন্স বই, ম্যাগাজিন এবং ডিজাইন পুরষ্কার এবং শংসাপত্রের একটি বাছাইয়ের একটি ভাণ্ডার নিয়েও গর্ব করে, যা ক্ষেত্রে ডিজাইনারের দক্ষতা এবং স্বীকৃতির প্রমাণ দেয়। একটি সতর্কতার সাথে রক্ষণাবেক্ষণ করা পাত্রযুক্ত উদ্ভিদ কর্মক্ষেত্রে সবুজের ছোঁয়া যোগ করে, সৃজনশীল তাড়াহুড়ার মধ্যে প্রশান্তি প্রদান করে।</p>\r\n<p>সামগ্রিকভাবে, গ্রাফিক ডিজাইনারের অফিস ওয়ার্কস্পেস প্রযুক্তি, সৃজনশীলতা এবং পেশাদারিত্বের একটি সুরেলা মিশ্রণকে মূর্ত করে। এটি এমন একটি জায়গা যেখানে ধারণাগুলি প্রাণবন্ত হয়, যেখানে পিক্সেলগুলিকে সূক্ষ্মভাবে সাজানো হয় যাতে আকর্ষক ভিজ্যুয়াল তৈরি করা হয় এবং যেখানে শিল্প ও ডিজাইনের ফিউশন গ্রাফিক ডিজাইনের চির-বিকশিত বিশ্বে অসাধারণ ফলাফল দেয়৷</p>', 'গ্রাফিক, ডিসাইনার, ওয়ার্কিং ইন অফিস, ', 'গ্রাফিক ডিজাইনার ল্যাপটপ নিয়ে অফিসে কাজ করছেন', 'গ্রাফিক ডিজাইনার ল্যাপটপ নিয়ে অফিসে কাজ করছেন', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(16, 6, 'bn', 'তরুণ ডিজাইনার বসে থাকা অবস্থায় তার হাতে একটি এটি দেখছেন।', 'একটি ট্রেন্ডি, মিনিমালিস্ট স্টুডিও অ্যাপার্টমেন্টের একটি আরামদায়ক, সূর্যালোক কোণে, একজন তরুণ ডিজাইনার নিজেকে সৃজনশীলতার জগতে নিমজ্জিত দেখতে পান।', '<p>একটি ট্রেন্ডি, মিনিমালিস্ট স্টুডিও অ্যাপার্টমেন্টের একটি আরামদায়ক, সূর্যালোক কোণে, একজন তরুণ ডিজাইনার নিজেকে সৃজনশীলতার জগতে নিমজ্জিত দেখতে পান। রুমটি শৈল্পিক অনুপ্রেরণার আভা প্রকাশ করে, সাদা দেয়াল রঙিন, বিমূর্ত পেইন্টিং দিয়ে সজ্জিত যা নকশার প্রতি তার আবেগের প্রমাণ হিসাবে কাজ করে। বায়ুমণ্ডল শান্ত, একটি মৃদু হাওয়া অর্ধ-টানা পর্দার মধ্য দিয়ে ফিল্টারিং করে, কাছের ফুলদানি থেকে তাজা ফুলের মৃদু ঘ্রাণ বাতাসে ভেসে যেতে দেয়।</p>\r\n<p>একটি মধ্য শতাব্দীর আধুনিক চেয়ারে উপবিষ্ট, ডিজাইনারের ভঙ্গিটি আরামদায়ক চিন্তাভাবনার অনুভূতি প্রকাশ করে। তার পা ক্রস করা হয়, এবং সে কিছুটা পিছনে ঝুঁকে পড়ে, পুরোপুরি আরামে। চেয়ারের পরিষ্কার লাইন এবং উষ্ণ কাঠের টোনগুলি তার যৌবনপূর্ণ অথচ পরিশীলিত আচরণের পরিপূরক।</p>\r\n<p>তার হাতে, তিনি একটি মসৃণ, অত্যাধুনিক ট্যাবলেট ধরে রেখেছেন - আধুনিক প্রযুক্তির একটি বিস্ময় যা সৃজনশীল মনের জন্য একটি অপরিহার্য হাতিয়ার হয়ে উঠেছে। ট্যাবলেটের ব্রাশ করা অ্যালুমিনিয়াম ফিনিশ নরম, ছড়িয়ে পড়া সূর্যালোককে প্রতিফলিত করে, এটিকে প্রায় ইথারিয়াল আভা দেয়। এর বৃহৎ, উচ্চ-রেজোলিউশনের স্ক্রিনটি ডিজিটাল চিত্র এবং ডিজাইন ধারণার একটি জটিল ওয়েব প্রদর্শন করে, প্রতিটি পিক্সেল তার প্রতিভা এবং উত্সর্গের প্রমাণ।</p>\r\n<p>ডিজাইনারের দৃষ্টি ট্যাবলেটের উপর নিবিড়ভাবে স্থির, তার চোখ লেজারের মতো ফোকাস দিয়ে স্ক্রীন স্ক্যান করছে। তার মুখটি একাগ্রতার একটি ক্যানভাস, লোমযুক্ত ভ্রু এবং একটি সামান্য বিভাজিত মুখ, যা হাতে থাকা কাজের মধ্যে তার নিমগ্নতার গভীরতা প্রকাশ করে। তার আঙ্গুলগুলি টাচস্ক্রিন জুড়ে সুন্দরভাবে নাচছে, ডিজিটাল ব্রাশ এবং সরঞ্জামগুলিকে এমন সূক্ষ্মতার সাথে পরিচালনা করে যা কেবল বছরের অনুশীলনে অর্জন করা যায়।</p>\r\n<p>তিনি যখন তার কাজের গভীরে প্রবেশ করেন, তখন তার চারপাশের ঘরটি পটভূমিতে বিবর্ণ হয়ে যায় এবং যা অবশিষ্ট থাকে তা হল ডিজাইনার এবং তার ডিজিটাল ক্যানভাসের মধ্যে সিম্বিওটিক সংযোগ। ধারণাগুলি নদীর মতো প্রবাহিত হয় এবং লেখনীর প্রতিটি স্ট্রোকের সাথে সে তার দর্শনগুলিকে জীবন্ত করে তোলে। তার মুখে আলো এবং ছায়ার আন্তঃপ্রক্রিয়া তার সৃজনশীল প্রক্রিয়ার ভাটা এবং প্রবাহকে প্রতিফলিত করে, কারণ তিনি ভার্চুয়াল জগতকে তার নিজস্ব কিছুতে ঢালাই করেন।</p>\r\n<p>শৈল্পিক নিমজ্জনের এই মুহুর্তে সময় স্থির হয়ে আছে বলে মনে হচ্ছে। তরুণ ডিজাইনার, তার নিজের সৃষ্টির জগতে হারিয়ে গেছে, মানুষের কল্পনাশক্তির এবং সীমাহীন সম্ভাবনার একটি প্রমাণ যা প্রযুক্তি ডিজাইনের প্রতি অনুরাগ তাদের জন্য অফার করে। তার হাতে ট্যাবলেট শুধু একটি যন্ত্র নয়; এটি সীমাহীন সৃজনশীলতার রাজ্যের একটি প্রবেশদ্বার, এবং তিনিই এর কর্তা, এক সময়ে একটি ডিজিটাল ব্রাশস্ট্রোক ভবিষ্যতের রূপ দিচ্ছেন৷</p>', 'ইয়ং, ডিসাইনার, লুকিং, টেকনোলজি, ', 'তরুণ ডিজাইনার বসে থাকা অবস্থায় তার হাতে একটি এটি দেখছেন', 'তরুণ ডিজাইনার বসে থাকা অবস্থায় তার হাতে একটি এটি দেখছেন', '2023-09-23 09:52:17', '2023-10-01 10:41:44');
INSERT INTO `blog_languages` (`id`, `blog_id`, `lang_code`, `title`, `short_description`, `description`, `tag`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(17, 7, 'bn', 'ব্যবসা কোম্পানি এক্সিকিউটিভ ম্যানেজার বিশ্লেষণ ।', 'একটি বিজনেস কোম্পানির এক্সিকিউটিভ ম্যানেজারের ভূমিকা যে কোনো প্রতিষ্ঠানে সবচেয়ে গুরুত্বপূর্ণ।', '<p>একটি বিজনেস কোম্পানির এক্সিকিউটিভ ম্যানেজারের ভূমিকা যে কোনো প্রতিষ্ঠানে সবচেয়ে গুরুত্বপূর্ণ। এই অবস্থানটি সাধারণত কর্পোরেট শ্রেণিবিন্যাসের উপরের স্তরে অবস্থিত এবং যথেষ্ট দায়িত্ব এবং সিদ্ধান্ত গ্রহণের কর্তৃপক্ষ বহন করে। একজন এক্সিকিউটিভ ম্যানেজারের প্রাথমিক উদ্দেশ্য হল একটি কোম্পানির সম্পূর্ণ ক্রিয়াকলাপ তত্ত্বাবধান করা, এটি নিশ্চিত করা যে এটি দক্ষতার সাথে, কার্যকরভাবে এবং সংস্থার কৌশলগত লক্ষ্য এবং উদ্দেশ্যগুলির সাথে সারিবদ্ধভাবে চলে।</p>\r\n<p>এক্সিকিউটিভ ম্যানেজারদের অনেকগুলি কাজ এবং দায়িত্বের সাথে অভিযুক্ত করা হয় যা ব্যবসার বিভিন্ন দিককে অন্তর্ভুক্ত করে। এই দায়িত্বগুলি প্রায়ই অন্তর্ভুক্ত করে:</p>\r\n<p>কৌশলগত পরিকল্পনা: একজন এক্সিকিউটিভ ম্যানেজারের মূল দায়িত্বগুলির মধ্যে একটি হল কৌশলগত পরিকল্পনায় জড়িত হওয়া। এতে কোম্পানির জন্য দীর্ঘমেয়াদী লক্ষ্য ও উদ্দেশ্য নির্ধারণ করা, সেগুলি অর্জনের কৌশল প্রণয়ন করা এবং বাজারের পরিবর্তিত অবস্থার সাথে খাপ খাইয়ে নেওয়ার জন্য প্রয়োজনীয় এই পরিকল্পনাগুলি নিয়মিত পর্যালোচনা এবং সামঞ্জস্য করা জড়িত।</p>\r\n<p>নেতৃত্ব এবং টিম ম্যানেজমেন্ট: এক্সিকিউটিভ ম্যানেজাররা একটি উচ্চ-সম্পাদক দল গঠন ও নেতৃত্ব দেওয়ার জন্য দায়ী। এর মধ্যে রয়েছে নিয়োগ, প্রশিক্ষণ এবং উন্নয়নশীল কর্মীদের, সেইসাথে একটি ইতিবাচক এবং উত্পাদনশীল কাজের সংস্কৃতি গড়ে তোলা।</p>\r\n<p>আর্থিক ব্যবস্থাপনা: কোম্পানির আর্থিক স্বাস্থ্য পর্যবেক্ষণ এবং পরিচালনা অত্যন্ত গুরুত্বপূর্ণ। এক্সিকিউটিভ ম্যানেজাররা বাজেট, আর্থিক পূর্বাভাস এবং আর্থিক প্রতিবেদনের তদারকি করেন। তারা আর্থিক সিদ্ধান্ত নেওয়ার জন্যও দায়ী যা কোম্পানির লাভ এবং স্থায়িত্বকে প্রভাবিত করে।</p>\r\n<p>অপারেশন ম্যানেজমেন্ট: প্রতিদিনের কাজগুলি সুচারুভাবে চালানো নিশ্চিত করা অপরিহার্য। কার্যনির্বাহী পরিচালকদের কার্যকারিতা বাড়ানোর জন্য প্রক্রিয়াগুলিকে স্ট্রিমলাইন করতে হবে, সম্পদ বরাদ্দ অপ্টিমাইজ করতে হবে এবং অপারেশনাল চ্যালেঞ্জগুলি সমাধান করতে হবে।</p>\r\n<p>স্টেকহোল্ডার সম্পর্ক: এক্সিকিউটিভ ম্যানেজাররা প্রায়ই কোম্পানির মুখ হিসেবে কাজ করে বাইরের স্টেকহোল্ডারদের, যার মধ্যে বিনিয়োগকারী, গ্রাহক, সরবরাহকারী এবং নিয়ন্ত্রক কর্তৃপক্ষ। তাদের অবশ্যই ইতিবাচক সম্পর্ক বজায় রাখতে হবে এবং এই গোষ্ঠীগুলির সাথে কার্যকরভাবে যোগাযোগ করতে হবে।</p>\r\n<p>ঝুঁকি ব্যবস্থাপনা: ঝুঁকি চিহ্নিত করা এবং প্রশমন করা একজন নির্বাহী পরিচালকের ভূমিকার একটি অবিচ্ছেদ্য অংশ। এর মধ্যে রয়েছে ব্যবসার সম্ভাব্য ঝুঁকির মূল্যায়ন, ঝুঁকি ব্যবস্থাপনার কৌশল প্রয়োগ করা এবং কোম্পানির সম্পদ ও সুনাম রক্ষার জন্য সিদ্ধান্ত নেওয়া।</p>\r\n<p>উদ্ভাবন এবং অভিযোজন: আজকের দ্রুত পরিবর্তনশীল ব্যবসায়িক পরিবেশে প্রতিযোগিতামূলক থাকার জন্য উদ্ভাবন এবং অভিযোজন প্রয়োজন। নির্বাহী পরিচালকদের অবশ্যই প্রতিষ্ঠানের মধ্যে উদ্ভাবনের সংস্কৃতি প্রচার করতে হবে এবং বাজারের চাহিদা মেটাতে প্রয়োজনে পিভট করতে ইচ্ছুক হতে হবে।</p>\r\n<p>সম্মতি এবং নৈতিকতা: নিশ্চিত করা যে কোম্পানিটি প্রযোজ্য আইন এবং নৈতিক মান অনুযায়ী কাজ করে তা সর্বাগ্রে। নির্বাহী পরিচালকদের অবশ্যই নৈতিক আচরণের একটি উদাহরণ স্থাপন করতে হবে এবং সম্মতি বজায় রাখার জন্য নীতি ও পদ্ধতি স্থাপন করতে হবে।</p>\r\n<p>কর্মক্ষমতা মূল্যায়ন: কোম্পানির লক্ষ্য এবং বেঞ্চমার্কের বিপরীতে তার কর্মক্ষমতা নিয়মিতভাবে মূল্যায়ন করা গুরুত্বপূর্ণ। এক্সিকিউটিভ ম্যানেজাররা সাফল্যের পরিমাপ করতে এবং ডেটা-চালিত সিদ্ধান্ত নিতে মূল কর্মক্ষমতা সূচক (KPIs) এবং অন্যান্য মেট্রিক্স ব্যবহার করেন।</p>\r\n<p>কৌশলগত অংশীদারিত্ব: কৌশলগত অংশীদারিত্বের বিকাশ এবং লালন বৃদ্ধি এবং সম্প্রসারণের জন্য অপরিহার্য হতে পারে। এক্সিকিউটিভ ম্যানেজাররা কোম্পানির কৌশলগত দৃষ্টিভঙ্গির সাথে সামঞ্জস্যপূর্ণ সহযোগিতা, জোট এবং একীভূতকরণ বা অধিগ্রহণের সুযোগগুলি অন্বেষণ করে।</p>\r\n<p>সংক্ষেপে, একটি বিজনেস কোম্পানি এক্সিকিউটিভ ম্যানেজারের ভূমিকা বহুমুখী এবং গতিশীল। এটি শক্তিশালী নেতৃত্বের দক্ষতা, কৌশলগত চিন্তাভাবনা, আর্থিক দক্ষতা এবং জটিল চ্যালেঞ্জ এবং সুযোগগুলি নেভিগেট করার ক্ষমতার দাবি করে। এই ভূমিকায় সাফল্যের জন্য শিল্পের গভীর উপলব্ধি, কার্যকর যোগাযোগ এবং সংস্থার দীর্ঘমেয়াদী সাফল্যের প্রতিশ্রুতি প্রয়োজন। এক্সিকিউটিভ ম্যানেজার কোম্পানির ভবিষ্যত গঠনে এবং এর টেকসইতা ও সমৃদ্ধি নিশ্চিত করতে গুরুত্বপূর্ণ ভূমিকা পালন করে।</p>', 'বিসনেস, কোম্পানি, এক্সেকিউটিভে, এনালাইজিং, ', 'ব্যবসা কোম্পানি এক্সিকিউটিভ ম্যানেজার বিশ্লেষণ', 'ব্যবসা কোম্পানি এক্সিকিউটিভ ম্যানেজার বিশ্লেষণ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(18, 8, 'bn', 'একটি অফিসে বিজনেস প্ল্যানের কাজ করা লোকদের গ্রুপ।', 'একটি মসৃণ, মৃদু গচুম্বী ভবনের মধ্যে একটি অফিসে, ব্যক্তিদের একটি কর্মক্ষম শ্রমিক কঠোর পরিশ্রম করছে, একটি সতর্কতার সাথে ব্যবসায়িক পরিকল্পনা করতে চেষ্টা করছে।', '<p>একটি মসৃণ, আধুনিক গগনচুম্বী ভবনের মধ্যে অবস্থিত একটি ব্যস্ত অফিসে, ব্যক্তিদের একটি গতিশীল গোষ্ঠী কঠোর পরিশ্রম করছে, একটি সতর্কতার সাথে বিস্তারিত ব্যবসায়িক পরিকল্পনা তৈরি করতে আন্তরিকভাবে সহযোগিতা করছে৷ রুমটি পেশাদারিত্ব এবং উচ্চাকাঙ্ক্ষার আভা প্রকাশ করে, এর কাচের দেয়ালগুলি নীচে শহুরে ল্যান্ডস্কেপের প্যানোরামিক দৃশ্যগুলি অফার করে, যা প্রাকৃতিক আলোকে প্রবাহিত হতে দেয় এবং ভিতরের ব্যস্ত কার্যকলাপকে আলোকিত করে।</p>\r\n<p>একটি বিশাল, পালিশ করা কাঠের টেবিলের চারপাশে, নথির স্তুপে সজ্জিত, বিভিন্ন পেশাদারদের একটি দল জড়ো হয়েছে। প্রতিভা এবং ব্যাকগ্রাউন্ডের একটি মোজাইক প্রতিনিধিত্ব করে প্রতিটি সদস্য তাদের অনন্য দক্ষতাকে টেবিলে নিয়ে আসে, পাকা প্রবীণ থেকে শুরু করে তাজা-মুখী উদ্ভাবক পর্যন্ত। তারা তাদের এন্টারপ্রাইজের ভবিষ্যতের জন্য একটি সম্মিলিত দৃষ্টি দ্বারা চালিত, ভাগ করা উদ্দেশ্যের অনুভূতি মূর্ত করে।</p>\r\n<p>বায়ুমণ্ডলটি প্রত্যাশায় অভিযুক্ত, এবং কথোপকথনের কম বচসা এবং কীবোর্ডের টোকা দিয়ে রুম গুঞ্জন। ল্যাপটপ, ট্যাবলেট এবং স্মার্টফোনগুলি টেবিল জুড়ে ছড়িয়ে ছিটিয়ে রয়েছে, কারণ ডিজিটাল সরঞ্জামগুলি নিরবচ্ছিন্নভাবে ঐতিহ্যবাহী স্টেশনারির সাথে একীভূত হয়, যা নিরবধি ব্যবসায়িক দক্ষতার সাথে আধুনিক প্রযুক্তির সংমিশ্রণকে প্রতিফলিত করে।</p>\r\n<p>এক দেয়ালে সাদা বোর্ডটি রঙিন ডায়াগ্রাম, ফ্লোচার্ট এবং স্টিকি নোট সহ স্ক্রিবল করা ধারণা এবং সমালোচনামূলক মাইলফলক দ্বারা আচ্ছাদিত। টেবিলের বিপরীতে একটি প্রজেক্টর স্ক্রীন গ্রাফ, চার্ট এবং ডেটা ভিজ্যুয়ালাইজেশন প্রদর্শন করে, যা দলের কৌশলগত আলোচনার জন্য একটি ভিজ্যুয়াল রোডম্যাপ প্রদান করে।</p>\r\n<p>গোষ্ঠীর নেতা, একজন আত্মবিশ্বাসী এবং ক্যারিশম্যাটিক ব্যক্তি, টেবিলের মাথায় দাঁড়িয়ে, কর্তৃত্বের সাথে আলোচনার নির্দেশনা দেন। তারা দক্ষতার সাথে ব্রেনস্টর্মিং সেশনের সুবিধা দেয়, নিশ্চিত করে যে প্রতিটি সদস্যের কণ্ঠ শোনা এবং বিবেচনা করা হয়। তীক্ষ্ণ ব্যবসায়িক পোশাক এবং একটি ভালভাবে প্রস্তুত উপস্থাপনা এই প্রচেষ্টার পিছনে চালিকা শক্তি হিসাবে তাদের ভূমিকাকে শক্তিশালী করে।</p>\r\n<p>ঘন্টা পেরিয়ে যাওয়ার সাথে সাথে, হাতে থাকা কাজের চ্যালেঞ্জ এবং জটিলতা থাকা সত্ত্বেও ঘরে শক্তি বেশি থাকে। দলের ফোকাস ধরে রাখতে কফির কাপ এবং পানির বোতল সহজেই পাওয়া যায় এবং তাজা তৈরি করা কফির সুবাস মুদ্রিত নথির গন্ধের সাথে মিশে যায়, এমন পরিবেশ তৈরি করে যা উৎপাদনশীলতাকে উৎসাহিত করে।</p>\r\n<p>শ্রেষ্ঠত্বের প্রতি দলের প্রতিশ্রুতি এবং একটি আকর্ষক ব্যবসায়িক পরিকল্পনা গঠনের জন্য তাদের সম্মিলিত সংকল্প স্পষ্ট। বায়ুমণ্ডলটি বৌদ্ধিক কঠোরতা, উদ্ভাবন এবং ব্যবসার চির-বিকশিত বিশ্বে প্রতিবন্ধকতাগুলি অতিক্রম করার এবং সুযোগগুলি দখল করার তাদের ক্ষমতার উপর একটি অটুট বিশ্বাসের সাথে অভিযুক্ত।</p>\r\n<p>প্রতিভা, প্রযুক্তি এবং উচ্চাকাঙ্ক্ষার সংমিশ্রণ দ্বারা আলোকিত এই অফিসে, একটি ব্যবসায়িক পরিকল্পনা নিছক একটি দলিল নয় বরং তাদের প্রতিষ্ঠানের ভবিষ্যতকে নতুন করে সংজ্ঞায়িত করার লক্ষ্যে একদল ব্যক্তির উত্সর্গ এবং সহযোগিতামূলক মনোভাবের প্রমাণ।</p>', 'গ্রুপ, পিপল, বিসনেস, প্ল্যান, ', 'একটি অফিসে বিজনেস প্ল্যানের কাজ করা লোকদের গ্রুপ', 'একটি অফিসে বিজনেস প্ল্যানের কাজ করা লোকদের গ্রুপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(19, 9, 'bn', 'সফল ব্যবসায়িক অংশীদারদের একটি মিটিং হচ্ছে।', 'একটি ব্যস্ত মহানগরীর কেন্দ্রস্থলে, দুই সফল ব্যবসায়িক অংশীদার, জন এবং সারা, একটি গুরুত্বপূর্ণ মিটিং করছেন যা তাদের সমৃদ্ধ এন্টারপ্রাইজের ভবিষ্যত গঠন করতে পারে।', '<p>একটি ব্যস্ত মহানগরীর কেন্দ্রস্থলে, দুই সফল ব্যবসায়িক অংশীদার, জন এবং সারা, একটি গুরুত্বপূর্ণ মিটিং করছেন যা তাদের সমৃদ্ধ এন্টারপ্রাইজের ভবিষ্যত গঠন করতে পারে। দৃশ্যটি একটি মসৃণ এবং আধুনিক বোর্ডরুমে সেট করা হয়েছে, মেঝে থেকে ছাদ পর্যন্ত জানালা দিয়ে প্রাকৃতিক আলোর প্রবাহে প্লাবিত হয়েছে যা শহরের আকাশরেখার একটি শ্বাসরুদ্ধকর দৃশ্য সরবরাহ করে। রুমটি সুস্বাদু, ন্যূনতম সাজসজ্জায় সজ্জিত, পেশাদারিত্ব এবং পরিশীলিততার বাতাস বহন করে।</p>\r\n<p>জন, ক্যারিশম্যাটিক আচরণের একজন পাকা উদ্যোক্তা, লম্বা, পালিশ করা মেহগনি টেবিলের এক প্রান্তে বসে আছেন। তার তৈরি চারকোল স্যুট এবং পাওয়ার টাই আত্মবিশ্বাস এবং কর্তৃত্ব প্রকাশ করে। সারা, তার সমানভাবে দক্ষ প্রতিপক্ষ, তার মার্জিত প্যান্টসুটে দক্ষতা বিকিরণ করে, যা তার সুন্দর আচরণকে পরিপূরক করে। তাদের মধ্যে টেবিলটি সুন্দরভাবে সাজানো নথি, ল্যাপটপ এবং একটি নোটপ্যাড দিয়ে সজ্জিত, একটি ফলপ্রসূ আলোচনার জন্য প্রস্তুত।</p>\r\n<p>তাদের অভিব্যক্তিগুলি বহু বছরের উত্সর্গ এবং কঠোর পরিশ্রমের একটি প্রমাণ যা তাদের এই মুহুর্তে নিয়ে গেছে। জনের অনুপ্রবেশকারী দৃষ্টি এবং সামান্য হাসি উদ্ভাবনের প্রতি তার আবেগ প্রকাশ করে, অন্যদিকে সারার দৃষ্টি নিবদ্ধ অভিব্যক্তি তার বিশদ প্রতি মনোযোগী দৃষ্টি প্রতিফলিত করে। যখন তারা ধারণা বিনিময় করে, এটা স্পষ্ট যে তাদের সমন্বয় তাদের ব্যবসার অবিশ্বাস্য সাফল্যের পিছনে চালিকা শক্তি।</p>\r\n<p>বায়ু প্রত্যাশার সাথে চার্জ করা হয়, এবং তাদের আলোচনা চিন্তাশীল বিরতি দ্বারা বিরামচিহ্নিত হয় কারণ তারা প্রতিটি সিদ্ধান্তের সম্ভাব্য প্রভাবকে ওজন করে। তারা পরিমাপিত সুরে কথা বলে, তাদের পারস্পরিক শ্রদ্ধা এবং তাদের পেশাদার সম্পর্কের গভীরতা প্রদর্শন করে। তাদের কণ্ঠ প্রত্যয়ের সাথে অনুরণিত হয়, প্রতিটি পয়েন্ট তারা কোম্পানির মিশনের প্রতি তাদের অটল প্রতিশ্রুতির প্রমাণ দেয়।</p>\r\n<p>পটভূমিতে, শহরের জীবনের নরম গুঞ্জন এই বোর্ডরুমের বাইরে বিশ্বের একটি অনুস্মারক হিসাবে কাজ করে, যেখানে তাদের ব্যবসা একটি উল্লেখযোগ্য প্রভাব ফেলেছে। দেয়ালগুলি ফ্রেমযুক্ত প্রশংসা এবং পুরষ্কার দ্বারা সজ্জিত, তাদের শিল্পের স্বীকৃতি এবং তারা একসাথে যে প্রশংসা অর্জন করেছে তা প্রমাণ করে।</p>\r\n<p>পুরো মিটিং জুড়ে, অংশীদাররা তাদের সম্মিলিত দক্ষতা এবং পরিপূরক দক্ষতার সেটগুলি থেকে আঁকেন, কোম্পানির ভবিষ্যতের জন্য একটি দৃষ্টিভঙ্গি তৈরি করে যা উচ্চাকাঙ্ক্ষী এবং বাস্তব উভয়ই। তাদের ব্যবসায়িক বুদ্ধিমত্তা এবং কৌশল করার ক্ষমতা সম্পূর্ণ প্রদর্শনে রয়েছে কারণ তারা এমন একটি কোর্স চার্ট করে যা শুধুমাত্র তাদের বর্তমান সাফল্যকে বজায় রাখবে না বরং এটিকে নতুন উচ্চতায় উন্নীত করবে।</p>\r\n<p>বাইরে, সূর্য আকাশ জুড়ে তার যাত্রা অব্যাহত রাখে, ঘরের মধ্যে আলো এবং ছায়ার স্থানান্তরিত নিদর্শন ঢালাই করে। বৈঠকের অগ্রগতির সাথে সাথে, এটি স্পষ্ট যে এই দুটি উল্লেখযোগ্য ব্যক্তি কেবল ব্যবসায়ের অংশীদার নয় বরং বৃদ্ধি, উদ্ভাবন এবং অটল সংকল্পের একটি যৌথ যাত্রায় আত্মীয় আত্মা। তাদের মিটিং হল সহযোগিতার শক্তি, দৃষ্টিভঙ্গি এবং অবিশ্বাস্য উচ্চতায় যে সফল ব্যবসায়িক অংশীদাররা একত্রিত হয়ে ভবিষ্যৎ গঠন করতে পারে তার প্রমাণ।</p>', 'সাকসেসফুল, বিসনেস, পার্টনারস, মিটিং, ', 'সফল ব্যবসায়িক অংশীদারদের একটি মিটিং হচ্ছে', 'সফল ব্যবসায়িক অংশীদারদের একটি মিটিং হচ্ছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(20, 10, 'bn', 'আপনি কিভাবে অন্যান্য UXers গ্রুপ থেকে প্রবণতা এবং কৌশল খুঁজে পেতে পারেন ?', 'অবশ্যই! অন্যান্য UX (ব্যবহারকারীর অভিজ্ঞতা) পেশাদার এবং গোষ্ঠী থেকে প্রবণতা এবং কৌশলগুলি সন্ধান করা অনুপ্রেরণা এবং শেখার একটি মূল্যবান উত্স হতে পারে।', '<p>অবশ্যই! অন্যান্য UX (ব্যবহারকারীর অভিজ্ঞতা) পেশাদার এবং গোষ্ঠী থেকে প্রবণতা এবং কৌশলগুলি সন্ধান করা অনুপ্রেরণা এবং শেখার একটি মূল্যবান উত্স হতে পারে। আপনি কীভাবে এটি সম্পর্কে যেতে পারেন তার আরও বিশদ বিবরণ এখানে রয়েছে অনলাইন UX সম্প্রদায়, ফোরাম এবং সোশ্যাল মিডিয়া গ্রুপ যেখানে UX পেশাদাররা জড়ো হয় সেখানে যোগদানের মাধ্যমে শুরু করুন৷ LinkedIn, Reddit (r/userexperience) এর মত প্ল্যাটফর্ম এবং UX স্ট্যাক এক্সচেঞ্জের মত বিশেষ UX ফোরাম সহ UXers-এর সাথে সংযোগ করার জন্য দুর্দান্ত জায়গা।</p>\r\n<p>প্রভাবশালী UXers অনুসরণ করুন: আপনার ক্ষেত্রের প্রভাবশালী UX পেশাদার, ডিজাইনার এবং গবেষকদের সনাক্ত করুন এবং Twitter, LinkedIn বা মিডিয়ামের মতো সামাজিক মিডিয়া প্ল্যাটফর্মে তাদের অনুসরণ করুন। তারা প্রায়ই অন্তর্দৃষ্টি, প্রবণতা এবং কৌশল ভাগ করে।</p>\r\n<p>কনফারেন্স এবং ওয়েবিনারে যোগ দিন: UX কনফারেন্স, ওয়েবিনার এবং ভার্চুয়াল ইভেন্টে অংশগ্রহণ করুন। এই ইভেন্টগুলি প্রায়শই শীর্ষস্থানীয় UX বিশেষজ্ঞদের দ্বারা আলোচনা এবং উপস্থাপনাগুলি দেখায়, যেখানে তারা উদীয়মান প্রবণতা নিয়ে আলোচনা করে এবং তাদের কৌশলগুলি ভাগ করে নেয়। UX ব্লগ এবং প্রকাশনা পড়ুন নিয়মিত UX ব্লগ, বই এবং শিল্প প্রকাশনা পড়ে আপডেট থাকুন। জনপ্রিয় ইউএক্স ব্লগের মধ্যে রয়েছে NN/g (নিলসেন নরম্যান গ্রুপ), স্ম্যাশিং ম্যাগাজিন এবং ইউএক্স ডিজাইন ইনস্টিটিউট।</p>\r\n<p>অনলাইন কর্মশালায় নিযুক্ত হন: অনেক UX পেশাদার অনলাইন কর্মশালা এবং কোর্স অফার করে। এগুলিতে অংশগ্রহণ করা আপনাকে ক্ষেত্রের সর্বশেষ সরঞ্জাম এবং কৌশলগুলি সম্পর্কে শিখতে সহায়তা করতে পারে।</p>\r\n<p>সহকর্মীদের সাথে সহযোগিতা করুন: আপনি যদি একটি UX দলে বা অন্যান্য UX পেশাদারদের সাথে কাজ করেন, তাহলে আপনার প্রতিষ্ঠানের মধ্যে সহযোগিতা করতে এবং জ্ঞান ভাগ করতে দ্বিধা করবেন না। জ্ঞান-ভাগ করার সেশন বা ব্রাউন ব্যাগ লাঞ্চের আয়োজন করুন যেখানে দলের সদস্যরা প্রবণতা এবং কৌশল নিয়ে আলোচনা করতে পারে।</p>\r\n<p>UX ডিজাইন চ্যালেঞ্জ: UX ডিজাইন চ্যালেঞ্জ বা প্রতিযোগিতায় অংশগ্রহণ করুন। এই ইভেন্টগুলি প্রায়শই অনন্য ডিজাইনের সমস্যাগুলি উপস্থাপন করে যার জন্য উদ্ভাবনী সমাধান প্রয়োজন, আপনাকে বিভিন্ন কৌশল এবং পদ্ধতির সাথে প্রকাশ করে।</p>\r\n<p>UX মিটআপ এবং স্থানীয় গ্রুপ: সম্ভব হলে, স্থানীয় UX মিটআপ এবং নেটওয়ার্কিং ইভেন্টগুলিতে যোগ দিন। এই সমাবেশগুলি অন্যান্য ইউএক্সারদের সাথে দেখা করার, ধারণা বিনিময় করার এবং স্থানীয় ইউএক্স প্রবণতা এবং চ্যালেঞ্জগুলি সম্পর্কে জানার দুর্দান্ত সুযোগ হতে পারে।</p>\r\n<p>UX রিসার্চ এবং কেস স্টাডিজ: ইউএক্স রিসার্চ পেপার, কেস স্টাডি এবং বিখ্যাত UX সংস্থা এবং গবেষকদের রিপোর্ট পর্যালোচনা করুন। এই নথিগুলিতে প্রায়ই সফল UX কৌশল এবং উদীয়মান প্রবণতাগুলির মূল্যবান অন্তর্দৃষ্টি থাকে।</p>\r\n<p>অনলাইন কোর্স এবং সার্টিফিকেশন: ইউএক্স ডিজাইন এবং গবেষণা সম্পর্কিত অনলাইন কোর্স এবং সার্টিফিকেশনগুলিতে নথিভুক্ত করুন। Coursera, edX, এবং ইন্টারঅ্যাকশন ডিজাইন ফাউন্ডেশনের মতো প্ল্যাটফর্মগুলি শিল্প বিশেষজ্ঞদের দ্বারা শেখানো ব্যাপক কোর্স অফার করে।</p>\r\n<p>UX ডিজাইন টুলস: UX ডিজাইন টুলের বিবর্তিত ল্যান্ডস্কেপের উপর নজর রাখুন। নতুন টুল এবং বৈশিষ্ট্যগুলি নিয়মিত প্রকাশ করা হয়, যা আপনার কর্মপ্রবাহ এবং উত্পাদনশীলতা বাড়াতে পারে।</p>\r\n<p>UX ডিজাইন চ্যালেঞ্জ: UX ডিজাইন চ্যালেঞ্জ বা প্রতিযোগিতায় অংশগ্রহণ করুন। এই ইভেন্টগুলি প্রায়শই অনন্য ডিজাইনের সমস্যাগুলি উপস্থাপন করে যার জন্য উদ্ভাবনী সমাধান প্রয়োজন, আপনাকে বিভিন্ন কৌশল এবং পদ্ধতির সাথে প্রকাশ করে।</p>\r\n<p>UX পডকাস্ট এবং YouTube চ্যানেল: UX-কেন্দ্রিক পডকাস্ট এবং YouTube চ্যানেলে সদস্যতা নিন। এই প্ল্যাটফর্মগুলি প্রায়শই UX পেশাদারদের সাথে সাক্ষাত্কার এবং বর্তমান প্রবণতা এবং কৌশলগুলি সম্পর্কে আলোচনার আয়োজন করে।</p>\r\n<p>মনে রাখবেন যে UX এর ক্ষেত্রটি ক্রমাগত বিকশিত হচ্ছে, তাই কৌতূহলী থাকা এবং নতুন ধারণা এবং পদ্ধতির জন্য উন্মুক্ত থাকা অপরিহার্য। UX সম্প্রদায়ের সাথে সক্রিয়ভাবে জড়িত থাকার মাধ্যমে এবং অন্যদের কাছ থেকে শেখার মাধ্যমে, আপনি আপনার দক্ষতা আপ টু ডেট রাখতে পারেন এবং শিল্পের অগ্রভাগে থাকতে পারেন।</p>', 'Trends, Technique, UXers, Agency, Creative, Data, Technology, ', 'আপনি কিভাবে অন্যান্য UXers গ্রুপ থেকে প্রবণতা এবং কৌশল খুঁজে পেতে পারেন', 'আপনি কিভাবে অন্যান্য UXers গ্রুপ থেকে প্রবণতা এবং কৌশল খুঁজে পেতে পারেন', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_gallery` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `icon`, `product_gallery`, `status`, `created_at`, `updated_at`) VALUES
(1, 'audio', 'uploads/custom-images/category-2023-09-20-11-58-55-1889.png', 1, 1, '2023-09-20 05:58:55', '2023-09-20 05:58:55'),
(2, 'video', 'uploads/custom-images/category-2023-09-20-11-59-21-1811.png', 1, 1, '2023-09-20 05:59:21', '2023-09-20 05:59:21'),
(3, 'shopify', 'uploads/custom-images/category-2023-09-20-11-59-44-6040.png', 1, 1, '2023-09-20 05:59:44', '2023-09-20 05:59:44'),
(4, 'woocommerce', 'uploads/custom-images/category-2023-09-20-12-00-13-2013.png', 0, 1, '2023-09-20 06:00:13', '2023-09-20 06:00:13'),
(5, 'joomla', 'uploads/custom-images/category-2023-10-01-04-24-23-4499.png', 1, 1, '2023-09-20 06:00:31', '2023-10-01 10:24:23'),
(6, 'image', 'uploads/custom-images/category-2023-10-09-01-09-27-6009.png', 0, 1, '2023-09-20 06:00:47', '2023-10-09 07:09:27'),
(7, 'javascript', 'uploads/custom-images/category-2023-10-09-11-53-23-9903.png', 0, 1, '2023-10-09 05:53:23', '2023-10-09 05:53:23'),
(8, 'react-native', 'uploads/custom-images/category-2023-10-09-01-09-08-1612.png', 0, 1, '2023-10-09 07:09:08', '2023-10-09 07:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `category_languages`
--

CREATE TABLE `category_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_languages`
--

INSERT INTO `category_languages` (`id`, `category_id`, `lang_code`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Audio', '2023-09-20 05:58:55', '2023-09-20 05:58:55'),
(2, 2, 'en', 'Video', '2023-09-20 05:59:21', '2023-09-20 05:59:21'),
(3, 3, 'en', 'Shopify', '2023-09-20 05:59:44', '2023-09-20 05:59:44'),
(4, 4, 'en', 'WooCommerce', '2023-09-20 06:00:13', '2023-09-20 06:00:13'),
(5, 5, 'en', 'Joomla', '2023-09-20 06:00:31', '2023-09-20 06:00:31'),
(6, 6, 'en', 'Image', '2023-09-20 06:00:47', '2023-09-20 06:00:47'),
(7, 1, 'bn', 'অডিও', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(8, 2, 'bn', 'ভিডিও', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(9, 3, 'bn', 'শপিফাই', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(10, 4, 'bn', 'উকমার্স', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(11, 5, 'bn', 'জুমলা', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(12, 6, 'bn', 'ইমেজ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(13, 7, 'en', 'Javascript', '2023-10-09 05:53:23', '2023-10-09 05:53:23'),
(14, 7, 'bn', 'জাভাস্ক্রিপ্ট', '2023-10-09 05:53:23', '2023-10-09 05:54:03'),
(15, 8, 'en', 'React Native', '2023-10-09 07:09:08', '2023-10-09 07:09:08'),
(16, 8, 'bn', 'React Native', '2023-10-09 07:09:08', '2023-10-09 07:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_state_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_state_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Florida City', 'florida-city', 1, '2022-01-30 09:29:19', '2022-02-06 04:18:33'),
(2, 1, 'Los Angeles', 'los-angeles', 1, '2022-01-30 09:29:29', '2022-02-06 04:20:30'),
(4, 2, 'Tallahassee', 'tallahassee', 1, '2022-02-06 04:18:49', '2022-02-06 04:18:49'),
(5, 2, 'Weston', 'weston', 1, '2022-02-06 04:19:56', '2022-02-06 04:19:56'),
(6, 1, 'San Jose', 'san-jose', 1, '2022-02-06 04:21:08', '2022-02-06 04:21:08'),
(7, 1, 'San Diego', 'san-diego', 1, '2022-02-06 04:21:26', '2022-02-06 04:21:26'),
(8, 4, 'Gandhinagar', 'gandhinagar', 1, '2022-02-06 04:22:21', '2022-02-06 04:22:21'),
(9, 5, 'Chandigarh', 'chandigarh', 1, '2022-02-06 04:22:44', '2022-02-06 04:22:44'),
(10, 7, 'London', 'london', 1, '2022-02-06 04:23:12', '2022-02-06 04:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `complete_requests`
--

CREATE TABLE `complete_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `resone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complete_requests`
--

INSERT INTO `complete_requests` (`id`, `provider_id`, `order_id`, `resone`, `created_at`, `updated_at`) VALUES
(1, 2, 6, 'this is test resone', '2022-11-10 05:38:11', '2022-11-10 05:38:11'),
(2, 2, 9, 'this is test resone', '2022-11-10 05:44:49', '2022-11-10 05:44:49'),
(3, 2, 10, 'Please complete the booking.', '2022-12-21 03:48:10', '2022-12-21 03:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_pages`
--

CREATE TABLE `contact_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supporter_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `off_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_pages`
--

INSERT INTO `contact_pages` (`id`, `supporter_image`, `title1`, `title2`, `icon`, `time`, `off_day`, `image`, `description`, `email`, `address`, `phone`, `map`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/supporter--2022-08-28-02-04-43-1575.jpg', 'Feel Free to Get in Touch', 'Support Time', 'far fa-headset', '09.00am to 10.00pm', 'Friday Off', 'uploads/website-images/contact_us-2023-08-24-01-21-01-6182.jpg', 'Fill the form below or write us .We will try our to help you as soon as possible.', 'abdur.rohman2003@gmail.com\r\nabdur.rohman2003@gmail.com', '7232 Broadway Suite 308, Jackson Heights, 11372, NY, United States', '+1347-430-9510\r\n+4247-100-9510', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.681138843672!2d-73.89482218459395!3d40.747041279328165!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25f01328248b3%3A0x62300784dd275f96!2s7232%20Broadway%20%23%20308%2C%20Flushing%2C%20NY%2011372%2C%20USA!5e0!3m2!1sen!2sbd!4v1652467683397!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2022-01-30 12:31:58', '2023-10-01 09:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_page_languages`
--

CREATE TABLE `contact_page_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `off_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_page_languages`
--

INSERT INTO `contact_page_languages` (`id`, `contact_id`, `lang_code`, `title1`, `title2`, `time`, `off_day`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Feel Free to Get in Touch', 'Support Time', '09.00am to 10.00pm', 'Friday Off', 'Jackson Heights, 11372, NY, United States', '+4847-150-3587\r\n+4847-150-3587', NULL, '2023-10-01 09:41:55'),
(29, 1, 'bn', 'নির্দ্বিধায় যোগাযোগ করুন', 'সাপোর্ট টাইম', '০৯.০০ এম থেকে ১০.০০ পিএম', 'শুক্রবার বন্ধ', 'জ্যাকসন হাইটস, ১১৩৭২, এন ওয়াই, মার্কিন যুক্তরাষ্ট্র', '+৪৮৪৭-১৫০-৩৫৮৭\r\n+৪৮৪৭-১৫০-৩৫৮৭', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `cookie_consents`
--

CREATE TABLE `cookie_consents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `border` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corners` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `border_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_bg_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookie_consents`
--

INSERT INTO `cookie_consents` (`id`, `status`, `border`, `corners`, `background_color`, `text_color`, `border_color`, `btn_bg_color`, `btn_text_color`, `message`, `link_text`, `btn_text`, `link`, `created_at`, `updated_at`) VALUES
(1, 1, 'thin', 'normal', '#184dec', '#fafafa', '#0a58d6', '#fffceb', '#222758', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the when an unknown printer took.', 'More Info', 'Yes', NULL, NULL, '2022-02-13 08:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'United State', 'united-state', 1, '2022-01-30 09:28:28', '2022-02-06 04:11:42'),
(2, 'India', 'india', 1, '2022-01-30 09:28:39', '2022-08-30 06:18:46'),
(4, 'United Kindom', 'united-kindom', 1, '2022-02-06 04:11:51', '2022-02-06 04:11:51'),
(5, 'Australia', 'australia', 1, '2022-02-06 04:12:36', '2022-02-06 04:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'California', 'california', 1, '2022-01-30 09:29:00', '2022-02-06 04:14:28'),
(2, 1, 'Florida', 'florida', 1, '2022-01-30 09:29:07', '2022-02-06 04:14:42'),
(3, 1, 'Alaska', 'alaska', 1, '2022-02-05 07:49:14', '2022-02-06 04:15:09'),
(4, 2, 'Gujarat', 'gujarat', 1, '2022-02-06 04:16:27', '2022-02-06 04:16:27'),
(5, 2, 'Punjab', 'punjab', 1, '2022-02-06 04:16:39', '2022-02-06 04:16:39'),
(6, 2, 'Rajasthan', 'rajasthan', 1, '2022-02-06 04:16:48', '2022-02-06 04:16:48'),
(7, 4, 'England', 'england', 1, '2022-02-06 04:17:35', '2022-02-06 04:17:35'),
(8, 4, 'Scotland', 'scotland', 1, '2022-02-06 04:17:44', '2022-02-06 04:17:44'),
(9, 4, 'Wales', 'wales', 1, '2022-02-06 04:17:53', '2022-02-06 04:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_validity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AFA', 'Afghan Afghani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ALL', 'Albanian Lek', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DZD', 'Algerian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AOA', 'Angolan Kwanza', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'ARS', 'Argentine Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'AMD', 'Armenian Dram', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'AWG', 'Aruban Florin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'AUD', 'Australian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'AZN', 'Azerbaijani Manat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'BSD', 'Bahamian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'BHD', 'Bahraini Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'BDT', 'Bangladeshi Taka', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'BBD', 'Barbadian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'BYR', 'Belarusian Ruble', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'BEF', 'Belgian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'BZD', 'Belize Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'BMD', 'Bermudan Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'BTN', 'Bhutanese Ngultrum', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'BTC', 'Bitcoin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'BOB', 'Bolivian Boliviano', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'BAM', 'Bosnia-Herzegovina Convertible Mark', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'BWP', 'Botswanan Pula', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'BRL', 'Brazilian Real', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'GBP', 'British Pound Sterling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'BND', 'Brunei Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'BGN', 'Bulgarian Lev', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'BIF', 'Burundian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'KHR', 'Cambodian Riel', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'CAD', 'Canadian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'CVE', 'Cape Verdean Escudo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'KYD', 'Cayman Islands Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'XOF', 'CFA Franc BCEAO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'XAF', 'CFA Franc BEAC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'XPF', 'CFP Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'CLP', 'Chilean Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'CNY', 'Chinese Yuan', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'COP', 'Colombian Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'KMF', 'Comorian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'CDF', 'Congolese Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'CRC', 'Costa Rican ColÃ³n', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'HRK', 'Croatian Kuna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'CUC', 'Cuban Convertible Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'CZK', 'Czech Republic Koruna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'DKK', 'Danish Krone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'DJF', 'Djiboutian Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'DOP', 'Dominican Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'XCD', 'East Caribbean Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'EGP', 'Egyptian Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ERN', 'Eritrean Nakfa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'EEK', 'Estonian Kroon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'ETB', 'Ethiopian Birr', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'EUR', 'Euro', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'FKP', 'Falkland Islands Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'FJD', 'Fijian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'GMD', 'Gambian Dalasi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'GEL', 'Georgian Lari', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'DEM', 'German Mark', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'GHS', 'Ghanaian Cedi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'GIP', 'Gibraltar Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'GRD', 'Greek Drachma', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'GTQ', 'Guatemalan Quetzal', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'GNF', 'Guinean Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'GYD', 'Guyanaese Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'HTG', 'Haitian Gourde', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'HNL', 'Honduran Lempira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'HKD', 'Hong Kong Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'HUF', 'Hungarian Forint', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ISK', 'Icelandic KrÃ³na', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'INR', 'Indian Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'IDR', 'Indonesian Rupiah', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'IRR', 'Iranian Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'IQD', 'Iraqi Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ILS', 'Israeli New Sheqel', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'ITL', 'Italian Lira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'JMD', 'Jamaican Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'JPY', 'Japanese Yen', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'JOD', 'Jordanian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'KZT', 'Kazakhstani Tenge', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'KES', 'Kenyan Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'KWD', 'Kuwaiti Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'KGS', 'Kyrgystani Som', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'LAK', 'Laotian Kip', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'LVL', 'Latvian Lats', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'LBP', 'Lebanese Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'LSL', 'Lesotho Loti', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'LRD', 'Liberian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'LYD', 'Libyan Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'LTL', 'Lithuanian Litas', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'MOP', 'Macanese Pataca', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'MKD', 'Macedonian Denar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'MGA', 'Malagasy Ariary', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'MWK', 'Malawian Kwacha', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'MYR', 'Malaysian Ringgit', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'MVR', 'Maldivian Rufiyaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'MRO', 'Mauritanian Ouguiya', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'MUR', 'Mauritian Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'MXN', 'Mexican Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'MDL', 'Moldovan Leu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'MNT', 'Mongolian Tugrik', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'MAD', 'Moroccan Dirham', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'MZM', 'Mozambican Metical', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'MMK', 'Myanmar Kyat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'NAD', 'Namibian Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'NPR', 'Nepalese Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'ANG', 'Netherlands Antillean Guilder', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'TWD', 'New Taiwan Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'NZD', 'New Zealand Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'NIO', 'Nicaraguan CÃ³rdoba', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'NGN', 'Nigerian Naira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'KPW', 'North Korean Won', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'NOK', 'Norwegian Krone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'OMR', 'Omani Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'PKR', 'Pakistani Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'PAB', 'Panamanian Balboa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'PGK', 'Papua New Guinean Kina', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'PYG', 'Paraguayan Guarani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'PEN', 'Peruvian Nuevo Sol', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'PHP', 'Philippine Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'PLN', 'Polish Zloty', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'QAR', 'Qatari Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'RON', 'Romanian Leu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'RUB', 'Russian Ruble', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'RWF', 'Rwandan Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'SVC', 'Salvadoran ColÃ³n', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'WST', 'Samoan Tala', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'SAR', 'Saudi Riyal', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'RSD', 'Serbian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'SCR', 'Seychellois Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'SLL', 'Sierra Leonean Leone', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'SGD', 'Singapore Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'SKK', 'Slovak Koruna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'SBD', 'Solomon Islands Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'SOS', 'Somali Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'ZAR', 'South African Rand', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'KRW', 'South Korean Won', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'XDR', 'Special Drawing Rights', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'LKR', 'Sri Lankan Rupee', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'SHP', 'St. Helena Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'SDG', 'Sudanese Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'SRD', 'Surinamese Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'SZL', 'Swazi Lilangeni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'SEK', 'Swedish Krona', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'CHF', 'Swiss Franc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'SYP', 'Syrian Pound', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'STD', 'São Tomé and Príncipe Dobra', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'TJS', 'Tajikistani Somoni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'TZS', 'Tanzanian Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'THB', 'Thai Baht', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'TOP', 'Tongan pa\'anga', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'TTD', 'Trinidad & Tobago Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'TND', 'Tunisian Dinar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'TRY', 'Turkish Lira', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'TMT', 'Turkmenistani Manat', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'UGX', 'Ugandan Shilling', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'UAH', 'Ukrainian Hryvnia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'AED', 'United Arab Emirates Dirham', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'UYU', 'Uruguayan Peso', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'USD', 'US Dollar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'UZS', 'Uzbekistan Som', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'VUV', 'Vanuatu Vatu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'VEF', 'Venezuelan BolÃ­var', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'VND', 'Vietnamese Dong', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'YER', 'Yemeni Rial', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'ZMK', 'Zambian Kwacha', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `currency_countries`
--

CREATE TABLE `currency_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `code` varchar(2) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `currency_countries`
--

INSERT INTO `currency_countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Andorra', 'AD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Afghanistan', 'AF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Åland Islands', 'AX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Albania', 'AL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Algeria', 'DZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'American Samoa', 'AS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Angola', 'AO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Anguilla', 'AI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Antarctica', 'AQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Antigua and Barbuda', 'AG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Argentina', 'AR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Armenia', 'AM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Aruba', 'AW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Australia', 'AU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Austria', 'AT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Azerbaijan', 'AZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Bahamas', 'BS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Bahrain', 'BH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Bangladesh', 'BD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Barbados', 'BB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Belarus', 'BY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Belgium', 'BE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Belize', 'BZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Benin', 'BJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Bermuda', 'BM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Bhutan', 'BT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Bolivia (Plurinational State of)', 'BO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Bosnia and Herzegovina', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Botswana', 'BW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Bouvet Island', 'BV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Brazil', 'BR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'British Indian Ocean Territory', 'IO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Brunei Darussalam', 'BN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Bulgaria', 'BG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Burkina Faso', 'BF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Burundi', 'BI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Cabo Verde', 'CV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Cambodia', 'KH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Cameroon', 'CM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Canada', 'CA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Cayman Islands', 'KY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Central African Republic', 'CF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Chad', 'TD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Chile', 'CL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'China', 'CN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Christmas Island', 'CX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Cocos (Keeling) Islands', 'CC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Colombia', 'CO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Comoros', 'KM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Congo', 'CG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Congo (Democratic Republic of the)', 'CD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Cook Islands', 'CK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Costa Rica', 'CR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Côte d\'Ivoire', 'CI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Croatia', 'HR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Cuba', 'CU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Curaçao', 'CW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Cyprus', 'CY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Czech Republic', 'CZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Denmark', 'DK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Djibouti', 'DJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Dominica', 'DM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Dominican Republic', 'DO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Ecuador', 'EC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Egypt', 'EG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'El Salvador', 'SV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Equatorial Guinea', 'GQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Eritrea', 'ER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Estonia', 'EE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Ethiopia', 'ET', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Falkland Islands (Malvinas)', 'FK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Faroe Islands', 'FO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Fiji', 'FJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Finland', 'FI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'France', 'FR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'French Guiana', 'GF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'French Polynesia', 'PF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'French Southern Territories', 'TF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Gabon', 'GA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Gambia', 'GM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Georgia', 'GE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Germany', 'DE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Ghana', 'GH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Gibraltar', 'GI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Greece', 'GR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Greenland', 'GL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Grenada', 'GD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Guadeloupe', 'GP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Guam', 'GU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Guatemala', 'GT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Guernsey', 'GG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Guinea', 'GN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Guinea-Bissau', 'GW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Guyana', 'GY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Haiti', 'HT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Heard Island and McDonald Islands', 'HM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Holy See', 'VA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Honduras', 'HN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Hong Kong', 'HK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Hungary', 'HU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Iceland', 'IS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'India', 'IN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Indonesia', 'ID', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Iran (Islamic Republic of)', 'IR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Iraq', 'IQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Ireland', 'IE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Isle of Man', 'IM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Israel', 'IL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Italy', 'IT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Jamaica', 'JM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Japan', 'JP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Jersey', 'JE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Jordan', 'JO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Kazakhstan', 'KZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Kenya', 'KE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Kiribati', 'KI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Korea (Democratic People\'s Republic of)', 'KP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Korea (Republic of)', 'KR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Kuwait', 'KW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Kyrgyzstan', 'KG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Lao People\'s Democratic Republic', 'LA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Latvia', 'LV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Lebanon', 'LB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Lesotho', 'LS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Liberia', 'LR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Libya', 'LY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Liechtenstein', 'LI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Lithuania', 'LT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Luxembourg', 'LU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Macao', 'MO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Macedonia (the former Yugoslav Republic of)', 'MK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Madagascar', 'MG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Malawi', 'MW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Malaysia', 'MY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Maldives', 'MV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Mali', 'ML', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Malta', 'MT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Marshall Islands', 'MH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Martinique', 'MQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Mauritania', 'MR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Mauritius', 'MU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Mayotte', 'YT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Mexico', 'MX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Micronesia (Federated States of)', 'FM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Moldova (Republic of)', 'MD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Monaco', 'MC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Mongolia', 'MN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Montenegro', 'ME', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Montserrat', 'MS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Morocco', 'MA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Mozambique', 'MZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Myanmar', 'MM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Namibia', 'NA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Nauru', 'NR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Nepal', 'NP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Netherlands', 'NL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'New Caledonia', 'NC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'New Zealand', 'NZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Nicaragua', 'NI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Niger', 'NE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Nigeria', 'NG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Niue', 'NU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Norfolk Island', 'NF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Northern Mariana Islands', 'MP', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Norway', 'NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Oman', 'OM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Pakistan', 'PK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Palau', 'PW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Palestine, State of', 'PS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Panama', 'PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Papua New Guinea', 'PG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Paraguay', 'PY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Peru', 'PE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Philippines', 'PH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Pitcairn', 'PN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Poland', 'PL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Portugal', 'PT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Puerto Rico', 'PR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Qatar', 'QA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Réunion', 'RE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Romania', 'RO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Russian Federation', 'RU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Rwanda', 'RW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Saint Barthélemy', 'BL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Saint Kitts and Nevis', 'KN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Saint Lucia', 'LC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Saint Martin (French part)', 'MF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Saint Pierre and Miquelon', 'PM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Saint Vincent and the Grenadines', 'VC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Samoa', 'WS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'San Marino', 'SM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Sao Tome and Principe', 'ST', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Saudi Arabia', 'SA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Senegal', 'SN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Serbia', 'RS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Seychelles', 'SC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Sierra Leone', 'SL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Singapore', 'SG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Sint Maarten (Dutch part)', 'SX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Slovakia', 'SK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Slovenia', 'SI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Solomon Islands', 'SB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Somalia', 'SO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'South Africa', 'ZA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'South Georgia and the South Sandwich Islands', 'GS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'South Sudan', 'SS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Spain', 'ES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Sri Lanka', 'LK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Sudan', 'SD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Suriname', 'SR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Svalbard and Jan Mayen', 'SJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Swaziland', 'SZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Sweden', 'SE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Switzerland', 'CH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Syrian Arab Republic', 'SY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Taiwan, Province of China', 'TW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Tajikistan', 'TJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Tanzania, United Republic of', 'TZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Thailand', 'TH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Timor-Leste', 'TL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Togo', 'TG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Tokelau', 'TK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Tonga', 'TO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Trinidad and Tobago', 'TT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Tunisia', 'TN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Turkey', 'TR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Turkmenistan', 'TM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Turks and Caicos Islands', 'TC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Tuvalu', 'TV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Uganda', 'UG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Ukraine', 'UA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'United Arab Emirates', 'AE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'United Kingdom of Great Britain and Northern Ireland', 'GB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'United States Minor Outlying Islands', 'UM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'United States of America', 'US', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Uruguay', 'UY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Uzbekistan', 'UZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Vanuatu', 'VU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Venezuela (Bolivarian Republic of)', 'VE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Viet Nam', 'VN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Virgin Islands (British)', 'VG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Virgin Islands (U.S.)', 'VI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Wallis and Futuna', 'WF', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Western Sahara', 'EH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Yemen', 'YE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Zambia', 'ZM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Zimbabwe', 'ZW', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'custom-page-one', 1, '2023-09-23 06:50:22', '2023-09-23 06:50:22'),
(2, 'custom-page-two', 1, '2023-09-23 06:50:39', '2023-09-23 06:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `custom_page_languages`
--

CREATE TABLE `custom_page_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_page_languages`
--

INSERT INTO `custom_page_languages` (`id`, `custom_id`, `lang_code`, `page_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Custom page one', '<p><strong>1. What Are Privacy Policy?</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriefss asbut also the on leap into a electironc typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andeiss more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p><strong>2. Ecommerce Terms and Conditions Examples</strong></p>\r\n<p>While it&rsquo;s not legally required for ecommerce websites to have a terms and conditions agreement, adding one will help protect your as sonline business.As terms and conditions are legally enforceable rules, they allow you to set standards for how users interact with your site. Here are some of the major abenefits of including terms and conditions on your ecommerce site:</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the obb1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop.</p>\r\n<p><strong>Features :</strong></p>\r\n<ul>\r\n<li>Slim body with metal cover</li>\r\n<li>Latest Intel Core i5-1135G7 processor (4 cores / 8 threads)</li>\r\n<li>8GB DDR4 RAM and fast 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture support</li>\r\n</ul>\r\n<p><strong>3. Protect Your Property</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriezcs but also the on leap into as eylectronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraszvxet sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book. five centuries but also a the on leap into electronic typesetting, remaining essentially unchanged. It aswasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop our aspublishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p><strong>4. What to Include in Terms and Conditions for Online Stores</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also the on leap into as electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of as Leitraset sheets containing Loriem Ipsum passages, our andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Loriem Ipsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets as containing Lorem Ipsum passages, andei more recently with a desktop publishing software like Aldus PageMaker including versions of Loremas&nbsp; Ipsum to make a type specimen book.</p>\r\n<p><strong>05.Pricing and Payment Terms</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also as the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release as of Letraset sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Lorem aIpsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheetsasd containing Lorem Ipsum passages, andei more recentlysl with desktop publishing software like Aldus PageMaker including versions of Loremadfsfds Ipsum to make a type specimen book.</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the our 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing asou software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>', '2023-09-23 06:50:22', '2023-09-23 06:50:22'),
(2, 2, 'en', 'Custom page two', '<p><strong>1. What Are Privacy Policy?</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriefss asbut also the on leap into a electironc typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andeiss more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p><strong>2. Ecommerce Terms and Conditions Examples</strong></p>\r\n<p>While it&rsquo;s not legally required for ecommerce websites to have a terms and conditions agreement, adding one will help protect your as sonline business.As terms and conditions are legally enforceable rules, they allow you to set standards for how users interact with your site. Here are some of the major abenefits of including terms and conditions on your ecommerce site:</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the obb1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop.</p>\r\n<p><strong>Features :</strong></p>\r\n<ul>\r\n<li>Slim body with metal cover</li>\r\n<li>Latest Intel Core i5-1135G7 processor (4 cores / 8 threads)</li>\r\n<li>8GB DDR4 RAM and fast 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture support</li>\r\n</ul>\r\n<p><strong>3. Protect Your Property</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriezcs but also the on leap into as eylectronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraszvxet sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book. five centuries but also a the on leap into electronic typesetting, remaining essentially unchanged. It aswasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop our aspublishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p><strong>4. What to Include in Terms and Conditions for Online Stores</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also the on leap into as electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of as Leitraset sheets containing Loriem Ipsum passages, our andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Loriem Ipsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets as containing Lorem Ipsum passages, andei more recently with a desktop publishing software like Aldus PageMaker including versions of Loremas&nbsp; Ipsum to make a type specimen book.</p>\r\n<p><strong>05.Pricing and Payment Terms</strong></p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also as the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release as of Letraset sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Lorem aIpsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheetsasd containing Lorem Ipsum passages, andei more recentlysl with desktop publishing software like Aldus PageMaker including versions of Loremadfsfds Ipsum to make a type specimen book.</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the our 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing asou software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>', '2023-09-23 06:50:39', '2023-09-23 06:50:39'),
(3, 1, 'bn', 'কাস্টম পৃষ্ঠা এক', '<p><strong>১। গোপনীয়তা নীতি কি?</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীই টিকে আছে নয় বরং একটি বৈদ্যুতিক টাইপসেটিংয়ে লাফিয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার দিয়ে এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>২। ইকমার্সের নিয়ম ও শর্তাবলীর উদাহরণ</strong></p>\r\n<p>যদিও ইকমার্স ওয়েবসাইটগুলির জন্য একটি শর্ত ও শর্তের চুক্তি থাকা আইনত প্রয়োজন হয় না, তবে একটি যোগ করা আপনার সোনলাইন ব্যবসা হিসাবে রক্ষা করতে সহায়তা করবে৷ যেহেতু শর্তাবলী আইনত প্রয়োগযোগ্য নিয়ম, সেগুলি আপনাকে ব্যবহারকারীরা কীভাবে আপনার সাইটের সাথে ইন্টারঅ্যাক্ট করবে তার জন্য মান নির্ধারণ করতে দেয়৷ এখানে আপনার ইকমার্স সাইটের শর্তাবলী সহ কিছু প্রধান সুবিধা রয়েছে।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে obb1960-এর দশকে জনপ্রিয় হয়নি, এবং সম্প্রতি ডেস্কটপের সাথে।</p>\r\n<p><strong>বৈশিষ্ট্য :</strong></p>\r\n<ul>\r\n<li>ধাতব আবরণ সহ সিলিম বডি</li>\r\n<li>সর্বশেষ ইন্টেল কোর i5-1135G7 প্রসেসর (4 কোর / 8 থ্রেড)</li>\r\n<li>8GB DDR4 RAM এবং দ্রুত 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 গ্রাফিক্স কার্ড ব্যাকলিট কীবোর্ড, অঙ্গভঙ্গি সমর্থন সহ টাচপ্যাড</li>\r\n</ul>\r\n<p><strong>৩। আপনার সম্পত্তি রক্ষা করুন</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি শুধুমাত্র পাঁচ সেঞ্চুরিইজসিস নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করতে লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি। পাঁচ শতাব্দী কিন্তু ইলেকট্রনিক টাইপসেটিং-এ একটি অন লিপ, অপরিহার্যভাবে অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি আমাদের ডেস্কটপে Aldus PageMaker-এর মতো প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণ সহ একটি টাইপ নমুনা বই তৈরি করা হয়েছে।</p>\r\n<p><strong>৪। অনলাইন স্টোরের শর্তাবলীতে কী অন্তর্ভুক্ত করতে হবে</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবল পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরিয়েম ইপসাম প্যাসেজ সম্বলিত লেইট্রাসেট শীট হিসাবে প্রকাশের সাথে জনপ্রিয় হয়নি, আমাদের সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণগুলিকে একটি টাইপ নমুনা বই তৈরি করার জন্য। 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো একটি ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>০৫। মূল্য এবং অর্থপ্রদান শর্তাবলী</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং-এ লাফানোর মতোও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপের নমুনা বই তৈরি করার জন্য Lorem Ipsum-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ Lorem aIpsum-এর সংস্করণগুলি অন্তর্ভুক্ত করে একটি টাইপ নমুনা বই তৈরি করা হয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীটসাড প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি আমাদের 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি ধরনের নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(4, 2, 'bn', 'কাস্টম পৃষ্ঠা দুই', '<p><strong>১। গোপনীয়তা নীতি কি?</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীই টিকে আছে নয় বরং একটি বৈদ্যুতিক টাইপসেটিংয়ে লাফিয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার দিয়ে এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>২। ইকমার্সের নিয়ম ও শর্তাবলীর উদাহরণ</strong></p>\r\n<p>যদিও ইকমার্স ওয়েবসাইটগুলির জন্য একটি শর্ত ও শর্তের চুক্তি থাকা আইনত প্রয়োজন হয় না, তবে একটি যোগ করা আপনার সোনলাইন ব্যবসা হিসাবে রক্ষা করতে সহায়তা করবে৷ যেহেতু শর্তাবলী আইনত প্রয়োগযোগ্য নিয়ম, সেগুলি আপনাকে ব্যবহারকারীরা কীভাবে আপনার সাইটের সাথে ইন্টারঅ্যাক্ট করবে তার জন্য মান নির্ধারণ করতে দেয়৷ এখানে আপনার ইকমার্স সাইটের শর্তাবলী সহ কিছু প্রধান সুবিধা রয়েছে।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে obb1960-এর দশকে জনপ্রিয় হয়নি, এবং সম্প্রতি ডেস্কটপের সাথে।</p>\r\n<p><strong>বৈশিষ্ট্য :</strong></p>\r\n<ul>\r\n<li>ধাতব আবরণ সহ সিলিম বডি</li>\r\n<li>সর্বশেষ ইন্টেল কোর i5-1135G7 প্রসেসর (4 কোর / 8 থ্রেড)</li>\r\n<li>8GB DDR4 RAM এবং দ্রুত 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 গ্রাফিক্স কার্ড ব্যাকলিট কীবোর্ড, অঙ্গভঙ্গি সমর্থন সহ টাচপ্যাড</li>\r\n</ul>\r\n<p><strong>৩। আপনার সম্পত্তি রক্ষা করুন</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি শুধুমাত্র পাঁচ সেঞ্চুরিইজসিস নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করতে লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি। পাঁচ শতাব্দী কিন্তু ইলেকট্রনিক টাইপসেটিং-এ একটি অন লিপ, অপরিহার্যভাবে অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি আমাদের ডেস্কটপে Aldus PageMaker-এর মতো প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণ সহ একটি টাইপ নমুনা বই তৈরি করা হয়েছে।</p>\r\n<p><strong>৪। অনলাইন স্টোরের শর্তাবলীতে কী অন্তর্ভুক্ত করতে হবে</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবল পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরিয়েম ইপসাম প্যাসেজ সম্বলিত লেইট্রাসেট শীট হিসাবে প্রকাশের সাথে জনপ্রিয় হয়নি, আমাদের সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণগুলিকে একটি টাইপ নমুনা বই তৈরি করার জন্য। 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো একটি ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>০৫। মূল্য এবং অর্থপ্রদান শর্তাবলী</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং-এ লাফানোর মতোও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপের নমুনা বই তৈরি করার জন্য Lorem Ipsum-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ Lorem aIpsum-এর সংস্করণগুলি অন্তর্ভুক্ত করে একটি টাইপ নমুনা বই তৈরি করা হয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীটসাড প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি আমাদের 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি ধরনের নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `custom_paginations`
--

CREATE TABLE `custom_paginations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_paginations`
--

INSERT INTO `custom_paginations` (`id`, `page_name`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'Blog Page', 8, NULL, '2023-09-23 06:38:42'),
(4, 'Blog Comment', 4, NULL, '2022-09-15 03:06:58'),
(6, 'Product Page', 6, NULL, '2023-06-12 05:12:35'),
(7, 'Product Comment', 10, '2023-06-12 09:44:44', '2023-08-05 05:23:28'),
(8, 'Product Review', 10, '2023-06-12 09:44:44', '2023-08-05 05:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `email_configurations`
--

CREATE TABLE `email_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_type` tinyint(4) DEFAULT NULL,
  `mail_host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_configurations`
--

INSERT INTO `email_configurations` (`id`, `mail_type`, `mail_host`, `mail_port`, `email`, `email_password`, `smtp_username`, `smtp_password`, `mail_encryption`, `created_at`, `updated_at`) VALUES
(1, 2, 'sandbox.smtp.mailtrap.io', '587', 'riponchandra667@gmail.com', 'mary+pass@', '0a637ee7f5df06', 'f145f6825f44f1', 'tls', NULL, '2023-04-05 04:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Password Reset', 'Password Reset', '<h4>Dear <b>{{name}}</b>,</h4>\r\n    <p>Do you want to reset your password? Please Click the following link and Reset Your Password.</p>', NULL, '2021-12-09 10:06:57'),
(2, 'Contact Email', 'Contact Email', '<p>Name: <b>{{name}}</b></p><p>\r\n\r\nEmail: <b>{{email}}</b></p><p>\r\n\r\nPhone: <b>{{phone}}</b></p><p><span style=\"background-color: transparent;\">Subject: <b>{{subject}}</b></span></p><p>\r\n\r\nMessage: <b>{{message}}</b></p>', NULL, '2021-12-10 23:44:34'),
(3, 'Subscribe Notification', 'Subscribe Notification', '<h2><b>Hi there</b>,</h2><p>\r\nCongratulations! Your Subscription has been created successfully. Please Click the following link and Verified Your Subscription. If you won\'t approve this link, after 24hourse your subscription will be denay</p>', NULL, '2021-12-10 23:44:53'),
(4, 'User Verification', 'User Verification', '<p>Dear <b>{{user_name}}</b>,\n</p><p>Congratulations! Your Account has been created successfully. Please Click the following link and Active your Account.</p>', NULL, '2021-12-10 23:45:25'),
(5, 'Seller Withdraw', 'Seller Withdraw Approval', '<p>Hi <strong>{{seller_name}}</strong>,</p>\r\n<p>Your withdraw Request Approval successfully. Please check your account.</p>\r\n<p>Withdraw method : <strong>{{withdraw_method}}</strong>,</p>\r\n<p>Total Amount :<strong> {{total_amount}}</strong>,</p>\r\n<p>Withdraw charge : <strong>{{withdraw_charge}}</strong>,</p>\r\n<p>Withdraw&nbsp; Amount : <strong>{{withdraw_amount}}</strong>,</p>\r\n<p>Approval Date :<strong> {{approval_date}}</strong></p>', NULL, '2023-06-11 03:54:26'),
(6, 'Order Successfully', 'Order Successfully', '<p>Hi {{user_name}},</p><p> \r\nThanks for your new order. Your order id has been submited .</p><p>Total Amount : {{total_amount}},</p><p>Payment Method : {{payment_method}},</p><p>Payment Status : {{payment_status}},</p><p>Order Status : {{order_status}},</p><p>Order Date: {{order_date}},</p><p>Order Detail: {{order_detail}}</p>', NULL, '2022-01-10 21:37:03'),
(8, 'New Order Mail to Client', 'New Order Mail to Client', '<p>Hi&nbsp;{{name}}, Thanks for your new order. Your order has been placed.</p>\r\n<p>Order Id : {{order_id}}</p>\r\n<p>Amount : {{amount}}</p>', NULL, '2023-06-05 11:49:52'),
(9, 'New Order Mail to Provider', 'New Order Mail to Provider', '<p>Hi&nbsp;{{name}}, A new order has been placed to you .</p>\r\n<p>Order Id : {{order_id}}</p>\r\n<p>Amount : {{amount}}</p>', NULL, '2023-06-05 11:51:00'),
(10, 'User Verification For OTP', 'User Verification', '<p>Dear <b>{{user_name}}</b>,\r\n</p><p>Congratulations! Your Account has been created successfully. Please Copy the code and verify your account</p>', NULL, '2021-12-10 23:45:25'),
(11, 'Password Reset For OTP', 'Password Reset', '<h4>Dear <b>{{name}}</b>,</h4>\n    <p>Do you want to reset your password? Please copy and past the code</p>', NULL, '2021-12-09 10:06:57'),
(12, 'Contact Author', 'Contact Author', '<h4>Dear Sir,</h4>\r\n<p>A new message for you from the user</p>\r\n<h4><strong>{{message}}</strong></h4>', '2023-06-06 04:48:36', '2023-06-06 05:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `error_pages`
--

CREATE TABLE `error_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `error_pages`
--

INSERT INTO `error_pages` (`id`, `title`, `button_text`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sorry, Page Not Found', 'Back To Home', 'uploads/website-images/error-page--2023-09-19-10-39-02-7639.png', '2033-06-19 03:48:00', '2023-09-19 04:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `error_page_languages`
--

CREATE TABLE `error_page_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `error_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `error_page_languages`
--

INSERT INTO `error_page_languages` (`id`, `error_id`, `lang_code`, `title`, `button_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Sorry, Page Not Found', 'Back To Home', NULL, '2023-08-28 09:15:59'),
(13, 1, 'bn', 'দুঃখিত, পৃষ্ঠা পাওয়া যায়নি', 'হোমে ফিরে যাও', '2023-09-09 07:23:05', '2023-09-18 11:56:20'),
(14, 1, 'ar', 'عذرا، لم يتم العثور على الصفحة', 'العودة إلى المنزل', '2023-09-09 07:23:20', '2023-09-18 11:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_comments`
--

CREATE TABLE `facebook_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_comments`
--

INSERT INTO `facebook_comments` (`id`, `app_id`, `comment_type`, `created_at`, `updated_at`) VALUES
(1, '882238482112522', 1, NULL, '2022-10-08 07:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `facebook_pixels`
--

CREATE TABLE `facebook_pixels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_pixels`
--

INSERT INTO `facebook_pixels` (`id`, `status`, `app_id`, `created_at`, `updated_at`) VALUES
(1, 1, '972911606915059', NULL, '2021-12-13 22:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-09-23 06:17:14', '2023-09-23 06:17:14'),
(2, 1, '2023-09-23 06:18:08', '2023-09-23 06:18:08'),
(3, 1, '2023-09-23 06:23:03', '2023-09-23 06:23:03'),
(4, 1, '2023-09-23 06:23:30', '2023-09-23 06:23:30'),
(5, 1, '2023-09-23 06:24:04', '2023-09-23 06:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `faq_languages`
--

CREATE TABLE `faq_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_languages`
--

INSERT INTO `faq_languages` (`id`, `faq_id`, `lang_code`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'How does information technology work?', '<p>There are many variations of passages of Lorem Ipsum available into but the majority have suffered alteration in some form, by injecte find to a humour, or randomised words</p>', '2023-09-23 06:17:14', '2023-09-23 06:17:14'),
(2, 2, 'en', 'How can I become IT manager?', '<p>There are many variations of passages of Lorem Ipsum available into but the majority have suffered alteration in some form, by injecte find to a humour, or randomised words</p>', '2023-09-23 06:18:08', '2023-09-25 05:10:28'),
(3, 3, 'en', 'What are the latest trends in IT?', '<p>There are many variations of passages of Lorem Ipsum available into but the majority have suffered alteration in some form, by injecte find to a humour, or randomised words</p>', '2023-09-23 06:23:03', '2023-09-23 06:23:03'),
(4, 4, 'en', 'How long should a business plan be?', '<p>There are many variations of passages of Lorem Ipsum available into but the majority have suffered alteration in some form, by injecte find to a humour, or randomised words</p>', '2023-09-23 06:23:30', '2023-09-23 06:23:30'),
(5, 5, 'en', 'How work the support policy?', '<p>There are many variations of passages of Lorem Ipsum available into but the majority have suffered alteration in some form, by injecte find to a humour, or randomised words</p>', '2023-09-23 06:24:04', '2023-09-23 06:24:04'),
(6, 1, 'bn', 'তথ্য প্রযুক্তি কিভাবে কাজ করে?', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায় কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তিত হয়েছে, ইনজেকশনের মাধ্যমে হাস্যরস বা এলোমেলো শব্দ খুঁজে বের করার মাধ্যমে</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(7, 2, 'bn', 'আমি কিভাবে আইটি ম্যানেজার হতে পারি?', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায় কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তিত হয়েছে, ইনজেকশনের মাধ্যমে হাস্যরস বা এলোমেলো শব্দ খুঁজে বের করার মাধ্যমে</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(8, 3, 'bn', 'আইটিতে সর্বশেষ প্রবণতা কি?', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায় কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তিত হয়েছে, ইনজেকশনের মাধ্যমে হাস্যরস বা এলোমেলো শব্দ খুঁজে বের করার মাধ্যমে</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(9, 4, 'bn', 'একটি ব্যবসায়িক পরিকল্পনা কতদিনের হওয়া উচিত?', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায় কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তিত হয়েছে, ইনজেকশনের মাধ্যমে হাস্যরস বা এলোমেলো শব্দ খুঁজে বের করার মাধ্যমে</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(10, 5, 'bn', 'সমর্থন নীতি কিভাবে কাজ করে?', '<p>লরেম ইপসাম-এর প্যাসেজের অনেক বৈচিত্র পাওয়া যায় কিন্তু অধিকাংশই কোনো না কোনো আকারে পরিবর্তিত হয়েছে, ইনজেকশনের মাধ্যমে হাস্যরস বা এলোমেলো শব্দ খুঁজে বের করার মাধ্যমে</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `flutterwaves`
--

CREATE TABLE `flutterwaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `public_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double NOT NULL DEFAULT 1,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flutterwaves`
--

INSERT INTO `flutterwaves` (`id`, `public_key`, `secret_key`, `currency_rate`, `country_code`, `currency_code`, `title`, `logo`, `status`, `created_at`, `updated_at`, `currency_id`) VALUES
(1, 'FLWPUBK_TEST-5760e3ff9888aa1ab5e5cd1ec3f99cb1-X', 'FLWSECK_TEST-81cb5da016d0a51f7329d4a8057e766d-X', 417.35, 'NG', 'NGN', 'Ecommerce', 'uploads/website-images/flutterwave-2023-05-11-05-34-35-1898.png', 1, NULL, '2023-10-18 06:14:56', 4);

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `copyright` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `copyright`, `payment_image`, `description`, `created_at`, `updated_at`) VALUES
(1, '©2023 Quomodosoft All rights reserved', 'uploads/website-images/payment-card-2023-08-27-12-11-33-9355.png', 'We don’t take ourselves too seriously seriously enough ensure we’re creating the best product and experienc our customer. I feel like help company name the same. Our best-in-class WordPres solution with additional as Corporate clients and leisure traveler', NULL, '2023-08-27 06:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `footer_languages`
--

CREATE TABLE `footer_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `footer_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_languages`
--

INSERT INTO `footer_languages` (`id`, `footer_id`, `lang_code`, `copyright`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '©2023 Quomodosoft All rights reserved', 'We don’t take ourselves too seriously seriously enough ensure we’re creating the best product and experienc our customer. I feel like help company name the same. Our best-in-class WordPres solution with additional as Corporate clients and leisure traveler', NULL, '2023-08-28 09:15:59'),
(17, 1, 'bn', '©২০২৩ Quomodosoft সর্বস্বত্ব সংরক্ষিত', 'আমরা নিজেদেরকে যথেষ্ট গুরুত্ব সহকারে গ্রহণ করি নিশ্চিত করি যে আমরা সেরা পণ্য তৈরি করছি এবং আমাদের গ্রাহকের অভিজ্ঞতা লাভ করছি।', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `footer_links`
--

CREATE TABLE `footer_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `column` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer_social_links`
--

CREATE TABLE `footer_social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_social_links`
--

INSERT INTO `footer_social_links` (`id`, `link`, `text`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'https://web.facebook.com/', 'Facebook', 'fab fa-facebook', '2023-09-25 05:22:20', '2023-09-25 05:22:20'),
(2, 'https://linkdin.com/', 'Linkdin', 'fab fa-linkedin-in', '2023-09-25 05:23:36', '2023-09-25 05:23:36'),
(3, 'https://twitter.com/', 'Twitter', 'fab fa-twitter', '2023-09-25 05:24:29', '2023-09-25 05:24:29'),
(4, 'https://pinterest.com/', 'Pinterest', 'fab fa-pinterest-p', '2023-09-25 05:25:04', '2023-09-25 05:25:04'),
(5, 'https://www.behance.net/', 'Behance', 'fab fa-behance', '2023-09-25 05:26:02', '2023-09-25 05:26:02'),
(6, 'https://www.google.com/', 'Google', 'fab fa-google-plus-g', '2023-09-25 05:27:09', '2023-09-25 05:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `google_analytics`
--

CREATE TABLE `google_analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `analytic_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_analytics`
--

INSERT INTO `google_analytics` (`id`, `analytic_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'UA-84213520-6', 1, NULL, '2021-12-10 22:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `google_recaptchas`
--

CREATE TABLE `google_recaptchas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_recaptchas`
--

INSERT INTO `google_recaptchas` (`id`, `site_key`, `secret_key`, `status`, `created_at`, `updated_at`) VALUES
(1, '6LcVO6cbAAAAAOzIEwPlU66nL1rxD4VAS38tjpBX', '6LcVO6cbAAAAALVNrpZfNRfd0Gy_9a_fJRLiMVUI', 1, NULL, '2022-09-25 11:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `homepages`
--

CREATE TABLE `homepages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `why_choose_item1_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_item2_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_item3_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home2_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item1_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item2_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item3_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item1_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item2_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item1_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item2_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_offer_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_offer_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending_offer_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending_offer_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter1_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter2_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter3_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter4_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter1_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter2_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter3_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item1_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item1_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item1_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item1_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item2_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item2_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item2_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_item2_icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_icon8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_home1_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter_home2_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_play_store_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_apple_store_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home1_foreground` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home2_foreground` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home3_foreground` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home3_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home1_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home2_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homepages`
--

INSERT INTO `homepages` (`id`, `why_choose_item1_icon`, `why_choose_item2_icon`, `why_choose_item3_icon`, `why_choose_home2_background`, `why_choose_home3_item1_icon`, `why_choose_home3_item2_icon`, `why_choose_home3_item3_icon`, `offer_home3_background`, `offer_home3_item1_image`, `offer_home3_item2_image`, `offer_link`, `offer_home3_item1_link`, `offer_home3_item2_link`, `about_offer_link`, `about_offer_background`, `trending_offer_link`, `trending_offer_image`, `counter1_value`, `counter2_value`, `counter3_value`, `counter4_value`, `counter1_description`, `counter2_description`, `counter3_description`, `counter_item1_title`, `counter_item1_description`, `counter_item1_link`, `counter_item1_icon`, `counter_item2_title`, `counter_item2_description`, `counter_item2_link`, `counter_item2_icon`, `counter_icon1`, `counter_icon2`, `counter_icon3`, `counter_icon4`, `counter_icon5`, `counter_icon6`, `counter_icon7`, `counter_icon8`, `counter_home1_background`, `counter_home2_background`, `app_play_store_link`, `app_apple_store_link`, `app_home1_foreground`, `app_home2_foreground`, `app_home3_foreground`, `app_home3_background`, `app_home1_background`, `app_home2_background`, `created_at`, `updated_at`) VALUES
(1, 'why-choose-us-2023-07-19-04-21-43-5814.png', 'why-choose-us-2023-07-19-04-21-43-3037.png', 'why-choose-us-2023-07-19-04-21-43-7385.png', 'why-choose-us-2023-07-26-04-32-19-2706.jpg', 'why-choose-us-2023-09-16-02-28-43-7917.png', 'why-choose-us-2023-09-16-02-28-43-9433.png', 'why-choose-us-2023-09-16-02-28-43-8434.png', 'uploads/website-images/offer--2023-08-22-05-53-46-1648.jpg', 'uploads/website-images/offer--2023-10-09-11-44-33-7684.png', 'uploads/website-images/offer--2023-10-09-11-44-47-2036.png', 'https://codecanyon.net/user/quomodotheme/portfolio', 'https://codecanyon.net/user/quomodotheme/portfolio', 'https://codecanyon.net/user/quomodotheme/portfolio', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/website-images/offer--2023-09-26-10-04-13-4188.jpg', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/website-images/offer--2023-07-20-05-38-11-9548.jpg', '1252', '9892', '1519', '854', 'It is a long established fact that reader late by the reada.', 'It is a long established fact that reader late by the reada.', 'It is a long established fact that reader late by the reada.', 'Speed up Business', 'Purchase one of our digital products from the biggest software directory and boot strap find to the into in a your business spending just bugs.', 'fdsds', 'uploads/website-images/counter--2023-01-22-12-20-12-8534.png', 'Sell Your Goods Here', 'Our long history of ownership has provided find to ahe best inleiment evert to make it best quliss financial reassure,It has also firm continuity.', 'Item_one_link', 'uploads/website-images/counter--2023-01-22-12-24-21-4272.png', 'uploads/website-images/counter--2023-10-09-06-35-26-9429.png', 'uploads/website-images/counter--2023-10-09-06-36-09-7125.png', 'uploads/website-images/counter--2023-10-09-06-35-51-3194.png', 'uploads/website-images/counter--2023-10-09-06-35-51-3044.png', 'uploads/website-images/counter--2023-07-24-12-48-23-4428.jpg', 'uploads/website-images/counter--2023-07-24-12-48-23-4711.jpg', 'uploads/website-images/counter--2023-07-24-12-48-23-5806.jpg', 'uploads/website-images/counter--2023-07-24-12-48-23-3718.jpg', 'uploads/website-images/counter--2023-07-26-01-52-08-8577.jpg', 'uploads/website-images/counter--2023-07-26-01-55-40-1059.jpg', 'https://play.google.com/store/apps/?pli=1', 'https://www.apple.com/app-store/', 'uploads/website-images/mobile-app-bg--2023-08-23-10-12-06-2674.png', 'uploads/website-images/mobile-app-bg--2023-07-26-05-46-02-1426.png', 'uploads/website-images/mobile-app-bg--2023-07-20-11-09-21-2474.png', 'uploads/website-images/mobile-app-bg--2023-07-20-11-09-21-7133.jpg', 'uploads/website-images/mobile-app-bg--2023-07-19-04-31-29-5954.jpg', 'uploads/website-images/mobile-app-bg--2023-07-26-05-46-01-1323.jpg', NULL, '2023-10-09 12:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_languages`
--

CREATE TABLE `homepage_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `why_choose_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_item1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_item2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_item3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item1_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item2_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_choose_home3_item3_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter4_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item1_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_home3_item2_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_offer_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_offer_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_offer_title3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending_offer_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending_offer_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_title3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home2_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_home3_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homepage_languages`
--

INSERT INTO `homepage_languages` (`id`, `home_id`, `lang_code`, `why_choose_title1`, `why_choose_title2`, `why_choose_item1_title`, `why_choose_item2_title`, `why_choose_item3_title`, `why_choose_home3_item1_title`, `why_choose_home3_item2_title`, `why_choose_home3_item3_title`, `why_choose_home3_item1_desc`, `why_choose_home3_item2_desc`, `why_choose_home3_item3_desc`, `counter1_title`, `counter2_title`, `counter3_title`, `counter4_title`, `offer_title1`, `offer_title2`, `offer_home3_item1_title`, `offer_home3_item2_title`, `offer_home3_item1_description`, `offer_home3_item2_description`, `about_offer_title1`, `about_offer_title2`, `about_offer_title3`, `trending_offer_title1`, `trending_offer_title2`, `app_title1`, `app_title2`, `app_title3`, `app_description`, `app_home2_title`, `app_home2_desc`, `app_home3_title`, `app_home3_desc`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Save time with pre-installed software.', 'Why Choose Alasmart', '15 days Money Back guarantee', '24/7 live Support & Forum Share', 'Outstanding Simplicity', '15 days Money Back', 'Expert Team Member', 'Outstanding Simplicity', 'There are many variationts of passages Lorem Ipsum available, but the majorit have If you as going to use a passage of Lorem', 'There are many variationts of passages Lorem Ipsum available, but the majorit have If you as going to use a passage of Lorem', 'There are many variationts of passages Lorem Ipsum available, but the majorit have If you as going to use a passage of Lorem', 'Total Items', 'Total Sale', 'Total Clients', 'Ratings', 'Check our software <span>Megapack worth $565 for Only $39.</span>', 'Check our software <span>Megapack worth $565 for Only $39.</span>', 'Speed up Business', 'Sell Your Goods Here', 'Purchase one of our digital products from the biggest as software directory and boot strap find to the into in a your business our spending just bugs.', 'Purchase one of our digital products from the biggest as software directory and boot strap find to the into in a your business our spending just bugs.', 'Get all products for only <span>$59! </span>', '$59!', 'Lifetime update and 6 months support.', 'Lifetime update support.', 'Get All Element For Only $59!', 'Get Our <span> Mobile App</span> It’s Make easy for your life !', 'Mobile App', 'It’s Make easy for your life !', 'Save time with preconfigured environments that alreadyinto into theon the find to find all the prerequisites installed for the news and as you make removes.', 'Get Our Mobile App It’s Make easy for your life !', 'Save time with preconfigured environments that alreadyinto into theon the find to find all the prerequisites installed for the news and as you make removes.', 'Get Our Mobile App It’s Make easy for your life !', 'Save time with preconfigured environments that alreadyinto into theon the find to find all the prerequisites installed for the news and as you make removes.', NULL, '2023-10-02 09:37:17'),
(21, 1, 'bn', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'কেন এলাসমার্ট চয়ন করবেন ?', '১৫ দিনের মানি ব্যাক গ্যারান্টি', '২৪/৭ লাইভ সমর্থন এবং ফোরাম শেয়ার', 'অসামান্য সরলতা', '১৫ দিন মানি ব্যাক', 'বিশেষজ্ঞ দলের সদস্য', 'অসামান্য সরলতা', 'লোরেম ইপসামের প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, তবে বেশিরভাগেরই আছে যদি আপনি লরেমের একটি প্যাসেজ ব্যবহার করতে যাচ্ছেন', 'লোরেম ইপসামের প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, তবে বেশিরভাগেরই আছে যদি আপনি লরেমের একটি প্যাসেজ ব্যবহার করতে যাচ্ছেন', 'লোরেম ইপসামের প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, তবে বেশিরভাগেরই আছে যদি আপনি লরেমের একটি প্যাসেজ ব্যবহার করতে যাচ্ছেন', 'মোট আইটেম', 'মোট বিক্রয়', 'মোট ক্লায়েন্ট', 'রেটিং', 'আমাদের সফ্টওয়্যার <span>মাত্র $39-এ $565 মূল্যের মেগাপ্যাক দেখুন</span>', 'আমাদের সফ্টওয়্যার <span>মাত্র $39-এ $565 মূল্যের মেগাপ্যাক দেখুন</span>', 'ব্যবসার গতি বাড়ান', 'এখানে আপনার পণ্য বিক্রি', 'সফ্টওয়্যার ডিরেক্টরি হিসাবে সবচেয়ে বড় থেকে আমাদের ডিজিটাল পণ্যগুলির মধ্যে একটি কিনুন এবং বুট স্ট্র্যাপ আপনার ব্যবসায় আমাদের ব্যয়ের বাগগুলি খুঁজে পান।', 'সফ্টওয়্যার ডিরেক্টরি হিসাবে সবচেয়ে বড় থেকে আমাদের ডিজিটাল পণ্যগুলির মধ্যে একটি কিনুন এবং বুট স্ট্র্যাপ আপনার ব্যবসায় আমাদের ব্যয়ের বাগগুলি খুঁজে পান।', 'সব পণ্য পান', '$59!', 'লাইফটাইম আপডেট এবং ৬ মাস সমর্থন।', 'আজীবন আপডেট সমর্থন।', 'মাত্র $৫৯ এর জন্য সমস্ত উপাদান পান!', 'আমাদের <span>মোবাইল অ্যাপ</span> পান এটি আপনার জীবনকে সহজ করে তুলছে!', 'Mobile App', 'It’s Make easy for your life !', 'আগে থেকে কনফিগার করা পরিবেশের সাথে সময় বাঁচান যা খবরের জন্য ইনস্টল করা সমস্ত পূর্বশর্ত খুঁজে বের করার জন্য এবং আপনি সরিয়ে দেওয়ার সাথে সাথেই।', 'আমাদের মোবাইল অ্যাপ পান এটি আপনার জীবনকে সহজ করে তুলছে!', 'আগে থেকে কনফিগার করা পরিবেশের সাথে সময় বাঁচান যা খবরের জন্য ইনস্টল করা সমস্ত পূর্বশর্ত খুঁজে বের করার জন্য এবং আপনি সরিয়ে দেওয়ার সাথে সাথেই।', 'আমাদের মোবাইল অ্যাপ পান এটি আপনার জীবনকে সহজ করে তুলছে!', 'আগে থেকে কনফিগার করা পরিবেশের সাথে সময় বাঁচান যা খবরের জন্য ইনস্টল করা সমস্ত পূর্বশর্ত খুঁজে বের করার জন্য এবং আপনি সরিয়ে দেওয়ার সাথে সাথেই।', '2023-09-23 09:52:17', '2023-10-02 09:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `instamojo_payments`
--

CREATE TABLE `instamojo_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `account_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sandbox',
  `status` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instamojo_payments`
--

INSERT INTO `instamojo_payments` (`id`, `api_key`, `auth_token`, `currency_rate`, `account_mode`, `status`, `image`, `created_at`, `updated_at`, `currency_id`) VALUES
(1, 'test_5f4a2c9a58ef216f8a1a688910f', 'test_994252ada69ce7b3d282b9941c2', '74.66', 'Sandbox', 1, 'uploads/website-images/instamojo-2023-05-11-05-36-17-4376.png', NULL, '2023-10-18 06:22:28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `status` int(11) NOT NULL DEFAULT 0,
  `lang_direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang_code`, `lang_name`, `is_default`, `status`, `lang_direction`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'Yes', 1, 'left_to_right', '2023-08-12 10:15:38', '2023-09-30 06:53:04'),
(89, 'bn', 'বাংলা', 'No', 1, 'left_to_right', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `maintainance_texts`
--

CREATE TABLE `maintainance_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintainance_texts`
--

INSERT INTO `maintainance_texts` (`id`, `status`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 'uploads/website-images/maintainance-mode-2022-08-31-09-12-11-5142.png', 'We are upgrading our site.  We will come back soon.  \r\nPlease stay with us. \r\nThank you.', NULL, '2023-01-14 06:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_read_msg` int(11) NOT NULL DEFAULT 0,
  `seller_read_msg` int(11) NOT NULL,
  `send_customer` int(11) NOT NULL DEFAULT 0,
  `send_seller` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_documents`
--

CREATE TABLE `message_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_message_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_30_035230_create_admins_table', 2),
(6, '2021_11_30_065435_create_email_configurations_table', 3),
(7, '2021_11_30_065508_create_email_templates_table', 3),
(8, '2021_12_01_035206_create_categories_table', 4),
(19, '2021_12_06_054423_create_about_us_table', 10),
(20, '2021_12_06_055028_create_custom_pages_table', 10),
(21, '2021_12_07_030532_create_terms_and_conditions_table', 11),
(22, '2021_12_07_035810_create_blog_categories_table', 12),
(23, '2021_12_07_035822_create_blogs_table', 12),
(24, '2021_12_07_040749_create_popular_posts_table', 12),
(25, '2021_12_07_061613_create_blog_comments_table', 13),
(30, '2021_12_09_095158_create_contact_messages_table', 16),
(31, '2021_12_09_095220_create_subscribers_table', 16),
(32, '2021_12_09_124226_create_settings_table', 17),
(33, '2021_12_11_022207_create_cookie_consents_table', 18),
(34, '2021_12_11_025358_create_google_recaptchas_table', 19),
(37, '2021_12_11_025618_create_google_analytics_table', 19),
(38, '2021_12_11_025712_create_custom_paginations_table', 19),
(39, '2021_12_11_083503_create_faqs_table', 20),
(40, '2021_12_11_094707_create_currencies_table', 21),
(43, '2021_12_13_101056_create_error_pages_table', 23),
(44, '2021_12_13_102725_create_maintainance_texts_table', 24),
(45, '2021_12_13_110144_create_subscribe_modals_table', 25),
(50, '2021_12_14_032937_create_social_login_information_table', 28),
(51, '2021_12_14_042928_create_facebook_pixels_table', 29),
(52, '2021_12_14_054908_create_paypal_payments_table', 30),
(53, '2021_12_14_054922_create_stripe_payments_table', 30),
(54, '2021_12_14_054939_create_razorpay_payments_table', 30),
(55, '2021_12_14_055252_create_bank_payments_table', 30),
(62, '2021_12_22_034106_create_banner_images_table', 35),
(63, '2021_12_22_044839_create_sliders_table', 36),
(67, '2021_12_23_065722_create_paystack_and_mollies_table', 40),
(68, '2021_12_23_085225_create_withdraw_methods_table', 41),
(71, '2021_12_25_172918_create_seller_withdraws_table', 42),
(81, '2021_12_26_054841_create_orders_table', 45),
(88, '2021_12_28_192057_create_contact_pages_table', 47),
(89, '2021_12_28_200846_create_breadcrumb_images_table', 48),
(90, '2021_12_30_032959_create_flutterwaves_table', 49),
(91, '2021_12_30_034716_create_footers_table', 50),
(92, '2021_12_30_035201_create_footer_links_table', 50),
(93, '2021_12_30_035247_create_footer_social_links_table', 50),
(99, '2022_01_12_080218_create_seo_settings_table', 54),
(101, '2022_01_17_122016_create_instamojo_payments_table', 56),
(102, '2022_01_29_055523_create_messages_table', 57),
(103, '2022_01_29_122621_create_pusher_credentails_table', 58),
(104, '2022_08_28_070755_create_how_it_works_table', 59),
(105, '2022_08_29_072358_create_testimonials_table', 60),
(108, '2022_08_31_093322_create_additional_services_table', 62),
(113, '2022_09_05_111413_create_refund_requests_table', 64),
(114, '2022_09_06_054021_create_complete_requests_table', 65),
(115, '2022_09_06_064506_create_provider_client_reports_table', 66),
(118, '2022_09_06_101227_create_message_documents_table', 68),
(119, '2022_09_26_070233_create_section_contents_table', 69),
(120, '2022_09_26_083106_create_section_controls_table', 70),
(121, '2022_09_29_044208_create_provider_client_reports_table', 71),
(123, '2023_01_22_032814_create_homepages_table', 73),
(125, '2023_01_22_083735_create_our_teams_table', 74),
(126, '2023_01_22_090537_create_become_authors_table', 75),
(127, '2023_01_24_085621_create_products_table', 76),
(128, '2023_01_28_101709_create_product_variants_table', 77),
(129, '2023_04_06_041600_create_popular_tags_table', 78),
(130, '2023_04_13_101940_create_coupons_table', 79),
(131, '2023_04_16_050758_create_order_items_table', 80),
(134, '2023_04_26_092807_create_product_comments_table', 81),
(135, '2023_05_08_082722_create_wishlishes_table', 82),
(137, '2023_05_08_090834_create_wishlists_table', 83),
(138, '2023_05_11_100656_create_sslcommerz_payments_table', 84),
(139, '2023_05_24_065207_create_ads_table', 85),
(140, '2023_06_06_064500_create_script_contents_table', 86),
(141, '2023_06_11_053201_create_product_type_pages_table', 87),
(142, '2023_06_11_061315_create_product_items_table', 88),
(143, '2021_12_11_025556_create_tawk_chats_table', 89),
(146, '2023_07_05_101606_create_product_discounts_table', 90),
(147, '2023_07_20_070218_create_templates_table', 91),
(151, '2023_08_12_074310_create_languages_table', 92),
(152, '2023_08_12_121250_create_blog_category_languages_table', 93),
(153, '2023_08_13_060543_create_blog_languages_table', 94),
(155, '2023_08_14_043107_create_category_languages_table', 95),
(156, '2023_08_14_074138_create_product_languages_table', 96),
(157, '2023_08_20_085324_create_section_content_languages_table', 97),
(159, '2023_08_22_045345_create_slider_languages_table', 98),
(161, '2023_08_22_062137_create_homepage_languages_table', 99),
(162, '2023_08_23_041637_create_testimonial_languages_table', 100),
(163, '2023_08_23_063027_create_template_languages_table', 101),
(164, '2023_08_23_083808_create_our_team_languages_table', 102),
(165, '2023_08_23_102009_create_setting_languages_table', 103),
(166, '2023_08_23_113925_create_about_us_languages_table', 104),
(167, '2023_08_24_040039_create_become_author_languages_table', 105),
(168, '2023_08_24_064458_create_contact_page_languages_table', 106),
(169, '2023_08_24_074131_create_terms_and_condition_languages_table', 107),
(170, '2023_08_24_085849_create_privacy_policies_table', 107),
(171, '2023_08_24_090521_create_privacy_policy_languages_table', 107),
(172, '2023_08_24_104123_create_error_page_languages_table', 108),
(173, '2023_08_26_031916_create_faq_languages_table', 109),
(174, '2023_08_26_051231_create_custom_page_languages_table', 110),
(175, '2023_08_26_072702_create_product_discount_languages_table', 111),
(177, '2023_08_26_081730_create_script_content_languages_table', 112),
(178, '2023_08_26_101941_create_product_item_languages_table', 113),
(179, '2023_08_26_113850_create_product_type_page_languages_table', 114),
(180, '2023_08_27_053238_create_footer_languages_table', 115),
(181, '2023_10_12_110032_create_multi_currencies_table', 116),
(182, '2023_10_17_111424_add_currency_id_to_paypal_payments', 116),
(183, '2023_10_17_112628_add_currency_id_to_stripe_payments', 116),
(184, '2023_10_17_113812_add_currency_id_to_razorpay_payments', 116),
(185, '2023_10_17_114304_add_currency_id_to_paystack_and_mollies', 116),
(186, '2023_10_17_114839_add_currency_id_to_flutterwaves', 116),
(187, '2023_10_17_115359_add_currency_id_to_instamojo_payments', 116),
(188, '2023_10_17_115802_add_currency_id_to_sslcommerz_payments', 116),
(189, '2023_10_18_051816_add_app_version_to_settings', 116);

-- --------------------------------------------------------

--
-- Table structure for table `multi_currencies`
--

CREATE TABLE `multi_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double NOT NULL,
  `currency_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_currencies`
--

INSERT INTO `multi_currencies` (`id`, `currency_name`, `country_code`, `currency_code`, `currency_icon`, `is_default`, `currency_rate`, `currency_position`, `status`, `created_at`, `updated_at`) VALUES
(1, '$-USD', 'USD', 'USD', '$', 'Yes', 1, 'left', 1, '2023-10-18 05:27:46', '2023-10-18 05:27:46'),
(2, '৳-BDT', 'BD', 'BDT', '৳', 'No', 110, 'left', 1, '2023-10-18 05:44:31', '2023-10-18 05:44:31'),
(3, '₹-INR', 'IN', 'INR', '₹', 'No', 100, 'left', 1, '2023-10-18 06:06:41', '2023-10-18 06:10:51'),
(4, '₦-NGN', 'NG', 'NGN', '₦', 'No', 400, 'left', 1, '2023-10-18 06:13:25', '2023-10-18 06:21:27'),
(5, '$-CAD', 'CAD', 'CAD', 'C$', 'No', 1.5, 'left', 1, '2023-10-18 06:20:00', '2023-10-18 06:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transection_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_rate` double DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_approval_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_qty` int(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `name`, `email`, `phone`, `total_amount`, `payment_method`, `payment_status`, `transection_id`, `currency_icon`, `country_code`, `currency_code`, `currency_rate`, `order_status`, `order_approval_date`, `order_date`, `order_month`, `order_year`, `cart_qty`, `created_at`, `updated_at`) VALUES
(1, 755179, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 131, 'Stripe', 'success', 'txn_3NtPzABsmz7k2BTD2CH3SXsa', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-23', '09', '2023', 2, '2023-09-23 07:10:42', '2023-09-23 07:10:42'),
(2, 209265, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 49, 'Stripe', 'success', 'txn_3NtQ4cBsmz7k2BTD2ZZQ2qEu', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-23', '09', '2023', 2, '2023-09-23 07:16:16', '2023-09-23 07:16:16'),
(3, 119325, 2, 'John doe', 'user2@gmail.com', '22-402-667', 110, 'Stripe', 'success', 'txn_3NtQOUBsmz7k2BTD3LQabJml', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-23', '09', '2023', 2, '2023-09-23 07:36:48', '2023-09-23 07:36:48'),
(4, 116811, 2, 'John doe', 'user2@gmail.com', '22-402-667', 50, 'Stripe', 'success', 'txn_3NtQQbBsmz7k2BTD1BkiNdqz', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-23', '09', '2023', 2, '2023-09-23 07:38:59', '2023-09-23 07:38:59'),
(5, 289440, 2, 'John doe', 'user2@gmail.com', '22-402-667', 179, 'Stripe', 'success', 'txn_3NtQSPBsmz7k2BTD0SAXodH1', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-23', '09', '2023', 3, '2023-09-23 07:40:52', '2023-09-23 07:40:52'),
(6, 783473, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 15, 'Stripe', 'success', 'txn_3Nvw3DBsmz7k2BTD13PXksk7', NULL, 'US', 'usd', 1, '1', NULL, '2023-09-30', '09', '2023', 1, '2023-09-30 05:49:15', '2023-09-30 05:49:15'),
(8, 651201, 2, 'John doe', 'user2@gmail.com', '22-402-667', 65, 'sslcommerz', 'pending', '652f7a9ede8ac', '$', 'BD', 'BDT', 110, '0', NULL, '0', '0', '0', 2, NULL, NULL),
(9, 745687, 2, 'John doe', 'user2@gmail.com', '22-402-667', 65, 'sslcommerz', 'pending', '652f7afecdb27', '$', 'BD', 'BDT', 110, '0', NULL, '0', '0', '0', 2, NULL, NULL),
(10, 174997, 2, 'John doe', 'user2@gmail.com', '22-402-667', 65, 'sslcommerz', 'pending', '652f7b2146150', '$', 'BD', 'BDT', 110, '0', NULL, '0', '0', '0', 2, NULL, NULL),
(11, 505035, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 80, 'sslcommerz', 'pending', '65349aabd845f', '$', 'BD', 'BDT', 110, '0', NULL, '0', '0', '0', 2, NULL, NULL),
(12, 142673, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 80, 'sslcommerz', 'success', '65349c6147e74', '$', 'BD', 'BDT', 110, '1', NULL, '0', '0', '0', 2, NULL, NULL),
(13, 366251, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 60, 'Stripe', 'success', 'txn_3O3sq2Bsmz7k2BTD2JOYd0aD', '$', 'USD', 'USD', 1, '1', NULL, '2023-10-22', '10', '2023', 1, '2023-10-22 04:00:35', '2023-10-22 04:00:35'),
(14, 152225, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 60, 'Mollie', 'success', 'tr_Dfe6LDuTCx', NULL, 'CAD', 'CAD', 1.5, '1', NULL, '2023-10-22', '10', '2023', 1, '2023-10-22 04:02:11', '2023-10-22 04:02:11'),
(15, 886636, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 20, 'Instamojo', 'success', 'MOJO3a22P05A80592904', NULL, NULL, NULL, 100, '1', NULL, '2023-10-22', '10', '2023', 1, '2023-10-22 04:03:37', '2023-10-22 04:03:37'),
(16, 873844, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 20, 'Razorpay', 'success', 'pay_Mr7CQA3yvNf1pw', NULL, 'IN', 'INR', 100, '1', NULL, '2023-10-22', '10', '2023', 1, '2023-10-22 04:08:18', '2023-10-22 04:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `author_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(100) DEFAULT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `author_id`, `user_id`, `product_type`, `price_type`, `variant_id`, `variant_name`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 22, 2, 1, 'script', 'extend price', NULL, NULL, 90, '1', '2023-09-23 07:10:42', '2023-09-23 07:10:42'),
(2, 1, 21, 2, 1, 'script', 'extend price', NULL, NULL, 41, '1', '2023-09-23 07:10:42', '2023-09-23 07:10:42'),
(3, 2, 19, 2, 1, 'audio', NULL, 29, '150 Audio Song', 25, '1', '2023-09-23 07:16:16', '2023-09-23 07:16:16'),
(4, 2, 17, 2, 1, 'audio', NULL, 25, '40 Audio Song', 24, '1', '2023-09-23 07:16:16', '2023-09-23 07:16:16'),
(5, 3, 23, 1, 2, 'script', 'extend price', NULL, NULL, 85, '1', '2023-09-23 07:36:48', '2023-09-23 07:36:48'),
(6, 3, 20, 1, 2, 'audio', NULL, 31, '45 Audio Song', 25, '1', '2023-09-23 07:36:48', '2023-09-23 07:36:48'),
(7, 4, 18, 1, 2, 'audio', NULL, 27, '60 Audio Song', 30, '1', '2023-09-23 07:38:59', '2023-09-23 07:38:59'),
(8, 4, 16, 1, 2, 'audio', NULL, 23, '30 Audio Song', 20, '1', '2023-09-23 07:38:59', '2023-09-23 07:38:59'),
(9, 5, 11, 1, 2, 'video', NULL, 13, 'Holiday Package', 60, '1', '2023-09-23 07:40:52', '2023-09-23 07:40:52'),
(10, 5, 9, 1, 2, 'image', NULL, 8, '1920x1080 pixels', 50, '1', '2023-09-23 07:40:52', '2023-09-23 07:40:52'),
(11, 5, 8, 1, 2, 'image', NULL, 6, '1920x1080 pixels', 69, '1', '2023-09-23 07:40:52', '2023-09-23 07:40:52'),
(12, 6, 5, 2, 1, 'script', 'regular price', NULL, NULL, 15, '1', '2023-09-30 05:49:15', '2023-09-30 05:49:15'),
(13, 12, 22, 2, 1, 'script', 'regular price', NULL, NULL, 60, '1', '2023-10-22 03:52:18', '2023-10-22 03:52:18'),
(14, 12, 17, 2, 1, 'audio', NULL, 24, '30 Audio Song', 20, '1', '2023-10-22 03:52:18', '2023-10-22 03:52:18'),
(15, 13, 22, 2, 1, 'script', 'regular price', NULL, NULL, 60, '1', '2023-10-22 04:00:35', '2023-10-22 04:00:35'),
(16, 14, 22, 2, 1, 'script', 'regular price', NULL, NULL, 60, '1', '2023-10-22 04:02:11', '2023-10-22 04:02:11'),
(17, 15, 19, 2, 1, 'audio', NULL, 28, '100 Audio Song', 20, '1', '2023-10-22 04:03:37', '2023-10-22 04:03:37'),
(18, 16, 17, 2, 1, 'audio', NULL, 24, '30 Audio Song', 20, '1', '2023-10-22 04:08:18', '2023-10-22 04:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `our_teams`
--

CREATE TABLE `our_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_teams`
--

INSERT INTO `our_teams` (`id`, `image`, `facebook`, `twitter`, `linkedin`, `instagram`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/custom-images/abdur-rohman-20230923120706.jpg', 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 'https://instagram.com', 1, '2023-09-23 06:07:06', '2023-10-01 11:11:18'),
(2, 'uploads/custom-images/shinzing-pang-20230923120754.jpg', 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 'https://instagram.com', 1, '2023-09-23 06:07:55', '2023-10-01 11:11:01'),
(3, 'uploads/custom-images/abu-siddik-ak-20230923120849.jpg', 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 'https://instagram.com', 1, '2023-09-23 06:08:49', '2023-10-01 11:11:32'),
(4, 'uploads/custom-images/ragantan-jhon-20230923120938.jpg', 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 'https://instagram.com', 1, '2023-09-23 06:09:38', '2023-10-01 11:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `our_team_languages`
--

CREATE TABLE `our_team_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_team_languages`
--

INSERT INTO `our_team_languages` (`id`, `team_id`, `lang_code`, `name`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Abdur Rohman', 'CEO & Founder', '2023-09-23 06:07:06', '2023-09-23 06:07:06'),
(2, 2, 'en', 'Shinzing Pang', 'Web Developer', '2023-09-23 06:07:55', '2023-09-23 06:07:55'),
(3, 3, 'en', 'Abu Siddik AK', 'UIUX Designer', '2023-09-23 06:08:49', '2023-09-23 06:08:49'),
(4, 4, 'en', 'Ragantan Jhon', 'Wp Developer', '2023-09-23 06:09:38', '2023-09-23 06:09:38'),
(5, 1, 'bn', 'আবদুর রহমান', 'সিইও & ফাউন্ডার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(6, 2, 'bn', 'শিনজিঙ পাং', 'ওয়েব ডেভেলপার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(7, 3, 'bn', 'আবু সিদ্দিক এ.কে', 'UIUX ডিজাইনার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(8, 4, 'bn', 'রাগানটান জোন', 'Wp ডেভেলপার', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `link`, `logo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-21-03-8846.png', 1, '2023-09-23 05:21:04', '2023-10-01 09:21:41'),
(2, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-21-14-6676.png', 1, '2023-09-23 05:21:14', '2023-10-01 09:21:48'),
(3, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-21-27-5383.png', 1, '2023-09-23 05:21:27', '2023-10-01 09:21:59'),
(4, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-21-40-4635.png', 1, '2023-09-23 05:21:40', '2023-10-01 09:22:17'),
(5, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-21-52-5517.png', 1, '2023-09-23 05:21:52', '2023-10-01 09:22:25'),
(6, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-22-05-5792.png', 1, '2023-09-23 05:22:05', '2023-10-01 09:22:35'),
(7, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-22-18-7630.png', 1, '2023-09-23 05:22:18', '2023-10-01 09:22:46'),
(8, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-22-31-4277.png', 1, '2023-09-23 05:22:31', '2023-10-01 09:22:59'),
(9, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-22-50-5774.png', 1, '2023-09-23 05:22:50', '2023-10-01 09:23:11'),
(10, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/our-partner-2023-09-23-11-23-04-3754.png', 1, '2023-09-23 05:23:05', '2023-10-01 09:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE `paypal_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `account_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paypal_payments`
--

INSERT INTO `paypal_payments` (`id`, `status`, `account_mode`, `client_id`, `secret_id`, `country_code`, `currency_code`, `currency_rate`, `image`, `created_at`, `updated_at`, `currency_id`) VALUES
(1, 1, 'sandbox', 'AWlV5x8Lhj9BRF8-TnawXtbNs-zt69mMVXME1BGJUIoDdrAYz8QIeeTBQp0sc2nIL9E529KJZys32Ipy', 'EEvn1J_oIC6alxb-FoF4t8buKwy4uEWHJ4_Jd_wolaSPRMzFHe6GrMrliZAtawDDuE-WKkCKpWGiz0Yn', 'US', 'USD', 1, 'uploads/website-images/paypal-2023-05-11-05-35-31-8176.png', NULL, '2023-10-18 06:03:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paystack_and_mollies`
--

CREATE TABLE `paystack_and_mollies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mollie_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_status` int(11) NOT NULL DEFAULT 0,
  `mollie_currency_rate` double NOT NULL DEFAULT 1,
  `paystack_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_currency_rate` double NOT NULL DEFAULT 1,
  `paystack_status` int(11) NOT NULL DEFAULT 0,
  `mollie_country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mollie_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paystack_country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paystack_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mollie_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paystack_currency_id` int(11) DEFAULT NULL,
  `mollie_currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paystack_and_mollies`
--

INSERT INTO `paystack_and_mollies` (`id`, `mollie_key`, `mollie_status`, `mollie_currency_rate`, `paystack_public_key`, `paystack_secret_key`, `paystack_currency_rate`, `paystack_status`, `mollie_country_code`, `mollie_currency_code`, `paystack_country_code`, `paystack_currency_code`, `mollie_image`, `paystack_image`, `created_at`, `updated_at`, `paystack_currency_id`, `mollie_currency_id`) VALUES
(1, 'test_4VDJypzqbsjjHpCJyx3vwjVuurqj3R', 1, 1.27, 'pk_test_057dfe5dee14eaf9c3b4573df1e3760c02c06e38', 'sk_test_77cb93329abbdc18104466e694c9f720a7d69c97', 417.35, 1, 'AS', 'CAD', 'NG', 'NGN', 'uploads/website-images/mollie-2023-05-11-05-36-00-2447.png', 'uploads/website-images/paystact-2023-05-11-05-36-37-1884.png', NULL, '2023-10-18 06:22:17', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popular_posts`
--

CREATE TABLE `popular_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_posts`
--

INSERT INTO `popular_posts` (`id`, `blog_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-09-23 06:39:45', '2023-09-23 06:39:45'),
(2, 3, 1, '2023-09-23 06:39:49', '2023-09-23 06:39:49'),
(3, 4, 1, '2023-09-23 06:40:08', '2023-09-23 06:40:08');

-- --------------------------------------------------------

--
-- Table structure for table `popular_tags`
--

CREATE TABLE `popular_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_tags`
--

INSERT INTO `popular_tags` (`id`, `tag_name`, `created_at`, `updated_at`) VALUES
(3, 'Generic', '2023-09-23 06:42:13', '2023-09-23 06:42:13'),
(4, 'Idea', '2023-09-23 06:42:24', '2023-09-23 06:42:24'),
(5, 'Business', '2023-09-23 06:42:30', '2023-09-23 06:42:30'),
(6, 'Development', '2023-09-23 06:42:48', '2023-09-23 06:42:48'),
(7, 'Technology', '2023-09-23 06:42:54', '2023-09-23 06:42:54'),
(8, 'Data', '2023-09-23 06:43:11', '2023-09-23 06:43:11'),
(9, 'Creative', '2023-09-23 06:43:16', '2023-09-23 06:43:16'),
(10, 'Agency', '2023-09-23 06:43:22', '2023-09-23 06:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy_languages`
--

CREATE TABLE `privacy_policy_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privacy_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policy_languages`
--

INSERT INTO `privacy_policy_languages` (`id`, `privacy_id`, `lang_code`, `privacy_policy`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '<h4><strong>1. What Are Privacy Policy?</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriefss asbut also the on leap into a electironc typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andeiss more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<h4><strong>2. Ecommerce Terms and Conditions Examples</strong></h4>\r\n<p>While it&rsquo;s not legally required for ecommerce websites to have a terms and conditions agreement, adding one will help protect your as sonline business.As terms and conditions are legally enforceable rules, they allow you to set standards for how users interact with your site. Here are some of the major abenefits of including terms and conditions on your ecommerce site:</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the obb1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop.</p>\r\n<h4><strong>Features :</strong></h4>\r\n<ul>\r\n<li>Slim body with metal cover</li>\r\n<li>Latest Intel Core i5-1135G7 processor (4 cores / 8 threads)</li>\r\n<li>8GB DDR4 RAM and fast 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture support</li>\r\n</ul>\r\n<h4><strong>3. Protect Your Property</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriezcs but also the on leap into as eylectronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraszvxet sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book. five centuries but also a the on leap into electronic typesetting, remaining essentially unchanged. It aswasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop our aspublishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<h4><strong>4. What to Include in Terms and Conditions for Online Stores</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also the on leap into as electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of as Leitraset sheets containing Loriem Ipsum passages, our andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Loriem Ipsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets as containing Lorem Ipsum passages, andei more recently with a desktop publishing software like Aldus PageMaker including versions of Loremas&nbsp; Ipsum to make a type specimen book.</p>\r\n<h4><strong>05.Pricing and Payment Terms</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also as the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release as of Letraset sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Lorem aIpsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheetsasd containing Lorem Ipsum passages, andei more recentlysl with desktop publishing software like Aldus PageMaker including versions of Loremadfsfds Ipsum to make a type specimen book.</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the our 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing asou software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>', NULL, '2023-09-23 06:26:42'),
(18, 1, 'bn', '<p><strong>১। গোপনীয়তা নীতি কি?</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীই টিকে আছে নয় বরং একটি বৈদ্যুতিক টাইপসেটিংয়ে লাফিয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার দিয়ে এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>২। ইকমার্সের নিয়ম ও শর্তাবলীর উদাহরণ</strong></p>\r\n<p>যদিও ইকমার্স ওয়েবসাইটগুলির জন্য একটি শর্ত ও শর্তের চুক্তি থাকা আইনত প্রয়োজন হয় না, তবে একটি যোগ করা আপনার সোনলাইন ব্যবসা হিসাবে রক্ষা করতে সহায়তা করবে৷ যেহেতু শর্তাবলী আইনত প্রয়োগযোগ্য নিয়ম, সেগুলি আপনাকে ব্যবহারকারীরা কীভাবে আপনার সাইটের সাথে ইন্টারঅ্যাক্ট করবে তার জন্য মান নির্ধারণ করতে দেয়৷ এখানে আপনার ইকমার্স সাইটের শর্তাবলী সহ কিছু প্রধান সুবিধা রয়েছে।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে obb1960-এর দশকে জনপ্রিয় হয়নি, এবং সম্প্রতি ডেস্কটপের সাথে।</p>\r\n<p><strong>বৈশিষ্ট্য :</strong></p>\r\n<ul>\r\n<li>ধাতব আবরণ সহ সিলিম বডি</li>\r\n<li>সর্বশেষ ইন্টেল কোর i5-1135G7 প্রসেসর (4 কোর / 8 থ্রেড)</li>\r\n<li>8GB DDR4 RAM এবং দ্রুত 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 গ্রাফিক্স কার্ড ব্যাকলিট কীবোর্ড, অঙ্গভঙ্গি সমর্থন সহ টাচপ্যাড</li>\r\n</ul>\r\n<p><strong>৩। আপনার সম্পত্তি রক্ষা করুন</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি শুধুমাত্র পাঁচ সেঞ্চুরিইজসিস নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করতে লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি। পাঁচ শতাব্দী কিন্তু ইলেকট্রনিক টাইপসেটিং-এ একটি অন লিপ, অপরিহার্যভাবে অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি আমাদের ডেস্কটপে Aldus PageMaker-এর মতো প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণ সহ একটি টাইপ নমুনা বই তৈরি করা হয়েছে।</p>\r\n<p><strong>৪। অনলাইন স্টোরের শর্তাবলীতে কী অন্তর্ভুক্ত করতে হবে</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবল পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরিয়েম ইপসাম প্যাসেজ সম্বলিত লেইট্রাসেট শীট হিসাবে প্রকাশের সাথে জনপ্রিয় হয়নি, আমাদের সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণগুলিকে একটি টাইপ নমুনা বই তৈরি করার জন্য। 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো একটি ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>০৫। মূল্য এবং অর্থপ্রদান শর্তাবলী</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং-এ লাফানোর মতোও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপের নমুনা বই তৈরি করার জন্য Lorem Ipsum-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ Lorem aIpsum-এর সংস্করণগুলি অন্তর্ভুক্ত করে একটি টাইপ নমুনা বই তৈরি করা হয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীটসাড প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি আমাদের 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি ধরনের নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` double DEFAULT NULL,
  `extend_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_update_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_technology` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `high_resolution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cross_browser` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documentation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approve_by_admin` int(1) NOT NULL DEFAULT 0,
  `popular_item` int(1) NOT NULL DEFAULT 0,
  `trending_item` int(1) NOT NULL DEFAULT 0,
  `featured_item` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `author_id`, `category_id`, `product_type`, `name`, `slug`, `regular_price`, `extend_price`, `preview_link`, `thumbnail_image`, `download_file`, `product_icon`, `download_file_type`, `download_link`, `description`, `release_date`, `last_update_date`, `used_technology`, `file_type`, `high_resolution`, `cross_browser`, `documentation`, `layout`, `file_size`, `tags`, `seo_title`, `seo_description`, `status`, `approve_by_admin`, `popular_item`, `trending_item`, `featured_item`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'script', NULL, 'homeco-real-estate-directory-listing-flutter-app-with-admin-panel', 29, '40', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-20-02-19-26-3150.png', 'Script-2023-09-20-02-19-26-1071.zip', 'uploads/custom-images/product_icon-2023-09-20-02-19-26-1969.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 08:19:26', '2023-10-01 09:01:19'),
(2, 1, 4, 'script', NULL, 'shopus-laravel-multivendor-fashion-ecommerce-website-user-app', 20, '30', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-20-03-44-02-3632.png', 'Script-2023-09-20-03-44-02-5778.zip', 'uploads/custom-images/product_icon-2023-09-20-03-44-02-5128.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 09:44:02', '2023-10-01 09:00:58'),
(3, 2, 5, 'script', NULL, 'foodbari-flutter-food-order-deliveryman-kitchen-app-ui-kit', 15, '30', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-20-03-54-34-9915.png', 'Script-2023-09-20-03-54-34-7148.zip', 'uploads/custom-images/product_icon-2023-09-20-03-54-34-1702.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 09:54:34', '2023-10-01 09:00:41'),
(4, 1, 3, 'script', NULL, 'jqb-job-finding-flutter-app-ui-kit', 25, '36', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-20-04-15-44-7306.png', 'Script-2023-09-20-04-15-44-2514.zip', 'uploads/custom-images/product_icon-2023-09-20-04-15-44-8113.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 10:15:44', '2023-10-01 09:00:14'),
(5, 2, 5, 'script', NULL, 'foodbari-flutter-food-restaurant-branchcooking-kitchen-app-ui-kit', 15, '35', 'https://websolutionus.com/', 'uploads/custom-images/thumb_image-2023-09-20-04-34-29-5441.png', 'Script-2023-09-20-04-34-29-3190.zip', 'uploads/custom-images/product_icon-2023-09-20-04-34-29-9527.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 10:34:29', '2023-09-20 10:34:29'),
(6, 2, 7, 'image', NULL, 'gotour-flutter-app-for-tours-and-travels', 20, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-20-04-49-39-3023.png', NULL, 'uploads/custom-images/product_icon-2023-09-20-04-49-39-7590.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-20 10:49:39', '2023-10-09 06:00:35'),
(7, 2, 8, 'image', NULL, 'nogo-flutter-nonfungible-token-marketplace-app', 20, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-09-35-08-1901.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-09-35-09-9554.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 03:35:09', '2023-10-09 07:17:16'),
(8, 1, 6, 'image', NULL, 'financial-corporation-flutter-money-management-app', 21, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-09-53-29-5439.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-09-53-29-7647.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 03:53:29', '2023-10-01 08:59:18'),
(9, 1, 6, 'image', NULL, 'finance-company-laravel-money-management-app', 30, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-10-54-03-4464.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-10-54-03-4254.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 04:54:04', '2023-10-01 08:58:58'),
(10, 2, 6, 'image', NULL, 'express-grocery-shop-management-laravel-software', 20, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-11-08-18-1625.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-11-08-18-7860.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 05:08:18', '2023-10-01 08:58:42'),
(11, 1, 2, 'video', NULL, 'travel-visa-management-laravel-software', 40, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-11-37-03-2037.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-11-37-04-1081.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 05:37:04', '2023-10-01 08:58:23'),
(12, 2, 2, 'video', NULL, 'online-course-purchase-and-sale-management-laravel-app', 19, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-12-17-28-6169.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-12-17-28-2461.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 06:17:28', '2023-10-01 08:58:00'),
(13, 1, 8, 'video', NULL, 'construction-service-management-software', 49, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-12-51-19-3733.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-12-51-19-8840.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 06:51:19', '2023-10-09 07:14:52'),
(14, 2, 2, 'video', NULL, 'artificial-intelligence-ai-writer-copywriting-laravel-app', 51, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-01-07-19-8850.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-01-07-19-4646.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 07:07:19', '2023-10-01 08:57:04'),
(15, 2, 2, 'video', NULL, 'school-management-inventory-laravel-software', 15, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-01-49-41-2960.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-01-49-41-1636.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 07:49:41', '2023-10-01 08:56:49'),
(16, 1, 1, 'audio', NULL, 'aabcserv-multivendor-ondemand-service-handyman-marketplace-flutter-seller-app', 19, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-03-25-54-5346.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-03-25-54-9040.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 09:25:54', '2023-10-09 07:14:00'),
(17, 2, 1, 'audio', NULL, 'shopo-ecommerce-multivendor-ecommerce-flutter-seller-app', 20, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-03-45-59-6110.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-03-45-59-7066.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 09:45:59', '2023-10-01 08:55:45'),
(18, 1, 1, 'audio', NULL, 'minimoll-fashion-ecommerce-flutter-app', 27, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-04-07-33-4997.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-04-07-33-9476.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 10:07:33', '2023-10-01 08:55:29'),
(19, 2, 1, 'audio', NULL, 'multibranch-restaurant-management-software', 20, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-04-21-36-4293.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-04-21-36-2222.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 10:21:36', '2023-10-01 08:55:13'),
(20, 1, 1, 'audio', NULL, 'singlebranch-restaurant-management-software', 15, NULL, 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-05-01-30-6034.png', NULL, 'uploads/custom-images/product_icon-2023-09-21-05-01-30-9541.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 11:01:30', '2023-10-01 08:54:54'),
(21, 2, 3, 'script', NULL, 'apps-premium-landing-theme', 33, '41', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-05-25-29-4176.png', 'Script-2023-09-21-05-25-30-1155.zip', 'uploads/custom-images/product_icon-2023-09-21-05-25-30-4102.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 11:25:30', '2023-10-01 08:54:35'),
(22, 2, 3, 'script', NULL, 'oifoliodigital-marketing-theme', 60, '90', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-05-38-15-3857.png', 'Script-2023-09-21-05-38-15-7744.zip', 'uploads/custom-images/product_icon-2023-09-21-05-38-15-2185.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 11:38:15', '2023-10-01 08:54:19'),
(23, 1, 5, 'script', NULL, 'saas-landing-software-theme', 50, '85', 'https://codecanyon.net/user/quomodotheme/portfolio', 'uploads/custom-images/thumb_image-2023-09-21-05-44-14-9303.png', 'Script-2023-09-21-05-44-15-4728.zip', 'uploads/custom-images/product_icon-2023-09-21-05-44-15-3547.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, '2023-09-21 11:44:15', '2023-10-01 08:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `name`, `email`, `phone`, `address`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 'California, Los Angeles', 'Oifolio-Digital Marketing Theme has been a fantastic addition to my toolkit. It&#039;s made managing my online marketing a breeze', 1, '2023-09-23 08:27:50', '2023-09-23 08:27:56'),
(2, 19, 1, 'Abdullah Mamun', 'user@gmail.com', '22-402-666', 'California, Los Angeles', 'Absolutely love it! This software is incredibly user-friendly. Makes everything so much simpler!', 1, '2023-09-23 08:31:44', '2023-09-23 08:31:49'),
(3, 23, 2, 'John doe', 'user2@gmail.com', '22-402-667', 'California, Los Angeles', 'The SaaS Landing Software Theme is user-friendly and budget-friendly, making it a practical choice for creating an effective landing page for my SaaS product.', 1, '2023-09-23 08:40:17', '2023-09-23 08:40:22'),
(4, 20, 2, 'John doe', 'user2@gmail.com', '22-402-667', 'California, Los Angeles', 'Small but mighty! This supporting product empowers single-branch restaurants to compete with the big players and serve up top-notch dining experiences.', 1, '2023-09-23 08:57:44', '2023-09-23 08:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer` int(11) NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `offer`, `link`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 40, 'https://codecanyon.net/user/quomodotheme/portfolio', '2023-10-31', 1, '2023-07-05 10:27:52', '2023-10-02 10:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount_languages`
--

CREATE TABLE `product_discount_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discount_languages`
--

INSERT INTO `product_discount_languages` (`id`, `discount_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Get Big Discount For a Limited time', NULL, '2023-08-28 09:15:59'),
(17, 1, 'bn', 'সীমিত সময়ের জন্য বড় ডিসকাউন্ট পান', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

CREATE TABLE `product_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `script_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`id`, `script_image`, `image_image`, `video_image`, `audio_image`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/script-product-image--2023-08-26-05-02-37-9372.png', 'uploads/website-images/image-product-image--2023-06-11-01-22-46-3718.png', 'uploads/website-images/video-product-image--2023-06-11-01-22-46-2309.png', 'uploads/website-images/audio-product-image--2023-06-11-01-22-46-4333.png', '2023-06-11 06:36:13', '2023-08-26 11:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_item_languages`
--

CREATE TABLE `product_item_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_item_languages`
--

INSERT INTO `product_item_languages` (`id`, `item_id`, `lang_code`, `script_title`, `script_description`, `image_title`, `image_description`, `video_title`, `video_description`, `audio_title`, `audio_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Create Script Product', 'What is script product ? If you interest submit php, wordpress, mobile app, html design or any other web related script then you can choose it', 'Create Image Product', 'What is image product ? If you interest jpg, jpeg, pnj or any other image related file then you can choose it', 'Create Video Product', 'What is video product ? If you interest animation, video design, video related file then you can choose it', 'Create Audio Product', 'What is audio product ? If you interest animation, video design, video related file then you can choose it', NULL, '2023-08-28 09:15:59'),
(28, 1, 'bn', 'স্ক্রিপ্ট পণ্য তৈরি করুন', 'স্ক্রিপ্ট পণ্য কি? আপনি যদি পিএইচপি, ওয়ার্ডপ্রেস, মোবাইল অ্যাপ, এইচটিএমএল ডিজাইন বা অন্য কোনও ওয়েব সম্পর্কিত স্ক্রিপ্ট জমা দিতে আগ্রহী হন তবে আপনি এটি বেছে নিতে পারেন', 'ইমেজ পণ্য তৈরি করুন', 'ইমেজ পণ্য কি? আপনি যদি jpg, jpeg, pnj বা অন্য কোন ইমেজ সম্পর্কিত ফাইলে আগ্রহী হন তাহলে আপনি এটি বেছে নিতে পারেন', 'ভিডিও পণ্য তৈরি করুন', 'ভিডিও পণ্য কি? আপনি যদি অ্যানিমেশন, ভিডিও ডিজাইন, ভিডিও সম্পর্কিত ফাইল আগ্রহী হন তবে আপনি এটি চয়ন করতে পারেন', 'অডিও পণ্য তৈরি করুন', 'অডিও পণ্য কি? আপনি যদি অ্যানিমেশন, ভিডিও ডিজাইন, ভিডিও সম্পর্কিত ফাইল আগ্রহী হন তবে আপনি এটি চয়ন করতে পারেন', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_languages`
--

CREATE TABLE `product_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_languages`
--

INSERT INTO `product_languages` (`id`, `product_id`, `lang_code`, `name`, `description`, `tags`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, '1', 'en', 'Homeco - Real Estate Directory listing Flutter App with Admin Panel', '<p>Homeco &ndash; Real Estate Directory listing Flutter App</p>\r\n<p>Homeco &ndash; Real Estate Directory listing Flutter App is designed and developed based on the core features of a real estate directory listing website or company. In Homeco &ndash; Real Estate Directory listing Flutter App user and Agent both can take part and use sideways. This Homeco &ndash; Real Estate Directory listing Flutter App made full of modern features and aminities.</p>\r\n<p>Homeco &ndash; Real Estate Directory listing Flutter App is best suitable for Real Estate Directory, Laravel Real Estate, Real Estate Script, Listing Management, Property Directory, Real Estate Listings, Laravel Listing Script, Property Listing Platform, Directory Listing Solutions, Real Estate Marketplace, Laravel Directory Script, Listing Management System, Property Listing Directory, Real Estate Directory Script, Laravel Real Estate Marketplace</p>\r\n<p>Homeco &ndash; Real Estate Directory listing Flutter App Features:</p>\r\n<ul>\r\n<li>Flutter Version 3</li>\r\n<li>45+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>Homeco &ndash; Real Estate Directory listing Flutter App PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Homeco ,Real Estate,Flutter App,PHP,Laravel', 'Homeco - Real Estate Directory listing Flutter App with Admin Panel', 'Homeco - Real Estate Directory listing Flutter App with Admin Panel', '2023-09-20 08:19:26', '2023-09-20 08:23:58'),
(2, '2', 'en', 'ShopUs - Laravel Multivendor Fashion eCommerce Website User App', '<p>ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App</p>\r\n<p>ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App is an exquisitely designed user app for the Laravel Multivendor Fashion eCommerce Website. Created with the utmost care and utilizing cutting-edge Flutter app technology and design trends, this app, known as ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App, is an ideal solution for various businesses engaged in online retail. Whether it&rsquo;s eCommerce, electronics, groceries, or any other product that can be sold online, this Multivendor eCommerce Flutter App caters to diverse needs with perfection.</p>\r\n<p>The ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App offers a plethora of features that position it as one of the top contenders in the ecommerce industry. This ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App is tailored specifically for the food, grocery, and eCommerce sectors. Its modern and clean UI design, available for both iOS and Android platforms, is intricately detailed. With customizable screens, this app provides exceptional flexibility and user-friendly interface, enabling you to effortlessly add the final touches to your project.</p>\r\n<p>ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App Features:</p>\r\n<ul>\r\n<li>45+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'ShopUs ,Laravel Multivendor, eCommerce ,Laravel,PHP,HTML', 'ShopUs - Laravel Multivendor Fashion eCommerce Website User App', 'ShopUs - Laravel Multivendor Fashion eCommerce Website User App', '2023-09-20 09:44:02', '2023-09-20 09:44:02'),
(3, '3', 'en', 'FoodBari Flutter - Food Order, Deliveryman & Kitchen App', '<p><br>FoodBari Flutter - Food Order, Deliveryman &amp; Kitchen App Ui Kit - CodeCanyon Item for Sale<br>Screenshots<br>FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit</p>\r\n<p>FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit is a complete solution for Food Ordering and Delivery Business. In this FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit We have Food Ordering App, User App &amp; Deliveryman app.</p>\r\n<p>FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit is best suits for business who are in Restaurant Business, eCommerce Business, Coriuer and Parcel Business. FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit is made for food, order, online order, booking, reservation, delivery &amp; kitchen management.</p>\r\n<p>FoodBari Flutter &ndash; Food Order, Deliveryman &amp; Kitchen App Ui Kit Features:</p>\r\n<ul>\r\n<li>120+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>Image &amp; Fonts Credit:</p>\r\n<ul>\r\n<li>Unsplash</li>\r\n<li>Freepik</li>\r\n<li>Google Fonts</li>\r\n</ul>\r\n<p>NOTE:</p>\r\n<p>Images are not included in main downloadable file, images used only for demo purpose.</p>', 'FoodBari , Deliveryman ,Kitchen App, Flutter ,Laravel,PHP', 'FoodBari Flutter - Food Order, Deliveryman & Kitchen App', 'FoodBari Flutter - Food Order, Deliveryman & Kitchen App', '2023-09-20 09:54:34', '2023-09-25 11:06:45'),
(4, '4', 'en', 'JQB - Job Finding Flutter App Ui Kit', '<p>JQB &ndash; Job Finding Flutter App Ui Kit</p>\r\n<p>JQB &ndash; Job Finding Flutter App Ui Kit comes up with a Unique and most updated JOB finding Idea. This is suitable for agencies and applicants as well. This is based on Flutter and Its a Flutter App Ui Kit or you can say Front end Flutter App</p>\r\n<p>JQB &ndash; Job Finding Flutter App Ui Kit Is suitable for any business who is working with android, ios, job, job app, job board, job portal, job portal app, job search, mobile, ui kit, ux</p>\r\n<p>Unlock the potential of your job finding mobile app project with the JQB - Job Finding Flutter App UI Kit. Crafted with precision and attention to detail, JQB empowers developers, designers, and entrepreneurs to create a cutting-edge job search and recruitment platform in no time.</p>\r\n<p>With JQB, you gain access to a robust assortment of meticulously designed UI components, widgets, and templates, each tailored to enhance your app\'s user experience. Whether you\'re building a job search app for job seekers or a recruitment platform for employers, JQB provides the tools you need to deliver a polished and feature-rich solution.</p>\r\n<p>Key Features:</p>\r\n<p>Sleek Design: JQB\'s modern and elegant design elements ensure your app stands out in the crowded job market.</p>\r\n<p>Effortless Customization: Tailor the UI to match your brand and vision seamlessly, thanks to JQB\'s easily customizable components.</p>\r\n<p>User-Friendly: JQB\'s intuitive layout and navigation make it simple for users to search for jobs, apply, and connect with potential employers.</p>\r\n<p>Rich Functionality: Unlock a wealth of features like job listings, applicant profiles, advanced search filters, and more, all designed to enhance user engagement.</p>\r\n<p>Flutter-Powered: Benefit from the power of Flutter, a versatile and efficient framework for building natively compiled applications for mobile, web, and desktop from a single codebase.</p>\r\n<p>Save Time and Resources: Speed up your development process and reduce costs with JQB\'s ready-made components and templates.</p>\r\n<p>Whether you\'re a seasoned developer looking to expedite your project or a budding entrepreneur venturing into the job search industry, JQB provides the foundation you need to create a polished and functional app. Elevate your app development game and get started with JQB today &ndash; your path to success in the job finding app market begins here</p>\r\n<p>Finco &ndash; Flutter Money Management App UI Kit Features:</p>\r\n<ul>\r\n<li>30+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'JQB ,Job Finding,Flutter App,Ui Kit,Laravel,PHP', 'JQB - Job Finding Flutter App Ui Kit', 'JQB - Job Finding Flutter App Ui Kit', '2023-09-20 10:15:44', '2023-09-20 10:15:44'),
(5, '5', 'en', 'FoodBari - Flutter Food Restaurant Branch,Cooking & Kitchen App', '<p>\"FoodBari\" is an all-encompassing UI kit meticulously crafted to cater to the unique needs of the culinary world. Whether you\'re an ambitious chef, a restaurant owner seeking to expand your digital presence, or a savvy developer aiming to streamline the creation of food-related apps, FoodBari is your comprehensive solution.</p>\r\n<p>At its core, FoodBari is a versatile toolkit designed to empower businesses and individuals in the food industry. It provides an extensive array of resources and tools for crafting dynamic and user-friendly mobile applications. Here\'s what makes FoodBari exceptional:</p>\r\n<p>Restaurant Branch Management: Manage your restaurant branches effortlessly, overseeing menus, staff, and customer orders, all within an intuitive and integrated interface.</p>\r\n<p>Cooking and Recipe Integration: Tap into a treasure trove of culinary resources, including recipe databases and cooking tips, enriching your app\'s content and offering invaluable insights to your users.</p>\r\n<p>Kitchen Efficiency Tools: Elevate kitchen operations with features like order tracking, ingredient management, and workflow optimization, enhancing the efficiency of your culinary endeavors.</p>\r\n<p>Stunning User Interface: FoodBari offers a visually captivating and user-friendly interface, ready to be tailored to your brand\'s identity and style, ensuring a memorable user experience.</p>\r\n<p>Cross-Platform Compatibility: Harness the power of the Flutter framework to create applications that seamlessly run on both iOS and Android devices, expanding your reach to a broader audience.</p>\r\n<p>Responsive Design: FoodBari\'s UI elements gracefully adapt to various screen sizes, guaranteeing an exceptional user experience on smartphones and tablets alike.</p>\r\n<p>Easy Integration: Integrating FoodBari into your app development project is a breeze, thanks to well-organized code and comprehensive documentation, saving you valuable time and resources.</p>\r\n<p>Customization Options: Tailor the UI kit to your exact specifications, with options to tweak color schemes, typography, and layout configurations, ensuring your app aligns perfectly with your vision.</p>\r\n<p>In summary, FoodBari is more than just a UI kit; it\'s your indispensable partner in creating feature-rich, visually captivating, and highly functional mobile applications for the food, restaurant, cooking, and kitchen sectors. With its versatile features and comprehensive tools, FoodBari empowers businesses and developers to craft digital experiences that cater to the diverse demands of the culinary world, all while ensuring seamless cross-platform compatibility and an exceptional user experience. Elevate your culinary ventures with FoodBari today.</p>', 'FoodBari ,Restaurant Branch,Cooking ,Kitchen App,PHP,Laravel', 'FoodBari - Flutter Food Restaurant Branch,Cooking & Kitchen App', 'FoodBari - Flutter Food Restaurant Branch,Cooking & Kitchen App', '2023-09-20 10:34:29', '2023-09-25 11:09:19'),
(6, '6', 'en', 'GoTour - Flutter App for Tours and Travels', '<p>GoTour is more than just a mobile application; it\'s your gateway to a world of incredible travel experiences. This cutting-edge Flutter app is designed to revolutionize the way you explore the globe. With its user-friendly interface and powerful features, GoTour is set to become your indispensable travel companion.</p>\r\n<p>Imagine effortlessly discovering new and breathtaking destinations, planning personalized itineraries tailored to your preferences, and making real-time bookings for flights, accommodations, and activities - all within a single, intuitive app. GoTour makes all of this and more possible.</p>\r\n<p>Our app goes beyond the basics by offering personalized recommendations based on your interests and travel history. Whether you\'re an adventurer seeking thrilling experiences, a food enthusiast eager to savor local cuisine, or a culture lover looking to immerse yourself in the traditions of a new place, GoTour has you covered.</p>\r\n<p>But GoTour is not just about solo exploration. It\'s a platform for connecting with fellow travelers, sharing insights, and creating unforgettable memories together. You can tap into local expertise and gain insider knowledge about hidden gems, unique experiences, and cultural immersion opportunities that will enrich your journey.</p>\r\n<p>Your safety and support are paramount, and GoTour provides you with essential travel information, emergency contacts, and real-time alerts to ensure you have a secure and worry-free adventure. Plus, our integrated travel journal lets you capture and cherish every moment of your travels.</p>\r\n<p>With GoTour, you\'re not just traveling; you\'re embarking on a transformative journey. It\'s time to elevate your travel experiences, and GoTour is here to make it happen. Download the app now and let your next adventure begin.</p>\r\n<p>GoTour &ndash; Flutter App Features:</p>\r\n<ul>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compitable</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Trnsition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'GoTour ,Tours and Travels,Flutter ,PHP,Laravel,HTML', 'GoTour - Flutter App for Tours and Travels', 'GoTour - Flutter App for Tours and Travels', '2023-09-20 10:49:39', '2023-09-20 10:53:02'),
(7, '7', 'en', 'Nogo – Flutter Non-Fungible Token Marketplace App', '<p>Introducing Nogo &ndash; Your Premier Destination for Exploring the World of Non-Fungible Tokens (NFTs) on the Flutter Platform!</p>\r\n<p>Step into the exciting world of digital collectibles, art, and unique virtual assets with Nogo, your go-to NFT marketplace app built with the cutting-edge Flutter framework. Nogo is here to redefine the way you experience and interact with NFTs, offering a seamless, user-friendly, and visually captivating platform for collectors, artists, and enthusiasts alike.</p>\r\n<p>Key Features:</p>\r\n<p>Diverse NFT Collections: Dive into an expansive and ever-growing collection of NFTs, spanning digital art, music, virtual real estate, virtual goods, and more. Explore a world of creativity and innovation at your fingertips.</p>\r\n<p>Discover &amp; Explore: Nogo provides intuitive search and discovery tools to help you find the NFTs that resonate with your interests. Whether you\'re into rare collectibles or trending digital art, we\'ve got you covered.</p>\r\n<p>Secure Wallet Integration: Your digital treasures deserve the utmost protection. Nogo seamlessly integrates secure digital wallets, ensuring the safety of your NFT investments and allowing you to manage your assets effortlessly.</p>\r\n<p>Creator-Focused Platform: Empowering artists and creators is at the core of Nogo\'s mission. We provide a dedicated space for artists to showcase their work, gain exposure, and connect with a global audience.</p>\r\n<p>Effortless Trading: Buying, selling, and trading NFTs has never been this easy. Nogo streamlines the transaction process, offering a range of payment options to suit your preferences.</p>\r\n<p>Real-Time Insights: Stay informed with real-time market data and trends. Nogo equips you with the tools you need to make informed decisions in the fast-paced NFT market.</p>\r\n<p>Community &amp; Networking: Join a vibrant community of NFT enthusiasts, artists, and collectors. Engage in discussions, attend virtual events, and expand your network within the NFT ecosystem.</p>\r\n<p>Customizable Profile: Personalize your Nogo profile with your favorite NFTs, bio, and achievements. Showcase your unique taste and contributions to the NFT community.</p>\r\n<p>Seamless Mobile Experience: Nogo is built using Flutter, ensuring a smooth and responsive mobile experience across a wide range of devices. Enjoy NFT exploration on the go!</p>\r\n<p>Nogo is more than just an app; it\'s a gateway to a world of limitless creativity, innovation, and digital ownership. Whether you\'re a seasoned NFT collector or a newcomer to the space, Nogo welcomes you to embark on an unforgettable journey through the realm of Non-Fungible Tokens.</p>\r\n<p>Download Nogo today and experience the future of NFT marketplaces with the power and elegance of Flutter at your fingertips. Start collecting, trading, and exploring NFTs like never before!</p>\r\n<p>Nogo &ndash; Flutter NFT Marketplace App Ui Kit Features:</p>\r\n<ul>\r\n<li>39 High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Modern Design</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Nogo ,Non-Fungible,Token ,Marketplace ,PHP,Laravel', 'Nogo – Flutter Non-Fungible Token Marketplace App', 'Nogo – Flutter Non-Fungible Token Marketplace App', '2023-09-21 03:35:09', '2023-09-25 11:14:44'),
(8, '8', 'en', 'Financial Corporation – Flutter Money Management App', '<p>Introduction:<br>In today\'s fast-paced world, managing personal finances has become increasingly complex. Financial institutions are constantly seeking innovative ways to assist their customers in achieving financial stability and success. To address these challenges, Financial Corporation is proud to introduce its cutting-edge Flutter Money Management App, designed to empower individuals with the tools and insights needed to take control of their finances.</p>\r\n<p>Overview:<br>The Flutter Money Management App is a powerful financial management solution developed by Financial Corporation, a trusted leader in the financial services industry. This comprehensive application leverages the versatility and efficiency of the Flutter framework to deliver an exceptional user experience across multiple platforms, including iOS and Android.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Multi-Platform Accessibility: Our app is built using Flutter, ensuring seamless and consistent performance on both iOS and Android devices. Users can access their financial information anytime, anywhere.</li>\r\n<li>Account Aggregation: The app allows users to link their bank accounts, credit cards, investment portfolios, and more. It consolidates all financial data into a single dashboard for a holistic view of their finances.</li>\r\n<li>Expense Tracking: Users can easily track their expenses by categorizing transactions. The app offers insightful visualizations and reports to help users understand their spending habits.</li>\r\n<li>Budgeting Tools: The budgeting feature enables users to set financial goals and create realistic budgets. The app provides real-time alerts and notifications to help users stay on track.</li>\r\n<li>Bill Reminders: Never miss a payment again with the built-in bill reminder feature. Users can schedule automatic payments and receive notifications for upcoming bills.</li>\r\n<li>Investment Portfolio Analysis: For users with investment portfolios, the app offers tools to monitor and analyze portfolio performance. It provides charts and data to make informed investment decisions.</li>\r\n<li>Financial Insights: Our app uses advanced analytics to offer personalized financial insights and recommendations. Users can receive tips on how to save money, invest wisely, and improve their financial health.</li>\r\n<li>Security and Privacy: Financial Corporation takes security seriously. The app employs state-of-the-art encryption and security protocols to protect users\' financial data and privacy.</li>\r\n<li>Customer Support: Access to a dedicated customer support team ensures that users receive assistance whenever they have questions or encounter issues.</li>\r\n</ul>\r\n<p>Benefits:</p>\r\n<p>Financial Empowerment: The Flutter Money Management App empowers users to make informed financial decisions, helping them achieve their financial goals and dreams.</p>\r\n<p>Simplicity: Its intuitive interface and user-friendly design make managing finances easy, even for those with little financial knowledge.</p>\r\n<p>Time Savings: By aggregating financial information and automating tasks, the app saves users time and reduces the stress associated with financial management.</p>\r\n<p>Financial Security: The app\'s robust security measures ensure that users\' financial information remains safe and protected at all times.</p>\r\n<p>Conclusion:<br>Financial Corporation\'s Flutter Money Management App represents a significant leap forward in the world of personal finance. With its versatile features, intuitive design, and commitment to financial well-being, this app is poised to revolutionize how individuals manage their money. Whether you\'re an experienced investor or someone just starting to take control of your finances, our app is here to help you succeed financially. Download it today and embark on a journey toward financial freedom and security with Financial Corporation.</p>\r\n<p>&nbsp;</p>', 'Financial ,Corporation ,Money Management,App,Laravel', 'Financial Corporation – Flutter Money Management App', 'Financial Corporation – Flutter Money Management App', '2023-09-21 03:53:29', '2023-09-25 11:15:13'),
(9, '9', 'en', 'Finance Company – Laravel Money Management App', '<p>A \"Finance Company &ndash; Laravel Money Management App\" is a sophisticated and comprehensive financial management application built on the Laravel framework, designed to cater to the diverse needs of financial institutions, businesses, and individuals alike. This cutting-edge software solution empowers finance companies and their clients to efficiently manage their financial resources, streamline operations, and make informed decisions with ease.</p>\r\n<p>In summary, the \"Finance Company &ndash; Laravel Money Management App\" is a versatile and powerful tool that empowers finance companies and individuals to take control of their financial future. Whether you\'re a financial institution looking to streamline operations or an individual seeking to better manage personal finances, this application offers a comprehensive and user-centric solution to meet your needs. It represents a commitment to financial excellence, security, and efficiency, setting the stage for smarter financial decisions and a more prosperous future.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-Friendly Interface: The app boasts an intuitive and user-friendly interface, ensuring that users, regardless of their technical proficiency, can navigate and utilize its extensive features effortlessly.</li>\r\n<li>Account Management: With robust account management capabilities, users can create, modify, and delete accounts, each with its unique set of properties and permissions. This facilitates the management of multiple financial portfolios or business divisions from a single platform.</li>\r\n<li>Transaction Tracking: Keep a close eye on financial transactions with real-time tracking and reporting. Categorize transactions, set budgets, and generate insightful reports to gain a clear understanding of income, expenses, and overall financial health.</li>\r\n<li>Secure User Authentication: Security is paramount in finance, and this app ensures data protection through robust user authentication mechanisms, encryption, and secure data storage protocols.</li>\r\n<li>Customizable Dashboards: Users can personalize their dashboards, displaying the data and insights that matter most to them. This customization empowers individuals and businesses to focus on the key financial metrics relevant to their goals.</li>\r\n<li>Investment Management: Seamlessly manage investments, stocks, bonds, and other financial assets. Track their performance, receive alerts, and make informed investment decisions.</li>\r\n<li>Loan and Debt Management: For finance companies, this app simplifies loan origination, servicing, and debt collection. Users can view outstanding debts, set repayment schedules, and automate collection processes.</li>\r\n<li>Expense Tracking: Monitor daily expenses, categorize them, and set limits to avoid overspending. The app can also generate expense reports for tax purposes or budget analysis.</li>\r\n<li>Collaboration and Sharing: Collaborate with team members, clients, or family members by sharing access to specific financial accounts or data. This ensures transparency and enhances financial planning.</li>\r\n<li>Comprehensive Reporting: Generate a wide array of financial reports, including income statements, balance sheets, cash flow statements, and more. These reports provide deep insights into financial performance and aid in strategic decision-making.</li>\r\n<li>Mobile Accessibility: Access the app on the go with mobile compatibility, allowing users to manage their finances anytime, anywhere.</li>\r\n<li>Multi-Currency Support: Cater to global clients and investments with multi-currency support, enabling users to track and manage finances in various currencies seamlessly.</li>\r\n<li>Compliance and Regulations: Stay compliant with financial regulations and reporting requirements by leveraging built-in compliance tools and features.</li>\r\n<li>Data Backup and Recovery: Ensure the safety of financial data with automated backup and recovery options, minimizing the risk of data loss.</li>\r\n</ul>', 'Finance ,Company ,Management ,Laravel,PHP,JS', 'Finance Company – Laravel Money Management App', 'Finance Company – Laravel Money Management App', '2023-09-21 04:54:04', '2023-09-25 11:17:26'),
(10, '10', 'en', 'Express - Grocery Shop management Laravel Software', '<p>Are you tired of the countless challenges that come with running a successful grocery shop? Look no further! Our state-of-the-art Grocery Shop Management Laravel Software is here to transform your business operations and take your grocery store to new heights.</p>\r\n<p>Why Choose Our Laravel Software?</p>\r\n<p>Streamlined Inventory Management: Say goodbye to stockouts and overstocked shelves. Our software provides real-time inventory tracking, ensuring you always have the right products in stock.</p>\r\n<p>Efficient Order Processing: Simplify the order management process with our user-friendly interface. From placing orders to tracking deliveries, it\'s all at your fingertips.</p>\r\n<p>Customer Engagement: Build lasting relationships with your customers through loyalty programs, personalized offers, and efficient communication channels.&nbsp;Make data-driven decisions with comprehensive sales analytics. Identify top-selling products, peak shopping hours, and trends to optimize your inventory and pricing.</p>\r\n<p>Supplier Collaboration: Streamline communication with suppliers, manage procurement, and negotiate better deals to increase your profit margins.&nbsp;Our intuitive dashboard makes it easy to manage your grocery shop. You don\'t need to be tech-savvy to use our software effectively.</p>\r\n<p>Secure and Scalable: Rest easy knowing your data is protected. Our software is designed with the latest security features and is scalable to grow with your business. Tailor the software to fit your grocery shop\'s unique needs. Add custom features, branding, and integrations as your business evolves.</p>\r\n<p>24/7 Support: Our dedicated support team is available around the clock to assist you with any questions or concerns.</p>\r\n<p>Why Laravel?</p>\r\n<p>Our software is built on the Laravel framework, known for its reliability, security, and scalability. With Laravel, you can trust that your grocery shop management system will be robust and ready to handle your growing business.</p>\r\n<p>Don\'t miss out on the opportunity to transform your grocery shop into a thriving, efficient, and customer-centric business. Get started with our Grocery Shop Management Laravel Software today and watch your profits soar while simplifying your daily operations. Join the future of grocery shop management now!</p>\r\n<p>Features:</p>\r\n<ul>\r\n<li>30+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Express ,Grocery Shop,Laravel Software,Laravel,PHP', 'Express - Grocery Shop management Laravel Software', 'Express - Grocery Shop management Laravel Software', '2023-09-21 05:08:18', '2023-09-25 11:19:29'),
(11, '11', 'en', 'Travel Visa Management Laravel Software', '<p>Are you tired of the hassle and complexity involved in managing travel visas for your organization or clients? Look no further than VisaHub, our cutting-edge travel visa management software built on the robust Laravel framework. VisaHub is your comprehensive solution to simplify and optimize the entire visa application and processing workflow.</p>\r\n<p>Visa management can be a daunting task, especially when dealing with multiple countries, diverse visa types, and intricate documentation requirements. With VisaHub, you can effortlessly navigate this intricate landscape and ensure a smooth, error-free visa application process for your travelers.</p>\r\n<p>Creating a travel visa management system using Laravel can be a complex but rewarding project. Such a system would be valuable for travel agencies, immigration consultants, or organizations that frequently deal with visa applications and processing. Below is an extensive overview of what a travel visa management system built with Laravel could entail:</p>\r\n<p>VisaHub is designed to simplify the visa application and management process, saving you time, reducing errors, and enhancing the overall experience for both your organization and visa applicants. Whether you\'re a travel agency, corporate entity, or visa service provider, VisaHub empowers you to efficiently handle travel visa applications with ease.</p>\r\n<p>Say goodbye to manual paperwork, confusion, and delays. Experience the future of travel visa management with VisaHub, the Laravel-powered solution that streamlines your visa application process, ensuring a hassle-free journey for all travelers.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Visa Catalog: VisaHub maintains an up-to-date catalog of visas from various countries, making it easy to access essential information such as requirements, processing times, and fees.</li>\r\n<li>Document Repository: Store and organize visa-related documents securely within VisaHub. Easily upload, manage, and retrieve essential files, ensuring that all required documents are readily available.</li>\r\n<li>Application Tracking: Monitor visa applications in real-time. Track the progress of each application, receive status updates, and set automated notifications to keep stakeholders informed.</li>\r\n<li>User Management: VisaHub allows you to define user roles and permissions, ensuring that only authorized personnel can access sensitive visa information.</li>\r\n<li>Notification System: Keep applicants, clients, and team members informed with automated email notifications and alerts at key stages of the visa application process.</li>\r\n<li>Reporting and Analytics: Generate insightful reports and analytics to gain valuable insights into your visa management operations. Identify bottlenecks, improve efficiency, and make data-driven decisions.</li>\r\n<li>Compliance and Updates: VisaHub keeps you informed about changes in visa requirements, ensuring that you are always up to date and compliant with the latest regulations.</li>\r\n<li>Customization: Tailor VisaHub to your specific needs with customizable fields, forms, and branding options to align with your organization\'s identity.</li>\r\n</ul>\r\n<p>VisaHub is designed to simplify the visa application and management process, saving you time, reducing errors, and enhancing the overall experience for both your organization and visa applicants. Whether you\'re a travel agency, corporate entity, or visa service provider, VisaHub empowers you to efficiently handle travel visa applications with ease.</p>\r\n<p>Say goodbye to manual paperwork, confusion, and delays. Experience the future of travel visa management with VisaHub, the Laravel-powered solution that streamlines your visa application process, ensuring a hassle-free journey for all travelers.</p>', 'Travel ,Visa ,Management ,Software,PHP,Laravel', 'Travel Visa Management Laravel Software', 'Travel Visa Management Laravel Software', '2023-09-21 05:37:04', '2023-09-25 11:21:50'),
(12, '12', 'en', 'Online Course Purchase and Sale Management Laravel App', '<p>\"Online Course Purchase and Sale Management Laravel App\" is a comprehensive and feature-rich web application designed to streamline the entire process of buying and selling online courses. With a powerful Laravel backend, this application offers a seamless experience for both course creators and students alike.</p>\r\n<p>Whether you\'re an aspiring course creator looking to monetize your knowledge or a student seeking to expand your skills and knowledge, the \"Online Course Purchase and Sale Management Laravel App\" provides a robust and reliable platform to meet your educational needs. With its extensive features and user-friendly design, it revolutionizes the way online courses are bought and sold, creating a win-win situation for both educators and learners.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-friendly Interface: The application boasts an intuitive and user-friendly interface that ensures smooth navigation for all users, regardless of their technical expertise.</li>\r\n<li>Course Creation and Management: Course creators can easily create, edit, and manage their courses within the platform. They can upload course materials, set pricing, and define access parameters.</li>\r\n<li>Student Enrollment: Students can browse through a catalog of available courses, read detailed descriptions, and enroll in courses that align with their interests and learning goals.</li>\r\n<li>Secure Payment Processing: The app supports secure payment gateways to facilitate transactions, allowing course creators to monetize their content effectively.</li>\r\n<li>User Profiles: Users can create and manage their profiles, track their course progress, and access a personalized dashboard for a customized learning experience.</li>\r\n<li>Content Delivery: The application ensures reliable content delivery, including video streaming, downloadable resources, and interactive elements, to enhance the learning experience.</li>\r\n<li>Feedback and Reviews: Students can provide feedback and leave reviews for courses they\'ve taken, helping others make informed decisions.</li>\r\n<li>Analytics and Reporting: Course creators can access detailed analytics and reports to track the performance of their courses, enabling data-driven improvements.</li>\r\n<li>Notifications: Automated email notifications keep users informed about course updates, upcoming classes, and other important information.</li>\r\n<li>User Support: The app offers a support system for users to get assistance with any issues or inquiries they may have.</li>\r\n<li>Responsive Design: The application is designed to be fully responsive, ensuring a seamless experience across various devices, including desktops, tablets, and smartphones.</li>\r\n<li>Admin Dashboard: Admins have access to a comprehensive dashboard to manage users, courses, payments, and other aspects of the platform.</li>\r\n<li>Security: Robust security measures are implemented to protect user data, payment information, and course content.</li>\r\n</ul>\r\n<p>Payment Methods:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Online,Course,Laravel app,PHP,HTML,JS', 'Online Course Purchase and Sale Management Laravel App', 'Online Course Purchase and Sale Management Laravel App', '2023-09-21 06:17:28', '2023-09-25 11:24:02'),
(13, '13', 'en', 'Construction service management software', '<p>EfficientBuild Pro is the ultimate construction service management software designed to revolutionize how construction companies operate. Whether you\'re a small, family-owned business or a large-scale construction firm, our software is tailored to meet your unique needs and elevate your construction service sales to new heights.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Project Planning and Tracking: EfficientBuild Pro simplifies project management with powerful tools for planning, scheduling, and tracking construction projects. Visualize your project timeline, allocate resources, and ensure on-time project completion.</li>\r\n<li>Client Relationship Management: Strengthen client relationships with our CRM module. Manage leads, communicate with clients, and track interactions to convert leads into loyal customers.</li>\r\n<li>Estimating and Bidding: Create accurate estimates and competitive bids effortlessly. Our software streamlines the estimating process, helping you win more projects while maximizing profitability.</li>\r\n<li>Financial Management: Take control of your finances with integrated accounting tools. Track expenses, manage invoices, and generate financial reports to keep your business in top financial shape.</li>\r\n<li>Resource Allocation: Efficiently assign equipment, materials, and labor to projects. Avoid overbooking and underutilization, optimizing your resources for better profitability.</li>\r\n<li>Inventory and Supply Chain: Manage your construction materials and supplies seamlessly. Monitor stock levels, reorder materials, and reduce waste with real-time inventory tracking.</li>\r\n<li>Document Management: Say goodbye to paperwork chaos. Store, organize, and share project documents, blueprints, and contracts securely within the software.</li>\r\n<li>Mobile Accessibility: Access your construction service management tools on the go. Our mobile app ensures that you stay connected to your projects and team, no matter where you are.</li>\r\n<li>Reporting and Analytics: Make data-driven decisions with advanced reporting and analytics features. Gain insights into project performance, financial trends, and customer preferences.</li>\r\n<li>User-Friendly Interface: EfficientBuild Pro is designed with simplicity in mind. Enjoy a user-friendly interface that requires minimal training for your team to get started.</li>\r\n<li>Customization: Tailor the software to your company\'s unique processes and branding. Customizable templates and workflows ensure that EfficientBuild Pro aligns perfectly with your business.</li>\r\n<li>Security and Compliance: Rest easy knowing your data is secure. Our software complies with industry standards and provides robust security features to protect your sensitive information.</li>\r\n</ul>\r\n<p>EfficientBuild Pro is your partner in achieving construction service management excellence. Boost your sales, streamline operations, and take your construction business to the next level. Experience the difference today!&nbsp;Request a demo to see how EfficientBuild Pro can transform your construction service management and help you reach new heights of success.</p>\r\n<p>Payment Methods:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Construction,service,PHP,Laravel,management software', 'Construction service management software', 'Construction service management software', '2023-09-21 06:51:19', '2023-09-25 11:25:49'),
(14, '14', 'en', 'Artificial intelligence - AI Writer & Copywriting Laravel app', '<p>In today\'s digital age, content is king, and businesses across the globe are constantly striving to create compelling and persuasive copy that captivates their target audience. This is where our revolutionary AI Writer &amp; Copywriting Laravel app steps in, ready to transform your content creation process and elevate your brand to new heights.</p>\r\n<p>Our AI-powered solution harnesses the limitless potential of artificial intelligence to assist you in crafting high-quality, engaging, and persuasive written content for your business. Whether you\'re an e-commerce platform, a marketing agency, a content creator, or a blogger, our Laravel-based application is tailored to meet your specific needs and enhance your content marketing efforts.</p>\r\n<p>In conclusion, our AI Writer &amp; Copywriting Laravel app is not just a tool; it\'s a game-changer. Elevate your content strategy, save time, and produce outstanding copy that resonates with your audience. Whether you\'re a small startup or a large enterprise, our solution is designed to empower you on your content creation journey. Get ready to unlock the full potential of your brand\'s voice and storytelling with the help of AI.</p>\r\n<p>Try our AI Writer &amp; Copywriting Laravel app today and experience the future of content creation!\"</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>AI-Powered Copywriting: Say goodbye to writer\'s block and hello to limitless creativity. Our AI Writer generates content that is not only well-researched but also tailored to your brand\'s unique voice and style.</li>\r\n<li>Efficiency and Time Savings: With our AI Writer &amp; Copywriting Laravel app, you can create content faster than ever before. No more hours spent staring at a blank screen; our AI effortlessly generates content, saving you time and allowing you to focus on other critical aspects of your business.</li>\r\n<li>High-Quality Results: Quality is never compromised. Our AI Writer ensures that every piece of content it generates is accurate, engaging, and free from grammatical errors, making it ready for immediate publication.</li>\r\n<li>Customization and Control: You\'re in the driver\'s seat. Customize the AI\'s output to match your specific requirements, whether you need product descriptions, blog posts, email newsletters, or social media updates. Our Laravel app gives you full control.</li>\r\n<li>Seamless Integration: Our Laravel-based solution seamlessly integrates into your existing workflow, making it easy for your team to collaborate and generate content effortlessly.</li>\r\n<li>Content Scaling: As your content needs grow, so does our AI\'s capability. Scale your content production effortlessly without compromising on quality.</li>\r\n<li>Cost-Effective: Forget about the high costs associated with hiring content writers. Our AI Writer &amp; Copywriting Laravel app offers a cost-effective solution to your content needs.</li>\r\n<li>Data Security: We understand the importance of data security. Your content and data are protected with the highest standards of security and encryption.</li>\r\n</ul>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Artificial ,intelligence,Artificial intelligence,Laravel app,PHP', 'Artificial intelligence - AI Writer & Copywriting Laravel app', 'Artificial intelligence - AI Writer & Copywriting Laravel app', '2023-09-21 07:07:19', '2023-09-25 11:29:46'),
(15, '15', 'en', 'School Management Inventory Laravel Software', '<p>Introducing our cutting-edge School Management Inventory Laravel Software, the ultimate solution for educational institutions seeking streamlined management of their inventory and resources. Designed with the specific needs of schools in mind, our software empowers educators and administrators with powerful tools to efficiently track, manage, and optimize their inventory, supplies, and assets.</p>\r\n<p>Say goodbye to inventory mismanagement and asset tracking headaches. With our School Management Inventory Laravel Software, you can focus on what truly matters: providing a high-quality education while efficiently managing your school\'s resources. Join countless educational institutions that have already experienced the benefits of our comprehensive solution. Revolutionize your school\'s inventory and asset management today!</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Inventory Tracking: Keep a precise record of all school supplies, equipment, and resources. Monitor quantities, track usage, and set up automatic reorder alerts to ensure you\'re always well-stocked.</li>\r\n<li>User-Friendly Interface: Our intuitive, user-friendly interface makes it easy for both educators and administrators to navigate and use the software without extensive training.</li>\r\n<li>Asset Management: Effectively manage and maintain school assets such as computers, projectors, textbooks, and more. Track asset locations, maintenance schedules, and depreciation.</li>\r\n<li>Supplier Management: Keep track of your suppliers, their contact information, and purchase history. Streamline the procurement process and negotiate better deals with reliable data.</li>\r\n<li>Real-Time Reporting: Generate detailed reports on inventory levels, asset utilization, procurement expenses, and more. Access real-time insights to make informed decisions.</li>\r\n<li>Barcode Integration: Save time and reduce errors with barcode scanning capabilities. Easily update inventory and asset information with a simple scan.</li>\r\n<li>Security and Permissions: Control access to sensitive data with role-based permissions. Ensure that only authorized personnel can view or modify critical information.</li>\r\n<li>Multi-Location Support: Ideal for school districts with multiple campuses, our software seamlessly manages inventory and assets across various locations.</li>\r\n<li>Cloud-Based or Self-Hosted: Choose the deployment option that suits your institution\'s needs, whether it\'s cloud-based for convenience or self-hosted for enhanced data control.</li>\r\n<li>Scalability: Grow with confidence. Our software is designed to scale with your institution, accommodating increased inventory and asset management needs as your school expands.</li>\r\n<li>Responsive Support: Benefit from responsive customer support and regular software updates to ensure your institution always has access to the latest features and security enhancements.</li>\r\n</ul>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'School Management,Inventory ,Laravel ,Software,PHP', 'School Management Inventory Laravel Software', 'School Management Inventory Laravel Software', '2023-09-21 07:49:41', '2023-09-25 11:32:28');
INSERT INTO `product_languages` (`id`, `product_id`, `lang_code`, `name`, `description`, `tags`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(16, '16', 'en', 'Aabcserv - Multivendor On-Demand Service & Handyman Marketplace Flutter Seller App', '<p>Aabcserv &ndash; Multivendor On-Demand Service &amp; Handyman Marketplace Flutter Seller App is the ultimate solution for sellers who want to take their on-demand service and handyman marketplace to the next level. This Aabcserv &ndash; Multivendor On-Demand Service &amp; Handyman Marketplace Flutter Seller App Ui Kit is a powerful and user-friendly tool designed specifically for sellers who want to easily manage their business on the go. With Aabcserv &ndash; Multivendor On-Demand Service &amp; Handyman Marketplace Flutter Seller App Ui Kit, sellers can quickly and easily add new services, update existing ones, and manage their orders all from one convenient location. This powerful seller app is fully customizable, so you can easily tailor it to fit your specific needs.</p>\r\n<p>Aabcserv &ndash; Multivendor On-Demand Service &amp; Handyman Marketplace Flutter Seller App is built on the Flutter framework, which means it&rsquo;s fast, reliable, and easy to use. It features a modern and intuitive user interface that&rsquo;s designed to make managing your service marketplace as easy and straightforward as possible. Aabcserv &ndash; Multivendor On-Demand Service &amp; Handyman Marketplace Flutter Seller App Ui Kit is a multivendor app, which means that you can easily onboard multiple sellers onto your platform. This makes it the perfect solution for anyone who wants to create a thriving service marketplace with multiple vendors.</p>\r\n<p>Features:</p>\r\n<ul>\r\n<li>Flutter Version 3.0</li>\r\n<li>40+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>AYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Aabcserv ,Multivendor ,On-Demand,Laravel,PHP', 'Aabcserv - Multivendor  Service & Handyman Marketplace Flutter Seller App', 'Aabcserv - Multivendor On-Demand Service & Handyman Marketplace Flutter Seller App', '2023-09-21 09:25:54', '2023-10-01 08:56:31'),
(17, '17', 'en', 'Shopo eCommerce - Multivendor eCommerce Flutter Seller App', '<p>Shopo eCommerce is a cutting-edge Multivendor eCommerce Flutter Seller App that empowers entrepreneurs, small businesses, and independent sellers to establish and grow their online presence with ease. This versatile and feature-rich app provides a seamless platform for sellers to showcase their products, manage inventory, connect with customers, and boost sales in the competitive world of online commerce.</p>\r\n<p>Shopo eCommerce is your one-stop solution for venturing into the world of multivendor eCommerce. It empowers sellers to harness the full potential of online retailing, providing the tools and features needed to succeed in a dynamic and competitive marketplace. Download the app today and embark on your journey to eCommerce success!</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-Friendly Interface: Shopo eCommerce offers an intuitive and user-friendly interface that simplifies the process of setting up an online store. Sellers can effortlessly create and customize their storefronts to reflect their brand identity.</li>\r\n<li>Multivendor Support: The app supports multiple sellers, allowing a diverse range of products to be offered in one marketplace. Sellers can manage their individual inventories, pricing, and orders conveniently.</li>\r\n<li>Product Management: Easily add, edit, or delete products from your store with just a few taps. Organize products into categories for a structured shopping experience.</li>\r\n<li>Order Management: Efficiently handle customer orders, track shipments, and manage returns from within the app. Keep customers informed about the status of their orders for improved satisfaction.</li>\r\n<li>Payment Integration: Shopo eCommerce integrates with various payment gateways to ensure secure and hassle-free transactions. Sellers receive payments directly to their accounts.</li>\r\n<li>Customer Engagement: Stay connected with your customers through in-app messaging and notifications. Respond to inquiries promptly and build lasting relationships.</li>\r\n<li>Analytics and Reports: Gain valuable insights into your business performance with detailed analytics and sales reports. Use this data to make informed decisions and optimize your strategies.</li>\r\n<li>SEO-Friendly: Increase your store\'s visibility on search engines with built-in SEO tools. Improve your chances of attracting organic traffic and potential customers.</li>\r\n<li>Security: Shopo eCommerce prioritizes the security of your data and transactions. It employs robust security measures to protect sensitive information.</li>\r\n<li>Customization: Tailor your store\'s appearance and functionality to match your brand\'s unique identity. Choose from a variety of themes and templates to create a personalized shopping experience.</li>\r\n<li>Scalability: Whether you\'re just starting or already established, Shopo eCommerce scales with your business. Grow your product catalog and expand your customer base effortlessly.</li>\r\n<li>24/7 Support: Count on our dedicated support team to assist you with any questions or issues you may encounter along the way.</li>\r\n</ul>\r\n<p>Seller App Features:</p>\r\n<ul>\r\n<li>35+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Shopo ,Multivendor eCommerce,Flutter Seller App,PHP,JS', 'Shopo eCommerce - Multivendor eCommerce Flutter Seller App', 'Shopo eCommerce - Multivendor eCommerce Flutter Seller App', '2023-09-21 09:45:59', '2023-09-25 11:36:47'),
(18, '18', 'en', 'Minimoll - Fashion eCommerce Flutter App', '<p>Minimoll is more than just a fashion eCommerce app; it\'s your passport to a world of style and sophistication. With our user-friendly Flutter-based application, you can immerse yourself in the latest fashion trends, discover unique clothing pieces, and elevate your wardrobe like never before.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Trendsetting Collections: Stay ahead of the fashion curve with our curated collections, featuring the hottest styles, from casual wear to high-end fashion.</li>\r\n<li>Personalized Recommendations: Our smart algorithm learns your preferences and suggests clothing items that match your unique style, ensuring a tailored shopping experience.</li>\r\n<li>Seamless Shopping: Effortlessly browse through a wide range of clothing, accessories, and footwear, and shop securely with our intuitive interface.</li>\r\n<li>Exclusive Offers: Access exclusive discounts and promotions, making it easy to indulge in your favorite fashion brands without breaking the bank.</li>\r\n<li>Wishlist and Favorites: Save your favorite items to your wishlist for easy access and quick purchasing.</li>\r\n<li>Virtual Try-On: Visualize how outfits will look on you with our virtual try-on feature, helping you make confident choices.</li>\r\n<li>Fast and Secure Checkout: Enjoy a hassle-free shopping experience with our secure payment options and quick checkout process.</li>\r\n<li>Real-time Updates: Stay informed about the latest arrivals, restocks, and sales with real-time notifications.</li>\r\n<li>Customer Reviews: Make informed decisions by reading reviews and ratings from other fashion-savvy shoppers.</li>\r\n<li>24/7 Customer Support: Our dedicated support team is available round the clock to assist you with any queries or concerns.</li>\r\n</ul>\r\n<p>Join the Minimoll fashion community today and redefine your style journey. Download our Flutter app and experience fashion at your fingertips like never before!</p>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Minimoll ,Fashion ,eCommerce ,Laravel,HTML,PHP', 'Minimoll - Fashion eCommerce Flutter App', 'Minimoll - Fashion eCommerce Flutter App', '2023-09-21 10:07:33', '2023-09-25 11:41:17'),
(19, '19', 'en', 'Multi-Branch Restaurant Management Software', '<p>In today\'s dynamic restaurant industry, managing multiple branches efficiently is crucial for success. Our Multi-Branch Restaurant Management Software is designed to streamline and optimize operations for restaurant chains, making it easier than ever to oversee multiple locations seamlessly.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Centralized Management: Gain complete control over all your restaurant branches from a single, user-friendly dashboard. Monitor sales, inventory, staff performance, and customer feedback across all locations in real-time.</li>\r\n<li>Menu Synchronization: Ensure consistency in menu offerings and pricing across all branches. Update menus, specials, and pricing effortlessly, and instantly sync changes to every location.</li>\r\n<li>Inventory Management: Track inventory levels and order supplies efficiently. Receive alerts when stock is low and automate restocking processes, reducing waste and saving money.</li>\r\n<li>Employee Management: Manage staff scheduling, payroll, and performance evaluations centrally. Easily assign roles and responsibilities for each branch and access attendance records with ease.</li>\r\n<li>Sales Analytics: Gain valuable insights into your restaurant\'s performance with robust reporting and analytics tools. Identify trends, best-sellers, and areas for improvement to make informed decisions.</li>\r\n<li>Customer Engagement: Implement loyalty programs, feedback collection, and customer communication strategies to enhance the customer experience and build lasting relationships.</li>\r\n<li>Table Reservation and Waitlist: Allow customers to make reservations online and manage walk-in guests efficiently. Reduce wait times and improve table turnover rates.</li>\r\n<li>Integration Capabilities: Seamlessly integrate with popular POS systems, payment gateways, and third-party delivery platforms to enhance operational efficiency and offer more convenience to customers.</li>\r\n<li>Security and Compliance: Ensure data security and compliance with industry standards. Protect sensitive customer information and maintain the trust of your clientele.</li>\r\n<li>Scalability: As your restaurant chain grows, our software can scale with you. Add new branches with ease and maintain consistent management practices.</li>\r\n<li>Support and Training: Access comprehensive training and 24/7 customer support to assist with any technical issues or questions that may arise.</li>\r\n</ul>\r\n<p>Streamline your restaurant chain\'s operations, reduce overhead costs, and enhance the overall customer experience with our Multi-Branch Restaurant Management Software. Whether you have two branches or twenty, our solution empowers you to focus on what matters most &ndash; delivering exceptional food and service while maximizing profitability.</p>', 'Multi-Branch,Restaurant Management,Software,PHP,Laravel', 'Multi-Branch Restaurant Management Software', 'Multi-Branch Restaurant Management Software', '2023-09-21 10:21:36', '2023-09-25 11:43:17'),
(20, '20', 'en', 'Single-Branch Restaurant Management Software', '<p>Elevate your restaurant\'s operational prowess with our cutting-edge Single-Branch Restaurant Management Software. Seamlessly designed to cater specifically to the unique needs of independent restaurants, cafes, and eateries, this software is your ultimate solution for optimizing every facet of your establishment.</p>\r\n<p>Say goodbye to the chaos of manual processes, cumbersome spreadsheets, and fragmented systems. Our Single-Branch Restaurant Management Software streamlines your daily operations, from inventory management and staff scheduling to table reservations and customer engagement, all within a single, user-friendly platform.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Inventory Control: Effortlessly manage your ingredients, track stock levels, and receive real-time alerts for low inventory, ensuring you never run out of essential items.</li>\r\n<li>Sales and Revenue Analytics: Gain insights into your restaurant\'s performance with detailed analytics, helping you make data-driven decisions to boost profits.</li>\r\n<li>Table and Reservation Management: Easily handle table bookings, walk-ins, and waitlists, ensuring optimal table turnover and customer satisfaction.</li>\r\n<li>Menu Customization: Update your menu items, prices, and descriptions in real-time, allowing you to adapt to changing trends and customer preferences.</li>\r\n<li>Staff Scheduling: Create efficient staff schedules, track employee hours, and manage payroll effortlessly, reducing labor costs while maintaining service quality.</li>\r\n<li>Customer Relationship Management (CRM): Build lasting relationships with your patrons by collecting and analyzing customer data, enabling personalized marketing campaigns and loyalty programs.</li>\r\n<li>Point of Sale (POS) Integration: Seamlessly connect your POS system to streamline order processing, payment, and inventory updates.</li>\r\n<li>Security and Data Protection: Ensure the safety of your sensitive data and customer information with robust security measures and compliance with industry standards.</li>\r\n<li>Mobile Accessibility: Access critical restaurant data from anywhere with our mobile app, allowing you to stay in control even when you\'re not on-site.</li>\r\n<li>Customer Feedback: Gather valuable feedback through digital surveys and reviews, enabling you to continuously improve your service and offerings.</li>\r\n</ul>\r\n<p>Experience the transformational power of our Single-Branch Restaurant Management Software and witness your establishment flourish. Whether you run a cozy neighborhood bistro, a trendy cafe, or a fine dining establishment, our software is tailored to enhance efficiency, increase profitability, and provide an exceptional dining experience that keeps customers coming back for more. It\'s time to unleash the full potential of your restaurant\'s success.</p>', 'Single-Branch,Restaurant Management,App,PHP,Laravel', 'Single-Branch Restaurant Management Software', 'Single-Branch Restaurant Management Software', '2023-09-21 11:01:30', '2023-10-01 08:54:54'),
(21, '21', 'en', 'Apps Premium Landing Theme', '<p>The \"Apps Premium Landing Theme\" is a meticulously crafted and visually stunning web design template tailored specifically for showcasing mobile applications, software products, or digital services. It represents the pinnacle of design excellence and user engagement, making it an ideal choice for developers, startups, and businesses aiming to make a striking online presence.</p>\r\n<p>In summary, the \"Apps Premium Landing Theme\" is a versatile and visually captivating template designed to help you promote your mobile application or digital product effectively. With its range of features, customization options, and responsive design, it empowers you to create a compelling online presence that converts visitors into loyal users.</p>\r\n<p>Please note that this description is a generic representation and may not accurately reflect the features or specifics of a particular premium landing theme available in 2023. To get detailed information about a specific theme, I recommend visiting the official website of the theme provider or contacting their support for the latest and most accurate details.</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Sleek and Modern Design: Our theme boasts a sleek and modern design that instantly captures visitors\' attention. Its clean layout, vibrant colors, and intuitive navigation ensure a memorable first impression.</li>\r\n<li>Responsive and Mobile-Friendly: In today\'s mobile-centric world, your landing page must look flawless on all devices. The Apps Premium Landing Theme is fully responsive, guaranteeing a seamless experience on smartphones, tablets, and desktops.</li>\r\n<li>App Showcase: Highlight your app\'s features, screenshots, and benefits elegantly. Customizable sections allow you to present your app\'s functionality in a way that resonates with your target audience.</li>\r\n<li>Smooth Animations: Engage users with smooth animations and transitions that add a touch of interactivity to your landing page. These animations are designed to enhance user engagement and create a memorable browsing experience.</li>\r\n<li>Call-to-Action (CTA) Elements: Strategically placed CTA buttons and forms encourage visitors to take action, whether it\'s downloading your app, signing up for a newsletter, or making a purchase.</li>\r\n<li>Testimonials and Social Proof: Build trust with potential users through client testimonials, user reviews, and trust badges that highlight your app\'s credibility and reliability.</li>\r\n<li>Integration-ready: Seamlessly integrate with popular email marketing tools, analytics platforms, and social media networks to track user interactions and reach a broader audience.</li>\r\n<li>SEO Optimized: The theme is optimized for search engines, ensuring your landing page ranks well in search results, driving organic traffic to your app or product.</li>\r\n<li>Customization Options: Tailor the theme to match your brand identity with easy-to-use customization options, including color schemes, fonts, and layout variations.</li>\r\n<li>Dedicated Support: Our customer support team is ready to assist you with any questions or issues you may encounter while setting up and using the Apps Premium Landing Theme.</li>\r\n</ul>', 'Apps ,Premium ,Landing ,Theme,Laravel,Shopify,PHP', 'Apps Premium Landing Theme', 'Apps Premium Landing Theme', '2023-09-21 11:25:30', '2023-09-21 11:25:30'),
(22, '22', 'en', 'Oifolio-Digital Marketing Theme', '<p>\"Oifolio-Digital Marketing Theme: Elevate Your Online Presence with a Powerful and Versatile WordPress Theme\"</p>\r\n<p>In today\'s digital landscape, establishing a strong online presence is crucial for businesses and individuals alike. Whether you\'re a seasoned digital marketer, a budding entrepreneur, or a creative professional, the right digital marketing theme can make all the difference in showcasing your brand, products, or services effectively. That\'s where Oifolio-Digital Marketing Theme comes into play.</p>\r\n<p>Oifolio is not just another WordPress theme; it\'s a comprehensive solution designed to empower you with the tools and features needed to excel in the competitive world of digital marketing. This theme is the culmination of years of industry experience, expert design, and user-focused development, making it the ideal choice for anyone looking to harness the full potential of their online presence.</p>\r\n<p>Key Features of Oifolio-Digital Marketing Theme:</p>\r\n<ul>\r\n<li>Responsive Design: Oifolio is fully responsive, ensuring that your website looks stunning on all devices, from desktop computers to smartphones and tablets. This feature is essential for capturing and engaging your audience, regardless of how they access your site.</li>\r\n<li>Versatile Layout Options: With Oifolio, you have access to a wide range of layout options, allowing you to customize your website to suit your unique needs. Whether you want a sleek and modern design or a more traditional look, Oifolio has you covered.</li>\r\n<li>SEO-Friendly: Oifolio is built with search engine optimization (SEO) in mind. It includes features and tools that help improve your website\'s visibility in search engine results, helping you reach a wider audience and attract more visitors.</li>\r\n<li>Speed and Performance: Slow-loading websites can drive visitors away. Oifolio is optimized for speed and performance, ensuring that your site loads quickly and provides an excellent user experience.</li>\r\n<li>Integration with Marketing Tools: Oifolio seamlessly integrates with popular digital marketing tools, allowing you to implement your marketing strategies with ease. Whether it\'s email marketing, social media integration, or analytics, Oifolio has you covered.</li>\r\n<li>Customization Options: Personalize your website with ease using Oifolio\'s extensive customization options. You can change colors, fonts, layouts, and more to create a website that reflects your brand identity perfectly.</li>\r\n<li>Dedicated Support: When you choose Oifolio, you\'re not just getting a theme; you\'re getting a dedicated support team ready to assist you with any questions or issues you may encounter.</li>\r\n</ul>\r\n<p>In summary, Oifolio-Digital Marketing Theme is the ultimate choice for those who understand the importance of a strong online presence. It offers a wide range of features and customization options to help you create a website that not only looks great but also drives results. Elevate your digital marketing efforts with Oifolio and take your online presence to the next level.</p>', 'Oifolio,Digital Marketing,Theme,Shopify,PHP,JS,HTML', 'Oifolio-Digital Marketing Theme', 'Oifolio-Digital Marketing Theme', '2023-09-21 11:38:15', '2023-09-21 11:38:15'),
(23, '23', 'en', 'Saas Landing Software Theme', '<p>Creating a captivating and effective Software as a Service (SaaS) landing page is crucial for capturing your target audience\'s attention and converting visitors into customers. To achieve this, you need a meticulously crafted SaaS landing software theme that not only showcases your product\'s features but also conveys your brand\'s identity and value proposition.</p>\r\n<p>Our SaaS landing software theme is designed to meet these exact needs. With a sleek and modern design, it ensures that your SaaS product shines in the digital landscape. Here\'s what you can expect from our theme</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Visually Stunning: Our theme incorporates eye-catching graphics, elegant typography, and a clean layout to make your SaaS offering visually appealing. It\'s designed to create a lasting first impression that encourages visitors to explore further.</li>\r\n<li>Responsive Design: In today\'s mobile-driven world, your landing page needs to look and function flawlessly on various devices and screen sizes. Our theme is fully responsive, guaranteeing a seamless user experience on smartphones, tablets, and desktops.</li>\r\n<li>User-Friendly: We prioritize user-friendliness, ensuring that your visitors can effortlessly navigate your landing page, learn about your software\'s features, and take desired actions, such as signing up for a trial or subscribing to your service.</li>\r\n<li>Customization Options: Tailoring your landing page to match your brand\'s identity is essential. Our theme offers customization options, allowing you to tweak colors, fonts, and imagery to align with your brand guidelines.</li>\r\n<li>Conversion-Driven: Ultimately, your landing page\'s success depends on its ability to convert visitors into customers. Our theme is designed with conversion optimization in mind, utilizing proven techniques to encourage sign-ups, inquiries, or purchases.</li>\r\n<li>SEO-Friendly: To ensure your landing page ranks well in search engines, we\'ve integrated SEO best practices into the theme. This helps improve your visibility and attract organic traffic.</li>\r\n<li>Integration Ready: Whether you need to integrate with third-party tools, payment gateways, or analytics platforms, our theme supports seamless integration, ensuring your SaaS landing page functions as part of your broader tech ecosystem.</li>\r\n<li>Performance-Oriented: Slow-loading pages can drive visitors away. Our theme is optimized for speed and performance to keep your bounce rate low and your engagement high.</li>\r\n</ul>\r\n<p>In summary, our SaaS landing software theme is the ideal choice for those looking to make a powerful impression in the competitive world of software-as-a-service. It combines stunning visuals, usability, and conversion-focused design to help you achieve your business goals. With our theme, your SaaS product will have the online presence it deserves, attracting and retaining customers effectively.</p>', 'Saas ,Landing ,Software,Theme,Joomla,Shopify,PHP,JS,HTML', 'Saas Landing Software Theme', 'Saas Landing Software Theme', '2023-09-21 11:44:15', '2023-10-01 08:54:00'),
(24, '1', 'bn', 'Homeco - রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপ অ্যাডমিন প্যানেল সহ', '<p>Homeco &ndash; রিয়েল এস্টেট ডিরেক্টরি তালিকা ফ্লাটার অ্যাপ</p>\r\n<p>Homeco - রিয়েল এস্টেট ডিরেক্টরি তালিকা ফ্লাটার অ্যাপটি একটি রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ওয়েবসাইট বা কোম্পানির মূল বৈশিষ্ট্যগুলির উপর ভিত্তি করে ডিজাইন এবং বিকাশ করা হয়েছে। হোমকো-তে রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপ ব্যবহারকারী এবং এজেন্ট উভয়ই অংশ নিতে এবং পাশে ব্যবহার করতে পারে। এই হোমকো - রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপ আধুনিক বৈশিষ্ট্য এবং অ্যামিনিতে পূর্ণ।</p>\r\n<p>Homeco &ndash; রিয়েল এস্টেট ডিরেক্টরি তালিকা ফ্লাটার অ্যাপ রিয়েল এস্টেট ডিরেক্টরি, লারাভেল রিয়েল এস্টেট, রিয়েল এস্টেট স্ক্রিপ্ট, তালিকা ব্যবস্থাপনা, সম্পত্তি ডিরেক্টরি, রিয়েল এস্টেট তালিকা, লারাভেল তালিকা স্ক্রিপ্ট, সম্পত্তি তালিকা প্ল্যাটফর্ম, ডিরেক্টরি তালিকা সমাধান, রিয়েল এস্টেট মার্কেটপ্লেস, এর জন্য সবচেয়ে উপযুক্ত। লারাভেল ডিরেক্টরি স্ক্রিপ্ট, লিস্টিং ম্যানেজমেন্ট সিস্টেম, প্রপার্টি লিস্টিং ডিরেক্টরি, রিয়েল এস্টেট ডিরেক্টরি স্ক্রিপ্ট, লারাভেল রিয়েল এস্টেট মার্কেটপ্লেস</p>\r\n<p>হোমকো &ndash; রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপের বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>Flutter Version 3</li>\r\n<li>45+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>Homeco &ndash; Real Estate Directory listing Flutter App PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Homeco ,Real Estate,Flutter App,PHP,Laravel', 'Homeco - রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপ অ্যাডমিন প্যানেল সহ', 'Homeco - রিয়েল এস্টেট ডিরেক্টরি তালিকাভুক্ত ফ্লাটার অ্যাপ অ্যাডমিন প্যানেল সহ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(25, '2', 'bn', 'ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপ', '<p>ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপ</p>\r\n<p>ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপটি লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইটের জন্য একটি চমৎকারভাবে ডিজাইন করা ব্যবহারকারী অ্যাপ। অত্যন্ত যত্ন সহকারে তৈরি করা হয়েছে এবং অত্যাধুনিক ফ্লুটার অ্যাপ প্রযুক্তি এবং ডিজাইনের প্রবণতা ব্যবহার করে তৈরি করা হয়েছে, এই অ্যাপটি, ShopUs - Laravel Multivendor Fashion eCommerce ওয়েবসাইট ব্যবহারকারী অ্যাপ নামে পরিচিত, এটি অনলাইন খুচরা ব্যবসায় নিযুক্ত বিভিন্ন ব্যবসার জন্য একটি আদর্শ সমাধান। এটি ইকমার্স, ইলেকট্রনিক্স, মুদি, বা অন্য যেকোন পণ্য যা অনলাইনে বিক্রি করা যেতে পারে, এই মাল্টিভেন্ডর ইকমার্স ফ্লাটার অ্যাপটি পরিপূর্ণতার সাথে বিভিন্ন চাহিদা পূরণ করে।</p>\r\n<p>The ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপটি অনেকগুলি বৈশিষ্ট্য অফার করে যা এটিকে ইকমার্স শিল্পের শীর্ষ প্রতিযোগীদের মধ্যে একটি হিসাবে অবস্থান করে। এই ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপটি খাদ্য, মুদি এবং ইকমার্স সেক্টরের জন্য বিশেষভাবে তৈরি করা হয়েছে। এর আধুনিক এবং পরিষ্কার UI ডিজাইন, iOS এবং Android উভয় প্ল্যাটফর্মের জন্য উপলব্ধ, জটিলভাবে বিস্তারিত। কাস্টমাইজযোগ্য স্ক্রিনের সাথে, এই অ্যাপটি ব্যতিক্রমী নমনীয়তা এবং ব্যবহারকারী-বান্ধব ইন্টারফেস প্রদান করে, যা আপনাকে অনায়াসে আপনার প্রকল্পে চূড়ান্ত স্পর্শ যোগ করতে সক্ষম করে।</p>\r\n<p>ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপ বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>45+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>ShopUs &ndash; Laravel Multivendor Fashion eCommerce Website User App PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'ShopUs ,Laravel Multivendor, eCommerce ,Laravel,PHP,HTML', 'ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপ', 'ShopUs - লারাভেল মাল্টিভেন্ডর ফ্যাশন ইকমার্স ওয়েবসাইট ব্যবহারকারী অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(26, '3', 'bn', 'ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ', '<p>&nbsp;</p>\r\n<p>ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট - CodeCanyon আইটেম বিক্রির জন্য<br>স্ক্রিনশট<br>ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ ইউআই কিট</p>\r\n<p>ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট হল ফুড অর্ডার এবং ডেলিভারি ব্যবসার জন্য একটি সম্পূর্ণ সমাধান। এই ফুডবারি ফ্লাটারে - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট আমাদের কাছে ফুড অর্ডারিং অ্যাপ, ইউজার অ্যাপ এবং ডেলিভারিম্যান অ্যাপ রয়েছে।</p>\r\n<p>ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট হল সেই সব ব্যবসার জন্য যারা রেস্টুরেন্ট বিজনেস, ইকমার্স বিজনেস, কোরিউয়ার এবং পার্সেল ব্যবসায় আছেন তাদের জন্য সবচেয়ে উপযুক্ত। ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট তৈরি করা হয়েছে খাবার, অর্ডার, অনলাইন অর্ডার, বুকিং, রিজার্ভেশন, ডেলিভারি এবং রান্নাঘরের ব্যবস্থাপনার জন্য।</p>\r\n<p>ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ Ui কিট বৈশিষ্ট্য:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>120+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>Image &amp; Fonts Credit:</p>\r\n<ul>\r\n<li>Unsplash</li>\r\n<li>Freepik</li>\r\n<li>Google Fonts</li>\r\n</ul>\r\n<p>NOTE:</p>\r\n<p>Images are not included in main downloadable file, images used only for demo purpose.</p>', 'FoodBari , Deliveryman ,Kitchen App, Flutter ,Laravel,PHP', 'ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ', 'ফুডবারি ফ্লাটার - ফুড অর্ডার, ডেলিভারিম্যান এবং কিচেন অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(27, '4', 'bn', 'JQB - জব ফাইন্ডিং ফ্লটার অ্যাপ ইউআই কিট', '<p>JQB &ndash; চাকরি খোঁজা ফ্লটার অ্যাপ ইউআই কিট</p>\r\n<p>JQB &ndash; জব ফাইন্ডিং ফ্লটার অ্যাপ Ui কিট একটি অনন্য এবং সবচেয়ে আপডেটেড চাকরি খোঁজার আইডিয়া নিয়ে আসে। এটি এজেন্সি এবং আবেদনকারীদের জন্যও উপযুক্ত। এটি Flutter and Its a Flutter App Ui Kit এর উপর ভিত্তি করে অথবা আপনি বলতে পারেন ফ্রন্ট এন্ড ফ্লাটার অ্যাপ</p>\r\n<p>JQB &ndash; জব ফাইন্ডিং ফ্লাটার অ্যাপ Ui কিট যেকোন ব্যবসার জন্য উপযুক্ত যারা অ্যান্ড্রয়েড, আইওএস, জব, জব অ্যাপ, জব বোর্ড, জব পোর্টাল, জব পোর্টাল অ্যাপ, জব সার্চ, মোবাইল, ইউআই কিট, ইউক্স-এর সাথে কাজ করছেন</p>\r\n<p>JQB - জব ফাইন্ডিং ফ্লাটার অ্যাপ UI কিট-এর মাধ্যমে আপনার চাকরি খোঁজার মোবাইল অ্যাপ প্রকল্পের সম্ভাব্যতা আনলক করুন। নির্ভুলতা এবং বিস্তারিত মনোযোগ দিয়ে তৈরি, JQB ডেভেলপার, ডিজাইনার এবং উদ্যোক্তাদের একটি অত্যাধুনিক কাজের সন্ধান এবং নিয়োগের প্ল্যাটফর্ম তৈরি করার ক্ষমতা দেয়।</p>\r\n<p>JQB-এর মাধ্যমে, আপনি সতর্কতার সাথে ডিজাইন করা UI উপাদান, উইজেট এবং টেমপ্লেটগুলির একটি শক্তিশালী ভাণ্ডারে অ্যাক্সেস পান, প্রতিটি আপনার অ্যাপের ব্যবহারকারীর অভিজ্ঞতা উন্নত করার জন্য তৈরি করা হয়েছে। আপনি চাকরি সন্ধানকারীদের জন্য একটি চাকরি অনুসন্ধান অ্যাপ্লিকেশন বা নিয়োগকারীদের জন্য একটি নিয়োগের প্ল্যাটফর্ম তৈরি করছেন না কেন, JQB আপনাকে একটি পালিশ এবং বৈশিষ্ট্য সমৃদ্ধ সমাধান সরবরাহ করার জন্য প্রয়োজনীয় সরঞ্জাম সরবরাহ করে।</p>\r\n<p>মুখ্য সুবিধা:</p>\r\n<p>মসৃণ ডিজাইন: JQB-এর আধুনিক এবং মার্জিত ডিজাইনের উপাদানগুলি নিশ্চিত করে যে আপনার অ্যাপটি ভিড়ের চাকরির বাজারে আলাদা।</p>\r\n<p>অনায়াসে কাস্টমাইজেশন: JQB এর সহজে কাস্টমাইজযোগ্য উপাদানগুলির জন্য ধন্যবাদ, আপনার ব্র্যান্ড এবং দৃষ্টির সাথে নির্বিঘ্নে মেলে UI-কে সাজান।</p>\r\n<p>ব্যবহারকারী-বান্ধব: JQB-এর স্বজ্ঞাত লেআউট এবং নেভিগেশন ব্যবহারকারীদের জন্য চাকরি খোঁজা, আবেদন করা এবং সম্ভাব্য নিয়োগকারীদের সাথে সংযোগ করা সহজ করে তোলে।</p>\r\n<p>সমৃদ্ধ কার্যকারিতা: কাজের তালিকা, আবেদনকারীর প্রোফাইল, উন্নত অনুসন্ধান ফিল্টার এবং আরও অনেক কিছুর মতো বৈশিষ্ট্যের একটি সম্পদ আনলক করুন, যা ব্যবহারকারীর ব্যস্ততা বাড়াতে ডিজাইন করা হয়েছে।</p>\r\n<p>ফ্লাটার-চালিত: ফ্লটারের শক্তি থেকে উপকৃত, একটি একক কোডবেস থেকে মোবাইল, ওয়েব এবং ডেস্কটপের জন্য স্থানীয়ভাবে সংকলিত অ্যাপ্লিকেশন তৈরি করার জন্য একটি বহুমুখী এবং দক্ষ কাঠামো।</p>\r\n<p>সময় এবং সম্পদ সংরক্ষণ করুন: আপনার বিকাশ প্রক্রিয়াকে ত্বরান্বিত করুন এবং JQB এর তৈরি উপাদান এবং টেমপ্লেটগুলির সাথে খরচ কমিয়ে দিন।</p>\r\n<p>আপনি একজন অভিজ্ঞ ডেভেলপার হোন যা আপনার প্রোজেক্টকে ত্বরান্বিত করতে চাইছেন বা একজন উদীয়মান উদ্যোক্তা চাকরি অনুসন্ধান শিল্পে উদ্যোগী হোন না কেন, JQB আপনাকে একটি পালিশ এবং কার্যকরী অ্যাপ তৈরি করার জন্য প্রয়োজনীয় ভিত্তি প্রদান করে। আপনার অ্যাপ ডেভেলপমেন্ট গেমকে উন্নত করুন এবং আজই JQB-এর সাথে শুরু করুন &ndash; চাকরি খোঁজার অ্যাপ বাজারে আপনার সাফল্যের পথ এখানে শুরু হয়</p>\r\n<p>ফিনকো - ফ্লটার মানি ম্যানেজমেন্ট অ্যাপ UI কিট বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>30+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'JQB ,Job Finding,Flutter App,Ui Kit,Laravel,PHP', 'JQB - জব ফাইন্ডিং ফ্লটার অ্যাপ ইউআই কিট', 'JQB - জব ফাইন্ডিং ফ্লটার অ্যাপ ইউআই কিট', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(28, '5', 'bn', 'FoodBari - ফ্লটার ফুড রেস্তোরাঁ শাখা, রান্না ও রান্নাঘরের অ্যাপ', '<p>\"FoodBari\" হল একটি সর্বাঙ্গীণ UI কিট যা রন্ধন জগতের অনন্য চাহিদা মেটাতে সতর্কতার সাথে তৈরি করা হয়েছে। আপনি একজন উচ্চাভিলাষী শেফ, আপনার ডিজিটাল উপস্থিতি প্রসারিত করতে চাইছেন এমন একজন রেস্তোরাঁর মালিক, অথবা খাদ্য-সম্পর্কিত অ্যাপস তৈরিকে স্ট্রিমলাইন করার লক্ষ্যে একজন বুদ্ধিমান ডেভেলপার হোন না কেন, FoodBari হল আপনার ব্যাপক সমাধান।</p>\r\n<p>এর মূলে, FoodBari হল একটি বহুমুখী টুলকিট যা খাদ্য শিল্পে ব্যবসা এবং ব্যক্তিদের ক্ষমতায়নের জন্য ডিজাইন করা হয়েছে। এটি গতিশীল এবং ব্যবহারকারী-বান্ধব মোবাইল অ্যাপ্লিকেশনগুলি তৈরি করার জন্য একটি বিস্তৃত সংস্থান এবং সরঞ্জাম সরবরাহ করে। FoodBari কে ব্যতিক্রমী করে তোলে তা এখানে:</p>\r\n<p>রেস্তোরাঁ শাখা ব্যবস্থাপনা: আপনার রেস্তোরাঁর শাখাগুলি অনায়াসে পরিচালনা করুন, মেনু, স্টাফ এবং গ্রাহকের অর্ডারগুলি তত্ত্বাবধান করে, সবকিছুই একটি স্বজ্ঞাত এবং সমন্বিত ইন্টারফেসের মধ্যে।</p>\r\n<p>রান্না এবং রেসিপি ইন্টিগ্রেশন: রেসিপি ডাটাবেস এবং রান্নার টিপস সহ, আপনার অ্যাপের বিষয়বস্তুকে সমৃদ্ধ করা এবং আপনার ব্যবহারকারীদের জন্য অমূল্য অন্তর্দৃষ্টি প্রদান সহ রন্ধনসম্পদের ভান্ডারে ট্যাপ করুন।</p>\r\n<p>রান্নাঘরের কার্যকারিতা সরঞ্জাম: অর্ডার ট্র্যাকিং, উপাদান ব্যবস্থাপনা, এবং কর্মপ্রবাহ অপ্টিমাইজেশনের মতো বৈশিষ্ট্যগুলির সাথে রান্নাঘরের ক্রিয়াকলাপগুলিকে উন্নত করুন, আপনার রন্ধনসম্পর্কিত প্রচেষ্টার দক্ষতা বৃদ্ধি করুন৷</p>\r\n<p>অত্যাশ্চর্য ইউজার ইন্টারফেস: ফুডবারি একটি দৃশ্যত চিত্তাকর্ষক এবং ব্যবহারকারী-বান্ধব ইন্টারফেস অফার করে, যা আপনার ব্র্যান্ডের পরিচয় এবং শৈলী অনুসারে তৈরি করার জন্য প্রস্তুত, একটি স্মরণীয় ব্যবহারকারীর অভিজ্ঞতা নিশ্চিত করে।</p>\r\n<p>ক্রস-প্ল্যাটফর্ম সামঞ্জস্যতা: একটি বৃহত্তর দর্শকদের কাছে আপনার নাগালের প্রসারিত করে, iOS এবং Android উভয় ডিভাইসেই নির্বিঘ্নে চালানো অ্যাপ্লিকেশনগুলি তৈরি করতে ফ্লটার ফ্রেমওয়ার্কের শক্তিকে কাজে লাগান৷</p>\r\n<p>প্রতিক্রিয়াশীল ডিজাইন: ফুডবারির UI উপাদানগুলি স্মার্টফোন এবং ট্যাবলেটগুলিতে একইভাবে একটি ব্যতিক্রমী ব্যবহারকারীর অভিজ্ঞতার গ্যারান্টি দিয়ে বিভিন্ন স্ক্রীন আকারের সাথে সুন্দরভাবে মানিয়ে নেয়।</p>\r\n<p>সহজ ইন্টিগ্রেশন: আপনার অ্যাপ ডেভেলপমেন্ট প্রজেক্টে FoodBari একত্রিত করা একটি হাওয়া, সুসংগঠিত কোড এবং ব্যাপক ডকুমেন্টেশনের জন্য ধন্যবাদ, আপনার মূল্যবান সময় এবং সংস্থান বাঁচায়।</p>\r\n<p>কাস্টমাইজেশনের বিকল্প: UI কিটটিকে আপনার সঠিক স্পেসিফিকেশন অনুযায়ী সাজান, রঙের স্কিম, টাইপোগ্রাফি এবং লেআউট কনফিগারেশনগুলিকে টুইক করার বিকল্প সহ, আপনার অ্যাপটি আপনার দৃষ্টিভঙ্গির সাথে পুরোপুরি সারিবদ্ধ হয়েছে তা নিশ্চিত করুন।</p>\r\n<p>সংক্ষেপে, FoodBari শুধুমাত্র একটি UI কিট নয়; খাবার, রেস্তোরাঁ, রান্না এবং রান্নাঘরের ক্ষেত্রে বৈশিষ্ট্য সমৃদ্ধ, দৃষ্টিনন্দন এবং অত্যন্ত কার্যকরী মোবাইল অ্যাপ্লিকেশন তৈরিতে এটি আপনার অপরিহার্য অংশীদার। এর বহুমুখী বৈশিষ্ট্য এবং ব্যাপক সরঞ্জামগুলির সাথে, FoodBari ব্যবসায়িক এবং বিকাশকারীদের ডিজিটাল অভিজ্ঞতা তৈরি করার ক্ষমতা দেয় যা রান্নার জগতের বিভিন্ন চাহিদা পূরণ করে, সব কিছুর সাথেই নিরবিচ্ছিন্ন ক্রস-প্ল্যাটফর্ম সামঞ্জস্য এবং একটি ব্যতিক্রমী ব্যবহারকারীর অভিজ্ঞতা নিশ্চিত করে। আজই FoodBari-এর সাথে আপনার রন্ধনসম্পর্কীয় উদ্যোগকে উন্নত করুন।</p>', 'FoodBari ,Restaurant Branch,Cooking ,Kitchen App,PHP,Laravel', 'FoodBari - ফ্লটার ফুড রেস্তোরাঁ শাখা, রান্না ও রান্নাঘরের অ্যাপ', 'FoodBari - ফ্লটার ফুড রেস্তোরাঁ শাখা, রান্না ও রান্নাঘরের অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(29, '6', 'bn', 'GoTour - ট্যুর এবং ভ্রমণের জন্য ফ্লাটার অ্যাপ', '<p>GoTour শুধু একটি মোবাইল অ্যাপ্লিকেশন নয়; এটি অবিশ্বাস্য ভ্রমণ অভিজ্ঞতার জগতে আপনার প্রবেশদ্বার। এই অত্যাধুনিক ফ্লাটার অ্যাপটি আপনি যেভাবে পৃথিবী অন্বেষণ করেন তাতে বিপ্লব ঘটানোর জন্য ডিজাইন করা হয়েছে। এর ব্যবহারকারী-বান্ধব ইন্টারফেস এবং শক্তিশালী বৈশিষ্ট্য সহ, GoTour আপনার অপরিহার্য ভ্রমণ সঙ্গী হতে প্রস্তুত।</p>\r\n<p>অনায়াসে নতুন এবং শ্বাসরুদ্ধকর গন্তব্যগুলি আবিষ্কার করার কল্পনা করুন, আপনার পছন্দ অনুসারে ব্যক্তিগতকৃত ভ্রমণের পরিকল্পনা করুন এবং ফ্লাইট, থাকার জায়গা এবং ক্রিয়াকলাপগুলির জন্য রিয়েল-টাইম বুকিং করুন - সবই একটি একক, স্বজ্ঞাত অ্যাপের মধ্যে৷ GoTour এই সব এবং আরো সম্ভব করে তোলে.</p>\r\n<p>আমাদের অ্যাপটি আপনার আগ্রহ এবং ভ্রমণের ইতিহাসের উপর ভিত্তি করে ব্যক্তিগতকৃত সুপারিশগুলি অফার করে মৌলিক বিষয়গুলির বাইরে চলে যায়৷ আপনি রোমাঞ্চকর অভিজ্ঞতার সন্ধানকারী একজন অ্যাডভেঞ্চারার হোন, স্থানীয় খাবারের স্বাদ নিতে আগ্রহী একজন খাদ্য উত্সাহী, বা একটি নতুন জায়গার ঐতিহ্যে নিজেকে নিমজ্জিত করতে চাইছেন এমন একজন সংস্কৃতি প্রেমী, GoTour আপনাকে কভার করেছে।</p>\r\n<p>কিন্তু GoTour শুধুমাত্র একক অনুসন্ধান সম্পর্কে নয়। এটি সহযাত্রীদের সাথে সংযোগ স্থাপন, অন্তর্দৃষ্টি ভাগ করে নেওয়া এবং একসাথে অবিস্মরণীয় স্মৃতি তৈরি করার একটি প্ল্যাটফর্ম। আপনি স্থানীয় দক্ষতায় ট্যাপ করতে পারেন এবং লুকানো রত্ন, অনন্য অভিজ্ঞতা এবং সাংস্কৃতিক নিমজ্জনের সুযোগ সম্পর্কে অভ্যন্তরীণ জ্ঞান অর্জন করতে পারেন যা আপনার যাত্রাকে সমৃদ্ধ করবে।</p>\r\n<p>আপনার নিরাপত্তা এবং সমর্থন সর্বাগ্রে, এবং GoTour আপনাকে একটি নিরাপদ এবং উদ্বেগ-মুক্ত অ্যাডভেঞ্চার নিশ্চিত করতে প্রয়োজনীয় ভ্রমণ তথ্য, জরুরি যোগাযোগ এবং রিয়েল-টাইম সতর্কতা প্রদান করে। এছাড়াও, আমাদের সমন্বিত ভ্রমণ জার্নাল আপনাকে আপনার ভ্রমণের প্রতিটি মুহূর্ত ক্যাপচার এবং লালন করতে দেয়।</p>\r\n<p>GoTour দিয়ে, আপনি শুধু ভ্রমণ করছেন না; আপনি একটি পরিবর্তনমূলক যাত্রা শুরু করছেন। এটি আপনার ভ্রমণ অভিজ্ঞতা উন্নত করার সময়, এবং এটি ঘটতে GoTour এখানে আছে. এখনই অ্যাপটি ডাউনলোড করুন এবং আপনার পরবর্তী অ্যাডভেঞ্চার শুরু করুন।</p>\r\n<p>GoTour - ফ্লটার অ্যাপের বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compitable</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Trnsition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'GoTour ,Tours and Travels,Flutter ,PHP,Laravel,HTML', 'GoTour - ট্যুর এবং ভ্রমণের জন্য ফ্লাটার অ্যাপ', 'GoTour - ট্যুর এবং ভ্রমণের জন্য ফ্লাটার অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(30, '7', 'bn', 'নোগো – ফ্লটার নন-ফাঞ্জিবল টোকেন মার্কেটপ্লেস অ্যাপ', '<p>নোগোর সাথে পরিচয় করিয়ে দিচ্ছি - ফ্লাটার প্ল্যাটফর্মে নন-ফাঞ্জিবল টোকেন (NFTs) এর বিশ্ব অন্বেষণের জন্য আপনার প্রধান গন্তব্য!</p>\r\n<p>অত্যাধুনিক ফ্লাটার ফ্রেমওয়ার্কের সাথে তৈরি আপনার NFT মার্কেটপ্লেস অ্যাপ নোগো-এর মাধ্যমে ডিজিটাল সংগ্রহযোগ্য, শিল্প এবং অনন্য ভার্চুয়াল সম্পদের উত্তেজনাপূর্ণ জগতে পা বাড়ান। সংগ্রাহক, শিল্পী এবং উত্সাহীদের জন্য একইভাবে একটি নিরবচ্ছিন্ন, ব্যবহারকারী-বান্ধব এবং দৃশ্যত চিত্তাকর্ষক প্ল্যাটফর্ম অফার করে, NFT-এর সাথে আপনি যেভাবে অভিজ্ঞতা এবং ইন্টারঅ্যাক্ট করেন তা পুনরায় সংজ্ঞায়িত করতে Nogo এখানে রয়েছে।</p>\r\n<p>মুখ্য সুবিধা:</p>\r\n<p>বিভিন্ন এনএফটি সংগ্রহ: ডিজিটাল আর্ট, সঙ্গীত, ভার্চুয়াল রিয়েল এস্টেট, ভার্চুয়াল পণ্য এবং আরও অনেক কিছুতে বিস্তৃত এনএফটিগুলির একটি বিস্তৃত এবং ক্রমবর্ধমান সংগ্রহে ডুব দিন। আপনার নখদর্পণে সৃজনশীলতা এবং উদ্ভাবনের একটি বিশ্ব অন্বেষণ করুন।</p>\r\n<p>আবিষ্কার করুন এবং অন্বেষণ করুন: নোগো আপনাকে আপনার আগ্রহের সাথে অনুরণিত এনএফটি খুঁজে পেতে সহায়তা করার জন্য স্বজ্ঞাত অনুসন্ধান এবং আবিষ্কার সরঞ্জাম সরবরাহ করে। আপনি বিরল সংগ্রহযোগ্য বা ট্রেন্ডিং ডিজিটাল শিল্পে থাকুন না কেন, আমরা আপনাকে কভার করেছি।</p>\r\n<p>সুরক্ষিত ওয়ালেট ইন্টিগ্রেশন: আপনার ডিজিটাল ট্রেজারগুলি সর্বোচ্চ সুরক্ষার যোগ্য৷ নোগো নির্বিঘ্নে সুরক্ষিত ডিজিটাল ওয়ালেটগুলিকে সংহত করে, আপনার NFT বিনিয়োগের নিরাপত্তা নিশ্চিত করে এবং আপনাকে আপনার সম্পদগুলি অনায়াসে পরিচালনা করতে দেয়।</p>\r\n<p>ক্রিয়েটর-ফোকাসড প্ল্যাটফর্ম: শিল্পী এবং নির্মাতাদের ক্ষমতায়ন করা নোগোর মিশনের মূল বিষয়। আমরা শিল্পীদের তাদের কাজ প্রদর্শন করতে, এক্সপোজার অর্জন করতে এবং বিশ্বব্যাপী দর্শকদের সাথে সংযোগ করার জন্য একটি উত্সর্গীকৃত স্থান প্রদান করি।</p>\r\n<p>অনায়াসে ট্রেডিং: NFT কেনা, বিক্রি এবং ট্রেড করা এত সহজ ছিল না। নোগো লেনদেন প্রক্রিয়াকে স্ট্রীমলাইন করে, আপনার পছন্দ অনুসারে পেমেন্টের বিভিন্ন বিকল্প প্রদান করে।</p>\r\n<p>রিয়েল-টাইম ইনসাইটস: রিয়েল-টাইম মার্কেট ডেটা এবং প্রবণতা সম্পর্কে অবগত থাকুন। নোগো আপনাকে দ্রুতগতির NFT বাজারে জ্ঞাত সিদ্ধান্ত নেওয়ার জন্য প্রয়োজনীয় সরঞ্জামগুলির সাথে সজ্জিত করে৷</p>\r\n<p>সম্প্রদায় এবং নেটওয়ার্কিং: NFT উত্সাহী, শিল্পী এবং সংগ্রাহকদের একটি প্রাণবন্ত সম্প্রদায়ের সাথে যোগ দিন। আলোচনায় নিযুক্ত হন, ভার্চুয়াল ইভেন্টে যোগ দিন এবং NFT ইকোসিস্টেমের মধ্যে আপনার নেটওয়ার্ক প্রসারিত করুন।</p>\r\n<p>কাস্টমাইজযোগ্য প্রোফাইল: আপনার প্রিয় এনএফটি, বায়ো এবং কৃতিত্ব দিয়ে আপনার নোগো প্রোফাইলকে ব্যক্তিগতকৃত করুন। NFT সম্প্রদায়ে আপনার অনন্য স্বাদ এবং অবদানগুলি প্রদর্শন করুন৷</p>\r\n<p>নিরবিচ্ছিন্ন মোবাইল অভিজ্ঞতা: নোগো ফ্লটার ব্যবহার করে তৈরি করা হয়েছে, বিস্তৃত ডিভাইসে একটি মসৃণ এবং প্রতিক্রিয়াশীল মোবাইল অভিজ্ঞতা নিশ্চিত করে। যেতে যেতে NFT অন্বেষণ উপভোগ করুন!</p>\r\n<p>নোগো শুধু একটি অ্যাপের চেয়ে বেশি; এটি সীমাহীন সৃজনশীলতা, উদ্ভাবন এবং ডিজিটাল মালিকানার জগতের একটি প্রবেশদ্বার। আপনি একজন অভিজ্ঞ NFT সংগ্রাহক বা মহাকাশে একজন নবাগত হোন না কেন, নোগো আপনাকে নন-ফাঞ্জিবল টোকেনের মাধ্যমে একটি অবিস্মরণীয় যাত্রা শুরু করার জন্য স্বাগত জানায়।</p>\r\n<p>আজই নোগো ডাউনলোড করুন এবং আপনার নখদর্পণে ফ্লটারের শক্তি এবং কমনীয়তার সাথে এনএফটি মার্কেটপ্লেসগুলির ভবিষ্যত অনুভব করুন। NFT সংগ্রহ, ট্রেডিং এবং অন্বেষণ শুরু করুন যেমন আগে কখনও হয়নি!</p>\r\n<p>নোগো &ndash; ফ্লটার এনএফটি মার্কেটপ্লেস অ্যাপ ইউআই কিট বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>39 High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Modern Design</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Nogo ,Non-Fungible,Marketplace ,PHP,Laravel,JS', 'নোগো – ফ্লটার নন-ফাঞ্জিবল টোকেন মার্কেটপ্লেস অ্যাপ', 'নোগো – ফ্লটার নন-ফাঞ্জিবল টোকেন মার্কেটপ্লেস অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(31, '8', 'bn', 'ফাইন্যান্সিয়াল কর্পোরেশন - ফ্লটার মানি ম্যানেজমেন্ট অ্যাপ', '<p>ভূমিকা:<br>আজকের দ্রুতগতির বিশ্বে, ব্যক্তিগত অর্থ ব্যবস্থাপনা ক্রমশ জটিল হয়ে উঠেছে। আর্থিক প্রতিষ্ঠানগুলি ক্রমাগত তাদের গ্রাহকদের আর্থিক স্থিতিশীলতা এবং সাফল্য অর্জনে সহায়তা করার জন্য উদ্ভাবনী উপায় খুঁজছে। এই চ্যালেঞ্জগুলি মোকাবেলা করার জন্য, ফাইন্যান্সিয়াল কর্পোরেশন তার অত্যাধুনিক ফ্লাটার মানি ম্যানেজমেন্ট অ্যাপ চালু করতে পেরে গর্বিত, যা ব্যক্তিদের তাদের আর্থিক নিয়ন্ত্রণের জন্য প্রয়োজনীয় সরঞ্জাম এবং অন্তর্দৃষ্টি দিয়ে ক্ষমতায়নের জন্য ডিজাইন করা হয়েছে।</p>\r\n<p>সংক্ষিপ্ত বিবরণ:<br>ফ্লাটার মানি ম্যানেজমেন্ট অ্যাপ হল একটি শক্তিশালী আর্থিক ব্যবস্থাপনা সমাধান যা ফিনান্সিয়াল কর্পোরেশন দ্বারা তৈরি করা হয়েছে, আর্থিক পরিষেবা শিল্পের একটি বিশ্বস্ত নেতা। আইওএস এবং অ্যান্ড্রয়েড সহ একাধিক প্ল্যাটফর্ম জুড়ে একটি ব্যতিক্রমী ব্যবহারকারীর অভিজ্ঞতা প্রদানের জন্য এই ব্যাপক অ্যাপ্লিকেশনটি ফ্লটার ফ্রেমওয়ার্কের বহুমুখীতা এবং কার্যকারিতা লাভ করে।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Multi-Platform Accessibility: Our app is built using Flutter, ensuring seamless and consistent performance on both iOS and Android devices. Users can access their financial information anytime, anywhere.</li>\r\n<li>Account Aggregation: The app allows users to link their bank accounts, credit cards, investment portfolios, and more. It consolidates all financial data into a single dashboard for a holistic view of their finances.</li>\r\n<li>Expense Tracking: Users can easily track their expenses by categorizing transactions. The app offers insightful visualizations and reports to help users understand their spending habits.</li>\r\n<li>Budgeting Tools: The budgeting feature enables users to set financial goals and create realistic budgets. The app provides real-time alerts and notifications to help users stay on track.</li>\r\n<li>Bill Reminders: Never miss a payment again with the built-in bill reminder feature. Users can schedule automatic payments and receive notifications for upcoming bills.</li>\r\n<li>Investment Portfolio Analysis: For users with investment portfolios, the app offers tools to monitor and analyze portfolio performance. It provides charts and data to make informed investment decisions.</li>\r\n<li>Financial Insights: Our app uses advanced analytics to offer personalized financial insights and recommendations. Users can receive tips on how to save money, invest wisely, and improve their financial health.</li>\r\n<li>Security and Privacy: Financial Corporation takes security seriously. The app employs state-of-the-art encryption and security protocols to protect users\' financial data and privacy.</li>\r\n<li>Customer Support: Access to a dedicated customer support team ensures that users receive assistance whenever they have questions or encounter issues.</li>\r\n</ul>\r\n<p>সুবিধা:</p>\r\n<p>আর্থিক ক্ষমতায়ন: ফ্লাটার মানি ম্যানেজমেন্ট অ্যাপ ব্যবহারকারীদেরকে তাদের আর্থিক লক্ষ্য এবং স্বপ্ন পূরণে সাহায্য করে, তথ্যপূর্ণ আর্থিক সিদ্ধান্ত নিতে সক্ষম করে।</p>\r\n<p>সরলতা: এর স্বজ্ঞাত ইন্টারফেস এবং ব্যবহারকারী-বান্ধব ডিজাইন আর্থিক ব্যবস্থাপনাকে সহজ করে তোলে, এমনকি যাদের আর্থিক জ্ঞান কম তাদের জন্যও।</p>\r\n<p>সময় সঞ্চয়: আর্থিক তথ্য এবং স্বয়ংক্রিয় কাজগুলি একত্রিত করে, অ্যাপটি ব্যবহারকারীদের সময় বাঁচায় এবং আর্থিক ব্যবস্থাপনার সাথে যুক্ত চাপ কমায়।</p>\r\n<p>আর্থিক নিরাপত্তা: অ্যাপটির শক্তিশালী নিরাপত্তা ব্যবস্থা নিশ্চিত করে যে ব্যবহারকারীদের আর্থিক তথ্য সর্বদা নিরাপদ এবং সুরক্ষিত থাকে।</p>\r\n<p>উপসংহার:<br>ফাইন্যান্সিয়াল কর্পোরেশনের ফ্লাটার মানি ম্যানেজমেন্ট অ্যাপ ব্যক্তিগত অর্থের জগতে একটি উল্লেখযোগ্য অগ্রগতির প্রতিনিধিত্ব করে। এর বহুমুখী বৈশিষ্ট্য, স্বজ্ঞাত নকশা এবং আর্থিক সুস্থতার প্রতিশ্রুতি সহ, এই অ্যাপটি ব্যক্তিরা কীভাবে তাদের অর্থ পরিচালনা করে তা বিপ্লব করতে প্রস্তুত। আপনি একজন অভিজ্ঞ বিনিয়োগকারী হোন বা কেউ আপনার আর্থিক নিয়ন্ত্রণ নিতে শুরু করেছেন, আমাদের অ্যাপটি আপনাকে আর্থিকভাবে সফল হতে সহায়তা করার জন্য এখানে রয়েছে। আজই এটি ডাউনলোড করুন এবং আর্থিক কর্পোরেশনের সাথে আর্থিক স্বাধীনতা এবং নিরাপত্তার দিকে যাত্রা শুরু করুন।</p>\r\n<p>&nbsp;</p>', 'Financial ,Corporation ,Money Management,App,Laravel', 'ফাইন্যান্সিয়াল কর্পোরেশন - ফ্লটার মানি ম্যানেজমেন্ট অ্যাপ', 'ফাইন্যান্সিয়াল কর্পোরেশন - ফ্লটার মানি ম্যানেজমেন্ট অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44');
INSERT INTO `product_languages` (`id`, `product_id`, `lang_code`, `name`, `description`, `tags`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(32, '9', 'bn', 'ফাইন্যান্স কোম্পানি - লারাভেল মানি ম্যানেজমেন্ট অ্যাপ', '<p>একটি \"ফাইনান্স কোম্পানি - লারাভেল মানি ম্যানেজমেন্ট অ্যাপ\" হল একটি পরিশীলিত এবং ব্যাপক আর্থিক ব্যবস্থাপনা অ্যাপ্লিকেশন যা লারাভেল ফ্রেমওয়ার্কের উপর নির্মিত, যা আর্থিক প্রতিষ্ঠান, ব্যবসা এবং ব্যক্তিদের বিভিন্ন প্রয়োজন মেটাতে ডিজাইন করা হয়েছে। এই অত্যাধুনিক সফ্টওয়্যার সমাধানটি আর্থিক সংস্থাগুলি এবং তাদের ক্লায়েন্টদের দক্ষতার সাথে তাদের আর্থিক সংস্থানগুলি পরিচালনা করতে, ক্রিয়াকলাপগুলিকে স্ট্রিমলাইন করতে এবং স্বাচ্ছন্দ্যে জ্ঞাত সিদ্ধান্ত নিতে সক্ষম করে।</p>\r\n<p>সংক্ষেপে, \"ফাইনান্স কোম্পানি &ndash; লারাভেল মানি ম্যানেজমেন্ট অ্যাপ\" হল একটি বহুমুখী এবং শক্তিশালী হাতিয়ার যা আর্থিক কোম্পানি এবং ব্যক্তিদের তাদের আর্থিক ভবিষ্যতের নিয়ন্ত্রণ নিতে সক্ষম করে। আপনি একটি আর্থিক প্রতিষ্ঠান যা ক্রিয়াকলাপকে স্ট্রীমলাইন করতে চাইছেন বা ব্যক্তিগত আর্থিক আরও ভালভাবে পরিচালনা করতে চাইছেন এমন একজন ব্যক্তি, এই অ্যাপ্লিকেশনটি আপনার প্রয়োজন মেটাতে একটি ব্যাপক এবং ব্যবহারকারীকেন্দ্রিক সমাধান সরবরাহ করে। এটি আর্থিক উৎকর্ষ, নিরাপত্তা এবং দক্ষতার প্রতিশ্রুতিকে প্রতিনিধিত্ব করে, যা স্মার্ট আর্থিক সিদ্ধান্ত এবং আরও সমৃদ্ধ ভবিষ্যতের জন্য মঞ্চ স্থাপন করে।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-Friendly Interface: The app boasts an intuitive and user-friendly interface, ensuring that users, regardless of their technical proficiency, can navigate and utilize its extensive features effortlessly.</li>\r\n<li>Account Management: With robust account management capabilities, users can create, modify, and delete accounts, each with its unique set of properties and permissions. This facilitates the management of multiple financial portfolios or business divisions from a single platform.</li>\r\n<li>Transaction Tracking: Keep a close eye on financial transactions with real-time tracking and reporting. Categorize transactions, set budgets, and generate insightful reports to gain a clear understanding of income, expenses, and overall financial health.</li>\r\n<li>Secure User Authentication: Security is paramount in finance, and this app ensures data protection through robust user authentication mechanisms, encryption, and secure data storage protocols.</li>\r\n<li>Customizable Dashboards: Users can personalize their dashboards, displaying the data and insights that matter most to them. This customization empowers individuals and businesses to focus on the key financial metrics relevant to their goals.</li>\r\n<li>Investment Management: Seamlessly manage investments, stocks, bonds, and other financial assets. Track their performance, receive alerts, and make informed investment decisions.</li>\r\n<li>Loan and Debt Management: For finance companies, this app simplifies loan origination, servicing, and debt collection. Users can view outstanding debts, set repayment schedules, and automate collection processes.</li>\r\n<li>Expense Tracking: Monitor daily expenses, categorize them, and set limits to avoid overspending. The app can also generate expense reports for tax purposes or budget analysis.</li>\r\n<li>Collaboration and Sharing: Collaborate with team members, clients, or family members by sharing access to specific financial accounts or data. This ensures transparency and enhances financial planning.</li>\r\n<li>Comprehensive Reporting: Generate a wide array of financial reports, including income statements, balance sheets, cash flow statements, and more. These reports provide deep insights into financial performance and aid in strategic decision-making.</li>\r\n<li>Mobile Accessibility: Access the app on the go with mobile compatibility, allowing users to manage their finances anytime, anywhere.</li>\r\n<li>Multi-Currency Support: Cater to global clients and investments with multi-currency support, enabling users to track and manage finances in various currencies seamlessly.</li>\r\n<li>Compliance and Regulations: Stay compliant with financial regulations and reporting requirements by leveraging built-in compliance tools and features.</li>\r\n<li>Data Backup and Recovery: Ensure the safety of financial data with automated backup and recovery options, minimizing the risk of data loss.</li>\r\n</ul>', 'Finance ,Company ,Management ,Laravel,PHP,JS', 'ফাইন্যান্স কোম্পানি - লারাভেল মানি ম্যানেজমেন্ট অ্যাপ', 'ফাইন্যান্স কোম্পানি - লারাভেল মানি ম্যানেজমেন্ট অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(33, '10', 'bn', 'এক্সপ্রেস - মুদি দোকান ব্যবস্থাপনা লারাভেল সফটওয়্যার', '<p>আপনি কি একটি সফল মুদি দোকান চালানোর সাথে আসা অসংখ্য চ্যালেঞ্জে ক্লান্ত? সামনে তাকিও না! আমাদের অত্যাধুনিক গ্রোসারি শপ ম্যানেজমেন্ট লারাভেল সফ্টওয়্যার আপনার ব্যবসায়িক কার্যক্রমকে রূপান্তরিত করতে এবং আপনার মুদি দোকানটিকে নতুন উচ্চতায় নিয়ে যেতে এখানে রয়েছে।</p>\r\n<p>কেন আমাদের লারাভেল সফ্টওয়্যার চয়ন করুন?</p>\r\n<p>স্ট্রীমলাইনড ইনভেন্টরি ম্যানেজমেন্ট: স্টকআউট এবং ওভারস্টক করা তাককে বিদায় বলুন। আমাদের সফ্টওয়্যার রিয়েল-টাইম ইনভেন্টরি ট্র্যাকিং প্রদান করে, আপনার কাছে সর্বদা সঠিক পণ্য রয়েছে তা নিশ্চিত করে।</p>\r\n<p>দক্ষ অর্ডার প্রক্রিয়াকরণ: আমাদের ব্যবহারকারী-বান্ধব ইন্টারফেস দিয়ে অর্ডার পরিচালনার প্রক্রিয়াটিকে সহজ করুন। অর্ডার দেওয়া থেকে শুরু করে ডেলিভারি ট্র্যাক করা সবই আপনার নখদর্পণে।</p>\r\n<p>গ্রাহকের ব্যস্ততা: আনুগত্য প্রোগ্রাম, ব্যক্তিগতকৃত অফার, এবং দক্ষ যোগাযোগ চ্যানেলের মাধ্যমে আপনার গ্রাহকদের সাথে দীর্ঘস্থায়ী সম্পর্ক গড়ে তুলুন। ব্যাপক বিক্রয় বিশ্লেষণ সহ ডেটা-চালিত সিদ্ধান্ত নিন। আপনার ইনভেন্টরি এবং মূল্য অপ্টিমাইজ করার জন্য সর্বাধিক বিক্রিত পণ্য, সর্বোচ্চ কেনাকাটার সময় এবং প্রবণতা সনাক্ত করুন।</p>\r\n<p>সরবরাহকারী সহযোগিতা: সরবরাহকারীদের সাথে যোগাযোগ স্ট্রীমলাইন করুন, সংগ্রহ পরিচালনা করুন এবং আপনার লাভের মার্জিন বাড়ানোর জন্য আরও ভাল চুক্তি করুন। আমাদের স্বজ্ঞাত ড্যাশবোর্ড আপনার মুদি দোকান পরিচালনা করা সহজ করে তোলে। আমাদের সফ্টওয়্যারটি কার্যকরভাবে ব্যবহার করার জন্য আপনাকে প্রযুক্তি-বুদ্ধিমান হতে হবে না।</p>\r\n<p>সুরক্ষিত এবং পরিমাপযোগ্য: আপনার ডেটা সুরক্ষিত জেনে সহজে বিশ্রাম নিন। আমাদের সফ্টওয়্যার সর্বশেষ নিরাপত্তা বৈশিষ্ট্যের সাথে ডিজাইন করা হয়েছে এবং আপনার ব্যবসার সাথে বৃদ্ধি পেতে স্কেলযোগ্য। আপনার মুদি দোকানের অনন্য চাহিদার জন্য সফ্টওয়্যারটি সাজান। আপনার ব্যবসার বিকাশের সাথে সাথে কাস্টম বৈশিষ্ট্য, ব্র্যান্ডিং এবং ইন্টিগ্রেশন যোগ করুন।</p>\r\n<p>24/7 সমর্থন: আমাদের ডেডিকেটেড সাপোর্ট টিম যেকোনো প্রশ্ন বা উদ্বেগের সাথে আপনাকে সহায়তা করার জন্য চব্বিশ ঘন্টা উপলব্ধ।</p>\r\n<p>কেন লারাভেল?</p>\r\n<p>আমাদের সফ্টওয়্যারটি লারাভেল ফ্রেমওয়ার্কের উপর তৈরি করা হয়েছে, যা এর নির্ভরযোগ্যতা, নিরাপত্তা এবং মাপযোগ্যতার জন্য পরিচিত। লারাভেলের সাথে, আপনি বিশ্বাস করতে পারেন যে আপনার মুদি দোকানের ব্যবস্থাপনা সিস্টেম শক্তিশালী এবং আপনার ক্রমবর্ধমান ব্যবসা পরিচালনা করার জন্য প্রস্তুত হবে।</p>\r\n<p>আপনার মুদি দোকানটিকে একটি সমৃদ্ধ, দক্ষ এবং গ্রাহককেন্দ্রিক ব্যবসায় রূপান্তর করার সুযোগটি মিস করবেন না। আজই আমাদের গ্রোসারি শপ ম্যানেজমেন্ট লারাভেল সফ্টওয়্যার দিয়ে শুরু করুন এবং আপনার দৈনন্দিন ক্রিয়াকলাপগুলিকে সহজ করার সাথে সাথে আপনার লাভের বৃদ্ধি দেখুন৷ এখন মুদি দোকান পরিচালনার ভবিষ্যতে যোগদান করুন!</p>\r\n<p>Features:</p>\r\n<ul>\r\n<li>30+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Express ,Grocery Shop,Laravel Software,Laravel,PHP', 'এক্সপ্রেস - মুদি দোকান ব্যবস্থাপনা লারাভেল সফটওয়্যার', 'এক্সপ্রেস - মুদি দোকান ব্যবস্থাপনা লারাভেল সফটওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(34, '11', 'bn', 'ভ্রমণ ভিসা ব্যবস্থাপনা লারাভেল সফটওয়্যার', '<p>আপনি কি আপনার প্রতিষ্ঠান বা ক্লায়েন্টদের জন্য ভ্রমণ ভিসা পরিচালনায় জড়িত ঝামেলা এবং জটিলতায় ক্লান্ত? VisaHub, আমাদের অত্যাধুনিক ভ্রমণ ভিসা ম্যানেজমেন্ট সফ্টওয়্যার, যা শক্তিশালী লারাভেল ফ্রেমওয়ার্কের উপর তৈরি করা হয়েছে, এর চেয়ে আর বেশি তাকান না। সম্পূর্ণ ভিসা আবেদন এবং প্রক্রিয়াকরণ কর্মপ্রবাহকে সরল ও অপ্টিমাইজ করার জন্য VisaHub হল আপনার ব্যাপক সমাধান।</p>\r\n<p>ভিসা ব্যবস্থাপনা একটি কঠিন কাজ হতে পারে, বিশেষ করে যখন একাধিক দেশ, বিভিন্ন ধরনের ভিসা এবং জটিল ডকুমেন্টেশনের প্রয়োজনীয়তা নিয়ে কাজ করা হয়। VisaHub এর মাধ্যমে, আপনি অনায়াসে এই জটিল ল্যান্ডস্কেপে নেভিগেট করতে পারেন এবং আপনার ভ্রমণকারীদের জন্য একটি মসৃণ, ত্রুটি-মুক্ত ভিসা আবেদন প্রক্রিয়া নিশ্চিত করতে পারেন।</p>\r\n<p>Laravel ব্যবহার করে একটি ভ্রমণ ভিসা ব্যবস্থাপনা সিস্টেম তৈরি করা একটি জটিল কিন্তু ফলপ্রসূ প্রকল্প হতে পারে। এই ধরনের ব্যবস্থা ট্রাভেল এজেন্সি, ইমিগ্রেশন কনসালট্যান্ট বা সংস্থাগুলির জন্য মূল্যবান হবে যারা প্রায়শই ভিসা আবেদন এবং প্রক্রিয়াকরণ নিয়ে কাজ করে। নিচে Laravel-এর সাথে নির্মিত একটি ভ্রমণ ভিসা ম্যানেজমেন্ট সিস্টেমে কী অন্তর্ভুক্ত থাকতে পারে তার একটি বিস্তৃত ওভারভিউ দেওয়া হল:</p>\r\n<p>VisaHub ডিজাইন করা হয়েছে ভিসা আবেদন এবং ব্যবস্থাপনা প্রক্রিয়াকে সহজ করার জন্য, আপনার সময় বাঁচাতে, ত্রুটি কমাতে এবং আপনার প্রতিষ্ঠান এবং ভিসা আবেদনকারীদের উভয়ের জন্য সামগ্রিক অভিজ্ঞতা বাড়াতে। আপনি একটি ট্রাভেল এজেন্সি, কর্পোরেট সত্তা, বা ভিসা পরিষেবা প্রদানকারী হোন না কেন, VisaHub আপনাকে দক্ষতার সাথে ভ্রমণ ভিসা অ্যাপ্লিকেশনগুলি সহজে পরিচালনা করার ক্ষমতা দেয়৷</p>\r\n<p>ম্যানুয়াল কাগজপত্র, বিভ্রান্তি এবং বিলম্বকে বিদায় বলুন। VisaHub-এর সাথে ভ্রমণ ভিসা ব্যবস্থাপনার ভবিষ্যৎ অনুভব করুন, Laravel-চালিত সমাধান যা আপনার ভিসা আবেদন প্রক্রিয়াকে স্ট্রীমলাইন করে, সমস্ত ভ্রমণকারীদের জন্য ঝামেলামুক্ত যাত্রা নিশ্চিত করে।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Visa Catalog: VisaHub maintains an up-to-date catalog of visas from various countries, making it easy to access essential information such as requirements, processing times, and fees.</li>\r\n<li>Document Repository: Store and organize visa-related documents securely within VisaHub. Easily upload, manage, and retrieve essential files, ensuring that all required documents are readily available.</li>\r\n<li>Application Tracking: Monitor visa applications in real-time. Track the progress of each application, receive status updates, and set automated notifications to keep stakeholders informed.</li>\r\n<li>User Management: VisaHub allows you to define user roles and permissions, ensuring that only authorized personnel can access sensitive visa information.</li>\r\n<li>Notification System: Keep applicants, clients, and team members informed with automated email notifications and alerts at key stages of the visa application process.</li>\r\n<li>Reporting and Analytics: Generate insightful reports and analytics to gain valuable insights into your visa management operations. Identify bottlenecks, improve efficiency, and make data-driven decisions.</li>\r\n<li>Compliance and Updates: VisaHub keeps you informed about changes in visa requirements, ensuring that you are always up to date and compliant with the latest regulations.</li>\r\n<li>Customization: Tailor VisaHub to your specific needs with customizable fields, forms, and branding options to align with your organization\'s identity.</li>\r\n</ul>\r\n<p>VisaHub ডিজাইন করা হয়েছে ভিসা আবেদন এবং ব্যবস্থাপনা প্রক্রিয়াকে সহজ করার জন্য, আপনার সময় বাঁচাতে, ত্রুটি কমাতে এবং আপনার প্রতিষ্ঠান এবং ভিসা আবেদনকারীদের উভয়ের জন্য সামগ্রিক অভিজ্ঞতা বাড়াতে। আপনি একটি ট্রাভেল এজেন্সি, কর্পোরেট সত্তা, বা ভিসা পরিষেবা প্রদানকারী হোন না কেন, VisaHub আপনাকে দক্ষতার সাথে ভ্রমণ ভিসা অ্যাপ্লিকেশনগুলি সহজে পরিচালনা করার ক্ষমতা দেয়৷</p>\r\n<p>ম্যানুয়াল কাগজপত্র, বিভ্রান্তি এবং বিলম্বকে বিদায় বলুন। VisaHub-এর সাথে ভ্রমণ ভিসা ব্যবস্থাপনার ভবিষ্যৎ অনুভব করুন, Laravel-চালিত সমাধান যা আপনার ভিসা আবেদন প্রক্রিয়াকে স্ট্রীমলাইন করে, সমস্ত ভ্রমণকারীদের জন্য ঝামেলামুক্ত যাত্রা নিশ্চিত করে।</p>', 'Travel ,Visa ,Management ,Software,PHP,Laravel', 'ভ্রমণ ভিসা ব্যবস্থাপনা লারাভেল সফটওয়্যার', 'ভ্রমণ ভিসা ব্যবস্থাপনা লারাভেল সফটওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(35, '12', 'bn', 'অনলাইন কোর্স ক্রয় ও বিক্রয় ব্যবস্থাপনা লারাভেল অ্যাপ', '<p>\"অনলাইন কোর্স ক্রয় ও বিক্রয় ব্যবস্থাপনা লারাভেল অ্যাপ\" হল একটি ব্যাপক এবং বৈশিষ্ট্য সমৃদ্ধ ওয়েব অ্যাপ্লিকেশন যা অনলাইন কোর্স ক্রয়-বিক্রয়ের সম্পূর্ণ প্রক্রিয়াকে স্ট্রিমলাইন করার জন্য ডিজাইন করা হয়েছে। একটি শক্তিশালী লারাভেল ব্যাকএন্ড সহ, এই অ্যাপ্লিকেশনটি কোর্স নির্মাতা এবং শিক্ষার্থী উভয়ের জন্যই একটি নিরবচ্ছিন্ন অভিজ্ঞতা প্রদান করে।</p>\r\n<p>আপনি একজন উচ্চাকাঙ্ক্ষী কোর্স নির্মাতা যা আপনার জ্ঞান নগদীকরণ করতে চাইছেন বা আপনার দক্ষতা এবং জ্ঞান প্রসারিত করতে চাইছেন এমন একজন শিক্ষার্থী, \"অনলাইন কোর্স ক্রয় ও বিক্রয় ব্যবস্থাপনা লারাভেল অ্যাপ\" আপনার শিক্ষাগত চাহিদা পূরণের জন্য একটি শক্তিশালী এবং নির্ভরযোগ্য প্ল্যাটফর্ম প্রদান করে। এর বিস্তৃত বৈশিষ্ট্য এবং ব্যবহারকারী-বান্ধব ডিজাইনের সাথে, এটি অনলাইন কোর্স কেনা এবং বিক্রি করার পদ্ধতিতে বিপ্লব ঘটায়, যা শিক্ষাবিদ এবং শিক্ষার্থী উভয়ের জন্য একটি জয়-জয় পরিস্থিতি তৈরি করে।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-friendly Interface: The application boasts an intuitive and user-friendly interface that ensures smooth navigation for all users, regardless of their technical expertise.</li>\r\n<li>Course Creation and Management: Course creators can easily create, edit, and manage their courses within the platform. They can upload course materials, set pricing, and define access parameters.</li>\r\n<li>Student Enrollment: Students can browse through a catalog of available courses, read detailed descriptions, and enroll in courses that align with their interests and learning goals.</li>\r\n<li>Secure Payment Processing: The app supports secure payment gateways to facilitate transactions, allowing course creators to monetize their content effectively.</li>\r\n<li>User Profiles: Users can create and manage their profiles, track their course progress, and access a personalized dashboard for a customized learning experience.</li>\r\n<li>Content Delivery: The application ensures reliable content delivery, including video streaming, downloadable resources, and interactive elements, to enhance the learning experience.</li>\r\n<li>Feedback and Reviews: Students can provide feedback and leave reviews for courses they\'ve taken, helping others make informed decisions.</li>\r\n<li>Analytics and Reporting: Course creators can access detailed analytics and reports to track the performance of their courses, enabling data-driven improvements.</li>\r\n<li>Notifications: Automated email notifications keep users informed about course updates, upcoming classes, and other important information.</li>\r\n<li>User Support: The app offers a support system for users to get assistance with any issues or inquiries they may have.</li>\r\n<li>Responsive Design: The application is designed to be fully responsive, ensuring a seamless experience across various devices, including desktops, tablets, and smartphones.</li>\r\n<li>Admin Dashboard: Admins have access to a comprehensive dashboard to manage users, courses, payments, and other aspects of the platform.</li>\r\n<li>Security: Robust security measures are implemented to protect user data, payment information, and course content.</li>\r\n</ul>\r\n<p>Payment Methods:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Online,Course,Laravel app,PHP,HTML', 'অনলাইন কোর্স ক্রয় ও বিক্রয় ব্যবস্থাপনা লারাভেল অ্যাপ', 'অনলাইন কোর্স ক্রয় ও বিক্রয় ব্যবস্থাপনা লারাভেল অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(36, '13', 'bn', 'নির্মাণ সেবা ব্যবস্থাপনা সফ্টওয়্যার', '<p>EfficientBuild Pro হল চূড়ান্ত নির্মাণ পরিষেবা পরিচালন সফ্টওয়্যার যা নির্মাণ সংস্থাগুলি কীভাবে কাজ করে তা বিপ্লব করার জন্য ডিজাইন করা হয়েছে। আপনি একটি ছোট, পারিবারিক মালিকানাধীন ব্যবসা বা বড় আকারের নির্মাণ সংস্থা হোন না কেন, আমাদের সফ্টওয়্যারটি আপনার অনন্য চাহিদা মেটাতে এবং আপনার নির্মাণ পরিষেবা বিক্রয়কে নতুন উচ্চতায় উন্নীত করার জন্য তৈরি করা হয়েছে৷</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Project Planning and Tracking: EfficientBuild Pro simplifies project management with powerful tools for planning, scheduling, and tracking construction projects. Visualize your project timeline, allocate resources, and ensure on-time project completion.</li>\r\n<li>Client Relationship Management: Strengthen client relationships with our CRM module. Manage leads, communicate with clients, and track interactions to convert leads into loyal customers.</li>\r\n<li>Estimating and Bidding: Create accurate estimates and competitive bids effortlessly. Our software streamlines the estimating process, helping you win more projects while maximizing profitability.</li>\r\n<li>Financial Management: Take control of your finances with integrated accounting tools. Track expenses, manage invoices, and generate financial reports to keep your business in top financial shape.</li>\r\n<li>Resource Allocation: Efficiently assign equipment, materials, and labor to projects. Avoid overbooking and underutilization, optimizing your resources for better profitability.</li>\r\n<li>Inventory and Supply Chain: Manage your construction materials and supplies seamlessly. Monitor stock levels, reorder materials, and reduce waste with real-time inventory tracking.</li>\r\n<li>Document Management: Say goodbye to paperwork chaos. Store, organize, and share project documents, blueprints, and contracts securely within the software.</li>\r\n<li>Mobile Accessibility: Access your construction service management tools on the go. Our mobile app ensures that you stay connected to your projects and team, no matter where you are.</li>\r\n<li>Reporting and Analytics: Make data-driven decisions with advanced reporting and analytics features. Gain insights into project performance, financial trends, and customer preferences.</li>\r\n<li>User-Friendly Interface: EfficientBuild Pro is designed with simplicity in mind. Enjoy a user-friendly interface that requires minimal training for your team to get started.</li>\r\n<li>Customization: Tailor the software to your company\'s unique processes and branding. Customizable templates and workflows ensure that EfficientBuild Pro aligns perfectly with your business.</li>\r\n<li>Security and Compliance: Rest easy knowing your data is secure. Our software complies with industry standards and provides robust security features to protect your sensitive information.</li>\r\n</ul>\r\n<p>EfficientBuild Pro নির্মাণ পরিষেবা পরিচালনার শ্রেষ্ঠত্ব অর্জনে আপনার অংশীদার। আপনার বিক্রয় বৃদ্ধি করুন, ক্রিয়াকলাপগুলিকে স্ট্রীমলাইন করুন এবং আপনার নির্মাণ ব্যবসাকে পরবর্তী স্তরে নিয়ে যান৷ আজ পার্থক্য অভিজ্ঞতা! EfficientBuild Pro কীভাবে আপনার নির্মাণ পরিষেবা ব্যবস্থাপনাকে রূপান্তরিত করতে পারে এবং আপনাকে সাফল্যের নতুন উচ্চতায় পৌঁছাতে সাহায্য করতে পারে তা দেখতে একটি ডেমোর অনুরোধ করুন৷</p>\r\n<p>Payment Methods:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Construction,service,PHP,Laravel,management software', 'নির্মাণ সেবা ব্যবস্থাপনা সফ্টওয়্যার', 'নির্মাণ সেবা ব্যবস্থাপনা সফ্টওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(37, '14', 'bn', 'কৃত্রিম বুদ্ধিমত্তা - এআই রাইটার এবং কপিরাইটিং লারাভেল অ্যাপ', '<p>আজকের ডিজিটাল যুগে, বিষয়বস্তু রাজা, এবং সারা বিশ্ব জুড়ে ব্যবসাগুলি তাদের লক্ষ্য দর্শকদের মোহিত করে এমন বাধ্যতামূলক এবং প্ররোচিত কপি তৈরি করার জন্য ক্রমাগত চেষ্টা করছে। এখানেই আমাদের বিপ্লবী এআই রাইটার এবং কপিরাইটিং লারাভেল অ্যাপটি আপনার বিষয়বস্তু তৈরির প্রক্রিয়াকে রূপান্তরিত করতে এবং আপনার ব্র্যান্ডকে নতুন উচ্চতায় উন্নীত করতে প্রস্তুত।</p>\r\n<p>আমাদের এআই-চালিত সমাধান আপনার ব্যবসার জন্য উচ্চ-মানের, আকর্ষক এবং প্ররোচিত লিখিত সামগ্রী তৈরিতে আপনাকে সহায়তা করার জন্য কৃত্রিম বুদ্ধিমত্তার সীমাহীন সম্ভাবনাকে কাজে লাগায়। আপনি একটি ই-কমার্স প্ল্যাটফর্ম, একটি বিপণন সংস্থা, একটি বিষয়বস্তু নির্মাতা বা একজন ব্লগারই হোন না কেন, আমাদের লারাভেল-ভিত্তিক অ্যাপ্লিকেশনটি আপনার নির্দিষ্ট চাহিদা মেটাতে এবং আপনার সামগ্রী বিপণনের প্রচেষ্টাকে উন্নত করার জন্য তৈরি করা হয়েছে৷</p>\r\n<p>উপসংহারে, আমাদের AI Writer &amp; Copywriting Laravel অ্যাপটি শুধুমাত্র একটি টুল নয়; এটা একটি খেলা পরিবর্তনকারী. আপনার বিষয়বস্তু কৌশল উন্নত করুন, সময় বাঁচান, এবং অসামান্য অনুলিপি তৈরি করুন যা আপনার দর্শকদের সাথে অনুরণিত হয়। আপনি একটি ছোট স্টার্টআপ বা একটি বড় উদ্যোগ হোক না কেন, আমাদের সমাধানটি আপনার সামগ্রী তৈরির যাত্রায় আপনাকে শক্তিশালী করার জন্য ডিজাইন করা হয়েছে৷ AI এর সাহায্যে আপনার ব্র্যান্ডের ভয়েস এবং গল্প বলার সম্পূর্ণ সম্ভাবনা আনলক করতে প্রস্তুত হন।</p>\r\n<p>আজই আমাদের এআই রাইটার এবং কপিরাইটিং লারাভেল অ্যাপ ব্যবহার করে দেখুন এবং বিষয়বস্তু তৈরির ভবিষ্যৎ অনুভব করুন!\"</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>AI-Powered Copywriting: Say goodbye to writer\'s block and hello to limitless creativity. Our AI Writer generates content that is not only well-researched but also tailored to your brand\'s unique voice and style.</li>\r\n<li>Efficiency and Time Savings: With our AI Writer &amp; Copywriting Laravel app, you can create content faster than ever before. No more hours spent staring at a blank screen; our AI effortlessly generates content, saving you time and allowing you to focus on other critical aspects of your business.</li>\r\n<li>High-Quality Results: Quality is never compromised. Our AI Writer ensures that every piece of content it generates is accurate, engaging, and free from grammatical errors, making it ready for immediate publication.</li>\r\n<li>Customization and Control: You\'re in the driver\'s seat. Customize the AI\'s output to match your specific requirements, whether you need product descriptions, blog posts, email newsletters, or social media updates. Our Laravel app gives you full control.</li>\r\n<li>Seamless Integration: Our Laravel-based solution seamlessly integrates into your existing workflow, making it easy for your team to collaborate and generate content effortlessly.</li>\r\n<li>Content Scaling: As your content needs grow, so does our AI\'s capability. Scale your content production effortlessly without compromising on quality.</li>\r\n<li>Cost-Effective: Forget about the high costs associated with hiring content writers. Our AI Writer &amp; Copywriting Laravel app offers a cost-effective solution to your content needs.</li>\r\n<li>Data Security: We understand the importance of data security. Your content and data are protected with the highest standards of security and encryption.</li>\r\n</ul>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Artificial intelligence, Writer & Copywriting,Laravel app,PHP', 'কৃত্রিম বুদ্ধিমত্তা - এআই রাইটার এবং কপিরাইটিং লারাভেল অ্যাপ', 'কৃত্রিম বুদ্ধিমত্তা - এআই রাইটার এবং কপিরাইটিং লারাভেল অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(38, '15', 'bn', 'স্কুল ম্যানেজমেন্ট ইনভেন্টরি লারাভেল সফটওয়্যার', '<p>আমাদের অত্যাধুনিক স্কুল ম্যানেজমেন্ট ইনভেন্টরি লারাভেল সফ্টওয়্যার প্রবর্তন করা হচ্ছে, শিক্ষা প্রতিষ্ঠানের জন্য চূড়ান্ত সমাধান যা তাদের ইনভেন্টরি এবং সংস্থানগুলির সুবিন্যস্ত ব্যবস্থাপনা চাইছে। স্কুলগুলির নির্দিষ্ট চাহিদার কথা মাথায় রেখে ডিজাইন করা, আমাদের সফ্টওয়্যারটি শিক্ষাবিদ এবং প্রশাসকদের শক্তিশালী সরঞ্জামগুলির সাহায্যে তাদের ইনভেন্টরি, সরবরাহ এবং সম্পদগুলিকে দক্ষতার সাথে ট্র্যাক, পরিচালনা এবং অপ্টিমাইজ করার ক্ষমতা দেয়৷</p>\r\n<p>ইনভেন্টরি অব্যবস্থাপনা এবং সম্পদ ট্র্যাকিং মাথাব্যথা বিদায় বলুন. আমাদের স্কুল ম্যানেজমেন্ট ইনভেন্টরি লারাভেল সফ্টওয়্যার দিয়ে, আপনি সত্যিই গুরুত্বপূর্ণ বিষয়গুলির উপর ফোকাস করতে পারেন: আপনার স্কুলের সংস্থানগুলি দক্ষতার সাথে পরিচালনা করার সময় একটি উচ্চ-মানের শিক্ষা প্রদান করা। অগণিত শিক্ষা প্রতিষ্ঠানে যোগ দিন যেগুলি ইতিমধ্যে আমাদের ব্যাপক সমাধানের সুবিধাগুলি অনুভব করেছে৷ আজই আপনার স্কুলের ইনভেন্টরি এবং সম্পদ ব্যবস্থাপনায় বিপ্লব ঘটান!</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Inventory Tracking: Keep a precise record of all school supplies, equipment, and resources. Monitor quantities, track usage, and set up automatic reorder alerts to ensure you\'re always well-stocked.</li>\r\n<li>User-Friendly Interface: Our intuitive, user-friendly interface makes it easy for both educators and administrators to navigate and use the software without extensive training.</li>\r\n<li>Asset Management: Effectively manage and maintain school assets such as computers, projectors, textbooks, and more. Track asset locations, maintenance schedules, and depreciation.</li>\r\n<li>Supplier Management: Keep track of your suppliers, their contact information, and purchase history. Streamline the procurement process and negotiate better deals with reliable data.</li>\r\n<li>Real-Time Reporting: Generate detailed reports on inventory levels, asset utilization, procurement expenses, and more. Access real-time insights to make informed decisions.</li>\r\n<li>Barcode Integration: Save time and reduce errors with barcode scanning capabilities. Easily update inventory and asset information with a simple scan.</li>\r\n<li>Security and Permissions: Control access to sensitive data with role-based permissions. Ensure that only authorized personnel can view or modify critical information.</li>\r\n<li>Multi-Location Support: Ideal for school districts with multiple campuses, our software seamlessly manages inventory and assets across various locations.</li>\r\n<li>Cloud-Based or Self-Hosted: Choose the deployment option that suits your institution\'s needs, whether it\'s cloud-based for convenience or self-hosted for enhanced data control.</li>\r\n<li>Scalability: Grow with confidence. Our software is designed to scale with your institution, accommodating increased inventory and asset management needs as your school expands.</li>\r\n<li>Responsive Support: Benefit from responsive customer support and regular software updates to ensure your institution always has access to the latest features and security enhancements.</li>\r\n</ul>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'School Management,Inventory ,Laravel ,Software,PHP', 'স্কুল ম্যানেজমেন্ট ইনভেন্টরি লারাভেল সফটওয়্যার', 'স্কুল ম্যানেজমেন্ট ইনভেন্টরি লারাভেল সফটওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(39, '16', 'bn', 'Aabcserv - মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ', '<p>Aabcserv &ndash; মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ হল সেই বিক্রেতাদের জন্য চূড়ান্ত সমাধান যারা তাদের অন-ডিমান্ড পরিষেবা এবং হ্যান্ডিম্যান মার্কেটপ্লেসকে পরবর্তী স্তরে নিয়ে যেতে চান। এই Aabcserv &ndash; মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ Ui কিট একটি শক্তিশালী এবং ব্যবহারকারী-বান্ধব টুল যা বিশেষভাবে বিক্রেতাদের জন্য ডিজাইন করা হয়েছে যারা চলতে চলতে সহজেই তাদের ব্যবসা পরিচালনা করতে চান। Aabcserv &ndash; মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ Ui কিট-এর মাধ্যমে, বিক্রেতারা দ্রুত এবং সহজে নতুন পরিষেবা যোগ করতে পারেন, বিদ্যমানগুলি আপডেট করতে পারেন এবং একটি সুবিধাজনক অবস্থান থেকে তাদের অর্ডারগুলি পরিচালনা করতে পারেন৷ এই শক্তিশালী বিক্রেতা অ্যাপটি সম্পূর্ণরূপে কাস্টমাইজযোগ্য, তাই আপনি সহজেই এটিকে আপনার নির্দিষ্ট প্রয়োজনের সাথে মানানসই করতে পারেন।</p>\r\n<p>Aabcserv - মাল্টিভেন্ডর অন-ডিমান্ড পরিষেবা এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপটি ফ্লটার ফ্রেমওয়ার্কের উপর তৈরি করা হয়েছে, যার মানে এটি দ্রুত, নির্ভরযোগ্য এবং ব্যবহার করা সহজ। এটিতে একটি আধুনিক এবং স্বজ্ঞাত ইউজার ইন্টারফেস রয়েছে যা আপনার পরিষেবার মার্কেটপ্লেসকে যতটা সম্ভব সহজ এবং সরলভাবে পরিচালনা করার জন্য ডিজাইন করা হয়েছে। Aabcserv &ndash; মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ Ui কিট একটি মাল্টিভেন্ডার অ্যাপ, যার মানে হল যে আপনি সহজেই আপনার প্ল্যাটফর্মে একাধিক বিক্রেতাকে অনবোর্ড করতে পারবেন। এটি যে কেউ একাধিক বিক্রেতাদের সাথে একটি সমৃদ্ধ পরিষেবা বাজার তৈরি করতে চায় তাদের জন্য এটি নিখুঁত সমাধান করে তোলে।</p>\r\n<p>Features:</p>\r\n<ul>\r\n<li>Flutter Version 3.0</li>\r\n<li>40+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customisable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>\r\n<p>AYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Aabcserv ,Multivendor ,On-Demand,Laravel,HTLM', 'Aabcserv - মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ', 'Aabcserv - মাল্টিভেন্ডর অন-ডিমান্ড সার্ভিস এবং হ্যান্ডিম্যান মার্কেটপ্লেস ফ্লাটার সেলার অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(40, '17', 'bn', 'Shopo ইকমার্স - মাল্টিভেন্ডর ইকমার্স ফ্লাটার সেলার অ্যাপ', '<p>Shopo eCommerce হল একটি অত্যাধুনিক মাল্টিভেন্ডর ইকমার্স ফ্লাটার সেলার অ্যাপ যা উদ্যোক্তা, ছোট ব্যবসা এবং স্বাধীন বিক্রেতাদের সহজে তাদের অনলাইন উপস্থিতি প্রতিষ্ঠা ও বৃদ্ধি করতে সক্ষম করে। এই বহুমুখী এবং বৈশিষ্ট্য-সমৃদ্ধ অ্যাপটি বিক্রেতাদের তাদের পণ্য প্রদর্শন, ইনভেন্টরি পরিচালনা, গ্রাহকদের সাথে সংযোগ স্থাপন এবং অনলাইন বাণিজ্যের প্রতিযোগিতামূলক বিশ্বে বিক্রয় বৃদ্ধির জন্য একটি বিরামহীন প্ল্যাটফর্ম প্রদান করে।</p>\r\n<p>শোপো ইকমার্স হল মাল্টিভেন্ডর ইকমার্সের জগতে প্রবেশের জন্য আপনার ওয়ান-স্টপ সমাধান। এটি বিক্রেতাদের অনলাইন খুচরা বিক্রয়ের পূর্ণ সম্ভাবনাকে কাজে লাগানোর ক্ষমতা দেয়, একটি গতিশীল এবং প্রতিযোগিতামূলক বাজারে সফল হওয়ার জন্য প্রয়োজনীয় সরঞ্জাম এবং বৈশিষ্ট্যগুলি প্রদান করে। আজই অ্যাপটি ডাউনলোড করুন এবং ইকমার্স সাফল্যে আপনার যাত্রা শুরু করুন!</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>User-Friendly Interface: Shopo eCommerce offers an intuitive and user-friendly interface that simplifies the process of setting up an online store. Sellers can effortlessly create and customize their storefronts to reflect their brand identity.</li>\r\n<li>Multivendor Support: The app supports multiple sellers, allowing a diverse range of products to be offered in one marketplace. Sellers can manage their individual inventories, pricing, and orders conveniently.</li>\r\n<li>Product Management: Easily add, edit, or delete products from your store with just a few taps. Organize products into categories for a structured shopping experience.</li>\r\n<li>Order Management: Efficiently handle customer orders, track shipments, and manage returns from within the app. Keep customers informed about the status of their orders for improved satisfaction.</li>\r\n<li>Payment Integration: Shopo eCommerce integrates with various payment gateways to ensure secure and hassle-free transactions. Sellers receive payments directly to their accounts.</li>\r\n<li>Customer Engagement: Stay connected with your customers through in-app messaging and notifications. Respond to inquiries promptly and build lasting relationships.</li>\r\n<li>Analytics and Reports: Gain valuable insights into your business performance with detailed analytics and sales reports. Use this data to make informed decisions and optimize your strategies.</li>\r\n<li>SEO-Friendly: Increase your store\'s visibility on search engines with built-in SEO tools. Improve your chances of attracting organic traffic and potential customers.</li>\r\n<li>Security: Shopo eCommerce prioritizes the security of your data and transactions. It employs robust security measures to protect sensitive information.</li>\r\n<li>Customization: Tailor your store\'s appearance and functionality to match your brand\'s unique identity. Choose from a variety of themes and templates to create a personalized shopping experience.</li>\r\n<li>Scalability: Whether you\'re just starting or already established, Shopo eCommerce scales with your business. Grow your product catalog and expand your customer base effortlessly.</li>\r\n<li>24/7 Support: Count on our dedicated support team to assist you with any questions or issues you may encounter along the way.</li>\r\n</ul>\r\n<p>Seller App Features:</p>\r\n<ul>\r\n<li>35+ High Quality Screens</li>\r\n<li>Modern Design</li>\r\n<li>Completely Customizable</li>\r\n<li>Clean Code and a well-structured project</li>\r\n<li>Cross Platform Compatible</li>\r\n<li>For Android and IOS</li>\r\n<li>60 FPS Support for both Android &amp; iOS</li>\r\n<li>Fully responsive UI</li>\r\n<li>Smooth Transition</li>\r\n<li>Easy to integrate into your project</li>\r\n<li>Well Documented</li>\r\n<li>Dedicated Support</li>\r\n</ul>', 'Shopo ,eCommerce ,Multivendor eCommerce,PHP,Laravel', 'Shopo ইকমার্স - মাল্টিভেন্ডর ইকমার্স ফ্লাটার সেলার অ্যাপ', 'Shopo ইকমার্স - মাল্টিভেন্ডর ইকমার্স ফ্লাটার সেলার অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(41, '18', 'bn', 'মিনিমল - ফ্যাশন ইকমার্স ফ্লাটার অ্যাপ', '<p>মিনিমল শুধু একটি ফ্যাশন ইকমার্স অ্যাপের চেয়েও বেশি কিছু; এটি একটি শৈলী এবং পরিশীলিত বিশ্বের আপনার পাসপোর্ট. আমাদের ব্যবহারকারী-বান্ধব ফ্লাটার-ভিত্তিক অ্যাপ্লিকেশানের মাধ্যমে, আপনি নিজেকে সাম্প্রতিক ফ্যাশন প্রবণতায় নিমজ্জিত করতে পারেন, অনন্য পোশাকের টুকরোগুলি আবিষ্কার করতে পারেন এবং আপনার পোশাকটিকে আগের মতো উন্নত করতে পারেন।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Trendsetting Collections: Stay ahead of the fashion curve with our curated collections, featuring the hottest styles, from casual wear to high-end fashion.</li>\r\n<li>Personalized Recommendations: Our smart algorithm learns your preferences and suggests clothing items that match your unique style, ensuring a tailored shopping experience.</li>\r\n<li>Seamless Shopping: Effortlessly browse through a wide range of clothing, accessories, and footwear, and shop securely with our intuitive interface.</li>\r\n<li>Exclusive Offers: Access exclusive discounts and promotions, making it easy to indulge in your favorite fashion brands without breaking the bank.</li>\r\n<li>Wishlist and Favorites: Save your favorite items to your wishlist for easy access and quick purchasing.</li>\r\n<li>Virtual Try-On: Visualize how outfits will look on you with our virtual try-on feature, helping you make confident choices.</li>\r\n<li>Fast and Secure Checkout: Enjoy a hassle-free shopping experience with our secure payment options and quick checkout process.</li>\r\n<li>Real-time Updates: Stay informed about the latest arrivals, restocks, and sales with real-time notifications.</li>\r\n<li>Customer Reviews: Make informed decisions by reading reviews and ratings from other fashion-savvy shoppers.</li>\r\n<li>24/7 Customer Support: Our dedicated support team is available round the clock to assist you with any queries or concerns.</li>\r\n</ul>\r\n<p>আজই মিনিমল ফ্যাশন সম্প্রদায়ে যোগ দিন এবং আপনার শৈলীর যাত্রাকে পুনরায় সংজ্ঞায়িত করুন। আমাদের ফ্লটার অ্যাপটি ডাউনলোড করুন এবং আপনার নখদর্পণে ফ্যাশনের অভিজ্ঞতা নিন যেমন আগে কখনও হয়নি!</p>\r\n<p>PAYMENT METHODS:</p>\r\n<ul>\r\n<li>Paypal</li>\r\n<li>Stripe</li>\r\n<li>Razorpay</li>\r\n<li>Flutterwave</li>\r\n<li>Mollie</li>\r\n<li>Paystack</li>\r\n<li>Instamojo</li>\r\n<li>Cash on delivery</li>\r\n<li>Bank Payment</li>\r\n</ul>', 'Minimoll ,Fashion ,eCommerce ,Laravel,HTML,PHP', 'মিনিমল - ফ্যাশন ইকমার্স ফ্লাটার অ্যাপ', 'মিনিমল - ফ্যাশন ইকমার্স ফ্লাটার অ্যাপ', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(42, '19', 'bn', 'মাল্টি-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', '<p>আজকের গতিশীল রেস্তোরাঁ শিল্পে, একাধিক শাখা দক্ষতার সাথে পরিচালনা করা সাফল্যের জন্য অত্যন্ত গুরুত্বপূর্ণ। আমাদের মাল্টি-শাখা রেস্তোরাঁ ম্যানেজমেন্ট সফ্টওয়্যারটি রেস্তোরাঁর চেইনের জন্য ক্রিয়াকলাপগুলিকে স্ট্রীমলাইন এবং অপ্টিমাইজ করার জন্য ডিজাইন করা হয়েছে, যাতে একাধিক অবস্থান নির্বিঘ্নে তদারকি করা আগের চেয়ে সহজ হয়৷</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Centralized Management: Gain complete control over all your restaurant branches from a single, user-friendly dashboard. Monitor sales, inventory, staff performance, and customer feedback across all locations in real-time.</li>\r\n<li>Menu Synchronization: Ensure consistency in menu offerings and pricing across all branches. Update menus, specials, and pricing effortlessly, and instantly sync changes to every location.</li>\r\n<li>Inventory Management: Track inventory levels and order supplies efficiently. Receive alerts when stock is low and automate restocking processes, reducing waste and saving money.</li>\r\n<li>Employee Management: Manage staff scheduling, payroll, and performance evaluations centrally. Easily assign roles and responsibilities for each branch and access attendance records with ease.</li>\r\n<li>Sales Analytics: Gain valuable insights into your restaurant\'s performance with robust reporting and analytics tools. Identify trends, best-sellers, and areas for improvement to make informed decisions.</li>\r\n<li>Customer Engagement: Implement loyalty programs, feedback collection, and customer communication strategies to enhance the customer experience and build lasting relationships.</li>\r\n<li>Table Reservation and Waitlist: Allow customers to make reservations online and manage walk-in guests efficiently. Reduce wait times and improve table turnover rates.</li>\r\n<li>Integration Capabilities: Seamlessly integrate with popular POS systems, payment gateways, and third-party delivery platforms to enhance operational efficiency and offer more convenience to customers.</li>\r\n<li>Security and Compliance: Ensure data security and compliance with industry standards. Protect sensitive customer information and maintain the trust of your clientele.</li>\r\n<li>Scalability: As your restaurant chain grows, our software can scale with you. Add new branches with ease and maintain consistent management practices.</li>\r\n<li>Support and Training: Access comprehensive training and 24/7 customer support to assist with any technical issues or questions that may arise.</li>\r\n</ul>\r\n<p>আমাদের মাল্টি-শাখা রেস্তোরাঁ ম্যানেজমেন্ট সফ্টওয়্যার দিয়ে আপনার রেস্তোরাঁ চেইনের ক্রিয়াকলাপগুলিকে স্ট্রীমলাইন করুন, ওভারহেড খরচ কমিয়ে দিন এবং সামগ্রিক গ্রাহক অভিজ্ঞতা বাড়ান৷ আপনার দুটি শাখা হোক বা বিশটি, আমাদের সমাধান আপনাকে সবচেয়ে গুরুত্বপূর্ণ বিষয়গুলিতে ফোকাস করার ক্ষমতা দেয় &ndash; লাভজনকতা সর্বাধিক করার সাথে সাথে ব্যতিক্রমী খাবার এবং পরিষেবা সরবরাহ করা।</p>', 'Multi-Branch,Restaurant Management,Software,PHP,Laravel', 'মাল্টি-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', 'মাল্টি-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(43, '20', 'bn', 'সিঙ্গেল-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', '<p>আমাদের অত্যাধুনিক একক-শাখা রেস্তোরাঁ ম্যানেজমেন্ট সফ্টওয়্যার দিয়ে আপনার রেস্তোরাঁর অপারেশনাল দক্ষতা বাড়ান৷ নির্বিঘ্নে স্বাধীন রেস্তোরাঁ, ক্যাফে এবং ভোজনরসিকগুলির অনন্য চাহিদা মেটাতে বিশেষভাবে ডিজাইন করা হয়েছে, এই সফ্টওয়্যারটি আপনার প্রতিষ্ঠানের প্রতিটি দিককে অপ্টিমাইজ করার জন্য আপনার চূড়ান্ত সমাধান।</p>\r\n<p>ম্যানুয়াল প্রক্রিয়া, কষ্টকর স্প্রেডশীট এবং খণ্ডিত সিস্টেমের বিশৃঙ্খলাকে বিদায় বলুন। আমাদের একক-শাখা রেস্তোরাঁ ম্যানেজমেন্ট সফ্টওয়্যার আপনার দৈনন্দিন ক্রিয়াকলাপগুলিকে স্ট্রীমলাইন করে, ইনভেন্টরি ম্যানেজমেন্ট এবং কর্মীদের সময়সূচী থেকে শুরু করে টেবিল রিজার্ভেশন এবং গ্রাহকের ব্যস্ততা সবই একক, ব্যবহারকারী-বান্ধব প্ল্যাটফর্মের মধ্যে।</p>\r\n<p>Key Features:</p>\r\n<ul>\r\n<li>Inventory Control: Effortlessly manage your ingredients, track stock levels, and receive real-time alerts for low inventory, ensuring you never run out of essential items.</li>\r\n<li>Sales and Revenue Analytics: Gain insights into your restaurant\'s performance with detailed analytics, helping you make data-driven decisions to boost profits.</li>\r\n<li>Table and Reservation Management: Easily handle table bookings, walk-ins, and waitlists, ensuring optimal table turnover and customer satisfaction.</li>\r\n<li>Menu Customization: Update your menu items, prices, and descriptions in real-time, allowing you to adapt to changing trends and customer preferences.</li>\r\n<li>Staff Scheduling: Create efficient staff schedules, track employee hours, and manage payroll effortlessly, reducing labor costs while maintaining service quality.</li>\r\n<li>Customer Relationship Management (CRM): Build lasting relationships with your patrons by collecting and analyzing customer data, enabling personalized marketing campaigns and loyalty programs.</li>\r\n<li>Point of Sale (POS) Integration: Seamlessly connect your POS system to streamline order processing, payment, and inventory updates.</li>\r\n<li>Security and Data Protection: Ensure the safety of your sensitive data and customer information with robust security measures and compliance with industry standards.</li>\r\n<li>Mobile Accessibility: Access critical restaurant data from anywhere with our mobile app, allowing you to stay in control even when you\'re not on-site.</li>\r\n<li>Customer Feedback: Gather valuable feedback through digital surveys and reviews, enabling you to continuously improve your service and offerings.</li>\r\n</ul>\r\n<p>আমাদের একক-শাখা রেস্তোরাঁ ম্যানেজমেন্ট সফ্টওয়্যারের রূপান্তরমূলক শক্তির অভিজ্ঞতা নিন এবং আপনার প্রতিষ্ঠার উন্নতির সাক্ষী হন। আপনি একটি আরামদায়ক আশেপাশের বিস্ট্রো, একটি ট্রেন্ডি ক্যাফে, বা একটি চমৎকার ডাইনিং স্থাপনা চালান না কেন, আমাদের সফ্টওয়্যারটি দক্ষতা বাড়াতে, লাভ বাড়াতে এবং একটি ব্যতিক্রমী খাবারের অভিজ্ঞতা প্রদানের জন্য তৈরি করা হয়েছে যা গ্রাহকদের আরও বেশি কিছুর জন্য ফিরে আসতে দেয়৷ আপনার রেস্তোরাঁর সাফল্যের সম্পূর্ণ সম্ভাবনা প্রকাশ করার সময় এসেছে।</p>', 'Single-Branch,Restaurant Management,App,PHP,Laravel', 'সিঙ্গেল-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', 'সিঙ্গেল-ব্রাঞ্চ রেস্তোরাঁ ব্যবস্থাপনা সফটওয়্যার', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(44, '21', 'bn', 'অ্যাপস প্রিমিয়াম ল্যান্ডিং মানেজমেন্ট  থিম', '<p>\"অ্যাপস প্রিমিয়াম ল্যান্ডিং থিম\" হল একটি সূক্ষ্মভাবে তৈরি এবং দৃশ্যত অত্যাশ্চর্য ওয়েব ডিজাইন টেমপ্লেট যা মোবাইল অ্যাপ্লিকেশন, সফ্টওয়্যার পণ্য বা ডিজিটাল পরিষেবাগুলি প্রদর্শনের জন্য বিশেষভাবে তৈরি করা হয়েছে৷ এটি ডিজাইনের উৎকর্ষতা এবং ব্যবহারকারীর সম্পৃক্ততার শীর্ষকে উপস্থাপন করে, এটি ডেভেলপার, স্টার্টআপ এবং ব্যবসার জন্য একটি আদর্শ পছন্দ করে যা একটি আকর্ষণীয় অনলাইন উপস্থিতি তৈরি করার লক্ষ্যে।</p>\r\n<p>সংক্ষেপে, \"অ্যাপস প্রিমিয়াম ল্যান্ডিং থিম\" হল একটি বহুমুখী এবং দৃষ্টিনন্দন টেমপ্লেট যা আপনাকে আপনার মোবাইল অ্যাপ্লিকেশন বা ডিজিটাল পণ্যকে কার্যকরভাবে প্রচার করতে সাহায্য করার জন্য ডিজাইন করা হয়েছে৷ এর বৈশিষ্ট্যগুলির পরিসর, কাস্টমাইজেশন বিকল্প এবং প্রতিক্রিয়াশীল ডিজাইনের সাথে, এটি আপনাকে একটি বাধ্যতামূলক অনলাইন উপস্থিতি তৈরি করার ক্ষমতা দেয় যা দর্শকদের বিশ্বস্ত ব্যবহারকারীতে রূপান্তর করে।</p>\r\n<p>অনুগ্রহ করে মনে রাখবেন যে এই বিবরণটি একটি সাধারণ উপস্থাপনা এবং 2023 সালে উপলব্ধ একটি নির্দিষ্ট প্রিমিয়াম ল্যান্ডিং থিমের বৈশিষ্ট্য বা সুনির্দিষ্ট বৈশিষ্ট্যগুলি সঠিকভাবে প্রতিফলিত নাও হতে পারে৷ একটি নির্দিষ্ট থিম সম্পর্কে বিস্তারিত তথ্য পেতে, আমি থিম প্রদানকারীর অফিসিয়াল ওয়েবসাইট পরিদর্শন করার বা তাদের সাথে যোগাযোগ করার পরামর্শ দিচ্ছি৷ সর্বশেষ এবং সবচেয়ে সঠিক বিবরণের জন্য সমর্থন।</p>\r\n<p>কী ফিচারস:</p>\r\n<ul>\r\n<li>মসৃণ এবং আধুনিক ডিজাইন: আমাদের থিমটি একটি মসৃণ এবং আধুনিক ডিজাইনের গর্ব করে যা অবিলম্বে দর্শকদের দৃষ্টি আকর্ষণ করে। এর পরিষ্কার বিন্যাস, প্রাণবন্ত রঙ এবং স্বজ্ঞাত নেভিগেশন একটি স্মরণীয় প্রথম ছাপ নিশ্চিত করে।</li>\r\n<li>প্রতিক্রিয়াশীল এবং মোবাইল-বন্ধুত্বপূর্ণ: আজকের মোবাইল-কেন্দ্রিক বিশ্বে, আপনার ল্যান্ডিং পৃষ্ঠাটি অবশ্যই সমস্ত ডিভাইসে ত্রুটিহীন দেখতে হবে৷ অ্যাপস প্রিমিয়াম ল্যান্ডিং থিম সম্পূর্ণরূপে প্রতিক্রিয়াশীল, স্মার্টফোন, ট্যাবলেট এবং ডেস্কটপে একটি নিরবচ্ছিন্ন অভিজ্ঞতার গ্যারান্টি দেয়।</li>\r\n<li>অ্যাপ শোকেস: আপনার অ্যাপের বৈশিষ্ট্য, স্ক্রিনশট এবং সুবিধাগুলি মার্জিতভাবে হাইলাইট করুন। কাস্টমাইজযোগ্য বিভাগগুলি আপনাকে আপনার অ্যাপের কার্যকারিতা এমনভাবে উপস্থাপন করতে দেয় যা আপনার লক্ষ্য দর্শকদের সাথে অনুরণিত হয়।</li>\r\n<li>মসৃণ অ্যানিমেশন: মসৃণ অ্যানিমেশন এবং ট্রানজিশনের সাথে ব্যবহারকারীদের জড়িত করুন যা আপনার ল্যান্ডিং পৃষ্ঠায় ইন্টারঅ্যাক্টিভিটির স্পর্শ যোগ করে। এই অ্যানিমেশনগুলি ব্যবহারকারীর ব্যস্ততা বাড়াতে এবং একটি স্মরণীয় ব্রাউজিং অভিজ্ঞতা তৈরি করার জন্য ডিজাইন করা হয়েছে৷</li>\r\n<li>কল-টু-অ্যাকশন (CTA) উপাদান: কৌশলগতভাবে স্থাপন করা CTA বোতাম এবং ফর্ম দর্শকদের পদক্ষেপ নিতে উৎসাহিত করে, তা আপনার অ্যাপ ডাউনলোড করা, নিউজলেটারের জন্য সাইন আপ করা বা কেনাকাটা করা হোক না কেন।</li>\r\n<li>প্রশংসাপত্র এবং সামাজিক প্রমাণ: ক্লায়েন্ট প্রশংসাপত্র, ব্যবহারকারীর পর্যালোচনা এবং আপনার অ্যাপের বিশ্বাসযোগ্যতা এবং নির্ভরযোগ্যতা হাইলাইট করে এমন ট্রাস্ট ব্যাজগুলির মাধ্যমে সম্ভাব্য ব্যবহারকারীদের সাথে বিশ্বাস তৈরি করুন।</li>\r\n<li>ইন্টিগ্রেশন-প্রস্তুত: ব্যবহারকারীর ইন্টারঅ্যাকশন ট্র্যাক করতে এবং বৃহত্তর শ্রোতাদের কাছে পৌঁছানোর জন্য জনপ্রিয় ইমেল বিপণন সরঞ্জাম, বিশ্লেষণ প্ল্যাটফর্ম এবং সোশ্যাল মিডিয়া নেটওয়ার্কগুলির সাথে নির্বিঘ্নে সংহত করুন৷</li>\r\n<li>এসইও অপ্টিমাইজড: থিমটি সার্চ ইঞ্জিনের জন্য অপ্টিমাইজ করা হয়েছে, যাতে আপনার ল্যান্ডিং পৃষ্ঠা সার্চের ফলাফলে ভালোভাবে স্থান পায়, আপনার অ্যাপ বা পণ্যে অর্গানিক ট্রাফিক চালনা করে।</li>\r\n<li>কাস্টমাইজেশন বিকল্প: রঙের স্কিম, ফন্ট এবং লেআউট বৈচিত্র সহ সহজেই ব্যবহারযোগ্য কাস্টমাইজেশন বিকল্পগুলির সাথে আপনার ব্র্যান্ড পরিচয়ের সাথে মেলে থিমটি সাজান।</li>\r\n<li>ডেডিকেটেড সাপোর্ট: অ্যাপস প্রিমিয়াম ল্যান্ডিং থিম সেট আপ এবং ব্যবহার করার সময় আপনি যেকোন প্রশ্ন বা সমস্যার সম্মুখীন হতে পারেন সেই বিষয়ে আমাদের গ্রাহক সহায়তা দল আপনাকে সহায়তা করতে প্রস্তুত।</li>\r\n</ul>', 'অ্যাপস  ,প্রিমিয়াম  ,ল্যান্ডিং  থিম,লারাভেল  ,শপিফাই', 'অ্যাপস প্রিমিয়াম ল্যান্ডিং মানেজমেন্ট  থিম', 'অ্যাপস প্রিমিয়াম ল্যান্ডিং মানেজমেন্ট  থিম', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(45, '22', 'bn', 'Oifolio-ডিজিটাল মার্কেটিং মানেজমেন্ট থিম', '<p>\"Oifolio-ডিজিটাল মার্কেটিং থিম: একটি শক্তিশালী এবং বহুমুখী ওয়ার্ডপ্রেস থিম দিয়ে আপনার অনলাইন উপস্থিতি উন্নত করুন\"</p>\r\n<p>আজকের ডিজিটাল ল্যান্ডস্কেপে, একটি শক্তিশালী অনলাইন উপস্থিতি প্রতিষ্ঠা করা ব্যবসা এবং ব্যক্তিদের জন্য একইভাবে গুরুত্বপূর্ণ। আপনি একজন অভিজ্ঞ ডিজিটাল বিপণনকারী, একজন উদীয়মান উদ্যোক্তা, বা একজন সৃজনশীল পেশাদার হোন না কেন, সঠিক ডিজিটাল মার্কেটিং থিম আপনার ব্র্যান্ড, পণ্য বা পরিষেবাগুলিকে কার্যকরভাবে প্রদর্শনে সমস্ত পার্থক্য আনতে পারে৷ সেখানেই Oifolio-ডিজিটাল মার্কেটিং থিম কার্যকর হয়।</p>\r\n<p>Oifolio শুধুমাত্র আরেকটি ওয়ার্ডপ্রেস থিম নয়; এটি একটি বিস্তৃত সমাধান যা আপনাকে ডিজিটাল মার্কেটিং এর প্রতিযোগিতামূলক বিশ্বে দক্ষতা অর্জনের জন্য প্রয়োজনীয় সরঞ্জাম এবং বৈশিষ্ট্যগুলির সাথে ক্ষমতায়নের জন্য ডিজাইন করা হয়েছে। এই থিমটি হল শিল্প অভিজ্ঞতা, বিশেষজ্ঞ ডিজাইন এবং ব্যবহারকারী-কেন্দ্রিক উন্নয়নের চূড়ান্ত পরিণতি, এটি তাদের অনলাইন উপস্থিতির পূর্ণ সম্ভাবনাকে কাজে লাগাতে চায় এমন যেকোন ব্যক্তির জন্য আদর্শ পছন্দ করে তুলেছে৷</p>\r\n<p>Oifolio-ডিজিটাল মার্কেটিং থিমের মূল বৈশিষ্ট্য:</p>\r\n<ul>\r\n<li>প্রতিক্রিয়াশীল ডিজাইন: Oifolio সম্পূর্ণরূপে প্রতিক্রিয়াশীল, এটি নিশ্চিত করে যে আপনার ওয়েবসাইটটি ডেস্কটপ কম্পিউটার থেকে স্মার্টফোন এবং ট্যাবলেট পর্যন্ত সমস্ত ডিভাইসে অত্যাশ্চর্য দেখাচ্ছে৷ এই বৈশিষ্ট্যটি আপনার শ্রোতাদের ক্যাপচার এবং আকর্ষিত করার জন্য অপরিহার্য, তারা আপনার সাইটে যেভাবে অ্যাক্সেস করুক না কেন।</li>\r\n<li>বহুমুখী লেআউট বিকল্প: Oifolio-এর সাথে, আপনি লেআউট বিকল্পগুলির একটি বিস্তৃত পরিসরে অ্যাক্সেস করতে পারেন, যা আপনাকে আপনার অনন্য প্রয়োজন অনুসারে আপনার ওয়েবসাইট কাস্টমাইজ করার অনুমতি দেয়। আপনি একটি মসৃণ এবং আধুনিক ডিজাইন বা আরও ঐতিহ্যগত চেহারা চান না কেন, Oifolio আপনাকে আচ্ছাদিত করেছে।</li>\r\n<li>SEO-বন্ধুত্বপূর্ণ: Oifolio তৈরি করা হয়েছে সার্চ ইঞ্জিন অপ্টিমাইজেশান (SEO) মাথায় রেখে। এটিতে বৈশিষ্ট্য এবং সরঞ্জাম রয়েছে যা সার্চ ইঞ্জিন ফলাফলে আপনার ওয়েবসাইটের দৃশ্যমানতা উন্নত করতে সাহায্য করে, আপনাকে আরও বৃহত্তর দর্শকদের কাছে পৌঁছাতে এবং আরও দর্শকদের আকর্ষণ করতে সহায়তা করে৷</li>\r\n<li>গতি এবং কর্মক্ষমতা: স্লো-লোডিং ওয়েবসাইট দর্শকদের দূরে সরিয়ে দিতে পারে। Oifolio গতি এবং কর্মক্ষমতা জন্য অপ্টিমাইজ করা হয়েছে, আপনার সাইট দ্রুত লোড হয় এবং একটি চমৎকার ব্যবহারকারীর অভিজ্ঞতা প্রদান করে তা নিশ্চিত করে।</li>\r\n<li>বিপণন সরঞ্জামগুলির সাথে একীকরণ: Oifolio নিরবিচ্ছিন্নভাবে জনপ্রিয় ডিজিটাল বিপণন সরঞ্জামগুলির সাথে সংহত করে, যা আপনাকে আপনার বিপণন কৌশলগুলি সহজে বাস্তবায়ন করতে দেয়৷ এটি ইমেল মার্কেটিং, সোশ্যাল মিডিয়া ইন্টিগ্রেশন বা বিশ্লেষণ যাই হোক না কেন, Oifolio আপনাকে কভার করেছে।</li>\r\n<li>কাস্টমাইজেশন বিকল্প: Oifolio-এর ব্যাপক কাস্টমাইজেশন বিকল্পগুলি ব্যবহার করে সহজেই আপনার ওয়েবসাইটকে ব্যক্তিগতকৃত করুন। আপনি রঙ, ফন্ট, লেআউট এবং আরও কিছু পরিবর্তন করতে পারেন এমন একটি ওয়েবসাইট তৈরি করতে যা আপনার ব্র্যান্ডের পরিচয়কে পুরোপুরি প্রতিফলিত করে।</li>\r\n<li>ডেডিকেটেড সাপোর্ট: যখন আপনি Oifolio বেছে নেন, আপনি শুধু একটি থিম পাচ্ছেন না; আপনি একটি ডেডিকেটেড সাপোর্ট টিম পাচ্ছেন যা আপনার সম্মুখীন হতে পারে এমন কোনো প্রশ্ন বা সমস্যায় আপনাকে সহায়তা করার জন্য প্রস্তুত</li>\r\n</ul>\r\n<p>সংক্ষেপে, Oifolio-Digital Marketing Theme হল তাদের জন্য চূড়ান্ত পছন্দ যারা একটি শক্তিশালী অনলাইন উপস্থিতির গুরুত্ব বোঝেন। এটি আপনাকে এমন একটি ওয়েবসাইট তৈরি করতে সাহায্য করার জন্য বিস্তৃত বৈশিষ্ট্য এবং কাস্টমাইজেশন বিকল্পগুলি অফার করে যা শুধুমাত্র দুর্দান্ত দেখায় না কিন্তু ফলাফলগুলিও চালায়৷ Oifolio-এর সাথে আপনার ডিজিটাল মার্কেটিং প্রচেষ্টাকে উন্নত করুন এবং আপনার অনলাইন উপস্থিতি পরবর্তী স্তরে নিয়ে যান।</p>', 'Oifolio, ডিজিটাল মার্কেটিং,থিম,শপিফাই ,পিএইচপি ,জে এস', 'Oifolio-ডিজিটাল মার্কেটিং থিম', 'Oifolio-ডিজিটাল মার্কেটিং থিম', '2023-09-23 09:52:17', '2023-10-01 10:41:44');
INSERT INTO `product_languages` (`id`, `product_id`, `lang_code`, `name`, `description`, `tags`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(46, '23', 'bn', 'সাস ল্যান্ডিং সফটওয়্যার মানেজমেন্ট থিম', '&lt;p&gt;একটি পরিষেবা (SaaS) ল্যান্ডিং পৃষ্ঠা হিসাবে একটি চিত্তাকর্ষক এবং কার্যকর সফ্টওয়্যার তৈরি করা আপনার লক্ষ্য দর্শকদের দৃষ্টি আকর্ষণ করার জন্য এবং দর্শকদের গ্রাহকে রূপান্তর করার জন্য অত্যন্ত গুরুত্বপূর্ণ। এটি অর্জন করার জন্য, আপনার একটি সতর্কতার সাথে তৈরি করা SaaS ল্যান্ডিং সফ্টওয়্যার থিম প্রয়োজন যা শুধুমাত্র আপনার পণ্যের বৈশিষ্ট্যগুলি প্রদর্শন করে না বরং আপনার ব্র্যান্ডের পরিচয় এবং মূল্য প্রস্তাবও প্রকাশ করে৷&lt;/p&gt;\r\n&lt;p&gt;আমাদের SaaS ল্যান্ডিং সফ্টওয়্যার থিম এই সঠিক চাহিদা মেটাতে ডিজাইন করা হয়েছে। একটি মসৃণ এবং আধুনিক ডিজাইনের সাথে, এটি নিশ্চিত করে যে আপনার SaaS পণ্যটি ডিজিটাল ল্যান্ডস্কেপে জ্বলছে। আমাদের থিম থেকে আপনি যা আশা করতে পারেন তা এখানে&lt;/p&gt;\r\n&lt;p&gt;কী ফিচারস:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;দৃশ্যত অত্যাশ্চর্য: আমাদের থিমে নজরকাড়া গ্রাফিক্স, মার্জিত টাইপোগ্রাফি এবং একটি পরিষ্কার বিন্যাস রয়েছে যাতে আপনার SaaS অফারটিকে দৃশ্যত আকর্ষণীয় করে তোলা যায়। এটি একটি দীর্ঘস্থায়ী প্রথম ছাপ তৈরি করার জন্য ডিজাইন করা হয়েছে যা দর্শকদের আরও অন্বেষণ করতে উত্সাহিত করে৷&lt;/li&gt;\r\n&lt;li&gt;প্রতিক্রিয়াশীল ডিজাইন: আজকের মোবাইল-চালিত বিশ্বে, আপনার ল্যান্ডিং পৃষ্ঠাটিকে বিভিন্ন ডিভাইস এবং স্ক্রিনের আকারে ত্রুটিহীনভাবে দেখতে এবং কাজ করতে হবে। আমাদের থিমটি সম্পূর্ণরূপে প্রতিক্রিয়াশীল, স্মার্টফোন, ট্যাবলেট এবং ডেস্কটপে একটি বিরামহীন ব্যবহারকারীর অভিজ্ঞতার গ্যারান্টি দেয়।&lt;/li&gt;\r\n&lt;li&gt;ব্যবহারকারী-বান্ধব: আমরা ব্যবহারকারী-বন্ধুত্বকে অগ্রাধিকার দিই, নিশ্চিত করে যে আপনার দর্শকরা আপনার ল্যান্ডিং পৃষ্ঠাটি অনায়াসে নেভিগেট করতে পারে, আপনার সফ্টওয়্যারের বৈশিষ্ট্যগুলি সম্পর্কে জানতে পারে এবং পছন্দসই পদক্ষেপ নিতে পারে, যেমন একটি ট্রায়ালের জন্য সাইন আপ করা বা আপনার পরিষেবাতে সদস্যতা নেওয়া৷&lt;/li&gt;\r\n&lt;li&gt;কাস্টমাইজেশন বিকল্প: আপনার ব্র্যান্ডের পরিচয়ের সাথে মেলে আপনার ল্যান্ডিং পৃষ্ঠাটি সাজানো অপরিহার্য। আমাদের থিম কাস্টমাইজেশন বিকল্পগুলি অফার করে, যা আপনাকে আপনার ব্র্যান্ড নির্দেশিকাগুলির সাথে সারিবদ্ধ করার জন্য রঙ, ফন্ট এবং চিত্রগুলিকে পরিবর্তন করতে দেয়৷&lt;/li&gt;\r\n&lt;li&gt;রূপান্তর-চালিত: শেষ পর্যন্ত, আপনার ল্যান্ডিং পৃষ্ঠার সাফল্য দর্শকদের গ্রাহকে রূপান্তর করার ক্ষমতার উপর নির্ভর করে। আমাদের থিম রূপান্তর অপ্টিমাইজেশন মাথায় রেখে ডিজাইন করা হয়েছে, সাইন-আপ, অনুসন্ধান বা ক্রয়কে উৎসাহিত করতে প্রমাণিত কৌশলগুলি ব্যবহার করে৷&lt;/li&gt;\r\n&lt;li&gt;এসইও-বন্ধুত্বপূর্ণ: সার্চ ইঞ্জিনে আপনার ল্যান্ডিং পৃষ্ঠাটি ভালভাবে স্থান পেয়েছে তা নিশ্চিত করতে, আমরা থিমের মধ্যে SEO সেরা অনুশীলনগুলিকে একীভূত করেছি। এটি আপনার দৃশ্যমানতা উন্নত করতে এবং জৈব ট্রাফিককে আকর্ষণ করতে সহায়তা করে৷&lt;/li&gt;\r\n&lt;li&gt;ইন্টিগ্রেশন রেডি: আপনাকে থার্ড-পার্টি টুলস, পেমেন্ট গেটওয়ে বা অ্যানালিটিক্স প্ল্যাটফর্মের সাথে একীভূত করতে হবে না কেন, আমাদের থিম বিরামবিহীন ইন্টিগ্রেশন সমর্থন করে, আপনার বৃহত্তর প্রযুক্তিগত ইকোসিস্টেমের অংশ হিসেবে আপনার SaaS ল্যান্ডিং পৃষ্ঠার কার্যকারিতা নিশ্চিত করে।&lt;/li&gt;\r\n&lt;li&gt;পারফরম্যান্স-অরিয়েন্টেড: স্লো-লোডিং পেজ দর্শকদের দূরে সরিয়ে দিতে পারে। আমাদের থিম গতি এবং কর্মক্ষমতা জন্য অপ্টিমাইজ করা হয়েছে আপনার বাউন্স রেট কম এবং আপনার ব্যস্ততা উচ্চ রাখতে।&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;সংক্ষেপে, আমাদের SaaS ল্যান্ডিং সফ্টওয়্যার থিম হল তাদের জন্য আদর্শ পছন্দ যারা সফ্টওয়্যার-এ-সার্ভিস-এর প্রতিযোগিতামূলক বিশ্বে একটি শক্তিশালী প্রভাব ফেলতে চান৷ এটি আপনাকে আপনার ব্যবসার লক্ষ্য অর্জনে সহায়তা করার জন্য অত্যাশ্চর্য ভিজ্যুয়াল, ব্যবহারযোগ্যতা এবং রূপান্তর-কেন্দ্রিক নকশাকে একত্রিত করে। আমাদের থিমের সাথে, আপনার SaaS পণ্যের অনলাইন উপস্থিতি এটির প্রাপ্য থাকবে, কার্যকরভাবে গ্রাহকদের আকর্ষণ করবে এবং ধরে রাখবে।&lt;/p&gt;', 'সাস ,ল্যান্ডিং ,সফটওয়্যার,থিম ,জুমলা ,শপিফাই', 'সাস ল্যান্ডিং সফটওয়্যার মানেজমেন্ট থিম', 'সাস ল্যান্ডিং সফটওয়্যার মানেজমেন্ট থিম', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_type_pages`
--

CREATE TABLE `product_type_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type_pages`
--

INSERT INTO `product_type_pages` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'uploads/website-images/product-type-page--2023-08-26-05-57-31-5104.png', '2023-06-11 05:46:03', '2023-08-26 11:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_type_page_languages`
--

CREATE TABLE `product_type_page_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type_page_languages`
--

INSERT INTO `product_type_page_languages` (`id`, `product_type_id`, `lang_code`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Need help selecting a category?', 'A great way to start is by browsing through our categories to see what other authors are selling.', NULL, '2023-08-28 09:15:59'),
(19, 1, 'bn', 'একটি বিভাগ নির্বাচন সাহায্য প্রয়োজন?', 'শুরু করার একটি দুর্দান্ত উপায় হল অন্য লেখকরা কী বিক্রি করছেন তা দেখতে আমাদের বিভাগগুলির মাধ্যমে ব্রাউজ করা।', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_name`, `price`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 6, 'Wanderlust', '20', 'Script-2023-09-20-04-59-49-5635.zip', '2023-09-20 10:59:49', '2023-09-20 10:59:49'),
(2, 6, 'Go Explore', '40', 'Script-2023-09-20-05-00-21-4141.zip', '2023-09-20 11:00:21', '2023-09-20 11:00:21'),
(3, 7, 'Dimensions: 1140x1080 pixels', '20', 'Script-2023-09-21-09-39-06-4925.zip', '2023-09-21 03:39:06', '2023-09-21 03:40:32'),
(4, 7, 'Dimensions: 1920x1080 pixels', '30', 'Script-2023-09-21-09-41-01-6389.zip', '2023-09-21 03:41:01', '2023-09-21 03:41:01'),
(5, 8, '1140x1080 pixels', '21', 'Script-2023-09-21-09-54-14-5987.zip', '2023-09-21 03:54:14', '2023-09-21 03:54:14'),
(6, 8, '1920x1080 pixels', '69', 'Script-2023-09-21-09-54-39-9842.zip', '2023-09-21 03:54:39', '2023-09-21 03:54:39'),
(7, 9, '1140x1080 pixels', '30', 'Script-2023-09-21-10-54-53-3011.zip', '2023-09-21 04:54:53', '2023-09-21 04:54:53'),
(8, 9, '1920x1080 pixels', '50', 'Script-2023-09-21-10-55-14-3647.zip', '2023-09-21 04:55:14', '2023-09-21 04:55:14'),
(9, 10, 'Dimensions: 545px - 1029px', '20', 'Script-2023-09-21-11-10-00-1852.zip', '2023-09-21 05:10:00', '2023-09-21 05:10:00'),
(10, 10, 'Dimensions: 1080px - 2029px', '26', 'Script-2023-09-21-11-10-56-9510.zip', '2023-09-21 05:10:56', '2023-09-21 05:11:40'),
(11, 11, 'Adventure Package', '40', 'Script-2023-09-21-11-44-49-2794.zip', '2023-09-21 05:44:49', '2023-09-21 05:44:49'),
(12, 11, 'Explore Package', '50', 'Script-2023-09-21-11-45-16-5142.zip', '2023-09-21 05:45:16', '2023-09-21 05:45:16'),
(13, 11, 'Holiday Package', '60', 'Script-2023-09-21-11-45-43-2802.zip', '2023-09-21 05:45:43', '2023-09-21 05:45:43'),
(14, 12, 'Ten-month support', '19', 'Script-2023-09-21-12-22-31-1632.zip', '2023-09-21 06:22:31', '2023-09-21 06:22:31'),
(15, 12, 'Unlimited support', '100', 'Script-2023-09-21-12-23-32-5723.zip', '2023-09-21 06:23:32', '2023-09-21 06:23:32'),
(16, 13, 'HD : 720 X 1280', '49', 'Script-2023-09-21-12-56-28-6337.zip', '2023-09-21 06:56:28', '2023-09-21 06:56:43'),
(17, 13, 'Full HD : 720 X 1280', '70', 'Script-2023-09-21-12-57-07-4802.zip', '2023-09-21 06:57:07', '2023-09-21 06:57:07'),
(18, 14, 'Five-month support', '51', 'Script-2023-09-21-01-13-38-5391.zip', '2023-09-21 07:13:38', '2023-09-21 07:13:38'),
(19, 14, 'Full-time support', '71', 'Script-2023-09-21-01-14-38-6151.zip', '2023-09-21 07:14:38', '2023-09-21 07:14:38'),
(20, 15, 'Video quality - 360p', '15', 'Script-2023-09-21-01-51-15-4024.zip', '2023-09-21 07:51:15', '2023-09-21 07:51:15'),
(21, 15, 'Video quality - 720p', '50', 'Script-2023-09-21-01-52-01-8896.zip', '2023-09-21 07:52:01', '2023-09-21 07:52:01'),
(22, 16, '10 Audio Song', '19', 'Script-2023-09-21-03-34-41-8901.zip', '2023-09-21 09:34:41', '2023-09-21 09:34:41'),
(23, 16, '30 Audio Song', '20', 'Script-2023-09-21-03-35-06-8042.zip', '2023-09-21 09:35:06', '2023-09-21 09:35:06'),
(24, 17, '30 Audio Song', '20', 'Script-2023-09-21-03-46-20-4185.zip', '2023-09-21 09:46:20', '2023-09-21 09:46:20'),
(25, 17, '40 Audio Song', '24', 'Script-2023-09-21-03-46-37-7949.zip', '2023-09-21 09:46:37', '2023-09-21 09:46:37'),
(26, 18, '50 Audio Song', '27', 'Script-2023-09-21-04-07-59-2822.zip', '2023-09-21 10:07:59', '2023-09-21 10:07:59'),
(27, 18, '60 Audio Song', '30', 'Script-2023-09-21-04-08-32-8000.zip', '2023-09-21 10:08:32', '2023-09-21 10:08:32'),
(28, 19, '100 Audio Song', '20', 'Script-2023-09-21-04-22-27-5493.zip', '2023-09-21 10:22:27', '2023-09-21 10:22:27'),
(29, 19, '150 Audio Song', '25', 'Script-2023-09-21-04-23-04-8025.zip', '2023-09-21 10:23:04', '2023-09-21 10:23:04'),
(30, 20, '35 Audio Song', '15', 'Script-2023-09-21-05-02-39-2945.zip', '2023-09-21 11:02:39', '2023-09-21 11:02:39'),
(31, 20, '45 Audio Song', '25', 'Script-2023-09-21-05-03-04-9303.zip', '2023-09-21 11:03:04', '2023-09-21 11:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `provider_client_reports`
--

CREATE TABLE `provider_client_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `report_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_withdraws`
--

CREATE TABLE `provider_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` double NOT NULL,
  `withdraw_amount` double NOT NULL,
  `withdraw_charge` double NOT NULL,
  `account_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_withdraws`
--

INSERT INTO `provider_withdraws` (`id`, `user_id`, `method`, `total_amount`, `withdraw_amount`, `withdraw_charge`, `account_info`, `status`, `approved_date`, `created_at`, `updated_at`) VALUES
(2, 2, 'Bank Payment', 50, 45, 10, 'Test Account', 1, '2023-09-23', '2023-09-23 07:48:06', '2023-09-23 07:49:54'),
(3, 2, 'Bank Payment', 40, 36, 10, 'Test Account', 0, NULL, '2023-09-23 07:48:42', '2023-09-23 07:48:42'),
(4, 2, 'Bank Payment', 20, 18, 10, 'Test Account', 1, '2023-09-23', '2023-09-23 07:49:23', '2023-09-23 07:49:40'),
(5, 1, 'Bank Payment', 100, 90, 10, 'My test account number', 1, '2023-09-23', '2023-09-23 07:52:09', '2023-09-23 07:53:39'),
(6, 1, 'Bank Payment', 60, 54, 10, 'My test account number', 0, NULL, '2023-09-23 07:52:41', '2023-09-23 07:52:41'),
(7, 1, 'Bank Payment', 25, 22.5, 10, 'My test account number', 1, '2023-09-23', '2023-09-23 07:53:13', '2023-09-23 07:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `pusher_credentails`
--

CREATE TABLE `pusher_credentails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_cluster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pusher_credentails`
--

INSERT INTO `pusher_credentails` (`id`, `app_id`, `app_key`, `app_secret`, `app_cluster`, `created_at`, `updated_at`) VALUES
(1, '1338069', 'e013174602072a186b1d', '46de951521010c14b205', 'mt1', NULL, '2022-01-29 12:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_payments`
--

CREATE TABLE `razorpay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_rate` double NOT NULL DEFAULT 1,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `razorpay_payments`
--

INSERT INTO `razorpay_payments` (`id`, `status`, `name`, `currency_rate`, `country_code`, `currency_code`, `description`, `image`, `color`, `key`, `secret_key`, `created_at`, `updated_at`, `currency_id`) VALUES
(1, 1, 'Ecommerce', 74.66, 'IN', 'INR', 'This is description', 'uploads/website-images/razorpay-2023-05-11-05-37-00-6286.png', '#2d15e5', 'rzp_test_K7CipNQYyyMPiS', 'zSBmNMorJrirOrnDrbOd1ALO', NULL, '2023-10-18 06:12:14', 3);

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `account_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'awaiting_for_admin_approval',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_requests`
--

INSERT INTO `refund_requests` (`id`, `client_id`, `order_id`, `account_information`, `resone`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'IBBL AAA Branch\r\nAccount Number : 32145221112', 'this is test resone', 'awaiting_for_admin_approval', '2022-10-04 09:54:02', '2022-10-04 09:54:02'),
(2, 1, 5, 'this is my bank account number.', 'this is test resone', 'awaiting_for_admin_approval', '2022-10-04 10:17:51', '2022-10-04 10:17:51'),
(3, 1, 6, 'this is my bank information.', 'this is test resone', 'awaiting_for_admin_approval', '2022-11-09 05:49:24', '2022-11-09 05:49:24'),
(4, 1, 10, 'this is my account information\r\nIBBL USA, Account : 9485998434.....9895453', 'This is test resone', 'awaiting_for_admin_approval', '2022-12-21 03:47:22', '2022-12-21 03:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(10) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `order_id`, `variant_id`, `user_id`, `author_id`, `review`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 1, NULL, 1, 2, 'Oifolio-Digital Marketing Theme is a robust and user-friendly tool for enhancing your online presence. Its sleek design, extensive features, and excellent customer support make it a strong contender in the digital marketing theme market. While it could benefit from some performance improvements, it offers great value for the investment.', 5, 1, '2023-09-23 08:03:25', '2023-09-23 08:03:41'),
(2, 19, 2, 29, 1, 2, 'I recently had the opportunity to use Multi-Branch Restaurant Software, and overall, I was quite impressed with its performance and capabilities. This software offers a range of features that make it a valuable tool for various tasks, but it does have a few areas where it could improve.', 5, 1, '2023-09-23 08:20:49', '2023-09-23 08:20:56'),
(3, 23, 3, NULL, 2, 1, 'The SaaS Landing Software Theme is a cost-effective solution for crafting a sleek SaaS landing page. It&#039;s user-friendly and offers responsive customer support.', 5, 1, '2023-09-23 08:38:44', '2023-09-23 08:38:53'),
(4, 20, 3, 31, 2, 1, 'It is a great supporting product for single-branch restaurants.', 5, 1, '2023-09-23 08:53:54', '2023-09-23 08:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `script_contents`
--

CREATE TABLE `script_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regular_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extend_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `script_contents`
--

INSERT INTO `script_contents` (`id`, `regular_content`, `extend_content`, `status`, `created_at`, `updated_at`) VALUES
(1, '<ul class=\"feature\">\n<li style=\"text-align: left;\">All time Future updates</li>\n<li style=\"text-align: left;\">Quality checked by AlasMart</li>\n<li style=\"text-align: left;\">6 months support from author</li>\n</ul>', '<ul class=\"feature\">\n<li style=\"text-align: left;\">All time Future updates</li>\n<li style=\"text-align: left;\">Quality checked by AlasMart</li>\n<li style=\"text-align: left;\">12 months support from author</li>\n</ul>', 0, '2023-06-06 07:09:26', '2023-08-10 06:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `script_content_languages`
--

CREATE TABLE `script_content_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `script_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extend_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `script_content_languages`
--

INSERT INTO `script_content_languages` (`id`, `script_id`, `lang_code`, `regular_content`, `extend_content`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '<ul class=\"feature\">\r\n<li>All time Future updates</li>\r\n<li>Quality checked by DigMark</li>\r\n<li>6 months support from author</li>\r\n</ul>', '<ul class=\"feature\">\r\n<li>All time Future updates</li>\r\n<li>Quality checked by DigMark</li>\r\n<li>12 months support from author</li>\r\n</ul>', NULL, '2023-08-28 09:15:59'),
(22, 1, 'bn', '<ul class=\"feature\">\r\n<li>৬ মাস সাপোর্ট</li>\r\n<li>কোয়ালিটি চেক</li>\r\n<li>ভবিষ্যত আপডেট</li>\r\n</ul>', '<ul class=\"feature\">\r\n<li>১২ মাস সাপোর্ট</li>\r\n<li>কোয়ালিটি চেক</li>\r\n<li>ভবিষ্যত আপডেট</li>\r\n</ul>', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `section_contents`
--

CREATE TABLE `section_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_contents`
--

INSERT INTO `section_contents` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-01-15 04:23:04'),
(2, NULL, '2022-11-06 07:11:42'),
(3, NULL, '2022-11-06 07:11:48'),
(4, NULL, '2023-06-22 11:53:52'),
(5, NULL, '2023-07-26 12:02:42'),
(6, NULL, '2023-07-19 10:14:24'),
(7, NULL, '2023-07-19 11:14:21'),
(8, NULL, '2023-07-19 11:15:18'),
(9, NULL, '2023-07-19 11:32:17'),
(10, NULL, '2023-07-20 06:39:35'),
(11, NULL, '2023-07-20 12:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `section_content_languages`
--

CREATE TABLE `section_content_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_content_languages`
--

INSERT INTO `section_content_languages` (`id`, `content_id`, `lang_code`, `section_name`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Category', 'Save time with pre-installed software.', 'Browse Best Categories', NULL, '2023-08-28 09:15:59'),
(4, 2, 'en', 'Product', 'Save time with pre-installed software.', 'Themes and Templates for every Budget & every Project.', NULL, '2023-09-23 05:42:24'),
(7, 3, 'en', 'Recent Approved', 'Save time with pre-installed software.', 'Recent Approved Products', NULL, '2023-08-28 09:15:59'),
(10, 4, 'en', 'Testimonial', 'Save time with pre-installed software.', 'Our Customer feedback', NULL, '2023-08-28 09:15:59'),
(13, 5, 'en', 'Latest News', 'Latest News', 'Latest from Blog', NULL, '2023-08-28 09:15:59'),
(16, 6, 'en', 'Featured Product', 'Save time with pre-installed software.', 'Featured Items Alasmart.', NULL, '2023-08-28 09:15:59'),
(19, 7, 'en', 'Trending Product', 'Save time with pre-installed software.', 'Trending Themes', NULL, '2023-08-28 09:15:59'),
(22, 8, 'en', 'New Product', 'Save time with pre-installed software.', 'New Products', NULL, '2023-08-28 09:15:59'),
(25, 9, 'en', 'Our Team', 'Our Expert Team', 'Expert Team Member', NULL, '2023-08-28 09:15:59'),
(28, 10, 'en', 'Template', 'From multipurpose themes to niche templates', 'The only one Template you need', NULL, '2023-08-28 09:15:59'),
(31, 11, 'en', 'Partner', 'Save time with pre-installed software.', 'Some of Our Customers', NULL, '2023-08-28 09:15:59'),
(188, 1, 'bn', 'ক্যাটাগরি', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'সেরা বিভাগ ব্রাউজ করুন', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(189, 2, 'bn', 'প্রোডাক্ট', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'প্রতিটি বাজেট এবং প্রতিটি প্রকল্পের জন্য থিম এবং টেমপ্লেট।', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(190, 3, 'bn', 'রিসেন্ট এপ্রুভ', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'সাম্প্রতিক অনুমোদিত পণ্য', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(191, 4, 'bn', 'টেস্টিমনিয়াল', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'আমাদের গ্রাহক প্রতিক্রিয়া', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(192, 5, 'bn', 'লেটেস্ট নিউজ', 'সর্বশেষ সংবাদ', 'সর্বশেষ ব্লগ থেকে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(193, 6, 'bn', 'ফিচার্ড প্রোডাক্ট', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'বৈশিষ্ট্যযুক্ত আইটেম এলাসমার্ট ।', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(194, 7, 'bn', 'ট্রেন্ডিং প্রোডাক্ট', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'ট্রেন্ডিং থিম', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(195, 8, 'bn', 'নিউ প্রোডাক্ট', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'নিউ প্রোডাক্টস', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(196, 9, 'bn', 'আমাদের টিম', 'আমাদের বিশেষজ্ঞ দল', 'বিশেষজ্ঞ দলের সদস্য', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(197, 10, 'bn', 'টেমপ্লেট', 'বহুমুখী থিম থেকে কুলুঙ্গি টেমপ্লেট', 'আপনার প্রয়োজন শুধুমাত্র একটি টেমপ্লেট', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(198, 11, 'bn', 'পার্টনার', 'আগে থেকে ইনস্টল করা সফ্টওয়্যার দিয়ে সময় বাঁচান।', 'আমাদের কিছু কাস্টমার', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `section_controls`
--

CREATE TABLE `section_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_controls`
--

INSERT INTO `section_controls` (`id`, `page_name`, `section_name`, `status`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'home1', 'Intro(Home1, Home2, Home3)', 1, 0, NULL, '2022-09-27 07:34:04'),
(2, 'home1', 'Category (Home1, Home2, Home3, Become an author)', 1, 9, NULL, '2023-06-26 08:11:55'),
(3, 'home1', 'Product (Home1, Home2, Home3)', 1, 9, NULL, '2023-07-24 06:08:55'),
(4, 'home1', 'Countdown (Home2, Home3)', 1, 0, NULL, '2022-09-29 06:42:30'),
(5, 'home1', 'Special Offer Banner(Home1, Home2, Home3)', 1, 0, NULL, '2022-10-03 10:21:35'),
(6, 'home1', 'Recent Product(Home1, Home2, Home3)', 1, 15, NULL, '2023-10-02 10:08:45'),
(7, 'home1', 'Mobile app (Home1, Home2, Home3)', 1, 0, NULL, '2022-09-27 08:11:30'),
(8, 'home1', 'Testimonial (Home1, Home3)', 1, 6, NULL, '2022-09-29 06:47:03'),
(9, 'home1', 'Blog (Home1)', 1, 3, NULL, '2023-10-02 10:21:58'),
(10, 'home1', 'Why Choose Us (Home1, Home2, Home3)', 1, 0, NULL, NULL),
(22, 'home1', 'Our Partner(Home1)', 1, 20, NULL, '2022-09-29 06:56:54'),
(35, 'about', 'Our Team(About, Become an author)', 1, 10, NULL, '2022-09-27 09:19:53'),
(36, 'about', 'Why Choose Us (About)', 1, 0, NULL, '2022-09-27 09:19:53'),
(37, 'about', 'Testimonial (About)', 1, 4, NULL, '2022-09-29 06:42:30'),
(38, 'about', 'Mobile App (About)', 1, 0, NULL, '2022-09-27 09:25:25'),
(39, 'about', 'Our Partner (About)', 0, 10, NULL, '2022-09-27 09:30:26'),
(40, 'about', 'Testimonial (About)', 1, 6, NULL, '2022-09-29 06:47:04'),
(41, 'service', 'Blog (About)', 1, 20, NULL, '2022-09-29 06:56:54'),
(42, 'featured', 'Featured Items(Home1, Home2, Home3)', 1, 3, NULL, '2023-07-22 14:44:13'),
(43, 'home2', 'Blog(Home2)', 1, 3, NULL, '2023-07-26 12:09:53'),
(44, 'home3', 'Blog(Home3)', 1, 3, NULL, '2023-07-22 14:54:06'),
(45, 'template', 'Template ', 1, 0, NULL, '2023-07-24 09:06:45'),
(46, 'trending', 'Trending items', 1, 30, NULL, '2023-07-26 04:35:01'),
(47, 'new product', 'New product(Home3)', 1, 9, NULL, '2023-07-27 04:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `page_name`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, 'Home Page', 'Home || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', 'Home || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', NULL, '2023-10-10 04:01:32'),
(2, 'About Us', 'About Us || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', 'About Us || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', NULL, '2023-10-10 04:01:40'),
(3, 'Contact Us', 'Contact Us || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', 'Contact Us || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', NULL, '2023-10-10 04:01:47'),
(5, 'Products', 'Our Product || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', 'Our Product || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', NULL, '2023-10-10 04:02:02'),
(6, 'Blog', 'Blog || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', 'Blog || Alasmart - Digital Products Buy Sell Marketplace Laravel Script', NULL, '2023-10-10 04:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `maintenance_mode` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_subscription_notify` int(11) NOT NULL DEFAULT 1,
  `enable_save_contact_message` int(11) NOT NULL DEFAULT 1,
  `text_direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LTR',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_lg_header` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_sm_header` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topbar_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topbar_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_rate` double NOT NULL DEFAULT 1,
  `theme_one` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_subscription_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home3_subscription_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_page_subscription_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_foreground` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_call_as` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_available` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_form_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_contact_form_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_it_work_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_it_work_foreground` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_it_work_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_it_work_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_it_work_items` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selected_theme` int(1) NOT NULL DEFAULT 0,
  `blog_left_right` int(11) DEFAULT 0,
  `theme_one_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_two_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_three_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `maintenance_mode`, `logo`, `logo_two`, `logo_three`, `favicon`, `contact_email`, `enable_subscription_notify`, `enable_save_contact_message`, `text_direction`, `timezone`, `sidebar_lg_header`, `sidebar_sm_header`, `topbar_phone`, `topbar_email`, `opening_time`, `currency_name`, `currency_icon`, `currency_rate`, `theme_one`, `subscriber_image`, `subscription_bg`, `home2_subscription_bg`, `home3_subscription_bg`, `blog_page_subscription_image`, `default_avatar`, `home2_contact_foreground`, `home2_contact_background`, `home2_contact_call_as`, `home2_contact_phone`, `home2_contact_available`, `home2_contact_form_title`, `home2_contact_form_description`, `how_it_work_background`, `how_it_work_foreground`, `how_it_work_title`, `how_it_work_description`, `how_it_work_items`, `selected_theme`, `blog_left_right`, `theme_one_color`, `theme_two_color`, `theme_three_color`, `login_image`, `footer_logo`, `footer_logo_two`, `footer_logo_three`, `created_at`, `updated_at`, `app_version`) VALUES
(1, 1, 'uploads/website-images/logo-2023-08-08-04-45-31-7094.png', 'uploads/website-images/logo-2023-08-09-09-30-43-8505.png', 'uploads/website-images/logo-2023-08-09-09-30-43-4591.png', 'uploads/website-images/favicon-2023-08-08-05-14-26-7280.png', 'contact@gmail.com', 1, 1, 'ltr', 'Asia/Dhaka', 'ALASMAET', 'DM', '+1347-430-9510', 'websolutionus1@gmail.com', '10.00 AM-7.00PM', 'USD', '$', 85.76, '#009bc2', 'uploads/website-images/sub-foreground--2023-01-22-01-32-17-2063.png', 'uploads/website-images/sub-background-2023-10-09-10-31-56-4622.jpg', 'uploads/website-images/sub-background-2023-10-09-10-32-44-4402.jpg', 'uploads/website-images/sub-background-2023-10-09-10-26-45-3495.jpg', 'uploads/website-images/blog-sub-background-2023-07-19-04-43-08-8818.png', 'uploads/website-images/default-avatar-2023-06-06-06-05-18-9960.png', 'uploads/website-images/home2-contact-foreground--2022-12-03-06-08-24-3082.png', 'uploads/website-images/home2-contact-background-2022-09-22-12-08-16-6090.jpg', 'Call as now', '+90 456 789 251', 'We are available 24/7', 'Do you have any question ?', 'Fill the form now & Request an Estimate', 'uploads/website-images/home3-hiw-background-2022-09-22-12-52-40-5965.jpg', 'uploads/website-images/home3-hiw-foreground--2022-09-29-01-06-00-1394.jpg', 'Enjoy Services', 'If you are going to use a passage of you need to be sure there isn\'t anything emc barrassing hidden in the middle', '[{\"title\":\"Select The Service\",\"description\":\"There are many variations of passages of Lorem Ipsum available, but the majority have\"},{\"title\":\"Pick Your Schedule\",\"description\":\"There are many variations of passages of Lorem Ipsum available, but the majority have\"},{\"title\":\"Place Your Booking & Relax\",\"description\":\"There are many variations of passages of Lorem Ipsum available, but the majority have\"}]', 0, 1, '#378fff', '#00bf8c', '#2251f2', 'uploads/website-images/login-page-2022-11-06-04-12-11-6638.png', 'uploads/website-images/logo-2023-08-08-05-12-32-2674.png', 'uploads/website-images/logo-2023-08-09-09-30-43-2035.png', 'uploads/website-images/logo-2023-08-09-09-30-43-2579.png', NULL, '2023-10-09 05:40:02', '1.1');

-- --------------------------------------------------------

--
-- Table structure for table `setting_languages`
--

CREATE TABLE `setting_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriber_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_languages`
--

INSERT INTO `setting_languages` (`id`, `setting_id`, `lang_code`, `subscriber_title`, `subscriber_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Subscribe Now', 'Get the updates, offers, tips and enhance your page building experience', NULL, '2023-08-28 09:15:59'),
(18, 1, 'bn', 'এখন সাবস্ক্রাইব করুন', 'আপডেট, অফার, টিপস পান এবং আপনার পৃষ্ঠা তৈরির অভিজ্ঞতা বাড়ান৷', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_sold` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home1_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home3_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home3_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `total_product`, `total_sold`, `total_user`, `home2_image`, `home1_bg`, `home2_bg`, `home3_image`, `home3_bg`, `created_at`, `updated_at`) VALUES
(1, '34', '2', '243', 'uploads/website-images/slider-2023-07-26-12-56-49-1064.png', 'uploads/website-images/slider-2023-07-24-09-44-11-1729.jpg', 'uploads/website-images/slider-2023-07-26-12-56-49-5186.jpg', 'uploads/website-images/slider-2023-07-19-03-54-26-8823.png', 'uploads/website-images/slider-2023-07-19-03-54-26-5203.jpg', '2022-01-30 10:25:59', '2023-07-27 03:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `slider_languages`
--

CREATE TABLE `slider_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home2_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home3_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_languages`
--

INSERT INTO `slider_languages` (`id`, `slider_id`, `lang_code`, `home1_title`, `home2_title`, `home2_description`, `home3_title`, `home3_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'The world’s largest website digital marketplace', 'Digital marketplace sell products', 'Save time with preconfigured environments that are already on the find to find all the prerequisites installed which removes.', 'Best place to buy and sell digital products.', 'Website, Graphics, and Plugins Marketplace', NULL, '2023-09-23 10:30:24'),
(18, 1, 'bn', 'বিশ্বের বৃহত্তম ওয়েবসাইট ডিজিটাল মার্কেটপ্লেস', 'ডিজিটাল মার্কেটপ্লেসে পণ্য বিক্রি', 'প্রি-কনফিগার করা পরিবেশের সাথে সময় বাঁচান যেগুলি ইনস্টল করা সমস্ত পূর্বশর্ত খুঁজে বের করার জন্য ইতিমধ্যেই রয়েছে যা সরিয়ে দেয়।', 'ডিজিটাল পণ্য কেনা-বেচা করার সেরা জায়গা।', 'ওয়েবসাইট, গ্রাফিক্স এবং প্লাগইনস মার্কেটপ্লেস', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `social_login_information`
--

CREATE TABLE `social_login_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_gmail` int(11) NOT NULL DEFAULT 0,
  `gmail_client_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmail_secret_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmail_redirect_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_login_information`
--

INSERT INTO `social_login_information` (`id`, `is_gmail`, `gmail_client_id`, `gmail_secret_id`, `gmail_redirect_url`, `created_at`, `updated_at`) VALUES
(1, 1, '323323272597-gtl9kuearctqrjk9plp9vs7uouj2uujp.apps.googleusercontent.com', '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', 'http://localhost/degmark_digital_market_place/script_content/main_files/callback/google/', NULL, '2023-08-31 09:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `sslcommerz_payments`
--

CREATE TABLE `sslcommerz_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `store_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(8,2) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sslcommerz_payments`
--

INSERT INTO `sslcommerz_payments` (`id`, `status`, `store_id`, `store_password`, `country_code`, `currency_code`, `currency_rate`, `image`, `created_at`, `updated_at`, `currency_id`) VALUES
(1, 1, 'degma645b10929dcac', 'degma645b10929dcac@ssl', 'US', 'USD', 1.00, 'uploads/website-images/sslcommerz-2023-05-11-05-11-25-6099.png', '2023-05-11 10:42:00', '2023-10-18 06:22:39', 2);

-- --------------------------------------------------------

--
-- Table structure for table `stripe_payments`
--

CREATE TABLE `stripe_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `stripe_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stripe_payments`
--

INSERT INTO `stripe_payments` (`id`, `status`, `stripe_key`, `stripe_secret`, `created_at`, `updated_at`, `country_code`, `currency_code`, `currency_rate`, `image`, `currency_id`) VALUES
(1, 1, 'pk_test_51LBgDoBsmz7k2BTD4eYrzmvswQIIm6nNmYTCMNSaMXTGde9ay60iJBP2iZhY2Fg6FM1hjk9BE1fudSWSxe6vxojG00gQN55ihb', 'sk_test_51LBgDoBsmz7k2BTDEu7pmlecAU84RwZhOx869Bz0ujoP4hDpyxePhOsepBYANVNey5W9OmUQ6112dZqzcdq4xRmX00l6OEWd8b', NULL, '2023-10-18 06:03:52', 'US', 'USD', 1, 'uploads/website-images/stripe-2023-05-11-05-35-11-6150.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `verified_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tawk_chats`
--

CREATE TABLE `tawk_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tawk_chats`
--

INSERT INTO `tawk_chats` (`id`, `chat_link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://embed.tawk.to/5a7c31ded7591465c7077c48/default', 1, '2023-06-24 08:37:29', '2023-06-24 09:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `image`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/custom-images/template--2023-09-23-11-17-03-9324.png', 'https://codecanyon.net/user/quomodotheme/portfolio', 1, '2023-08-29 08:52:10', '2023-10-01 09:19:41'),
(2, 'uploads/custom-images/template--2023-09-23-11-16-45-9831.png', 'https://codecanyon.net/user/quomodotheme/portfolio', 1, '2023-08-29 08:53:22', '2023-10-01 09:19:30'),
(3, 'uploads/custom-images/template--2023-09-23-11-16-26-4643.png', 'https://codecanyon.net/user/quomodotheme/portfolio', 1, '2023-08-29 08:54:14', '2023-10-01 09:19:17'),
(4, 'uploads/custom-images/template--2023-09-23-11-16-10-8964.png', 'https://codecanyon.net/user/quomodotheme/portfolio', 1, '2023-08-29 08:55:57', '2023-10-01 09:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `template_languages`
--

CREATE TABLE `template_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_languages`
--

INSERT INTO `template_languages` (`id`, `template_id`, `lang_code`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Flexible Prices', 'There are many variationts of passages Lorem Ipsum available, but the majorit have suffered alteration', '2023-08-29 08:52:10', '2023-09-16 08:16:07'),
(5, 2, 'en', 'Web & App Design', 'There are many variationts of passages Lorem Ipsum available, but the majorit have suffered alteration', '2023-08-29 08:53:22', '2023-09-16 08:15:41'),
(9, 3, 'en', 'Friendly Our Support', 'There are many variationts of passages Lorem Ipsum available, but the majorit have suffered alteration', '2023-08-29 08:54:14', '2023-08-29 08:54:14'),
(13, 4, 'en', 'Graphic Design', 'There are many variationts of passages Lorem Ipsum available, but the majorit have suffered alteration', '2023-08-29 08:55:57', '2023-09-16 08:14:20'),
(33, 1, 'bn', 'নমনীয় মূল্য', 'লোরেম ইপসাম প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু বেশিরভাগই পরিবর্তনের শিকার হয়েছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(34, 2, 'bn', 'ওয়েব ও অ্যাপ ডিজাইন', 'লোরেম ইপসাম প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু বেশিরভাগই পরিবর্তনের শিকার হয়েছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(35, 3, 'bn', 'বন্ধুত্বপূর্ণ আমাদের সমর্থন', 'লোরেম ইপসাম প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু বেশিরভাগই পরিবর্তনের শিকার হয়েছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(36, 4, 'bn', 'গ্রাফিক ডিসাইন', 'লোরেম ইপসাম প্যাসেজের অনেক বৈচিত্র পাওয়া যায়, কিন্তু বেশিরভাগই পরিবর্তনের শিকার হয়েছে', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`id`, `created_at`, `updated_at`) VALUES
(1, '2022-01-30 12:34:53', '2023-06-26 07:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_condition_languages`
--

CREATE TABLE `terms_and_condition_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_and_condition` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_condition_languages`
--

INSERT INTO `terms_and_condition_languages` (`id`, `terms_id`, `lang_code`, `terms_and_condition`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '<h4><strong>1. What Are Terms and Conditions?</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriefss asbut also the on leap into a electironc typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andeiss more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<h4><strong>2. Does My Online Service Need Terms and Conditions?</strong></h4>\r\n<p>While it&rsquo;s not legally required for ecommerce websites to have a terms and conditions agreement, adding one will help protect your as sonline business.As terms and conditions are legally enforceable rules, they allow you to set standards for how users interact with your site. Here are some of the major abenefits of including terms and conditions on your ecommerce site.&nbsp;</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the obb1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop.</p>\r\n<h4><strong>Features :</strong></h4>\r\n<ul>\r\n<li>Lim body with metal cover</li>\r\n<li>Latest Intel Core i5-1135G7 processor (4 cores / 8 threads)</li>\r\n<li>8GB DDR4 RAM and fast 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture support</li>\r\n</ul>\r\n<h4><strong>3. Protect Your Property</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriezcs but also the on leap into as eylectronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraszvxet sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book. five centuries but also a the on leap into electronic typesetting, remaining essentially unchanged. It aswasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop our aspublishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<h4><strong>4. What to Include in Terms and Conditions for Online Stores</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also the on leap into as electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of as Leitraset sheets containing Loriem Ipsum passages, our andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Loriem Ipsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets as containing Lorem Ipsum passages, andei more recently with a desktop publishing software like Aldus PageMaker including versions of Loremas&nbsp; Ipsum to make a type specimen book.</p>\r\n<h4><strong>05.Pricing and Payment Terms</strong></h4>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five as centuries but also as the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release as of Letraset sheets containing Lorem Ipsum our spassages, andei more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>\r\n<p>Five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing software like Aldus PageMaker our as including versions of Lorem aIpsum to make a type specimen book. It wasn&rsquo;t popularised in the 1960s with the release of Letraset sheetsasd containing Lorem Ipsum passages, andei more recentlysl with desktop publishing software like Aldus PageMaker including versions of Loremadfsfds Ipsum to make a type specimen book.</p>\r\n<p>It has survived not only five centuries but also the on leap into electronic typesetting, remaining essentially unchanged. It wasn&rsquo;t popularised in the our 1960s with the release of Letraset sheets containing Lorem Ipsum passages, andei more recently with desktop publishing asou software like Aldus PageMaker including versions of Lorem Ipsum to make a type specimen book.</p>', NULL, '2023-09-23 06:27:23'),
(17, 1, 'bn', '<p><strong>১। শর্তাবলী কি?</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীই টিকে আছে নয় বরং একটি বৈদ্যুতিক টাইপসেটিংয়ে লাফিয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার দিয়ে এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>২। আমার অনলাইন পরিষেবার কি শর্তাবলীর প্রয়োজন?</strong></p>\r\n<p>যদিও ইকমার্স ওয়েবসাইটগুলির জন্য একটি শর্ত ও শর্তের চুক্তি থাকা আইনত প্রয়োজন হয় না, তবে একটি যোগ করা আপনার সোনলাইন ব্যবসা হিসাবে রক্ষা করতে সহায়তা করবে৷ যেহেতু শর্তাবলী আইনত প্রয়োগযোগ্য নিয়ম, সেগুলি আপনাকে ব্যবহারকারীরা কীভাবে আপনার সাইটের সাথে ইন্টারঅ্যাক্ট করবে তার জন্য মান নির্ধারণ করতে দেয়৷ এখানে আপনার ইকমার্স সাইটের শর্তাবলী সহ কিছু প্রধান সুবিধা রয়েছে।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে obb1960-এর দশকে জনপ্রিয় হয়নি, এবং সম্প্রতি ডেস্কটপের সাথে।</p>\r\n<p><strong>বৈশিষ্ট্য :</strong></p>\r\n<ul>\r\n<li>ধাতব আবরণ সহ সিলিম বডি</li>\r\n<li>সর্বশেষ ইন্টেল কোর i5-1135G7 প্রসেসর (4 কোর / 8 থ্রেড)</li>\r\n<li>8GB DDR4 RAM এবং দ্রুত 512GB PCIe SSD</li>\r\n<li>NVIDIA GeForce MX350 2GB GDDR5 গ্রাফিক্স কার্ড ব্যাকলিট কীবোর্ড, অঙ্গভঙ্গি সমর্থন সহ টাচপ্যাড</li>\r\n</ul>\r\n<p><strong>৩। আপনার সম্পত্তি রক্ষা করুন</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি শুধুমাত্র পাঁচ সেঞ্চুরিইজসিস নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করতে লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি। পাঁচ শতাব্দী কিন্তু ইলেকট্রনিক টাইপসেটিং-এ একটি অন লিপ, অপরিহার্যভাবে অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি আমাদের ডেস্কটপে Aldus PageMaker-এর মতো প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণ সহ একটি টাইপ নমুনা বই তৈরি করা হয়েছে।</p>\r\n<p><strong>৪। অনলাইন স্টোরের শর্তাবলীতে কী অন্তর্ভুক্ত করতে হবে</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবল পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং হিসাবেও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লোরিয়েম ইপসাম প্যাসেজ সম্বলিত লেইট্রাসেট শীট হিসাবে প্রকাশের সাথে জনপ্রিয় হয়নি, আমাদের সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। এটি 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ লরেম ইপসাম-এর সংস্করণগুলিকে একটি টাইপ নমুনা বই তৈরি করার জন্য। 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো একটি ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ এটি জনপ্রিয় হয় নি।</p>\r\n<p><strong>০৫।মূল্য এবং অর্থপ্রদান শর্তাবলী</strong></p>\r\n<p>লরেম ইপসাম হল মুদ্রণ এবং টাইপসেটিং শিল্পের ডামি পাঠ্য। লোরেম ইপসাম 1500 এর দশক থেকে শিল্পের মানক ডামি টেক্সট হয়েছে, যখন একটি অজানা প্রিন্টার টাইপের একটি গ্যালি নিয়েছিল এবং একটি টাইপ নমুনা বই তৈরি করতে এটিকে স্ক্র্যাম্বল করেছিল। এটি কেবলমাত্র পাঁচটি শতাব্দীর মতোই নয় বরং ইলেকট্রনিক টাইপসেটিং-এ লাফানোর মতোও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লোরেম ইপসাম আমাদের স্প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের সাথে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপের নমুনা বই তৈরি করার জন্য Lorem Ipsum-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>পাঁচ শতক কিন্তু ইলেকট্রনিক টাইপসেটিং-এ লাফানো, মূলত অপরিবর্তিত রয়েছে। 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীট প্রকাশের মাধ্যমে এটি জনপ্রিয় হয়নি, এবং সম্প্রতি Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ Lorem aIpsum-এর সংস্করণগুলি অন্তর্ভুক্ত করে একটি টাইপ নমুনা বই তৈরি করা হয়েছে। এটি 1960-এর দশকে লোরেম ইপসাম প্যাসেজ সম্বলিত লেট্রাসেট শীটসাড প্রকাশের সাথে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি টাইপ নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>\r\n<p>এটি শুধুমাত্র পাঁচ শতাব্দী ধরেই টিকে আছে কিন্তু ইলেকট্রনিক টাইপসেটিংয়েও টিকে আছে, যা মূলত অপরিবর্তিত রয়েছে। এটি আমাদের 1960-এর দশকে লরেম ইপসাম প্যাসেজ সম্বলিত শীট প্রকাশের মাধ্যমে জনপ্রিয় হয়নি, এবং সম্প্রতি একটি ধরনের নমুনা বই তৈরি করার জন্য লরেম ইপসাম-এর সংস্করণ সহ Aldus PageMaker-এর মতো ডেস্কটপ প্রকাশনা সফ্টওয়্যার সহ।</p>', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 'uploads/custom-images/cameron-williamson-20230923114738.png', '5', 1, '2023-09-23 05:47:38', '2023-09-23 05:47:38'),
(2, 'uploads/custom-images/germane-cross-20230923114907.png', '5', 1, '2023-09-23 05:49:07', '2023-09-23 05:49:07'),
(3, 'uploads/custom-images/ginger-mcclain-20230923115017.png', '5', 1, '2023-09-23 05:50:17', '2023-09-23 05:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_languages`
--

CREATE TABLE `testimonial_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_id` int(11) NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_languages`
--

INSERT INTO `testimonial_languages` (`id`, `testimonial_id`, `lang_code`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Cameron Williamson', 'Designer', 'It is a long established fact that a reader will our the find to distracted by the readabe content of as page when the eash looking at its layout. The point of using Lorem Ips is that it Class aptent taciti sociosqu.', '2023-09-23 05:47:38', '2023-09-23 05:47:38'),
(2, 2, 'en', 'Germane Cross', 'Developer', 'It is a long established fact that a reader will our the find to distracted by the readabe content of as page when the eash looking at its layout. The point of using Lorem Ips is that it Class aptent taciti sociosqu.', '2023-09-23 05:49:07', '2023-09-23 05:49:07'),
(3, 3, 'en', 'Ginger Mcclain', 'CEO', 'It is a long established fact that a reader will our the find to distracted by the readabe content of as page when the eash looking at its layout. The point of using Lorem Ips is that it Class aptent taciti sociosqu.', '2023-09-23 05:50:17', '2023-09-23 05:50:17'),
(4, 1, 'bn', 'ক্যামেরন উইলিয়ামসন', 'ডিসাইনার', 'এটি একটি দীর্ঘ প্রতিষ্ঠিত সত্য যে একজন পাঠক যখন পৃষ্ঠাটির লেআউটটি দেখছেন তখন তার পাঠযোগ্য বিষয়বস্তু দ্বারা বিভ্রান্ত হবেন।', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(5, 2, 'bn', 'জার্মান ক্রস', 'ডেভেলপার', 'এটি একটি দীর্ঘ প্রতিষ্ঠিত সত্য যে একজন পাঠক যখন পৃষ্ঠাটির লেআউটটি দেখছেন তখন তার পাঠযোগ্য বিষয়বস্তু দ্বারা বিভ্রান্ত হবেন।', '2023-09-23 09:52:17', '2023-10-01 10:41:44'),
(6, 3, 'bn', 'গিজ্ঞের মকলাইন', 'সিইও', 'এটি একটি দীর্ঘ প্রতিষ্ঠিত সত্য যে একজন পাঠক যখন পৃষ্ঠাটির লেআউটটি দেখছেন তখন তার পাঠযোগ্য বিষয়বস্তু দ্বারা বিভ্রান্ত হবেন।', '2023-09-23 09:52:17', '2023-10-01 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forget_password_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forget_password_otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_provider` int(10) NOT NULL DEFAULT 0,
  `verify_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_mail_verify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` int(1) NOT NULL DEFAULT 0,
  `agree_policy` int(1) DEFAULT 0,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dribbble` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `my_skill` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `forget_password_token`, `forget_password_otp`, `status`, `provider_id`, `provider`, `provider_avatar`, `image`, `phone`, `country`, `state`, `city`, `zip_code`, `address`, `is_provider`, `verify_token`, `otp_mail_verify_token`, `email_verified`, `agree_policy`, `designation`, `about_me`, `facebook`, `pinterest`, `linkedIn`, `dribbble`, `twitter`, `my_skill`, `created_at`, `updated_at`) VALUES
(1, 'Abdullah Mamun', 'abdullah_mamun_577210', 'user@gmail.com', NULL, '$2y$10$YZAEBhLB88UIfCeGdlgfVODPHRFwpO9..wi2yTlcLccDtu9GQZrKm', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'uploads/custom-images/-2023-10-10-10-22-46-7799.png', '22-402-666', 'United State', 'California', 'Los Angeles', NULL, 'California, Los Angeles', 0, NULL, NULL, 1, 0, 'PHP, HTML5, CSS3, jQuery, Web Design, UI - UX Design.', 'Hello, I’m Abdullah Mamun.\r\nUI, UX, Frontend Development, Backend Development and much more...\r\n\r\nPHP, HTML5, CSS3, jQuery, Web Design, UI - UX Design.\r\n\r\nI have been working as a freelancer for more than 10 years. And I have experience at this level as well. If you have special requests, you can contact me by e-mail. I can do what you want in a short time and deliver it in a very clean way.\r\n\r\nYou can contact me faster on Instagram. If you follow and send a message, I will respond to messages within 30 minutes. If you don&#039;t follow me, I won&#039;t see the message because it goes to your other folder.\r\n\r\nThank you.', 'https://facebook.com', 'https://pinterest.com', 'https://linkedin.com', 'https://dribble.com', 'https://twitter.com', 'This is one of the best WordPress Theme. It is clean, user friendly, fully responsive, pixel perfect, modern design with latest WordPress Technologies\r\n\r\nYou can contact me faster on Instagram. If you follow and send a message, I will respond to messages within 30 minutes. If you don&#039;t follow me, I won&#039;t see the message because it goes to your other folder.\r\n\r\n&lt;ul&gt;\r\n&lt;li&gt;Fully Responsive Bootstrap Based (3.x) Latest&lt;/li&gt;\r\n&lt;li&gt;Clean, Modern &amp;amp; Beautiful Design&lt;/li&gt;\r\n&lt;li&gt;4 Unique Header Style&lt;/li&gt;\r\n&lt;li&gt;Elementor Page Builder&lt;/li&gt;\r\n&lt;li&gt;4 Footer Copyright Style&lt;/li&gt;\r\n&lt;li&gt;100% Valid Code&lt;/li&gt;\r\n&lt;li&gt;3000+ Font Icon&lt;/li&gt;\r\n&lt;li&gt;One Click Demo Import&lt;/li&gt;\r\n&lt;li&gt;Powerful Options Panel&lt;/li&gt;\r\n&lt;/ul&gt;', '2023-09-20 06:02:23', '2023-10-10 04:22:46'),
(2, 'John doe', 'john_doe_926000', 'user2@gmail.com', NULL, '$2y$10$wfqmoO726EWubhQJwEx//ePcGSZyjHRf3oDTe2SaLh3uTnwwflsXS', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'uploads/custom-images/-2023-09-20-12-20-31-4682.jpg', '22-402-667', 'United State', 'California', 'Los Angeles', NULL, 'California, Los Angeles', 0, NULL, NULL, 1, 0, 'John doe', '&lt;p&gt;Hello, I&amp;rsquo;m John Doe.&lt;/p&gt;\r\n&lt;p&gt;UI, UX, Frontend Development, Backend Development and much more...&lt;/p&gt;\r\n&lt;p&gt;PHP, HTML5, CSS3, jQuery, Web Design, UI - UX Design.&lt;/p&gt;\r\n&lt;p&gt;I have been working as a freelancer for more than 10 years. And I have experience at this level as well. If you have special requests, you can contact me by e-mail. I can do what you want in a short time and deliver it in a very clean way.&lt;/p&gt;\r\n&lt;p&gt;Mail: Demoemail@mail.com&lt;/p&gt;\r\n&lt;p&gt;You can contact me faster on Instagram. If you follow and send a message, I will respond to messages within 30 minutes. If you don&#039;t follow me, I won&#039;t see the message because it goes to your other folder.&lt;/p&gt;\r\n&lt;p&gt;Contact me on Instagram!&lt;/p&gt;\r\n&lt;p&gt;Thank you.&lt;/p&gt;', 'https://facebook.com', 'https://pinterest.com', 'https://linkedin.com', 'https://dribble.com', 'https://twitter.com', '&lt;p&gt;This is one of the best WordPress Theme. It is clean, user friendly, fully responsive, pixel perfect, modern design with latest WordPress Technologies&lt;/p&gt;\r\n&lt;p&gt;Fully Responsive Bootstrap Based (3.x) Latest&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Clean, Modern &amp;amp; Beautiful Design&lt;/li&gt;\r\n&lt;li&gt;4 Unique Header Style&lt;/li&gt;\r\n&lt;li&gt;Elementor Page Builder&lt;/li&gt;\r\n&lt;li&gt;4 Footer Copyright Style&lt;/li&gt;\r\n&lt;li&gt;100% Valid Code&lt;/li&gt;\r\n&lt;li&gt;3000+ Font Icon&lt;/li&gt;\r\n&lt;li&gt;One Click Demo Import&lt;/li&gt;\r\n&lt;li&gt;Powerful Options Panel&lt;/li&gt;\r\n&lt;/ul&gt;', '2023-09-20 06:16:49', '2023-09-20 06:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `author_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2023-09-20 08:21:22', '2023-09-20 08:21:22'),
(2, 1, 1, 13, '2023-09-23 07:00:06', '2023-09-23 07:00:06'),
(3, 1, 1, 11, '2023-09-23 07:00:22', '2023-09-23 07:00:22'),
(4, 1, 1, 9, '2023-09-23 07:00:41', '2023-09-23 07:00:41'),
(5, 1, 1, 8, '2023-09-23 07:00:52', '2023-09-23 07:00:52'),
(6, 1, 1, 4, '2023-09-23 07:01:28', '2023-09-23 07:01:28'),
(7, 1, 1, 2, '2023-09-23 07:01:36', '2023-09-23 07:01:36'),
(9, 1, 1, 1, '2023-09-23 07:03:54', '2023-09-23 07:03:54'),
(10, 2, 1, 23, '2023-09-23 07:19:06', '2023-09-23 07:19:06'),
(11, 2, 1, 20, '2023-09-23 07:19:17', '2023-09-23 07:19:17'),
(12, 2, 1, 18, '2023-09-23 07:19:25', '2023-09-23 07:19:25'),
(13, 2, 1, 16, '2023-09-23 07:20:00', '2023-09-23 07:20:00'),
(14, 2, 1, 13, '2023-09-23 07:20:12', '2023-09-23 07:20:12'),
(15, 2, 1, 11, '2023-09-23 07:20:30', '2023-09-23 07:20:30'),
(16, 2, 1, 4, '2023-09-23 07:20:50', '2023-09-23 07:20:50'),
(17, 1, 2, 22, '2023-09-30 03:53:04', '2023-09-30 03:53:04'),
(18, 1, 1, 23, '2023-09-30 04:01:02', '2023-09-30 04:01:02'),
(19, 1, 1, 20, '2023-09-30 04:18:23', '2023-09-30 04:18:23'),
(20, 1, 2, 21, '2023-09-30 04:49:10', '2023-09-30 04:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` double NOT NULL DEFAULT 0,
  `max_amount` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `min_amount`, `max_amount`, `withdraw_charge`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bank Payment', 10, 100, 10, '<p>Bank Name: Your bank name</p>\r\n<p><span style=\"background-color: transparent;\">Account Number:&nbsp; Your bank account number</span></p>\r\n<p>Routing Number: Your bank routing number</p>\r\n<p>Branch: Your bank branch name</p>', 1, '2023-09-23 07:44:40', '2023-09-23 07:44:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_us_languages`
--
ALTER TABLE `about_us_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `additional_services`
--
ALTER TABLE `additional_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_payments`
--
ALTER TABLE `bank_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `become_authors`
--
ALTER TABLE `become_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `become_author_languages`
--
ALTER TABLE `become_author_languages`
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
-- Indexes for table `blog_category_languages`
--
ALTER TABLE `blog_category_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_languages`
--
ALTER TABLE `blog_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_languages`
--
ALTER TABLE `category_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complete_requests`
--
ALTER TABLE `complete_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_pages`
--
ALTER TABLE `contact_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_page_languages`
--
ALTER TABLE `contact_page_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_consents`
--
ALTER TABLE `cookie_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_countries`
--
ALTER TABLE `currency_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_page_languages`
--
ALTER TABLE `custom_page_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_paginations`
--
ALTER TABLE `custom_paginations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_configurations`
--
ALTER TABLE `email_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `error_pages`
--
ALTER TABLE `error_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `error_page_languages`
--
ALTER TABLE `error_page_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebook_comments`
--
ALTER TABLE `facebook_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebook_pixels`
--
ALTER TABLE `facebook_pixels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_languages`
--
ALTER TABLE `faq_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutterwaves`
--
ALTER TABLE `flutterwaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_languages`
--
ALTER TABLE `footer_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_links`
--
ALTER TABLE `footer_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_social_links`
--
ALTER TABLE `footer_social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_analytics`
--
ALTER TABLE `google_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_recaptchas`
--
ALTER TABLE `google_recaptchas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepages`
--
ALTER TABLE `homepages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage_languages`
--
ALTER TABLE `homepage_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instamojo_payments`
--
ALTER TABLE `instamojo_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintainance_texts`
--
ALTER TABLE `maintainance_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_documents`
--
ALTER TABLE `message_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_currencies`
--
ALTER TABLE `multi_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_teams`
--
ALTER TABLE `our_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_team_languages`
--
ALTER TABLE `our_team_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paystack_and_mollies`
--
ALTER TABLE `paystack_and_mollies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `popular_posts`
--
ALTER TABLE `popular_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popular_tags`
--
ALTER TABLE `popular_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policy_languages`
--
ALTER TABLE `privacy_policy_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_discount_languages`
--
ALTER TABLE `product_discount_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_items`
--
ALTER TABLE `product_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_item_languages`
--
ALTER TABLE `product_item_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_languages`
--
ALTER TABLE `product_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_type_pages`
--
ALTER TABLE `product_type_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_type_page_languages`
--
ALTER TABLE `product_type_page_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_client_reports`
--
ALTER TABLE `provider_client_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_withdraws`
--
ALTER TABLE `provider_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pusher_credentails`
--
ALTER TABLE `pusher_credentails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `script_contents`
--
ALTER TABLE `script_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `script_content_languages`
--
ALTER TABLE `script_content_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_contents`
--
ALTER TABLE `section_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_content_languages`
--
ALTER TABLE `section_content_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_controls`
--
ALTER TABLE `section_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_languages`
--
ALTER TABLE `setting_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_languages`
--
ALTER TABLE `slider_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_login_information`
--
ALTER TABLE `social_login_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sslcommerz_payments`
--
ALTER TABLE `sslcommerz_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tawk_chats`
--
ALTER TABLE `tawk_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_languages`
--
ALTER TABLE `template_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_condition_languages`
--
ALTER TABLE `terms_and_condition_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_languages`
--
ALTER TABLE `testimonial_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_us_languages`
--
ALTER TABLE `about_us_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `additional_services`
--
ALTER TABLE `additional_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_payments`
--
ALTER TABLE `bank_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `become_authors`
--
ALTER TABLE `become_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `become_author_languages`
--
ALTER TABLE `become_author_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_category_languages`
--
ALTER TABLE `blog_category_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_languages`
--
ALTER TABLE `blog_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_languages`
--
ALTER TABLE `category_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `complete_requests`
--
ALTER TABLE `complete_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_pages`
--
ALTER TABLE `contact_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_page_languages`
--
ALTER TABLE `contact_page_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cookie_consents`
--
ALTER TABLE `cookie_consents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `currency_countries`
--
ALTER TABLE `currency_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_page_languages`
--
ALTER TABLE `custom_page_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_paginations`
--
ALTER TABLE `custom_paginations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_configurations`
--
ALTER TABLE `email_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `error_pages`
--
ALTER TABLE `error_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `error_page_languages`
--
ALTER TABLE `error_page_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `facebook_comments`
--
ALTER TABLE `facebook_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facebook_pixels`
--
ALTER TABLE `facebook_pixels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faq_languages`
--
ALTER TABLE `faq_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `flutterwaves`
--
ALTER TABLE `flutterwaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `footer_languages`
--
ALTER TABLE `footer_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `footer_links`
--
ALTER TABLE `footer_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_social_links`
--
ALTER TABLE `footer_social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `google_analytics`
--
ALTER TABLE `google_analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_recaptchas`
--
ALTER TABLE `google_recaptchas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homepages`
--
ALTER TABLE `homepages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homepage_languages`
--
ALTER TABLE `homepage_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `instamojo_payments`
--
ALTER TABLE `instamojo_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `maintainance_texts`
--
ALTER TABLE `maintainance_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_documents`
--
ALTER TABLE `message_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `multi_currencies`
--
ALTER TABLE `multi_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `our_teams`
--
ALTER TABLE `our_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `our_team_languages`
--
ALTER TABLE `our_team_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paystack_and_mollies`
--
ALTER TABLE `paystack_and_mollies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popular_posts`
--
ALTER TABLE `popular_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `popular_tags`
--
ALTER TABLE `popular_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `privacy_policy_languages`
--
ALTER TABLE `privacy_policy_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_discount_languages`
--
ALTER TABLE `product_discount_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_items`
--
ALTER TABLE `product_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_item_languages`
--
ALTER TABLE `product_item_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_languages`
--
ALTER TABLE `product_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_type_pages`
--
ALTER TABLE `product_type_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_type_page_languages`
--
ALTER TABLE `product_type_page_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `provider_client_reports`
--
ALTER TABLE `provider_client_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider_withdraws`
--
ALTER TABLE `provider_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pusher_credentails`
--
ALTER TABLE `pusher_credentails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `script_contents`
--
ALTER TABLE `script_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `script_content_languages`
--
ALTER TABLE `script_content_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `section_contents`
--
ALTER TABLE `section_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `section_content_languages`
--
ALTER TABLE `section_content_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `section_controls`
--
ALTER TABLE `section_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_languages`
--
ALTER TABLE `setting_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_languages`
--
ALTER TABLE `slider_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `social_login_information`
--
ALTER TABLE `social_login_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sslcommerz_payments`
--
ALTER TABLE `sslcommerz_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tawk_chats`
--
ALTER TABLE `tawk_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template_languages`
--
ALTER TABLE `template_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_and_condition_languages`
--
ALTER TABLE `terms_and_condition_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonial_languages`
--
ALTER TABLE `testimonial_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
