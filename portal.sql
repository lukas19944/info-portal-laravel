-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Lut 2020, 19:50
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
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_activ` tinyint(1) NOT NULL DEFAULT '1',
  `is_auth` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `short_description`, `content`, `is_activ`, `is_auth`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sport to zdrowie', '1-sport-to-zdrowie', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker', 1, 0, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(2, 2, 'Nowości w zdrowym odżywianiu', '2-nowosci-w-zdrowym-odzywianiu', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker', 1, 0, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(3, 3, 'Cwiczenia codzienne', '3-cwiczenia-codzienne', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker', 1, 0, '2020-02-13 19:59:32', '2020-02-13 19:59:32');

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
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog`
--

CREATE TABLE `blog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `short_content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `blog`
--

INSERT INTO `blog` (`id`, `title`, `slug`, `blog_content`, `short_content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nauka PHP', '1-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(2, 'Nauka SQl', '2-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(3, 'Nauka PHP', '3-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(4, 'Nauka SQl', '4-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(5, 'Nauka PHP', '5-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(6, 'Nauka SQl', '6-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(7, 'Nauka PHP', '7-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(8, 'Nauka SQl', '8-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(9, 'Nauka PHP', '9-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(10, 'Nauka SQl', '10-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(11, 'Nauka PHP', '11-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(12, 'Nauka SQl', '12-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(13, 'Nauka PHP', '13-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(14, 'Nauka SQl', '14-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(15, 'Nauka PHP', '15-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(16, 'Nauka SQl', '16-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(17, 'Nauka PHP', '17-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(18, 'Nauka SQl', '18-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(19, 'Nauka PHP', '19-nauka-php', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(20, 'Nauka SQl', '20-nauka-sql', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog_gallery`
--

CREATE TABLE `blog_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `blog_gallery`
--

INSERT INTO `blog_gallery` (`id`, `blog_id`, `gallery_id`, `created_at`, `updated_at`) VALUES
(1, 8, 2, NULL, NULL),
(3, 22, 1, NULL, NULL),
(4, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `like` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `blog_likes`
--

INSERT INTO `blog_likes` (`id`, `user_id`, `blog_id`, `like`, `created_at`, `updated_at`) VALUES
(4, 1, 5, 0, '2020-02-01 17:04:36', '2020-02-01 17:04:36'),
(5, 3, 1, 1, '2020-02-13 20:22:40', '2020-02-13 20:22:40');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `blog_tag`
--

INSERT INTO `blog_tag` (`id`, `blog_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, NULL, NULL),
(2, 1, 7, NULL, NULL),
(3, 1, 8, NULL, NULL),
(4, 2, 6, NULL, NULL),
(5, 2, 7, NULL, NULL),
(6, 2, 8, NULL, NULL),
(7, 3, 6, NULL, NULL),
(8, 3, 7, NULL, NULL),
(9, 3, 8, NULL, NULL),
(10, 4, 6, NULL, NULL),
(11, 4, 7, NULL, NULL),
(12, 4, 8, NULL, NULL),
(13, 5, 6, NULL, NULL),
(14, 5, 7, NULL, NULL),
(15, 5, 8, NULL, NULL),
(16, 6, 6, NULL, NULL),
(17, 6, 7, NULL, NULL),
(18, 6, 8, NULL, NULL),
(19, 7, 6, NULL, NULL),
(20, 7, 7, NULL, NULL),
(21, 7, 8, NULL, NULL),
(22, 8, 6, NULL, NULL),
(23, 8, 7, NULL, NULL),
(24, 8, 8, NULL, NULL),
(25, 9, 6, NULL, NULL),
(26, 9, 7, NULL, NULL),
(27, 9, 8, NULL, NULL),
(28, 10, 6, NULL, NULL),
(29, 10, 7, NULL, NULL),
(30, 10, 8, NULL, NULL),
(31, 11, 6, NULL, NULL),
(32, 11, 7, NULL, NULL),
(33, 11, 8, NULL, NULL),
(34, 12, 6, NULL, NULL),
(35, 12, 7, NULL, NULL),
(36, 12, 8, NULL, NULL),
(37, 13, 6, NULL, NULL),
(38, 13, 7, NULL, NULL),
(39, 13, 8, NULL, NULL),
(40, 14, 6, NULL, NULL),
(41, 14, 7, NULL, NULL),
(42, 14, 8, NULL, NULL),
(43, 15, 6, NULL, NULL),
(44, 15, 7, NULL, NULL),
(45, 15, 8, NULL, NULL),
(46, 16, 6, NULL, NULL),
(47, 16, 7, NULL, NULL),
(48, 16, 8, NULL, NULL),
(49, 17, 6, NULL, NULL),
(50, 17, 7, NULL, NULL),
(51, 17, 8, NULL, NULL),
(52, 18, 6, NULL, NULL),
(53, 18, 7, NULL, NULL),
(54, 18, 8, NULL, NULL),
(55, 19, 6, NULL, NULL),
(56, 19, 7, NULL, NULL),
(57, 19, 8, NULL, NULL),
(58, 20, 6, NULL, NULL),
(59, 20, 7, NULL, NULL),
(60, 20, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `nick` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`id`, `contents`, `blog_id`, `user_id`, `nick`, `confirmed`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 1, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(2, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 1, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(3, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 1, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(4, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 1, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(5, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 1, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(6, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 2, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(7, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 2, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(8, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 2, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(9, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 2, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(10, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 2, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(11, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 3, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(12, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 3, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(13, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 3, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(14, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 3, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(15, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 3, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(16, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 4, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(17, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 4, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(18, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 4, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(19, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 4, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(20, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 4, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(21, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 5, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(22, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 5, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(23, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 5, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(24, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 5, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(25, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 5, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(26, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 6, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(27, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 6, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(28, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 6, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(29, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 6, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(30, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 6, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(31, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 7, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(32, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 7, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(33, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 7, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(34, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 7, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(35, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 7, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(36, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 8, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(37, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 8, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(38, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 8, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(39, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 8, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(40, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 8, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(41, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 9, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(42, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 9, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(43, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 9, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(44, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 9, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(45, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 9, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(46, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 10, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(47, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 10, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(48, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 10, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(49, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 10, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(50, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 10, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(51, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 11, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(52, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 11, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(53, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 11, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(54, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 11, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(55, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 11, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(56, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 12, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(57, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 12, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(58, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 12, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(59, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 12, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(60, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 12, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(61, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 13, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(62, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 13, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(63, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 13, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(64, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 13, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(65, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 13, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(66, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 14, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(67, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 14, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(68, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 14, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(69, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 14, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(70, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 14, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(71, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 15, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(72, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 15, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(73, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 15, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(74, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 15, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(75, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 15, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(76, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 16, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(77, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 16, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(78, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 16, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(79, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 16, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(80, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 16, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(81, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 17, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(82, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 17, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(83, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 17, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(84, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 17, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(85, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 17, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(86, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 18, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(87, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 18, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(88, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 18, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(89, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 18, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(90, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 18, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(91, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 19, 1, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(92, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 19, 2, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(93, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 19, 3, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(94, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.', 19, 4, NULL, 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(95, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz', 19, NULL, 'luki', 0, '2020-02-13 19:59:33', '2020-02-13 19:59:33');

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
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sport', '1-sport', 1, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(2, 'Zdrowie', '2-zdrowie', 2, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(3, 'Wakacje', '3-wakacje', 3, '2020-02-13 19:59:33', '2020-02-13 19:59:33');

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
(3, 3, 5, NULL, NULL);

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
(1, 'football.jpg', 'There are many variations of passages of Lorem Ipsum available,', 1, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(2, 'diet.jpg', 'There are many variations of passages of Lorem Ipsum available,', 2, '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(3, 'holiday.jpg', 'There are many variations of passages of Lorem Ipsum available,', 3, '2020-02-13 19:59:33', '2020-02-13 19:59:33');

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
(3, 3, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image_likes`
--

CREATE TABLE `image_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `image_id` int(10) UNSIGNED NOT NULL,
  `like` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `image_likes`
--

INSERT INTO `image_likes` (`id`, `user_id`, `image_id`, `like`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, '2020-02-01 17:19:22', '2020-02-01 17:19:22'),
(3, 1, 4, 1, '2020-02-03 09:52:32', '2020-02-03 09:52:32'),
(6, 2, 1, 1, '2020-02-04 14:54:04', '2020-02-04 14:54:04');

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
(46, '2020_01_04_163010_create_images_table', 9),
(47, '2020_01_13_210717_create_blog_table', 10),
(48, '2020_01_13_211335_create_blog_table', 11),
(49, '2020_01_13_211448_create_blog_table', 12),
(50, '2020_01_13_220224_create_blog_tag_table', 13),
(51, '2020_01_17_190045_create_blog_table', 14),
(52, '2020_01_17_232322_create_blog_gallery_table', 15),
(53, '2020_01_19_222113_create_rates_table', 16),
(54, '2020_01_21_193923_create_likes_table', 17),
(55, '2020_01_27_205407_create_blog_table', 18),
(56, '2020_01_30_210723_create_comments_table', 19),
(57, '2020_02_01_174748_create_blog_likes_table', 20),
(58, '2020_02_01_180821_create_image_likes_table', 21),
(59, '2020_02_03_220017_create_articles_table', 22),
(60, '2020_02_03_221606_create_articles_table', 23),
(61, '2020_02_03_224814_create_galleries_table', 24),
(62, '2020_02_05_142047_create_comments_table', 25),
(63, '2020_02_05_204204_create_comments_table', 26);

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
(1, 'admin', '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(2, 'author', '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(3, 'moderator', '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(4, 'users', '2020-02-13 19:59:32', '2020-02-13 19:59:32');

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
(1, 'zdrowie', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(2, 'sport', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(3, 'odżywianie', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(4, 'nowości', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(5, 'wakacje', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(6, 'programowanie', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(7, 'php', '2020-02-13 19:59:33', '2020-02-13 19:59:33'),
(8, 'sql', '2020-02-13 19:59:33', '2020-02-13 19:59:33');

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
(1, 1, 2, NULL, NULL),
(2, 1, 1, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 2, 4, NULL, NULL),
(6, 3, 2, NULL, NULL);

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
(1, 'Admin User', 'admin@admin.com', NULL, '$2y$10$Uii72YYa6yuSBMuz85IMXOMKRaoTjdyGgZkRqe0GxaGzQ0o18azEu', 'users.jpg', NULL, NULL, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(2, 'Author User', 'author@admin.com', NULL, '$2y$10$Ho70YzxOvD3jGx8gga5nROIQDkC/znHQUQVYwWqYN40e6QEYReoZq', 'users.jpg', NULL, NULL, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(3, 'Moderator User', 'moderator@admin.com', NULL, '$2y$10$1cGcc46Qf5NKwQOirOpoZOv3iAcMuS1RJINh8wkUs/vrTWZvw66RW', 'users.jpg', NULL, NULL, '2020-02-13 19:59:32', '2020-02-13 19:59:32'),
(4, 'User', 'users@admin.com', NULL, '$2y$10$8cW8TWlb9tbcPbK867MFUO1a2J1pVMwjqYSop64aovE2NWrpi5Bua', 'users.jpg', NULL, NULL, '2020-02-13 19:59:32', '2020-02-13 19:59:32');

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
-- Indeksy dla tabeli `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `blog_gallery`
--
ALTER TABLE `blog_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
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
-- Indeksy dla tabeli `image_likes`
--
ALTER TABLE `image_likes`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `blog_gallery`
--
ALTER TABLE `blog_gallery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `gallery_tag`
--
ALTER TABLE `gallery_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `images_tag`
--
ALTER TABLE `images_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `image_likes`
--
ALTER TABLE `image_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `tag_article`
--
ALTER TABLE `tag_article`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
