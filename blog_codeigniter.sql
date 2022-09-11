-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Jun-2021 às 04:05
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `blog_codeigniter`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `titulo`) VALUES
(1, 'Cinema'),
(2, 'Animais'),
(3, 'Comidas'),
(4, 'Viagens'),
(5, 'Novidades'),
(6, 'tesarar'),
(7, 'Esportes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_session`
--

CREATE TABLE `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('2ni77eijr5pnl5ti5vn5l0gg2b9cqle5', '::1', 1622664524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323636343532343b),
('3e3oq2qoqgic61bois93lc2cankgcupq', '::1', 1622662728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323636323732333b),
('btvd0n7beu8331lo57g0s73gnvlm4ak9', '::1', 1622394796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323339343532333b757365726c6f6761646f7c4e3b6c6f6761646f7c623a303b),
('c0jsk5teth0kt3df2buttkiso5ce4d61', '::1', 1622394523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323339343532313b),
('d81ttp9f34g6smkt1r8c4ertiner88m2', '::1', 1622663373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323636333336353b757365726c6f6761646f7c4e3b6c6f6761646f7c623a303b),
('k0trhji55nl20k5b0ga9imumqof3tegq', '::1', 1622674470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632323637343437303b),
('kjr3d6thm1t9sk0q3mlb0apscisma85h', '::1', 1623094965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632333039343831303b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagens`
--

CREATE TABLE `postagens` (
  `id` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `subtitulo` varchar(150) NOT NULL,
  `conteudo` longtext NOT NULL,
  `data` datetime NOT NULL,
  `img` longtext NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `postagens`
--

INSERT INTO `postagens` (`id`, `categoria`, `titulo`, `subtitulo`, `conteudo`, `data`, `img`, `user`) VALUES
(2, 1, 'Ut consectetur lacus augue, tincidunt finibus nulla convallis eget', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 16:14:36', '', 1),
(3, 4, 'Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem', 'Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus', '<p>Sed velit ex, sodales nec aliquet sed, imperdiet ac justo. Vestibulum gravida lacus eu turpis interdum cursus. Morbi ultricies libero sed nibh pulvinar elementum. Fusce vestibulum, orci quis laoreet lobortis, enim lorem sollicitudin augue, eu imperdiet eros neque id leo. In id enim ornare, bibendum tortor vitae, pellentesque nibh. Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo. Maecenas sit amet lectus vitae magna gravida dictum. Cras iaculis in augue eget sagittis. Maecenas gravida felis sed est bibendum, nec ultricies nunc porttitor.</p>\r\n\r\n<p>Curabitur pretium justo dui, non porta ante ultrices at. Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus vitae, posuere posuere ante. Nunc nec ligula facilisis, eleifend ipsum non, pulvinar nulla. Pellentesque pharetra at nulla eget elementum. Pellentesque vel tristique diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>', '2017-03-07 20:14:36', '', 1),
(4, 1, 'Curabitur eu mauris id neque ultricies feugiat a ut mi', 'Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-09 16:14:36', '', 1),
(5, 2, 'Animais - Vestibulum sed purus et mauris tempor posuere', 'Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo.', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 13:14:36', '', 1),
(6, 3, 'Curabitur eu mauris id neque ultricies feugiat a ut mi', 'Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo.', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-12 18:14:36', '', 1),
(7, 2, 'Animais - Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-08 16:14:36', '', 1),
(8, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Sed velit ex, sodales nec aliquet sed, imperdiet ac justo. Vestibulum gravida lacus eu turpis interdum cursus. Morbi ultricies libero sed nibh pulvinar elementum. Fusce vestibulum, orci quis laoreet lobortis, enim lorem sollicitudin augue, eu imperdiet eros neque id leo. In id enim ornare, bibendum tortor vitae, pellentesque nibh. Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo. Maecenas sit amet lectus vitae magna gravida dictum. Cras iaculis in augue eget sagittis. Maecenas gravida felis sed est bibendum, nec ultricies nunc porttitor.</p>\r\n\r\n<p>Curabitur pretium justo dui, non porta ante ultrices at. Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus vitae, posuere posuere ante. Nunc nec ligula facilisis, eleifend ipsum non, pulvinar nulla. Pellentesque pharetra at nulla eget elementum. Pellentesque vel tristique diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>', '2017-03-13 16:14:36', '1', 1),
(9, 2, 'Ut consectetur lacus augue, tincidunt finibus nulla convallis eget', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 18:14:36', '', 1),
(10, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Sed velit ex, sodales nec aliquet sed, imperdiet ac justo. Vestibulum gravida lacus eu turpis interdum cursus. Morbi ultricies libero sed nibh pulvinar elementum. Fusce vestibulum, orci quis laoreet lobortis, enim lorem sollicitudin augue, eu imperdiet eros neque id leo. In id enim ornare, bibendum tortor vitae, pellentesque nibh. Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo. Maecenas sit amet lectus vitae magna gravida dictum. Cras iaculis in augue eget sagittis. Maecenas gravida felis sed est bibendum, nec ultricies nunc porttitor.</p>\r\n\r\n<p>Curabitur pretium justo dui, non porta ante ultrices at. Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus vitae, posuere posuere ante. Nunc nec ligula facilisis, eleifend ipsum non, pulvinar nulla. Pellentesque pharetra at nulla eget elementum. Pellentesque vel tristique diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>', '2017-03-09 16:14:36', '', 1),
(11, 5, 'Ut consectetur lacus augue, tincidunt finibus nulla convallis eget', 'Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo.', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-13 17:14:36', '', 2),
(12, 5, 'Curabitur eu mauris id neque ultricies feugiat a ut mi', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 16:14:36', '', 1),
(13, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-07 16:14:36', '', 1),
(14, 2, 'Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem', 'Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 16:14:36', '', 1),
(15, 1, 'Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem', 'Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo.', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-10 18:14:36', '', 1),
(16, 1, 'Sed velit ex, sodales nec aliquet sed, imperdiet ac justo', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Sed velit ex, sodales nec aliquet sed, imperdiet ac justo. Vestibulum gravida lacus eu turpis interdum cursus. Morbi ultricies libero sed nibh pulvinar elementum. Fusce vestibulum, orci quis laoreet lobortis, enim lorem sollicitudin augue, eu imperdiet eros neque id leo. In id enim ornare, bibendum tortor vitae, pellentesque nibh. Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo. Maecenas sit amet lectus vitae magna gravida dictum. Cras iaculis in augue eget sagittis. Maecenas gravida felis sed est bibendum, nec ultricies nunc porttitor.</p>\r\n\r\n<p>Curabitur pretium justo dui, non porta ante ultrices at. Duis finibus, felis semper suscipit convallis, orci ante eleifend lectus, ac pharetra ipsum risus in elit. Vestibulum enim turpis, suscipit eget lacus vitae, posuere posuere ante. Nunc nec ligula facilisis, eleifend ipsum non, pulvinar nulla. Pellentesque pharetra at nulla eget elementum. Pellentesque vel tristique diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>', '2017-03-11 16:14:36', '', 1),
(17, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-12 13:14:37', '', 1),
(18, 2, 'Curabitur eu mauris id neque ultricies feugiat a ut mi', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem. Mauris at condimentum dolor. Curabitur eu mauris id neque ultricies feugiat a ut mi. Ut posuere faucibus nisl, sed sagittis tellus laoreet quis. Pellentesque molestie euismod tempus. Aliquam mattis, velit eget consequat maximus, mauris lectus scelerisque diam, eget volutpat ligula est fermentum odio. Vestibulum nisi libero, malesuada ut congue vel, efficitur sit amet mi. Cras pellentesque egestas volutpat. Aliquam venenatis ullamcorper felis nec cursus. Praesent lacinia laoreet ante, et hendrerit nisi. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Ut consectetur lacus augue, tincidunt finibus nulla convallis eget. Donec rutrum aliquam quam at ultricies. Maecenas at dignissim ex, nec semper urna. Nunc id lacus vel nisl mollis auctor. Etiam vulputate gravida porttitor. Quisque at lobortis quam, id pulvinar nunc. Cras finibus, nisl eget pulvinar egestas, neque nibh sollicitudin velit, eget efficitur neque urna non justo. Sed vehicula non velit sed viverra. Vestibulum lacinia neque et mattis dictum. Sed rhoncus dapibus nisl id fringilla. Duis quis sagittis augue. Morbi accumsan tellus ipsum, et vulputate lectus sagittis quis. Mauris eu sem justo.</p>\r\n\r\n<p>Phasellus quis vehicula tortor. Vestibulum sed purus et mauris tempor posuere. Vivamus vel commodo ipsum. Donec a tristique tellus. In lobortis, tortor et rhoncus rhoncus, metus libero mollis sem, id tincidunt ipsum tortor ut eros. Nullam faucibus, turpis ut egestas interdum, mi risus eleifend dui, a mollis magna enim vel odio. In lobortis, erat et luctus lobortis, nulla neque imperdiet tellus, nec varius nisi lacus id dolor. Suspendisse tempus dictum dolor ac vestibulum. Fusce tincidunt eu ipsum varius ultricies. Donec commodo bibendum consequat. Suspendisse potenti. Nam in ultricies risus.</p>', '2017-03-10 16:14:36', '', 1),
(19, 4, 'Curabitur eu mauris id neque ultricies feugiat a ut mi', 'Donec odio neque, sodales eu nibh eget, posuere pharetra erat. Sed luctus felis ac risus gravida, ac condimentum diam commodo.', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 16:14:36', '', 1),
(20, 3, 'Nunc magna mauris, aliquam id dapibus et, egestas finibus lorem', 'Your not gonna be picking a fight, Dad, dad dad daddy-o. You\'re coming to a rescue, right? Okay, let\'s go', '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', '2017-03-11 14:14:36', '', 1),
(24, 2, 'Boa 22  fsfdsdffdsfsdf', 'BOa 22211111111111sdfsffsdfsdf', 'Boa  2222111111111 fsddfsfsdffsfsdfsf fdsdfsdfdsfs fsfsf dsff sdf f fsdfs    ', '2019-10-12 12:52:00', '1', 1),
(26, 7, 'Sao Paulo campeao Paulista', 'Acabou a zueira', ' Sao paulo com vitoria tranquila vence o palmeiras e quebra fila na busca do titulo, e se torna campeão do campeonato paulistao sicredi 2021 \r\n       ', '2021-05-26 20:00:00', '1', 6),
(27, 7, 'Guitta de volta no corinthians?', 'Goleiro da selecão de volta no brasil.....', ' Corinthians estuda volta de goleiro guitta para temporada 2022, mesmo com poucas possibilidades devido Guitta ter sido campeão da UEFA nesse ano, sera que Guitta volta??\r\n ', '2021-05-20 10:20:00', '1', 6),
(28, 7, 'Santos em crise?', 'Santos vai brigar esse ano para nao cair para a serie B?', ' Após vários desfalques com transferências e perda de jogadores, Santos joga hoje na libertadores com o seu comandado pelo seu auxiliar briga por vaga\r\n ', '2021-05-26 17:30:00', '1', 6),
(29, 7, 'Corinthians e sua má fase', 'Quem e o novo tecnico', ' Corinthians com dívida bilionária sofre para conseguir reforços para novo técnico Sylvinho que estará no comando do time na primeira rodada do brasileirao ', '2021-05-25 14:40:00', '1', 6),
(30, 7, 'Abel Ferreira na corda bamba.....', 'Apos perda do titulo contra o Sao Paulo tecnico do alviverde e chamado de ', ' Após perder 4 finais o técnico português fica em perigo no Palmeiras e reunião com a diretoria decidirá o seu futuro, sera que vai chegar o fim dos treinadores portugueses no brasil ', '2021-05-24 20:10:00', '1', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `img` int(11) DEFAULT NULL,
  `historico` longtext DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `senha` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `img`, `historico`, `user`, `senha`) VALUES
(1, 'Emerson Carvalho', 'teste@teste.vom.br', 1, '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p>', 'emerson', '202cb962ac59075b964b07152d234b70'),
(2, 'Jose Francisco da Silva', 'teste2@teste.com', 1, '<p>That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.</p> ', 'francisco2', 'caf1a3dfb505ffed0d024130f58c5cfa'),
(5, 'Ana Clara', 'teste2@teste.com.br', NULL, ' That\'s right, he\'s gonna be mayor. Whoa, they really cleaned this place up, looks brand new. My insurance, it\'s your car, your insurance should pay for it. Hey, I wanna know who\'s gonna pay for this? I spilled beer all over it when that car smashed into me. Who\'s gonna pay my cleaning bill? Yes, yes, I\'m George, George McFly, and I\'m your density. I mean, I\'m your destiny. It\'s uh, the other end of town, a block past Maple.\r\n\r\n', 'anaclara', '202cb962ac59075b964b07152d234b70'),
(6, 'Gabriel Martins', 'gabrielmatheus209@gmail.com', 1, 'Criador do Blog e amante de futebol e futsal  ', 'gabriel', '52acfa5a17ae9341b2dacae10f36cc03');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ci_session`
--
ALTER TABLE `ci_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Índices para tabela `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
