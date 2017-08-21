-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 24 2017 г., 01:16
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kramevents`
--
-- CREATE DATABASE IF NOT EXISTS `kramevents` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
-- USE `kramevents`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL COMMENT 'category''s name',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'keeps parent''s category this subcategory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'Reserved', 0),
(2, 'Кино', 0),
(3, 'Концерты', 0),
(4, 'Скидки и рекламные акции', 0),
(5, 'Выставки', 0),
(6, 'Для детей', 0),
(7, 'Театр', 0),
(8, 'Спорт', 0),
(9, 'Семинары', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL COMMENT 'company''s name',
  `description` varchar(255) NOT NULL COMMENT 'short description',
  `place_id` int(10) UNSIGNED NOT NULL COMMENT 'place of head office',
  `email` varchar(255) DEFAULT NULL COMMENT '@',
  `www` varchar(255) DEFAULT NULL COMMENT 'company''s url',
  `picture_url` varchar(255) DEFAULT NULL COMMENT 'company''s picture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for company';

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `fullname`, `description`, `place_id`, `email`, `www`, `picture_url`) VALUES
(1, 'Webcity', 'A webcity company.', 1, 'infomail.webcity@gmail.com', '', 'img_id1.jpg'),
(2, '\"Родина\"', 'Kинотеатр \"Родина\".', 1, 'rodina_kino@mail.ru', 'http://rodina.mk/', 'img_id2.jpg'),
(3, 'ДК и Т НКМЗ', 'Городской Дворец Культуры и Техники НКМЗ.', 1, 'nspdkit@gmail.com', '', 'img_id3.jpg'),
(4, '\"Юбилейный\"', 'Парк \"Юбилейный\".', 1, '', '', 'img_id4.jpg'),
(5, 'Парк им. А.С.Пушкина ', 'Парк им. А.С.Пушкина.', 1, '', '', 'img_id5.jpg'),
(6, ' ДК \"Строитель\"', 'Городской дворец культуры «Строитель».', 1, '', '', 'img_id6.jpg'),
(7, '«Сад Бернацкого»', 'Парк «Сад Бернацкого».', 1, '', '', 'img_id7.jpg'),
(8, 'Краматорский художественный музей', 'Краматорский художественный музей.', 1, '', '', 'img_id8.jpg'),
(9, 'Музей', 'Музей истории города Краматорска.', 1, '', '', 'img_id9.jpg'),
(10, 'Центральная библиотека', 'Центральная городская публичная библиотека им. М. Горького.', 1, 'library@krm.net.ua', 'http://lib-krm.org/', 'img_id10.jpg'),
(11, 'Фиеста', 'Арт-кафе фиеста.', 1, 'fiestaclub@list.ru', '', 'img_id11.jpg'),
(12, 'Блюминг', 'Блюминг, стадион в Краматорске.', 1, '', '', 'img_id12.jpg'),
(13, 'Авангард', 'Авангард, стадион в Краматорске.', 1, '', '', 'img_id13.jpg');
-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'event''s name',
  `description` varchar(255) NOT NULL COMMENT 'event''s description',
  `category_id` tinyint(3) UNSIGNED NOT NULL COMMENT 'category',
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'start of event',
  `date_end` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'end of event',
  `place_id` int(10) UNSIGNED NOT NULL COMMENT 'venue',
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'organizer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `category_id`, `date_start`, `date_end`, `place_id`, `company_id`) VALUES
(1, 'Birthday', 'Happy Birthday!', 1, '2017-08-03 14:06:49', '2017-08-30 14:06:49', 1, 1),
(2, 'Велопробег', 'Приглашаем Вас на велопробег', 8, '2017-08-01 13:00:00', '2017-08-30 17:00:00', 1, 1),
(3, 'Мотопробег', 'Мотобробег - это лучше, чем велопробег', 8, '2017-08-05 14:00:00', '2017-08-28 19:00:00', 1, 1),
(4, 'Автопробег', 'Приглашаем Вас сюда, будет круто', 8, '2017-08-05 19:00:00', '2017-08-29 23:00:00', 1, 10),
(5, 'Авиапробег', 'Вероятно, лучший пробег', 8, '2017-08-21 00:00:00', '2017-08-26 00:00:00', 1, 11),
(6, 'Концерт', 'Приглашаем Вас на Концерт в Сад Бернацкого!', 3, '2017-08-19 14:06:49', '2017-08-19 14:06:49', 1, 7),
(7, 'Кино', 'Приглашаем Вас на фильм в кинотеатр Родина', 2, '2017-08-27 13:00:00', '2017-08-30 17:00:00', 1, 2),
(8, 'КВН', 'Приглашаем вас в Городской дворец культуры «Строитель»', 7, '2017-08-28 14:00:00', '2017-08-28 19:00:00', 1, 6),
(9, 'Выставка картин', 'Приглашаем Вас в Краматорский художественный музей ', 5, '2017-08-29 19:00:00', '2017-08-29 23:00:00', 1, 8),
(10, 'Футбол', 'Приглашаем Вас на Авангард', 8, '2017-07-21 00:00:00', '2017-08-26 00:00:00', 1, 13),
(11, 'Спектакль для детей', 'Приглашаем Вас на спектакль во Дворец Культуры и Техники НКМЗ', 6, '2017-08-19 14:06:49', '2017-08-19 14:06:49', 1, 1),
(12, 'Тренировки по футболу', 'Приглашаем Вас на стадион Блюминг', 6, '2017-08-27 13:00:00', '2017-08-30 17:00:00', 1, 12),
(13, 'Семинары', 'Приглашаем Вас в Центральную городскую публичную библиотеку им. М. Горького', 9, '2017-08-28 14:00:00', '2017-08-28 19:00:00', 1, 10);


-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event',
  `picture_url` varchar(255) NOT NULL COMMENT 'event''s picture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pictures` (`event_id`, `picture_url`) VALUES
