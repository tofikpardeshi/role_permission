-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2024 at 08:12 PM
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
-- Database: `laravel_role_permission`
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_10_26_064424_create_permission_tables', 2),
(7, '2024_10_26_065920_create_posts_table', 3),
(8, '2024_10_26_124535_create_notifications_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00d43f27-463d-4fa5-8214-9832017edbf0', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 2, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('10751d0e-f803-44f0-a74e-fdf8b96524e6', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 1, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('208744be-fd1d-426a-aa3a-6af308b4e44c', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 5, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('2e323c20-9a8e-4cfd-9058-4d94c16196e9', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 1, '{\"post_id\":7,\"title\":\"test\",\"content\":\"notification\",\"published_at\":\"2024-10-26T13:08:21.000000Z\"}', NULL, '2024-10-26 07:38:21', '2024-10-26 07:38:21'),
('5058efd8-30a2-4816-9119-9246381341e7', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 2, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('5144821d-4fe0-45ba-85ca-532f329f2b4f', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 5, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('54141c9f-6202-4269-b747-c70be0fb98c5', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 1, '{\"post_id\":8,\"title\":\"data test\",\"content\":\"tst\",\"published_at\":\"2024-10-26T13:08:54.000000Z\"}', NULL, '2024-10-26 07:38:54', '2024-10-26 07:38:54'),
('58cb6be4-b0c8-44fc-ada8-5621595b1c8f', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 2, '{\"post_id\":7,\"title\":\"test\",\"content\":\"notification\",\"published_at\":\"2024-10-26T13:08:21.000000Z\"}', NULL, '2024-10-26 07:38:21', '2024-10-26 07:38:21'),
('60353fbe-686c-4f56-8d32-d5f171e68209', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 6, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('632eea28-5f75-4ba5-aef2-0793877f2b59', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 7, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('6e641ea2-7d80-4cc3-8ddf-a85db50b432c', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 8, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('7c23c4ac-25a1-4ee7-9b6a-8579d776b9c8', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 1, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('7d27463e-6575-4691-893b-0de43fbb4ad7', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 4, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('9b08d5cb-a203-4a39-a2fb-391994bf5920', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 10, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('a334da63-fa5c-492e-ba9c-c1fc8fada4cd', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 9, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('af2a85e5-ba46-4b0d-83f8-982b0434adb9', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 2, '{\"post_id\":11,\"title\":\"The Power of Gratitude: Transform Your Mindset\",\"content\":\"ow practicing gratitude can lead to greater happiness and fulfillment.\",\"published_at\":\"2024-10-26T15:29:08.000000Z\"}', NULL, '2024-10-26 09:59:08', '2024-10-26 09:59:08'),
('b151ad8b-c130-452c-a108-4df7f6ea65d6', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 8, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('b8ccb70e-7784-45c5-917d-03f8c2cee328', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 3, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('bbe3c07f-150e-4434-a14d-abc758aad9fe', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 11, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('c4794393-468d-4080-b27e-7644256e1e09', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 9, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('d3c4bcfb-aa9d-4462-8669-885e164027b9', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 6, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('d68cfb6c-d217-47c7-905d-f8cacd8baeb8', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 10, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('dc01a687-659d-437f-8094-446db714c065', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 12, '{\"post_id\":11,\"title\":\"The Power of Gratitude: Transform Your Mindset\",\"content\":\"ow practicing gratitude can lead to greater happiness and fulfillment.\",\"published_at\":\"2024-10-26T15:29:08.000000Z\"}', NULL, '2024-10-26 09:59:08', '2024-10-26 09:59:08'),
('e083c4a3-8410-4b65-9692-64ae7f71682d', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 1, '{\"post_id\":11,\"title\":\"The Power of Gratitude: Transform Your Mindset\",\"content\":\"ow practicing gratitude can lead to greater happiness and fulfillment.\",\"published_at\":\"2024-10-26T15:29:08.000000Z\"}', NULL, '2024-10-26 09:59:08', '2024-10-26 09:59:08'),
('ed6f6c53-ea2f-4e11-a9a5-7f9953fc21bc', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 11, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('f1a81628-9de7-4765-967f-c57e1a33105a', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 4, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18'),
('f1fe4922-50cb-477c-9b03-a7a5833eca39', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 2, '{\"post_id\":8,\"title\":\"data test\",\"content\":\"tst\",\"published_at\":\"2024-10-26T13:08:54.000000Z\"}', NULL, '2024-10-26 07:38:54', '2024-10-26 07:38:54'),
('fc23d5ce-5a2a-46ed-abac-14f5cd7501e8', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 7, '{\"post_id\":9,\"title\":\"ads\",\"content\":\"adsasd\",\"published_at\":\"2024-10-26T14:02:46.000000Z\"}', NULL, '2024-10-26 08:32:46', '2024-10-26 08:32:46'),
('fe31c5a3-9ec4-4e51-a534-7cb04eec2973', 'App\\Notifications\\PostPublished', 'App\\Models\\User', 3, '{\"post_id\":10,\"title\":\"Data\",\"content\":\"test\",\"published_at\":\"2024-10-26T14:35:18.000000Z\"}', NULL, '2024-10-26 09:05:18', '2024-10-26 09:05:18');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'post-list', 'web', '2024-10-26 06:55:52', '2024-10-26 06:55:52'),
(2, 'post-create', 'web', '2024-10-26 06:55:52', '2024-10-26 06:55:52'),
(3, 'post-edit', 'web', '2024-10-26 06:56:46', '2024-10-26 06:56:46'),
(4, 'post-delete', 'web', '2024-10-26 06:56:46', '2024-10-26 06:56:46');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '9ce24e64cde8f9cfdbd3363d6f08f954a5783127461d48e820f92feb32733f97', '[\"*\"]', NULL, NULL, '2024-10-26 11:44:13', '2024-10-26 11:44:13'),
(2, 'App\\Models\\User', 1, 'auth_token', '0e4cef53229d1fda2ebaa78b3650a10057e452965e3ec296d2ef8fbea60a90fd', '[\"*\"]', '2024-10-26 12:38:54', NULL, '2024-10-26 11:45:16', '2024-10-26 12:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_name`, `description`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'The Art of Finding Calm in Chaos', 'Discover simple techniques to maintain peace in the most hectic situations.', '1729930348.jpg', '1', '2024-10-26 02:42:28', '2024-10-26 02:42:28'),
(2, 'Top 10 Travel Hacks for a Budget-Friendly Vacation', 'Explore essential tips for making travel affordable without sacrificing comfort.', NULL, '1', '2024-10-26 02:43:54', '2024-10-26 02:43:54'),
(3, 'Unleashing the Power of Minimalism', 'How to declutter your life and focus on what truly matters.', '1729933108.jpg', '2', '2024-10-26 03:28:28', '2024-10-26 03:28:28'),
(4, 'Boost Your Mental Health with These Daily Practices', 'Simple actions you can take every day to improve your mental well-being.', '1729933159.jpg', '2', '2024-10-26 03:29:19', '2024-10-26 03:36:44'),
(5, 'Why Nature is the Best Medicine', 'Exploring the healing benefits of spending time in nature.', '1729946806.jpg', '2', '2024-10-26 07:16:46', '2024-10-26 07:16:46'),
(11, 'The Power of Gratitude: Transform Your Mindset', 'ow practicing gratitude can lead to greater happiness and fulfillment.', '1729956548.jpg', '12', '2024-10-26 09:59:08', '2024-10-26 09:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-10-26 06:50:18', '2024-10-26 06:50:18'),
(2, 'Author', 'web', '2024-10-26 06:50:18', '2024-10-26 06:50:18'),
(8, 'Hr', 'web', '2024-10-26 09:38:01', '2024-10-26 09:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 8),
(3, 1),
(3, 2),
(4, 1),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@yopmail.com', 1, NULL, '$2y$12$jo85UjT7fYvzktjB2G5kveFIsDdL0nt7uY3YC..s7qDmSaT3jfmrC', NULL, '2024-10-26 01:17:10', '2024-10-26 01:17:10'),
(2, 'Author', 'author@yopmail.com', 2, NULL, '$2y$12$zorH4DoEeAItkps0pp0JOu7u6p.R4z0q5OD4g3EnGeVi3bWY2kIIG', NULL, '2024-10-26 03:26:16', '2024-10-26 03:26:16'),
(12, 'Pooja', 'pooja@yopmail.com', 8, NULL, '$2y$12$KBjXU.tzaNJz5qAzI7Pj0.9TKm49CVMjnDRI6xGrKNwIxCJCkzO7S', NULL, '2024-10-26 09:58:32', '2024-10-26 09:58:32');

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
