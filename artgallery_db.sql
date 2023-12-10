-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 07:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artgallery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `art_app_artists`
--

CREATE TABLE `art_app_artists` (
  `id` bigint(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_app_artists`
--

INSERT INTO `art_app_artists` (`id`, `address`, `phone`, `user_id`) VALUES
(1, '12/258', '7907888662', 5);

-- --------------------------------------------------------

--
-- Table structure for table `art_app_arts`
--

CREATE TABLE `art_app_arts` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `artist_id` bigint(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_app_arts`
--

INSERT INTO `art_app_arts` (`id`, `name`, `category`, `price`, `image`, `status`, `artist_id`, `description`) VALUES
(1, 'Whistler’s Mother', 'Paintings', '10000', 'Most-Famous-Paintings.jpg', 'approved', 1, 'Arrangement in Grey and Black No.1 or Whistler’s M'),
(5, 'The Third of May', 'Paintings', '15000', '32.-The-Third-of-May.jpg', 'approved', 1, 'Francisco Goya, who created one of the most scary ');

-- --------------------------------------------------------

--
-- Table structure for table `art_app_art_cart`
--

CREATE TABLE `art_app_art_cart` (
  `id` bigint(20) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `art_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `profit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_app_art_cart`
--

INSERT INTO `art_app_art_cart` (`id`, `status`, `art_id`, `user_id`, `profit`) VALUES
(1, 'paid', 5, 1, '1500.0');

-- --------------------------------------------------------

--
-- Table structure for table `art_app_users`
--

CREATE TABLE `art_app_users` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_app_users`
--

INSERT INTO `art_app_users` (`id`, `phone`, `user_id`) VALUES
(1, '9895321456', 2);

-- --------------------------------------------------------

--
-- Table structure for table `art_app_usertype`
--

CREATE TABLE `art_app_usertype` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `art_app_usertype`
--

INSERT INTO `art_app_usertype` (`id`, `type`, `user_id`) VALUES
(1, 'user', 2),
(4, 'artist', 5);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add users', 7, 'add_users'),
(26, 'Can change users', 7, 'change_users'),
(27, 'Can delete users', 7, 'delete_users'),
(28, 'Can view users', 7, 'view_users'),
(29, 'Can add user type', 8, 'add_usertype'),
(30, 'Can change user type', 8, 'change_usertype'),
(31, 'Can delete user type', 8, 'delete_usertype'),
(32, 'Can view user type', 8, 'view_usertype'),
(33, 'Can add artist', 9, 'add_artist'),
(34, 'Can change artist', 9, 'change_artist'),
(35, 'Can delete artist', 9, 'delete_artist'),
(36, 'Can view artist', 9, 'view_artist'),
(37, 'Can add artists', 9, 'add_artists'),
(38, 'Can change artists', 9, 'change_artists'),
(39, 'Can delete artists', 9, 'delete_artists'),
(40, 'Can view artists', 9, 'view_artists'),
(41, 'Can add arts', 10, 'add_arts'),
(42, 'Can change arts', 10, 'change_arts'),
(43, 'Can delete arts', 10, 'delete_arts'),
(44, 'Can view arts', 10, 'view_arts'),
(45, 'Can add art_cart', 11, 'add_art_cart'),
(46, 'Can change art_cart', 11, 'change_art_cart'),
(47, 'Can delete art_cart', 11, 'delete_art_cart'),
(48, 'Can view art_cart', 11, 'view_art_cart');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$dOER5LKJeLjAl6y0zNaE34$ZugvaMDKcNuEysfcallk7c4EVej40XUDuSt+AGw+J1Y=', '2023-10-29 15:18:04.313594', 1, 'admin', '', '1', 'admin@gmail.com', 1, 1, '2023-10-28 16:31:32.904074'),
(2, 'pbkdf2_sha256$390000$YAw6sSDPYkThh0GmvJEaeu$GjvyFD/rGKwM1ShWk+5QzCPRPLNwTn8AoT5juhdj6kk=', '2023-10-29 13:59:30.309869', 0, 'ccc', 'ccc', '1', 'ccc@gmail.com', 0, 1, '2023-10-28 16:51:01.360661'),
(5, 'pbkdf2_sha256$390000$jfKS1kjK561xfB7uoezi8l$EqOt97i+1gw+zFP/e/cY1KGs/uiWq763xE6nsrLManU=', '2023-10-29 15:35:25.433498', 0, 'aaa', 'aaa', '1', 'aaa@gmail.com', 0, 1, '2023-10-28 17:28:03.370588');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'art_app', 'artists'),
(10, 'art_app', 'arts'),
(11, 'art_app', 'art_cart'),
(7, 'art_app', 'users'),
(8, 'art_app', 'usertype'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-28 16:31:12.258217'),
(2, 'auth', '0001_initial', '2023-10-28 16:31:13.917454'),
(3, 'admin', '0001_initial', '2023-10-28 16:31:14.266376'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-28 16:31:14.309613'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-28 16:31:14.370942'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-28 16:31:14.740102'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-28 16:31:14.986206'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-28 16:31:15.096536'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-28 16:31:15.111451'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-28 16:31:15.389794'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-28 16:31:15.405428'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-28 16:31:15.433937'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-28 16:31:15.532153'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-28 16:31:15.658835'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-28 16:31:15.774789'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-28 16:31:15.782004'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-28 16:31:15.953761'),
(18, 'sessions', '0001_initial', '2023-10-28 16:31:16.092308'),
(19, 'art_app', '0001_initial', '2023-10-28 16:38:41.365265'),
(20, 'art_app', '0002_remove_users_address', '2023-10-28 16:46:14.971218'),
(21, 'art_app', '0003_artist', '2023-10-28 17:11:11.858971'),
(22, 'art_app', '0004_rename_artist_artists_arts', '2023-10-28 17:50:37.874670'),
(23, 'art_app', '0005_rename_arti_arts_artist', '2023-10-28 17:51:11.891990'),
(24, 'art_app', '0006_remove_arts_quantity', '2023-10-28 17:54:59.805803'),
(25, 'art_app', '0007_arts_description', '2023-10-28 17:55:34.263098'),
(26, 'art_app', '0008_alter_arts_description', '2023-10-28 18:41:09.460006'),
(27, 'art_app', '0009_art_cart', '2023-10-28 19:22:18.608419'),
(28, 'art_app', '0010_art_cart_profit', '2023-10-29 13:57:59.312420');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('99k5cclp9p2e8mpsyodnosyp04wsxp08', '.eJxVjEsOwjAMBe-SNYqcGqeEJXvOEMV2QgsokfpZIe4OlbqA7ZuZ9zIxrcsQ1zlPcVRzNmQOvxsneeS6Ab2nemtWWl2mke2m2J3O9to0Py-7-3cwpHn41slJAADsvShmUQHnfAAOwp7oFJD6UsQ58tyXrqBCUaaOXOqOgIzm_QHbqzeL:1qx7oz:qySFWMz5-5FhhX_A_AcIO9Z72VPBxqPYLR8wUmX_f8Y', '2023-11-12 15:35:25.455205');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `art_app_artists`
--
ALTER TABLE `art_app_artists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_app_artist_user_id_2c55d60b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `art_app_arts`
--
ALTER TABLE `art_app_arts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_app_arts_artist_id_76110edd_fk_art_app_artists_id` (`artist_id`);

--
-- Indexes for table `art_app_art_cart`
--
ALTER TABLE `art_app_art_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_app_art_cart_art_id_a13febc1_fk_art_app_arts_id` (`art_id`),
  ADD KEY `art_app_art_cart_user_id_9586485a_fk_art_app_users_id` (`user_id`);

--
-- Indexes for table `art_app_users`
--
ALTER TABLE `art_app_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_app_users_user_id_18cc095c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `art_app_usertype`
--
ALTER TABLE `art_app_usertype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_app_usertype_user_id_71bed3af_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `art_app_artists`
--
ALTER TABLE `art_app_artists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `art_app_arts`
--
ALTER TABLE `art_app_arts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `art_app_art_cart`
--
ALTER TABLE `art_app_art_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `art_app_users`
--
ALTER TABLE `art_app_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `art_app_usertype`
--
ALTER TABLE `art_app_usertype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `art_app_artists`
--
ALTER TABLE `art_app_artists`
  ADD CONSTRAINT `art_app_artist_user_id_2c55d60b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `art_app_arts`
--
ALTER TABLE `art_app_arts`
  ADD CONSTRAINT `art_app_arts_artist_id_76110edd_fk_art_app_artists_id` FOREIGN KEY (`artist_id`) REFERENCES `art_app_artists` (`id`);

--
-- Constraints for table `art_app_art_cart`
--
ALTER TABLE `art_app_art_cart`
  ADD CONSTRAINT `art_app_art_cart_art_id_a13febc1_fk_art_app_arts_id` FOREIGN KEY (`art_id`) REFERENCES `art_app_arts` (`id`),
  ADD CONSTRAINT `art_app_art_cart_user_id_9586485a_fk_art_app_users_id` FOREIGN KEY (`user_id`) REFERENCES `art_app_users` (`id`);

--
-- Constraints for table `art_app_users`
--
ALTER TABLE `art_app_users`
  ADD CONSTRAINT `art_app_users_user_id_18cc095c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `art_app_usertype`
--
ALTER TABLE `art_app_usertype`
  ADD CONSTRAINT `art_app_usertype_user_id_71bed3af_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
