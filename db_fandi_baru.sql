-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Agu 2022 pada 15.59
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `config_payments`
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
-- Dumping data untuk tabel `config_payments`
--

INSERT INTO `config_payments` (`id`, `name`, `paid_off_amount`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
('5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 'monthly_payment', '50000', 1, NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('66e22622-968c-452f-9d0f-37d75ea585d5', 'main_payment', '500000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('6e21a8c5-fe56-4241-a028-4614ef47d3ef', 'main_payment', '700000', 1, NULL, '2022-02-04 15:40:10', '2022-02-09 11:05:40'),
('a3e7c931-9623-4ace-bc61-6215619ec797', 'monthly_payment', '50000', 1, NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `main_payments`
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
-- Dumping data untuk tabel `main_payments`
--

INSERT INTO `main_payments` (`id`, `user_id`, `config_payment_id`, `amount`, `paid_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
('0235f111-3ee1-44cc-927c-56afaa45db54', '4a5737b0-ccb7-41d1-a260-b0288e1732bb', '66e22622-968c-452f-9d0f-37d75ea585d5', 700000, '2022-07-13', NULL, '2022-07-13 07:33:19', '2022-07-13 07:33:19'),
('1c3473ae-11b2-4789-8e86-65de2c82d8e4', '09850301-2ef7-44cb-a7b6-d8169830b98f', '66e22622-968c-452f-9d0f-37d75ea585d5', 450000, '2022-07-13', NULL, '2022-07-13 07:34:09', '2022-07-13 07:34:09'),
('2f8101dd-dd3b-41dc-8ef8-33324b35be51', '09850301-2ef7-44cb-a7b6-d8169830b98f', '66e22622-968c-452f-9d0f-37d75ea585d5', 50000, '2022-07-13', NULL, '2022-07-13 07:34:32', '2022-07-13 07:34:32'),
('42f713ab-a1e4-408e-9dba-558256dab2d0', '9f8b5824-1735-4bb3-87b2-6945919f737e', '66e22622-968c-452f-9d0f-37d75ea585d5', 200000, '2022-08-04', NULL, '2022-08-04 13:12:56', '2022-08-04 13:12:56'),
('8261358c-60ad-40bc-9838-79bbb85211ad', 'd09ebfc0-e861-4add-8dbf-f69325930a5b', '66e22622-968c-452f-9d0f-37d75ea585d5', 500000, '2022-06-24', NULL, '2022-06-24 08:38:09', '2022-06-24 08:38:09'),
('bca0ca28-630f-4808-a548-ef314867de23', '9f8b5824-1735-4bb3-87b2-6945919f737e', '66e22622-968c-452f-9d0f-37d75ea585d5', 20000, '2022-08-04', NULL, '2022-08-04 13:14:51', '2022-08-04 13:14:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
-- Struktur dari tabel `monthly_payments`
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

--
-- Dumping data untuk tabel `monthly_payments`
--

INSERT INTO `monthly_payments` (`id`, `user_id`, `config_payment_id`, `amount`, `payment_month`, `paid_at`, `deleted_at`, `created_at`, `updated_at`, `payment_year`) VALUES
('04e861ae-b76a-49d6-832b-af2cccf72eaf', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 7, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('18a2db8c-6395-4dcd-ad2b-eca733939142', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 11, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('426ff66d-cf48-49e7-afe6-6c5c77720026', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 8, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('66c12090-a3f7-4345-8f2e-d6f8ae592445', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 10, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('670b457f-1bc7-48d0-8c69-e0fcd3b7848b', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 3, NULL, NULL, '2022-08-04 12:36:32', '2022-08-04 12:36:32', '2022'),
('7121a318-c4e9-4e04-8b7e-f64c989d9e88', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 50000, 1, '2022-08-04', NULL, '2022-08-04 12:36:32', '2022-08-04 12:36:33', '2022'),
('797efc3a-f0fe-4054-9c4f-018cf7348e96', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 9, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('9f4bf28f-44c5-4813-a12c-1aa2986f4b29', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 5, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('a500da9b-325a-4c87-8d59-50d8dc44068a', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 2, NULL, NULL, '2022-08-04 12:36:32', '2022-08-04 12:36:32', '2022'),
('bfed6742-039f-4032-b67b-dd1c0a118c31', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 6, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('e8bd0e16-fa08-4107-9ed2-fc536c3ff219', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 12, NULL, NULL, '2022-08-04 12:36:33', '2022-08-04 12:36:33', '2022'),
('f4e4c478-c437-4150-8317-0be8b3a2fbe5', '9f8b5824-1735-4bb3-87b2-6945919f737e', '5be7dc60-1758-45c9-ac49-9ef8878c9fa8', 0, 4, NULL, NULL, '2022-08-04 12:36:32', '2022-08-04 12:36:32', '2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `other_payments`
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

--
-- Dumping data untuk tabel `other_payments`
--

INSERT INTO `other_payments` (`id`, `user_id`, `amount`, `payment_month`, `paid_at`, `deleted_at`, `created_at`, `updated_at`, `payment_year`) VALUES
('167c406f-407a-44f0-83cc-3dd275a44e3d', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 4, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('3928465c-540b-4304-a55f-14a017e0bc12', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 8, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('4a9a5dbe-036d-4254-8094-71ff0e1124d8', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 10, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('688d7def-e6ca-42f9-9b59-baef7cc6202c', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 6, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('70b434b0-fbf2-45ea-bf36-2d5e5fb987cb', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 9, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('770fb987-7215-4ebe-b100-af42b365984d', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 5, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('b03a0d05-3c16-4d27-b522-6de0e724ac99', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 11, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('b5a722fb-2271-407f-93ef-710b4595d0f0', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 3, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('c927d6b4-e0c4-4c1e-963f-84e67cb20ff9', '9f8b5824-1735-4bb3-87b2-6945919f737e', 20000, 1, '2022-08-04', NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('d1884db1-f895-4905-bd89-573aef563aaa', '9f8b5824-1735-4bb3-87b2-6945919f737e', 200000, 2, '2022-08-04', NULL, '2022-08-04 12:36:51', '2022-08-04 12:37:21', '2022'),
('d2a544de-5c84-4482-a936-01f1144b8eda', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 12, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022'),
('f42d7d43-bc0b-47dd-bca5-ce34233c6c4b', '9f8b5824-1735-4bb3-87b2-6945919f737e', 0, 7, NULL, NULL, '2022-08-04 12:36:51', '2022-08-04 12:36:51', '2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
('414e5aab-19b7-4bb0-b185-01d0324edc38', 'user', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('5e5279ee-8275-48a0-bdc3-31953db78e7b', 'admin', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10'),
('7ad38ef8-f5e7-4635-8cac-5d43c0a65f15', 'admin', NULL, '2022-03-11 18:18:29', '2022-03-11 18:18:29'),
('b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', 'user', NULL, '2022-02-04 15:40:10', '2022-02-04 15:40:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_belanja`
--

CREATE TABLE `tb_belanja` (
  `id` int(11) NOT NULL,
  `no_trax` varchar(100) NOT NULL,
  `atribut` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_belanja`
--

INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(802, 'TRX7019340-220801024216', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(803, 'TRX1155433-220801024018', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(804, 'TRX3964733-220801023500', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(805, 'TRX5372728-220801023419', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(806, 'TRX2377885-220801015420', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(807, 'TRX392508-220801015112', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(808, 'TRX6651664-220801014705', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(809, 'TRX9862065-220801014550', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(810, 'TRX2407902-220801013545', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(811, 'TRX8084090-220801013417', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(812, 'TRX2693361-220801013033', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(813, 'TRX1537508-220801012910', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(814, 'TRX3531577-220801011829', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(815, 'TRX6665723-220801011705', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(816, 'TRX9004113-220801105723', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(817, 'TRX2186457-220801105533', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(818, 'TRX2089464-220801104845', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(819, 'TRX9029932-220801104505', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:500000;s:9:\"sub_total\";i:500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(820, 'TRX3871425-220801104314', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(821, 'TRX9344169-220801103818', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(822, 'TRX1523364-220801101655', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(823, 'TRX3665649-220801101401', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(824, 'TRX1063809-220801101214', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(825, 'TRX5287702-220801100237', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(826, 'TRX7676780-220801100054', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(827, 'TRX3308244-220801095816', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(828, 'TRX7317021-220801095656', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(829, 'TRX6913426-220801095515', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(830, 'TRX528291-220801095247', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(831, 'TRX8253605-220801094349', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(832, 'TRX5740189-220801094243', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(833, 'TRX4315344-220801093753', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(834, 'TRX4448777-220801093457', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(835, 'TRX7953486-220801091356', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(836, 'TRX6861299-220801091230', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(837, 'TRX8879877-220801091037', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(838, 'TRX7884060-220801090928', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(839, 'TRX8456252-220801090641', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(840, 'TRX6212944-220801090459', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(841, 'TRX357066-220801090016', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(842, 'TRX7126138-220801085733', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(843, 'TRX3399282-220802024529', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(844, 'TRX4785813-220802024450', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(845, 'TRX326378-220802024104', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(846, 'TRX6258731-220802023640', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(847, 'TRX475684-220802023434', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(848, 'TRX8664375-220802020040', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(849, 'TRX3007460-220802010841', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:500000;s:9:\"sub_total\";i:500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(850, 'TRX4092962-220802010625', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(851, 'TRX751417-220802121454', 'a:3:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(852, 'TRX3380614-220802111052', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(853, 'TRX1454677-220802110916', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(854, 'TRX1067083-220802101202', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(855, 'TRX9915436-220802101017', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(856, 'TRX25848-220802100705', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(857, 'TRX7257210-220802100423', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(858, 'TRX7387714-220802095831', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(859, 'TRX9217447-220802095547', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(860, 'TRX7424507-220802094223', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(861, 'TRX6359366-220802094105', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(862, 'TRX7875752-220802093748', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(863, 'TRX262647-220802093555', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(864, 'TRX8659109-220802093206', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(865, 'TRX710918-220802093003', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(866, 'TRX7403998-220802091719', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(867, 'TRX1391992-220802091513', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(868, 'TRX1284195-220802091122', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(869, 'TRX7225326-220802090937', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(870, 'TRX5023987-220802032417', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:9:\"Ice Choco\";}}'),
(871, 'TRX2276701-220802034929', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(872, 'TRX6227006-220802034806', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(873, 'TRX1725203-220803012730', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(874, 'TRX3202232-220803012549', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(875, 'TRX4773534-220803011652', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(876, 'TRX1304956-220803010923', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(877, 'TRX8580519-220803115635', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(878, 'TRX6241876-220803115419', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(879, 'TRX9001166-220803114811', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(880, 'TRX2179129-220803114650', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(881, 'TRX4530052-220803113803', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(882, 'TRX1734871-220803113544', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(883, 'TRX4077146-220803103957', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Hot Americano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(884, 'TRX6799401-220803103714', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(885, 'TRX2131191-220803103530', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(886, 'TRX5606453-220803093445', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(887, 'TRX5436547-220803093236', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(888, 'TRX2943090-220803092614', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(889, 'TRX1552563-220803092503', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(890, 'TRX3756829-220803092058', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000000;s:9:\"sub_total\";i:4000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(891, 'TRX7057366-220803091806', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(892, 'TRX1791979-220803091433', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(893, 'TRX7003057-220803091305', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(894, 'TRX3903895-220803090916', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000000;s:9:\"sub_total\";i:7000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(895, 'TRX337848-220803090653', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(896, 'TRX8590279-220803015116', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(897, 'TRX2385251-220803014909', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(898, 'TRX2535335-220803014721', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:10:\"Super Star\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:10:\"Chocolatos\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(899, 'TRX601233-220803013538', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(900, 'TRX7705542-220803013302', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(901, 'TRX1422350-220803012143', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Ajib Burger\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Ice Americano\";}}'),
(902, 'TRX7158086-220803125554', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"Cocacola\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:5:\"Kalpa\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}}'),
(903, 'TRX6378741-220803124727', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:21:\"Ice / Hot Coffee Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Kentang Sosis\";}}'),
(904, 'TRX3711945-220803124606', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:11:\"Sosis Bakar\";}}'),
(905, 'TRX30919-220803124514', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:12:\"Coffee Latte\";}}'),
(906, 'TRX5959070-220803124108', 'a:5:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:16:\"Susu Ultra 250ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:11:\"Wafelo 2000\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:8:\"Bengbeng\";}i:4;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000;s:9:\"sub_total\";i:7000;s:9:\"nm_barang\";s:8:\"Ching Ku\";}}'),
(907, 'TRX6796050-220803121123', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}}'),
(908, 'TRX4391972-220803112904', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:7:\"Basreng\";}}'),
(909, 'TRX2520742-220803110453', 'a:1:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:6000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:16:\"Susu Ultra 250ml\";}}'),
(910, 'TRX761449-220803105657', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}}'),
(911, 'TRX7267488-220803105003', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:6000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:16:\"Susu Ultra 250ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}}'),
(912, 'TRX3989851-220803103919', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:36000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}}'),
(913, 'TRX5503322-220803103857', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:19:\"Kopi Tubruk Arabica\";}}'),
(914, 'TRX3904429-220803103319', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}}'),
(915, 'TRX241974-220803095056', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:13:\"Ice Americano\";}}'),
(916, 'TRX4347526-220803094304', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}}'),
(917, 'TRX2345438-220803085756', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(918, 'TRX5701878-220802040114', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:9:\"Ice Latte\";}}'),
(919, 'TRX6258241-220802015847', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(920, 'TRX1246377-220802034141', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:8:\"Cocacola\";}}'),
(921, 'TRX5883923-220802033343', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:18:\"Espresso Americano\";}}'),
(922, 'TRX114867-220802031808', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(923, 'TRX8231325-220802025740', 'a:2:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:9000;s:9:\"nm_barang\";s:21:\"Teh botol kotak 200ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:16:\"Susu Ultra 250ml\";}}'),
(924, 'TRX8042786-220802025103', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:19:\"Kopi Tubruk Arabica\";}}'),
(925, 'TRX8403534-220802021438', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:6:\"Malkis\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:15:\"Teh Botol 350ml\";}}'),
(926, 'TRX8860694-220802125005', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:8:\"fruittea\";}}'),
(927, 'TRX8081474-220802124553', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}}'),
(928, 'TRX4635335-220802123059', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Marie Gold\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:10:\"Super Star\";}}'),
(929, 'TRX3646542-220802113651', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:9:\"Ice Choco\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(930, 'TRX5434941-220802113212', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:20000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:12:\"Caramel Frap\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(931, 'TRX5653129-220802104307', 'a:1:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:7:\"Basreng\";}}'),
(932, 'TRX6547997-220802103217', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:6:\"Cimory\";}}'),
(933, 'TRX6132975-220802101824', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:11:\"Hot Spanish\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Iced Vanilla Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(934, 'TRX7626350-220802100904', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:16:\"Roma Sari Gandum\";}}'),
(935, 'TRX6655245-220802100308', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(936, 'TRX6755644-220802094444', 'a:1:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:14:\"Hot / Ice Milk\";}}'),
(937, 'TRX8146718-220802093427', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:9:\"Ice Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Ice Hazelnut Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Hot / Ice Milk\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}}'),
(938, 'TRX5980623-220802092406', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:12:\"Coffee Latte\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}'),
(939, 'TRX5729566-220801034722', 'a:1:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:30000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}}');
INSERT INTO `tb_belanja` (`id`, `no_trax`, `atribut`) VALUES
(940, 'TRX4102131-220801033514', 'a:3:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:24000;s:9:\"nm_barang\";s:9:\"Cappucino\";}i:2;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:75000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}}'),
(941, 'TRX1516343-220801022940', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:20000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:1000;s:9:\"nm_barang\";s:9:\"Ciki 1000\";}}'),
(942, 'TRX2536265-220801015905', 'a:4:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:8:\"fruittea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:2;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 1000\";}i:3;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:6:\"Kripca\";}}'),
(943, 'TRX2949436-220801123456', 'a:4:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:8:\"fruittea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:5:\"Kalpa\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:4000;s:9:\"nm_barang\";s:7:\"Apetito\";}}'),
(944, 'TRX960146-220801123129', 'a:1:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}}'),
(945, 'TRX1889912-220801121846', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(946, 'TRX2275868-220801120510', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:21:\"Ice / Hot Coffee Aren\";}}'),
(947, 'TRX5865846-220801113530', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}i:1;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1500;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:11:\"Softex 39cm\";}}'),
(948, 'TRX263647-220801110609', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:18:\"Espresso Americano\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:7:\"Kulpang\";}}'),
(949, 'TRX5774449-220801110228', 'a:4:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:4;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:9:\"Ciki 2000\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:7:\"Apetito\";}i:3;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:1000;s:9:\"sub_total\";i:2000;s:9:\"nm_barang\";s:6:\"Permen\";}}'),
(950, 'TRX6516988-220801104408', 'a:2:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:18:\"Espresso Americano\";}}'),
(951, 'TRX1392305-220801104154', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12000;s:9:\"sub_total\";i:12000;s:9:\"nm_barang\";s:18:\"Espresso Americano\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:3000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(952, 'TRX4216904-220801103607', 'a:1:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:17:\"Ice Spanish Latte\";}}'),
(953, 'TRX9475221-220801093529', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:20:\"Teh Botol Kaca 220ml\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}}'),
(954, 'TRX3185618-220801084206', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:6000;s:9:\"nm_barang\";s:5:\"Prima\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:13000;s:9:\"nm_barang\";s:8:\"Sandwich\";}}'),
(955, 'TRX9897117-220803020024', 'a:2:{i:0;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000;s:9:\"sub_total\";i:7000;s:9:\"nm_barang\";s:20:\"Pulpen Joyko 4 warna\";}}'),
(956, 'TRX6666826-220803024824', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(957, 'TRX463639-220803024709', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(958, 'TRX9703577-220803030528', 'a:2:{i:0;a:4:{s:3:\"qty\";i:2;s:5:\"harga\";i:13000;s:9:\"sub_total\";i:26000;s:9:\"nm_barang\";s:8:\"Sandwich\";}i:1;a:4:{s:3:\"qty\";i:3;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:45000;s:9:\"nm_barang\";s:21:\"Ice / Hot Coffee Aren\";}}'),
(959, 'TRX2721515-220803025746', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Ice tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:10000;s:9:\"nm_barang\";s:14:\"Kentang Goreng\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(960, 'TRX9070664-220803035827', 'a:1:{i:0;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:3000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:5:\"Prima\";}}'),
(961, 'TRX7089817-220803035635', 'a:1:{i:0;a:4:{s:3:\"qty\";i:8;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:120000;s:9:\"nm_barang\";s:23:\"Caramel Macchiato Latte\";}}'),
(962, 'TRX1216228-220804013628', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(963, 'TRX4691403-220804012927', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(964, 'TRX2032821-220804012744', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(965, 'TRX6863319-220804012519', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(966, 'TRX6689994-220804012426', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(967, 'TRX3980563-220804012133', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(968, 'TRX5608542-220804012048', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(969, 'TRX6447709-220804011651', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(970, 'TRX4447203-220804011425', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(971, 'TRX550420-220804115445', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(972, 'TRX6783695-220804115234', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(973, 'TRX3059514-220804114915', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(974, 'TRX8822577-220804114649', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(975, 'TRX3869525-220804114441', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(976, 'TRX7843128-220804114314', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(977, 'TRX5364182-220804113910', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(978, 'TRX7925546-220804113702', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(979, 'TRX4465012-220804113332', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(980, 'TRX5398204-220804113231', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(981, 'TRX1532919-220804112745', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(982, 'TRX1226081-220804112612', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(983, 'TRX274662-220804112347', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(984, 'TRX2768463-220804112232', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(985, 'TRX5597149-220804112041', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:500000;s:9:\"sub_total\";i:500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(986, 'TRX9579259-220804111808', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(987, 'TRX9841449-220804111448', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(988, 'TRX640219-220804111308', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(989, 'TRX2904530-220804111158', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(990, 'TRX7311536-220804110554', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(991, 'TRX1503991-220804110504', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(992, 'TRX9496961-220804110017', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(993, 'TRX975113-220804105854', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(994, 'TRX3833964-220804105543', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(995, 'TRX2953692-220804105312', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(996, 'TRX3208526-220804104951', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(997, 'TRX3796757-220804104806', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(998, 'TRX738421-220804104523', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(999, 'TRX4610158-220804104435', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1000, 'TRX5820734-220804104252', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1000000;s:9:\"sub_total\";i:1000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1001, 'TRX1487496-220804104138', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1002, 'TRX2253879-220804103832', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1003, 'TRX8270832-220804103639', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1004, 'TRX9747703-220804103258', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1005, 'TRX2064831-220804103204', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1006, 'TRX465184-220804102922', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1007, 'TRX7961140-220804102715', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1008, 'TRX1980314-220804102516', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1009, 'TRX1738169-220804102405', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1010, 'TRX5368032-220804102123', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000000;s:9:\"sub_total\";i:4000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1011, 'TRX2630693-220804101943', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1012, 'TRX1121201-220804101738', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1013, 'TRX8641380-220804101539', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1014, 'TRX276916-220804101228', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1015, 'TRX8405446-220804101014', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1016, 'TRX7477072-220804100556', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000000;s:9:\"sub_total\";i:7000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1017, 'TRX1288960-220804100353', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1018, 'TRX4699220-220804095641', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1019, 'TRX2148139-220804095521', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1020, 'TRX2616493-220804093706', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500000;s:9:\"sub_total\";i:2500000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1021, 'TRX2953370-220804093413', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:4000000;s:9:\"sub_total\";i:4000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1022, 'TRX8830528-220804093221', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1023, 'TRX6177128-220804091417', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1024, 'TRX121402-220804091306', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1025, 'TRX6918822-220804090931', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1026, 'TRX8945030-220804090836', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1027, 'TRX6208037-220804090456', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:7000000;s:9:\"sub_total\";i:7000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1028, 'TRX5914005-220804090349', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1029, 'TRX5724591-220804022955', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1030, 'TRX3558343-220804022216', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:6000000;s:9:\"sub_total\";i:6000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1031, 'TRX4539906-220804021934', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1032, 'TRX2329802-220804021542', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1033, 'TRX1245341-220804021331', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1034, 'TRX5965750-220804021056', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000;s:9:\"sub_total\";i:5000;s:9:\"nm_barang\";s:7:\"Hot Tea\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:18:\"Iced Vanilla Latte\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:8000;s:9:\"sub_total\";i:8000;s:9:\"nm_barang\";s:15:\"Makaroni Besar \";}}'),
(1035, 'TRX9545727-220804020930', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1036, 'TRX4705798-220804020546', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1200000;s:9:\"sub_total\";i:1200000;s:9:\"nm_barang\";s:6:\"IOM D3\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1037, 'TRX1469821-220804013834', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1038, 'TRX424669-220804024031', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:5000000;s:9:\"sub_total\";i:5000000;s:9:\"nm_barang\";s:14:\"UKT Semester 1\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1039, 'TRX5079140-220804023845', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:1600000;s:9:\"sub_total\";i:1600000;s:9:\"nm_barang\";s:6:\"IOM D4\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:12500;s:9:\"sub_total\";i:12500;s:9:\"nm_barang\";s:14:\"Admin Koperasi\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:2500;s:9:\"sub_total\";i:2500;s:9:\"nm_barang\";s:10:\"Admin Bank\";}}'),
(1040, 'TRX6034426-220804033134', 'a:2:{i:0;a:4:{s:3:\"qty\";i:9;s:5:\"harga\";i:10000;s:9:\"sub_total\";i:90000;s:9:\"nm_barang\";s:15:\"Ice Coffee milk\";}i:1;a:4:{s:3:\"qty\";i:5;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:75000;s:9:\"nm_barang\";s:17:\"Ice Caramel Latte\";}}'),
(1041, 'TRX3800394-220804035638', 'a:3:{i:0;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:18000;s:9:\"sub_total\";i:18000;s:9:\"nm_barang\";s:9:\"Oreo Frap\";}i:1;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:13:\"Ice Cappucino\";}i:2;a:4:{s:3:\"qty\";i:1;s:5:\"harga\";i:15000;s:9:\"sub_total\";i:15000;s:9:\"nm_barang\";s:19:\"Ice / Hot Susu Aren\";}}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_poin_dipakai`
--

CREATE TABLE `tb_poin_dipakai` (
  `id` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `id_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_poin_dipakai`
--

INSERT INTO `tb_poin_dipakai` (`id`, `poin`, `id_user`) VALUES
(10, 22, 'adieb nabhan alhuba 0042073375'),
(11, 1, 'lulu dwi apriyani 0048778942'),
(12, 0, 'rizky saputra 0038573165');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_poin_fandi`
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
-- Dumping data untuk tabel `tb_poin_fandi`
--

INSERT INTO `tb_poin_fandi` (`id_poin`, `jumlah_poin`, `id_transaksi`, `tanggal_poin`, `id_user`, `nominal`, `status`, `custmer_partner_name`) VALUES
(1109, 251, 'TRX7019340-220801024216', '2022-08-01', 'adieb nabhan alhuba 0042073375', 2515000, 'aktif', 'kopkar polindra'),
(1110, 161, 'TRX1155433-220801024018', '2022-08-01', 'adieb nabhan alhuba 0042073375', 1615000, 'aktif', 'kopkar polindra'),
(1111, 501, 'TRX3964733-220801023500', '2022-08-01', 'lulu dwi apriyani 0048778942', 5015000, 'hapus', 'kopkar polindra'),
(1112, 121, 'TRX5372728-220801023419', '2022-08-01', 'lulu dwi apriyani 0048778942', 1215000, 'aktif', 'kopkar polindra'),
(1113, 501, 'TRX2377885-220801015420', '2022-08-01', 'rizky saputra 0038573165', 5015000, 'aktif', 'kopkar polindra'),
(1114, 161, 'TRX392508-220801015112', '2022-08-01', 'rizky saputra 0038573165', 1615000, 'aktif', 'kopkar polindra'),
(1115, 501, 'TRX6651664-220801014705', '2022-08-01', 'imelia putri juliana 0043890364', 5015000, 'aktif', 'kopkar polindra'),
(1116, 121, 'TRX9862065-220801014550', '2022-08-01', 'imelia putri juliana 0043890364', 1215000, 'aktif', 'kopkar polindra'),
(1117, 501, 'TRX2407902-220801013545', '2022-08-01', 'rindu regytta surya m 0041084600', 5015000, 'aktif', 'kopkar polindra'),
(1118, 121, 'TRX8084090-220801013417', '2022-08-01', 'rindu regytta surya m 0041084600', 1215000, 'aktif', 'kopkar polindra'),
(1119, 501, 'TRX2693361-220801013033', '2022-08-01', 'henry abeliano 0049328627', 5015000, 'aktif', 'kopkar polindra'),
(1120, 121, 'TRX1537508-220801012910', '2022-08-01', 'henry abeliano 0049328627', 1215000, 'aktif', 'kopkar polindra'),
(1121, 501, 'TRX3531577-220801011829', '2022-08-01', 'yanandra nova aurelia 0025903510', 5015000, 'aktif', 'kopkar polindra'),
(1122, 121, 'TRX6665723-220801011705', '2022-08-01', 'yanandra nova aurelia 0025903510', 1215000, 'aktif', 'kopkar polindra'),
(1123, 501, 'TRX9004113-220801105723', '2022-08-01', 'syarif hidayat 0046039209', 5015000, 'aktif', 'kopkar polindra'),
(1124, 121, 'TRX2186457-220801105533', '2022-08-01', 'syarif hidayat 0046039209', 1215000, 'aktif', 'kopkar polindra'),
(1125, 501, 'TRX2089464-220801104845', '2022-08-01', 'hanifan haqin 0042775871', 5015000, 'aktif', 'kopkar polindra'),
(1126, 51, 'TRX9029932-220801104505', '2022-08-01', 'sutra irawan 0031391101', 515000, 'aktif', 'kopkar polindra'),
(1127, 121, 'TRX3871425-220801104314', '2022-08-01', 'sutra irawan 0031391101', 1215000, 'aktif', 'kopkar polindra'),
(1128, 121, 'TRX9344169-220801103818', '2022-08-01', 'indah khilyatun 0044974382', 1215000, 'aktif', 'kopkar polindra'),
(1129, 501, 'TRX1523364-220801101655', '2022-08-01', 'dimas maulana fazri 2102090', 5015000, 'aktif', 'kopkar polindra'),
(1130, 601, 'TRX3665649-220801101401', '2022-08-01', 'nisa yasyifa dinna 0043870581', 6015000, 'aktif', 'kopkar polindra'),
(1131, 121, 'TRX1063809-220801101214', '2022-08-01', 'nisa yasyifa dinna 0043870581', 1215000, 'aktif', 'kopkar polindra'),
(1132, 601, 'TRX5287702-220801100237', '2022-08-01', 'anisa nur fadhilah 0049993484', 6015000, 'aktif', 'kopkar polindra'),
(1133, 121, 'TRX7676780-220801100054', '2022-08-01', 'anisa nur fadhilah 0049993484', 1215000, 'aktif', 'kopkar polindra'),
(1134, 101, 'TRX3308244-220801095816', '2022-08-01', 'krisna bayu pamungkas 0043991957', 1015000, 'aktif', 'kopkar polindra'),
(1135, 121, 'TRX7317021-220801095656', '2022-08-01', 'krisna bayu pamungkas 0043991957', 1215000, 'aktif', 'kopkar polindra'),
(1136, 101, 'TRX6913426-220801095515', '2022-08-01', 'maulana shahizidane 0025415491', 1015000, 'aktif', 'kopkar polindra'),
(1137, 121, 'TRX528291-220801095247', '2022-08-01', 'maulana shahizidane 0025415491', 1215000, 'aktif', 'kopkar polindra'),
(1138, 251, 'TRX8253605-220801094349', '2022-08-01', 'ferli septiana 0042751753', 2515000, 'aktif', 'kopkar polindra'),
(1139, 161, 'TRX5740189-220801094243', '2022-08-01', 'ferli septiana 0042751753', 1615000, 'aktif', 'kopkar polindra'),
(1140, 251, 'TRX4315344-220801093753', '2022-08-01', 'nicho ray ramadhan 0038133889', 2515000, 'aktif', 'kopkar polindra'),
(1141, 161, 'TRX4448777-220801093457', '2022-08-01', 'nicho ray ramadhan 0038133889', 1615000, 'aktif', 'kopkar polindra'),
(1142, 101, 'TRX7953486-220801091356', '2022-08-01', 'yuda andika 0040216780', 1015000, 'aktif', 'kopkar polindra'),
(1143, 121, 'TRX6861299-220801091230', '2022-08-01', 'yuda andika 0040216780', 1215000, 'aktif', 'kopkar polindra'),
(1144, 101, 'TRX8879877-220801091037', '2022-08-01', 'm. abdullah ilham 0058833747', 1015000, 'aktif', 'kopkar polindra'),
(1145, 121, 'TRX7884060-220801090928', '2022-08-01', 'm. abdullah ilham 0058833747', 1215000, 'aktif', 'kopkar polindra'),
(1146, 501, 'TRX8456252-220801090641', '2022-08-01', 'fajar renaldi 0058397428', 5015000, 'aktif', 'kopkar polindra'),
(1147, 121, 'TRX6212944-220801090459', '2022-08-01', 'fajar renaldi 0058397428', 1215000, 'aktif', 'kopkar polindra'),
(1148, 501, 'TRX357066-220801090016', '2022-08-01', 'ihab syahrul hafiz 0049465341', 5015000, 'aktif', 'kopkar polindra'),
(1149, 161, 'TRX7126138-220801085733', '2022-08-01', 'ihab syahrul hafiz 0049465341', 1615000, 'aktif', 'kopkar polindra'),
(1150, 101, 'TRX3399282-220802024529', '2022-08-02', 'farhan febrianto 0033264240', 1015000, 'aktif', 'kopkar polindra'),
(1151, 121, 'TRX4785813-220802024450', '2022-08-02', 'farhan febrianto 0033264240', 1215000, 'aktif', 'kopkar polindra'),
(1152, 121, 'TRX326378-220802024104', '2022-08-02', 'fathirrahman rizky kusuma p 0045830196', 1215000, 'aktif', 'kopkar polindra'),
(1153, 101, 'TRX6258731-220802023640', '2022-08-02', 'dede noval 0037692098', 1015000, 'aktif', 'kopkar polindra'),
(1154, 161, 'TRX475684-220802023434', '2022-08-02', 'dede noval 0037692098', 1615000, 'aktif', 'kopkar polindra'),
(1155, 501, 'TRX8664375-220802020040', '2022-08-02', 'muhammad faiz 0042071984', 5015000, 'aktif', 'kopkar polindra'),
(1156, 51, 'TRX3007460-220802010841', '2022-08-02', 'david fathul hidayat 0012408334', 515000, 'aktif', 'kopkar polindra'),
(1157, 121, 'TRX4092962-220802010625', '2022-08-02', 'david fathul hidayat 0012408334', 1215000, 'aktif', 'kopkar polindra'),
(1158, 7, 'TRX751417-220802121454', '2022-08-02', 'pak fikri', 75000, 'aktif', 'kopkar polindra'),
(1159, 601, 'TRX3380614-220802111052', '2022-08-02', 'muhammad faiz 0042071984', 6015000, 'aktif', 'kopkar polindra'),
(1160, 121, 'TRX1454677-220802110916', '2022-08-02', 'muhammad faiz 0042071984', 1215000, 'aktif', 'kopkar polindra'),
(1161, 101, 'TRX1067083-220802101202', '2022-08-02', 'dicky ardillah 0044267938', 1015000, 'aktif', 'kopkar polindra'),
(1162, 121, 'TRX9915436-220802101017', '2022-08-02', 'dicky ardillah 0044267938', 1215000, 'aktif', 'kopkar polindra'),
(1163, 501, 'TRX25848-220802100705', '2022-08-02', 'rifky fauzan 0037751954', 5015000, 'aktif', 'kopkar polindra'),
(1164, 121, 'TRX7257210-220802100423', '2022-08-02', 'rifky fauzan 0037751954', 1215000, 'aktif', 'kopkar polindra'),
(1165, 601, 'TRX7387714-220802095831', '2022-08-02', 'aji satria 0049268970', 6015000, 'aktif', 'kopkar polindra'),
(1166, 121, 'TRX9217447-220802095547', '2022-08-02', 'aji satria 0049268970', 1215000, 'aktif', 'kopkar polindra'),
(1167, 501, 'TRX7424507-220802094223', '2022-08-02', 'rayya nandita utomo 0041967897', 5015000, 'aktif', 'kopkar polindra'),
(1168, 121, 'TRX6359366-220802094105', '2022-08-02', 'rayya nandita utomo 0041967897', 1215000, 'aktif', 'kopkar polindra'),
(1169, 501, 'TRX7875752-220802093748', '2022-08-02', 'khaerunisa 0047761738', 5015000, 'aktif', 'kopkar polindra'),
(1170, 121, 'TRX262647-220802093555', '2022-08-02', 'khaerunisa 0047761738', 1215000, 'aktif', 'kopkar polindra'),
(1171, 101, 'TRX8659109-220802093206', '2022-08-02', 'rafi ramadhan syahrin 0036793094', 1015000, 'aktif', 'kopkar polindra'),
(1172, 161, 'TRX710918-220802093003', '2022-08-02', 'rafi ramadhan syahrin 0036793094', 1615000, 'aktif', 'kopkar polindra'),
(1173, 501, 'TRX7403998-220802091719', '2022-08-02', 'inti mulyati 0043862235', 5015000, 'aktif', 'kopkar polindra'),
(1174, 121, 'TRX1391992-220802091513', '2022-08-02', 'inti mulyati 0043862235', 1215000, 'aktif', 'kopkar polindra'),
(1175, 501, 'TRX1284195-220802091122', '2022-08-02', 'fadilah nurfajri 0049786335', 5015000, 'aktif', 'kopkar polindra'),
(1176, 121, 'TRX7225326-220802090937', '2022-08-02', 'fadilah nurfajri 0049786335', 1215000, 'aktif', 'kopkar polindra'),
(1177, 1, 'TRX5023987-220802032417', '2022-08-02', 'pak yani', 13000, 'aktif', 'kopkar polindra'),
(1178, 501, 'TRX2276701-220802034929', '2022-08-02', 'm. fathurraihan saputra 0042120594', 5015000, 'aktif', 'kopkar polindra'),
(1179, 161, 'TRX6227006-220802034806', '2022-08-02', 'm. fathurraihan saputra 0042120594', 1615000, 'aktif', 'kopkar polindra'),
(1180, 501, 'TRX1725203-220803012730', '2022-08-03', 'aditya dwi prayepta 0038944971', 5015000, 'aktif', 'kopkar polindra'),
(1181, 121, 'TRX3202232-220803012549', '2022-08-03', 'aditya dwi prayepta 0038944971', 1215000, 'aktif', 'kopkar polindra'),
(1182, 501, 'TRX4773534-220803011652', '2022-08-03', 'wahyu ramadhan 0032665021', 5015000, 'aktif', 'kopkar polindra'),
(1183, 121, 'TRX1304956-220803010923', '2022-08-03', 'wahyu ramadhan 0032665021', 1215000, 'aktif', 'kopkar polindra'),
(1184, 501, 'TRX8580519-220803115635', '2022-08-03', 'm. syamsul arifin 0036246979', 5015000, 'aktif', 'kopkar polindra'),
(1185, 121, 'TRX6241876-220803115419', '2022-08-03', 'm. syamsul arifin 0036246979', 1215000, 'aktif', 'kopkar polindra'),
(1186, 501, 'TRX9001166-220803114811', '2022-08-03', 'aristo yudho pradana 0045513009', 5015000, 'aktif', 'kopkar polindra'),
(1187, 121, 'TRX2179129-220803114650', '2022-08-03', 'aristo yudho pradana 0045513009', 1215000, 'aktif', 'kopkar polindra'),
(1188, 501, 'TRX4530052-220803113803', '2022-08-03', 'ilham maulana 3037702574', 5015000, 'aktif', 'kopkar polindra'),
(1189, 121, 'TRX1734871-220803113544', '2022-08-03', 'ilham maulana 3037702574', 1215000, 'aktif', 'kopkar polindra'),
(1190, 2, 'TRX4077146-220803103957', '2022-08-03', 'pak fikri', 25000, 'aktif', 'kopkar polindra'),
(1191, 601, 'TRX6799401-220803103714', '2022-08-03', 'siti nuralisah 0033222675', 6015000, 'aktif', 'kopkar polindra'),
(1192, 121, 'TRX2131191-220803103530', '2022-08-03', 'siti nuralisah 0033222675', 1215000, 'aktif', 'kopkar polindra'),
(1193, 501, 'TRX5606453-220803093445', '2022-08-03', 'riska nur alfiyah 0048397350', 5015000, 'aktif', 'kopkar polindra'),
(1194, 121, 'TRX5436547-220803093236', '2022-08-03', 'riska nur alfiyah 0048397350', 1215000, 'aktif', 'kopkar polindra'),
(1195, 501, 'TRX2943090-220803092614', '2022-08-03', 'deden fazriani 0036557880', 5015000, 'aktif', 'kopkar polindra'),
(1196, 121, 'TRX1552563-220803092503', '2022-08-03', 'deden fazriani 0036557880', 1215000, 'aktif', 'kopkar polindra'),
(1197, 401, 'TRX3756829-220803092058', '2022-08-03', 'amelia dinda dinanti 0044693325', 4015000, 'aktif', 'kopkar polindra'),
(1198, 121, 'TRX7057366-220803091806', '2022-08-03', 'amelia dinda dinanti 0044693325', 1215000, 'aktif', 'kopkar polindra'),
(1199, 501, 'TRX1791979-220803091433', '2022-08-03', 'achmad khoirul umar 0022992692', 5015000, 'aktif', 'kopkar polindra'),
(1200, 121, 'TRX7003057-220803091305', '2022-08-03', 'achmad khoirul umar 0022992692', 1215000, 'aktif', 'kopkar polindra'),
(1201, 701, 'TRX3903895-220803090916', '2022-08-03', 'm. nuzul ramadhan 0041664993', 7015000, 'aktif', 'kopkar polindra'),
(1202, 121, 'TRX337848-220803090653', '2022-08-03', 'm. nuzul ramadhan 0041664993', 1215000, 'aktif', 'kopkar polindra'),
(1203, 501, 'TRX8590279-220803015116', '2022-08-03', 'kopkar polindra', 5015000, 'aktif', NULL),
(1204, 623, 'TRX2385251-220803014909', '2022-08-03', 'kopkar polindra', 1215000, 'aktif', NULL),
(1205, 626, 'TRX2535335-220803014721', '2022-08-03', 'kopkar polindra', 30000, 'aktif', NULL),
(1206, 1127, 'TRX601233-220803013538', '2022-08-03', 'kopkar polindra', 5015000, 'aktif', NULL),
(1207, 1249, 'TRX7705542-220803013302', '2022-08-03', 'kopkar polindra', 1215000, 'aktif', NULL),
(1208, 1252, 'TRX1422350-220803012143', '2022-08-03', 'kopkar polindra', 32000, 'aktif', NULL),
(1209, 1253, 'TRX7158086-220803125554', '2022-08-03', 'kopkar polindra', 14000, 'aktif', NULL),
(1210, 1256, 'TRX6378741-220803124727', '2022-08-03', 'kopkar polindra', 30000, 'aktif', NULL),
(1211, 1257, 'TRX3711945-220803124606', '2022-08-03', 'kopkar polindra', 12000, 'aktif', NULL),
(1212, 1259, 'TRX30919-220803124514', '2022-08-03', 'kopkar polindra', 12000, 'aktif', NULL),
(1213, 1261, 'TRX5959070-220803124108', '2022-08-03', 'kopkar polindra', 22000, 'aktif', NULL),
(1214, 1266, 'TRX6796050-220803121123', '2022-08-03', 'kopkar polindra', 48000, 'aktif', NULL),
(1215, 1268, 'TRX4391972-220803112904', '2022-08-03', 'kopkar polindra', 20000, 'aktif', NULL),
(1216, 1269, 'TRX2520742-220803110453', '2022-08-03', 'kopkar polindra', 18000, 'aktif', NULL),
(1217, 1271, 'TRX761449-220803105657', '2022-08-03', 'kopkar polindra', 15000, 'aktif', NULL),
(1218, 1273, 'TRX7267488-220803105003', '2022-08-03', 'kopkar polindra', 22000, 'aktif', NULL),
(1219, 1277, 'TRX3989851-220803103919', '2022-08-03', 'kopkar polindra', 36000, 'aktif', NULL),
(1220, 1278, 'TRX5503322-220803103857', '2022-08-03', 'kopkar polindra', 12000, 'aktif', NULL),
(1221, 1279, 'TRX3904429-220803103319', '2022-08-03', 'kopkar polindra', 15000, 'aktif', NULL),
(1222, 1281, 'TRX241974-220803095056', '2022-08-03', 'kopkar polindra', 12000, 'aktif', NULL),
(1223, 1283, 'TRX4347526-220803094304', '2022-08-03', 'kopkar polindra', 20000, 'aktif', NULL),
(1224, 1285, 'TRX2345438-220803085756', '2022-08-03', 'kopkar polindra', 21000, 'aktif', NULL),
(1225, 1, 'TRX5701878-220802040114', '2022-08-02', 'kopkar polindra', 15000, 'aktif', NULL),
(1226, 163, 'TRX6258241-220802015847', '2022-08-02', 'kopkar polindra', 1615000, 'aktif', NULL),
(1227, 167, 'TRX1246377-220802034141', '2022-08-02', 'kopkar polindra', 40000, 'aktif', NULL),
(1228, 168, 'TRX5883923-220802033343', '2022-08-02', 'kopkar polindra', 12000, 'aktif', NULL),
(1229, 169, 'TRX114867-220802031808', '2022-08-02', 'kopkar polindra', 14000, 'aktif', NULL),
(1230, 171, 'TRX8231325-220802025740', '2022-08-02', 'kopkar polindra', 15000, 'aktif', NULL),
(1231, 178, 'TRX8042786-220802025103', '2022-08-02', 'kopkar polindra', 72000, 'aktif', NULL),
(1232, 180, 'TRX8403534-220802021438', '2022-08-02', 'kopkar polindra', 17000, 'aktif', NULL),
(1233, 181, 'TRX8860694-220802125005', '2022-08-02', 'kopkar polindra', 19000, 'aktif', NULL),
(1234, 184, 'TRX8081474-220802124553', '2022-08-02', 'kopkar polindra', 28000, 'aktif', NULL),
(1235, 185, 'TRX4635335-220802123059', '2022-08-02', 'kopkar polindra', 11000, 'aktif', NULL),
(1236, 188, 'TRX3646542-220802113651', '2022-08-02', 'kopkar polindra', 23000, 'aktif', NULL),
(1237, 190, 'TRX5434941-220802113212', '2022-08-02', 'kopkar polindra', 25000, 'aktif', NULL),
(1238, 192, 'TRX5653129-220802104307', '2022-08-02', 'kopkar polindra', 20000, 'aktif', NULL),
(1239, 194, 'TRX6547997-220802103217', '2022-08-02', 'kopkar polindra', 15000, 'aktif', NULL),
(1240, 198, 'TRX6132975-220802101824', '2022-08-02', 'kopkar polindra', 40000, 'aktif', NULL),
(1241, 200, 'TRX7626350-220802100904', '2022-08-02', 'kopkar polindra', 20000, 'aktif', NULL),
(1242, 202, 'TRX6655245-220802100308', '2022-08-02', 'kopkar polindra', 25000, 'aktif', NULL),
(1243, 205, 'TRX6755644-220802094444', '2022-08-02', 'kopkar polindra', 30000, 'aktif', NULL),
(1244, 211, 'TRX8146718-220802093427', '2022-08-02', 'kopkar polindra', 55000, 'aktif', NULL),
(1245, 213, 'TRX5980623-220802092406', '2022-08-02', 'kopkar polindra', 22000, 'aktif', NULL),
(1246, 3, 'TRX5729566-220801034722', '2022-08-01', 'kopkar polindra', 30000, 'aktif', NULL),
(1247, 17, 'TRX4102131-220801033514', '2022-08-01', 'kopkar polindra', 144000, 'aktif', NULL),
(1248, 21, 'TRX1516343-220801022940', '2022-08-01', 'kopkar polindra', 39000, 'aktif', NULL),
(1249, 23, 'TRX2536265-220801015905', '2022-08-01', 'kopkar polindra', 26000, 'aktif', NULL),
(1250, 26, 'TRX2949436-220801123456', '2022-08-01', 'kopkar polindra', 23000, 'aktif', NULL),
(1251, 30, 'TRX960146-220801123129', '2022-08-01', 'kopkar polindra', 45000, 'aktif', NULL),
(1252, 32, 'TRX1889912-220801121846', '2022-08-01', 'kopkar polindra', 21000, 'aktif', NULL),
(1253, 35, 'TRX2275868-220801120510', '2022-08-01', 'kopkar polindra', 25000, 'aktif', NULL),
(1254, 37, 'TRX5865846-220801113530', '2022-08-01', 'kopkar polindra', 18000, 'aktif', NULL),
(1255, 39, 'TRX263647-220801110609', '2022-08-01', 'kopkar polindra', 22000, 'aktif', NULL),
(1256, 40, 'TRX5774449-220801110228', '2022-08-01', 'kopkar polindra', 15000, 'aktif', NULL),
(1257, 43, 'TRX6516988-220801104408', '2022-08-01', 'kopkar polindra', 22000, 'aktif', NULL),
(1258, 45, 'TRX1392305-220801104154', '2022-08-01', 'kopkar polindra', 25000, 'aktif', NULL),
(1259, 47, 'TRX4216904-220801103607', '2022-08-01', 'kopkar polindra', 15000, 'aktif', NULL),
(1260, 48, 'TRX9475221-220801093529', '2022-08-01', 'kopkar polindra', 15000, 'aktif', NULL),
(1261, 50, 'TRX3185618-220801084206', '2022-08-01', 'kopkar polindra', 19000, 'aktif', NULL),
(1262, 0, 'TRX9897117-220803020024', '2022-08-03', 'pak yani', 52000, 'aktif', 'kopkar polindra'),
(1263, 23908, 'TRX6666826-220803024824', '2022-08-03', 'adeni 0046467081', 5015000, 'aktif', 'kopkar polindra'),
(1264, 24288, 'TRX463639-220803024709', '2022-08-03', 'adeni 0046467081', 1215000, 'aktif', 'kopkar polindra'),
(1265, 24402, 'TRX9703577-220803030528', '2022-08-03', 'pak omet', 71000, 'aktif', 'kopkar polindra'),
(1266, 24407, 'TRX2721515-220803025746', '2022-08-03', 'bu munengsih', 23000, 'aktif', 'kopkar polindra'),
(1267, 0, 'TRX9070664-220803035827', '2022-08-03', 'pak lubis', 15000, 'aktif', 'kopkar polindra'),
(1268, 0, 'TRX7089817-220803035635', '2022-08-03', 'pak fikri', 120000, 'aktif', 'kopkar polindra'),
(1269, 121, 'TRX1216228-220804013628', '2022-08-04', 'ahmad sofie m 0047038137', 1215000, 'aktif', 'kopkar polindra'),
(1270, 501, 'TRX4691403-220804012927', '2022-08-04', 'aprila aditia 0043996434', 5015000, 'aktif', 'kopkar polindra'),
(1271, 161, 'TRX2032821-220804012744', '2022-08-04', 'aprila aditia 0043996434', 1615000, 'aktif', 'kopkar polindra'),
(1272, 501, 'TRX6863319-220804012519', '2022-08-04', 'wiza thaher 0043414903', 5015000, 'aktif', 'kopkar polindra'),
(1273, 121, 'TRX6689994-220804012426', '2022-08-04', 'wiza thaher 0043414903', 1215000, 'aktif', 'kopkar polindra'),
(1274, 501, 'TRX3980563-220804012133', '2022-08-04', 'rayya rizieq raharjo 0036538216', 5015000, 'aktif', 'kopkar polindra'),
(1275, 121, 'TRX5608542-220804012048', '2022-08-04', 'rayya rizieq raharjo 0036538216', 1215000, 'aktif', 'kopkar polindra'),
(1276, 501, 'TRX6447709-220804011651', '2022-08-04', 'pandu wiguna putra s 0034403010', 5015000, 'aktif', 'kopkar polindra'),
(1277, 121, 'TRX4447203-220804011425', '2022-08-04', 'pandu wiguna putra s 0034403010', 1215000, 'aktif', 'kopkar polindra'),
(1278, 501, 'TRX550420-220804115445', '2022-08-04', 'm.walid ibrahim 0032189229', 5015000, 'aktif', 'kopkar polindra'),
(1279, 161, 'TRX6783695-220804115234', '2022-08-04', 'm.walid ibrahim 0032189229', 1615000, 'aktif', 'kopkar polindra'),
(1280, 251, 'TRX3059514-220804114915', '2022-08-04', 'alin maulidah 0046593932', 2515000, 'aktif', 'kopkar polindra'),
(1281, 161, 'TRX8822577-220804114649', '2022-08-04', 'alin maulidah 0046593932', 1615000, 'aktif', 'kopkar polindra'),
(1282, 501, 'TRX3869525-220804114441', '2022-08-04', 'dodi dharmawan 0029263030', 5015000, 'aktif', 'kopkar polindra'),
(1283, 161, 'TRX7843128-220804114314', '2022-08-04', 'dodi dharmawan 0029263030', 1615000, 'aktif', 'kopkar polindra'),
(1284, 501, 'TRX5364182-220804113910', '2022-08-04', 'sahidin robi 0037586438', 5015000, 'aktif', 'kopkar polindra'),
(1285, 121, 'TRX7925546-220804113702', '2022-08-04', 'sahidin robi 0037586438', 1215000, 'aktif', 'kopkar polindra'),
(1286, 501, 'TRX4465012-220804113332', '2022-08-04', 'm.taufik hidayat 0027513457', 5015000, 'aktif', 'kopkar polindra'),
(1287, 121, 'TRX5398204-220804113231', '2022-08-04', 'm.taufik hidayat 0027513457', 1215000, 'aktif', 'kopkar polindra'),
(1288, 501, 'TRX1532919-220804112745', '2022-08-04', 'yepi mardelina 0043137186', 5015000, 'aktif', 'kopkar polindra'),
(1289, 121, 'TRX1226081-220804112612', '2022-08-04', 'yepi mardelina 0043137186', 1215000, 'aktif', 'kopkar polindra'),
(1290, 501, 'TRX274662-220804112347', '2022-08-04', 'pipit  fitriani 0056695969', 5015000, 'aktif', 'kopkar polindra'),
(1291, 121, 'TRX2768463-220804112232', '2022-08-04', 'pipit  fitriani 0056695969', 1215000, 'aktif', 'kopkar polindra'),
(1292, 51, 'TRX5597149-220804112041', '2022-08-04', 'linda lois agustin 0057595556', 515000, 'aktif', 'kopkar polindra'),
(1293, 161, 'TRX9579259-220804111808', '2022-08-04', 'linda lois agustin 0057595556', 1615000, 'aktif', 'kopkar polindra'),
(1294, 501, 'TRX9841449-220804111448', '2022-08-04', 'moh. sahrul 0048550820', 5015000, 'aktif', 'kopkar polindra'),
(1295, 121, 'TRX640219-220804111308', '2022-08-04', 'moh. sahrul 0048550820', 1215000, 'aktif', 'kopkar polindra'),
(1296, 161, 'TRX2904530-220804111158', '2022-08-04', 'fadli dwi farid 0033501926', 1615000, 'aktif', 'kopkar polindra'),
(1297, 501, 'TRX7311536-220804110554', '2022-08-04', 'sri sulis tiara wati 0042737467', 5015000, 'aktif', 'kopkar polindra'),
(1298, 121, 'TRX1503991-220804110504', '2022-08-04', 'sri sulis tiara wati 0042737467', 1215000, 'aktif', 'kopkar polindra'),
(1299, 501, 'TRX9496961-220804110017', '2022-08-04', 'rizky saputra 0056053881', 5015000, 'aktif', 'kopkar polindra'),
(1300, 121, 'TRX975113-220804105854', '2022-08-04', 'rizky saputra 0056053881', 1215000, 'aktif', 'kopkar polindra'),
(1301, 501, 'TRX3833964-220804105543', '2022-08-04', 'anna nisai khoiru destian 0029987496', 5015000, 'aktif', 'kopkar polindra'),
(1302, 121, 'TRX2953692-220804105312', '2022-08-04', 'anna nisai khoiru destian 0029987496', 1215000, 'aktif', 'kopkar polindra'),
(1303, 601, 'TRX3208526-220804104951', '2022-08-04', 'ahmad rifa\'i 3045005615', 6015000, 'aktif', 'kopkar polindra'),
(1304, 161, 'TRX3796757-220804104806', '2022-08-04', 'ahmad rifa\'i 3045005615', 1615000, 'aktif', 'kopkar polindra'),
(1305, 501, 'TRX738421-220804104523', '2022-08-04', 'fanji bagja dilaga 0025496930', 5015000, 'aktif', 'kopkar polindra'),
(1306, 121, 'TRX4610158-220804104435', '2022-08-04', 'fanji bagja dilaga 0025496930', 1215000, 'aktif', 'kopkar polindra'),
(1307, 101, 'TRX5820734-220804104252', '2022-08-04', 'rio fadillah 0045674553', 1015000, 'aktif', 'kopkar polindra'),
(1308, 121, 'TRX1487496-220804104138', '2022-08-04', 'rio fadillah 0045674553', 1215000, 'aktif', 'kopkar polindra'),
(1309, 251, 'TRX2253879-220804103832', '2022-08-04', 'maskani 0047978971', 2515000, 'aktif', 'kopkar polindra'),
(1310, 161, 'TRX8270832-220804103639', '2022-08-04', 'maskani 0047978971', 1615000, 'aktif', 'kopkar polindra'),
(1311, 601, 'TRX9747703-220804103258', '2022-08-04', 'dias mumtaza 0044397070', 6015000, 'aktif', 'kopkar polindra'),
(1312, 121, 'TRX2064831-220804103204', '2022-08-04', 'dias mumtaza 0044397070', 1215000, 'aktif', 'kopkar polindra'),
(1313, 501, 'TRX465184-220804102922', '2022-08-04', 'susanti 0041563552', 5015000, 'aktif', 'kopkar polindra'),
(1314, 121, 'TRX7961140-220804102715', '2022-08-04', 'susanti 0041563552', 1215000, 'aktif', 'kopkar polindra'),
(1315, 501, 'TRX1980314-220804102516', '2022-08-04', 'dede candra 0038551609', 5015000, 'aktif', 'kopkar polindra'),
(1316, 121, 'TRX1738169-220804102405', '2022-08-04', 'dede candra 0038551609', 1215000, 'aktif', 'kopkar polindra'),
(1317, 401, 'TRX5368032-220804102123', '2022-08-04', 'sigit setiawan 0049125661', 4015000, 'aktif', 'kopkar polindra'),
(1318, 121, 'TRX2630693-220804101943', '2022-08-04', 'sigit setiawan 0049125661', 1215000, 'aktif', 'kopkar polindra'),
(1319, 501, 'TRX1121201-220804101738', '2022-08-04', 'bima ryan alfarizi 0050531338', 5015000, 'aktif', 'kopkar polindra'),
(1320, 161, 'TRX8641380-220804101539', '2022-08-04', 'bima ryan alfarizi 0050531338', 1615000, 'aktif', 'kopkar polindra'),
(1321, 251, 'TRX276916-220804101228', '2022-08-04', 'm. dadan setiawan 0034141427', 2515000, 'aktif', 'kopkar polindra'),
(1322, 121, 'TRX8405446-220804101014', '2022-08-04', 'm. dadan setiawan 0034141427', 1215000, 'aktif', 'kopkar polindra'),
(1323, 701, 'TRX7477072-220804100556', '2022-08-04', 'dea roslita 0047223357', 7015000, 'aktif', 'kopkar polindra'),
(1324, 121, 'TRX1288960-220804100353', '2022-08-04', 'dea roslita 0047223357', 1215000, 'aktif', 'kopkar polindra'),
(1325, 501, 'TRX4699220-220804095641', '2022-08-04', 'rika febriani 0058339938', 5015000, 'aktif', 'kopkar polindra'),
(1326, 121, 'TRX2148139-220804095521', '2022-08-04', 'rika febriani 0058339938', 1215000, 'aktif', 'kopkar polindra'),
(1327, 251, 'TRX2616493-220804093706', '2022-08-04', 'rendi hidayat 0033328824', 2515000, 'aktif', 'kopkar polindra'),
(1328, 401, 'TRX2953370-220804093413', '2022-08-04', 'thomas ikballah 0044070943', 4015000, 'aktif', 'kopkar polindra'),
(1329, 121, 'TRX8830528-220804093221', '2022-08-04', 'thomas ikballah 0044070943', 1215000, 'aktif', 'kopkar polindra'),
(1330, 501, 'TRX6177128-220804091417', '2022-08-04', 'dwi lika nurkholifa 192010070', 5015000, 'aktif', 'kopkar polindra'),
(1331, 121, 'TRX121402-220804091306', '2022-08-04', 'dwi lika nurkholifa 192010070', 1215000, 'aktif', 'kopkar polindra'),
(1332, 601, 'TRX6918822-220804090931', '2022-08-04', 'evan nurfauzan 0041400450', 6015000, 'aktif', 'kopkar polindra'),
(1333, 161, 'TRX8945030-220804090836', '2022-08-04', 'evan nurfauzan 0041400450', 1615000, 'aktif', 'kopkar polindra'),
(1334, 701, 'TRX6208037-220804090456', '2022-08-04', 'ndaru septian yudha n 0035025979', 7015000, 'aktif', 'kopkar polindra'),
(1335, 161, 'TRX5914005-220804090349', '2022-08-04', 'ndaru septian yudha n 0035025979', 1615000, 'aktif', 'kopkar polindra'),
(1336, 501, 'TRX5724591-220804022955', '2022-08-04', 'm.rifqi maulana 0038699104', 5015000, 'aktif', 'kopkar polindra'),
(1337, 601, 'TRX3558343-220804022216', '2022-08-04', 'arif septiyan 0038147296', 6015000, 'aktif', 'kopkar polindra'),
(1338, 121, 'TRX4539906-220804021934', '2022-08-04', 'arif septiyan 0038147296', 1215000, 'aktif', 'kopkar polindra'),
(1339, 501, 'TRX2329802-220804021542', '2022-08-04', 'rifqiazhari 0031379315', 5015000, 'aktif', 'kopkar polindra'),
(1340, 161, 'TRX1245341-220804021331', '2022-08-04', 'rifqiazhari 0031379315', 1615000, 'aktif', 'kopkar polindra'),
(1341, 2, 'TRX5965750-220804021056', '2022-08-04', 'pa rofan', 28000, 'aktif', 'kopkar polindra'),
(1342, 501, 'TRX9545727-220804020930', '2022-08-04', 'anggi sugilan 0045034275', 5015000, 'aktif', 'kopkar polindra'),
(1343, 121, 'TRX4705798-220804020546', '2022-08-04', 'anggi sugilan 0045034275', 1215000, 'aktif', 'kopkar polindra'),
(1344, 501, 'TRX1469821-220804013834', '2022-08-04', 'ahmad sofie m 0047038137', 5015000, 'aktif', 'kopkar polindra'),
(1345, 501, 'TRX424669-220804024031', '2022-08-04', 'salya shelomita c 0043974317', 5015000, 'aktif', 'kopkar polindra'),
(1346, 161, 'TRX5079140-220804023845', '2022-08-04', 'salya shelomita c 0043974317', 1615000, 'aktif', 'kopkar polindra'),
(1347, 16, 'TRX6034426-220804033134', '2022-08-04', 'ibu ririn', 165000, 'aktif', 'kopkar polindra'),
(1348, 4, 'TRX3800394-220804035638', '2022-08-04', 'pak lubis', 48000, 'aktif', 'kopkar polindra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
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
('4d420f1e-d87b-42b2-8ed4-5260944eaa08', '414e5aab-19b7-4bb0-b185-01d0324edc38', 'achmad khoirul umar 0022992692', 'afandi3120@gmail.com', 'afandi', '$2y$10$bG9t6vkWa9v3RLSld0hk9esDi4x2VdVT5NnDMuwFVwFRKbIfurQiG', 'agus afandi', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-08-03', NULL, NULL, '2022-08-03 07:43:00', '2022-08-03 07:43:00'),
('4e03cdd3-e63c-40fa-bdc9-cd2ad74c47df', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903028', 'Uun menari', 'uun', 'kopkar312', 'uun', '08512312672', 'jln. sudirman', 0, '0', 0, '2022-03-20', NULL, NULL, '2022-03-20 15:06:56', '2022-03-20 15:06:56'),
('67452897-42c4-4bb4-8440-3a5eea43cbd3', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'user', 'afandi', 'afandi', '08212211212', 'nganjuk', 0, '1', 1, '2022-02-07', '1', '2022-02-10 11:07:58', '2022-02-06 18:00:51', '2022-02-10 11:07:58'),
('6b2accc5-3620-4592-8fc1-1b51d5dcd467', '414e5aab-19b7-4bb0-b185-01d0324edc38', '12345678', 'ardiansdr@gmail.com', 'user', '12345678', 'ardian', '085422567825', 'indramayu', 0, '1', 0, '2022-06-13', '123456', '2022-06-13 13:10:43', '2022-06-13 13:05:14', '2022-06-13 13:10:43'),
('7e67b353-585d-45f0-8e11-378edbe83c99', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903012', 'assa0@gmail.com', 'afanid', '$2y$10$WzgevrsmP7fNaFBnJxMN5e0jdMaca1Rw/E2FbPgSs1wvOOT8AgdBO', 'Dicki Prastya', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 1, '2022-03-17', '3222222222222222', NULL, '2022-03-17 13:01:27', '2022-03-17 16:31:09'),
('7f7aaaf9-9067-4a13-bbc1-c650a55c3707', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$BAR5C0o5oxw6TgDiOWbT5u1MMUJt7jbFu8h4X2ImNIWVS31ScOr5m', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-03-12', NULL, NULL, '2022-03-11 18:18:30', '2022-03-11 18:18:30'),
('9699e020-6ae6-4e84-aba2-a93937d829be', '414e5aab-19b7-4bb0-b185-01d0324edc38', '1903001', 'adhitya ilham UI', 'adhitya', 'kopkar312', 'adhitya ilham', '089211667472', 'jln. Gempir jombang', 0, '0', 0, '2022-03-21', NULL, NULL, '2022-03-20 17:49:13', '2022-03-20 17:49:13'),
('99282f6c-81ad-4d2b-b2b4-94c6302cd0e8', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '1903020', 'user@gmail.com', 'afandi', 'afandi', 'afandi', '082232187491', 'nganjuk', 0, '1', 1, '2022-02-04', '1', '2022-02-06 18:00:13', '2022-02-04 15:42:16', '2022-02-06 18:00:13'),
('9f8b5824-1735-4bb3-87b2-6945919f737e', '414e5aab-19b7-4bb0-b185-01d0324edc38', 'bu munengsih', 'agus', 'afandi312', '$2y$10$nzpwwdaMuhpZ5bT97tQrUOuBOPLB7OH9uxVUv0YGpr.bCoorWt1fm', 'afandi', '08213213213', 'nganjuk', 0, '1', 0, '2022-08-02', NULL, NULL, '2022-08-01 17:36:15', '2022-08-04 13:14:19'),
('a8667bf8-55e1-473d-94c0-39f32777b79c', '414e5aab-19b7-4bb0-b185-01d0324edc38', 'bu munengsih', 'ardiansdr@gmail.com', 'kopkap', '$2y$10$Jv33WJ4Gxm1wcJe8YnQ2FuRpTtMOEMTxWSgW2eihx4pc9fzvPwpWm', 'kopkar polindra', '098765456876', 'indramayu', 0, '1', 1, '2022-06-13', '12345678', NULL, '2022-06-13 13:11:55', '2022-07-14 15:31:35'),
('b6556cfb-12dc-4c44-9f81-bf9744fe4e78', '414e5aab-19b7-4bb0-b185-01d0324edc38', '2112212', 'afandi3120@gmail.com', 'user@gmail.com', '$2y$10$L8/4vW.RgwS7labWZbjcSuDUBO7Gh4ITiUKxlunUOaW90L8NTLTMe', 'Idang wiguna', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '1', 0, '2022-03-17', '2', NULL, '2022-03-17 13:16:04', '2022-03-17 16:33:39'),
('c80864ee-bc31-4847-9b59-5db60342439c', '414e5aab-19b7-4bb0-b185-01d0324edc38', NULL, 'isall@gmail.com', 'isallaku', 'user123', 'isal isul', '082232187491', 'Ds. Girirejo, Dsn. Pandean, Kec. Bagor, Kab. Nganjuk, Jawa Timur', 0, '0', 0, '2022-03-18', '1', '2022-03-18 02:54:51', '2022-03-18 02:53:52', '2022-03-18 02:54:51'),
('d7181500-943d-4e7a-8d07-68048e3e1560', 'b91a5482-9a2a-4bf6-96ab-7f7f4db65f6c', '12311', 'adminutama@gmail.com', 'adminutama@gmail.com', '12212121', 'afandisa', '08212211212', 'waassasa', 0, '1', 1, '2022-02-09', '42', '2022-03-17 08:12:35', '2022-02-09 11:21:07', '2022-03-17 08:12:35'),
('dfff588e-2d03-4d5f-8861-972c4747080a', '5e5279ee-8275-48a0-bdc3-31953db78e7b', NULL, NULL, 'admin', '$2y$10$8vBwbTf7sy9d/0u5ZUcyu.xxF8Mi4SstbYg1lrZxAvOPtV2TpY9aO', 'Superadmin', '0895334623006', NULL, 0, '1', 0, '2022-02-04', NULL, NULL, '2022-02-04 15:40:11', '2022-02-04 15:40:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wallets`
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
-- Dumping data untuk tabel `wallets`
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
('a2cb49d8-9b93-4c32-8a59-9da5dad969de', '9f8b5824-1735-4bb3-87b2-6945919f737e', '220000', '50000', '220000', '490000', NULL, '2022-08-04 12:36:33', '2022-08-04 13:14:51'),
('ba1eda93-9aca-4c6d-9891-e84a35995798', '049cffac-d31f-4fb1-866b-2fb6f967a7cc', '515444', '0', '0', '515444', '2022-06-10 16:25:28', '2022-03-17 13:42:13', '2022-06-10 16:25:28'),
('bdf7ff9a-6a39-412b-a00a-44a0edbdffe4', '3616550e-5270-4d70-ae2c-c15772f73887', '1800004', '150000', '0', '1950004', '2022-03-17 08:12:46', '2022-02-10 11:15:10', '2022-03-17 08:12:46'),
('c157a4cd-0a48-4ed9-867d-7ca3f8adcfc7', '9699e020-6ae6-4e84-aba2-a93937d829be', '70000', '0', '0', '70000', NULL, '2022-03-20 17:50:12', '2022-03-21 11:06:06'),
('dc25cfc3-ade9-44a5-9c1f-c7bdea53c164', '2edad0bd-6f88-4961-a6af-e6a6f0c53060', '275000', '0', '0', '275000', NULL, '2022-03-17 08:20:43', '2022-03-17 12:59:01'),
('fe9c696f-7a97-481a-96d8-e49f407a3466', 'c80864ee-bc31-4847-9b59-5db60342439c', '22222', '0', '0', '22222', '2022-03-18 02:54:51', '2022-03-18 02:54:17', '2022-03-18 02:54:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `withdraws`
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
-- Struktur dari tabel `yearly_logs`
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
-- Dumping data untuk tabel `yearly_logs`
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
('4d51c612-9901-472d-b254-d9e8611b4ea5', '9f8b5824-1735-4bb3-87b2-6945919f737e', 2022, 220000, 50000, 220000, NULL, '2022-08-04 12:36:33', '2022-08-04 13:14:51'),
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
-- Indeks untuk tabel `config_payments`
--
ALTER TABLE `config_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `main_payments`
--
ALTER TABLE `main_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_payments_user_id_foreign` (`user_id`),
  ADD KEY `main_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monthly_payments_user_id_foreign` (`user_id`),
  ADD KEY `monthly_payments_config_payment_id_foreign` (`config_payment_id`);

--
-- Indeks untuk tabel `other_payments`
--
ALTER TABLE `other_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `other_payments_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_belanja`
--
ALTER TABLE `tb_belanja`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_poin_dipakai`
--
ALTER TABLE `tb_poin_dipakai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `yearly_logs`
--
ALTER TABLE `yearly_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yearly_logs_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_belanja`
--
ALTER TABLE `tb_belanja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

--
-- AUTO_INCREMENT untuk tabel `tb_poin_dipakai`
--
ALTER TABLE `tb_poin_dipakai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_poin_fandi`
--
ALTER TABLE `tb_poin_fandi`
  MODIFY `id_poin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1349;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `monthly_payments`
--
ALTER TABLE `monthly_payments`
  ADD CONSTRAINT `monthly_payments_config_payment_id_foreign` FOREIGN KEY (`config_payment_id`) REFERENCES `config_payments` (`id`),
  ADD CONSTRAINT `monthly_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `other_payments`
--
ALTER TABLE `other_payments`
  ADD CONSTRAINT `other_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
