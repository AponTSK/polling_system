-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 21, 2024 at 12:58 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `polling_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_20_060448_create_polls_table', 2),
(5, '2024_11_20_060547_create_poll_options_table', 2),
(6, '2024_11_20_060616_create_poll_votes_table', 2),
(7, '2024_11_20_060631_create_admins_table', 2),
(8, '2024_11_20_062240_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `question`, `user_id`, `expires_at`, `status`, `created_at`, `updated_at`) VALUES
(3, 'test', 1, '2024-11-28 02:27:46', 1, '2024-11-21 02:27:46', '2024-11-21 02:27:46'),
(4, 'abcde', 1, '2024-11-22 10:44:00', 1, '2024-11-21 04:45:22', '2024-11-21 04:45:22'),
(5, 'test3', 1, '2024-11-26 15:57:00', 1, '2024-11-21 04:58:05', '2024-11-21 04:58:05'),
(6, 'test4', 1, '2024-11-22 11:05:00', 1, '2024-11-21 05:05:11', '2024-11-21 05:05:11'),
(7, 'test 5', 1, '2024-11-26 11:14:00', 1, '2024-11-21 05:14:24', '2024-11-21 05:14:24'),
(8, 'test5', 1, '2024-11-22 11:51:00', 1, '2024-11-21 05:51:25', '2024-11-21 05:51:25'),
(9, 'Non aut con', 1, '2024-11-25 12:59:00', 1, '2024-11-21 05:59:50', '2024-11-21 05:59:50'),
(10, 'Possimus harum odio', 1, '2024-11-21 12:01:00', 1, '2024-11-21 06:01:12', '2024-11-21 06:01:12'),
(11, 'test live', 4, '2024-11-21 12:18:00', 1, '2024-11-21 06:16:50', '2024-11-21 06:16:50'),
(12, 'test1000', 6, '2024-11-21 12:40:00', 1, '2024-11-21 06:39:10', '2024-11-21 06:39:10'),
(13, 'test 101', 1, '2024-11-22 12:47:00', 1, '2024-11-21 06:46:54', '2024-11-21 06:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` bigint UNSIGNED NOT NULL,
  `poll_id` bigint UNSIGNED NOT NULL,
  `option` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `poll_id`, `option`, `votes`, `created_at`, `updated_at`) VALUES
