-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2019 at 01:43 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `passport_track`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  `center_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu`, `url_link`, `parent_id`, `sub_id`, `center_type`, `created_at`, `updated_at`) VALUES
(1, 'Settings', '#', 0, 0, NULL, '2019-02-12 18:00:00', NULL),
(2, 'Operation', '#', 0, 0, NULL, '2019-02-12 18:00:00', NULL),
(3, 'Report', '#', 0, 0, NULL, '2019-02-12 18:00:00', NULL),
(4, 'CENTER TYPE', '#', 1, 0, 'HQ,HCI', '2019-02-13 05:23:22', '2019-02-13 05:23:22'),
(5, 'Add Center Type', '/center-type-add', 1, 4, 'HQ', '2019-02-13 05:24:10', '2019-02-13 05:24:10'),
(7, 'CENTER', '#', 1, 0, 'HCI-PE', '2019-02-13 05:25:06', '2019-02-13 05:25:06'),
(8, 'Add Center', '/center-add', 1, 7, 'HCI', '2019-02-13 05:25:40', '2019-02-13 05:25:40'),
(10, 'MENU', '#', 1, 0, NULL, '2019-02-13 05:26:35', '2019-02-13 05:26:35'),
(11, 'Add Menu', '/menu/create', 1, 10, NULL, '2019-02-13 05:27:03', '2019-02-13 05:27:03'),
(12, 'Menu List', '/menu/index', 1, 10, NULL, '2019-02-13 05:27:26', '2019-02-13 05:27:26'),
(13, 'MANAGE USER', '#', 1, 0, 'HCI', '2019-02-13 05:27:58', '2019-02-13 05:27:58'),
(14, 'Add User', '/create', 1, 13, 'HCI', '2019-02-13 05:28:27', '2019-02-13 05:28:27'),
(15, 'User List', '/user-list', 1, 13, 'HCI,HQ', '2019-02-13 05:29:04', '2019-02-13 05:29:04'),
(16, 'DESIGNATION', '#', 1, 0, NULL, '2019-02-13 05:29:29', '2019-02-13 05:29:29'),
(17, 'Add Designation', '/designation/add', 1, 16, NULL, '2019-02-13 05:29:55', '2019-02-13 05:29:55'),
(18, 'STICKER', '#', 1, 0, NULL, '2019-02-13 05:30:22', '2019-02-13 05:30:22'),
(19, 'Add Sticker', '/sticker', 1, 18, NULL, '2019-02-13 05:30:50', '2019-02-13 05:30:50'),
(21, 'Entry / Exit Port', '/entry-exit-port', 1, 0, NULL, '2019-02-13 05:32:58', '2019-02-13 05:32:58'),
(22, 'Area', '/area', 1, 0, NULL, '2019-02-13 05:33:42', '2019-02-13 05:33:42'),
(23, 'Transport Mode', '/mode', 1, 0, NULL, '2019-02-13 05:34:03', '2019-02-13 05:34:03'),
(24, 'Add R.A.P. / P.A.P.', '/rap/pap/1/2/3/m', 2, 0, 'HCI', '2019-02-13 05:34:45', '2019-02-13 05:34:45'),
(25, 'R.A.P. / P.A.P. Approval', '/print', 2, 0, NULL, '2019-02-13 05:35:14', '2019-02-13 05:35:14'),
(26, 'R.A.P. / P.A.P.  Approval Edit', '/edit', 2, 0, NULL, '2019-02-13 05:35:43', '2019-02-13 05:35:43'),
(27, 'Export/IMPORT FILE', '#', 2, 0, NULL, '2019-02-13 05:36:26', '2019-02-13 05:36:26'),
(28, 'Import R.A.P. / P.A.P.', '/import/data', 2, 27, NULL, '2019-02-13 05:37:48', '2019-02-13 05:37:48'),
(29, 'Export R.A.P. / P.A.P.', '/export/data', 2, 27, NULL, '2019-02-13 05:38:24', '2019-02-13 05:38:24'),
(30, 'R.A.P. / P.A.P. Receive Details', '/rappap/report', 3, 0, NULL, '2019-02-13 05:39:44', '2019-02-13 05:39:44'),
(31, 'R.A.P. / P.A.P. Receive Summary', '/receive-summary-report', 3, 0, NULL, '2019-02-13 05:40:28', '2019-02-13 05:40:28'),
(32, 'R.A.P. /P.A.P. Approval Details', '/approve/report', 3, 0, NULL, '2019-02-13 05:40:53', '2019-02-13 05:40:53'),
(33, 'R.A.P. / P.A.P. Approval Summary', '/port-update-report', 3, 0, NULL, '2019-02-13 05:41:20', '2019-02-13 05:41:20'),
(34, 'Edit R.A.P / P.A.P', '/rap/pap/edit/search/passport', 2, 0, NULL, '2019-02-13 06:50:16', '2019-02-13 06:50:16'),
(35, 'demo', '/demo', 3, 0, 'HQ,BR,HCI,HCI-PE,HCI-RAP_PAP,WEB', '2019-02-18 05:33:03', '2019-02-18 05:33:03'),
(36, 'Receive From HCI', '/search', 2, 0, 'HQ,BR,HCI,HCI-PE,HCI-RAP_PAP,WEB', '2019-02-20 09:36:10', '2019-02-20 09:36:10'),
(37, 'R.A.P/P.A.P Basic Print', '/hci/basic/print', 2, 0, 'HQ,HCI,HCI-RAP_PAP', '2019-02-23 06:32:10', '2019-02-23 06:32:10'),
(38, 'test', 'http', 1, 0, 'HCI', '2019-02-28 05:12:45', '2019-02-28 05:12:45');

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
(75, '2014_10_12_000000_create_users_table', 1),
(76, '2014_10_12_100000_create_password_resets_table', 1),
(77, '2019_01_04_063942_add_store_id_to_users_table', 1),
(78, '2019_01_07_041225_create_tbl_port_update_table', 1),
(79, '2019_01_07_051508_create_tbl_route_table', 1),
(80, '2019_01_07_060322_create_tbl_sticker_mapping_table', 1),
(81, '2019_01_07_083136_create_tbl_visa_type_table', 1),
(82, '2019_01_07_100909_create_tbl_center_info_table', 1),
(83, '2019_01_09_060434_create_tbl_port_names_table', 1),
(84, '2019_01_14_032735_create_tbl_designation_table', 2),
(85, '2019_01_15_114956_create_tbl_rap_pap_info_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `area_id` int(10) UNSIGNED NOT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_authority`
--

CREATE TABLE `tbl_authority` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_authority`
--

INSERT INTO `tbl_authority` (`id`, `name`, `designation`, `entry_time`) VALUES
(1, 'Vishal J. Das', 'Secondary Secretary', '2019-01-17 00:00:00'),
(2, 'Shohel', 'First Secretary', '2019-01-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_center`
--

CREATE TABLE `tbl_center` (
  `id` int(11) NOT NULL,
  `center_name` varchar(255) NOT NULL,
  `center_type` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_center`
--

INSERT INTO `tbl_center` (`id`, `center_name`, `center_type`, `region`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'HQ', 'Dhaka', '2019-02-17 16:27:32', NULL),
(2, 'Dhaka', 'HCI', 'Dhaka', '2019-02-18 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_center_info`
--

CREATE TABLE `tbl_center_info` (
  `centerinfo_id` int(10) UNSIGNED NOT NULL,
  `sp_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proc_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modify_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_lead` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slip_copy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticker_symbol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corr_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_lead` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_copy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_sub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_footer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_center_info`
--

INSERT INTO `tbl_center_info` (`centerinfo_id`, `sp_fee`, `proc_fee`, `center_name`, `center_phone`, `center_fax`, `center_web`, `modify_by`, `modify_date`, `delivery_lead`, `del_time`, `slip_copy`, `sticker_symbol`, `center_info`, `center_type`, `region`, `corr_fee`, `port_lead`, `port_copy`, `letter_head`, `letter_sub`, `letter_body`, `letter_footer`, `port_fee`) VALUES
(1, '200', '200', 'Dhaka', '23331', '232342', 'wwww', 'dd', '2019-02-06 00:00:00', '4', '2.30-5.00 PM', '2', 'DFH', NULL, 'HCI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_center_type`
--

CREATE TABLE `tbl_center_type` (
  `id` int(11) NOT NULL,
  `center_type` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_center_type`
--

INSERT INTO `tbl_center_type` (`id`, `center_type`, `created_at`, `updated_at`) VALUES
(1, 'HQ', '2019-02-17 00:00:00', '2019-02-28 10:50:36'),
(2, 'BR', '2019-02-17 00:00:00', '0000-00-00 00:00:00'),
(3, 'HCI', '2019-02-17 00:00:00', '0000-00-00 00:00:00'),
(4, 'HCI-PE', '2019-02-17 00:00:00', '0000-00-00 00:00:00'),
(5, 'HCI-RAP_PAP', '2019-02-17 00:00:00', '0000-00-00 00:00:00'),
(6, 'WEB', '2019-02-17 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`id`, `designation`, `created_at`, `updated_at`) VALUES
(2, 'Engineer', '2019-01-13 23:03:40', '2019-02-28 04:52:05'),
(3, 'Doctor', '2019-02-28 04:52:27', '2019-02-28 04:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holiday`
--

CREATE TABLE `tbl_holiday` (
  `hday_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_holiday`
--

INSERT INTO `tbl_holiday` (`hday_id`, `date`, `description`, `entry_date`) VALUES
(1, '2019-01-24 00:00:00', '', '0000-00-00 00:00:00'),
(2, '2019-01-25 00:00:00', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ivac_services`
--

CREATE TABLE `tbl_ivac_services` (
  `sl` int(11) NOT NULL,
  `Service` varchar(255) NOT NULL,
  `slip_copy` int(11) NOT NULL,
  `Svc_Fee` int(11) NOT NULL,
  `LeadTime` int(11) NOT NULL,
  `SavedBy` varchar(255) NOT NULL,
  `SaveTime` datetime NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ivac_services`
--

INSERT INTO `tbl_ivac_services` (`sl`, `Service`, `slip_copy`, `Svc_Fee`, `LeadTime`, `SavedBy`, `SaveTime`, `Status`) VALUES
(1, 'Port Endorsement', 2, 300, 9, '3', '2019-02-11 00:00:00', 'ON'),
(2, 'R.A.P./P.A.P.', 2, 300, 9, '3', '2019-02-04 00:00:00', 'ON');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `menu_url`, `menu_name`, `center_type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'dsd/ds/', 'settings', 'Super', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_port_names`
--

CREATE TABLE `tbl_port_names` (
  `port_id` int(10) UNSIGNED NOT NULL,
  `port_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `save_time` datetime NOT NULL,
  `service_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_port_names`
--

INSERT INTO `tbl_port_names` (`port_id`, `port_name`, `fee`, `save_time`, `service_type`, `created_at`, `updated_at`) VALUES
(1, 'Sikkim', '300', '2019-01-09 12:17:18', 'R.A.P./P.A.P.', '2019-01-09 06:20:28', '2019-01-09 06:28:22'),
(2, 'Gangtok', '300', '2019-01-09 12:18:00', 'R.A.P./P.A.P.', '2019-01-09 06:31:00', '2019-01-09 06:25:00'),
(3, 'BY ROAD MUHURIGHAT', '300', '2019-01-09 12:30:31', 'Port Endorsement', '2019-01-09 02:22:23', '2019-01-09 06:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_port_update`
--

CREATE TABLE `tbl_port_update` (
  `serial_no` int(10) UNSIGNED NOT NULL,
  `applicant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visa_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visa_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_cen_time` datetime NOT NULL,
  `rec_cen_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent2hci_time` datetime DEFAULT NULL,
  `sent2hci_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recFrmHCI_time` datetime DEFAULT NULL,
  `recFrmHCI_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ready@cen_time` datetime DEFAULT NULL,
  `ready@cen_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del2app_time` datetime DEFAULT NULL,
  `del2app_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `region` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fee` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OldPort` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewPort` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticker` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ServiceType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrivalDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departureDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MasterPP` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `entry_by` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `active` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_port_update`
--

INSERT INTO `tbl_port_update` (`serial_no`, `applicant_name`, `designation`, `passport`, `center`, `visa_no`, `visa_type`, `contact`, `rec_cen_time`, `rec_cen_by`, `sent2hci_time`, `sent2hci_by`, `recFrmHCI_time`, `recFrmHCI_by`, `ready@cen_time`, `ready@cen_by`, `del2app_time`, `del2app_by`, `status`, `uploadTime`, `region`, `Remarks`, `Fee`, `OldPort`, `NewPort`, `area`, `mode`, `sticker`, `ServiceType`, `arrivalDate`, `departureDate`, `MasterPP`, `approve_status`, `approve_by`, `approve_date`, `entry_by`, `updated_at`, `created_at`, `active`) VALUES
(41, 'E2', 'Doctor', 'E2', 'Dhaka', 'v5', 'TOURIST', '', '2019-02-23 10:30:53', 'emrul 2', NULL, NULL, '2019-02-23 12:09:54', 'admin', NULL, NULL, NULL, NULL, '2', NULL, '', 'remarks', '300', 'Dhaka', 'Dhaka', 'Sikkim', 'By Air', '', 'R.A.P./P.A.P.', '2019-02-15', '2019-02-16', 'E2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(42, 'Uazzal', 'Doctor', 'B2', 'Dhaka', 'v6', 'TOURIST', '234567890', '2019-02-16 10:30:53', 'Admin', NULL, NULL, '2019-02-23 11:42:02', 'Admin', NULL, NULL, NULL, NULL, '2', NULL, '', 'QASDFG', '300', 'Dhaka', 'Dhaka', 'Gangtok', 'By Air', 'DHK34533', 'R.A.P./P.A.P.', '2019-02-14', '2019-02-14', 'B2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(83, 'sdfg', 'Doctor', 'MP4', 'Dhaka', '1111', 'TOURIST', '234567890', '2019-02-12 10:15:15', 'Admin', NULL, NULL, '2019-02-23 12:00:41', 'admin', NULL, NULL, NULL, NULL, '2', NULL, 'Dhaka', 'sdgvdfg', '300', 'Gede', 'Gede ', 'Gangtok,Sikkim', 'By Air', 'DHK11', 'R.A.P./P.A.P.', '2019-02-13', '2019-02-14', 'MP4', 'Pending', NULL, NULL, NULL, NULL, NULL, 0),
(88, 'Emrul Khan', 'Doctor', 'P2', 'Dhaka', '4333332', 'TOURIST', NULL, '2019-02-17 09:34:50', 'Admin', NULL, NULL, '2019-02-20 14:20:57', 'Admin', NULL, NULL, NULL, NULL, '2', '2019-02-17 09:34:50', NULL, 'remarks', '300', 'Dhaka', 'Dhaka', 'Gangtok', 'By Air', '', 'R.A.P./P.A.P.', '2019-02-18', '2019-02-19', 'P2', 'Pending', NULL, NULL, NULL, NULL, NULL, 0),
(89, 'Banu', 'Doctor', 'MP1', 'Dhaka', 'vs1', 'TOURIST', NULL, '2019-02-20 12:40:13', 'Admin', NULL, NULL, '2019-02-20 16:11:42', 'Admin', NULL, NULL, NULL, NULL, '2', '2019-02-20 12:40:13', '', 'very nice', '300', 'Dhaka', 'Gangtok ', 'Sikkim', 'By Road', '', 'R.A.P./P.A.P.', '2019-02-05', '2019-02-14', 'MP1', 'Pending', NULL, NULL, NULL, NULL, NULL, 0),
(91, 'Banu', 'Doctor', 'MP1', 'Dhaka', 'vs1', 'TOURIST', '1234567890', '2019-02-23 11:08:41', 'Admin', NULL, NULL, '2019-02-23 11:42:02', 'Admin', NULL, NULL, NULL, NULL, '2', '2019-02-23 11:08:41', '', 'very nice', '300', 'Dhaka', 'Gangtok ', 'Sikkim', 'By Air', 's223', 'R.A.P./P.A.P.', '2019-02-05', '2019-02-14', 'MP1', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(99, 'E2', 'Doctor', 'E7', 'Dhaka', 'v5', 'TOURIST', NULL, '2019-02-16 10:30:53', 'emrul 2', NULL, NULL, '2019-02-23 11:52:41', 'admin', NULL, NULL, NULL, NULL, '2', NULL, '', 'remarks', '300', 'Dhaka', 'Dhaka', 'Sikkim', 'By Air', '', 'R.A.P./P.A.P.', '2019-02-15', '2019-02-16', 'E2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(103, 'E2', 'Doctor', 'E6', 'Dhaka', 'v5', 'TOURIST', '1234567890', '2019-02-16 10:30:53', 'emrul 2', NULL, NULL, '2019-02-23 11:44:54', 'Admin', NULL, NULL, NULL, NULL, '2', NULL, '', 'remarks', '300', 'Dhaka', 'Dhaka', 'Sikkim', 'By Air', 'DHK11', 'R.A.P./P.A.P.', '2019-02-15', '2019-02-16', 'E2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(109, 'Md. Aminul Islam', 'Doctor', 'PASSPORT-1', 'Dhaka', 'visa-01', 'TOURIST', '234567890', '2019-02-23 15:14:28', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-02-23 15:14:28', '', 'remarks', '300', 'Dhaka', 'Dhaka', 'Gangtok', 'By Air', 'DHKst', 'R.A.P./P.A.P.', '2019-02-23', '2019-02-27', 'PASSPORT-1', 'Pending', 'Admin', '2019-02-23 15:56:54', 'Admin', '2019-02-23 15:56:54', NULL, 1),
(110, 'Md. Aminul Islam Emrul', 'Doctor', 'PASSPORT-1', 'Dhaka', 'visa-01', 'TOURIST', '234567890', '2019-02-23 15:15:55', 'Admin', NULL, NULL, '2019-02-23 17:54:05', 'admin', NULL, NULL, NULL, NULL, '2', '2019-02-23 15:15:55', '', 'remarks', '300', 'Dhaka', 'Dhaka ', 'Gangtok', 'By Air', 'DHKst', 'R.A.P./P.A.P.', '2019-02-23', '2019-02-27', 'PASSPORT-1', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(111, 'Emrul Khan ss', 'Doctor', 'P2', 'Dhaka', '4333332', 'TOURIST', '1234567890', '2019-02-23 15:33:06', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-02-23 15:33:06', '', 'remarks', '300', 'Dhaka', 'Dhaka ', 'Gangtok', 'By Air', 'st', 'R.A.P./P.A.P.', '2019-02-18', '2019-02-19', 'P2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(135, 'E2', 'Doctor', 'E3', 'Dhaka', 'v5', 'TOURIST', '', '2019-02-23 10:30:53', 'emrul 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, '', 'remarks', '300', 'Dhaka', 'Dhaka', 'Sikkim', 'By Air', '', 'R.A.P./P.A.P.', '2019-02-15', '2019-02-16', 'E2', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(136, 'hasu', 'Engineer', 'MP1', 'Dhaka', 'vsa1', 'TOURIST', '1713908666', '2019-02-28 11:06:52', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-02-28 11:06:52', NULL, 'This is our Remarks', '300', 'Gangtok', 'Gede', 'Gangtok', 'By Air', 'DHK1', 'R.A.P./P.A.P.', '2019-02-22', '2019-02-26', NULL, 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(137, 'John Mikel', 'Doctor', 'MP3', 'Dhaka', 'vg5', 'TOURIST', '1713908666', '2019-02-28 11:06:52', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-02-28 11:06:52', NULL, 'This is our Remarks', '300', 'Gangtok', 'Gede', 'Gangtok', 'By Air', 'DHK2', 'R.A.P./P.A.P.', '2019-02-22', '2019-02-26', 'MP3', 'Pending', NULL, NULL, NULL, NULL, NULL, 1),
(138, 'oooo', 'Engineer', 'MP8', 'Dhaka', 'vsa37', 'TOURIST', '1713908666', '2019-02-28 11:06:52', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-02-28 11:06:52', NULL, 'This is our Remarks', '300', 'Gangtok', 'Gede', 'Gangtok', 'By Air', 'DHK3', 'R.A.P./P.A.P.', '2019-02-22', '2019-02-26', NULL, 'Pending', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rap_pap_info`
--

CREATE TABLE `tbl_rap_pap_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `body1` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body2` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_rap_pap_info`
--

INSERT INTO `tbl_rap_pap_info` (`id`, `body1`, `body2`, `footer`, `created_at`, `updated_at`) VALUES
(1, '(a)   Photography of Vulnerable area / Vulnerable Points including sensitive Army installation / equipment is not permitted.\r\n\r\n(b)  The applicant should not participate in discussion on any controversial issues.\r\n\r\n2.     This permit Here is restricted to the places mentioned in para 1 and is valid for 2 (two) days as stated in para-1 above.\r\n\r\n3.     The applicant is to adhere to the following route for this travel:', '4.     The applicant should abide by declared programme and should not disembark enroute on other restricted / protected areas and should process necessary documents at all times.\r\n\r\n5. Dos and Dont\'s: Instructions for PAP/RAP holders:\r\n\r\nThe permit is valid for group tourists consisting of two or more persons only.\r\nThe permit is valid for group tourists circuit/route and specific entry / exit point.\r\nThe permit holder must keep sufficient number of photocopies of the permit as he/she may be required to deposit a copy at each point of entry/exit.', 'Vishal J. Das\r\nSecondary Secretary', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route`
--

CREATE TABLE `tbl_route` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_route`
--

INSERT INTO `tbl_route` (`route_id`, `route_name`, `service_type`) VALUES
(1, 'Dhaka', 'R.A.P./P.A.P.'),
(2, 'Gede', 'R.A.P./P.A.P.'),
(3, 'Gangtok', 'R.A.P./P.A.P.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sticker_mapping`
--

CREATE TABLE `tbl_sticker_mapping` (
  `id` int(10) UNSIGNED NOT NULL,
  `sticker` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_sticker_mapping`
--

INSERT INTO `tbl_sticker_mapping` (`id`, `sticker`, `center`, `region`, `remarks`, `created_time`, `created_by`) VALUES
(2, 'O-BW', 'Dhak', 'Region', 'Remarks', NULL, NULL),
(3, 'DHK', 'dhaka', 'mirpur', 'remarks', '2019-02-06 11:17:42', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transport_mode`
--

CREATE TABLE `tbl_transport_mode` (
  `serial_no` int(11) NOT NULL,
  `mode` varchar(255) NOT NULL,
  `entry_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_transport_mode`
--

INSERT INTO `tbl_transport_mode` (`serial_no`, `mode`, `entry_time`) VALUES
(1, 'By Road', '2019-02-11 00:00:00'),
(2, 'By Air', '2019-02-11 00:00:00'),
(3, 'By Train', '2019-02-11 00:00:00'),
(4, 'By Launch', '2019-02-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visa_type`
--

CREATE TABLE `tbl_visa_type` (
  `visa_type_id` int(10) UNSIGNED NOT NULL,
  `visa_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_visa_type`
--

INSERT INTO `tbl_visa_type` (`visa_type_id`, `visa_type`, `symbol`, `days`) VALUES
(1, 'TOURIST', 'T', '7'),
(2, 'CONFERENCE', 'CON', '8');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(4) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_permitted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `center_name`, `center_type`, `password`, `show_password`, `status`, `updated_by`, `created_by`, `remember_token`, `menu_permitted`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', 'Admin', '$2y$10$lKEKobb9PNMCZ.7R/0nfTuAupySax4ufT4c78VynCHib98X42Fh/q', 'admin', 1, NULL, NULL, '1PmINQop26HMAO1jqSUko0uAROJkxQoxlRGDcIqPT0grLHrk3iJ9VwJnPdls', '1,2,3,4,5,7,8,10,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37', '2019-02-28 04:48:54', NULL),
(2, 'admin2', 'admin2', 'Dhaka', 'HCI', '$2y$10$MqJVcBtIHHuWifbKjbC/yOQca.UN8ZyEQwnH.k75yux/bY0of560e', '123456', 1, 1, 1, 'UzHSkpV6ix6a5w624y6LYnvFacRrRzvH5s2YLz45TVOlYH1b2AbsPf2SFHrk', '4,7,8,13,14,15,24,36,37,35', '2019-02-28 05:15:35', '2019-02-28 05:18:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `tbl_authority`
--
ALTER TABLE `tbl_authority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_center`
--
ALTER TABLE `tbl_center`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_center_info`
--
ALTER TABLE `tbl_center_info`
  ADD PRIMARY KEY (`centerinfo_id`);

--
-- Indexes for table `tbl_center_type`
--
ALTER TABLE `tbl_center_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  ADD PRIMARY KEY (`hday_id`);

--
-- Indexes for table `tbl_ivac_services`
--
ALTER TABLE `tbl_ivac_services`
  ADD PRIMARY KEY (`sl`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_port_names`
--
ALTER TABLE `tbl_port_names`
  ADD PRIMARY KEY (`port_id`);

--
-- Indexes for table `tbl_port_update`
--
ALTER TABLE `tbl_port_update`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `unique_index` (`passport`,`visa_no`,`rec_cen_time`,`MasterPP`);

--
-- Indexes for table `tbl_rap_pap_info`
--
ALTER TABLE `tbl_rap_pap_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_route`
--
ALTER TABLE `tbl_route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `tbl_sticker_mapping`
--
ALTER TABLE `tbl_sticker_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transport_mode`
--
ALTER TABLE `tbl_transport_mode`
  ADD PRIMARY KEY (`serial_no`);

--
-- Indexes for table `tbl_visa_type`
--
ALTER TABLE `tbl_visa_type`
  ADD PRIMARY KEY (`visa_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_authority`
--
ALTER TABLE `tbl_authority`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_center`
--
ALTER TABLE `tbl_center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_center_info`
--
ALTER TABLE `tbl_center_info`
  MODIFY `centerinfo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_center_type`
--
ALTER TABLE `tbl_center_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_holiday`
--
ALTER TABLE `tbl_holiday`
  MODIFY `hday_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ivac_services`
--
ALTER TABLE `tbl_ivac_services`
  MODIFY `sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_port_names`
--
ALTER TABLE `tbl_port_names`
  MODIFY `port_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_port_update`
--
ALTER TABLE `tbl_port_update`
  MODIFY `serial_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `tbl_rap_pap_info`
--
ALTER TABLE `tbl_rap_pap_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_route`
--
ALTER TABLE `tbl_route`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sticker_mapping`
--
ALTER TABLE `tbl_sticker_mapping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transport_mode`
--
ALTER TABLE `tbl_transport_mode`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_visa_type`
--
ALTER TABLE `tbl_visa_type`
  MODIFY `visa_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
