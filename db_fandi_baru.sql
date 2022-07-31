-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2022 at 12:22 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_fandi_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `config_payments`
--

CREATE TABLE `config_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_off_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_payments`
--

INSERT INTO `config_payments` (`id`, `name`, `paid_off_amount`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
('5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 'monthly_payment', '50000', 1, NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('66e22622-968c-452f-9d0f-37d75ea585d5', 'main_payment', '500000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('6e21a8c5-fe56-4241-a028-4614ef47d3ef', 'main_payment', '700000', 1, NULL, '2022-02-04 15:40:10', '2022-02-09 11:05:40'),
('a3e7c931-9623-4ace-bc61-6215619ec797', 'monthly_payment', '50000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `main_payments`
--

CREATE TABLE `main_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_payment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_payments`
--

INSERT INTO `main_payments` (`id`, `user_id`, `config_payment_id`, `amount`, `paid_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0235f111-3ee1-44cc-927c-56afaa45db54', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 700000, '2022-07-13', NULL, '2022-07-13 07:33:19', '2022-07-13 07:33:19'),
('1c3473ae-11b2-4789-8e86-65de2c82d8e4', '09850301-2ef7-44cb-a7b6-d8169830b98f', '66e22622-968c-452f-9d0f-37d75ea585d5', 450000, '2022-07-13', NULL, '2022-07-13 07:34:09', '2022-07-13 07:34:09'),
('2f8101dd-dd3b-41dc-8ef8-33324b35be51', '09850301-2ef7-44cb-a7b6-d8169830b98f', '66e22622-968c-452f-9d0f-37d75ea585d5', 50000, '2022-07-13', NULL, '2022-07-13 07:34:32', '2022-07-13 07:34:32'),
('8261358c-60ad-40bc-9838-79bbb85211ad', 'd09ebfc0-e861-4add-8dbf-f69325930a5b', '66e22622-968c-452f-9d0f-37d75ea585d5', 500000, '2022-06-24', NULL, '2022-06-24 08:38:09', '2022-06-24 08:38:09');

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
(1, '2021_06_07_063445_create_roles_table', 1),
(2, '2021_06_07_063538_create_users_table', 1),
(3, '2021_06_07_063539_create_wallets_table', 1),
(4, '2021_10_07_172823_create_config_payments_table', 1),
(5, '2021_10_07_172920_create_main_payments_table', 1),
(6, '2021_10_07_172942_create_monthly_payments_table', 1),
(7, '2021_10_07_172959_create_other_payments_table', 1),
(8, '2021_10_07_173112_create_yearly_logs_table', 1),
(9, '2021_10_07_173141_create_withdraws_table', 1),
(10, '2022_02_08_164646_add_payment_year_column_in_monthly_payments', 2),
(11, '2022_02_08_165031_add_payment_year_column_in_other_payments', 2);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_payments`
--

CREATE TABLE `monthly_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_payment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_month` int(11) DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other_payments`
--

CREATE TABLE `other_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_month` int(11) DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
('414e5aab-19b7-4bb0-b185-01d0324edc38', 'user', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('5e5279ee-8275-48a0-bdc3-31953db78e7b', 'admin', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('7ad38ef8-f5e7-4635-8cac-5d43c0a65f15', 'admin', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', 'user', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_belanja`
--

CREATE TABLE `tb_belanja` (
  `id` int(11) NOT NULL,
  `no_trax` varchar(100) NOT NULL,
  `atribut` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_belanja`
--

INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(509, 'TRX1412052-220624041519', 'a:6:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:38000;s:9:\"sub_total\";i:38000;s:9:\"nm_barang\";s:11:\"Pizza Promo\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:5;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}}'),
(510, 'TRX8652551-220624035757', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:38000;s:9:\"sub_total\";i:38000;s:9:\"nm_barang\";s:11:\"Pizza Promo\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(511, 'TRX4973185-220624035000', 'a:1:{i:0;a:4:{s:3:\"qty\";i:7;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:70000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(512, 'TRX5373070-220624025918', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(513, 'TRX5230905-220624021344', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(514, 'TRX2862854-220624014332', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(515, 'TRX3698330-220624125858', 'a:3:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:13:\"Hot Lemon Tea\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}}'),
(516, 'TRX9472325-220624115635', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(517, 'TRX7217676-220624112522', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(518, 'TRX3331395-220624101904', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(519, 'TRX7257266-220623025525', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(520, 'TRX5293764-220623022333', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}}'),
(521, 'TRX9862914-220623021526', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Iced Vanilla Latte\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:20000;s:9:\"sub_total\";i:40000;s:9:\"nm_barang\";s:12:\"Caramel Frap\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:45000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:5:\"Pizza\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}}'),
(522, 'TRX9269608-220623110720', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(523, 'TRX9246703-220623094255', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(524, 'TRX8277059-220622031625', 'a:3:{i:0;a:4:{s:3:\"qty\";i:30;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:300000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}}'),
(525, 'TRX6278470-220622113514', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:38000;s:9:\"sub_total\";i:38000;s:9:\"nm_barang\";s:11:\"Pizza Promo\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(526, 'TRX2873077-220628121147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(527, 'TRX5065626-220628110437', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(528, 'TRX529411-220628104309', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(529, 'TRX2543358-220628103325', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(530, 'TRX5807485-220628102602', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(531, 'TRX4700527-220628101444', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(532, 'TRX8194800-220628100806', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(533, 'TRX8269666-220628100200', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(534, 'TRX3405982-220627034004', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(535, 'TRX8967617-220627032416', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(536, 'TRX16464-220627024840', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(537, 'TRX5405094-220627020147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(538, 'TRX8005764-220627014647', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(539, 'TRX4303346-220627013415', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Americano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"Hot Lemon Tea\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(540, 'TRX6354735-220627012411', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:9:\"Americano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"Hot Lemon Tea\";}}'),
(541, 'TRX4293998-220627011424', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(542, 'TRX726088-220627114309', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(543, 'TRX7877044-220627113007', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(544, 'TRX4958746-220627111754', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(545, 'TRX9036667-220627111235', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(546, 'TRX5175492-220627110823', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(547, 'TRX7291418-220627110515', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(548, 'TRX3999557-220627110231', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(549, 'TRX2141171-220627105503', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(550, 'TRX3843-220627104812', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(551, 'TRX2940654-220627103825', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(552, 'TRX7252553-220627103611', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(553, 'TRX8296315-220627103022', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(554, 'TRX6835929-220627102611', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(555, 'TRX2543623-220627101445', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(556, 'TRX8435184-220627101200', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(557, 'TRX6283702-220627093044', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(558, 'TRX7767071-220627091316', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(559, 'TRX9944802-220630115736', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(560, 'TRX420565-220630114337', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(561, 'TRX8222374-220630111958', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 5\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(562, 'TRX3705200-220630111505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(563, 'TRX6833352-220630092851', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(564, 'TRX8331809-220629035841', 'a:5:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:9:\"Ice Choco\";}i:1;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:60000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:4;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:50000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(565, 'TRX2923041-220629024208', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(566, 'TRX2322638-220629015833', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(567, 'TRX3629866-220629012440', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(568, 'TRX9285894-220629012241', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(569, 'TRX1677304-220629114039', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(570, 'TRX1237037-220629111825', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(571, 'TRX1455046-220629111012', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(572, 'TRX7567221-220629105703', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(573, 'TRX8566912-220629105439', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(574, 'TRX5615928-220629101919', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Hot Coffee Milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Hot Kopi Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:23:\"Caramel Macchiato Latte\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(575, 'TRX2570453-220629101409', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(576, 'TRX7661495-220629093919', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(577, 'TRX1809917-220629093556', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(578, 'TRX425830-220629090822', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(579, 'TRX9813185-220630015014', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(580, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(581, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(582, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(583, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(584, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(585, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(586, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(587, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(588, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(589, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(590, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(591, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(592, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(593, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(594, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(595, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(596, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(597, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(598, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(599, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(600, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(601, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(602, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(603, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(604, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(605, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(606, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(607, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(608, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(609, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(610, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(611, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(612, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(613, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(614, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(615, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(616, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(617, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(618, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(619, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(620, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(621, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(622, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(623, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(624, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(625, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(626, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(627, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(628, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(629, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(630, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(631, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(632, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(633, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(634, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(635, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(636, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(637, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}');
INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(638, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(639, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(640, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(641, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(642, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(643, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(644, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(645, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(646, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(647, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(648, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(649, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(650, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(651, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(652, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(653, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(654, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(655, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(656, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(657, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(658, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(659, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(660, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(661, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(662, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(663, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(664, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(665, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(666, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(667, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(668, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(669, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(670, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(671, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(672, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(673, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(674, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(675, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(676, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(677, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(678, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(679, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(680, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(681, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(682, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(683, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(684, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(685, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(686, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(687, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(688, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(689, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(690, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(691, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(692, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(693, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(694, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(695, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(696, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(697, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(698, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(699, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(700, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(701, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(702, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(703, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(704, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(705, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(706, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(707, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(708, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(709, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(710, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(711, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(712, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(713, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(714, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(715, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(716, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(717, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(718, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(719, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(720, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(721, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(722, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(723, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(724, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(725, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(726, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(727, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(728, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(729, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(730, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(731, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(732, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(733, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(734, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(735, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(736, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(737, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(738, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(739, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(740, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(741, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(742, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(743, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(744, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(745, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(746, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(747, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(748, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(749, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(750, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(751, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(752, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(753, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(754, 'TRX7480752-220713015750', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(755, 'TRX427428-220713123804', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(756, 'TRX1626139-220713122845', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(757, 'TRX307661-220713122410', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(758, 'TRX538394-220713122101', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(759, 'TRX9898068-220713121026', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}}'),
(760, 'TRX6061098-220713120859', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:12:\"kripik tempe\";}}'),
(761, 'TRX9165920-220713113934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(762, 'TRX6646661-220713110151', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(763, 'TRX3346769-220713103536', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(764, 'TRX7986985-220713092757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(765, 'TRX4877638-220712030322', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(766, 'TRX7750822-220712024700', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:13:\"ice lemon tea\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:15:\"Ice Cream Break\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:4;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(767, 'TRX2008476-220712023505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(768, 'TRX9619331-220712015250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(769, 'TRX4677862-220712014147', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2600000;s:9:\"sub_total\";i:2600000;s:9:\"nm_barang\";s:14:\"UKT Semester 4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(770, 'TRX4431415-220712013723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(771, 'TRX1587920-220712013131', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}');
INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(772, 'TRX607548-220712115551', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(773, 'TRX9007769-220712114837', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(774, 'TRX311432-220712110742', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Gula Aren\";}}'),
(775, 'TRX5006794-220712110352', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(776, 'TRX9005093-220712105343', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(777, 'TRX8872440-220712104751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(778, 'TRX8307129-220712103355', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(779, 'TRX2146180-220712101553', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(780, 'TRX1699757-220712101021', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(781, 'TRX7949635-220712094450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(782, 'TRX6667335-220712094205', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:250000;s:9:\"sub_total\";i:250000;s:9:\"nm_barang\";s:17:\"Pendaftaran SBMPN\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(783, 'TRX4154430-220729034751', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(784, 'TRX3228180-220729023839', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000000;s:9:\"sub_total\";i:7000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(785, 'TRX1759670-220729023550', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(786, 'TRX6398409-220729021941', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(787, 'TRX8684712-220729021720', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(788, 'TRX7540233-220729110626', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(789, 'TRX4710766-220729122018', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Basreng\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Kulpang\";}}'),
(790, 'TRX7843987-220729121756', 'a:6:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Hot / Ice Milk\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:26000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:4;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}i:5;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(791, 'TRX8183686-220729110255', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(792, 'TRX8853343-220729110134', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(793, 'TRX373731-220729105430', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(794, 'TRX6888148-220729105250', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(795, 'TRX7464573-220729104709', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:9:\"Ice Choco\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}}'),
(796, 'TRX8002728-220729103236', 'a:2:{i:0;a:4:{s:3:\"qty\";i:9;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:15:\"Teh Botol 350ml\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(797, 'TRX3508333-220729102908', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(798, 'TRX6868393-220729101256', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(799, 'TRX3168004-220729101006', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(800, 'TRX8232157-220729084757', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(801, 'TRX5358193-220729084554', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin_dipakai`
--

CREATE TABLE `tb_poin_dipakai` (
  `id` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_poin_dipakai`
--

INSERT INTO `tb_poin_dipakai` (`id`, `poin`, `id_user`) VALUES
(8, 22, 'undefined'),
(9, 25, 'm.farid wajdi 0041727756');

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin_fandi`
--

CREATE TABLE `tb_poin_fandi` (
  `id_poin` int(11) NOT NULL,
  `jumlah_poin` int(11) DEFAULT NULL,
  `id_transaksi` varchar(255) DEFAULT NULL,
  `tanggal_poin` date DEFAULT NULL,
  `id_user` varchar(255) NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `status` enum('hapus','aktif') NOT NULL DEFAULT 'aktif',
  `custmer_partner_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_poin_fandi`
--

INSERT INTO `tb_poin_fandi` (`id_poin`, `jumlah_poin`, `id_transaksi`, `tanggal_poin`, `id_user`, `nominal`, `status`, `custmer_partner_name`) VALUES
(1061, 26, 'TRX7480752-220713015750', '2022-07-13', 'm.farid wajdi 0041727756', 265000, 'hapus', 'kopkar polindra'),
(1062, 26, 'TRX427428-220713123804', '2022-07-13', 'asep irawan 0039962586', 265000, 'hapus', 'kopkar polindra'),
(1063, 2, 'TRX1626139-220713122845', '2022-07-13', 'pak omet', 28000, 'aktif', 'kopkar polindra'),
(1064, 12, 'TRX307661-220713122410', '2022-07-13', 'pak omet', 120000, 'aktif', 'kopkar polindra'),
(1065, 26, 'TRX538394-220713122101', '2022-07-13', 'sahabi 0044674631', 265000, 'aktif', 'kopkar polindra'),
(1066, 4, 'TRX9898068-220713121026', '2022-07-13', 'bu munengsih', 44000, 'aktif', 'kopkar polindra'),
(1067, 3, 'TRX6061098-220713120859', '2022-07-13', 'bu munengsih', 30000, 'aktif', 'kopkar polindra'),
(1068, 26, 'TRX9165920-220713113934', '2022-07-13', 'suheri 0046895117', 265000, 'aktif', 'kopkar polindra'),
(1069, 26, 'TRX6646661-220713110151', '2022-07-13', 'gempar pamungkas f 0038631244', 265000, 'aktif', 'kopkar polindra'),
(1070, 26, 'TRX3346769-220713103536', '2022-07-13', 'ella shellia wati 0036363919', 265000, 'aktif', 'kopkar polindra'),
(1071, 26, 'TRX7986985-220713092757', '2022-07-13', 'm.zarul ikmal 192010175', 265000, 'aktif', 'kopkar polindra'),
(1072, 26, 'TRX4877638-220712030322', '2022-07-12', 'hamzah sabahadetin 0044092983', 265000, 'aktif', 'kopkar polindra'),
(1073, 9, 'TRX7750822-220712024700', '2022-07-12', 'bu munengsih', 90000, 'aktif', 'kopkar polindra'),
(1074, 26, 'TRX2008476-220712023505', '2022-07-12', 'kiki kurniawati .s 0046710092', 265000, 'aktif', 'kopkar polindra'),
(1075, 26, 'TRX9619331-220712015250', '2022-07-12', 'hafidh almuhli 0043653790', 265000, 'aktif', 'kopkar polindra'),
(1076, 261, 'TRX4677862-220712014147', '2022-07-12', 'orien argo bayu pakuaji 2002049', 2615000, 'aktif', 'kopkar polindra'),
(1077, 26, 'TRX4431415-220712013723', '2022-07-12', 'm.zidan fauzi 0025519897', 265000, 'aktif', 'kopkar polindra'),
(1078, 26, 'TRX1587920-220712013131', '2022-07-12', 'bimo pradipa raja susila 0036687502', 265000, 'aktif', 'kopkar polindra'),
(1079, 26, 'TRX607548-220712115551', '2022-07-12', 'safira nurmala sari 0031376032', 265000, 'aktif', 'kopkar polindra'),
(1080, 26, 'TRX9007769-220712114837', '2022-07-12', 'maskani 0047978971', 265000, 'aktif', 'kopkar polindra'),
(1081, 2, 'TRX311432-220712110742', '2022-07-12', 'ibu isni', 28000, 'aktif', 'kopkar polindra'),
(1082, 26, 'TRX5006794-220712110352', '2022-07-12', 'yepi mardelina 0043137186', 265000, 'aktif', 'kopkar polindra'),
(1083, 26, 'TRX9005093-220712105343', '2022-07-12', 'akmal wilmar 0049662368', 265000, 'aktif', 'kopkar polindra'),
(1084, 26, 'TRX8872440-220712104751', '2022-07-12', 'romi setiawan 0045971676', 265000, 'aktif', 'kopkar polindra'),
(1085, 26, 'TRX8307129-220712103355', '2022-07-12', 'ramarajasharifa g.e 0044516577', 265000, 'aktif', 'kopkar polindra'),
(1086, 26, 'TRX2146180-220712101553', '2022-07-12', 'm. azland usman 0035022020', 265000, 'aktif', 'kopkar polindra'),
(1087, 26, 'TRX1699757-220712101021', '2022-07-12', 'bayu satria yudha 0043015265', 265000, 'aktif', 'kopkar polindra'),
(1088, 26, 'TRX7949635-220712094450', '2022-07-12', 'shela nabilah 0046778378', 265000, 'aktif', 'kopkar polindra'),
(1089, 26, 'TRX6667335-220712094205', '2022-07-12', 'm. faqih arriza 0042271951', 265000, 'aktif', 'kopkar polindra'),
(1090, 501, 'TRX4154430-220729034751', '2022-07-29', 'septian alfan wahid 0036870326', 5015000, 'aktif', 'kopkar polindra'),
(1091, 701, 'TRX3228180-220729023839', '2022-07-29', 'taufik hidayat 0033378387', 7015000, 'aktif', 'kopkar polindra'),
(1092, 121, 'TRX1759670-220729023550', '2022-07-29', 'taufik hidayat 0033378387', 1215000, 'aktif', 'kopkar polindra'),
(1093, 501, 'TRX6398409-220729021941', '2022-07-29', 'gempar pamungkas f 0038631244', 5015000, 'aktif', 'kopkar polindra'),
(1094, 121, 'TRX8684712-220729021720', '2022-07-29', 'gempar pamungkas f 0038631244', 1215000, 'aktif', 'kopkar polindra'),
(1095, 121, 'TRX7540233-220729110626', '2022-07-29', 'anggi sugilan 0045034275', 1215000, 'aktif', 'kopkar polindra'),
(1096, 3, 'TRX4710766-220729122018', '2022-07-29', 'ibu atik', 33000, 'aktif', 'kopkar polindra'),
(1097, 10, 'TRX7843987-220729121756', '2022-07-29', 'ibu esti', 105000, 'aktif', 'kopkar polindra'),
(1098, 501, 'TRX8183686-220729110255', '2022-07-29', 'tegar hardiyansah 0037648286', 5015000, 'aktif', 'kopkar polindra'),
(1099, 121, 'TRX8853343-220729110134', '2022-07-29', 'tegar hardiyansah 0037648286', 1215000, 'aktif', 'kopkar polindra'),
(1100, 601, 'TRX373731-220729105430', '2022-07-29', 'riski firmansah 0032403662', 6015000, 'aktif', 'kopkar polindra'),
(1101, 121, 'TRX6888148-220729105250', '2022-07-29', 'riski firmansah 0032403662', 1215000, 'aktif', 'kopkar polindra'),
(1102, 5, 'TRX7464573-220729104709', '2022-07-29', 'bu munengsih', 50000, 'aktif', 'kopkar polindra'),
(1103, 5, 'TRX8002728-220729103236', '2022-07-29', 'ibu atik', 51000, 'aktif', 'kopkar polindra'),
(1104, 121, 'TRX3508333-220729102908', '2022-07-29', 'm. revan hakim 0042837118', 1215000, 'aktif', 'kopkar polindra'),
(1105, 501, 'TRX6868393-220729101256', '2022-07-29', 'm. abiyyu tsani 0042455536', 5015000, 'aktif', 'kopkar polindra'),
(1106, 161, 'TRX3168004-220729101006', '2022-07-29', 'm. abiyyu tsani 0042455536', 1615000, 'aktif', 'kopkar polindra'),
(1107, 501, 'TRX8232157-220729084757', '2022-07-29', 'puja ayu trisnanda 0042756483', 5015000, 'aktif', 'kopkar polindra'),
(1108, 121, 'TRX5358193-220729084554', '2022-07-29', 'puja ayu trisnanda 0042756483', 1215000, 'aktif', 'kopkar polindra');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `registered_at` date NOT NULL,
  `tmt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `member_id`, `email`, `username`, `password`, `name`, `phone_number`, `address`, `is_banned`, `status`, `main_payment_status`, `registered_at`, `tmt`, `deleted_at`, `created_at`, `updated_at`) VALUES
('049cffac-d31f-4fb1-866b-2fb6f967a7cc', '414e5aab-19b7-4bb0-b185-01d0324edc38', '12121', 'afandi3120@gmail.com', 'user@gmail.com', '$2y$10$tyG4CSuvMBUDjebxsPVSROsnNRArFTXUsuBH5vLQoxpDsp/8elVP2', 'Imam santosa', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 1, '2022-03-17', '1', '2022-06-10 16:25:28', '2022-03-17 13:41:53', '2022-06-10 16:25:28'),
('0c341878-4a12-42d7-8f5b-f46873efb942', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '21122', 'agus_afandi44@yahoo.com', 'diki', 'diki123', 'diki', '08221122187491', 'indramayu', 0, '1', 1, '2022-02-09', '22', '2022-02-10 11:07:53', '2022-02-09 11:08:19', '2022-02-10 11:07:53'),
('1642f6da-a762-4984-9f69-d81d99d536fc', '414e5aab-19b7-4bb0-b185-01d0324edc38', NULL, 'teest@gmail.com', 'ardiantry', '$2y$10$96LfAVwTfHtphJjVgnPGV.9zht0Pk9RUSAqH1fww21vp91raK7HgS', 'ardian', '1234567898765', 'test', 0, '1', 0, '2022-06-13', '12345678', '2022-06-13 13:04:03', '2022-06-13 12:46:20', '2022-06-13 13:04:03'),
('22796c38-02cb-45ed-a709-a342946a1c4c', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903002', 'isall@gmail.com', 'user@gmail.com', 'user123', 'isal isul', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 0, '2022-03-18', '1', NULL, '2022-03-18 02:56:01', '2022-03-18 02:56:01'),
('228e99d4-3ad6-4408-9c90-fb0c71e7224c', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '212121122121', 'user@gmail.comas', 'user@gmail.as', 'user123', 'wasasdasd', '212121122121', 'assasasa', 0, '0', 1, '2022-02-10', '142', '2022-03-17 08:12:41', '2022-02-10 11:46:37', '2022-03-17 08:12:41'),
('25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '414e5aab-19b7-4bb0-b185-01d0324edc38', '19030122', 'afandi3120@gmail.com', 'user@gmail.com', 'user123', 'mamat hidayat', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', NULL, '2022-06-10 16:16:23', '2022-03-17 15:24:27', '2022-06-10 16:16:23'),
('2edad0bd-6f88-4961-a6af-e6a6f0c53060', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903020', 'afandi3120@gmail.com', 'agusafandi', 'afandi3120', 'agus afandi', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', '12', NULL, '2022-03-17 08:18:57', '2022-03-17 08:18:57'),
('3616550e-5270-4d70-ae2c-c15772f73887', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '212121122121', 'adminutama@gmail.com', 'user@gmail.com', 'user123', 'Admin Afandi agus asass', '08212211212', 'indramayu', 0, '1', 1, '2022-02-10', '333', '2022-03-17 08:12:46', '2022-02-10 11:12:35', '2022-03-17 08:12:46'),
('4a5737b0-ccb7-41d1-a260-b0288e1732bb', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903013', 'Halimah@gmail.com', 'halimah syahdiah', '$2y$10$dxTcOM/hXfTmBm1/NDeT/.lBRCFYn0ioBEKgfoARrT5FFPZ/PRjzi', 'halimah', '08178278278278', 'jln. pertiwi', 0, '0', 0, '2022-03-20', NULL, NULL, '2022-03-20 15:14:32', '2022-03-20 15:15:11'),
('4c1edbc8-d4c9-4256-a83d-990a4f77c529', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903027', 'rapi@gmail.com', 'rapi setya', 'kopkar312', 'rai setya', '086621312312', 'sindang', 0, '1', 0, '2022-03-22', NULL, '2022-06-10 16:19:51', '2022-03-22 08:32:08', '2022-06-10 16:19:51'),
('4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903028', 'Uun menari', 'uun', 'kopkar312', 'uun', '08512312672', 'jln. sudirman', 0, '0', 0, '2022-03-20', NULL, NULL, '2022-03-20 15:06:56', '2022-03-20 15:06:56'),
('67452897-42c4-4bb4-8440-3a5eea43cbd3', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'user', 'afandi', 'afandi', '08212211212', 'nganjuk', 0, '1', 1, '2022-02-07', '1', '2022-02-10 11:07:58', '2022-02-06 18:00:51', '2022-02-10 11:07:58'),
('6b2accc5-3620-4592-8fc1-1b51d5dcd467', '414e5aab-19b7-4bb0-b185-01d0324edc38', '12345678', 'ardiansdr@gmail.com', 'user', '12345678', 'ardian', '085422567825', 'indramayu', 0, '1', 0, '2022-06-13', '123456', '2022-06-13 13:10:43', '2022-06-13 13:05:14', '2022-06-13 13:10:43'),
('7e67b353-585d-45f0-8e11-378edbe83c99', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903012', 'assa0@gmail.com', 'afanid', '$2y$10$WzgevrsmP7fNaFBnJxMN5e0jdMaca1Rw/E2FbPgSs1wvOOT8AgdBO', 'Dicki Prastya', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 1, '2022-03-17', '3222222222222222', NULL, '2022-03-17 13:01:27', '2022-03-17 16:31:09'),
('7f7aaaf9-9067-4a13-bbc1-c650a55c3707', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$BAR5C0o5oxw6TgDiOWbT5u1MMUJt7jbFu8h4X2ImNIWVS31ScOr5m', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-03-12', NULL, NULL, '2022-03-11 18:18:30', '2022-03-11 18:18:30'),
('9699e020-6ae6-4e84-aba2-a93937d829be', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903001', 'adhitya ilham UI', 'adhitya', 'kopkar312', 'adhitya ilham', '089211667472', 'jln. Gempir jombang', 0, '0', 0, '2022-03-21', NULL, NULL, '2022-03-20 17:49:13', '2022-03-20 17:49:13'),
('99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'afandi', 'afandi', 'afandi', '082232187491', 'nganjuk', 0, '1', 1, '2022-02-04', '1', '2022-02-06 18:00:13', '2022-02-04 15:42:16', '2022-02-06 18:00:13'),
('a8667bf8-55e1-473d-94c0-39f32777b79c', '414e5aab-19b7-4bb0-b185-01d0324edc38', 'bu munengsih', 'ardiansdr@gmail.com', 'kopkap', '$2y$10$Jv33WJ4Gxm1wcJe8YnQ2FuRpTtMOEMTxWSgW2eihx4pc9fzvPwpWm', 'kopkar polindra', '098765456876', 'indramayu', 0, '1', 1, '2022-06-13', '12345678', NULL, '2022-06-13 13:11:55', '2022-07-14 15:31:35'),
('b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '414e5aab-19b7-4bb0-b185-01d0324edc38', '2112212', 'afandi3120@gmail.com', 'user@gmail.com', '$2y$10$L8/4vW.RgwS7labWZbjcSuDUBO7Gh4ITiUKxlunUOaW90L8NTLTMe', 'Idang wiguna', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', '2', NULL, '2022-03-17 13:16:04', '2022-03-17 16:33:39'),
('c80864ee-bc31-4847-9b59-5db60342439c', '414e5aab-19b7-4bb0-b185-01d0324edc38', NULL, 'isall@gmail.com', 'isallaku', 'user123', 'isal isul', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 0, '2022-03-18', '1', '2022-03-18 02:54:51', '2022-03-18 02:53:52', '2022-03-18 02:54:51'),
('d7181500-943d-4e7a-8d07-68048e3e1560', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '12311', 'adminutama@gmail.com', 'adminutama@gmail.com', '12212121', 'afandisa', '08212211212', 'waassasa', 0, '1', 1, '2022-02-09', '42', '2022-03-17 08:12:35', '2022-02-09 11:21:07', '2022-03-17 08:12:35'),
('dfff588e-2d03-4d5f-8861-972c4747080a', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$8vBwbTf7sy9d/0u5ZUcyu.xxF8Mi4SstbYg1lrZxAvOPtV2TpY9aO', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-02-04', NULL, NULL, '2022-02-04 15:40:11', '2022-02-04 15:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `monthly` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `other` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `main`, `monthly`, `other`, `total`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0154b6c3-fc64-4457-b669-ea862d149ed7', '22796c38-02cb-45ed-a709-a342946a1c4c', '114000', '0', '0', '114000', NULL, '2022-03-18 02:56:42', '2022-03-20 14:58:30'),
('031b374f-b16d-4082-b204-e875072249d2', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '110000', '0', '0', '110000', NULL, '2022-03-20 15:07:33', '2022-03-20 15:11:53'),
('07e93ec8-2840-40eb-b124-cd69041b08e9', '67452897-42c4-4bb4-8440-3a5eea43cbd3', '750000', '0', '0', '750000', NULL, '2022-02-06 18:02:58', '2022-02-06 18:03:18'),
('09930314-6e05-49e3-af7c-723dda90087d', '09850301-2ef7-44cb-a7b6-d8169830b98f', '500000', '0', '0', '500000', NULL, '2022-07-13 07:34:09', '2022-07-13 07:34:32'),
('0b95fbef-6f41-463f-89e7-872edc1b99a1', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', '520000', '0', '0', '520000', NULL, '2022-02-04 15:45:10', '2022-02-04 15:45:25'),
('124d94d8-4c3e-4c8e-ac13-b5fae62c5ec8', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '136656', '0', '0', '136656', NULL, '2022-03-17 13:16:19', '2022-03-17 13:27:36'),
('5ee24093-5cfa-4ecb-b961-004673562c9f', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', '40000', '0', '0', '40000', '2022-06-10 16:19:51', '2022-03-22 08:33:25', '2022-06-10 16:19:51'),
('5f201dbc-8977-4400-81c9-505a77765aa1', 'd09ebfc0-e861-4add-8dbf-f69325930a5b', '500000', '0', '0', '500000', NULL, '2022-06-24 08:38:09', '2022-06-24 08:38:09'),
('60ac5ccc-730b-4bfa-884a-ad6a89925da1', '7e67b353-585d-45f0-8e11-378edbe83c99', '585656', '100000', '0', '685656', NULL, '2022-03-17 13:02:01', '2022-06-12 19:17:12'),
('64d140f4-b169-4434-8cb5-fa2c263d0634', '228e99d4-3ad6-4408-9c90-fb0c71e7224c', '1500000', '0', '0', '1500000', '2022-03-17 08:12:41', '2022-03-17 07:02:16', '2022-03-17 08:12:41'),
('6a847c9e-e94d-4ab7-ba90-de33bbc923a0', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '700000', '0', '0', '700000', NULL, '2022-03-20 15:15:42', '2022-07-13 07:33:19'),
('70ee0516-fdcb-497c-8d45-7be07d6180f4', '0c341878-4a12-42d7-8f5b-f46873efb942', '808299', '0', '0', '808299', NULL, '2022-02-09 11:09:25', '2022-02-09 11:10:39'),
('8bc6412e-63fe-457b-99a8-f2d03e75c9fb', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', '195000', '0', '0', '195000', '2022-06-10 16:16:23', '2022-03-20 15:00:40', '2022-06-10 16:16:23'),
('8d6bf6a1-3a08-4ac5-87d7-5ac32f9a9020', 'd7181500-943d-4e7a-8d07-68048e3e1560', '2121221', '0', '0', '2121221', '2022-03-17 08:12:35', '2022-02-09 11:21:26', '2022-03-17 08:12:35'),
('99109f6a-25b1-4b29-9faf-c90c17cb4aef', 'a8667bf8-55e1-473d-94c0-39f32777b79c', '500000', '50000', '0', '550000', NULL, '2022-06-21 13:44:29', '2022-06-21 14:30:06'),
('ba1eda93-9aca-4c6d-9891-e84a35995798', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '515444', '0', '0', '515444', '2022-06-10 16:25:28', '2022-03-17 13:42:13', '2022-06-10 16:25:28'),
('bdf7ff9a-6a39-412b-a00a-44a0edbdffe4', '3616550e-5270-4d70-ae2c-c15772f73887', '1800004', '150000', '0', '1950004', '2022-03-17 08:12:46', '2022-02-10 11:15:10', '2022-03-17 08:12:46'),
('c157a4cd-0a48-4ed9-867d-7ca3f8adcfc7', '9699e020-6ae6-4e84-aba2-a93937d829be', '70000', '0', '0', '70000', NULL, '2022-03-20 17:50:12', '2022-03-21 11:06:06'),
('dc25cfc3-ade9-44a5-9c1f-c7bdea53c164', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '275000', '0', '0', '275000', NULL, '2022-03-17 08:20:43', '2022-03-17 12:59:01'),
('fe9c696f-7a97-481a-96d8-e49f407a3466', 'c80864ee-bc31-4847-9b59-5db60342439c', '22222', '0', '0', '22222', '2022-03-18 02:54:51', '2022-03-18 02:54:17', '2022-03-18 02:54:51');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `withdrawn_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yearly_logs`
--

CREATE TABLE `yearly_logs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `total_main` int(11) DEFAULT NULL,
  `total_monthly` int(11) DEFAULT NULL,
  `total_other` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yearly_logs`
--

INSERT INTO `yearly_logs` (`id`, `user_id`, `year`, `total_main`, `total_monthly`, `total_other`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1433d0aa-8fb0-435c-ab72-4270a1e37df1', '25554bb7-e85a-41ee-bbb6-1dbbf082efdc', 2022, 195000, NULL, NULL, '2022-06-10 16:16:23', '2022-03-20 15:00:40', '2022-06-10 16:16:23'),
('1449a277-0a60-463b-851c-6732853dc30c', '228e99d4-3ad6-4408-9c90-fb0c71e7224c', 2022, 1500000, NULL, NULL, '2022-03-17 08:12:41', '2022-03-17 07:02:16', '2022-03-17 08:12:41'),
('28745f7f-1818-4b17-8be9-c756cd86b2ae', 'b6556cfb-12dc-4c44-9f81-bf9744fe4e78', 2022, 136656, NULL, NULL, NULL, '2022-03-17 13:16:19', '2022-03-17 13:27:36'),
('2bbd8e49-4e38-4358-af4e-e378ea2dcdce', '99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', 2022, 520000, NULL, NULL, NULL, '2022-02-04 15:45:10', '2022-02-04 15:45:25'),
('2d553336-c80a-4812-a165-3f7ed466131c', '0c341878-4a12-42d7-8f5b-f46873efb942', 2022, 808299, NULL, NULL, NULL, '2022-02-09 11:09:25', '2022-02-09 11:10:39'),
('401cb44a-6842-4a03-903f-9a1ee4ac4ef3', 'd7181500-943d-4e7a-8d07-68048e3e1560', 2022, 2121221, NULL, NULL, '2022-03-17 08:12:35', '2022-02-09 11:21:26', '2022-03-17 08:12:35'),
('41977a21-0f5f-410f-8ed8-6a3f74b840c9', 'a8667bf8-55e1-473d-94c0-39f32777b79c', 2022, 500000, 50000, NULL, NULL, '2022-06-21 13:44:29', '2022-06-21 14:30:06'),
('4b29da4f-9de1-4c22-98a1-36cab6181e87', '3616550e-5270-4d70-ae2c-c15772f73887', 2022, 1800004, 150000, NULL, '2022-03-17 08:12:46', '2022-02-10 11:15:10', '2022-03-17 08:12:46'),
('681dcd58-b969-450b-8feb-82f5b71f3752', 'd09ebfc0-e861-4add-8dbf-f69325930a5b', 2022, 500000, NULL, NULL, NULL, '2022-06-24 08:38:09', '2022-06-24 08:38:09'),
('71c6c51e-4534-4fd4-97e6-673b925be8e6', '22796c38-02cb-45ed-a709-a342946a1c4c', 2022, 114000, NULL, NULL, NULL, '2022-03-18 02:56:42', '2022-03-20 14:58:30'),
('7e0984d2-3faa-4aad-89ff-b480fd8130e2', 'c80864ee-bc31-4847-9b59-5db60342439c', 2022, 22222, NULL, NULL, '2022-03-18 02:54:51', '2022-03-18 02:54:17', '2022-03-18 02:54:51'),
('8ddb4f8e-504e-48d1-ab03-fb645651007c', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', 2022, 275000, NULL, NULL, NULL, '2022-03-17 08:20:43', '2022-03-17 12:59:01'),
('a0a7498d-ebca-4eee-bd2c-d0b16d8e5eff', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', 2022, 515444, NULL, NULL, '2022-06-10 16:25:28', '2022-03-17 13:42:13', '2022-06-10 16:25:28'),
('c127a7c7-e8f1-4d38-b83d-0c0744245167', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', 2022, 800000, NULL, NULL, NULL, '2022-03-20 15:15:42', '2022-07-13 07:33:19'),
('c41fe75a-880e-49be-b676-cdf646d2579d', '67452897-42c4-4bb4-8440-3a5eea43cbd3', 2022, 750000, NULL, NULL, NULL, '2022-02-06 18:02:58', '2022-02-06 18:03:18'),
('cc190ef1-88c3-43f5-bbc6-971d3848dfd1', '4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', 2022, 110000, NULL, NULL, NULL, '2022-03-20 15:07:33', '2022-03-20 15:11:53'),
('ceb3b30b-1e4a-4827-bb57-bdce715a3c54', '09850301-2ef7-44cb-a7b6-d8169830b98f', 2022, 500000, NULL, NULL, NULL, '2022-07-13 07:34:09', '2022-07-13 07:34:32'),
('d8a06623-c457-4cff-8111-0faae13a9437', '9699e020-6ae6-4e84-aba2-a93937d829be', 2022, 70000, NULL, NULL, NULL, '2022-03-20 17:50:12', '2022-03-21 11:06:06'),
('de1fbac8-cfab-424a-9f5a-b4f68e7e9d2b', '4c1edbc8-d4c9-4256-a83d-990a4f77c529', 2022, 40000, NULL, NULL, '2022-06-10 16:19:51', '2022-03-22 08:33:25', '2022-06-10 16:19:51'),
('e174f354-ad40-46e2-9fd1-6ec1e96a2caf', '7e67b353-585d-45f0-8e11-378edbe83c99', 2022, 585656, 100000, NULL, NULL, '2022-03-17 13:02:01', '2022-06-12 19:17:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `config_payments`
--
ALTER TABLE `config_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_payments`
--
ALTER TABLE `main_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_payments_user_id_foreign` (`user_id`),
  ADD KEY `main_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monthly_payments_user_id_foreign` (`user_id`),
  ADD KEY `monthly_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indexes for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `other_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_belanja`
--
ALTER TABLE `tb_belanja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_poin_dipakai`
--
ALTER TABLE `tb_poin_dipakai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`);

--
-- Indexes for table `yearly_logs`
--
ALTER TABLE `yearly_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yearly_logs_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_belanja`
--
ALTER TABLE `tb_belanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=802;

--
-- AUTO_INCREMENT for table `tb_poin_dipakai`
--
ALTER TABLE `tb_poin_dipakai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  MODIFY `id_poin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1109;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD CONSTRAINT `monthly_payments_config_payment_id_foreign` FOREIGN KEY (`config_payment_id`) REFERENCES `config_payments` (`id`),
  ADD CONSTRAINT `monthly_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `other_payments`
--
ALTER TABLE `other_payments`
  ADD CONSTRAINT `other_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
