-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2024 at 12:39 PM
-- Server version: 10.11.9-MariaDB-cll-lve
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectg_Asztafoglalos3`
--

-- --------------------------------------------------------

--
-- Table structure for table `Food`
--

CREATE TABLE `Food` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Description` text NOT NULL,
  `Category` text NOT NULL,
  `Price` int(11) NOT NULL,
  `Image_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Food`
--

INSERT INTO `Food` (`ID`, `Name`, `Description`, `Category`, `Price`, `Image_ID`) VALUES
(1, 'Gulyásleves', 'Hagyományos magyar gulyásleves marhahússal, burgonyával és paprikával, friss kenyérrel tálalva.', 'Leves', 1800, 0),
(2, 'Halászlé', 'Fűszeres, paprika alapú halászlé frissen fogott harcsával, mely a Tisza part ízeit idézi.', 'Leves', 2300, 1),
(3, 'Lencseleves', 'Laktató lencseleves füstölt kolbásszal, zöldségekkel és babérlevéllel, melegen tálalva.', 'Leves', 1600, 2),
(4, 'Bableves', 'Gazdag bableves sűrű füstölt hússal és kolbásszal, amely egy klasszikus magyar kedvenc.', 'Leves', 1700, 3),
(5, 'Húsleves', 'Hagyományos csirkehúsleves zöldségekkel, házi csigatésztával és friss petrezselyemmel.', 'Leves', 1500, 4),
(6, 'Túrós csusza', 'Magyar túrós csusza ropogós szalonnával és tejföllel, hagyományos házi készítésű tésztával.', 'Tészta', 1400, 5),
(7, 'Húsos rakott tészta', 'Rakott tészta darált hússal, tejföllel és sajttal gazdagon megöntözve, aranybarnára sütve.', 'Tészta', 2200, 6),
(8, 'Spagetti bolognai módra', 'Klasszikus bolognai spagetti szaftos húsos raguval, fűszerezett paradicsomszósszal.', 'Tészta', 1900, 7),
(9, 'Lasagne', 'Rétegezett lasagne tészta bőséges húsos raguval és olvasztott sajttal a tetején.', 'Tészta', 2400, 8),
(10, 'Diós tészta', 'Édes, cukros dióval megszórt magyar tésztaétel, amely minden édesszájú kedvence.', 'Tészta', 1300, 9),
(11, 'Pörkölt nokedlivel', 'Szaftos marhapörkölt lágy nokedlivel, hagyományos magyar recept szerint készítve.', 'Főétel', 2800, 10),
(12, 'Lecsó kolbásszal', 'Friss paprikás lecsó, ízletes kolbásszal és tükörtojással, amely nyári estéket idéz.', 'Főétel', 2200, 11),
(13, 'Rántott hús', 'Aranybarnára sült rántott sertésszelet ropogós sült krumplival és friss salátával.', 'Főétel', 2500, 12),
(14, 'Paprikás csirke', 'Krémes, tejfölös paprikás csirke nokedlivel, gazdagon fűszerezve magyar paprikával.', 'Főétel', 2400, 13),
(15, 'Brassói aprópecsenye', 'Szaftos sült hús burgonyával és fokhagymával, igazi magyar specialitás.', 'Főétel', 2700, 14),
(16, 'Rántott sajt', 'Ropogós bundában sült sajt, friss sült krumplival és tartármártással tálalva.', 'Főétel', 2100, 15),
(17, 'Töltött káposzta', 'Savanyú káposztával és füstölt hússal töltött, lágy, ízletes magyar étel.', 'Főétel', 2900, 16),
(18, 'Hortobágyi palacsinta', 'Töltött palacsinta fűszeres darált hússal és tejfölös mártással nyakon öntve.', 'Főétel', 1900, 17),
(19, 'Lángos', 'Olajban sült, ropogós lángos fokhagymával és sajttal bőségesen megszórva.', 'Főétel', 1200, 18),
(20, 'Fröccs', 'Frissítő fröccs, szóda és fehérbor tökéletes kombinációja.', 'Ital', 800, 19),
(21, 'Unicum', 'Magyar gyógynövénylikőr, intenzív ízekkel és egyedülálló karakterrel.', 'Ital', 1200, 20),
(22, 'Pálinka', 'Erős, gyümölcsös pálinka, az igazi magyar vendégszeretet szimbóluma.', 'Ital', 1500, 21),
(23, 'Tokaji Aszú', 'Édes, aranyszínű Tokaji Aszú, Magyarország világhírű desszertbora.', 'Ital', 1800, 22),
(24, 'Sör', 'Jéghideg magyar sör, tökéletes kiegészítője bármelyik ételnek.', 'Ital', 1000, 23),
(25, 'Szódavíz', 'Friss, szénsavas szódavíz, üdítő és könnyed ital bármely étel mellé.', 'Ital', 500, 24),
(26, 'Kóla', 'Hűsítő kóla, klasszikus íz, ami minden étkezést feldob.', 'Ital', 600, 25),
(27, 'Narancslé', 'Frissen facsart narancslé, tele C-vitaminnal és természetes ízekkel.', 'Ital', 700, 26),
(28, 'Espresso', 'Erős, ízesített feketekávé, hogy jól induljon a nap.', 'Ital', 900, 27),
(29, 'Cappuccino', 'Lágy, habos cappuccino friss tejjel és krémes kávéval.', 'Ital', 1100, 28),
(30, 'Somlói galuska', 'Klasszikus magyar desszert, piskóta, dió, csokiöntet és tejszínhab kombinációja.', 'Desszert', 1500, 29),
(31, 'Dobos torta', 'Dobostorta karamellréteggel és lágy csokoládékrémmel töltve.', 'Desszert', 1600, 30),
(32, 'Rétes', 'Házi készítésű rétes finom túrós és meggyes töltelékkel, porcukorral meghintve.', 'Desszert', 1200, 31),
(33, 'Palacsinta', 'Könnyű palacsinta választott töltelékkel: lekvár, kakaó, dió, vagy túró.', 'Desszert', 1000, 32),
(34, 'Kakaós csiga', 'Pihe-puha kakaós csiga, melegen tálalva a legjobb reggelihez.', 'Desszert', 700, 33),
(35, 'Túrógombóc', 'Lágy túrógombóc tejföllel és porcukorral megszórva, egy igazi klasszikus desszert.', 'Desszert', 1300, 34),
(36, 'Fánk', 'Frissen sült, porcukros fánk baracklekvárral tálalva.', 'Desszert', 900, 35),
(37, 'Mákos guba', 'Édes mákos guba vaníliasodóval, az ünnepi asztalok kedvence.', 'Desszert', 1100, 36),
(38, 'Zserbó', 'Réteges zserbó diós és baracklekváros töltelékkel, csokoládé bevonattal.', 'Desszert', 1500, 37),
(39, 'Túrós rétes', 'Pihe-puha túrós rétes házi készítésű tésztából és friss túróval.', 'Desszert', 1400, 38),
(40, 'Töltött paprika', 'Fűszeres darált hússal töltött paprika paradicsomos mártásban, magyaros fűszerezéssel.', 'Főétel', 2600, 39),
(41, 'Sült kacsacomb', 'Ropogósra sült kacsacomb, karamellizált káposztával és tört krumplival.', 'Főétel', 3400, 40),
(42, 'Hekk sültkrumplival', 'Frissen sült hekk ropogós sültkrumplival, citrommal és tartármártással.', 'Főétel', 2800, 41),
(43, 'Csirkemell roston', 'Szaftos, roston sült csirkemell grillezett zöldségekkel és friss salátával.', 'Főétel', 2500, 42),
(44, 'Vadas marha zsemlegombóccal', 'Klasszikus vadas mártásban párolt marhahús, házi zsemlegombóccal.', 'Főétel', 3100, 43),
(45, 'Sertéspörkölt', 'Magyaros fűszerezésű sertéspörkölt paprikával, hagymával, és nokedlivel tálalva.', 'Főétel', 2700, 44),
(46, 'Rakott krumpli', 'Réteges rakott krumpli kolbásszal és tojással, tejföllel megöntözve.', 'Főétel', 2200, 45),
(47, 'Vörösboros marhapörkölt', 'Lassú tűzön főzött marhapörkölt vörösborral és magyar paprikával ízesítve.', 'Főétel', 3200, 46),
(48, 'Csirkepaprikás galuskával', 'Tejfölös paprikás csirkemell galuskával, gazdag magyaros ízvilággal.', 'Főétel', 2500, 47),
(49, 'Kolbászos rakott káposzta', 'Kolbászos rakott savanyú káposzta, lassan sült és tejföllel gazdagítva.', 'Főétel', 2900, 48),
(50, 'Fehérbor', 'Hűvös, száraz fehérbor, amely a magyar borvidékek legfinomabb szőlőjéből készült.', 'Ital', 1400, 49),
(51, 'Vörösbor', 'Gazdag, testes vörösbor, amely tökéletes kísérője a húsételeknek.', 'Ital', 1600, 50),
(52, 'Rosé bor', 'Frissítő rosé bor könnyed gyümölcsös jegyekkel, ideális nyári estékre.', 'Ital', 1400, 51),
(53, 'Ásványvíz', 'Jéghideg, buborékos ásványvíz, amely bármely étel mellé frissít.', 'Ital', 500, 52),
(54, 'Málnaszörp', 'Hűsítő, édes málnaszörp, amely a gyermekkor nyári ízeit idézi.', 'Ital', 600, 53),
(55, 'Citromos limonádé', 'Frissítő citromos limonádé, házilag készített, friss mentával.', 'Ital', 900, 54),
(56, 'Forralt bor', 'Meleg, fűszeres forralt bor a téli hónapok tökéletes itala.', 'Ital', 1200, 55),
(57, 'Gyömbérsör', 'Frissítő, enyhén csípős gyömbérsör, tökéletes kiegészítő egy könnyű vacsorához.', 'Ital', 1000, 56),
(58, 'Kávé', 'Frissen főzött feketekávé, az energikus napok elindítója.', 'Ital', 800, 57),
(59, 'Forró csokoládé', 'Krémes, gazdag forró csokoládé tejszínhabbal a hideg napokra.', 'Ital', 1000, 58),
(60, 'Tárkonyos raguleves', 'Laktató, tárkonyos csirkeraguleves zöldségekkel és tejföllel gazdagítva.', 'Leves', 1700, 59),
(61, 'Gombaleves', 'Sűrű gombaleves friss csiperkegombával, tejszínes alapban.', 'Leves', 1600, 60),
(62, 'Káposztaleves', 'Savanyú káposztaleves füstölt hússal és kolbásszal, gazdag ízekkel.', 'Leves', 1900, 61),
(63, 'Zöldborsóleves', 'Friss zöldborsóból készült leves zöldségekkel és nokedlivel.', 'Leves', 1500, 62),
(64, 'Sajtkrémleves', 'Krémes sajtleves, reszelt sajttal és pirított kenyérkockákkal.', 'Leves', 1600, 63),
(65, 'Csontleves', 'Húsos csontból készült, lassan főzött leves, amely a hagyományos magyar konyha ízeit idézi.', 'Leves', 1800, 64),
(66, 'Tarhonyaleves', 'Gazdag tarhonyaleves, füstölt hússal és zöldségekkel ízesítve.', 'Leves', 1500, 65),
(67, 'Palócleves', 'Zöldbabos marhahúsleves, tejföllel és fokhagymával gazdagon ízesítve.', 'Leves', 2000, 66),
(68, 'Paradicsomleves', 'Friss paradicsomokból készült leves reszelt sajttal és pirított kenyérkockákkal.', 'Leves', 1400, 67),
(69, 'Brokkolikrémleves', 'Krémes brokkolileves pirított mandulával és tejszínnel gazdagítva.', 'Leves', 1600, 68),
(70, 'Karfiolos rakott tészta', 'Rakott tészta párolt karfiollal, besamelmártással és reszelt sajttal sütve.', 'Tészta', 2000, 69),
(71, 'Káposztás tészta', 'Édes káposztás tészta, amely egy régi magyar klasszikus.', 'Tészta', 1300, 70),
(72, 'Diós metélt', 'Finom, cukros dióval és vajjal megöntözött házi tészta.', 'Tészta', 1400, 71),
(73, 'Tejfölös rakott tészta', 'Tejföllel és sajttal gazdagon megöntözött rakott tészta.', 'Tészta', 1900, 72),
(74, 'Sonkás-sajtos penne', 'Penne tészta füstölt sonkával és olvadt sajttal összesütve.', 'Tészta', 1800, 73),
(75, 'Milánói makaróni', 'Húsos, paradicsomos raguval tálalt makaróni, gazdag fűszerezéssel.', 'Tészta', 1700, 74),
(76, 'Baconos carbonara', 'Krémes, tojásos szószban megforgatott spagetti, ropogós bacon darabokkal.', 'Tészta', 1800, 75),
(77, 'Sajtos-tejfölös tészta', 'Könnyű sajtos-tejfölös tészta, ropogósra sült baconnel megbolondítva.', 'Tészta', 1600, 76),
(78, 'Spagetti aglio e olio', 'Egyszerű és finom fokhagymás-olívaolajos spagetti, chili pehellyel fűszerezve.', 'Tészta', 1500, 77),
(79, 'Rakott tészta húsos raguval', 'Rétegezett rakott tészta gazdag húsos raguval és sajttal.', 'Tészta', 2100, 78),
(80, 'Roston sült kacsamell', 'Roston sült kacsamell narancsos mártással és párolt káposztával.', 'Szárnyas ételek', 3500, 79),
(81, 'Grillezett csirkemell', 'Frissen grillezett csirkemell zöldfűszerekkel és párolt zöldségekkel.', 'Szárnyas ételek', 2400, 80),
(82, 'Rántott pulykamell', 'Aranybarnára sütött rántott pulykamell, friss petrezselymes burgonyával.', 'Szárnyas ételek', 2300, 81),
(83, 'Sült libacomb', 'Sült libacomb lassan párolva, ízletes burgonyával és káposztával.', 'Szárnyas ételek', 3400, 82),
(84, 'Mézes-mustáros csirkeszárnyak', 'Ropogós csirkeszárnyak mézes-mustáros mázban, sült krumplival.', 'Szárnyas ételek', 2200, 83),
(85, 'Csirkés gyros tál', 'Fűszeres csirkés gyros tál friss zöldségekkel és tzatzikivel.', 'Gyrosok', 2000, 84),
(86, 'Gyros pita', 'Puhára sütött pita, töltve fűszeres csirkehússal, zöldségekkel és fokhagymás öntettel.', 'Gyrosok', 1800, 85),
(87, 'Vegán gyros tál', 'Fűszeres grillezett zöldségek, hummusszal és friss salátával, teljes értékű gyros élmény.', 'Gyrosok', 1900, 86),
(88, 'Barany gyros tál', 'Fűszeres bárányhús gyros tál friss pitával és tzatzikivel.', 'Gyrosok', 2400, 87),
(89, 'Fűszeres sertés gyros tál', 'Ízletes, fűszeres sertés gyros tál sült krumplival és zöldségekkel.', 'Gyrosok', 2200, 88),
(90, 'Petrezselymes burgonya', 'Puhára főzött burgonya friss petrezselyemmel megszórva.', 'Köretek', 800, 89),
(91, 'Ropogós sült krumpli', 'Frissen sütött, ropogós sült krumpli, sóval megszórva.', 'Köretek', 700, 90),
(92, 'Párolt zöldségek', 'Friss, ropogós párolt zöldségek ízletes fűszerekkel.', 'Köretek', 900, 91),
(93, 'Tarhonya', 'Magyar tarhonya, gazdagon fűszerezett és vajjal ízesítve.', 'Köretek', 1000, 92),
(94, 'Galuska', 'Friss, házi galuska tökéletesen passzol a magyaros ételekhez.', 'Köretek', 900, 93),
(95, 'Steak sült krumplival', 'Lédús marha steak frissen sütött krumplival és zöldségkörettel.', 'Főétel', 4000, 94),
(96, 'Sült oldalas', 'Lassan sült sertés oldalas édes BBQ mártással, hagymakarikákkal.', 'Főétel', 3200, 95),
(97, 'Grillezett lazac', 'Friss grillezett lazac citromos vajjal és párolt zöldségekkel.', 'Főétel', 3800, 96),
(98, 'Sertésszelet hagymával', 'Lassú tűzön párolt sertésszelet pirított hagymával és paprikával.', 'Főétel', 2900, 97),
(99, 'Krémes', 'Hagyományos magyar krémes desszert, ropogós tésztaréteggel és vaníliakrémmel.', 'Desszert', 1300, 98),
(100, 'Aranygaluska', 'Lágy aranygaluska diós öntettel, vaníliasodóval tálalva.', 'Desszert', 1400, 99),
(101, 'Lekváros bukta', 'Frissen sütött, lekvárral töltött bukta, porcukorral meghintve.', 'Desszert', 1200, 100);

