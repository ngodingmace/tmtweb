-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2023 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtmtx`
--

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
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_resets_table', 1),
(33, '2019_08_19_000000_create_failed_jobs_table', 1),
(34, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(35, '2023_09_13_092540_pemohon', 1);

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
-- Table structure for table `pemohon`
--

CREATE TABLE `pemohon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `tempat_lahir` text NOT NULL,
  `dob` date NOT NULL,
  `area` text NOT NULL,
  `noSC` text NOT NULL,
  `noKTP` text NOT NULL,
  `agency` text NOT NULL,
  `namaAtasan` text NOT NULL,
  `tanggalPengajuan` text NOT NULL,
  `noTelpAtasan` text NOT NULL,
  `position` text NOT NULL,
  `sales_active` text NOT NULL,
  `sales_order` text NOT NULL,
  `nominalPermohonan` text NOT NULL,
  `pencairanTahap1` text NOT NULL,
  `pencairanTahap2` text NOT NULL,
  `totalDiterima` text NOT NULL,
  `signature` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemohon`
--

INSERT INTO `pemohon` (`id`, `name`, `tempat_lahir`, `dob`, `area`, `noSC`, `noKTP`, `agency`, `namaAtasan`, `tanggalPengajuan`, `noTelpAtasan`, `position`, `sales_active`, `sales_order`, `nominalPermohonan`, `pencairanTahap1`, `pencairanTahap2`, `totalDiterima`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'asd', 'Bandung', '2023-10-03', 'Pakistan', '123123112', '2454235', 'Tuermakisan2', 'Kurma', '12-October-2023', '081311900800', 'direct sales', '2', '1', '2000000', 'Rp. 1,000,000', 'Rp. 1,000,000', 'Rp. 1,950,000', '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', '2023-10-12 08:52:49', '2023-10-16 01:16:05'),
(2, 'azxc', 'a', '2023-10-11', 'a', 'a', 'a', 'a2', 'a', '12-October-2023', 'a', 'area supervisor', '1', '2', '800000', 'Rp. 800,000', 'Rp. 0', 'Rp. 775,000', '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', '2023-10-12 09:02:04', '2023-10-15 00:38:01'),
(3, 'a', 'a', '2023-10-09', 'a', 'a', 'a', 'a', 'a', '16-October-2023', 'a', 'direct sales', '2', '1', '500000', 'Rp.475,000', 'Rp.0', 'Rp.475,000', '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', '2023-10-16 01:33:00', '2023-10-16 01:33:00'),
(4, 'a', 'a', '2023-10-09', 'a', 'a', 'a', 'a', 'a', '16-October-2023', 'a', 'direct sales', '2', '1', '500000', 'Rp.475,000', 'Rp.0', 'Rp.475,000', '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', '2023-10-16 01:33:16', '2023-10-16 01:33:16'),
(5, 'a', 'a', '2023-10-09', 'a', 'a', 'a', 'a', 'a', '16-October-2023', 'a', 'direct sales', '2', '1', '500000', 'Rp.475,000', 'Rp.0', 'Rp.475,000', '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', '2023-10-16 01:33:35', '2023-10-16 01:33:35');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$Z6JavG0B7941jpr6rVs3rOMonLl3ckussExFs1BfjiYr9x7n8jubm', NULL, '2023-10-12 08:52:57', '2023-10-12 08:52:57'),
(2, 'admin', 'admin1', 'admin1@gmail.com', NULL, '$2y$10$5fYbAYWUR6UZmmyGVpVWJuB5CGRa4vW6sjicgezN0YV5UJ6o1m7fe', NULL, '2023-10-15 01:28:03', '2023-10-15 01:28:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `pemohon`
--
ALTER TABLE `pemohon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `pemohon`
--
ALTER TABLE `pemohon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