(6, 3, 'a', 1, '2024-11-21 02:27:46', '2024-11-21 03:22:43'),
(7, 3, 'b', 1, '2024-11-21 02:27:46', '2024-11-21 06:15:58'),
(8, 3, 'c', 1, '2024-11-21 02:27:46', '2024-11-21 06:38:30'),
(9, 3, 'd', 0, '2024-11-21 02:27:46', '2024-11-21 02:27:46'),
(10, 4, 'ab', 0, '2024-11-21 04:45:22', '2024-11-21 04:45:22'),
(11, 4, 'abc', 2, '2024-11-21 04:45:22', '2024-11-21 06:32:54'),
(12, 4, 'abcd', 0, '2024-11-21 04:45:22', '2024-11-21 04:45:22'),
(13, 5, 'asd', 0, '2024-11-21 04:58:05', '2024-11-21 04:58:05'),
(14, 5, 'asdasffsd', 1, '2024-11-21 04:58:05', '2024-11-21 04:58:14'),
(15, 5, 'freewr', 1, '2024-11-21 04:58:05', '2024-11-21 06:29:46'),
(16, 6, 'fdg', 1, '2024-11-21 05:05:11', '2024-11-21 05:05:25'),
(17, 6, 'dfgdf', 1, '2024-11-21 05:05:11', '2024-11-21 06:30:19'),
(18, 7, 'y5', 1, '2024-11-21 05:14:24', '2024-11-21 06:29:38'),
(19, 7, 'y55', 1, '2024-11-21 05:14:24', '2024-11-21 05:15:07'),
(20, 8, 'ab5', 1, '2024-11-21 05:51:25', '2024-11-21 06:29:34'),
(21, 8, '555', 0, '2024-11-21 05:51:25', '2024-11-21 05:51:25'),
(22, 8, '5555', 1, '2024-11-21 05:51:25', '2024-11-21 05:51:33'),
(23, 9, 'ab', 2, '2024-11-21 05:59:50', '2024-11-21 06:29:42'),
(24, 9, 'test', 0, '2024-11-21 05:59:50', '2024-11-21 05:59:50'),
(25, 9, 'asd', 0, '2024-11-21 05:59:50', '2024-11-21 05:59:50'),
(26, 10, 'test', 1, '2024-11-21 06:01:12', '2024-11-21 06:30:09'),
(27, 10, 'a', 1, '2024-11-21 06:01:12', '2024-11-21 06:01:20'),
(28, 10, 'ab', 0, '2024-11-21 06:01:12', '2024-11-21 06:01:12'),
(29, 11, 'ab', 1, '2024-11-21 06:16:50', '2024-11-21 06:19:54'),
(30, 11, 'cd', 3, '2024-11-21 06:16:50', '2024-11-21 06:26:56'),
(31, 11, 'ef', 0, '2024-11-21 06:16:50', '2024-11-21 06:16:50'),
(32, 12, 'A', 0, '2024-11-21 06:39:10', '2024-11-21 06:39:10'),
(33, 12, 'B', 0, '2024-11-21 06:39:10', '2024-11-21 06:39:10'),
(34, 12, 'C', 2, '2024-11-21 06:39:10', '2024-11-21 06:40:46'),
(35, 13, 'sdfd', 0, '2024-11-21 06:46:54', '2024-11-21 06:46:54'),
(36, 13, 'asdsaew', 1, '2024-11-21 06:46:54', '2024-11-21 06:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` bigint UNSIGNED NOT NULL,
  `poll_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `poll_option_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_votes`
--

INSERT INTO `poll_votes` (`id`, `poll_id`, `user_id`, `poll_option_id`, `created_at`, `updated_at`) VALUES
(2, 3, 1, 6, '2024-11-21 03:22:43', '2024-11-21 03:22:43'),
(4, 4, 1, 11, '2024-11-21 04:46:25', '2024-11-21 04:46:25'),
(5, 5, 1, 14, '2024-11-21 04:58:14', '2024-11-21 04:58:14'),
(6, 6, 1, 16, '2024-11-21 05:05:25', '2024-11-21 05:05:25'),
(7, 7, 1, 19, '2024-11-21 05:15:07', '2024-11-21 05:15:07'),
(8, 8, 1, 22, '2024-11-21 05:51:33', '2024-11-21 05:51:33'),
(9, 9, 1, 23, '2024-11-21 06:00:00', '2024-11-21 06:00:00'),
(10, 10, 1, 27, '2024-11-21 06:01:20', '2024-11-21 06:01:20'),
(11, 3, 4, 7, '2024-11-21 06:15:58', '2024-11-21 06:15:58'),
(12, 11, 4, 30, '2024-11-21 06:16:57', '2024-11-21 06:16:57'),
(13, 11, 1, 29, '2024-11-21 06:19:54', '2024-11-21 06:19:54'),
(14, 11, 5, 30, '2024-11-21 06:21:01', '2024-11-21 06:21:01'),
(15, 11, 6, 30, '2024-11-21 06:26:56', '2024-11-21 06:26:56'),
(16, 8, 6, 20, '2024-11-21 06:29:34', '2024-11-21 06:29:34'),
(17, 7, 6, 18, '2024-11-21 06:29:38', '2024-11-21 06:29:38'),
(18, 9, 6, 23, '2024-11-21 06:29:42', '2024-11-21 06:29:42'),
(19, 5, 6, 15, '2024-11-21 06:29:46', '2024-11-21 06:29:46'),
(20, 10, 6, 26, '2024-11-21 06:30:09', '2024-11-21 06:30:09'),
(21, 6, 6, 17, '2024-11-21 06:30:19', '2024-11-21 06:30:19'),
(22, 4, 6, 11, '2024-11-21 06:32:54', '2024-11-21 06:32:54'),
(23, 3, 6, 8, '2024-11-21 06:38:30', '2024-11-21 06:38:30'),
(24, 12, 6, 34, '2024-11-21 06:40:07', '2024-11-21 06:40:07'),
(25, 12, 1, 34, '2024-11-21 06:40:46', '2024-11-21 06:40:46'),
(26, 13, 1, 36, '2024-11-21 06:47:33', '2024-11-21 06:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('pkSi7ZY0qjNrFbzRfivWDtMLQ8UlcXxjESHJGZzQ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidmRxZ29oU0tEaXk2M0FLblFGdlY5eXR5bHpGa2xWTm1zUjFHWmcxRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb2xsIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1732193859);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'user1', 'user1@gmail.com', NULL, '$2y$12$bY9VkCqs5V3S2cnsdPBWSuakqTuXHb/emJlZO9GFAA8sZwqaGcxYe', NULL, '2024-11-20 02:24:32', '2024-11-20 02:24:32', 0),
(2, 'admin1', 'admin1@gmail.com', NULL, '$2y$12$ieySWFx9wlUoyCyWyKq/VOw.PNqcomtFcgfWcKjzHcJYXJwJ635WS', NULL, '2024-11-20 02:29:16', '2024-11-20 02:29:16', 1),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$12$kd6tHor4e1AH9/0yhm53Y.vrwgUrCkF.KrvoBcBiSrXuL3tFQx5pW', NULL, '2024-11-20 02:37:50', '2024-11-20 02:37:50', 1),
(4, 'user2', 'user2@gmail.com', NULL, '$2y$12$sdI5FyKrXQ6HHlX6upTsIObeM2PMB61lBR.fFD7aE.BqnBis6Qd2u', NULL, '2024-11-21 06:15:42', '2024-11-21 06:15:42', 0),
(5, 'user3', 'user3@gmail.com', NULL, '$2y$12$S5v9CHNJ8A6C5mdBGrBYJuuS8UgD8DkN5v/fWMQYbOQiB3aFOTfNy', NULL, '2024-11-21 06:20:50', '2024-11-21 06:20:50', 0),
(6, 'user4', 'user4@gmail.com', NULL, '$2y$12$HAlbLWBsg6Qmgxwg4T5JB.qs1Q0.iVH3GqJPsdSo3m3XhLbZF./jC', NULL, '2024-11-21 06:26:48', '2024-11-21 06:26:48', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polls_user_id_foreign` (`user_id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_options_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `poll_votes_poll_id_user_id_unique` (`poll_id`,`user_id`),
  ADD KEY `poll_votes_user_id_foreign` (`user_id`),
  ADD KEY `poll_votes_poll_option_id_foreign` (`poll_option_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_poll_option_id_foreign` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
