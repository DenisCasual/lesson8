-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 07 2020 г., 14:24
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `les8`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `id` int NOT NULL,
  `nameShort` varchar(30) NOT NULL,
  `nameFull` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `param` text NOT NULL,
  `weight` varchar(10) NOT NULL,
  `bigPhoto` varchar(50) NOT NULL,
  `miniPhoto` varchar(50) NOT NULL,
  `count` int NOT NULL,
  `discount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `clientinfo`
--

CREATE TABLE `clientinfo` (
  `id` int NOT NULL,
  `timeOrder` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `discountCard` varchar(50) NOT NULL,
  `persons` varchar(50) NOT NULL,
  `pay` int NOT NULL,
  `money` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `comment` text NOT NULL,
  `delivery` int DEFAULT NULL,
  `desiredTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `fio` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `fio`, `email`, `text`) VALUES
(2, 'admin', 'admin@mail.ru', 'adminadminadminadminadminv'),
(3, 'max', 'max@mail.ru', 'привет');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int NOT NULL,
  `nameFull` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `bigPhoto` varchar(50) NOT NULL,
  `miniPhoto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `nameFull`, `price`, `bigPhoto`, `miniPhoto`) VALUES
(64, 'Худи светлого цвета', 2500, 'img/1.png', 'imgMini/1.png'),
(65, 'Худи темного цвета', 2600, 'img/2.png', 'imgMini/2.png'),
(66, 'Костюмы для всей семьи', 9999, 'img/3.png', 'imgMini/3.png');

-- --------------------------------------------------------

--
-- Структура таблицы `ordertomanager`
--

CREATE TABLE `ordertomanager` (
  `idClient` int NOT NULL DEFAULT '0',
  `idGood` int NOT NULL DEFAULT '0',
  `count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `login`, `pass`) VALUES
(4, 'admin', 'admin@mail.ru', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(5, 'Денис Миронов', '12345@mail.ru', '12345', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clientinfo`
--
ALTER TABLE `clientinfo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ordertomanager`
--
ALTER TABLE `ordertomanager`
  ADD PRIMARY KEY (`idGood`,`idClient`),
  ADD KEY `idClient` (`idClient`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clientinfo`
--
ALTER TABLE `clientinfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ordertomanager`
--
ALTER TABLE `ordertomanager`
  ADD CONSTRAINT `ordertomanager_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clientinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordertomanager_ibfk_2` FOREIGN KEY (`idGood`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
