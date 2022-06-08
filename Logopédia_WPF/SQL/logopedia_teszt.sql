-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 04. 18:04
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `logopedia_teszt`
--
CREATE DATABASE IF NOT EXISTS `logopedia_teszt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `logopedia_teszt`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diagnozisok`
--

CREATE TABLE `diagnozisok` (
  `diagnozisID` int(11) NOT NULL,
  `tipusa` varchar(5) NOT NULL,
  `diagnozis_kodja` float DEFAULT NULL,
  `diagnozis_megnevezese` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `diagnozisok`
--

INSERT INTO `diagnozisok` (`diagnozisID`, `tipusa`, `diagnozis_kodja`, `diagnozis_megnevezese`) VALUES
(1, '', 0, ''),
(2, 'BTM-N', 0, 'Beilleszkedési nehézség'),
(3, 'BTM-N', 0, 'Tanulási nehézség'),
(4, 'BTM-N', 0, 'Magatartási nehézség'),
(5, 'SNI', 70, 'Enyhe mentális retardáció'),
(6, 'SNI', 71, 'Közepes mentális retardáció'),
(7, 'SNI', 72, 'Súlyos mentális retardáció'),
(8, 'SNI', 73, 'Igen súlyos mentális retardáció'),
(9, 'SNI', 78, 'Máshová nem osztott mentális retardáció'),
(10, 'SNI', 79, 'Mentális retardáció k.m.n.'),
(11, 'SNI', 80, 'A beszéd és beszédnyelv specifikus fejlődési rendellenességei'),
(12, 'SNI', 81, 'Az iskolai teljesítmény specifikus fejlődési rendellenessége'),
(13, 'SNI', 82, 'A motoros funkció specifikus fejlődési rendellenességei'),
(14, 'SNI', 83, 'Kevert specifikus fejlődési zavarok'),
(15, 'SNI', 84, 'Pervazív fejlődési zavarok'),
(16, 'SNI', 88, 'A pszichológiai fejlődés egyéb rendellenességei'),
(17, 'SNI', 89, 'A pszichológiai fejlődés rendellenességei k.m.n.'),
(18, 'SNI', 90, 'Hiperkinetikus zavarok'),
(19, 'SNI', 91, 'Magatartási zavarok'),
(20, 'SNI', 92, 'Kevert magatartási és emocionális zavarok'),
(21, 'SNI', 93, 'Jellegzetesen gyermekkorban kezdődő emocionális zavarok'),
(22, 'SNI', 94, 'A szocializáció jellegzetesen gyermek- és serdülőkorban kezdődő zavarai'),
(23, 'SNI', 95, 'Tic (zavar)'),
(24, 'SNI', 98, 'Egyéb, rendszerint gyermek- és serdülőkorban kezdődő viselkedési és emocionális rendellenességek'),
(25, 'SNI', 99, 'Másként nem meghatározott mentális rendellenesség');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `tesztID` int(11) NOT NULL,
  `oktatasi_azonosito` varchar(11) NOT NULL,
  `kitoltes_datuma` datetime NOT NULL,
  `aktualis_eletkor_honapban` int(11) DEFAULT NULL,
  `szokincs_pontszam` int(11) DEFAULT NULL,
  `szokincs_szint` varchar(30) DEFAULT NULL,
  `mondathasznalat_pontszam` int(11) DEFAULT NULL,
  `mondathasznalat_szint` varchar(30) DEFAULT NULL,
  `nyelvhasznalat_pontszam` int(11) DEFAULT NULL,
  `nyelvhasznalat_szint` varchar(30) DEFAULT NULL,
  `elmaradas_merteke` int(11) DEFAULT NULL,
  `terapiaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `eredmenyek`
--

INSERT INTO `eredmenyek` (`tesztID`, `oktatasi_azonosito`, `kitoltes_datuma`, `aktualis_eletkor_honapban`, `szokincs_pontszam`, `szokincs_szint`, `mondathasznalat_pontszam`, `mondathasznalat_szint`, `nyelvhasznalat_pontszam`, `nyelvhasznalat_szint`, `elmaradas_merteke`, `terapiaID`) VALUES
(1, '11111111111', '2021-04-20 00:28:02', 35, 40, 'megfelelő', 2, 'elmarad', 8, 'megfelelő', 0, 1),
(1, '11111111112', '2021-04-20 00:34:39', 31, 100, 'megfelelő', 10, 'megfelelő', 12, 'megfelelő', 1, 2),
(1, '11111111113', '2021-04-20 00:37:42', 32, 107, 'megfelelő', 12, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111114', '2021-04-20 00:40:19', 31, 74, 'megfelelő', 6, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111115', '2021-04-20 00:44:54', 35, 21, 'elmarad', 0, 'elmarad', 7, 'megfelelő', 2, 3),
(1, '11111111116', '2021-04-20 00:53:31', 38, 110, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111117', '2021-04-20 01:05:08', 37, 114, 'megfelelő', 5, 'elmarad', 10, 'megfelelő', 1, 2),
(1, '11111111118', '2021-04-20 01:09:04', 35, 114, 'megfelelő', 11, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111119', '2021-04-20 01:12:10', 34, 93, 'megfelelő', 11, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111120', '2021-04-20 01:16:32', 31, 98, 'megfelelő', 11, 'megfelelő', 9, 'megfelelő', 0, 11),
(1, '11111111121', '2021-04-20 01:24:32', 34, 106, 'megfelelő', 10, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111122', '2021-04-20 01:35:52', 40, 121, 'megfelelő', 11, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111123', '2021-04-20 01:45:43', 39, 113, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111124', '2021-04-20 01:50:04', 34, 124, 'megfelelő', 9, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111125', '2021-04-20 02:07:53', 34, 93, 'megfelelő', 11, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111126', '2021-04-20 02:25:39', 32, 101, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 11),
(1, '11111111127', '2021-04-20 02:56:24', 30, 123, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111128', '2021-04-20 02:57:59', 32, 28, 'elmarad', 0, 'elmarad', 7, 'megfelelő', 2, 3),
(1, '11111111129', '2021-04-20 03:32:57', 34, 87, 'megfelelő', 10, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111130', '2021-04-20 03:37:46', 35, 122, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111131', '2021-04-20 04:45:10', 38, 119, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111132', '2021-04-20 05:01:42', 33, 74, 'megfelelő', 9, 'megfelelő', 10, 'megfelelő', 0, 11),
(1, '11111111133', '2021-04-20 05:12:39', 34, 116, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111134', '2021-04-20 05:20:01', 38, 99, 'megfelelő', 11, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111135', '2021-04-20 05:32:20', 34, 73, 'megfelelő', 11, 'megfelelő', 9, 'megfelelő', 0, 1),
(1, '11111111136', '2021-04-20 05:32:24', 33, 122, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111137', '2021-04-20 05:37:11', 32, 102, 'megfelelő', 11, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111138', '2021-04-20 05:38:30', 39, 102, 'megfelelő', 11, 'megfelelő', 10, 'megfelelő', 0, 12),
(1, '11111111139', '2021-04-20 05:44:10', 33, 115, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111140', '2021-04-20 05:44:10', 33, 8, 'elmarad', 10, 'megfelelő', 3, 'elmarad', 2, 4),
(1, '11111111141', '2021-04-20 05:46:47', 33, 87, 'megfelelő', 9, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111142', '2021-04-20 05:59:17', 43, 106, 'megfelelő', 10, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111143', '2021-04-20 05:59:41', 33, 78, 'megfelelő', 12, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111144', '2021-04-20 06:00:49', 32, 124, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 12),
(1, '11111111145', '2021-04-20 06:08:49', 37, 114, 'megfelelő', 12, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111146', '2021-04-20 06:09:47', 39, 121, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111147', '2021-04-20 06:10:12', 42, 52, 'elmarad', 3, 'elmarad', 6, 'elmarad', 3, 5),
(1, '11111111148', '2021-04-20 06:16:15', 33, 103, 'megfelelő', 2, 'elmarad', 8, 'megfelelő', 1, 6),
(1, '11111111149', '2021-04-20 06:21:36', 30, 105, 'megfelelő', 10, 'megfelelő', 9, 'megfelelő', 0, 1),
(1, '11111111150', '2021-04-20 06:25:20', 33, 76, 'megfelelő', 5, 'elmarad', 9, 'megfelelő', 1, 6),
(1, '11111111151', '2021-04-20 06:29:16', 30, 99, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111152', '2021-04-20 06:33:59', 30, 87, 'megfelelő', 9, 'megfelelő', 9, 'megfelelő', 0, 1),
(1, '11111111153', '2021-04-20 06:39:35', 31, 118, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111154', '2021-04-20 06:43:30', 31, 116, 'megfelelő', 12, 'megfelelő', 9, 'megfelelő', 0, 1),
(1, '11111111155', '2021-04-20 06:44:57', 33, 71, 'megfelelő', 9, 'megfelelő', 7, 'megfelelő', 0, 1),
(1, '11111111156', '2021-04-20 06:48:23', 30, 66, 'megfelelő', 6, 'megfelelő', 10, 'megfelelő', 0, 12),
(1, '11111111157', '2021-04-20 06:48:59', 33, 82, 'megfelelő', 10, 'megfelelő', 9, 'megfelelő', 0, 1),
(1, '11111111158', '2021-04-20 06:51:14', 35, 101, 'megfelelő', 8, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111159', '2021-04-20 06:52:12', 32, 114, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111160', '2021-04-20 06:52:53', 29, 4, 'elmarad', 0, 'elmarad', 1, 'elmarad', 3, 5),
(1, '11111111161', '2021-04-20 07:00:19', 29, 68, 'megfelelő', 9, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111162', '2021-04-20 07:04:05', 26, 98, 'megfelelő', 12, 'megfelelő', 7, 'megfelelő', 0, 13),
(1, '11111111163', '2021-04-20 07:07:16', 29, 124, 'megfelelő', 7, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111164', '2021-04-20 07:08:00', 33, 10, 'megfelelő', 12, 'megfelelő', 2, 'elmarad', 1, 7),
(1, '11111111165', '2021-04-20 07:11:35', 30, 98, 'megfelelő', 5, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111166', '2021-04-20 07:22:52', 37, 75, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111167', '2021-04-20 07:26:45', 33, 68, 'megfelelő', 2, 'elmarad', 6, 'megfelelő', 1, 7),
(1, '11111111168', '2021-04-20 07:29:46', 42, 122, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 13),
(1, '11111111169', '2021-04-20 07:36:30', 37, 116, 'megfelelő', 10, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111170', '2021-04-20 07:43:48', 30, 124, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111171', '2021-04-20 08:06:01', 27, 15, 'elmarad', 4, 'megfelelő', 4, 'megfelelő', 1, 7),
(1, '11111111172', '2021-04-20 08:10:33', 36, 123, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111173', '2021-04-20 08:11:18', 30, 124, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111174', '2021-04-20 08:17:01', 39, 124, 'megfelelő', 12, 'megfelelő', 12, 'megfelelő', 0, 1),
(1, '11111111175', '2021-04-20 08:20:51', 37, 74, 'megfelelő', 10, 'megfelelő', 9, 'megfelelő', 0, 13),
(1, '11111111176', '2021-04-20 08:21:54', 30, 119, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111177', '2021-04-20 08:30:25', 39, 122, 'megfelelő', 11, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111178', '2021-04-20 08:30:57', 37, 100, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111179', '2021-04-20 08:33:35', 40, 100, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111180', '2021-04-20 08:36:11', 39, 124, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111181', '2021-04-20 08:37:17', 36, 124, 'megfelelő', 0, 'megfelelő', 13, 'megfelelő', 0, 14),
(1, '11111111182', '2021-04-20 08:45:37', 34, 98, 'megfelelő', 10, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111183', '2021-04-20 08:50:16', 37, 98, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111184', '2021-04-20 08:50:47', 30, 105, 'megfelelő', 11, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111185', '2021-04-20 08:54:41', 34, 59, 'megfelelő', 5, 'elmarad', 5, 'megfelelő', 1, 8),
(1, '11111111186', '2021-04-20 09:03:10', 30, 124, 'megfelelő', 12, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111187', '2021-04-20 09:04:14', 34, 107, 'megfelelő', 11, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111188', '2021-04-20 09:07:15', 25, 114, 'megfelelő', 11, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111189', '2021-04-20 09:13:49', 30, 124, 'megfelelő', 9, 'megfelelő', 8, 'megfelelő', 0, 1),
(1, '11111111190', '2021-04-20 09:13:54', 39, 120, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111191', '2021-04-20 09:17:10', 41, 100, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 1),
(1, '11111111192', '2021-04-20 09:22:52', 31, 102, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 14),
(1, '11111111193', '2021-04-20 09:23:39', 32, 107, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1),
(1, '11111111194', '2021-04-20 09:24:45', 39, 116, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111195', '2021-04-20 09:25:09', 30, 124, 'megfelelő', 6, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111196', '2021-04-20 09:26:19', 36, 110, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 1),
(1, '11111111197', '2021-04-20 09:28:06', 32, 124, 'megfelelő', 12, 'megfelelő', 13, 'megfelelő', 0, 14),
(1, '11111111198', '2021-04-20 09:29:40', 36, 65, 'megfelelő', 10, 'megfelelő', 6, 'elmarad', 1, 8),
(1, '11111111199', '2021-04-20 09:29:45', 27, 26, 'megfelelő', 0, 'elmarad', 0, 'elmarad', 2, 9),
(1, '11111111200', '2021-04-20 09:29:47', 35, 119, 'megfelelő', 11, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111201', '2021-04-20 09:30:31', 29, 31, 'megfelelő', 2, 'elmarad', 2, 'megfelelő', 1, 10),
(1, '11111111202', '2021-04-20 09:34:21', 32, 79, 'megfelelő', 12, 'megfelelő', 4, 'megfelelő', 0, 15),
(1, '11111111203', '2021-04-20 09:36:54', 33, 107, 'megfelelő', 12, 'megfelelő', 10, 'megfelelő', 0, 15),
(1, '11111111204', '2021-04-20 09:38:41', 32, 89, 'megfelelő', 8, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111205', '2021-04-20 09:38:47', 32, 89, 'megfelelő', 8, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111206', '2021-04-20 09:48:26', 32, 114, 'megfelelő', 12, 'megfelelő', 14, 'megfelelő', 0, 1),
(1, '11111111207', '2021-04-20 09:51:39', 35, 92, 'megfelelő', 6, 'megfelelő', 6, 'megfelelő', 0, 1),
(1, '11111111208', '2021-04-20 09:53:08', 31, 112, 'megfelelő', 0, 'elmarad', 11, 'megfelelő', 1, 10),
(1, '11111111209', '2021-04-20 09:54:24', 31, 88, 'megfelelő', 1, 'elmarad', 6, 'megfelelő', 1, 10),
(1, '11111111210', '2021-04-20 09:54:48', 31, 118, 'megfelelő', 12, 'megfelelő', 11, 'megfelelő', 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyerekek`
--

CREATE TABLE `gyerekek` (
  `oktatasi_azonosito` varchar(11) NOT NULL,
  `gyerek_neve` varchar(60) NOT NULL,
  `szul_hely` varchar(30) NOT NULL,
  `szul_ido` date NOT NULL,
  `anyja_neve` varchar(60) NOT NULL,
  `elerhetosegID` int(11) NOT NULL,
  `ovodaID` int(11) DEFAULT NULL,
  `diagnozisID` int(11) DEFAULT NULL,
  `diagnozis_adas_datuma` date DEFAULT NULL,
  `logopediai_ellatas_kell_e` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `gyerekek`
--

INSERT INTO `gyerekek` (`oktatasi_azonosito`, `gyerek_neve`, `szul_hely`, `szul_ido`, `anyja_neve`, `elerhetosegID`, `ovodaID`, `diagnozisID`, `diagnozis_adas_datuma`, `logopediai_ellatas_kell_e`) VALUES
('11111111111', 'Nyiraty Zoé', 'Szeged', '2018-05-04', 'Alap Anett', 1, 1, 1, NULL, 0x30),
('11111111112', 'Pénzes Benjámin', 'Szeged', '2018-09-29', 'Apró Anikó', 2, 1, 1, NULL, 0x31),
('11111111113', 'Kovács Tamás', 'Szeged', '2018-08-30', 'Bata Bettina', 3, 2, 1, NULL, 0x30),
('11111111114', 'Rupp Ardó', 'Szeged', '2018-09-02', 'Boros Berta', 4, 14, 1, NULL, 0x30),
('11111111115', 'Juhász Bende Norbert', 'Szeged', '2018-05-18', 'Bárány Bianka', 5, 3, 16, '2018-01-04', 0x31),
('11111111116', 'Kovács Emma', 'Budapest', '2018-02-21', 'Colos Cecil', 6, 3, 1, NULL, 0x30),
('11111111117', 'Ördögh Natália', 'Szeged', '2018-03-21', 'Cérna Cintia', 7, 4, 1, NULL, 0x31),
('11111111118', 'Nagy Lara Hanna', 'Szeged', '2018-05-24', 'Dobos Diána', 8, 4, 1, NULL, 0x30),
('11111111119', 'Gazdag Ádám', 'Szeged', '2018-06-19', 'Kovács Laura', 9, 5, 1, NULL, 0x30),
('11111111120', 'Buborék Bella', 'Hódmezővásárhely', '2018-09-30', 'Kiss Ilona', 10, 5, 3, '2019-10-12', 0x31),
('11111111121', 'Nagy Olívia', 'Budapest', '2018-06-29', 'Józsa Ágnes', 11, 1, 1, NULL, 0x30),
('11111111122', 'Jammeh Zília', 'Szekszárd', '2017-12-20', 'Vadaszánsz Emília', 12, 2, 1, NULL, 0x30),
('11111111123', 'Oláh Levente', 'Szeged', '2018-01-25', 'Tóth Katalin', 13, 3, 1, NULL, 0x30),
('11111111124', 'Szilágyi Szofi ', 'Szeged', '2018-06-10', 'Varga Katalin', 14, 4, 1, NULL, 0x30),
('11111111125', 'Nagy Viktória ', 'Szeged', '2018-06-22', 'Lázár Katalin', 15, 5, 1, NULL, 0x30),
('11111111126', 'Vas Gellért', 'Szeged', '2018-08-15', 'Nagy Kitti', 16, 1, 4, '2020-06-21', 0x31),
('11111111127', 'Goda Attila', 'Szeged', '2018-10-10', 'Juhász Kitti', 17, 1, 1, NULL, 0x30),
('11111111128', 'Kocsis Bence', 'Szeged', '2018-08-26', 'László Klaudia', 18, 1, 1, NULL, 0x31),
('11111111129', 'Kovács Emma', 'Szeged', '2018-06-21', 'Kis Liliána', 19, 2, 1, NULL, 0x30),
('11111111130', 'Bodó-Hanák Adél ', 'Szeged', '2018-05-07', 'Kovács Anett', 20, 11, 11, NULL, 0x30),
('11111111131', 'Kókai Marcell', 'Watford', '2018-02-01', 'Kósa Anikó', 21, 2, 1, NULL, 0x30),
('11111111132', 'Lázár Soma', 'Szeged', '2018-07-21', 'László Bettina', 22, 3, 11, '2020-04-08', 0x31),
('11111111133', 'Demeter Iván', 'Szeged', '2018-01-10', 'Juhász Anita', 23, 3, 1, NULL, 0x30),
('11111111134', 'Sándor Nimród', 'Szeged', '2018-02-21', 'Kiss Anita', 24, 3, 1, NULL, 0x30),
('11111111135', 'Márk Luca', 'Szeged', '2018-06-21', 'Nagy Anita', 25, 4, 1, NULL, 0x30),
('11111111136', 'Bencze Hunor János ', 'Szeged', '2018-07-16', 'Juhász Anikó', 26, 4, 1, NULL, 0x30),
('11111111137', 'Varga Zsófia', 'Szeged', '2018-08-06', 'Lázár Anikó', 27, 4, 1, NULL, 0x30),
('11111111138', 'Bodor-Bródi Alíz', 'Szeged', '2018-01-01', 'Nagy Valentína', 28, 5, 14, '2021-02-11', 0x31),
('11111111139', 'Bakaity Gábor', 'Makó', '2018-07-12', 'Mezei Kitti', 29, 5, 1, NULL, 0x30),
('11111111140', 'Kránicz Vanda', 'Hódmezővásárhely', '2018-07-14', 'Nagy Regina', 30, 5, 1, NULL, 0x31),
('11111111141', 'Stefán Flóra', 'Szeged', '2018-07-30', 'Kiss Virág', 31, 1, 1, NULL, 0x30),
('11111111142', 'Tóth Marcell', 'Szeged', '2017-09-26', 'Nagy Virág', 32, 2, 1, NULL, 0x30),
('11111111143', 'Kovács-Szép Liliána', 'Szeged', '2018-07-29', 'Juhász Virág', 33, 3, 1, NULL, 0x30),
('11111111144', 'Ördögh Zoltán Benett ', 'Szeged', '2018-08-12', 'Herczeg Ágota', 34, 4, 2, '2019-12-03', 0x31),
('11111111145', 'Bán Bence', 'Makó', '2018-03-17', 'Juhász Ágota', 35, 5, 1, NULL, 0x30),
('11111111146', 'Bálind Laura', 'Szeged', '2018-01-29', 'Koós Laura', 36, 1, 1, NULL, 0x30),
('11111111147', 'Lovászi Milán Gergő', 'Szeged', '2017-10-13', 'Tóth Fanni', 37, 3, 1, NULL, 0x31),
('11111111148', 'Kónya Bence ', 'Szeged', '2018-07-18', 'Tóth Mariann', 38, 1, 1, NULL, 0x31),
('11111111149', 'Hatala Zsombor Ádám', 'Szeged', '2018-10-26', 'Kásás Mariann', 39, 4, 1, NULL, 0x30),
('11111111150', 'Palatinus Andrea', 'Szeged', '2018-07-09', 'Kásás Kitti', 40, 1, 3, '2020-07-27', 0x31),
('11111111151', 'Nagy Boglárka', 'Szeged', '2018-10-22', 'Nagy Mirabella', 41, 5, 1, NULL, 0x30),
('11111111152', 'Börcsök Ignác ', 'Szeged', '2018-10-19', 'Lázár Mirella', 42, 1, 1, NULL, 0x30),
('11111111153', 'Dankó Gréta Elizabet ', 'Szeged', '2018-09-01', 'Juhász Annamária', 43, 2, 1, NULL, 0x30),
('11111111154', 'Dönczi Vanessza Amira ', 'Hódmezővásárhely', '2018-09-24', 'Kis Alexandra', 44, 3, 1, NULL, 0x30),
('11111111155', 'Palatinus Andrea ', 'Szeged', '2018-07-09', 'Lehóczki Zsanett', 45, 20, 1, NULL, 0x30),
('11111111156', 'Takács Nimród', 'Szeged', '2018-10-30', 'Lehőcz Gizella', 46, 4, 14, '2018-11-30', 0x31),
('11111111157', 'Piri Fruzsina Natália', 'Szeged', '2018-07-30', 'Nagy Veronika', 47, 2, 1, NULL, 0x30),
('11111111158', 'Komáromi Dominik', 'Szeged', '2018-05-21', 'Kisnemes Alexandra', 48, 5, 1, NULL, 0x30),
('11111111159', 'Árokszállási Balázs', 'Szeged', '2018-08-17', 'Varga Imola', 49, 3, 1, NULL, 0x30),
('11111111160', 'Kovács Lídia', 'Hódmezővásárhely', '2018-11-22', 'Varga Emőke', 50, 4, 1, NULL, 0x31),
('11111111161', 'Palatinus Andrea', 'Szeged', '2018-07-09', 'Varga Lilána', 51, 3, 1, NULL, 0x30),
('11111111162', 'Vass Emma ', 'Szeged', '2019-02-22', 'Kis Emőke', 52, 5, 3, '2021-02-28', 0x31),
('11111111163', 'Czinege Levente', 'Szeged', '2018-11-28', 'Nagy Liliána', 53, 3, 1, NULL, 0x30),
('11111111164', 'Kránicz Vanda', 'Hódmezővásárhely', '2018-07-14', 'Juhász Magdolna', 54, 2, 1, NULL, 0x31),
('11111111165', 'Bokányi Panka Boglárka', 'Szeged', '2018-10-02', 'Kiss Nóra', 55, 5, 1, NULL, 0x30),
('11111111166', 'Polyák Szofi ', 'Szeged', '2018-03-22', 'Ambrus Kitti', 56, 4, 1, NULL, 0x30),
('11111111167', 'Csizmadia Pál László', 'Szeged', '2018-07-13', 'Ambrus Liliána', 57, 5, 1, NULL, 0x31),
('11111111168', 'Adorjányi Eszter Erzsébet ', 'Szeged', '2017-09-06', 'Kovács Emőke', 58, 3, 3, '2020-08-21', 0x31),
('11111111169', 'Csanádi Áron', 'Szeged', '2018-03-02', 'Kovács Franciska', 59, 5, 1, NULL, 0x30),
('11111111170', 'Rapcsák Zsolna', 'Szeged', '2018-09-30', 'Varga Veronika', 60, 2, 1, NULL, 0x30),
('11111111171', 'Laczi Hunor', 'Szeged', '2019-01-22', 'Varga Irén', 61, 5, 11, '2019-10-16', 0x31),
('11111111172', 'Magyar Réka', 'Szeged', '2018-04-11', 'Nagy Irén', 62, 1, 1, NULL, 0x30),
('11111111173', 'Kàprai Kinga', 'Szeged', '2018-09-26', 'Kiss Irén', 63, 4, 1, NULL, 0x30),
('11111111174', 'TEISZL ISTVÁN', 'Szeged', '2018-01-10', 'Juhász Emőke', 64, 1, 1, NULL, 0x30),
('11111111175', 'Jung Janka', 'Szeged', '2018-03-18', 'Kiss Emőke', 65, 4, 14, '2020-09-01', 0x31),
('11111111176', 'Augusztinyi Adél', 'Szeged', '2018-09-25', 'Varga Emőke', 66, 2, 1, NULL, 0x30),
('11111111177', 'Daróczi Zalán', 'Szeged', '2018-01-16', 'Boros Luca', 67, 3, 1, NULL, 0x30),
('11111111178', 'Kotroczó Alexandra', 'Szeged', '2018-03-29', 'Boros Fanni', 68, 4, 1, NULL, 0x30),
('11111111179', 'Kis Vencel', 'Szeged', '2017-12-02', 'Boros Emőke', 69, 5, 1, NULL, 0x30),
('11111111180', 'Lovász Ákos', 'Szeged', '2018-01-17', 'László Kitti', 70, 1, 1, NULL, 0x30),
('11111111181', 'Hegedűs-Bite Kamilla', 'Szeged', '2018-04-16', 'László Szilvia', 71, 1, 3, '2019-11-14', 0x31),
('11111111182', 'Fogas Petra', 'Szeged', '2018-05-03', 'László Emőke', 72, 2, 1, NULL, 0x30),
('11111111183', 'Szanka Roland ', 'Svendborg', '2018-03-11', 'Horváth Gizella', 73, 3, 1, NULL, 0x30),
('11111111184', 'Mityók Boglárka ', 'Szeged', '2018-09-30', 'Horváth Laura', 74, 4, 1, NULL, 0x30),
('11111111185', 'Farkas Ingrid Virág', 'Szeged', '2018-06-25', 'Németh Ágota', 75, 4, 1, NULL, 0x31),
('11111111186', 'Debrey Attila Zalán', 'Szeged', '2018-10-13', 'Németh Liliána', 76, 5, 1, NULL, 0x30),
('11111111187', 'Czene Márti', 'Szeged', '2018-06-13', 'Horváth Violetta', 77, 2, 1, NULL, 0x30),
('11111111188', 'Kóczi Zalán', 'Szeged', '2019-03-28', 'Vass Alexandra', 78, 2, 1, NULL, 0x30),
('11111111189', 'Hartai Barna', 'Szeged', '2018-10-04', 'Vass Violetta', 79, 3, 1, NULL, 0x30),
('11111111190', 'Kozári Panni', 'Szeged', '2016-11-22', 'Vass Zoé', 80, 4, 1, NULL, 0x30),
('11111111191', 'Nemes Dóra ', 'Szeged', '2017-11-28', 'Németh Zoé', 81, 4, 1, NULL, 0x30),
('11111111192', 'Kozári Olivér', 'Szeged', '2018-09-16', 'Németh Franciska', 82, 5, 2, '2018-04-01', 0x31),
('11111111193', 'Farkas Bence Zénó', 'Szeged', '2018-08-17', 'Horváth Zoé', 83, 1, 1, NULL, 0x30),
('11111111194', 'Pataki Nolen', 'Szeged', '2018-01-29', 'Horváth Franciska', 84, 2, 1, NULL, 0x30),
('11111111195', 'Hartai Robin', 'Szeged', '2018-10-04', 'Józsa Laura', 85, 3, 1, NULL, 0x30),
('11111111196', 'Ferró Zalán ', 'Szeged', '2018-04-15', 'Zimányi Klaudia', 86, 4, 1, NULL, 0x30),
('11111111197', 'Pénzes Panka Róza', 'Szeged', '2018-08-01', 'Horváth Linda', 87, 5, 3, '2021-07-30', 0x31),
('11111111198', 'Lovas Ákos', 'Szeged', '2018-03-28', 'Németh Linda', 88, 5, 1, NULL, 0x31),
('11111111199', 'Márkus Viktória ', 'Szeged', '2019-01-30', 'Juhász Linda', 89, 4, 1, NULL, 0x31),
('11111111200', 'Szlobodnyik Zara', 'Szeged', '2018-05-06', 'Lehőcz Annamária', 90, 3, 1, NULL, 0x30),
('11111111201', 'Szabò Milla', 'Szeged', '2018-11-23', 'Tóth Anna', 91, 2, 1, NULL, 0x31),
('11111111202', 'Bernáth Zente Tamás', 'Szeged', '2018-08-10', 'Kovács Anna', 92, 1, 11, '2020-05-26', 0x31),
('11111111203', 'Herédi-Szabó Edmond Ede', 'Szeged', '2018-07-03', 'Lázár Anna', 93, 1, 14, '2021-03-10', 0x31),
('11111111204', 'Bartos Darinka', 'Szeged', '2018-08-06', 'Horváth Anna', 94, 3, 1, NULL, 0x30),
('11111111205', 'Bartos Darinka', 'Szeged', '2018-08-06', 'Németh Anna', 95, 2, 1, NULL, 0x30),
('11111111206', 'Osztroluczki Ábel', 'Szeged', '2018-08-24', 'Lázár Nóra', 96, 4, 1, NULL, 0x30),
('11111111207', 'Szabó Jázmin', 'Kelheim', '2018-05-22', 'Kovács Noémi', 97, 3, 1, NULL, 0x30),
('11111111208', 'Cser Anna', 'Szeged', '2018-09-28', 'Németh Noémi', 98, 5, 1, NULL, 0x31),
('11111111209', 'Csorba Zalán', 'Szeged', '2018-09-26', 'Horváth Bianka', 99, 4, 1, NULL, 0x31),
('11111111210', 'Horvàth-Czakó Henrik', 'Szeged', '2018-09-27', 'Kiss Bianka', 100, 1, 1, NULL, 0x30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyerek_elerhetosegek`
--

CREATE TABLE `gyerek_elerhetosegek` (
  `elerhetosegID` int(11) NOT NULL,
  `gondviselő_neve` varchar(60) NOT NULL,
  `gondviselo_telefonszam` varchar(17) NOT NULL,
  `gondviselo_email` varchar(50) NOT NULL,
  `gondviselo_lakcim` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `gyerek_elerhetosegek`
--

INSERT INTO `gyerek_elerhetosegek` (`elerhetosegID`, `gondviselő_neve`, `gondviselo_telefonszam`, `gondviselo_email`, `gondviselo_lakcim`) VALUES
(1, 'Alap Anett', '06301234578', 'szulo0001@kitalalt.hu', '6720 Szeged, Kiss utca 4.'),
(2, 'Apró Anikó', '06301234679', 'szulo0002@kitalalt.hu', '6728 Szeged, 19. utca 2.'),
(3, 'Bata Bettina', '06301345670', 'szulo0003@kitalalt.hu', '6728 Szeged, 48. utca 4.'),
(4, 'Boros Berta', '06301345671', 'szulo0004@kitalalt.hu', '6728 Szeged, Alma utca 8.'),
(5, 'Bárány Bianka', '06012345672', 'szulo0005@kitalalt.hu', '6728 Szeged, Alkotmány utca 141.'),
(6, 'Colos Cecil', '06312345673', 'szulo0006@kitalalt.hu', '6728 Szeged, 58. utca 2.'),
(7, 'Cérna Cintia', '06302345674', 'szulo0007@kitalalt.hu', '6726 Szeged, Alsókikötő sor 1416 1/3'),
(8, 'Dobos Diána', '06301345675', 'szulo0008@kitalalt.hu', '6720 Szeged, Arany János utca 9.'),
(9, 'Kovács Laura', '06312345676', 'szulo0009@kitalalt.hu', '6722 Szeged, Attila utca 9.'),
(10, 'Kiss Ilona', '06312345677', 'szulo00010@kitalalt.hu', '6726 Szeged, Back Bernát utca 8/a'),
(11, 'Józsa Ágnes', '06301245668', 'szulo00011@kitalalt.hu', '6724 Szeged, Bakay Nándor utca 25.'),
(12, 'Vadaszánsz Emília', '06301245669', 'szulo00012@kitalalt.hu', '6728 Szeged, Bakterház út 1.'),
(13, 'Tóth Katalin', '06301234560', 'szulo00013@kitalalt.hu', '6726 Szeged, Bal fasor 36.'),
(14, 'Varga Katalin', '06301234661', 'szulo00014@kitalalt.hu', '6722 Szeged, Battyányi utca 35/b'),
(15, 'Lázár Katalin', '06301345662', 'szulo00015@kitalalt.hu', '6722 Szeged, Bécsi krt. 17. 2/13.'),
(16, 'Nagy Kitti', '06301234563', 'szulo00016@kitalalt.hu', '6726 Szeged, Bérkert utca 29. fszt/2.'),
(17, 'Juhász Kitti', '06301245664', 'szulo00017@kitalalt.hu', '6721 Szeged, Bocskai utca 4. 1/6'),
(18, 'László Klaudia', '06312345665', 'szulo00018@kitalalt.hu', '6728 Szeged, Bognár utca 9.'),
(19, 'Kis Liliána', '06301345666', 'szulo00019@kitalalt.hu', '6725 Szeged, Boldogasszony sgt. 38. 1/3'),
(20, 'Kovács Anett', '06312345667', 'szulo00020@kitalalt.hu', '6721 Szeged, Brüsszeli krt. 18/a 4/14'),
(21, 'Kósa Anikó', '06301234658', 'szulo00021@kitalalt.hu', '6753 Szeged, Budai Nagy Antal utca 104.'),
(22, 'László Bettina', '06312345659', 'szulo00022@kitalalt.hu', '6728 Szeged, Budapesti út 1/a'),
(23, 'Juhász Anita', '06302345650', 'szulo00023@kitalalt.hu', '6723 Szeged, Csongrádi sgt. 75/a 3/7'),
(24, 'Kiss Anita', '06301345651', 'szulo00024@kitalalt.hu', '6723 Szeged, Kecskeméti utca 20/b 2/5'),
(25, 'Nagy Anita', '06302345652', 'szulo00025@kitalalt.hu', '6726 Szeged, Derkovics fasor 711'),
(26, 'Juhász Anikó', '03012345653', 'szulo00026@kitalalt.hu', '6728 Szeged, Házgyári út 3.'),
(27, 'Lázár Anikó', '03012345654', 'szulo00027@kitalalt.hu', '6728 Szeged, Erdőkerülő utca 4.'),
(28, 'Nagy Valentína', '06312345655', 'szulo00028@kitalalt.hu', '6725 Szeged, Farkas utca 6.'),
(29, 'Mezei Kitti', '06301345656', 'szulo00029@kitalalt.hu', '6725 Szeged, Felhő utca 11.'),
(30, 'Nagy Regina', '06302345657', 'szulo00030@kitalalt.hu', '6725 Szeged, Felső Tiszapart 1920 fszt/6'),
(31, 'Kiss Virág', '06302345648', 'szulo00031@kitalalt.hu', '6727 Szeged, Gábor Áron utca 87/a'),
(32, 'Nagy Virág', '06312345649', 'szulo00032@kitalalt.hu', '6724 Szeged, Gelei József utca 1.'),
(33, 'Juhász Virág', '63012345640', 'szulo00033@kitalalt.hu', '6722 Szeged, Gogol utca 8. 1/3'),
(34, 'Herczeg Ágota', '06301235641', 'szulo00034@kitalalt.hu', '6791 Szeged, Gyömbér utca 34.'),
(35, 'Juhász Ágota', '06301235642', 'szulo00035@kitalalt.hu', '6723 Szeged, Hajós utca 16/a'),
(36, 'Koós Laura', '06301234643', 'szulo00036@kitalalt.hu', '6725 Szeged, Harmat utca 24.'),
(37, 'Tóth Fanni', '06301235644', 'szulo00037@kitalalt.hu', '6726 Szeged, Hársfa sétány 18.'),
(38, 'Tóth Mariann', '06302345645', 'szulo00038@kitalalt.hu', '6724 Szeged, Hétvezér utca 42.'),
(39, 'Kásás Mariann', '06012345646', 'szulo00039@kitalalt.hu', '6726 Szeged, HoltMaros sétány 23/a'),
(40, 'Kásás Kitti', '06312345647', 'szulo00040@kitalalt.hu', '6720 Szeged, Horváth Mihály utca 8.'),
(41, 'Nagy Mirabella', '06301234538', 'szulo00041@kitalalt.hu', '6728 Szeged, Hosszútöltés út 68.'),
(42, 'Lázár Mirella', '06301234539', 'szulo00042@kitalalt.hu', '6710 Szeged, Hűvös köz 3/a'),
(43, 'Juhász Annamária', '06301345630', 'szulo00043@kitalalt.hu', '6791 Szeged, Izsóp utca 40.'),
(44, 'Kis Alexandra', '06301235631', 'szulo00044@kitalalt.hu', '6726 Szeged, Jancsó Miklós utca 1.'),
(45, 'Lehóczki Zsanett', '06312345632', 'szulo00045@kitalalt.hu', '6723 Szeged, József Attila sgt. 57.'),
(46, 'Lehőcz Gizella', '06302345633', 'szulo00046@kitalalt.hu', '6721 Szeged, Juhász Gyula utca 6.'),
(47, 'Nagy Veronika', '06302345634', 'szulo00047@kitalalt.hu', '6726 Szeged, Júlia utca 20.'),
(48, 'Kisnemes Alexandra', '03012345635', 'szulo00048@kitalalt.hu', '6727 Szeged, Kapás utca 87.'),
(49, 'Varga Imola', '06301234566', 'szulo00049@kitalalt.hu', '6725 Szeged, Kaszás utca 19.'),
(50, 'Varga Emőke', '06201234578', 'szulo00050@kitalalt.hu', '6728 Szeged, Kereskedő köz 1.'),
(51, 'Varga Lilána', '06201235679', 'szulo00051@kitalalt.hu', '6720 Szeged, Kölcsey utca 12.'),
(52, 'Kis Emőke', '06201234570', 'szulo00052@kitalalt.hu', '6720 Szeged, Magyar Ede tér 2.'),
(53, 'Nagy Liliána', '06201345671', 'szulo00053@kitalalt.hu', '6720 Szeged, Korányi fasor 3.'),
(54, 'Juhász Magdolna', '06201245672', 'szulo00054@kitalalt.hu', '6724 Szeged, Körtöltés utca 1/f'),
(55, 'Kiss Nóra', '06201234563', 'szulo00055@kitalalt.hu', '6724 Szeged, Kossuth Lajos sgt. 75.'),
(56, 'Ambrus Kitti', '06201245674', 'szulo00056@kitalalt.hu', '6726 Szegedm Aranyműves köz 5.'),
(57, 'Ambrus Liliána', '06212345675', 'szulo00057@kitalalt.hu', '6727 Szeged, Műves út 98.'),
(58, 'Kovács Emőke', '06201245676', 'szulo00058@kitalalt.hu', '6726 Szeged, Rézöntő utca 63/b'),
(59, 'Kovács Franciska', '06201235677', 'szulo00059@kitalalt.hu', '6726 Szeged, Kékfestő utca 3.'),
(60, 'Varga Veronika', '06201234668', 'szulo00060@kitalalt.hu', '6726 Szeged, Lakatos utca 37.'),
(61, 'Varga Irén', '06201234569', 'szulo00061@kitalalt.hu', '6726 Szeged, Lőtér park 1.'),
(62, 'Nagy Irén', '06201234560', 'szulo00062@kitalalt.hu', '6726 Szeged, Bakterház út 7.'),
(63, 'Kiss Irén', '06201234661', 'szulo00063@kitalalt.hu', '6726 Szeged, Csizmadia köz 4.'),
(64, 'Juhász Emőke', '06202345662', 'szulo00064@kitalalt.hu', '6726 Szeged, Fegyverkovács utca 21.'),
(65, 'Kiss Emőke', '06201234663', 'szulo00065@kitalalt.hu', '6726 Szeged, Gombkötő utca 7.'),
(66, 'Varga Emőke', '06201245664', 'szulo00066@kitalalt.hu', '6726 Szeged, Gyertyaöntő utca 21.'),
(67, 'Boros Luca', '06201245665', 'szulo00067@kitalalt.hu', '6726 Szeged, Vincellér utca 78.'),
(68, 'Boros Fanni', '06202345666', 'szulo00068@kitalalt.hu', '6726 Szeged, Hársfa sétány 2.'),
(69, 'Boros Emőke', '06212345667', 'szulo00069@kitalalt.hu', '6726 Szeged, Jancsó Miklós utca 5.'),
(70, 'László Kitti', '06201234558', 'szulo00070@kitalalt.hu', '6726 Szeged, Lakatos utca 11.'),
(71, 'László Szilvia', '06201345659', 'szulo00071@kitalalt.hu', '6726 Szeged, Zengő utca 32.'),
(72, 'László Emőke', '06201234650', 'szulo00072@kitalalt.hu', '6728 Szeged, Macskázi út.'),
(73, 'Horváth Gizella', '06212345651', 'szulo00073@kitalalt.hu', '6771 Szeged, Máté utca 7.'),
(74, 'Horváth Laura', '06202345652', 'szulo00074@kitalalt.hu', '6728 Szeged, Merkúr út 36.'),
(75, 'Németh Ágota', '06202345653', 'szulo00075@kitalalt.hu', '6728 Szeged, Nádvágú út 98.'),
(76, 'Németh Liliána', '02012345654', 'szulo00076@kitalalt.hu', '6726 Szeged, Ötvös köz 1.'),
(77, 'Horváth Violetta', '06201234555', 'szulo00077@kitalalt.hu', '6753 Szeged, Porgány köz 65.'),
(78, 'Vass Alexandra', '06201234566', 'szulo00078@kitalalt.hu', '6728 Szeged, Pöröskéri út. 2.'),
(79, 'Vass Violetta', '06201234557', 'szulo00079@kitalalt.hu', '6726 Szeged, Purjesz Béla utca 3.'),
(80, 'Vass Zoé', '06201234648', 'szulo00080@kitalalt.hu', '6726 Szeged, Rézöntő utca 8.'),
(81, 'Németh Zoé', '06201345649', 'szulo00081@kitalalt.hu', '6728 Szeged, Szíjártó köz 7.'),
(82, 'Németh Franciska', '06202345640', 'szulo00082@kitalalt.hu', '6753 Szeged, Szilveszter köz 112.'),
(83, 'Horváth Zoé', '06201234641', 'szulo00083@kitalalt.hu', '6771 Szeged, Téglaégető dűlő 65.'),
(84, 'Horváth Franciska', '06201234642', 'szulo00084@kitalalt.hu', '6728 Szeged, Vállalkozó köz 78.'),
(85, 'Józsa Laura', '06201234543', 'szulo00085@kitalalt.hu', '6728 Szeged, Varjútövis sor 54.'),
(86, 'Zimányi Klaudia', '06202345644', 'szulo00086@kitalalt.hu', '6723 Szeged, Liszt utca 15/a'),
(87, 'Horváth Linda', '06201234645', 'szulo00087@kitalalt.hu', '6722 Szeged, Londoni krt. 28.'),
(88, 'Németh Linda', '06201234646', 'szulo00088@kitalalt.hu', '6726 Szeged, Lövölde út 191.'),
(89, 'Juhász Linda', '06201235647', 'szulo00089@kitalalt.hu', '6791 Szeged, Majális utca 19.'),
(90, 'Lehőcz Annamária', '06012345638', 'szulo00090@kitalalt.hu', '6724 Szeged, Makkoserdő sor 22.'),
(91, 'Tóth Anna', '06201234569', 'szulo00091@kitalalt.hu', '6724 Szeged, Mars tér 8.'),
(92, 'Kovács Anna', '06201235630', 'szulo00092@kitalalt.hu', '6771 Szeged, Máté utca 15.'),
(93, 'Lázár Anna', '06201235631', 'szulo00093@kitalalt.hu', '6728 Szeged, Napos út 1.'),
(94, 'Horváth Anna', '06202345632', 'szulo00094@kitalalt.hu', '6757 Szeged, Narancs utca 19.'),
(95, 'Németh Anna', '06202345633', 'szulo00095@kitalalt.hu', '6725 Szeged, Nemes Takács utca 27/b'),
(96, 'Lázár Nóra', '06201235634', 'szulo00096@kitalalt.hu', '6723 Szeged, Ortutay utca 2/c'),
(97, 'Kovács Noémi', '06201345635', 'szulo00097@kitalalt.hu', '6724 Szeged, Pöröséri út 2.'),
(98, 'Németh Noémi', '06202345636', 'szulo00098@kitalalt.hu', '6721 Szeged, Pusztaszeri utca 25/c'),
(99, 'Horváth Bianka', '06701235635', 'szulo00099@kitalalt.hu', '6723 Szeged, Retek utca 27.'),
(100, 'Kiss Bianka', '06701234636', 'szulo000100@kitalalt.hu', '6791 Szegedm Rügy utca 36.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ovodak`
--

CREATE TABLE `ovodak` (
  `ovodaID` int(11) NOT NULL,
  `ovoda_neve` varchar(100) NOT NULL,
  `ovoda_cime` varchar(100) NOT NULL,
  `ovoda_telszama` varchar(17) NOT NULL,
  `ovoda_email` varchar(50) NOT NULL,
  `ovoda_vezeto_neve` varchar(60) NOT NULL,
  `fenntarto` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `ovodak`
--

INSERT INTO `ovodak` (`ovodaID`, `ovoda_neve`, `ovoda_cime`, `ovoda_telszama`, `ovoda_email`, `ovoda_vezeto_neve`, `fenntarto`) VALUES
(1, 'Bahama Óvoda', '6721 Szeged, Teszt utca 4.', '06-62-111-111', 'ovoda1@teszt.com', 'Jakab Janka', 'önkormányzat'),
(2, 'Cuki Óvoda', '6722 Szeged, Teszt út 63.', '06-62-111-112', 'ovoda2@teszt.com', 'Kotroczó Katalin', 'egyház'),
(3, 'Csicsergő Óvoda', '6723 Szeged, Teszt sugárút 34.', '06-62-111-113', 'ovoda3@teszt.com', 'Lázár Laura', 'állam'),
(4, 'Fekete István Óvoda', '6724 Szeged, Teszt tér 97.', '06-62-111-114', 'ovoda4@teszt.com', 'Mihók Mónika', 'egyház'),
(5, 'Harand Óvoda', '6725 Szeged, Teszt körút 11.', '06-62-111-115', 'ovoda5@teszt.com', 'Nagy Nóra', 'önkormányzat'),
(6, 'Felső Óvoda', '6722 Szeged, Pápai utca 5.', '06-62-111-116', 'ovoda6@teszt.com', 'Elekes Edi', 'önkormányzat'),
(7, 'Kübekházi Óvoda', '6755 Kübekháza, Teszt utca 320.', '06-62-111-117', 'ovoda7@teszt.com', 'Füstös Ferenc', 'egyház'),
(8, 'Tiszaszigeti Óvoda', '6756 Tiszasziget, Teszt tér 1.', '06-62-111-118', 'ovoda8@teszt.com', 'Gárdonyi Gusztáv', 'állam'),
(9, 'Sándorfalvi Óvoda', '6754 Sándorfalva, Tesztelő út 4.', '06-62-111-119', 'ovoda9@teszt.com', 'Hűvös Hedvig', 'egyház'),
(10, 'Szatymazi Óvoda', '6753 Szatymaz, Találat utca 3.', '06-62-111-120', 'ovoda10@teszt.com', 'Ibl Ilona', 'önkormányzat'),
(11, 'Deszki Óvoda', '6757 Deszk, Borzas utca 92.', '06-62-111-121', 'ovoda11@teszt.com', 'Jankó János', 'önkormányzat'),
(12, 'Ferencszállási Óvoda', '6770 Ferencszállás, Egy utca 7.', '06-62-111-122', 'ovoda12@teszt.com', 'Kuklis Kálmán', 'egyház'),
(13, 'Újszentiváni Óvoda', '6756 Újszentiván, Utolsó utca 36.', '06-62-111-123', 'ovoda13@teszt.com', 'Lakatos Lilien', 'állam'),
(14, 'Algyői Óvoda', '6790 Algyő, Teszt utca 74.', '06-62-111-124', 'ovoda14@teszt.com', 'Madaras Máté', 'egyház'),
(15, 'Magyar Óvoda', '6729 Szeged, Vég utca 8.', '06-62-111-125', 'ovoda15@teszt.com', 'Németh Nánsor', 'önkormányzat'),
(16, 'Röszkei Óvoda', '6791 Röszke, Festő utca 33.', '06-62-111-126', 'ovoda16@teszt.com', 'Magyar Melánia', 'önkormányzat'),
(17, 'Domaszéki Óvoda', '6752 Domaszék, Fő tér 32.', '06-62-111-127', 'ovoda17@teszt.com', 'Oláh Olga', 'egyház'),
(18, 'Szerb Óvoda', '6724 Szeged, Makkos utca 73.', '06-62-111-128', 'ovoda18@teszt.com', 'Pusztai Panka', 'állam'),
(19, 'Külső Óvoda', '6728 Szeged, Vám sugárút 123.', '06-62-111-129', 'ovoda19@teszt.com', 'Rajtik Roland', 'egyház'),
(20, 'Belső Óvoda', '6720 Szeged, Zrínyi tér 2.', '06-62-111-130', 'ovoda20@teszt.com', 'Sólyom Sándor', 'önkormányzat');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szakemberek`
--

CREATE TABLE `szakemberek` (
  `ellato_szakemberID` int(11) NOT NULL,
  `nev` varchar(60) NOT NULL,
  `felhasznalo_nev` varchar(30) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `munkahely` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefonszam` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `szakemberek`
--

INSERT INTO `szakemberek` (`ellato_szakemberID`, `nev`, `felhasznalo_nev`, `jelszo`, `munkahely`, `email`, `telefonszam`) VALUES
(1, 'Apró Anita', 'apan', '$2a$11$h/FMyBOAcGkeI0UObg5pkuavgLHbhxKim1Mz7Yzvskk3qqx/RMCBe', 'Szegedi Tagintézmény', 'apro@teszt.com', '06-70-111-1111'),
(2, 'Bánatos Berta', 'babe', '$2a$11$m1FsWVZDHHQ7P3lDjXNj8uPvPyM8e8GVybcW8AC3rw4x5dwuXK1za', 'Szegedi Tagintézmény', 'banatos@teszt.com', '06-70-111-1112'),
(3, 'Dudás Dóra', 'dudo', '$2a$11$FPA0O788TgmRa2RZDm00T.c697G52hGSlYF2vIf6topbDNszrSC6u', 'Szegedi Tagintézmény', 'dudas@teszt.com', '06-70-111-1113'),
(4, 'Erdei Emőke', 'erem', '$2a$11$mRfg48kiMOJkChMDu8Q9wOApBcs/DAVba5hyEHjYV83PS7/21nEm.', 'Szegedi Tagintézmény', 'erdei@teszt.com', '06-70-111-1114'),
(5, 'Fekete Fanni', 'fefa', '$2a$11$cBSemt.AMheu80tnP4CFxu.ouKjjlWCJs5oFyKn.fIYV3Llz8jiee', 'Szegedi Tagintézmény', 'fekete@teszt.com', '06-70-111-1115'),
(6, 'Gombos Gina', 'gogi', '$2a$11$a3S0yOAseCoxft0uAGnlEOKOCxn6jjROGEhwjbCxnRsvJ.1EUtYki', 'Szegedi Tagintézmény', 'gombos@teszt.com', '06-70-111-1116'),
(7, 'Havas Hilda', 'hahi', '$2a$11$m4Znwcy0xCMt122.AdF./.cNBChpoHuBfPF84GaHb69Uv6JbrWlEG', 'Szegedi Tagintézmény', 'havas@teszt.com', '06-70-111-1117');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `terapiak`
--

CREATE TABLE `terapiak` (
  `terapiaID` int(11) NOT NULL,
  `szukseges_e` binary(1) NOT NULL,
  `ellato_szakemberID` int(11) DEFAULT NULL,
  `terapia_taneve` int(11) DEFAULT NULL,
  `ellatas_helye` varchar(50) DEFAULT NULL,
  `ellatas_napja` varchar(10) DEFAULT NULL,
  `ellatas_idopontja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `terapiak`
--

INSERT INTO `terapiak` (`terapiaID`, `szukseges_e`, `ellato_szakemberID`, `terapia_taneve`, `ellatas_helye`, `ellatas_napja`, `ellatas_idopontja`) VALUES
(1, 0x30, NULL, NULL, NULL, NULL, NULL),
(2, 0x31, 3, 2021, 'Koramentorház', 'hétfő', 8),
(3, 0x31, 5, 2021, 'Bécsi krt', 'hétfő', 8),
(4, 0x31, 4, 2021, 'Bécsi krt', 'hétfő', 9),
(5, 0x31, 5, 2021, 'Koramentorház', 'hétfő', 9),
(6, 0x31, 2, 2021, 'Koramentorház', 'kedd', 13),
(7, 0x31, 3, 2021, 'Koramentorház', 'kedd', 14),
(8, 0x31, 1, 2021, 'Bécsi krt', 'kedd', 14),
(9, 0x31, 7, 2021, 'Bécsi krt', 'kedd', 15),
(10, 0x31, 4, 2021, 'Koramentorház', 'szerda', 15),
(11, 0x31, 5, 2021, 'Koramentorház', 'szerda', 16),
(12, 0x31, 3, 2021, 'Bécsi krt', 'szerda', 10),
(13, 0x31, 7, 2021, 'Bécsi krt', 'szerda', 11),
(14, 0x31, 6, 2021, 'Bécsi krt', 'csütörtök', 14),
(15, 0x31, 2, 2021, 'Koramentorház', 'csütörtök', 9),
(16, 0x31, 5, 2021, 'Koramentorház', 'csütörtök', 10),
(17, 0x31, 3, 2021, 'Koramentorház', 'péntek', 11),
(18, 0x31, 4, 2021, 'Bécsi krt', 'péntek', 8),
(19, 0x31, 2, 2021, 'Bécsi krt', 'péntek', 9),
(20, 0x31, 1, 2021, 'Bécsi krt', 'péntek', 10),
(21, 0x31, 2, 2021, 'Bécsi krt', 'hétfő', 10),
(22, 0x31, 2, 2021, 'Bécsi krt', 'hétfő', 11),
(23, 0x31, 3, 2021, 'Bécsi krt', 'kedd', 16),
(24, 0x31, 3, 2021, 'Koramentorház', 'kedd', 15),
(25, 0x31, 4, 2021, 'Koramentorház', 'kedd', 16),
(26, 0x31, 4, 2021, 'Bécsi krt', 'szerda', 12),
(27, 0x31, 5, 2021, 'Koramentorház', 'szerda', 13),
(28, 0x31, 5, 2021, 'Koramentorház', 'szerda', 14),
(29, 0x31, 6, 2021, 'Bécsi krt', 'csütörtök', 15),
(30, 0x31, 6, 2021, 'Bécsi krt', 'csütörtök', 16);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tesztek`
--

CREATE TABLE `tesztek` (
  `tesztID` int(11) NOT NULL,
  `tesznev` varchar(50) NOT NULL,
  `tipus` varchar(30) NOT NULL,
  `kotelezo` binary(1) NOT NULL,
  `eletkori_kitoltes_kezdete_honapban` int(11) NOT NULL,
  `eletkori_kitoltes_vege_honapban` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `tesztek`
--

INSERT INTO `tesztek` (`tesztID`, `tesznev`, `tipus`, `kotelezo`, `eletkori_kitoltes_kezdete_honapban`, `eletkori_kitoltes_vege_honapban`) VALUES
(1, 'KOFA-3 szűrés', 'szűrés', 0x31, 24, 50),
(2, '4 éves vizsgálat', 'vizsgálat', 0x30, 48, 59),
(3, 'Szól-e? szűrés', 'szűrés', 0x31, 60, 77);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `diagnozisok`
--
ALTER TABLE `diagnozisok`
  ADD PRIMARY KEY (`diagnozisID`);

--
-- A tábla indexei `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD PRIMARY KEY (`tesztID`,`oktatasi_azonosito`,`kitoltes_datuma`),
  ADD KEY `terapiaAZ` (`terapiaID`),
  ADD KEY `oktatasi_azonosito` (`oktatasi_azonosito`);

--
-- A tábla indexei `gyerekek`
--
ALTER TABLE `gyerekek`
  ADD PRIMARY KEY (`oktatasi_azonosito`),
  ADD KEY `diagnozisAz` (`diagnozisID`),
  ADD KEY `ovodaAZ` (`ovodaID`),
  ADD KEY `elerhetosegAZ` (`elerhetosegID`);

--
-- A tábla indexei `gyerek_elerhetosegek`
--
ALTER TABLE `gyerek_elerhetosegek`
  ADD PRIMARY KEY (`elerhetosegID`);

--
-- A tábla indexei `ovodak`
--
ALTER TABLE `ovodak`
  ADD PRIMARY KEY (`ovodaID`);

--
-- A tábla indexei `szakemberek`
--
ALTER TABLE `szakemberek`
  ADD PRIMARY KEY (`ellato_szakemberID`),
  ADD UNIQUE KEY `felhasznalo_nev` (`felhasznalo_nev`),
  ADD UNIQUE KEY `jelszo` (`jelszo`);

--
-- A tábla indexei `terapiak`
--
ALTER TABLE `terapiak`
  ADD PRIMARY KEY (`terapiaID`),
  ADD KEY `ellato_szakemberID` (`ellato_szakemberID`);

--
-- A tábla indexei `tesztek`
--
ALTER TABLE `tesztek`
  ADD PRIMARY KEY (`tesztID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `diagnozisok`
--
ALTER TABLE `diagnozisok`
  MODIFY `diagnozisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `gyerek_elerhetosegek`
--
ALTER TABLE `gyerek_elerhetosegek`
  MODIFY `elerhetosegID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT a táblához `ovodak`
--
ALTER TABLE `ovodak`
  MODIFY `ovodaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `szakemberek`
--
ALTER TABLE `szakemberek`
  MODIFY `ellato_szakemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `terapiak`
--
ALTER TABLE `terapiak`
  MODIFY `terapiaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `tesztek`
--
ALTER TABLE `tesztek`
  MODIFY `tesztID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD CONSTRAINT `eredmenyek_ibfk_1` FOREIGN KEY (`tesztID`) REFERENCES `tesztek` (`tesztID`),
  ADD CONSTRAINT `eredmenyek_ibfk_2` FOREIGN KEY (`terapiaID`) REFERENCES `terapiak` (`terapiaID`),
  ADD CONSTRAINT `eredmenyek_ibfk_3` FOREIGN KEY (`oktatasi_azonosito`) REFERENCES `gyerekek` (`oktatasi_azonosito`);

--
-- Megkötések a táblához `gyerekek`
--
ALTER TABLE `gyerekek`
  ADD CONSTRAINT `gyerekek_ibfk_1` FOREIGN KEY (`diagnozisID`) REFERENCES `diagnozisok` (`diagnozisID`),
  ADD CONSTRAINT `gyerekek_ibfk_2` FOREIGN KEY (`ovodaID`) REFERENCES `ovodak` (`ovodaID`),
  ADD CONSTRAINT `gyerekek_ibfk_3` FOREIGN KEY (`elerhetosegID`) REFERENCES `gyerek_elerhetosegek` (`elerhetosegID`);

--
-- Megkötések a táblához `terapiak`
--
ALTER TABLE `terapiak`
  ADD CONSTRAINT `terapiak_ibfk_1` FOREIGN KEY (`ellato_szakemberID`) REFERENCES `szakemberek` (`ellato_szakemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
