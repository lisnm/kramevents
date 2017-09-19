-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 19, 2017 at 09:29 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id2441188_kramevents`
--
CREATE DATABASE IF NOT EXISTS `id2441188_kramevents` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `id2441188_kramevents`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL COMMENT 'category''s name',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'subcategory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `categories`:
--

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'Кино', 0),
(2, 'Концерты', 0),
(3, 'Скидки и рекламные акции', 0),
(4, 'Выставки', 0),
(5, 'Для детей', 0),
(6, 'Театр', 0),
(7, 'Спорт', 0),
(8, 'Семинары', 0);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
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
-- RELATIONSHIPS FOR TABLE `companies`:
--   `place_id`
--       `places` -> `id`
--

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `fullname`, `description`, `place_id`, `email`, `www`, `picture_url`) VALUES
(1, 'GeekBunker', 'Гік бункер - освітній хаб, коворкинг та IT-школа у місті Краматорську.', 1, 'https://www.facebook.com/GeekBunkerUA/', '', 'img_id1.jpg'),
(2, '\"Родина\"', 'Kинотеатр \"Родина\".', 2, 'rodina_kino@mail.ru', 'http://rodina.mk/', 'img_id2.jpg'),
(3, 'ДК и Т НКМЗ', 'Городской Дворец Культуры и Техники НКМЗ.', 3, 'nspdkit@gmail.com', '', 'img_id3.jpg'),
(4, '\"Юбилейный\"', 'Парк \"Юбилейный\".', 4, '', '', 'img_id4.jpg'),
(5, 'Парк им. А.С.Пушкина ', 'Парк им. А.С.Пушкина.', 5, '', '', 'img_id5.jpg'),
(6, ' ДК \"Строитель\"', 'Городской дворец культуры «Строитель».', 6, '', '', 'img_id6.jpg'),
(7, '«Сад Бернацкого»', 'Парк «Сад Бернацкого».', 7, '', '', 'img_id7.jpg'),
(8, 'Краматорский художественный музей', 'Краматорский художественный музей.', 8, '', '', 'img_id8.jpg'),
(9, 'Музей', 'Музей истории города Краматорска.', 9, '', '', 'img_id9.jpg'),
(10, 'Центральная библиотека', 'Центральная городская публичная библиотека им. М. Горького.', 10, 'library@krm.net.ua', 'http://lib-krm.org/', 'img_id10.jpg'),
(11, 'Фиеста', 'Арт-кафе фиеста.', 11, 'fiestaclub@list.ru', '', 'img_id11.jpg'),
(12, 'Блюминг', 'Блюминг, стадион в Краматорске.', 12, '', '', 'img_id12.jpg'),
(13, 'Авангард', 'Авангард, стадион в Краматорске.', 13, '', '', 'img_id13.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'event''s name',
  `description` longtext NOT NULL COMMENT 'event''s description',
  `category_id` tinyint(3) UNSIGNED NOT NULL COMMENT 'category',
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'start of event',
  `date_end` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'end of event',
  `place_id` int(10) UNSIGNED NOT NULL COMMENT 'venue',
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'organizer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `events`:
--   `company_id`
--       `companies` -> `id`
--   `category_id`
--       `categories` -> `id`
--   `place_id`
--       `places` -> `id`
--

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `category_id`, `date_start`, `date_end`, `place_id`, `company_id`) VALUES
(1, 'Бигфут Младший (3D)', '\r\nПриглашаем Вас на мультфильм в кинотеатр Родина.\r\nСеансы:\r\n16:30.\r\nРежиссер:\r\nДжереми Дегрусон, Бен Стассен.\r\nЯзык показа:\r\nукраинский.\r\nОписание:\r\nОбычный подросток по имени Адам отправляется на поиски своего давно пропавшего отца и попадает в приключение мифических масштабов.\r\n Его мир переворачивается вверх дном, когда оказывается, что в нем течет кровь последних легендарных хранителей леса — бигфутов.\r\n Теперь ему открыты такие способности как суперскорость, живительное прикосновение и возможность понимать язык животных.\r\n ', 1, '2017-07-27 16:30:00', '2017-08-09 16:30:00', 2, 2),
(2, 'Тёмная башня', '\r\nПриглашаем Вас на фильм в кинотеатр Родина.\r\nСеансы:\r\n10:00,  13:10,  18:30,  20:20.\r\nРежиссер:\r\nНиколай Арсель\r\nВ ролях:\r\nКэтрин Уинник, Мэттью МакКонахи, Идрис Эльба, Эбби Ли, Джеки Эрл Хейли, Деннис Хейсбёрт, Су-хён, Николас Хэмилтон,\r\nАлекс МакГрегор, Фрэн Кранц\r\nЯзык показа\r\nукраинский\r\nОписание\r\nНаш мир — не единственный из существующих.\r\nЗаклятые враги Роланд Дискейн, последний из ордена стрелков, и Уолтер О’Дим, известный также как Человек в черном,\r\nведут извечную борьбу. На кону — мифическая Темная Башня, последний оплот и надежда вселенной, без которой мир будет\r\nповержен в полный хаос и разрушение. Силам добра и зла суждено столкнуться в последней схватке,\r\nведь Роланд Дискейн — единственный, кому под силу остановить Человека в черном, прежде чем тот разрушит Темную Башню.\r\nПродолжительность\r\n95 мин.\r\n', 1, '2017-08-03 10:00:00', '2017-08-16 20:00:00', 2, 2),
(3, 'Валериан и город тысячи планет (3D)', '\r\nПриглашаем Вас на фильм в кинотеатр Родина.\r\nСеансы:\r\nнет информации.\r\nРежиссер:\r\nЛюк Бессон.\r\nВ ролях:\r\nДэйн ДеХаан, Кара Делевинь, Элизабет Дебики, Джон Гудман, Итан Хоук, Клайв Оуэн, Рианна, Рутгер Хауэр, Крис У, Матьё Кассовиц\r\nЯзык показа:\r\nукраинский.\r\nОписание:\r\n2700 год. Валериан и Лорелин — космические спецагенты, которые по долгу службы впутались в подозрительное дело и стали\r\nневольными участниками то ли межгалактического заговора, то ли аферы причудливых поселенцев планеты Альфа,\r\nприбывших туда из различных миров со всех уголков галактик.\r\nПродолжительность\r\n137 мин.\r\n', 1, '2017-08-10 00:00:00', '2017-08-23 00:00:00', 2, 2),
(4, '\r\nТелохранитель киллера', '\r\nПриглашаем Вас на фильм в кинотеатр Родина.\r\nСеансы:\r\nнет информации.\r\nРежиссер:\r\nПатрик Хьюз.\r\nВ ролях:\r\nГари Олдман, Райан Рейнольдс, Сэмюэл Л. Джексон, Сальма Хайек, Элоди Юнг, Ричард Э. Грант,\r\nЖоаким ди Алмейда, Кирсти Митчелл, Жозефин де ла Буме, Сэм Хэзелдайн.\r\nЯзык показа:\r\nукраинский.\r\nОписание:\r\nОн — телохранитель мирового уровня. Его новая работа — охранять киллера, которого все мечтают убить.\r\nОн и сам с удовольствием прикончил бы этого гада. Но работа — есть работа: смертельные враги в прошлом,\r\nони вынуждены объединиться в настоящем, чтобы выжить. Однако их методы настолько различны, а принципы противоположны,\r\nчто вопрос выживания — под большим вопросом.\r\nПродолжительность\r\n118 мин.\r\n', 1, '2017-08-17 00:00:00', '2017-08-30 00:00:00', 2, 2),
(5, 'Эмоджи Муви (3D)', '\r\nПриглашаем Вас на мультфильм в кинотеатр Родина.\r\nСеансы:\r\nнет информации.\r\nРежиссер:\r\nЭнтони Леондис.\r\nВ ролях:\r\nТиДжей Миллер, Джеймс Корден, Анна Фэрис, Майя Рудольф, Стивен Райт, Дженнифер Кулидж, Патрик Стюарт, Кристина Агилера,\r\nСофия Вергара, Рэйчел Рэй.\r\nЯзык показа:\r\nукраинский.\r\nОписание:\r\nЗнаете ли вы, что внутри каждого смартфона есть красочный городок Текстополис, в котором живут эмоджи?\r\nИ что они ужасно радуются, когда владелец телефона именно их выбирает для своего сообщения?\r\nКаждый из эмоджи отвечает лишь за одну эмоцию, и только Джин может выражать несколько эмоций сразу.\r\nОн очень хочет стать таким же, как и его собратья, и для этого вместе со своими друзьями пускается в увлекательное\r\nпутешествие по приложениям телефона в поисках программы, которая поможет ему измениться.\r\nНеожиданно герои узнают о грозной опасности, нависшей над городом. Смогут ли друзья спасти Текстополис и всех его обитателей?\r\nПродолжительность\r\n86 мин.\r\n', 1, '2017-08-17 00:00:00', '2017-08-30 00:00:00', 2, 2),
(6, 'Хор им. Г.Веревки', '\r\nПриглашаем Вас на Концерт во Дворец Культуры и Техники НКМЗ\r\n', 2, '2017-10-06 19:00:00', '2017-10-06 19:00:00', 3, 3),
(7, 'Атомная Блондинка', '\r\nПриглашаем Вас на фильм в кинотеатр Родина.\r\nСеансы:\r\n12:00,  18:00,  20:00.\r\nРежиссер:\r\nДэвид Литч.\r\nВ ролях:\r\nШарлиз Терон, София Бутелла, Джеймс МакЭвой, Джон Гудман, Билл Скарсгард,\r\nТоби Джонс, Эдди Марсан, Дэниэл Бернхард, Джеймс Фолкнер, Йоуханнес Хёйкьюр Йоуханнессон.\r\nЯзык показа:\r\nукраинский.\r\nОписание:\r\nАгент Лоррейн Бротон, бриллиант в короне Секретной разведывательной службы Ее Величества, не просто мастер шпионажа: она бомбически сексуальна, взрывоопасна и использует весь арсенал своих уникальных умений во время невыполнимых миссий.\r\nВ неспокойном Берлине, куда ее направляют с заданием вернуть бесценное досье, она вынуждена объединиться с агентом под прикрытием Дэвидом Персивалем.\r\nВместе им предстоит проложить путь через тернии смертельных шпионских игр.Продолжительность\r\n115 мин.\r\n', 1, '2017-07-27 12:00:00', '2017-08-09 20:00:00', 2, 2),
(8, 'КВН', 'Приглашаем вас в Городской дворец культуры «Строитель»', 6, '2017-04-15 18:00:00', '2017-04-15 20:00:00', 1, 6),
(9, 'Выставка картин', 'Приглашаем Вас в Краматорский художественный музей ', 4, '2017-08-29 10:00:00', '2017-08-29 16:00:00', 1, 8),
(10, 'Студия \"Квартал 95\"', '\r\nПриглашаем Вас на стадион Авангард.\r\nСтудия \"Квартал 95\" даст бесплатный концерт в Краматорске на стадионе \"Авангард\".\r\n\"В этот праздничный день коллектив студии даст большой бесплатный концерт, который пройдет в Краматорске на городском стадионе Авангард в парке культуры и отдыха «Сад Бернацкого». Концерт проводится при поддержке Донецкой областной государственной администрации.\r\n\r\n«Квартал 95» готовит 3-часовую концертную программу. Жители восточных городов Украины увидят новый «Вечерний Квартал», телевизионная премьера которой состоится в эфире канала «1+1» только в конце сентября. Также актерский коллектив покажет уже популярные и полюбившиеся номера своей программы. Готовятся и музыкальные поздравления от украинских исполнителей.\r\n\r\nПосетить большой концерт смогут все желающие – вход свободный. Отпраздновать вместе с «Кварталом» День Независимости приглашены военные, волонтеры, воспитанники детских домов и все, кто желает весело и дружно отметить главный Праздник страны.\r\n\r\nСразу по окончанию концертной программы «Квартал 95» приготовил еще один подарок для гостей мероприятия – кинопоказ полнометражного фильма «Слуга народа 2». Политическая комедия стала одним из лидеров кинопроката Украины в 2016 году. Тогда в кинотеатрах страны ее посмотрело более 340 000 зрителей. На этот раз готовится самый масштабный кинопоказ за всю историю Украины.\r\n\r\nПосле окончания официального кинопроката «Слуга народа 2» был недоступен для просмотра где-либо. Это беспрецедентный случай для Украины. Сейчас же все, кто не успел увидеть историю борьбы и противостояния олигархам Народного Президента на больших экранах, смогут сделать это в самой большой компании и на самом большом экране под открытым небом прямо на стадионе\", - сообщается на сайте kvartal95.com/ua Источник: #Краматорск сегодня\r\n', 2, '2017-08-24 19:00:00', '2017-08-24 00:00:00', 13, 13),
(11, 'Шароотпадное шоу «Супершар»', '\r\nПриглашаем Вас на спектакль во Дворец Культуры и Техники НКМЗ.\r\nНОВОЕ ДЕТСКОЕ ШАРООТПАДНОЕ ШОУ «СУПЕРШАР» удивит каждого!\r\nСамые смешные одесситы Тутта и Сеня вместе с Шоу- театром «А вот и Мы» приглашают всех детей и взрослых на Шароотпадное ШОУ «СуперШар»! Только воздушные шарики, только приключения!\r\nВ волшебной Шариковой стране живут Принц и Принцесса — Сеня и Тутта.\r\nВсе у них в королевстве хорошо. Все играют с воздушными шариками, радуются и веселятся.\r\n', 5, '2017-03-26 11:00:00', '2017-03-26 12:00:00', 3, 3),
(12, '«Давай, играй!»', '\r\nПриглашаем Вас на стадион Блюминг.\r\n«Давай, играй!» – это:\r\n- бесплатные уроки футбола;\r\n- занятия с настоящим тренером;\r\n- хорошее футбольное поле для игры;\r\n- равные условия для мальчиков и девочек;\r\n- активный досуг вашего ребенка.\r\nСтать участником проекта «Давай, играй!» может каждый ребенок в возрасте от 7 до 12 лет,\r\nкоторый хочет играть в футбол. Мы берем в проект всех желающих, без специфических отборов.\r\nМы ищем и обучаем тренеров-волонтеров, ежедневно проводящих занятия с мальчишками и девчонками.\r\nРебята занимаются на синтетических полях последнего поколения.\r\nКонечно, если ребенок проявит футбольные таланты в рамках проекта, его могут пригласить в Академию клуба.\r\n\r\nДля участия в проекте «Давай, играй!» нужно:\r\n- позвонить администратору площадки, где хочет тренироваться ваш ребенок;\r\n- отправить письмо с заявкой на электронную почту letsplay@shakhtar.com.\r\nКраматорск, стадион «Блюминг». Администратор – Виталий, 066 970 60 09.\r\n', 5, '2016-06-01 13:00:00', '2017-12-30 17:00:00', 1, 12),
(13, 'Семинары', 'Приглашаем Вас в Центральную городскую публичную библиотеку им. М. Горького', 8, '2017-08-05 12:00:00', '2017-08-26 12:00:00', 1, 10),
(14, 'Лебединое озеро', '\r\nПриглашаем Вас на Романтический балет в двух действиях по мотивам немецких сказок во Дворец Культуры и Техники НКМЗ.\r\n«Лебединое озеро» — классический балет, сюжет которого основан на старинной немецкой легенде.\r\nВы увидите невероятную историю сказочной любви!\r\nОдетта отвергает Ротбарта, злого колдуна, за что он превращает ее в лебедя.\r\nПринц тронут историей Одетты и готов убить злодея, но только беззаветная любовь юноши может снять заклятие.\r\nРотбарт путем обмана сводит принца с другой, после чего последует борьба. Злой гений погибает, и его чары рушатся.\r\nПрекрасный лебедь превращается в девушку, и вместе с принцем они встречают лучи восходящего солнца.\r\n', 6, '2017-09-13 19:00:00', '2017-09-13 19:00:00', 1, 3),
(15, 'Время и Стекло', '\r\nПриглашаем Вас на Концерт во Дворец Культуры и Техники НКМЗ\r\n', 2, '2017-10-17 19:00:00', '2017-10-17 19:00:00', 3, 3),
(16, 'Презентация социально направленных IT-проектов', '\r\nПриглашаем Вас в \"GeekBunker\".\r\n участниками проекта будут представлены три выпускные проекты, которые могут стать началом для решения социально-значимых проблем для города Краматорска:\r\n1. Онлайн система \"Электронный запись к врачу\"\r\n2. Информационная система о работе транспорта города\r\n3. Система информирования о мероприятиях, проходящих в г.Краматорск.\r\nВ течение 5 месяцев простые люди, не связанные с IT учились использованию языков программирования, технологий и алгоритмов с одной целью - получить навыки\r\n достаточные для дальнейшего саморазвития и реализации себя как полноценного IT-специалиста.\r\nРезультаты финального задания проекта, испытания для выпускников - реализовать полноценный продукт.\r\nСредний возраст студентов - 30 лет.\r\n', 8, '2017-08-03 19:00:00', '2017-08-03 20:00:00', 1, 1),
(17, 'Yoga Open Air Sundays в Краматорске', '\r\nПриглашаем Вас на Yoga Open Air Sundays - это открытые воскресные занятия йогой на природе. \r\nВ августе приглашаем краматорчан на бесплатные занятия 6, 13, 20, 27 августа с 10:00 до 12:00 в парке Юбилейный (встречаемся в 9:45 перед входом в парк аттракционов). \r\nИнструктор: Людмила Мандзяк, Украинская Федерация Йоги.\r\nС собой иметь удобную спортивную одежду и коврик/каремат.\r\nФорма для регистрации https://goo.gl/88b6L9.\r\n', 7, '2017-08-06 10:00:00', '2017-08-20 12:00:00', 4, 4),
(18, 'Тренинговая игра \"Вершина отношений\"', '\r\nПриходите в \"GeekBunker\" поиграть в настольную игру для взрослых \"Вершина отношений\". \r\nОт вас: бумага, ручка, хорошее настроение. \r\nОт меня: чай/кофе, печеньки, новые идеи. \r\nМы играем, чтобы понять как улучшить/изменить/построить классные отношения с близкими. Время игры с 12 до 16ч. Предварительная запись обязательна: в личные сообщения или в мероприятие.\r\nОплата свободная (кидаем в банку \"на развитие\" столько, сколько по вашему мнению стоит полученная информация).\r\nПринимаю в игру ДО 5 ЧЕЛОВЕК.\r\n', 8, '2017-08-06 12:00:00', '2017-08-06 16:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_company`
--