(1, 'img_e_id1.jpg'),
(2, 'img_e_id2.jpg'),
(3, 'img_e_id3.jpg'),
(4, 'img_e_id4.jpg'),
(5, 'img_e_id5.jpg'),
(6, 'img_e_id6.jpg'),
(7, 'img_e_id7.jpg'),
(8, 'img_e_id8.jpg'),
(9, 'img_e_id9.jpg'),
(10, 'img_e_id10.jpg'),
(11, 'img_e_id11.jpg'),
(12, 'img_e_id12.jpg'),
(13, 'img_e_id13.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `places`
--

CREATE TABLE `places` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `latitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `longitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `city` varchar(255) DEFAULT NULL COMMENT 'place''s name',
  `street` varchar(255) DEFAULT NULL COMMENT 'place''s street',
  `house` smallint(6) DEFAULT NULL COMMENT 'place''s house',
  `apartment` smallint(6) DEFAULT NULL COMMENT 'place''s apartment',
  `postalcode` varchar(20) NOT NULL COMMENT 'zipcode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `places`
--

INSERT INTO `places` (`place_id`, `name`, `latitude`, `longitude`, `city`, `street`, `house`, `apartment`, `postalcode`) VALUES
(1, 'Home', '48.742886', '37.587985', 'Kramatorsk', 'Marata', 8, 0, '84313'),
(2, 'Краматорск', '48.737724', '37.584001', 'Краматорск', '0', 0, 0, '84300');

-- --------------------------------------------------------

--
-- Структура таблицы `social_networks`
--

CREATE TABLE `social_networks` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `social_network_id` int(10) UNSIGNED NOT NULL COMMENT 'social network list',
  `company_network_url` varchar(255) NOT NULL COMMENT 'company''s social network'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social_networks`
--

INSERT INTO `social_networks` (`company_id`, `social_network_id`, `company_network_url`) VALUES
(1, 1, 'webcity.com');

-- --------------------------------------------------------

--
-- Структура таблицы `social_networks_list`
--

CREATE TABLE `social_networks_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `network` varchar(255) NOT NULL COMMENT 'network''s name',
  `network_url` varchar(255) NOT NULL COMMENT 'network''s url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social_networks_list`
--

INSERT INTO `social_networks_list` (`id`, `network`, `network_url`) VALUES
(1, 'Reserved', 'reserved.com'),
(2, 'Facebook', 'fb.com'),
(3, 'Twitter', 'https://twitter.com/');

-- --------------------------------------------------------

--
-- Структура таблицы `telephone_numbers`
--

CREATE TABLE `telephone_numbers` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `telephone` varchar(13) NOT NULL COMMENT 'tel number'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `telephone_numbers`
--

INSERT INTO `telephone_numbers` (`company_id`, `telephone`) VALUES
(1, '+380981234567'),
(2, '+380951907771'),
(3, '+380626435095'),
(4, '+380626458433'),
(5, '+380626437327'),
(6, '+380626465058'),
(7, '+111111111111'),
(8, '+380626450305'),
(9, '+380626455158'),
(10, '+380626452046'),
(11, '+380626432358'),
(12, '+380626437042'),
(13, '+380626447533');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL COMMENT 'login',
  `hash` varchar(255) NOT NULL COMMENT 'password''s hash',
  `email` varchar(255) NOT NULL COMMENT '@',
  `picture_url` varchar(255) DEFAULT NULL COMMENT 'avatar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for users';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `hash`, `email`, `picture_url`) VALUES
(1, 'test', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com ', ''),
(2, 'Lucky75', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(3, 'GodRa13', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(4, 'lisnm', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(5, 'olgalisvaja', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(6, '22nick', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_companies`
--

CREATE TABLE `users_companies` (
  `id_user` int(10) UNSIGNED NOT NULL COMMENT 'user''s id from "users"',
  `id_company` int(10) UNSIGNED NOT NULL COMMENT 'company''s id from "company'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='connect users and companies';

--
-- Дамп данных таблицы `users_companies`
--

INSERT INTO `users_companies` (`id_user`, `id_company`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`category_name`),
  ADD KEY `subcategory_id` (`parent_id`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category_name` (`category_name`);

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`company_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD KEY `event_id` (`event_id`);

--
-- Индексы таблицы `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`place_id`);

--
-- Индексы таблицы `social_networks`
--
ALTER TABLE `social_networks`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `social_network_id` (`social_network_id`);

--
-- Индексы таблицы `social_networks_list`
--
ALTER TABLE `social_networks_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `company_id` (`company_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`login`);

--
-- Индексы таблицы `users_companies`
--
ALTER TABLE `users_companies`
  ADD UNIQUE KEY `User_unique` (`id_user`),
  ADD KEY `id_company` (`id_company`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `places`
--
ALTER TABLE `places`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `social_networks_list`
--
ALTER TABLE `social_networks_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`);

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ограничения внешнего ключа таблицы `social_networks`
--
ALTER TABLE `social_networks`
  ADD CONSTRAINT `social_network_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_network_list` FOREIGN KEY (`social_network_id`) REFERENCES `social_networks_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD CONSTRAINT `telephone_numbers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_companies`
--
ALTER TABLE `users_companies`
  ADD CONSTRAINT `company_id_companies` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `user_id_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
