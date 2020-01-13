-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Sty 2020, 20:29
-- Wersja serwera: 10.1.39-MariaDB
-- Wersja PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `portal`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_activ` tinyint(1) NOT NULL DEFAULT '1',
  `is_auth` tinyint(1) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `articles`
--

INSERT INTO `articles` (`id`, `title`, `short_description`, `content`, `is_activ`, `is_auth`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sport to zdrowie', 'Lorem Ipsum jest tekstem st...', '<p>Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem pr&oacute;bnej książki. Pięć wiek&oacute;w p&oacute;źniej zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym r&oacute;żne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druk&oacute;w na komputerach osobistych, jak Aldus PageMaker</p>', 1, 0, 1, '2020-01-07 21:20:13', '2020-01-08 19:03:08'),
(2, 'Nowości w zdrowym odżywianiu', 'Lorem Ipsum jest tekstem st...', '<p>Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem pr&oacute;bnej książki. Pięć wiek&oacute;w p&oacute;źniej zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym r&oacute;żne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druk&oacute;w na komputerach osobistych, jak Aldus PageMaker</p>', 1, 0, 2, '2020-01-07 21:20:13', '2020-01-11 16:59:50'),
(3, 'Cwiczenia codzienne', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker', 1, 0, 3, '2020-01-07 21:20:13', '2020-01-07 21:20:13');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_gallery`
--

CREATE TABLE `article_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `article_gallery`
--

INSERT INTO `article_gallery` (`id`, `article_id`, `gallery_id`, `created_at`, `updated_at`) VALUES
(8, 2, 2, NULL, NULL),
(9, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sport', 1, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(2, 'Zdrowie', 2, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(3, 'Wakacje', 3, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(4, 'Ceglane', 1, '2020-01-08 20:55:05', '2020-01-08 20:55:05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery_tag`
--

CREATE TABLE `gallery_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `gallery_tag`
--

INSERT INTO `gallery_tag` (`id`, `gallery_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 5, NULL, NULL),
(4, 4, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `group_article`
--

CREATE TABLE `group_article` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` text COLLATE utf8_unicode_ci,
  `gallery_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `images`
--

INSERT INTO `images` (`id`, `title`, `alt`, `gallery_id`, `created_at`, `updated_at`) VALUES
(1, 'football.jpg', 'There are many variations of passages of Lorem Ipsum available,', 1, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(2, 'diet.jpg', 'There are many variations of passages of Lorem Ipsum available,', 2, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(3, 'holiday.jpg', 'There are many variations of passages of Lorem Ipsum available,', 3, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(4, '48877045.jpg', 'Ceglane', 4, '2020-01-08 20:55:05', '2020-01-08 20:55:05'),
(5, '85910600.jpg', 'Ceglane', 4, '2020-01-08 20:55:05', '2020-01-08 20:55:05'),
(6, '35752276.jpg', NULL, 4, '2020-01-10 19:36:50', '2020-01-10 19:36:50'),
(7, '11049604.jpg', NULL, 4, '2020-01-10 19:36:50', '2020-01-10 19:36:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `images_tag`
--

CREATE TABLE `images_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `images_tag`
--

INSERT INTO `images_tag` (`id`, `image_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 5, NULL, NULL),
(4, 4, 6, NULL, NULL),
(5, 5, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 1),
(27, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2019_11_19_090900_create_roles_table', 1),
(30, '2019_11_19_091105_create_role_user_table', 1),
(31, '2019_11_26_203502_create_articles_table', 1),
(32, '2019_11_26_204640_create_tags_table', 1),
(33, '2019_11_26_204836_create_groups_table', 1),
(34, '2019_11_26_204918_create_tag_article_table', 1),
(35, '2019_11_26_205005_create_group_article_table', 1),
(36, '2019_12_12_194451_create_comments_table', 2),
(37, '2019_12_16_205916_create_galleries_table', 2),
(38, '2019_12_16_211017_create_article_gallery_table', 3),
(39, '2019_12_17_201341_create_images_table', 4),
(40, '2019_12_17_202022_create_gallery_tag_table', 4),
(41, '2019_12_17_202046_create_images_tag_table', 4),
(42, '2019_12_19_205239_create_galleries_table', 5),
(43, '2019_12_22_205722_create_galleries_table', 6),
(44, '2019_12_23_201311_create_galleries_table', 7),
(45, '2019_12_23_201655_create_galleries_table', 8),
(46, '2020_01_04_163010_create_images_table', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(2, 'author', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(3, 'moderator', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(4, 'users', '2020-01-07 21:20:13', '2020-01-07 21:20:13');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'zdrowie', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(2, 'sport', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(3, 'odżywianie', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(4, 'nowości', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(5, 'wakacje', '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(6, 'restauracja', '2020-01-08 20:55:05', '2020-01-08 20:55:05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag_article`
--

CREATE TABLE `tag_article` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `tag_article`
--

INSERT INTO `tag_article` (`id`, `article_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(6, 3, 2, NULL, NULL),
(21, 2, 1, NULL, NULL),
(22, 2, 3, NULL, NULL),
(23, 2, 4, NULL, NULL),
(24, 1, 1, NULL, NULL),
(25, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'users.jpg',
  `birthday_date` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `birthday_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@admin.com', NULL, '$2y$10$nVqo8g5C7ae3kR2n0nziQ.BjxlZyZpsRujw/PhikXsmalz7WKQYIO', 'users.jpg', NULL, NULL, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(2, 'Author User', 'author@admin.com', NULL, '$2y$10$h2LCMUrkvZkKy7Z6tFH58.Oq6MtTtbxJpxK3PQ4myd93GxaNd6B1m', 'users.jpg', NULL, NULL, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(3, 'Moderator User', 'moderator@admin.com', NULL, '$2y$10$T9h53OISQs76tSXIKZuz3.yRxYXGyAWfJnVetXlvoBDeCHzwTJVV6', 'users.jpg', NULL, NULL, '2020-01-07 21:20:13', '2020-01-07 21:20:13'),
(4, 'User', 'users@admin.com', NULL, '$2y$10$bpPYLBoJAIy06PzZuILMT.oBbWbTVL5iyYVESUpOmEA2YXGTnSoSm', 'users.jpg', NULL, NULL, '2020-01-07 21:20:13', '2020-01-07 21:20:13');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `article_gallery`
--
ALTER TABLE `article_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gallery_tag`
--
ALTER TABLE `gallery_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `group_article`
--
ALTER TABLE `group_article`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `images_tag`
--
ALTER TABLE `images_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tag_article`
--
ALTER TABLE `tag_article`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `article_gallery`
--
ALTER TABLE `article_gallery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `gallery_tag`
--
ALTER TABLE `gallery_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `group_article`
--
ALTER TABLE `group_article`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `images_tag`
--
ALTER TABLE `images_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `tag_article`
--
ALTER TABLE `tag_article`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