CREATE TABLE `event_company` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `event_company`:
--   `company_id`
--       `companies` -> `id`
--   `event_id`
--       `events` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'id',
  `city` varchar(255) NOT NULL COMMENT 'city''s name',
  `country` varchar(255) NOT NULL COMMENT 'country',
  `latitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `longitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `street` varchar(255) DEFAULT NULL COMMENT 'street',
  `house` smallint(6) DEFAULT NULL COMMENT 'house number',
  `zip` varchar(20) DEFAULT NULL COMMENT 'postalcode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `location`:
--

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `city`, `country`, `latitude`, `longitude`, `street`, `house`, `zip`) VALUES
(1, 'Краматорск', 'Украина', '48.743085', '37.588178', 'Марата', 8, '84300'),
(2, 'Краматорск', 'Украина', '48.742047', '37.587805', 'Академическая', 49, '84300'),
(3, 'Краматорск', 'Украина', '48.738296', '37.586270', 'Мира', 1, '84300'),
(4, 'Краматорск', 'Украина', '48.725233', '37.587466', NULL, NULL, '84300'),
(5, 'Краматорск', 'Украина', '48.748691', '37.586029', NULL, NULL, '84300'),
(6, 'Краматорск', 'Украина', '48.750140', '37.589599', 'Маяковского', 9, '84300'),
(7, 'Краматорск', 'Украина', '48.720523', '37.551827', 'Конрада Гампера', 1, '84300'),
(8, 'Краматорск', 'Украина', '48.735750', '37.581010', 'Академическая', 60, '84300'),
(9, 'Краматорск', 'Украина', '48.734465', '37.604672', 'Марии Приймаченко', 16, '84300'),
(10, 'Краматорск', 'Украина', '48.742359', '37.594539', 'Дружбы', 24, '84300'),
(11, 'Краматорск', 'Украина', '48.747970', '37.589552', 'Академическая', 2, '84300'),
(12, 'Краматорск', 'Украина', '48.719087', '37.549493', NULL, NULL, '84300');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event',
  `picture_url` varchar(255) NOT NULL COMMENT 'event''s picture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `pictures`:
--   `event_id`
--       `events` -> `id`
--

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `event_id`, `picture_url`) VALUES
(1, 1, '1.jpg'),
(2, 1, '1_1.jpg'),
(3, 1, '1_2.jpg'),
(4, 2, '2.jpg'),
(5, 2, '2_1.jpg'),
(6, 2, '2_2.jpg'),
(7, 3, '3.jpg'),
(8, 3, '3_1.jpg'),
(9, 3, '3_2.jpg'),
(10, 4, '4.jpg'),
(11, 4, '4_1.jpg'),
(12, 4, '4_2.jpg'),
(13, 5, '5.jpg'),
(14, 5, '5_1.jpg'),
(15, 5, '5_2.jpg'),
(16, 6, '6.jpg'),
(17, 6, '6_1.jpg'),
(18, 6, '6_2.jpg'),
(19, 7, '7.jpg'),
(20, 7, '7_1.jpg'),
(21, 7, '7_2.jpg'),
(22, 8, '8.jpg'),
(23, 8, '8_1.jpg'),
(24, 8, '8_2.jpg'),
(25, 9, '9.jpg'),
(26, 9, '9_1.jpg'),
(27, 9, '9_2.jpg'),
(28, 10, '10.jpg'),
(29, 10, '10_1.jpg'),
(30, 10, '10_2.jpg'),
(31, 11, '11.jpg'),
(32, 11, '11_1.jpg'),
(33, 11, '11_2.jpg'),
(34, 12, '12.jpg'),
(35, 12, '12_1.jpg'),
(36, 12, '12_2.jpg'),
(37, 13, '13.jpg'),
(38, 13, '13_1.jpg'),
(39, 13, '13_2.jpg'),
(40, 14, '14.jpg'),
(41, 14, '14_1.jpg'),
(42, 14, '14_2.jpg'),
(43, 15, '15.jpg'),
(44, 15, '15_1.jpg'),
(45, 15, '15_2.jpg'),
(46, 16, '16.jpg'),
(47, 16, '16_1.jpg'),
(48, 16, '16_2.jpg'),
(49, 17, '17.jpg'),
(50, 17, '17_1.jpg'),
(51, 17, '17_2.jpg'),
(52, 18, '18.jpg'),
(53, 18, '18_1.jpg'),
(54, 18, '18_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `location_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `places`:
--   `location_id`
--       `location` -> `id`
--

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `location_id`) VALUES
(1, 'Гік бункер', 1),
(2, 'Kинотеатр \"Родина\".', 2),
(3, 'Городской Дворец Культуры и Техники НКМЗ.', 3),
(4, 'Парк \"Юбилейный\".', 4),
(5, 'Парк им. А.С.Пушкина.', 5),
(6, 'Городской дворец культуры «Строитель».', 6),
(7, 'Парк «Сад Бернацкого».', 7),
(8, 'Краматорский художественный музей.', 8),
(9, 'Музей истории города Краматорска.', 8),
(10, 'Центральная городская публичная библиотека им. М. Горького.', 9),
(11, 'Арт-кафе фиеста.', 10),
(12, 'Блюминг, стадион в Краматорске', 11),
(13, 'Авангард, стадион в Краматорске.', 12);