-- --------------------------------------------------------

--
-- Table structure for table `Food_Menus`
--

CREATE TABLE `Food_Menus` (
  `Food_ID` int(11) NOT NULL,
  `Menu_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Food_Menus`
--

INSERT INTO `Food_Menus` (`Food_ID`, `Menu_ID`) VALUES
(1, 1),
(5, 1),
(10, 1),
(18, 1),
(98, 1),
(2, 2),
(6, 2),
(9, 2),
(22, 2),
(99, 2),
(3, 3),
(7, 3),
(10, 3),
(19, 3),
(100, 3),
(4, 4),
(8, 4),
(9, 4),
(20, 4),
(97, 4),
(1, 5),
(5, 5),
(10, 5),
(19, 5),
(100, 5),
(2, 6),
(6, 6),
(9, 6),
(21, 6),
(99, 6),
(3, 7),
(7, 7),
(9, 7),
(19, 7),
(98, 7),
(1, 8),
(8, 8),
(10, 8),
(20, 8),
(97, 8),
(4, 9),
(5, 9),
(9, 9),
(19, 9),
(99, 9),
(2, 10),
(6, 10),
(10, 10),
(18, 10),
(100, 10),
(1, 11),
(8, 11),
(10, 11),
(22, 11),
(97, 11),
(4, 12),
(7, 12),
(9, 12),
(21, 12),
(98, 12),
(1, 13),
(19, 13),
(11, 13),
(29, 13),
(98, 13),
(20, 14),
(25, 14),
(82, 14),
(89, 14),
(99, 14),
(18, 15),
(26, 15),
(33, 15),
(94, 15),
(98, 15),
(2, 16),
(22, 16),
(81, 16),
(92, 16),
(100, 16),
(3, 17),
(97, 17),
(83, 17),
(91, 17),
(99, 17);

-- --------------------------------------------------------

--
-- Table structure for table `Menus`
--

CREATE TABLE `Menus` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Active_From` datetime NOT NULL,
  `Active_Until` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Menus`
--

INSERT INTO `Menus` (`ID`, `Name`, `Active_From`, `Active_Until`) VALUES
(1, 'Heti menü', '2024-10-11 00:00:00', '2024-10-17 23:59:59'),
(2, 'Heti menü', '2024-10-18 00:00:00', '2024-10-24 23:59:59'),
(3, 'Heti menü', '2024-10-25 00:00:00', '2024-10-31 23:59:59'),
(4, 'Heti menü', '2024-11-01 00:00:00', '2024-11-07 23:59:59'),
(5, 'Heti menü', '2024-11-08 00:00:00', '2024-11-14 23:59:59'),
(6, 'Heti menü', '2024-11-15 00:00:00', '2024-11-21 23:59:59'),
(7, 'Heti menü', '2024-11-22 00:00:00', '2024-11-28 23:59:59'),
(8, 'Heti menü', '2024-11-29 00:00:00', '2024-12-05 23:59:59'),
(9, 'Heti menü', '2024-12-06 00:00:00', '2024-12-12 23:59:59'),
(10, 'Heti menü', '2024-12-13 00:00:00', '2024-12-19 23:59:59'),
(11, 'Heti menü', '2024-12-20 00:00:00', '2024-12-26 23:59:59'),
(12, 'Heti menü', '2024-12-27 00:00:00', '2025-01-02 23:59:59'),
(13, 'Őszi különlegességek', '2024-10-11 00:00:00', '2024-11-30 23:59:59'),
(14, 'Karácsonyi menü', '2024-12-15 00:00:00', '2024-12-26 23:59:59'),
(15, 'Szilveszteri menü', '2024-12-31 00:00:00', '2025-01-01 23:59:59'),
(16, 'Újévi menü', '2025-01-01 00:00:00', '2025-01-07 23:59:59'),
(17, 'Téli ínyencségek', '2024-12-01 00:00:00', '2025-02-28 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `One_Time_Codes`
--

CREATE TABLE `One_Time_Codes` (
  `ID` int(11) NOT NULL,
  `Code` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `For_Password_Reset` tinyint(1) NOT NULL COMMENT 'TRUE ha elfelejtett jelszó kód, ha false, akkor fiok validitáshoz van.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reservations`
--

CREATE TABLE `Reservations` (
  `ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Reservation_Date` datetime NOT NULL,
  `Expected_Party_Size` int(11) NOT NULL,
  `Business` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reservations_Tables`
--

CREATE TABLE `Reservations_Tables` (
  `Reservation_ID` int(11) NOT NULL,
  `Table_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `Comment` text NOT NULL,
  `Reservation_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tables`
--

CREATE TABLE `Tables` (
  `ID` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Description` text NOT NULL COMMENT 'kinti/benti'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Tables`
--

INSERT INTO `Tables` (`ID`, `Capacity`, `Description`) VALUES
(1, 2, 'kinti'),
(2, 2, 'kinti'),
(3, 2, 'kinti'),
(4, 2, 'benti'),
(5, 2, 'benti'),
(6, 4, 'benti'),
(7, 4, 'benti'),
(8, 6, 'benti'),
(9, 6, 'benti'),
(10, 8, 'benti'),
(11, 8, 'benti'),
(12, 10, 'benti');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `ID` int(11) NOT NULL,
  `Email_Address` text NOT NULL,
  `Hash` text NOT NULL,
  `Salt` text NOT NULL,
  `Validated` tinyint(1) NOT NULL,
  `Registration_Date` datetime NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_Drinks`
--

CREATE TABLE `Welcome_Drinks` (
  `Reservation_ID` int(11) NOT NULL,
  `Food_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Food`
--
ALTER TABLE `Food`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Food_Menus`
--
ALTER TABLE `Food_Menus`
  ADD KEY `Food_ID` (`Food_ID`),
  ADD KEY `Menu_ID` (`Menu_ID`);

--
-- Indexes for table `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `One_Time_Codes`
--
ALTER TABLE `One_Time_Codes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Reservations_Tables`
--
ALTER TABLE `Reservations_Tables`
  ADD KEY `Reservation_ID` (`Reservation_ID`),
  ADD KEY `Table_ID` (`Table_ID`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Reservation_ID` (`Reservation_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Tables`
--
ALTER TABLE `Tables`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Welcome_Drinks`
--
ALTER TABLE `Welcome_Drinks`
  ADD KEY `Reservation_ID` (`Reservation_ID`),
  ADD KEY `Food_ID` (`Food_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Food`
--
ALTER TABLE `Food`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `Menus`
--
ALTER TABLE `Menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `One_Time_Codes`
--
ALTER TABLE `One_Time_Codes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reservations`
--
ALTER TABLE `Reservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tables`
--
ALTER TABLE `Tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Food_Menus`
--
ALTER TABLE `Food_Menus`
  ADD CONSTRAINT `Food_Menus_ibfk_1` FOREIGN KEY (`Food_ID`) REFERENCES `Food` (`ID`),
  ADD CONSTRAINT `Food_Menus_ibfk_2` FOREIGN KEY (`Menu_ID`) REFERENCES `Menus` (`ID`);

--
-- Constraints for table `One_Time_Codes`
--
ALTER TABLE `One_Time_Codes`
  ADD CONSTRAINT `One_Time_Codes_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`ID`);

--
-- Constraints for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD CONSTRAINT `Reservations_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`ID`);

--
-- Constraints for table `Reservations_Tables`
--
ALTER TABLE `Reservations_Tables`
  ADD CONSTRAINT `Reservations_Tables_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservations` (`ID`),
  ADD CONSTRAINT `Reservations_Tables_ibfk_2` FOREIGN KEY (`Table_ID`) REFERENCES `Tables` (`ID`);

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservations` (`ID`),
  ADD CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`ID`);

--
-- Constraints for table `Welcome_Drinks`
--
ALTER TABLE `Welcome_Drinks`
  ADD CONSTRAINT `Welcome_Drinks_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservations` (`ID`),
  ADD CONSTRAINT `Welcome_Drinks_ibfk_2` FOREIGN KEY (`Food_ID`) REFERENCES `Food` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