-- --------------------------------------------------------

--
-- Table structure for table `social_networks`
--

CREATE TABLE `social_networks` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `social_network_id` int(10) UNSIGNED NOT NULL COMMENT 'social network list',
  `company_network_url` varchar(255) NOT NULL COMMENT 'company''s social network'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `social_networks`:
--   `company_id`
--       `companies` -> `id`
--   `social_network_id`
--       `social_networks_list` -> `id`
--

--
-- Dumping data for table `social_networks`
--

INSERT INTO `social_networks` (`company_id`, `social_network_id`, `company_network_url`) VALUES
(1, 1, 'webcity.com');

-- --------------------------------------------------------

--
-- Table structure for table `social_networks_list`
--

CREATE TABLE `social_networks_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `network` varchar(255) NOT NULL COMMENT 'network''s name',
  `network_url` varchar(255) NOT NULL COMMENT 'network''s url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `social_networks_list`:
--

--
-- Dumping data for table `social_networks_list`
--

INSERT INTO `social_networks_list` (`id`, `network`, `network_url`) VALUES
(1, 'Reserved', 'reserved.com'),
(2, 'Facebook', 'fb.com'),
(3, 'Twitter', 'https://twitter.com/');

-- --------------------------------------------------------

--
-- Table structure for table `telephone_numbers`
--

CREATE TABLE `telephone_numbers` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `telephone` varchar(13) NOT NULL COMMENT 'tel number'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `telephone_numbers`:
--   `company_id`
--       `companies` -> `id`
--

--
-- Dumping data for table `telephone_numbers`
--

INSERT INTO `telephone_numbers` (`company_id`, `telephone`) VALUES
(1, '+380954495475'),
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL COMMENT 'login',
  `hash` varchar(255) NOT NULL COMMENT 'password''s hash',
  `email` varchar(255) NOT NULL COMMENT '@',
  `picture_url` varchar(255) DEFAULT NULL COMMENT 'avatar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for users';

--
-- RELATIONSHIPS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
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
-- Table structure for table `users_companies`
--

CREATE TABLE `users_companies` (
  `id_user` int(10) UNSIGNED NOT NULL COMMENT 'user''s id from "users"',
  `id_company` int(10) UNSIGNED NOT NULL COMMENT 'company''s id from "company'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='connect users and companies';

--
-- RELATIONSHIPS FOR TABLE `users_companies`:
--   `id_company`
--       `companies` -> `id`
--   `id_user`
--       `users` -> `id`
--

--
-- Dumping data for table `users_companies`
--

INSERT INTO `users_companies` (`id_user`, `id_company`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`category_name`),
  ADD KEY `subcategory_id` (`parent_id`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category_name` (`category_name`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`company_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `event_company`
--
ALTER TABLE `event_company`
  ADD UNIQUE KEY `INDEX_NAME` (`event_id`,`company_id`),
  ADD KEY `company_key` (`company_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id_2` (`event_id`,`picture_url`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_id_2` (`location_id`);

--
-- Indexes for table `social_networks`
--
ALTER TABLE `social_networks`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `social_network_id` (`social_network_id`);

--
-- Indexes for table `social_networks_list`
--
ALTER TABLE `social_networks_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`login`);

--
-- Indexes for table `users_companies`
--
ALTER TABLE `users_companies`
  ADD UNIQUE KEY `User_unique` (`id_user`),
  ADD KEY `id_company` (`id_company`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `social_networks_list`
--
ALTER TABLE `social_networks_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_company`
--
ALTER TABLE `event_company`
  ADD CONSTRAINT `company_key` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `event_key` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `place_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Constraints for table `social_networks`
--
ALTER TABLE `social_networks`
  ADD CONSTRAINT `social_network_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_network_list` FOREIGN KEY (`social_network_id`) REFERENCES `social_networks_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD CONSTRAINT `telephone_numbers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `users_companies`
--
ALTER TABLE `users_companies`
  ADD CONSTRAINT `company_id_companies` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `user_id_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
