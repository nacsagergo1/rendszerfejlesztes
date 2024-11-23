-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2024. Nov 23. 20:04
-- Kiszolgáló verziója: 8.3.0
-- PHP verzió: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `projectg_asztalfoglalos3`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Category` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Image_path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `food`
--

INSERT INTO `food` (`ID`, `Name`, `Description`, `Category`, `Price`, `Image_path`) VALUES
(1, 'Gulyásleves', 'Hagyományos magyar gulyásleves marhahússal, burgonyával és paprikával, friss kenyérrel tálalva.', 'Leves', 1800, 'img/Food_pics/0.jpg'),
(2, 'Halászlé', 'Fűszeres, paprika alapú halászlé frissen fogott harcsával, mely a Tisza part ízeit idézi.', 'Leves', 2300, 'img/Food_pics/1.jpg'),
(3, 'Lencseleves', 'Laktató lencseleves füstölt kolbásszal, zöldségekkel és babérlevéllel, melegen tálalva.', 'Leves', 1600, 'img/Food_pics/2.jpg'),
(4, 'Bableves', 'Gazdag bableves sűrű füstölt hússal és kolbásszal, amely egy klasszikus magyar kedvenc.', 'Leves', 1700, 'img/Food_pics/3.jpg'),
(5, 'Húsleves', 'Hagyományos csirkehúsleves zöldségekkel, házi csigatésztával és friss petrezselyemmel.', 'Leves', 1500, 'img/Food_pics/4.jpg'),
(6, 'Túrós csusza', 'Magyar túrós csusza ropogós szalonnával és tejföllel, hagyományos házi készítésű tésztával.', 'Tészta', 1400, 'img/Food_pics/5.jpg'),
(7, 'Húsos rakott tészta', 'Rakott tészta darált hússal, tejföllel és sajttal gazdagon megöntözve, aranybarnára sütve.', 'Tészta', 2200, 'img/Food_pics/6.jpg'),
(8, 'Spagetti bolognai módra', 'Klasszikus bolognai spagetti szaftos húsos raguval, fűszerezett paradicsomszósszal.', 'Tészta', 1900, 'img/Food_pics/7.jpg'),
(9, 'Lasagne', 'Rétegezett lasagne tészta bőséges húsos raguval és olvasztott sajttal a tetején.', 'Tészta', 2400, 'img/Food_pics/8.jpg'),
(10, 'Diós tészta', 'Édes, cukros dióval megszórt magyar tésztaétel, amely minden édesszájú kedvence.', 'Tészta', 1300, 'img/Food_pics/9.jpg'),
(11, 'Pörkölt nokedlivel', 'Szaftos marhapörkölt lágy nokedlivel, hagyományos magyar recept szerint készítve.', 'Főétel', 2800, 'img/Food_pics/10.jpg'),
(12, 'Lecsó kolbásszal', 'Friss paprikás lecsó, ízletes kolbásszal és tükörtojással, amely nyári estéket idéz.', 'Főétel', 2200, 'img/Food_pics/11.jpg'),
(13, 'Rántott hús', 'Aranybarnára sült rántott sertésszelet ropogós sült krumplival és friss salátával.', 'Főétel', 2500, 'img/Food_pics/12.jpg'),
(14, 'Paprikás csirke', 'Krémes, tejfölös paprikás csirke nokedlivel, gazdagon fűszerezve magyar paprikával.', 'Főétel', 2400, 'img/Food_pics/13.jpg'),
(15, 'Brassói aprópecsenye', 'Szaftos sült hús burgonyával és fokhagymával, igazi magyar specialitás.', 'Főétel', 2700, 'img/Food_pics/14.jpg'),
(16, 'Rántott sajt', 'Ropogós bundában sült sajt, friss sült krumplival és tartármártással tálalva.', 'Főétel', 2100, 'img/Food_pics/15.jpg'),
(17, 'Töltött káposzta', 'Savanyú káposztával és füstölt hússal töltött, lágy, ízletes magyar étel.', 'Főétel', 2900, 'img/Food_pics/16.jpg'),
(18, 'Hortobágyi palacsinta', 'Töltött palacsinta fűszeres darált hússal és tejfölös mártással nyakon öntve.', 'Főétel', 1900, 'img/Food_pics/17.jpg'),
(19, 'Lángos', 'Olajban sült, ropogós lángos fokhagymával és sajttal bőségesen megszórva.', 'Főétel', 1200, 'img/Food_pics/18.jpg'),
(20, 'Fröccs', 'Frissítő fröccs, szóda és fehérbor tökéletes kombinációja.', 'Ital', 800, 'img/Food_pics/19.jpg'),
(21, 'Unicum', 'Magyar gyógynövénylikőr, intenzív ízekkel és egyedülálló karakterrel.', 'Ital', 1200, 'img/Food_pics/20.jpg'),
(22, 'Pálinka', 'Erős, gyümölcsös pálinka, az igazi magyar vendégszeretet szimbóluma.', 'Ital', 1500, 'img/Food_pics/21.jpg'),
(23, 'Tokaji Aszú', 'Édes, aranyszínű Tokaji Aszú, Magyarország világhírű desszertbora.', 'Ital', 1800, 'img/Food_pics/22.jpg'),
(24, 'Sör', 'Jéghideg magyar sör, tökéletes kiegészítője bármelyik ételnek.', 'Ital', 1000, 'img/Food_pics/23.jpg'),
(25, 'Szódavíz', 'Friss, szénsavas szódavíz, üdítő és könnyed ital bármely étel mellé.', 'Ital', 500, 'img/Food_pics/24.jpg'),
(26, 'Kóla', 'Hűsítő kóla, klasszikus íz, ami minden étkezést feldob.', 'Ital', 600, 'img/Food_pics/25.jpg'),
(27, 'Narancslé', 'Frissen facsart narancslé, tele C-vitaminnal és természetes ízekkel.', 'Ital', 700, 'img/Food_pics/26.jpg'),
(28, 'Espresso', 'Erős, ízesített feketekávé, hogy jól induljon a nap.', 'Ital', 900, 'img/Food_pics/27.jpg'),
(29, 'Cappuccino', 'Lágy, habos cappuccino friss tejjel és krémes kávéval.', 'Ital', 1100, 'img/Food_pics/28.jpg'),
(30, 'Somlói galuska', 'Klasszikus magyar desszert, piskóta, dió, csokiöntet és tejszínhab kombinációja.', 'Desszert', 1500, 'img/Food_pics/29.jpg'),
(31, 'Dobos torta', 'Dobostorta karamellréteggel és lágy csokoládékrémmel töltve.', 'Desszert', 1600, 'img/Food_pics/30.jpg'),
(32, 'Rétes', 'Házi készítésű rétes finom túrós és meggyes töltelékkel, porcukorral meghintve.', 'Desszert', 1200, 'img/Food_pics/31.jpg'),
(33, 'Palacsinta', 'Könnyű palacsinta választott töltelékkel: lekvár, kakaó, dió, vagy túró.', 'Desszert', 1000, 'img/Food_pics/32.jpg'),
(34, 'Kakaós csiga', 'Pihe-puha kakaós csiga, melegen tálalva a legjobb reggelihez.', 'Desszert', 700, 'img/Food_pics/33.jpg'),
(35, 'Túrógombóc', 'Lágy túrógombóc tejföllel és porcukorral megszórva, egy igazi klasszikus desszert.', 'Desszert', 1300, 'img/Food_pics/34.jpg'),
(36, 'Fánk', 'Frissen sült, porcukros fánk baracklekvárral tálalva.', 'Desszert', 900, 'img/Food_pics/35.jpg'),
(37, 'Mákos guba', 'Édes mákos guba vaníliasodóval, az ünnepi asztalok kedvence.', 'Desszert', 1100, 'img/Food_pics/36.jpg'),
(38, 'Zserbó', 'Réteges zserbó diós és baracklekváros töltelékkel, csokoládé bevonattal.', 'Desszert', 1500, 'img/Food_pics/37.jpg'),
(39, 'Túrós rétes', 'Pihe-puha túrós rétes házi készítésű tésztából és friss túróval.', 'Desszert', 1400, 'img/Food_pics/38.jpg'),
(40, 'Töltött paprika', 'Fűszeres darált hússal töltött paprika paradicsomos mártásban, magyaros fűszerezéssel.', 'Főétel', 2600, 'img/Food_pics/39.jpg'),
(41, 'Sült kacsacomb', 'Ropogósra sült kacsacomb, karamellizált káposztával és tört krumplival.', 'Főétel', 3400, 'img/Food_pics/40.jpg'),
(42, 'Hekk sültkrumplival', 'Frissen sült hekk ropogós sültkrumplival, citrommal és tartármártással.', 'Főétel', 2800, 'img/Food_pics/41.jpg'),
(43, 'Csirkemell roston', 'Szaftos, roston sült csirkemell grillezett zöldségekkel és friss salátával.', 'Főétel', 2500, 'img/Food_pics/42.jpg'),
(44, 'Vadas marha zsemlegombóccal', 'Klasszikus vadas mártásban párolt marhahús, házi zsemlegombóccal.', 'Főétel', 3100, 'img/Food_pics/43.jpg'),
(45, 'Sertéspörkölt', 'Magyaros fűszerezésű sertéspörkölt paprikával, hagymával, és nokedlivel tálalva.', 'Főétel', 2700, 'img/Food_pics/44.jpg'),
(46, 'Rakott krumpli', 'Réteges rakott krumpli kolbásszal és tojással, tejföllel megöntözve.', 'Főétel', 2200, 'img/Food_pics/45.jpg'),
(47, 'Vörösboros marhapörkölt', 'Lassú tűzön főzött marhapörkölt vörösborral és magyar paprikával ízesítve.', 'Főétel', 3200, 'img/Food_pics/46.jpg'),
(48, 'Csirkepaprikás galuskával', 'Tejfölös paprikás csirkemell galuskával, gazdag magyaros ízvilággal.', 'Főétel', 2500, 'img/Food_pics/47.jpg'),
(49, 'Kolbászos rakott káposzta', 'Kolbászos rakott savanyú káposzta, lassan sült és tejföllel gazdagítva.', 'Főétel', 2900, 'img/Food_pics/48.jpg'),
(50, 'Fehérbor', 'Hűvös, száraz fehérbor, amely a magyar borvidékek legfinomabb szőlőjéből készült.', 'Ital', 1400, 'img/Food_pics/49.jpg'),
(51, 'Vörösbor', 'Gazdag, testes vörösbor, amely tökéletes kísérője a húsételeknek.', 'Ital', 1600, 'img/Food_pics/50.jpg'),
(52, 'Rosé bor', 'Frissítő rosé bor könnyed gyümölcsös jegyekkel, ideális nyári estékre.', 'Ital', 1400, 'img/Food_pics/51.jpg'),
(53, 'Ásványvíz', 'Jéghideg, buborékos ásványvíz, amely bármely étel mellé frissít.', 'Ital', 500, 'img/Food_pics/52.jpg'),
(54, 'Málnaszörp', 'Hűsítő, édes málnaszörp, amely a gyermekkor nyári ízeit idézi.', 'Ital', 600, 'img/Food_pics/53.jpg'),
(55, 'Citromos limonádé', 'Frissítő citromos limonádé, házilag készített, friss mentával.', 'Ital', 900, 'img/Food_pics/54.jpg'),
(56, 'Forralt bor', 'Meleg, fűszeres forralt bor a téli hónapok tökéletes itala.', 'Ital', 1200, 'img/Food_pics/55.jpg'),
(57, 'Gyömbérsör', 'Frissítő, enyhén csípős gyömbérsör, tökéletes kiegészítő egy könnyű vacsorához.', 'Ital', 1000, 'img/Food_pics/56.jpg'),
(58, 'Kávé', 'Frissen főzött feketekávé, az energikus napok elindítója.', 'Ital', 800, 'img/Food_pics/57.jpg'),
(59, 'Forró csokoládé', 'Krémes, gazdag forró csokoládé tejszínhabbal a hideg napokra.', 'Ital', 1000, 'img/Food_pics/58.jpg'),
(60, 'Tárkonyos raguleves', 'Laktató, tárkonyos csirkeraguleves zöldségekkel és tejföllel gazdagítva.', 'Leves', 1700, 'img/Food_pics/59.jpg'),
(61, 'Gombaleves', 'Sűrű gombaleves friss csiperkegombával, tejszínes alapban.', 'Leves', 1600, 'img/Food_pics/60.jpg'),
(62, 'Káposztaleves', 'Savanyú káposztaleves füstölt hússal és kolbásszal, gazdag ízekkel.', 'Leves', 1900, 'img/Food_pics/61.jpg'),
(63, 'Zöldborsóleves', 'Friss zöldborsóból készült leves zöldségekkel és nokedlivel.', 'Leves', 1500, 'img/Food_pics/62.jpg'),
(64, 'Sajtkrémleves', 'Krémes sajtleves, reszelt sajttal és pirított kenyérkockákkal.', 'Leves', 1600, 'img/Food_pics/63.jpg'),
(65, 'Csontleves', 'Húsos csontból készült, lassan főzött leves, amely a hagyományos magyar konyha ízeit idézi.', 'Leves', 1800, 'img/Food_pics/64.jpg'),
(66, 'Tarhonyaleves', 'Gazdag tarhonyaleves, füstölt hússal és zöldségekkel ízesítve.', 'Leves', 1500, 'img/Food_pics/65.jpg'),
(67, 'Palócleves', 'Zöldbabos marhahúsleves, tejföllel és fokhagymával gazdagon ízesítve.', 'Leves', 2000, 'img/Food_pics/66.jpg'),
(68, 'Paradicsomleves', 'Friss paradicsomokból készült leves reszelt sajttal és pirított kenyérkockákkal.', 'Leves', 1400, 'img/Food_pics/67.jpg'),
(69, 'Brokkolikrémleves', 'Krémes brokkolileves pirított mandulával és tejszínnel gazdagítva.', 'Leves', 1600, 'img/Food_pics/68.jpg'),
(70, 'Karfiolos rakott tészta', 'Rakott tészta párolt karfiollal, besamelmártással és reszelt sajttal sütve.', 'Tészta', 2000, 'img/Food_pics/69.jpg'),
(71, 'Káposztás tészta', 'Édes káposztás tészta, amely egy régi magyar klasszikus.', 'Tészta', 1300, 'img/Food_pics/70.jpg'),
(72, 'Diós metélt', 'Finom, cukros dióval és vajjal megöntözött házi tészta.', 'Tészta', 1400, 'img/Food_pics/71.jpg'),
(73, 'Tejfölös rakott tészta', 'Tejföllel és sajttal gazdagon megöntözött rakott tészta.', 'Tészta', 1900, 'img/Food_pics/72.jpg'),
(74, 'Sonkás-sajtos penne', 'Penne tészta füstölt sonkával és olvadt sajttal összesütve.', 'Tészta', 1800, 'img/Food_pics/73.jpg'),
(75, 'Milánói makaróni', 'Húsos, paradicsomos raguval tálalt makaróni, gazdag fűszerezéssel.', 'Tészta', 1700, 'img/Food_pics/74.jpg'),
(76, 'Baconos carbonara', 'Krémes, tojásos szószban megforgatott spagetti, ropogós bacon darabokkal.', 'Tészta', 1800, 'img/Food_pics/75.jpg'),
(77, 'Sajtos-tejfölös tészta', 'Könnyű sajtos-tejfölös tészta, ropogósra sült baconnel megbolondítva.', 'Tészta', 1600, 'img/Food_pics/76.jpg'),
(78, 'Spagetti aglio e olio', 'Egyszerű és finom fokhagymás-olívaolajos spagetti, chili pehellyel fűszerezve.', 'Tészta', 1500, 'img/Food_pics/77.jpg'),
(79, 'Rakott tészta húsos raguval', 'Rétegezett rakott tészta gazdag húsos raguval és sajttal.', 'Tészta', 2100, 'img/Food_pics/78.jpg'),
(80, 'Roston sült kacsamell', 'Roston sült kacsamell narancsos mártással és párolt káposztával.', 'Szárnyas ételek', 3500, 'img/Food_pics/79.jpg'),
(81, 'Grillezett csirkemell', 'Frissen grillezett csirkemell zöldfűszerekkel és párolt zöldségekkel.', 'Szárnyas ételek', 2400, 'img/Food_pics/80.jpg'),
(82, 'Rántott pulykamell', 'Aranybarnára sütött rántott pulykamell, friss petrezselymes burgonyával.', 'Szárnyas ételek', 2300, 'img/Food_pics/81.jpg'),
(83, 'Sült libacomb', 'Sült libacomb lassan párolva, ízletes burgonyával és káposztával.', 'Szárnyas ételek', 3400, 'img/Food_pics/82.jpg'),
(84, 'Mézes-mustáros csirkeszárnyak', 'Ropogós csirkeszárnyak mézes-mustáros mázban, sült krumplival.', 'Szárnyas ételek', 2200, 'img/Food_pics/83.jpg'),
(85, 'Csirkés gyros tál', 'Fűszeres csirkés gyros tál friss zöldségekkel és tzatzikivel.', 'Gyrosok', 2000, 'img/Food_pics/84.jpg'),
(86, 'Gyros pita', 'Puhára sütött pita, töltve fűszeres csirkehússal, zöldségekkel és fokhagymás öntettel.', 'Gyrosok', 1800, 'img/Food_pics/85.jpg'),
(87, 'Vegán gyros tál', 'Fűszeres grillezett zöldségek, hummusszal és friss salátával, teljes értékű gyros élmény.', 'Gyrosok', 1900, 'img/Food_pics/86.jpg'),
(88, 'Barany gyros tál', 'Fűszeres bárányhús gyros tál friss pitával és tzatzikivel.', 'Gyrosok', 2400, 'img/Food_pics/87.jpg'),
(89, 'Fűszeres sertés gyros tál', 'Ízletes, fűszeres sertés gyros tál sült krumplival és zöldségekkel.', 'Gyrosok', 2200, 'img/Food_pics/88.jpg'),
(90, 'Petrezselymes burgonya', 'Puhára főzött burgonya friss petrezselyemmel megszórva.', 'Köretek', 800, 'img/Food_pics/89.jpg'),
(91, 'Ropogós sült krumpli', 'Frissen sütött, ropogós sült krumpli, sóval megszórva.', 'Köretek', 700, 'img/Food_pics/90.jpg'),
(92, 'Párolt zöldségek', 'Friss, ropogós párolt zöldségek ízletes fűszerekkel.', 'Köretek', 900, 'img/Food_pics/91.jpg'),
(93, 'Tarhonya', 'Magyar tarhonya, gazdagon fűszerezett és vajjal ízesítve.', 'Köretek', 1000, 'img/Food_pics/92.jpg'),
(94, 'Galuska', 'Friss, házi galuska tökéletesen passzol a magyaros ételekhez.', 'Köretek', 900, 'img/Food_pics/93.jpg'),
(95, 'Steak sült krumplival', 'Lédús marha steak frissen sütött krumplival és zöldségkörettel.', 'Főétel', 4000, 'img/Food_pics/94.jpg'),
(96, 'Sült oldalas', 'Lassan sült sertés oldalas édes BBQ mártással, hagymakarikákkal.', 'Főétel', 3200, 'img/Food_pics/95.jpg'),
(97, 'Grillezett lazac', 'Friss grillezett lazac citromos vajjal és párolt zöldségekkel.', 'Főétel', 3800, 'img/Food_pics/96.jpg'),
(98, 'Sertésszelet hagymával', 'Lassú tűzön párolt sertésszelet pirított hagymával és paprikával.', 'Főétel', 2900, 'img/Food_pics/97.jpg'),
(99, 'Krémes', 'Hagyományos magyar krémes desszert, ropogós tésztaréteggel és vaníliakrémmel.', 'Desszert', 1300, 'img/Food_pics/98.jpg'),
(100, 'Aranygaluska', 'Lágy aranygaluska diós öntettel, vaníliasodóval tálalva.', 'Desszert', 1400, 'img/Food_pics/99.jpg'),
(101, 'Lekváros bukta', 'Frissen sütött, lekvárral töltött bukta, porcukorral meghintve.', 'Desszert', 1200, 'img/Food_pics/100.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food_menus`
--

DROP TABLE IF EXISTS `food_menus`;
CREATE TABLE IF NOT EXISTS `food_menus` (
  `Food_ID` int NOT NULL,
  `Menu_ID` int NOT NULL,
  KEY `Food_ID` (`Food_ID`),
  KEY `Menu_ID` (`Menu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `food_menus`
--

INSERT INTO `food_menus` (`Food_ID`, `Menu_ID`) VALUES
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
-- Tábla szerkezet ehhez a táblához `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Active_From` datetime NOT NULL,
  `Active_Until` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `menus`
--

INSERT INTO `menus` (`ID`, `Name`, `Active_From`, `Active_Until`) VALUES
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
-- Tábla szerkezet ehhez a táblához `one_time_codes`
--

DROP TABLE IF EXISTS `one_time_codes`;
CREATE TABLE IF NOT EXISTS `one_time_codes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Code` int NOT NULL,
  `User_ID` int NOT NULL,
  `Date` datetime NOT NULL,
  `For_Password_Reset` tinyint(1) NOT NULL COMMENT 'TRUE ha elfelejtett jelszó kód, ha false, akkor fiok validitáshoz van.',
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `one_time_codes`
--

INSERT INTO `one_time_codes` (`ID`, `Code`, `User_ID`, `Date`, `For_Password_Reset`) VALUES
(15, 58591765, 43, '2024-11-16 17:50:11', 0),
(16, 22195777, 44, '2024-11-16 17:53:24', 0),
(17, 65986240, 45, '2024-11-18 19:10:58', 0),
(18, 92776960, 46, '2024-11-20 00:39:31', 0),
(19, 62804268, 47, '2024-11-20 02:39:42', 0),
(20, 81143146, 48, '2024-11-20 04:51:43', 0),
(21, 59474598, 49, '2024-11-20 05:04:05', 0),
(22, 63981878, 50, '2024-11-20 05:12:26', 0),
(23, 6391503, 51, '2024-11-20 05:30:19', 0),
(24, 98211983, 52, '2024-11-20 05:51:13', 0),
(25, 63847485, 53, '2024-11-20 05:52:40', 0),
(26, 43613758, 54, '2024-11-20 06:38:53', 0),
(27, 92975045, 55, '2024-11-20 06:51:41', 0),
(28, 63961388, 56, '2024-11-20 06:58:08', 0),
(29, 38038232, 57, '2024-11-20 07:29:05', 0),
(30, 79077911, 58, '2024-11-20 07:37:02', 0),
(31, 93784920, 59, '2024-11-20 08:01:33', 0),
(32, 84225677, 60, '2024-11-20 08:12:26', 0),
(35, 88549410, 63, '2024-11-20 08:59:08', 0),
(37, 6437228, 65, '2024-11-20 09:20:30', 0),
(38, 19645560, 66, '2024-11-20 09:22:32', 0),
(39, 12875116, 67, '2024-11-20 09:26:12', 0),
(40, 3591908, 68, '2024-11-20 09:53:44', 0),
(41, 9995856, 69, '2024-11-20 09:57:27', 0),
(42, 62074834, 70, '2024-11-20 10:14:13', 0),
(43, 49018823, 71, '2024-11-20 10:36:21', 0),
(44, 25386102, 72, '2024-11-20 10:52:53', 0),
(47, 83910112, 75, '2024-11-20 11:07:23', 0),
(49, 82863607, 77, '2024-11-20 11:39:52', 0),
(50, 88250817, 78, '2024-11-20 11:42:11', 0),
(51, 25010090, 79, '2024-11-20 11:52:45', 0),
(52, 96161870, 80, '2024-11-20 12:09:03', 0),
(53, 72050834, 81, '2024-11-20 12:18:58', 0),
(54, 97665485, 82, '2024-11-20 13:52:26', 0),
(56, 28641710, 84, '2024-11-20 13:56:26', 0),
(57, 93162141, 85, '2024-11-20 14:13:12', 0),
(58, 68702412, 86, '2024-11-20 14:13:13', 0),
(60, 58271801, 88, '2024-11-20 14:18:17', 0),
(62, 42159122, 90, '2024-11-20 14:28:33', 0),
(64, 86261767, 92, '2024-11-20 14:34:22', 0),
(65, 2246104, 93, '2024-11-20 14:38:04', 0),
(66, 27899594, 94, '2024-11-20 14:55:46', 0),
(67, 92925699, 95, '2024-11-20 14:57:31', 0),
(68, 65108311, 96, '2024-11-20 14:59:23', 0),
(69, 96585127, 97, '2024-11-20 15:06:55', 0),
(70, 92757937, 98, '2024-11-20 15:22:42', 0),
(71, 49626522, 99, '2024-11-20 15:29:18', 0),
(72, 94000403, 100, '2024-11-20 15:48:39', 0),
(73, 52222073, 101, '2024-11-20 15:56:51', 0),
(74, 87889761, 102, '2024-11-20 16:05:27', 0),
(75, 11085825, 103, '2024-11-20 16:17:11', 0),
(76, 29248818, 104, '2024-11-20 16:24:37', 0),
(77, 41923060, 105, '2024-11-20 16:24:47', 0),
(78, 35368782, 106, '2024-11-20 16:27:18', 0),
(79, 50395611, 107, '2024-11-20 16:29:08', 0),
(81, 71995392, 109, '2024-11-20 16:59:30', 0),
(82, 70765882, 110, '2024-11-20 17:03:57', 0),
(84, 61612617, 112, '2024-11-20 17:34:07', 0),
(85, 75098819, 113, '2024-11-20 17:51:25', 0),
(87, 92600672, 115, '2024-11-20 17:59:06', 0),
(88, 6727668, 116, '2024-11-20 18:07:24', 0),
(89, 36890621, 117, '2024-11-20 18:19:30', 0),
(91, 58535139, 119, '2024-11-20 18:33:21', 0),
(92, 20172858, 120, '2024-11-20 18:43:58', 0),
(93, 92496052, 121, '2024-11-20 18:51:58', 0),
(94, 82131672, 122, '2024-11-20 18:52:41', 0),
(95, 21856344, 123, '2024-11-20 18:53:13', 0),
(96, 7372104, 124, '2024-11-20 18:55:06', 0),
(97, 23160506, 125, '2024-11-20 19:07:15', 0),
(98, 84888171, 126, '2024-11-20 19:11:29', 0),
(99, 48420674, 127, '2024-11-20 19:14:24', 0),
(101, 91159726, 129, '2024-11-20 19:30:56', 0),
(102, 47678555, 130, '2024-11-20 19:45:13', 0),
(103, 8911079, 131, '2024-11-20 19:51:47', 0),
(104, 61995481, 132, '2024-11-20 20:12:20', 0),
(105, 95618197, 133, '2024-11-20 20:53:06', 0),
(106, 91586004, 134, '2024-11-20 21:18:39', 0),
(107, 99975334, 135, '2024-11-20 21:59:35', 0),
(108, 32286742, 136, '2024-11-20 22:07:08', 0),
(109, 92886737, 137, '2024-11-20 22:07:46', 0),
(110, 68676126, 138, '2024-11-20 22:14:30', 0),
(111, 63613019, 139, '2024-11-20 22:30:04', 0),
(112, 88903259, 140, '2024-11-20 23:14:44', 0),
(113, 20040886, 141, '2024-11-20 23:37:35', 0),
(114, 96816744, 142, '2024-11-20 23:41:48', 0),
(115, 54858711, 143, '2024-11-21 00:03:16', 0),
(116, 4722660, 144, '2024-11-21 00:09:12', 0),
(117, 5390400, 145, '2024-11-21 00:30:04', 0),
(118, 89773892, 146, '2024-11-21 00:35:20', 0),
(119, 55303339, 147, '2024-11-21 00:57:52', 0),
(120, 5796902, 148, '2024-11-21 01:13:22', 0),
(121, 69018878, 149, '2024-11-21 01:16:31', 0),
(122, 68392134, 150, '2024-11-21 01:37:32', 0),
(123, 89622878, 151, '2024-11-21 01:56:05', 0),
(124, 31548024, 152, '2024-11-21 02:12:34', 0),
(125, 22580832, 153, '2024-11-21 02:45:29', 0),
(126, 32722618, 154, '2024-11-21 03:00:05', 0),
(127, 72413704, 155, '2024-11-21 03:18:11', 0),
(128, 90494478, 156, '2024-11-21 03:26:09', 0),
(130, 51349276, 158, '2024-11-21 03:52:34', 0),
(131, 13295856, 159, '2024-11-21 04:01:17', 0),
(132, 78643672, 160, '2024-11-21 04:22:15', 0),
(133, 36992319, 161, '2024-11-21 05:29:08', 0),
(134, 3773458, 162, '2024-11-21 05:46:32', 0),
(135, 87027973, 163, '2024-11-21 06:22:01', 0),
(136, 57838669, 164, '2024-11-21 07:24:52', 0),
(138, 34089014, 166, '2024-11-21 08:01:09', 0),
(140, 85083093, 168, '2024-11-21 08:24:47', 0),
(141, 27232995, 169, '2024-11-21 08:42:31', 0),
(142, 50992156, 170, '2024-11-21 08:57:15', 0),
(143, 27890056, 171, '2024-11-21 09:12:29', 0),
(144, 41959091, 172, '2024-11-21 09:18:44', 0),
(145, 93178007, 173, '2024-11-21 09:19:11', 0),
(146, 32496080, 174, '2024-11-21 09:30:20', 0),
(148, 58939745, 176, '2024-11-21 09:41:22', 0),
(149, 75595541, 177, '2024-11-21 10:14:19', 0),
(150, 34931612, 178, '2024-11-21 10:26:11', 0),
(151, 58472490, 179, '2024-11-21 10:34:21', 0),
(152, 7721398, 180, '2024-11-21 11:06:12', 0),
(153, 31753955, 181, '2024-11-21 11:17:19', 0),
(154, 73120689, 182, '2024-11-21 11:33:19', 0),
(155, 68538680, 183, '2024-11-21 12:14:13', 0),
(156, 20401610, 184, '2024-11-21 12:21:43', 0),
(158, 40170125, 186, '2024-11-21 12:32:22', 0),
(159, 11253777, 187, '2024-11-21 12:37:07', 0),
(161, 12120522, 189, '2024-11-21 12:47:27', 0),
(162, 26513484, 190, '2024-11-21 12:56:14', 0),
(163, 58192322, 191, '2024-11-21 12:59:19', 0),
(164, 50078920, 192, '2024-11-21 13:04:57', 0),
(165, 99232887, 193, '2024-11-21 13:10:18', 0),
(166, 11261706, 194, '2024-11-21 13:42:36', 0),
(167, 44591123, 195, '2024-11-21 13:55:15', 0),
(168, 23860541, 196, '2024-11-21 13:59:54', 0),
(169, 31529045, 197, '2024-11-21 14:06:54', 0),
(170, 3961377, 198, '2024-11-21 14:12:15', 0),
(172, 85676561, 200, '2024-11-21 14:17:49', 0),
(174, 63052616, 202, '2024-11-21 14:23:14', 0),
(175, 63193745, 203, '2024-11-21 14:46:52', 0),
(176, 57881731, 204, '2024-11-21 14:48:29', 0),
(177, 15791238, 205, '2024-11-21 14:54:49', 0),
(178, 55700507, 206, '2024-11-21 15:02:50', 0),
(179, 98196022, 207, '2024-11-21 15:04:16', 0),
(180, 55767035, 208, '2024-11-21 15:17:44', 0),
(182, 14713602, 210, '2024-11-21 15:24:18', 0),
(183, 83274522, 211, '2024-11-21 15:32:10', 0),
(184, 14668343, 212, '2024-11-21 15:35:04', 0),
(185, 75945487, 213, '2024-11-21 15:35:30', 0),
(186, 4380392, 214, '2024-11-21 15:44:12', 0),
(187, 91108824, 215, '2024-11-21 15:57:13', 0),
(188, 43670827, 216, '2024-11-21 16:05:34', 0),
(189, 24430355, 217, '2024-11-21 16:13:25', 0),
(190, 42776635, 218, '2024-11-21 16:17:53', 0),
(191, 68263041, 219, '2024-11-21 16:19:15', 0),
(192, 93017556, 220, '2024-11-21 16:26:23', 0),
(193, 27154696, 221, '2024-11-21 16:36:11', 0),
(194, 55101110, 222, '2024-11-21 16:36:49', 0),
(196, 58331155, 224, '2024-11-21 17:14:36', 0),
(197, 7992427, 225, '2024-11-21 17:18:29', 0),
(198, 21119209, 226, '2024-11-21 17:27:20', 0),
(200, 73870788, 228, '2024-11-21 17:53:22', 0),
(201, 98842909, 229, '2024-11-21 18:07:22', 0),
(202, 86013229, 230, '2024-11-21 18:11:59', 0),
(204, 2656364, 232, '2024-11-21 18:43:10', 0),
(205, 72452612, 233, '2024-11-21 18:52:37', 0),
(206, 81546132, 234, '2024-11-21 18:55:33', 0),
(207, 85930737, 235, '2024-11-21 18:59:33', 0),
(208, 85874686, 236, '2024-11-21 19:16:56', 0),
(209, 39835028, 237, '2024-11-21 19:26:44', 0),
(210, 38409887, 238, '2024-11-21 19:36:18', 0),
(211, 88652633, 239, '2024-11-21 19:38:26', 0),
(212, 80215731, 240, '2024-11-21 20:14:18', 0),
(213, 68891663, 241, '2024-11-21 20:27:36', 0),
(214, 38321794, 242, '2024-11-21 20:29:06', 0),
(215, 98003627, 243, '2024-11-21 20:35:11', 0),
(216, 4084546, 244, '2024-11-21 20:42:38', 0),
(217, 89422930, 245, '2024-11-21 21:19:20', 0),
(218, 67948249, 246, '2024-11-21 21:33:52', 0),
(219, 94722208, 247, '2024-11-21 21:37:33', 0),
(220, 64127087, 248, '2024-11-21 22:23:04', 0),
(221, 55394898, 249, '2024-11-21 22:33:22', 0),
(222, 13566232, 250, '2024-11-21 22:59:26', 0),
(223, 79267172, 251, '2024-11-21 23:46:28', 0),
(224, 67324450, 252, '2024-11-21 23:46:28', 0),
(225, 92880183, 253, '2024-11-21 23:48:55', 0),
(226, 88180203, 254, '2024-11-22 00:01:45', 0),
(227, 4778313, 255, '2024-11-22 00:19:03', 0),
(228, 29372449, 256, '2024-11-22 00:48:52', 0),
(229, 34253526, 257, '2024-11-22 00:58:28', 0),
(230, 97370301, 258, '2024-11-22 02:24:11', 0),
(231, 74448598, 259, '2024-11-22 02:34:11', 0),
(232, 94384738, 260, '2024-11-22 03:31:19', 0),
(233, 12257042, 261, '2024-11-22 04:19:06', 0),
(234, 90753829, 262, '2024-11-22 04:25:25', 0),
(235, 81790413, 263, '2024-11-22 05:14:10', 0),
(236, 55994411, 264, '2024-11-22 05:39:05', 0),
(237, 813178, 265, '2024-11-22 08:10:19', 0),
(238, 12987359, 266, '2024-11-22 08:12:42', 0),
(239, 66081697, 267, '2024-11-22 08:43:01', 0),
(240, 36530278, 268, '2024-11-22 08:45:48', 0),
(241, 60332863, 269, '2024-11-22 09:06:54', 0),
(242, 96868314, 270, '2024-11-22 09:16:56', 0),
(243, 34328070, 271, '2024-11-22 09:26:20', 0),
(244, 70940805, 272, '2024-11-22 09:42:58', 0),
(245, 94815040, 273, '2024-11-22 09:45:08', 0),
(246, 8914653, 274, '2024-11-22 10:34:45', 0),
(247, 14166685, 275, '2024-11-22 10:38:19', 0),
(248, 33503835, 276, '2024-11-22 11:16:29', 0),
(249, 22489431, 277, '2024-11-22 11:51:56', 0),
(250, 18328097, 278, '2024-11-22 12:10:05', 0),
(251, 47805350, 279, '2024-11-22 12:17:01', 0),
(252, 38919749, 280, '2024-11-22 12:23:32', 0),
(253, 23969902, 281, '2024-11-22 12:39:47', 0),
(254, 54277346, 282, '2024-11-22 13:08:47', 0),
(255, 44345137, 283, '2024-11-22 13:35:52', 0),
(256, 62853865, 284, '2024-11-22 13:36:33', 0),
(257, 67395728, 285, '2024-11-22 14:06:44', 0),
(258, 81286244, 44, '2024-11-22 14:09:23', 0),
(259, 96454887, 44, '2024-11-22 14:09:56', 0),
(260, 86409791, 286, '2024-11-22 14:19:30', 0),
(261, 19368195, 44, '2024-11-22 14:21:15', 0),
(262, 18399872, 287, '2024-11-22 14:50:10', 0),
(263, 8836432, 288, '2024-11-22 14:51:37', 0),
(264, 24905336, 289, '2024-11-22 14:56:29', 0),
(265, 79726492, 290, '2024-11-22 14:58:53', 0),
(266, 88716853, 291, '2024-11-22 15:03:16', 0),
(267, 51772733, 292, '2024-11-22 15:04:33', 0),
(268, 49118889, 293, '2024-11-22 15:09:02', 0),
(269, 78626217, 294, '2024-11-22 15:14:58', 0),
(270, 31216713, 295, '2024-11-22 15:17:59', 0),
(271, 53944835, 296, '2024-11-22 15:33:48', 0),
(272, 47546326, 44, '2024-11-22 15:36:08', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Reservation_Date` datetime NOT NULL,
  `Expected_Party_Size` int NOT NULL,
  `Business` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `reservations`
--

INSERT INTO `reservations` (`ID`, `User_ID`, `Reservation_Date`, `Expected_Party_Size`, `Business`) VALUES
(1, 7, '2024-11-15 01:00:00', 1, 0),
(2, 7, '2024-11-13 18:30:00', 2, 0),
(3, 8, '2024-11-28 17:00:00', 12, 0),
(4, 9, '2025-05-29 18:30:00', 2, 0),
(5, 9, '2025-05-29 18:00:00', 2, 0),
(6, 9, '2024-12-04 18:30:00', 2, 0),
(7, 43, '2024-11-30 18:30:00', 5, 0),
(8, 193, '1970-01-01 01:00:00', 50, 0),
(10, 193, '2024-11-28 17:30:00', 50, 0),
(11, 43, '2024-11-06 14:00:00', 10, 0),
(12, 4, '2024-11-28 16:00:00', 25, 0),
(13, 4, '1970-01-01 01:00:00', 1, 0),
(14, 44, '1970-01-01 01:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservations_tables`
--

DROP TABLE IF EXISTS `reservations_tables`;
CREATE TABLE IF NOT EXISTS `reservations_tables` (
  `Reservation_ID` int NOT NULL,
  `Table_ID` int NOT NULL,
  KEY `Reservation_ID` (`Reservation_ID`),
  KEY `Table_ID` (`Table_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `reservations_tables`
--

INSERT INTO `reservations_tables` (`Reservation_ID`, `Table_ID`) VALUES
(1, 1),
(2, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 8),
(8, 1),
(8, 2),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(3, 8),
(3, 9),
(10, 1),
(10, 2),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(12, 10),
(12, 11),
(12, 12),
(13, 3),
(14, 4),
(14, 5),
(11, 12);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Score` int NOT NULL,
  `Comment` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Reservation_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Reservation_ID` (`Reservation_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Capacity` int NOT NULL,
  `Description` text COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'kinti/benti',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `tables`
--

INSERT INTO `tables` (`ID`, `Capacity`, `Description`) VALUES
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
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email_Address` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Hash` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Username` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Validated` tinyint(1) NOT NULL,
  `Registration_Date` datetime NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `Email_Address`, `Hash`, `Username`, `Validated`, `Registration_Date`, `Admin`) VALUES
(4, 'admin@gmail.com', '$2b$10$nzk.WdmBPqMXNKINioqtWuIbIDY1IFvTvRnH76SbJ4yeABze7CFf6', 'Admin', 1, '2024-11-03 13:58:19', 1),
(5, 'Deleted@deleted.com', '$2b$10$Superinvalidpassword', 'Bin', 1, '2024-11-08 14:11:50', 0),
(6, 'eztamugysefogjasenkilatnirajtamkivul@a.com', '$2b$10$XWYmqEXLrEpuPZ647wrqX.cNWQowsrSgpF8Qnw./gbWib.LTDayli', 'Csanád', 0, '2024-11-13 19:04:36', 0),
(7, 'sfd@sdsa', '$2b$10$5izLSnruudwJOooeS6wbCOItimcRlc.kfz/EvF81fjhErfb5vrlfa', 'dfsdf', 0, '2024-11-13 19:11:03', 0),
(8, 'stak@gmail.com', '$2b$10$YCq3AJ/k8Hg1deGlrM/uEOp965tqvxXHOwq79LdFOwNQWFMOusZFC', 'stak', 0, '2024-11-13 19:21:10', 0),
(9, 'akos.mango@gmail.com', '$2b$10$2RPswI1Jts60wwC70wkRE.y6FucZMnwwkzPR5sLdmNluzl7EQkSTC', 'akos', 0, '2024-11-13 19:36:07', 0),
(42, 'viten13186@operades.com', '$2b$10$Jp9byQ8THF5gUpT1vKUkw.Tw4aElfPct3IYTd2Ho8qCtWCw.Vb/B6', 'mókustetem', 1, '2024-11-16 15:40:12', 0),
(43, 'proba1@gmail.com', '$2b$10$6IaLwkcYzu8f8cyMGFLqSukdruv1QQvTIpolRc58EeFvaxBMA6qRu', 'proba1', 0, '2024-11-16 17:50:11', 0),
(44, 'gugla9@gmail.com', '$2b$10$QWxlA1B1/ckCv4TLZ9v71umbuMSXMplQiGkxNkrAr0AEzuqttHZt.', 'gugla9@gmail.com', 0, '2024-11-16 17:53:24', 0),
(45, 'laurinyeczbusiness@gmail.com', '$2b$10$puSrclbBV/129t3HvmSrhOmUFZf5s8O2URwDUmt87taS1A4p0ayZ.', 'ninjonpotatozvelesipszilonnal', 0, '2024-11-18 19:10:58', 0),
(46, 'sterens880@gmail.com', '$2b$10$wJBy651adaIXqhm.aJ9gGOZeFpn.XBqnfKTkas9Izss.2nzQt6gae', 'SMlgkEzBANpu', 0, '2024-11-20 00:39:31', 0),
(47, 'silverio.carolina@gmail.com', '$2b$10$NEYl4L11iRDtvyCtT/nfJeRwnwHRAyTNOl0y1YHPSzlptX.qE4PL.', 'yGjmBUqD', 0, '2024-11-20 02:39:42', 0),
(48, 'marcip@comcast.net', '$2b$10$ez8RwNyvGsfNQOsyZvp0ZupqwfG5w8PvcFjqTwmbvdD9NTqh7OEFO', 'tyaILEYcCanmTS', 0, '2024-11-20 04:51:43', 0),
(49, 'lovelytipsbyaj@gmail.com', '$2b$10$sZH851YFJYsUkdoyVIcDDuPVlTxCfSOE2i42LOLrrlV9bM5/poSDW', 'fKNuBRLZ', 0, '2024-11-20 05:04:05', 0),
(50, 'julieta.rigo@gmail.com', '$2b$10$kLZ2FguvMZtEvT0JX2Y2EOh8ViqlMyvu/iXgLV4lKmK2p9Y7samRW', 'wKeXHSwRnbRG', 0, '2024-11-20 05:12:26', 0),
(51, 'isolacaraibica@yahoo.com', '$2b$10$GRbVkIBfCLBxMC73KSMndOwpC736TuCtw1MBZOh1fEsN4Dfzf6oku', 'JPhQyNfKTSG', 0, '2024-11-20 05:30:19', 0),
(52, 'maurice.paul3@gmail.com', '$2b$10$qg5qbWaavwnBkRbgToqc3u4YtapFBD2VL8kuAyGiapq2PITDq1MnK', 'VPGxKFdyzZah', 0, '2024-11-20 05:51:13', 0),
(53, 'egorovkot23@gmail.com', '$2b$10$HGTbGggYvFicwNmePf6xRe11YM9uFj5E0Hw.pTqfyKvnO/xOCIzEq', 'wCtljQvsL', 0, '2024-11-20 05:52:40', 0),
(54, 'mr.lyn.hodson@gmail.com', '$2b$10$lnRvvUfY1DfxKLvoDg4A1eEXOmYgU4.UkLV/uVEzz5KaKf3O9EUbG', 'TzZMfepkkT', 0, '2024-11-20 06:38:53', 0),
(55, 'phil68gtx440@gmail.com', '$2b$10$TYvN8qM0/YvEQsvVpSKWJuKNbbLLyn3SKp1DgH0dc3ALrzR.vCsxa', 'GMUkuCNRrml', 0, '2024-11-20 06:51:41', 0),
(56, 'pilarreano@hotmail.com', '$2b$10$hhTsUR5EEvRviJ2/6umE8.n/4FeVc5UK0c0fALV/Ztz42cniUcA6O', 'mazlCEFLwzdd', 0, '2024-11-20 06:58:08', 0),
(57, 'mandymcclish83@gmail.com', '$2b$10$icfQef0AImBS..9As2Nx4O/69dsx3t41JJNhI5BoqNQU4K3jwSfHS', 'DHFvQCmxxGO', 0, '2024-11-20 07:29:05', 0),
(58, 'tonye@lafayettezl.com', '$2b$10$chV0cTq535pjovUuoY6nLOjuXYPo46sW8qQ77UGCCw5T9gBA1n87S', 'JJXxtkBsx', 0, '2024-11-20 07:37:02', 0),
(59, 'kekoa.nichols@gmail.com', '$2b$10$tSc2YGjoF.luo0m0manznePuWrc2FYcx6wOvZFr59Lmmq1losZrOq', 'EiTlPvQKwtYqiY', 0, '2024-11-20 08:01:33', 0),
(60, 'wrensummers@gmail.com', '$2b$10$LgFcvRJp0zs.yiz34GdV9u7n6w6GztvO43AY74aoRAoSNZhpW115C', 'AMPWBSePWuU', 0, '2024-11-20 08:12:26', 0),
(61, 'alexander.maderer@feintool.com', '$2b$10$6sJA.Xjh3xvVtA9Q2WWOwOsqYynX1wrKFMA5zu0qq1qN9TT1T1T.2', 'vtWrUhRuYojQPiI', 1, '2024-11-20 08:44:30', 0),
(62, 'adrian.lowery@evelyn.com', '$2b$10$GD4eC1NR6SwZLoJNDYT0XeONFR9upZY5gPgIzKk/tQZzpeWp0tgw6', 'bMIoulQzQUcmQ', 1, '2024-11-20 08:51:29', 0),
(63, 'daniel.stoilaki@paysafe.com', '$2b$10$Z21.BLqJ60csImy5ymBW8.Imi19HKOtNcegYka/iadB5RlH63bUJC', 'ygiUeUOlEIhWLW', 0, '2024-11-20 08:59:08', 0),
(64, 'andm@bankingcircle.com', '$2b$10$k2tLgFoSFloXgoOuGGvbHO7MlE0MuHZ2/J2tWhLOGG2jqLxuwR2Aq', 'beuUGAEcQNMjFT', 1, '2024-11-20 09:18:30', 0),
(65, 'bartlomiej.heine@formeld.com', '$2b$10$n7WpA46MHmgYQ6Tt0OIiuun.nnW5qC0gmuy4bJ2ejXko5KgB7bPP.', 'fBtMSfBhiU', 0, '2024-11-20 09:20:30', 0),
(66, 'nerdz.da@gmail.com', '$2b$10$NGa3K0iLPHtN/rF8Ob2p2epjJ8Q6b2g/aufzUT/de8o1LeCZhdyde', 'uzQmOEMFWf', 0, '2024-11-20 09:22:32', 0),
(67, 'heintzman1@hotmail.com', '$2b$10$ujT1qNfVO9Jnfh.ZA96dwu1fmjxqUsmBgr2gE8FaTSQubs0H9XtRS', 'oVgTDQbfIZRM', 0, '2024-11-20 09:26:12', 0),
(68, 'hideko5620@hotmail.com', '$2b$10$6s/eF3qi2G9xab1B3UcAku6BZTEEll5NTehRQGPVyjyMqpxeG2VZy', 'bBmTmDWr', 0, '2024-11-20 09:53:44', 0),
(69, 'maria.j.m.e@orange.fr', '$2b$10$bqDqjfXqM45a.qz4CUH1OeE0kwJh4GtIHxbMr5X1Yf0Jz4DWsasTq', 'fzdaGDYjgOoWgGz', 0, '2024-11-20 09:57:27', 0),
(70, 'jason.riseborough@investec.co.uk', '$2b$10$KBWWCLFHfNRSC/GboxzhVeD73BCYnj4VAG4T0GWiXrrend3gxo2HK', 'zEAPREtlyyYkSb', 0, '2024-11-20 10:14:13', 0),
(71, 'lucinda.moule@hotmail.co.uk', '$2b$10$4XWFCRQOIYHbPJfMOF1xvun6Asv8abd2NqadZdn0Bk8z0a6D.bcW6', 'BQFytkCzkb', 0, '2024-11-20 10:36:20', 0),
(72, 'dirk.friedrich@eggersmann.com', '$2b$10$WH1sbM1eRN.fhcUIqZkdq.60tMxNZG7BwEoLzOGQJuHlftnkNTDNq', 'OsbWoiRlEcIEfRp', 0, '2024-11-20 10:52:53', 0),
(73, 'djibril.badarou@epluse.com', '$2b$10$8FjT4fOolt1zazGsTqeBH.TspxudMkFSERMOY8H6y76.sP1bDy5RS', 'YxmiPNUNgb', 1, '2024-11-20 10:53:43', 0),
(74, 'jackie.mullinor@tracs.com', '$2b$10$3Db2rZHDC91U45lRq.Nef.7.3xwWJlfedV6PB39eMrss.ClDHS7me', 'AzjmcWwp', 1, '2024-11-20 10:54:32', 0),
(75, 'apinlb@gmail.com', '$2b$10$YTUVirUUKeqEEXVW8SCeU.QDPzSdAwz/K1cxORvvSkH0qtobYKBs2', 'HKVaXrEYN', 0, '2024-11-20 11:07:23', 0),
(76, 'j.hilal@finance-in-motion.com', '$2b$10$L7GIGF8phR.qq1XsibyFye17ndsJhi0infVug7P9Vwb7hieSoe0.K', 'awVvqKanxnB', 1, '2024-11-20 11:08:48', 0),
(77, 'yves1776@yahoo.com', '$2b$10$9mVhPT65CO1mgf/ywpDVpuguYmm/FlMvNVoe7bSLMFD38xkG1adC.', 'VkiAehnLVYLaG', 0, '2024-11-20 11:39:51', 0),
(78, 'alexandra@luxurycruiseconnections.com', '$2b$10$XuPRJsVhgUl4EgFqb23ef.Ddbcm0uHwdo2LAe1XSVzgHlhhmHSNYi', 'peeLnxaI', 0, '2024-11-20 11:42:11', 0),
(79, 'jhonny@foresttravel.com', '$2b$10$himrlHh5WxFr0FP.34PLROVvreDW4rbX9nqkfoQI0rDkVzR1rZo.O', 'uSwDmYKNPCS', 0, '2024-11-20 11:52:45', 0),
(80, 'claudiav@foresttravel.com', '$2b$10$OOzaSIWd4NKtZTHCwf/FmO5cyYVOnjmWfDk2y84gwYdSy1UsbuFYS', 'AbXSWJXhPJ', 0, '2024-11-20 12:09:03', 0),
(81, 'jmaidan@maidanglobal.com', '$2b$10$/6UeCi7.nG3.Of1ZVeJY5.9WftWDdbes9pWWj9zZLBBO9AsRvy1Wu', 'TuCkrdPK', 0, '2024-11-20 12:18:57', 0),
(82, 'pcmonceff@gmail.com', '$2b$10$EBKuAFvWuzrBcdflUPnZcexzit1hGFOEqRchI/6wWtQR/Ht88iDQu', 'NyzBDeXaFKysMmW', 0, '2024-11-20 13:52:26', 0),
(83, 'pnygren@aanddtech.com', '$2b$10$CyD0g/wvrKvI3pb74QzBle803oZkhWO5WyF7eGrLYlo6Gxu5AJVDy', 'kWpPAgcaQe', 1, '2024-11-20 13:55:49', 0),
(84, 'josh.flegg@qa.com', '$2b$10$GSetGXJ.FFRPh8Iub8SbYeVWEwBDLJMail0VgENSR11JdnTA0bgZu', 'gGEpuqXTwCm', 0, '2024-11-20 13:56:26', 0),
(85, 'shelzel@hotmail.com', '$2b$10$zOPC4MLUTY9W/AdFdg947uNX0vWe89DPFSlL8dMSdFG/odYqUrpue', 'oRUAqYUlibLj', 0, '2024-11-20 14:13:12', 0),
(86, 'blbracher@gmail.com', '$2b$10$wBLoxta4DAMlhB56k1P66OLv/8UCgu5/D2PE5FSJXkctdXuwdJiXO', 'uCqnPNrpFlPnjTS', 0, '2024-11-20 14:13:13', 0),
(87, 'john.bell@ryerson.com', '$2b$10$igS8PVVDc6.KR9qGRCPxOufv.4IgZnObg0KZ2Gk2KP8ATwYXYOWlO', 'wxVLgyKniSJSSA', 1, '2024-11-20 14:13:40', 0),
(88, 'moriah.brunell@schreiberfoods.com', '$2b$10$sNMjwt/lYR11sNcpFphrHufXZhJt2igijEQP1nvnYfQqaFUb5I.z6', 'BdBQjjSW', 0, '2024-11-20 14:18:17', 0),
(89, 'cody.ellender@westlake.com', '$2b$10$M48VkTuoNjm19xZ1O.krFua2JPjJ9k8.MuAEQmOqzPn6UJ3KLz1/a', 'uFJatWngOtmYHmV', 1, '2024-11-20 14:23:35', 0),
(90, 'kleinj@rushenterprises.com', '$2b$10$k0rZWuaAad1UHotvuRikGeaDAIXowe.W.pgid1u2EDDGJKmCaRWae', 'SGGXySKj', 0, '2024-11-20 14:28:33', 0),
(91, 'amnish.patel@specsavers.com', '$2b$10$key1cKdfIcpmdbKV/k89/eNvTKqrlS0wYn5xE62WcW3MGgUhg1V8e', 'NNNoilbSTd', 1, '2024-11-20 14:31:33', 0),
(92, 'cikowskie@gmail.com', '$2b$10$PVPEW0rnwm2WFFFrJnsRZu4ZMPXKhPlYSoJq0lGzikaZLkYuP3h5W', 'QgzLeVJA', 0, '2024-11-20 14:34:22', 0),
(93, 'christie.bourque@talosenergy.com', '$2b$10$4xd2UD/jIU0O2berTIysO.c048aPoRqSLrCxqSGXxKK7xualO4NOe', 'mrXDmBCnI', 0, '2024-11-20 14:38:04', 0),
(94, 'nowmycast001@gmail.com', '$2b$10$OumT0dv3fOSELODJHG17juIWOXFtQSGeu0PACGbZ2kop.3gxyMRWe', 'nqgmmFfWWunyBUe', 0, '2024-11-20 14:55:46', 0),
(95, 'austin.kenneth2@gmail.com', '$2b$10$jLV7zAaDkIWoa6I0nYSzgeCUmenrl3AelJf1ZlSSQf6nJ6jVLa/Eu', 'wsmikTMjgyoIui', 0, '2024-11-20 14:57:31', 0),
(96, 'ethan.dutton@whiting-turner.com', '$2b$10$O/l3eV/Re20rh0zpzLnVq.vUB5JJ6n7H8nzD/VQ3H1tw3tjsuHNOm', 'aiQhiwLvxwkkJ', 0, '2024-11-20 14:59:23', 0),
(97, 'ernane_bruno@hotmail.com', '$2b$10$QLnLe/ZTSX57JxL0y5yGa.iQHgKg3MXYBfhXvY4IbK56SbJDQX2PS', 'oiRWBmcjdhfEjJp', 0, '2024-11-20 15:06:55', 0),
(98, 'dispatch@a2vlogistics.com', '$2b$10$7n5kAXyfhKsJ9QVOHAjH8.gj5W8jV28oQ1ExCKTDoKKxuRHcaL96i', 'gHQhHFMjZbcRU', 0, '2024-11-20 15:22:42', 0),
(99, 't-hernandez@satx.rr.com', '$2b$10$Md4RGZjoJDC/gpplm3kQjO8OCdAnPyrvaxuLfQSRbE3M8FHKSWPJW', 'aHXOYeLnoiOqdwQ', 0, '2024-11-20 15:29:18', 0),
(100, 'anthonyp2370@gmail.com', '$2b$10$S3DtG5JRLCnGHjxPtfZZl.80B9nFdhtHu2E.MnrQwAQMDKFI3tXaO', 'aVUeEenNNA', 0, '2024-11-20 15:48:39', 0),
(101, 'j.j.mehilba@gmail.com', '$2b$10$DDQuC.AfLWdqjynwUvbVaeWM5E02dQxmT37R7fQ95wjt/7wsm8ZMa', 'IgYNcdvHgqPef', 0, '2024-11-20 15:56:51', 0),
(102, 'janet.fisher45@gmail.com', '$2b$10$fZqlJ0qZ1i1El/BtC7Dem.xEJY4GqRaEGewU8AY4s0JNcaT5UB3qe', 'ozrXIThmQLuAJdl', 0, '2024-11-20 16:05:27', 0),
(103, 'dantig@comcast.net', '$2b$10$OX.E5wFXSElWxfJRLXM/meDry5Pd/QO.RDvRuCfL/P00.gAKiC7tO', 'VQFEqiky', 0, '2024-11-20 16:17:11', 0),
(104, 'hardinstefan@gmail.com', '$2b$10$v0tWA9s8oh8hhSoBqGPKoueufXGOa9W6dofyC9f49bGSjh/A5bAN.', 'yzSqGlcz', 0, '2024-11-20 16:24:37', 0),
(105, 'r3a75r@gmail.com', '$2b$10$FkeNjPgU7E9E/zc2B5h5yuY6LqqcXq2mbfs5y39DJAIvWXJfG7Nf.', 'JbVTDPVyZwhko', 0, '2024-11-20 16:24:47', 0),
(106, 'ehartman6@gmail.com', '$2b$10$t4K2f7V6QZqgpal/DsW/rubt4kBkIvv8AU5HNRLFz0KSTYSRrK8fO', 'PbiPTraf', 0, '2024-11-20 16:27:18', 0),
(107, 'rosa@foresttravel.com', '$2b$10$ofiInnoiCx6dwZyipLapf.HIfDIeWZFS41MR8ra/.sm.oY2RH8LF.', 'GntBAoufTvLAm', 0, '2024-11-20 16:29:08', 0),
(108, 'lee.walters@waldenu.edu', '$2b$10$hlLRYDYEntuAQC3umal1xONZtQdPYNRzk3lFQ8QxCS2.8BphQlvoq', 'xKslPfGyHhBMjT', 1, '2024-11-20 16:47:49', 0),
(109, 'aduffield@bmwlondon.ca', '$2b$10$6tfmyP/0otEjLaRkGc4eMucalqcvnNxuqKPciE8lXSd39VMpBMKAq', 'bKyyopmgxTJ', 0, '2024-11-20 16:59:30', 0),
(110, 'katman316@gmail.com', '$2b$10$xFBz88fSdZigkPHV45nNm.6sKyRgrPLSNL0GLEUGCQM/75U.Wxdc.', 'YcTDbWYUNhI', 0, '2024-11-20 17:03:57', 0),
(111, 'shimohammed@pricesmart.com', '$2b$10$lyOcQE1ahwwg4Nz/3fPbWuJy7WNZxyFoF3VeeWQKUGgSv1yt8pv2e', 'KXQgFCsPixu', 1, '2024-11-20 17:26:57', 0),
(112, 'efiatony@outlook.com', '$2b$10$Cz43izj3QIIwJIK74yMQz.Hq19EBIMssGQYYw7wj8/rWZYckJsoQq', 'dZYAAsZwJzlBh', 0, '2024-11-20 17:34:07', 0),
(113, 'ramiro.garcia@molex.com', '$2b$10$oXo26Y46P/6SpG0L99.Clur53KURPCNKTfnbU/cv/rPSNrfssdgLm', 'ijidCSvEO', 0, '2024-11-20 17:51:25', 0),
(114, 'swade@247expresslogistics.com', '$2b$10$wkLv1487NanVCeOWJpIUrexGu69ovrZhyJcD0Ws9VquKQD2owNT32', 'jxhjfyoMgg', 1, '2024-11-20 17:53:01', 0),
(115, 'khe97088@bigpond.net.au', '$2b$10$SDUvRDBg7HTSR3i1jtBjvOHrLbVNaj9ECQoK8WuOAPl72EHiZNG3.', 'JdVWjGCOg', 0, '2024-11-20 17:59:06', 0),
(116, 'eivanova01@gmail.com', '$2b$10$XFjC3ZySLZj66RB094GmBuu2QS8OsFoIA2SZZmYnuh9VSHYMhDmUG', 'YRREJIChKd', 0, '2024-11-20 18:07:24', 0),
(117, 'gmccue1983@gmail.com', '$2b$10$o.c0KdY.BjU5udyuiRoiVO4WV1cUPo2rPjgsx0KlCSnpx3KfeEFFi', 'lvxGOQMGfG', 0, '2024-11-20 18:19:30', 0),
(118, 'winter_p@subway.com', '$2b$10$t4maMy9Wp43/nBJFJMuhJu1OH1IP.o1lNxjhVJgyy.RgxNBhi1fjm', 'kyHiueByhcry', 1, '2024-11-20 18:28:24', 0),
(119, 'tommydye2@gmail.com', '$2b$10$YaHPXttmalrYHupkzunQMOwGWaANfX8N0djeTad42et8AONDi5ZTu', 'RuDBgNAy', 0, '2024-11-20 18:33:20', 0),
(120, 'vrukmangadan@micron.com', '$2b$10$y1Fl30IywiaiqNTs9EZ3P.HWsNduvHRVXivhZ9cJ8O1zrPK7JsSCC', 'oSIkbWYB', 0, '2024-11-20 18:43:58', 0),
(121, 'cockaleeki_1@hotmail.com', '$2b$10$gTRURiLX87dwXR9YhO0NKu7qLWGMPZq4BX5OKKjPR62Rov.jBVpI2', 'EwYlpvFe', 0, '2024-11-20 18:51:57', 0),
(122, 'javanrbrown@hotmail.com', '$2b$10$v2ubI/YJHb.6mRdBmwU8QOVuYbODNkU0dSDuOi6bGBtJmfsDqjb4u', 'PbJtCZtjPqw', 0, '2024-11-20 18:52:41', 0),
(123, 'smccaughern101@gmail.com', '$2b$10$9HQvVbHx2.shy1/YDRFzme8de9sMnLeLsyTWc12tBXOWSqw5GwB5y', 'zfaqUudKcqGHa', 0, '2024-11-20 18:53:13', 0),
(124, 'devin.chappell2@gmail.com', '$2b$10$eqHuAvGpsfrqDQ/nrkd2MOpfJQEJo6Fjrr3IBKmQ3jSa8BWUr0KT.', 'CaMyzopOhg', 0, '2024-11-20 18:55:06', 0),
(125, 'sarahfina20@gmail.com', '$2b$10$iaSCfmMIq27oNK.vrTZBr.S1wj/zoBXLcjEGLp5arMPGhgr4TJ/N.', 'hpRWdrJEAC', 0, '2024-11-20 19:07:15', 0),
(126, 'ahammer@bracheichler.com', '$2b$10$bESEuLE4rsqa5S/ovSETV.BuqQReT8K99.tne1Cbfhss8/ZrMqz1O', 'mgTxEkMP', 0, '2024-11-20 19:11:29', 0),
(127, 'jeremie.lucia@gmail.com', '$2b$10$hvLIbp1P185Gqqi1ZP0mhuBMbnbrfZHh1f0rX4/K3A8T1YxyFY5OC', 'XYsyaXGIpEV', 0, '2024-11-20 19:14:24', 0),
(128, 'achanthavong@howardandhoward.com', '$2b$10$bE2SEEKrzFEZkB4ok3i5vuSIfQQUTcKYTVORCfaUHb4aiIHmJnm5y', 'exUAnKSqWMiL', 1, '2024-11-20 19:23:21', 0),
(129, 'abarnett@genevafi.com', '$2b$10$MC4Dk4oqhbHvNHuhwo/EeOle6FVQg3FRqQmVA7oQbGv4Iy3VvXuu6', 'aomeivsr', 0, '2024-11-20 19:30:56', 0),
(130, 'freestyling2013@gmail.com', '$2b$10$QxXZs5.7gDsvNgW11jwG9.rHhl3eOYR8ShxdKTuG15ZJjPHIbqNnC', 'AtZPczMdh', 0, '2024-11-20 19:45:13', 0),
(131, 'nh.uocnhau04673@gmail.com', '$2b$10$D6C0y1AasiDnsEmKS5Bs..YVuRMbWHfHRc615nxUc5hk9bO.VlNJq', 'CzgWwDYlg', 0, '2024-11-20 19:51:47', 0),
(132, 'douglas_avilareyes@unifirst.com', '$2b$10$rzLg8eq.jD2yy1rBsyTEquUUXByXvswiuDO290HZi41GiS3LIqDnW', 'DvHssnsxowewrrL', 0, '2024-11-20 20:12:20', 0),
(133, 'niamh.mccann@hotmail.co.uk', '$2b$10$9UR2Keeylqee9Z92nnrPY.jdxWEZPEoqb.Cjb/4q.uEpN3O.TTKM2', 'eEiysniUdq', 0, '2024-11-20 20:53:06', 0),
(134, 'lorraine.adkins30@gmail.com', '$2b$10$iDqZ2EWjGEw97B0eygVbF.lacJtxUI868ZP66MDscBjyK4cJB70oi', 'reBeEOtCZdaC', 0, '2024-11-20 21:18:39', 0),
(135, 'cjhewmhycaiqu@yahoo.com', '$2b$10$1QPTxvCAO3jGjDTflCyk9uM/g0V7xeEXWvz4Ugs7D9I4xrTxBCcyi', 'jfGeiOguuftlVDX', 0, '2024-11-20 21:59:35', 0),
(136, 'rockinrobin.res@gmail.com', '$2b$10$AsyL3L0r6PcGA5etnabIu.IljICQ4L/6iiDrUJaXgW/Cb5MWBsYam', 'SUWxPspoaiqhkki', 0, '2024-11-20 22:07:08', 0),
(137, 'ianweyer@gmail.com', '$2b$10$lutkU37QkIPnRDvs0qrzou3NRG42hYXaGPJ2qi7H7mHEQxFbw4FZm', 'SyHcVEkIVmAhep', 0, '2024-11-20 22:07:46', 0),
(138, 'mcnamee.d@googlemail.com', '$2b$10$pPhQCQk0PAusH7NpzRcQ1uAj6ak5PaIiRC1PsH7P8WlEKgWBrwmUq', 'KsBmYQbZVdw', 0, '2024-11-20 22:14:30', 0),
(139, 'dlz5264@truman.edu', '$2b$10$c1IwJSYgPOYkip2jlU.DxOIz7PEebunOZR0W8a0mWIFFyU7KBZnze', 'fcvjRyDEx', 0, '2024-11-20 22:30:04', 0),
(140, 'bodgie@optusnet.com.au', '$2b$10$BchjQoYBo.r0IjLrMc7vjezL9G63QODCMHZrjt2bJ4i5urbjFzvS6', 'mOCUxmurUzjTa', 0, '2024-11-20 23:14:44', 0),
(141, 'pgjackson112771@gmail.com', '$2b$10$HpwIksfJxvDQJrZSIAAEt.43Uw3d.coMgbI8Oq1M/Ukd6wUIDl75W', 'rWibBfhepRX', 0, '2024-11-20 23:37:35', 0),
(142, 'lauradhaller@gmail.com', '$2b$10$Ikzt/fN3cn4EsSyQGF5sbO30pMB40DMp50SEgi2hTBXkRHbewjP2.', 'AAgAgZmpdH', 0, '2024-11-20 23:41:48', 0),
(143, 'francescaslee@hotmail.co.uk', '$2b$10$eF/lGg9ZafuDe3tTHG9RFeYuY9eTnMV8n1aqN.5MfzW3quYhd9PKe', 'QRFWrSzq', 0, '2024-11-21 00:03:16', 0),
(144, 'joshstahlffas@gmail.com', '$2b$10$f3EwVC8rCIhfgEnaFige2.ZZKHYWsmyfyNkJZZTV9KFBclOxvqCKe', 'emyCsxWlHDg', 0, '2024-11-21 00:09:12', 0),
(145, 'cindeerawr@gmail.com', '$2b$10$SipeQKkeF8sytunPtcuFZe1/IAEdQwYuuxaC6VNIA5haK0oI7oNo6', 'ijTYLzaRf', 0, '2024-11-21 00:30:04', 0),
(146, 'taktac23@gmail.com', '$2b$10$TER8K48HT/Ttz7HQ5qZB.OKLr62tMkEc49GfrIwU9yUIFNVxyxfY.', 'rkhjFPtG', 0, '2024-11-21 00:35:20', 0),
(147, 'janechapman32@sky.com', '$2b$10$MT0fvyU2USY6xH5gMjWgbut7l9t2Bsozo1Pnj4hsEDgKIxk3qr3/y', 'hgkNqsniFAM', 0, '2024-11-21 00:57:52', 0),
(148, 'a.salanitri1@gmail.com', '$2b$10$BN6sE4iXKsa/17c1X0vgQeCEFSdJxlwl0FijGVx3Jd0F60eFGYTyq', 'qkZmPCapSTH', 0, '2024-11-21 01:13:22', 0),
(149, 'bonnie.g.becker@gmail.com', '$2b$10$r8ma8RIT89O4bY/5/RkBVua3hbb3Qa6nR8vve5bl2WUWo7t1fdKzm', 'mQDOyguUFBmTgc', 0, '2024-11-21 01:16:31', 0),
(150, '97kalaje@gmail.com', '$2b$10$MYvtDnqUCrYLaFugkEtmQOsvmIod/Apcj6nHKkIfWZi9017gPM7Bu', 'TowrZRgMdyd', 0, '2024-11-21 01:37:32', 0),
(151, 'denon.gabe@gmail.com', '$2b$10$OOrtc57jS7lVZzqrak0rT.tMd1f4F5gAU.lPNczhiR3QlT6WE4r4y', 'DakPAjbnMx', 0, '2024-11-21 01:56:05', 0),
(152, 'dnorthsea@gmail.com', '$2b$10$uZm7O1fOWBVs16GOe/FM4uo99/ztiJrxB5OAh6I5.MjnERMstNZxa', 'whnXCDiAL', 0, '2024-11-21 02:12:34', 0),
(153, 'wonglingsze@gmail.com', '$2b$10$t55N3srk5HAO8qYksSHYfO1hfZ0phcp4OV8em1QNb8HE6vpnv9iku', 'XxCeGBYO', 0, '2024-11-21 02:45:29', 0),
(154, 'kristina.broadway@gmail.com', '$2b$10$gb.P/aMHJBd3mOBjzUuSXuoSBsGT4pvR491zP95JYzuETO0M5oqVa', 'XJEUYhTkMvK', 0, '2024-11-21 03:00:05', 0),
(155, 'coachroach35@hotmail.com', '$2b$10$7AQJ7NOsHEEtY1lW/YOUzug2UGac/J2UTRnGTk223voEQdPJTIYXC', 'tKFMbhpNZikEe', 0, '2024-11-21 03:18:11', 0),
(156, 'littlesanchi@hotmail.com', '$2b$10$dSgc14tSzUk09Rf2hqYMq.turPWQC0OJZRq9QQqgtRoJ5b3ZwTnp2', 'SWxwgRIKWSPaR', 0, '2024-11-21 03:26:09', 0),
(157, 'lmcgraw@yeshouse.org', '$2b$10$YW54N6NYrLuYcjYmzHvjD.f5rg57xWpUU1wz4E.VXyzpidSgL/0fK', 'qXqQDQzXPyWuy', 1, '2024-11-21 03:28:02', 0),
(158, 'museramalandrccolo@yahoo.com', '$2b$10$Hfc4nnCXNAVQiYD57.c4OOVGU3zFbVZG5K09Ng/v4Rm3Zv1F3lhxS', 'kziDFGzoY', 0, '2024-11-21 03:52:34', 0),
(159, 'hb96@comcast.net', '$2b$10$q03G3NbNop6atqXzHI39XeteBOE2B1MArz63roR7dEUReoSUI5/m2', 'zoIOmuqHWnXV', 0, '2024-11-21 04:01:17', 0),
(160, 'blackeyedsuzies@hotmail.com', '$2b$10$8HqV0bIQv1MamplDtUt.Nuviu2XMtsP7K0rVMt2E3AYteF9Q95Dgu', 'uwEeBEhDFpf', 0, '2024-11-21 04:22:15', 0),
(161, 'donald.morganjr46@gmail.com', '$2b$10$SOORDT54fZjbcTFgvJGgru44pPMntV4AoRU0BQS7zPPlvtCztSTgy', 'uVDqcIOx', 0, '2024-11-21 05:29:08', 0),
(162, 'bgovernali@gmail.com', '$2b$10$NJ/4pMQ.LUKkS3MN5q2iY.cWq09KFOhBShOgLgmPU4eTJmlrtKqZG', 'tUzgvYnPJFoTjU', 0, '2024-11-21 05:46:32', 0),
(163, 'muhlenkamp@npgcable.com', '$2b$10$BbBFWsBBks6aSS44gUFPb.7MAI37g02DFk1WIfLACYYqRBavHduKa', 'PGdDdWHotwm', 0, '2024-11-21 06:22:01', 0),
(164, 'amagana0414@gmail.com', '$2b$10$OhjYGgJyX7giYFRXFkiroenIpkiidnvyPibt5a.th8Hs/ej1LonvW', 'fYYJIuwyvrb', 0, '2024-11-21 07:24:52', 0),
(165, 'k.ajeti@finance-in-motion.com', '$2b$10$pLnf3DjEUuzu0TbnBtfgkej5HhEC98sl.LKqAJIkbUb9QpKrvI3be', 'XXDNSWFHhRj', 1, '2024-11-21 07:54:22', 0),
(166, 'yamanaka@ics.keio.ac.jp', '$2b$10$8eO33bqrzEcewd8lYrYDWOFSVgwEpQVR14yVqN0FQLjPWiVpGbz0e', 'BRsjAYXH', 0, '2024-11-21 08:01:09', 0),
(167, 'mark.jolly@minovaglobal.com', '$2b$10$ImdF8G16CgDVHaCB91ljMOI8OBuUXd33iEf5cXsEQHUHeb7icYKY2', 'MUPHPlTNgVB', 1, '2024-11-21 08:14:57', 0),
(168, 'martin.schuler@ferag.com', '$2b$10$nMvVCLkWSgOC4.vzTrtYQOHO2zT4pvY7kZBxXJQdFy5z9ScDI9GMm', 'fZOqXZxPguF', 0, '2024-11-21 08:24:47', 0),
(169, 'davidrice4555@gmail.com', '$2b$10$UVDUUJOSN./0QGBP5/DSw.9YJRJuyUYKYHQB851gEq4kCWmYjLU7W', 'qjZNMDXTMrn', 0, '2024-11-21 08:42:31', 0),
(170, 'precioussbalogun@gmail.com', '$2b$10$4AZ4F5spEIyyncIKYw/ngOgkcCzplXQLAURk0/CFXS3jxe2nnH9gC', 'WBWHpArOVS', 0, '2024-11-21 08:57:15', 0),
(171, 'jblanchard923@gmail.com', '$2b$10$BV3IxdAGfGLbTucAqQlNn.r1x9sWEEcka1pO4/whkGdNNKHkE1l0a', 'CIEodKUYJ', 0, '2024-11-21 09:12:29', 0),
(172, 'corrales69@msn.com', '$2b$10$ft0CLJwhHmBroVlw6ySgluJReEj23cR49GMkPP/BwD2esHDKLFR9K', 'PoIFZdwGswylgy', 0, '2024-11-21 09:18:43', 0),
(173, 'pani.71@outlook.com', '$2b$10$SfT9Z6Z3czutSCsl7ZO2hevx8NfuXIaVH4pFC/UU5HSbDJyN0klx2', 'mBWYHWhAl', 0, '2024-11-21 09:19:11', 0),
(174, 'jfboracay@gmail.com', '$2b$10$if2ciUXwzPu.8QS8OpC/c.lB/UxOCK19YYcK6t4Oego77YltyB9Xm', 'qrHHjcqOkjw', 0, '2024-11-21 09:30:20', 0),
(175, 'natarajan.baskaran@bertschi.com', '$2b$10$F.wdXYYNKTalIhfpemhUme1sBaVUHy.FgUESJZum5x.cHZh7cHERe', 'tvfkGMTh', 1, '2024-11-21 09:35:49', 0),
(176, 'jorgehas@gmail.com', '$2b$10$dh58vXptGKUlGDh0G9XFWeBDxS7AooUDbDxgb49X6k1/ZTftq7Wpy', 'IwLapoOA', 0, '2024-11-21 09:41:21', 0),
(177, 'mratering@dtswiss.com', '$2b$10$ScnTe9TFTrfqp/kMDoMYsus/8yFE6dyIYO1AZJHKKh1vaA/yQL9f.', 'lAFXDYMrwzwnH', 0, '2024-11-21 10:14:19', 0),
(178, 'mattparryracing@gmail.com', '$2b$10$17KcRb1QDF.dvn9ucw2G9OsSMhaFcV1.r3AfKMvWeea1mqa9RcJvG', 'beLMbNyHPL', 0, '2024-11-21 10:26:11', 0),
(179, 'courtpaige06@outlook.com', '$2b$10$qGTKeiZ9/Sb9iu8HSUwvYu.GiotnkqbkBFCdM4J/YBX20JuQXnf0G', 'bavTjpwEeL', 0, '2024-11-21 10:34:21', 0),
(180, 'nmoore@sturgessgroup.com', '$2b$10$83V3LEXUOPOnWi5L2k2YgOvU7QW0TZbdW5T..SeP3St2u/Lmhxwk.', 'yrKasIJZRkYuoU', 0, '2024-11-21 11:06:12', 0),
(181, 'nicola.bullivent@rotork.com', '$2b$10$m2OBqfU5kuvm2oeKXh.VNuaTJ5YeILnr2OeDnr8K3//rKUaqhNMaa', 'DETntYRrsIN', 0, '2024-11-21 11:17:19', 0),
(182, 'itzaksg@gmail.com', '$2b$10$2LYdpy1h2EFJqPYLXOWlruK0U9MYKhnKqnJlSTH3EhfaDStQA3kke', 'DZYCtUtVZ', 0, '2024-11-21 11:33:19', 0),
(183, 'r.benz@electronicon.com', '$2b$10$bzjKEG8MSl5IALY/DSujGu4bCEnKpRB5Tx5LSozSCoH933EJk6q9.', 'OtAfOBWnmHxGYT', 0, '2024-11-21 12:14:13', 0),
(184, 'rohloff.mel@gmail.com', '$2b$10$GdWGWdjL7I9a/D1fvoaYXuEQpitdFEoqCzXEfqR8fxAqu0rLx9YkW', 'wngHHMASw', 0, '2024-11-21 12:21:43', 0),
(185, 'reinhard.wolf@doppelmayr.com', '$2b$10$VfPW/oG5DMBGCqWYRSQJfuoBwjNu/Gr4Ys0XI0zYN/7LrmSEQhAp.', 'JQgYeVpHScMngQ', 1, '2024-11-21 12:26:18', 0),
(186, 'pschneider@daytonprogress.de', '$2b$10$DyXGeg6znnQwVPCRYU4wA.UwXadgQHzUXfZ40/ToCtUc2diDB4AkK', 'nSerrPLKr', 0, '2024-11-21 12:32:22', 0),
(187, 'bke113@comcast.net', '$2b$10$QyLy5UKCXjWLY6t//ro6JO0u6P8INlELdgZ2E6JpZvMOyT0j3QiUG', 'TpRooaQNoFEX', 0, '2024-11-21 12:37:07', 0),
(188, 'roberto.graziani@datwyler.com', '$2b$10$.sHs7fnjJ7/xkBnkjlH20.IYutHJo6AmQZ5yhnFm99QBhsoBCiSA2', 'TPoBXmLsueDcGx', 1, '2024-11-21 12:47:09', 0),
(189, 'rita.david@comlux.com', '$2b$10$zUKEgOA8cRvLAB15W9JXqu7sSo/w7aidbz8SCs6ALCW0YHW2AwO9i', 'QGUQMTKb', 0, '2024-11-21 12:47:27', 0),
(190, 'ordnerbrabia@yahoo.com', '$2b$10$KZYgL8W6VoTyDMda1YiXkeHeyTgfFg/9z77OlNbUxifBtudbaRrRC', 'YSNfgRhyn', 0, '2024-11-21 12:56:14', 0),
(191, 'andrewcook2009@live.co.uk', '$2b$10$Xr7YTSanLGLg8MuoinRW/.VJGp/5rMJ5OP5d6NmozGGFLI8LlAt2y', 'QgKQykRuDUAvpUQ', 0, '2024-11-21 12:59:19', 0),
(192, 'ross.baird@luxfer.com', '$2b$10$CjCOi83TM7Ll5nLDY6dnEeuL.GQKemwn/1KpFynDZuAfjPhC0NcqK', 'cTKyNcKIbrRc', 0, '2024-11-21 13:04:57', 0),
(193, 'teszt@gmail.com', '$2b$10$5ugl6lxikADOLRN30jjW2OoNj55h2S1wSyviPjKJGasYePcsslCPy', 'teszt', 0, '2024-11-21 13:10:18', 0),
(194, 'melosack@gmail.com', '$2b$10$LRCxaS/A7kNEGxYXfiOnv.WlCp.BlP8loq/L2dQ3oHwPAMc/pmRQq', 'wUNDgdvf', 0, '2024-11-21 13:42:35', 0),
(195, 'r.stevens@maritimetransport.com', '$2b$10$UElfXTcU80D5xdagUGPGceZpd4T690jjidB2fGocBpnYqeSOJI0le', 'WkASbjjklCgCZ', 0, '2024-11-21 13:55:15', 0),
(196, 'gideons03@gmail.com', '$2b$10$ujTKK09i/wy9Ra9tiPi9kOI5aR9r8DdqXS688ZtXH8uTysbSnGVoG', 'vrauIaARAX', 0, '2024-11-21 13:59:54', 0),
(197, '2strocks@gmail.com', '$2b$10$kKOlbd64lLNHxU.OrMuPSehwr8OjaTjNwd7A7phaSDhJOxN5q.Gzi', 'ksAKCMzcHb', 0, '2024-11-21 14:06:54', 0),
(198, 'hwdougherty@gmail.com', '$2b$10$wkWiXmlVMSJioJlkKpZe7u3W6ymnOlg7Qq0PEvzDwKgeHLHL2xXmq', 'ErlhNNzaJxhfWX', 0, '2024-11-21 14:12:15', 0),
(199, 'quinton_converse@w-industries.com', '$2b$10$00.FQ08Bf2Y750hNav4lf.fgcqHEAwcCtQ/kNsyEZQwG.n2lRou72', 'iQazcdDGvm', 1, '2024-11-21 14:17:36', 0),
(200, 'simon.evans@bpl.co.uk', '$2b$10$h6ZP4Z6rUWSeeplvSIeGX.bAR2KTS1K05IaUa7DUpYpvMx2kdytlm', 'rhixcUUwOOjUpqH', 0, '2024-11-21 14:17:49', 0),
(201, 'amanda@acreativeresource.com', '$2b$10$lrjAEWXLTD60R1YYgRvAbumUttRBM2iFA5d0/Ub3RtehgBPICi7Ka', 'HSzgQQpkeM', 1, '2024-11-21 14:19:13', 0),
(202, 'heatherluffman101@gmail.com', '$2b$10$cHzXHtrkd81cOglfB/jwl..kMZ/u.BV/d2ZV3cEt9JHm2Rsmh5Nq.', 'UnoavqsNIhElo', 0, '2024-11-21 14:23:14', 0),
(203, 'zinovevastihler@yahoo.com', '$2b$10$RYIqzaDRoOtMEkvFYlc5P.8HVZpuMS3Vj4ef5P/2Gkd9YzPHi6eA2', 'dBMCNbgeDaAqv', 0, '2024-11-21 14:46:52', 0),
(204, 'jgardner@walshgroup.com', '$2b$10$eh7avj4cJBLwZz0AcStJTup/27MwbQTRJEVlBgCAzaRRiyvkRR7Ly', 'PaHUyrPN', 0, '2024-11-21 14:48:29', 0),
(205, 'theagentsshvac@gmail.com', '$2b$10$H3WT.chBwnJEinOSQQ9xTeHDXghJMb7UMmmPDokzjEM7i69BQBMEi', 'ToTSAuTjtPqNm', 0, '2024-11-21 14:54:49', 0),
(206, 'jensen.04@hotmail.com', '$2b$10$kwc74yav3Thl0MG.pTr.AOaURNbM.J3rlUKPYRb0nTsO8H8edUxxa', 'RxxRCVmvHKp', 0, '2024-11-21 15:02:50', 0),
(207, 'tom.kennedy@greensill.com', '$2b$10$bB7194SOKRXAFCsouXqkBuGZUg2wULlWj1Ha97r22cSVQqfWVTYHS', 'AwgPzuYz', 0, '2024-11-21 15:04:16', 0),
(208, 'dobroslawa.grad@binder-world.com', '$2b$10$BXrU335jbfHAN/vd59T9ReRTXS4J7U8EomnsyS0xL2Kq/iqlXk1si', 'GfTSzGxMIP', 0, '2024-11-21 15:17:43', 0),
(209, 'tomas.ausra@ig.com', '$2b$10$mbMPGvqn2dUfJs8/V91tVerj5v8tXoobsdy0/cOYOCdZmOhmMiSzu', 'AoXLrABRaLuo', 1, '2024-11-21 15:22:51', 0),
(210, 'ssuzanne273@gmail.com', '$2b$10$Trjp9Fk2crYVbwKvTDbpUeutmXdrNk7dJ.ENVkyn.N68.eE./I.PS', 'FDCpuwfkrvhE', 0, '2024-11-21 15:24:18', 0),
(211, 'blaine.wolfe@absherco.com', '$2b$10$o.Vej4OmgImEUXj9vD6RI.QyUoohl33TGruK67vqz.6uC980EVBLi', 'NkZamyrUKs', 0, '2024-11-21 15:32:10', 0),
(212, 'swilkins@altro.com', '$2b$10$WeBm4NZc0s.JfvYwXNbFNuggYERWBOOTQ5vRLxDTl7vlvH5y8HfG2', 'ShaRRzWhoQGM', 0, '2024-11-21 15:35:03', 0),
(213, 'afrench@c-wlaw.com', '$2b$10$rUOVo6SCGjCkR7szXEioU.taL0N4I1EpIFfQBPdU5Ae3LIhmO3T66', 'OTohtoVGephVN', 0, '2024-11-21 15:35:30', 0),
(214, 'huntergorsuch.hg@gmail.com', '$2b$10$DLRCZl8NaRpb.5Z9F5AfxehhfAjlAmMzA87AeVx9LbN.BT5ElsZoO', 'zgbABFGzou', 0, '2024-11-21 15:44:12', 0),
(215, 'aabudayeh@c-wlaw.com', '$2b$10$zpwB5ZWJSGfFxu9DBAqxUeL9tCDSrvlesJSETUNFZuZbGxHRkCXrW', 'WCjKhxuIg', 0, '2024-11-21 15:57:13', 0),
(216, 'abranco@pkfod.com', '$2b$10$Jg3Rcg/ZUghrLbZ4vliPbusXN.DdBgweWNCzQq2vjClqlNGytYjBm', 'phnJAHdhqfwIie', 0, '2024-11-21 16:05:34', 0),
(217, 'conorjamesnelson@gmail.com', '$2b$10$XQ4eJlmO/q4M4ZfM1m1zwejSOjvyC6.LQiEXoEwFNsnlioA93VQLe', 'qOAfbwMbJwmsb', 0, '2024-11-21 16:13:25', 0),
(218, 'christina.kubanovich@accustaffing.com', '$2b$10$Qc0DSI9EUmQpDigGy1XEJuW00QSkj32ncXplIwf/sMtqYloL6y92O', 'JbxxHlpi', 0, '2024-11-21 16:17:53', 0),
(219, 'tgdk2014@gmail.com', '$2b$10$7psraK/RUbvpa9cvf3fGueU2opSeXTf1t..aU6.nPrDlb7tCSusLa', 'JApqZEIaUMRPCP', 0, '2024-11-21 16:19:15', 0),
(220, 'nimmichengappa@gmail.com', '$2b$10$ejQ8xpT3oHafreuXAHtMIOt3hVT2gHGaYw9hrWDMS2m95XZTR1/2G', 'meTurcmYLZBbvh', 0, '2024-11-21 16:26:23', 0),
(221, 'glennross1@msn.com', '$2b$10$uLmKtaSP6Bu/66Mph9l6oehB0xeBd.Nuy5SmaXU6g0Tkl1D2H3M7.', 'XbqrbnlwiQNRFH', 0, '2024-11-21 16:36:11', 0),
(222, 'jademnky33@gmail.com', '$2b$10$YHr26TzJMXcwodjBfKpa4uxrn7sHlZG94pS8hxpuAUntxEnAcnB6a', 'vdeIzUfNZ', 0, '2024-11-21 16:36:49', 0),
(223, 'purchasing@nironmagnetics.com', '$2b$10$kzub4vOCM4icSfTy1Cplz.w27S5Ub1o7ozdUrjfWrWCqxy/fRACIy', 'IdvxIQwHUFrgQu', 1, '2024-11-21 16:39:22', 0),
(224, 'saikrish7591@gmail.com', '$2b$10$/OHdm59FVv4WkBveJHv..eUoI7Y9PqCPAAJn10xMwE/.v0XwH/FZO', 'qUTnrlyGQbrRa', 0, '2024-11-21 17:14:36', 0),
(225, 'priscillaperez0427@gmail.com', '$2b$10$SQPgfRHRkghhv/3EnDk03u4OL8mWgO5wCzNU2XNIV8MCP2Y.PIdou', 'RXIhYmfnknALsos', 0, '2024-11-21 17:18:29', 0),
(226, 'jimmehilba@gmail.com', '$2b$10$EK5Yjr0.Rk9eFYokOjlOg.fm2GVN32hyBAdyLfblk/DdB887qShuu', 'edZQreZGdvjyzVP', 0, '2024-11-21 17:27:20', 0),
(227, 'ahnerj@ballardspahr.com', '$2b$10$U3N2BIxy99m2sDFehqr5AexIC991OPri.5xI0lSVk1x3vbucaMr8a', 'JThxFJCHFp', 1, '2024-11-21 17:50:05', 0),
(228, 'awilson@spyrockhill.net', '$2b$10$3u/xTG4nQuiNkTcRQ0awqewXm4Iw7R7NIGUPBh4wYXGexV9GDj5Ja', 'ueDgOJYokfCxGWS', 0, '2024-11-21 17:53:22', 0),
(229, 'fezanbutt786@gmail.com', '$2b$10$nzcJ.OpXN8Dss3ztV.5fsejmtJKThQkZYwvhdY2bchccPF1nHfq5S', 'wnqkITJhOmkAW', 0, '2024-11-21 18:07:22', 0),
(230, 'm.morris@activeminerals.com', '$2b$10$07Kz2VSNLFZ3IixIuAEQAONsiFtMWH/AyeohLK.nUyh/fpGfsnMda', 'pyUVyZDIliMA', 0, '2024-11-21 18:11:59', 0),
(231, 'mjoosten@acrow.com', '$2b$10$yyFVmfK.XmUvUoXOifaUuuYhIJr6l/ZJEOz4cDpyxDcqUwk915BBa', 'HIzMtmHyPtTAEU', 1, '2024-11-21 18:41:21', 0),
(232, 'ashleybowkett123@gmail.com', '$2b$10$M4MMI0RqFLxRp6Cr4CzgYu8pbrlSiGEPsS5/R9Pp/FjTQLtaYXvWS', 'tiklumGGXEGQb', 0, '2024-11-21 18:43:10', 0),
(233, 'cjpyle56@gmail.com', '$2b$10$RsNk5He1Ixy6JMNZWLcBaet1vYpvzHqPoLZipKfIQrll55xS3GyBu', 'dKhUrWoFFBV', 0, '2024-11-21 18:52:37', 0),
(234, 'info@biskainc.com', '$2b$10$gfeHgF7JfkaGqTCJmMgm9Om0g8sYM3TLdtuyuCfL2aK649imzVBFi', 'ZQnaUijRag', 0, '2024-11-21 18:55:33', 0),
(235, 'lusk.elliot@gmail.com', '$2b$10$98LhXh9ux9b1x2vWnH1Hke0sEQTOPtghuLVtaxblCxaP56EgjVx4S', 'xWzTFxtB', 0, '2024-11-21 18:59:33', 0),
(236, 'cajoes@msn.com', '$2b$10$cFH5eev4D7UN/35zhQQyUOvrtClnewqQM1DOYjha655z16ow0pS9K', 'XuGodefnyebpB', 0, '2024-11-21 19:16:56', 0),
(237, 'jayh@ableinc.ca', '$2b$10$5sfPq7.jSqfD9hW6EN/1yOyGgs5AAJ.WM0sLzpG0MKfk9znE31KA6', 'MWhCyunSPJFtmmQ', 0, '2024-11-21 19:26:44', 0),
(238, 'sharizaini@gmail.com', '$2b$10$bnD1Jm4co17TGS4iN/2yM.LErI.w3whZxxpOaMBvpw83cy35HZs9q', 'gvFFifzHSV', 0, '2024-11-21 19:36:18', 0),
(239, 'cwfisher504@gmail.com', '$2b$10$N9558EAkfzgTIsKpRrpa5.YgCxv4Pk.BF5.F/kPCNHcV/uNQhO8p.', 'olTFYnkhxbw', 0, '2024-11-21 19:38:26', 0),
(240, 'jgrossman@accordfinancial.com', '$2b$10$ZP5uWP3IJxs/UnwFypHh5uP3vBNxxyY.CWWz18clDmC/nLvIqKEya', 'QHiRibAVErG', 0, '2024-11-21 20:14:18', 0),
(241, 'kgrib01@hotmail.co.uk', '$2b$10$ezWiSC6DSqXxyfXgMrWn3OwaND22Gm.WZewOG0pDI.lrbQ0PPrZJW', 'bCEGFjHMeezaERo', 0, '2024-11-21 20:27:36', 0),
(242, 'nlapenta23@gmail.com', '$2b$10$aoL2NLUD/tBnCJ3fdJjJFeAcDX4DzM7SZCF6Mu3SuTcKY6h9OV4EW', 'bSiytvLQQUohc', 0, '2024-11-21 20:29:06', 0),
(243, 'klweber1996@gmail.com', '$2b$10$.mHDedWQvZoXmItJP9/my.rHdwsR/17ad1sxtscvxIXUbKuS.VwBK', 'fuppOuEk', 0, '2024-11-21 20:35:11', 0),
(244, 'mrnevets201@gmail.com', '$2b$10$oLFle6qlmB6eGx903e81S.xq7KrSLcRYmWx9o/h467kPW1n4SNQie', 'NhNKCXkjJfEiOb', 0, '2024-11-21 20:42:38', 0),
(245, 'jakek16k@gmail.com', '$2b$10$/KPtMH4nR2Zyj/8bzNwiPOizAFppF4lrgfwasKt0Ox26uRuPhqBIO', 'fslmlhEAKXeZJb', 0, '2024-11-21 21:19:20', 0),
(246, 'dougluper@gmail.com', '$2b$10$MaECof0nPk1kThfPqrTrk.WfyC.jzfDVCY/Y6mMUxY4hrZUk3CcbO', 'HPDCvbxeqgeYSnv', 0, '2024-11-21 21:33:52', 0),
(247, 'acummings@winstead.com', '$2b$10$2XW1RsSKmvMKnGtqm.BGcOylwiRJre8NPK019yT5o1B.Ibyhdwtlm', 'zgcBScEKIEFlPwA', 0, '2024-11-21 21:37:33', 0),
(248, 'darrell@sisbromgmt.com', '$2b$10$N30rG4JLC3WK8Tw3lu0/Mu/yp.f72gbjggSbgyaAKLv.2slNdGwqy', 'nkIAxoucwcZ', 0, '2024-11-21 22:23:04', 0),
(249, 'george931@hotmail.com', '$2b$10$NcoTSOvPlnVuaARJSoNt7.SIJ/LQK2nepViWC78T3tEAg7e1JodgK', 'tWTCAjUdksGiC', 0, '2024-11-21 22:33:22', 0),
(250, 'omarrafiq06@hotmail.co.uk', '$2b$10$Uu7WWwbb1.sBy/odGdgR0urOAheV9peR4Hu5IgN/PjMxJKE1ujPJK', 'hKnwcrPGtHvn', 0, '2024-11-21 22:59:26', 0),
(251, 'shaunius345@gmail.com', '$2b$10$0N138csUW2Ds7XX5P0NgtOuSvlkT/9O58R5.llXKBe3m/Tn4Ixw7y', 'AQkRatPIXzdiAAm', 0, '2024-11-21 23:46:28', 0),
(252, 'kimberlybarlowe@gmail.com', '$2b$10$Gb4er5OwQdqv9bUcvoWHneN.ktNLRVA2qMtc5j4F3Fez5KAEr3tTy', 'BnBnqaXwkVJP', 0, '2024-11-21 23:46:28', 0),
(253, 'claudiarn41@gmail.com', '$2b$10$D4E2GGVWNyDMvcP5MyCAeuofDALbfGBo9LgGHNjnl7C86QvlJQZgK', 'xKHOSvrEAqkWUIw', 0, '2024-11-21 23:48:55', 0),
(254, 'jamiekoontz@cox.net', '$2b$10$ewTJibLtn7uEW5ZIfiJyQeu823fqH.Aercc9ysI//CA6Z4M8H3rTm', 'BIelIIBFNXFfLta', 0, '2024-11-22 00:01:44', 0),
(255, 'pjsehne@liberty.edu', '$2b$10$mSkamPw/XJ3li2.7QpbCzua7lsXprAWdshA6W4hZHe1p21IcqFYNW', 'sbFGGcGJOCqe', 0, '2024-11-22 00:19:03', 0),
(256, 'margwiseman@btinternet.com', '$2b$10$lyAK3G1LAOZa9o7wUCVC/.I8nDbrcVc0mt1vR0suUgMLSUGFlBr0y', 'XohmnEhTEdaZo', 0, '2024-11-22 00:48:52', 0),
(257, 'nualasmith@hotmail.co.uk', '$2b$10$TcoP0hgoKZ6hhsUskoy2y./wB3oqHtB4jC5BVEIQdy.QnBjREUKI2', 'bHiIkeggAI', 0, '2024-11-22 00:58:28', 0),
(258, 'biltmoreking@charter.net', '$2b$10$wx8DXeuLNPcrhCi/2Bf3KeyVGuNQHyktiBLWYIRhiQoyO2hRWGNAi', 'CQrnxkjsFPH', 0, '2024-11-22 02:24:11', 0),
(259, 'jtoth2170@gmail.com', '$2b$10$7Sz7WhnSmirkr7SdyDMeKeBtWnlEws2Lro1OOgk.5RYlZ4ja31wBK', 'dIeYAwCkT', 0, '2024-11-22 02:34:11', 0),
(260, 'baxtercruttenden@gmail.com', '$2b$10$uNc3mfPA6UWQHckomzCUNeixZZpTrFyK/l7xB3gGhj/rt07yUFCvG', 'ApASRtVUYIe', 0, '2024-11-22 03:31:19', 0),
(261, 'sideways20@gmail.com', '$2b$10$q1CynD7J73SqQqkiFr0s4OvSjQfMYcXSyZj0SEMpxwCv8qX0uWXDy', 'SsvoDsvYTtNSQZA', 0, '2024-11-22 04:19:06', 0),
(262, 'taly.boczan@gmail.com', '$2b$10$3Gjyo5RBcyrYpsQRFe1N/OR5S.O7/xy2O5DkWLe9/vYcIHMW7nPIe', 'qdKPTEoHbuctnZ', 0, '2024-11-22 04:25:25', 0),
(263, 'ykolmagorov@gmail.com', '$2b$10$cZH47a9opXx2bGHnkzYz9e161G4bQ45kbHiF5szsrXeRwbIbHyJZy', 'rAtrCBrZ', 0, '2024-11-22 05:14:10', 0),
(264, 'mike9586@hotmail.com', '$2b$10$6GLndJrSTeeKQvOq8ByipedsEpANcBncnXuvhrtyAKstRW0X2QaWC', 'EtWfjWMVli', 0, '2024-11-22 05:39:05', 0),
(265, 'lucindarajaselvan@alumni.uwo.ca', '$2b$10$/qRjmKE/Hfg29RRQ.k2/oOOA1.GWs/rQyg4IFn42HwELBWEHIPiKy', 'LCEMkGru', 0, '2024-11-22 08:10:19', 0),
(266, 'ian.2.pye@bt.com', '$2b$10$TvO5UcKeyDTbzyTNZG5BTelBk2/MVc8laQDbzvhE.swcVDq7Irz16', 'LuYmbIcBA', 0, '2024-11-22 08:12:42', 0),
(267, 'achim.weis@maxongroup.com', '$2b$10$9DqyjxT.zfqHdLGPRS/VpeJBVuy4l/BZTLoFto1HK1BVPJzqFoBRK', 'HCsovKiUul', 0, '2024-11-22 08:43:01', 0),
(268, 'j.reussner@hoffmann-group.com', '$2b$10$/MwZ0Ea4wMHtbR4iBB8IXe.ANhxL/3UwgJucrYz2FiEv0g8PYtiyK', 'uzXahcUpEGObDF', 0, '2024-11-22 08:45:48', 0),
(269, 'tgrichting@groupemutuel.ch', '$2b$10$v2OSK7gVaoDzro0JCSfBA.jXepj1gSViTD3SJlKbRDJlUglsmz7GC', 'PxzkkOaWSaQoeK', 0, '2024-11-22 09:06:54', 0),
(270, 'urs.scherrer@metallzug.ch', '$2b$10$hfQ.N.qSGHReA/C9ZtlE/OK6L4a1Qq8uG5JXmkonCwL0ECm.lSKrm', 'gwcWSKfTZpzyg', 0, '2024-11-22 09:16:56', 0),
(271, 'zahra.darivandi@ask-chemicals.com', '$2b$10$kpKxf9f2umu1yZKg30zA7OVLtG0eFcqHtL6oPosdu9xaPMGmU5n3S', 'UpqIlxTc', 0, '2024-11-22 09:26:20', 0),
(272, 'dkrl@cox.net', '$2b$10$5m0peHNz5ahI27EBiIbSleJHTvzkzWLjYFItB9ZE5dakLNYwr7MFi', 'ILmJAWFGH', 0, '2024-11-22 09:42:58', 0),
(273, 'jareddutcher@hotmail.com', '$2b$10$7Yod2HZL/ovDEAl6UPzfx.fMQPP0qPo7tzvXDSskNFkaqXhSgTUTu', 'qqylWcXovqE', 0, '2024-11-22 09:45:08', 0),
(274, 'mfarrag@batelco.com.bh', '$2b$10$vb.61Pt5sE09N7qkhdgxneKMHkPQyUZhcZ0BxrIqDjPWYFRDfibYW', 'CpuaBJvLT', 0, '2024-11-22 10:34:45', 0),
(275, 'reception@blakeneyhotel.co.uk', '$2b$10$bsaEHFy98CpLAUN3GvKLqej4s47JXeEevdafkApwq2wuaMPtRAEXm', 'iohfJFQkNxrr', 0, '2024-11-22 10:38:19', 0),
(276, 'gdeniska_kalinin_92@mail.ru', '$2b$10$faX73nuS6IsEa3VdKUX7t.rDYB6XV5yl.A5eu/4.Xq6LOIEtJfxkm', 'PkwcirmqJuuPUY', 0, '2024-11-22 11:16:28', 0),
(277, 'keaganmgill@gmail.com', '$2b$10$te8Mw5ELJaskgrdJaoYFG.egZEk1Z0XWIU/L18Rfe12epDOOzSVqG', 'imkauYtojMDg', 0, '2024-11-22 11:51:56', 0),
(278, 'alarmcho@gmail.com', '$2b$10$F0CMciNNjkkYKCfAULbfB.69MvXhFKgrw.D6GcaeY70S5vIQoPQpe', 'itKebcwPCy', 0, '2024-11-22 12:10:05', 0),
(279, 'hamdi.kahna@hubersuhner.com', '$2b$10$iqS22RY2UqTBF1gHuaKvdOko.z8Kqltm5.nhm2TxfvkNeVz9CLyhi', 'TfwJcSEzIcMvuRS', 0, '2024-11-22 12:17:00', 0),
(280, 'gaikwad@glatt.com', '$2b$10$ouJASi.qSyP0LEKVoe17XuG3zvntJ0xWRIVSGcxDQvVmrHlNp8d1i', 'xUvpXAxNwcoIA', 0, '2024-11-22 12:23:32', 0),
(281, 'ckeane925@gmail.com', '$2b$10$ooSLBSFk.0fvWDqBeoxOjeQeA.lGI5RnQsNehX50xYEvwmSYdKXwO', 'ympbkXTuHubclx', 0, '2024-11-22 12:39:47', 0),
(282, 'xsophiequaylex@hotmail.com', '$2b$10$gltvC1GI6yhB4Bl7FoCVNOv9RgtNccqbN6wkZMln/RFOWrqHvlPKO', 'XXFpdcanQtJmZ', 0, '2024-11-22 13:08:47', 0),
(283, 'guybrushey@hotmail.com', '$2b$10$9aMnnMQU1LYl1MQFLkaQjO7wkTvWktqOOu4K786jrV2Jy0LpVI.xe', 'ZrwuikAlM', 0, '2024-11-22 13:35:52', 0),
(284, 'leafreeman@adcock.co.uk', '$2b$10$dQrtJ4OcidtWj7hxDDwJguOVBrQYoC0YGzXUjr3XKsry6VPwcRBA.', 'jDEVaQIfjrfFNAG', 0, '2024-11-22 13:36:33', 0),
(285, 'flint740@gmail.com', '$2b$10$Y35I/8s4sOjdct5A.tWdXO0nSp/3e/aabbeDNMLMboutSFITBwfPu', 'IZOdyeNcKMFEv', 0, '2024-11-22 14:06:44', 0),
(286, 'lucy.lowthorpe@arco.co.uk', '$2b$10$tui24vb8u/.2C41j/wY2G.gp0YcApvubBYt9i2UJQf1nq3xcoCl0G', 'VqkWExSrtfRD', 0, '2024-11-22 14:19:30', 0),
(287, 'acdenmanu@acden.com', '$2b$10$i.T.U3FUKpYl.sFd8d9aVOAMkZZ9ZHOJW71qymzTw3g7bR93MawPO', 'IybcCXFoxJliL', 0, '2024-11-22 14:50:10', 0),
(288, 'penny.phillips@ap-group.co.uk', '$2b$10$SPlRrDPKSN6XFIn5weG74er/tW71WmE1dEOMezFB/30mDjPGNZPVq', 'IGVyEcgOlLHCU', 0, '2024-11-22 14:51:37', 0),
(289, 'ngjsekbtmjotekhk@yahoo.com', '$2b$10$/KCit4Z17laCvHMyhl06nezhrYbaSHirsF4EhHntnFMsbjTC82VXG', 'MBZKlXTzn', 0, '2024-11-22 14:56:29', 0),
(290, 'noahmeredith40@gmail.com', '$2b$10$EDqIhQyem.LZrLL3ReEx6eeTcNCaWeOHm1yfsrkS2bC90JOM4G03i', 'iNhSgkViWHD', 0, '2024-11-22 14:58:53', 0),
(291, 'helena-dettmer@uiowa.edu', '$2b$10$080edkKLdDUcE3HOaPtBoeMnBMwSZIOs.MJsmbw/sN7cKp1g1WTsm', 'dWKQmwRoMHt', 0, '2024-11-22 15:03:16', 0),
(292, 'nbrownlee@joslinconstruction.com', '$2b$10$KFXt871Era5RWS4x5wbCeesKcbVR18N2SzkqayQt8RuuusV5E5XLm', 'HEUbkKTz', 0, '2024-11-22 15:04:33', 0),
(293, 'r.ross@rsross.de', '$2b$10$ftwp7Q4HisYVw9W2OV/YBeReUT7P560jQXolz4NKhLqAinHD6Q2Qi', 'tTGXTABikYeYIH', 0, '2024-11-22 15:09:01', 0),
(294, 'ddubois@acerentacar.com', '$2b$10$BGoOAiSl56lZlRZHEJvvne9Bhfg/H6FoP1IKUWb4AS38sbv4AHeS6', 'zpZNzvLRt', 0, '2024-11-22 15:14:58', 0),
(295, 'mquinn@trinityconsultants.com', '$2b$10$BXknxS9JBwnRrYLJMzdF0.7YaZBiJG2rACWrn/L.ER4aP6tD63hvm', 'KxBnSLEQNfQ', 0, '2024-11-22 15:17:59', 0),
(296, 'vitico181@hotmail.com', '$2b$10$uXt1NXSy5C1RbaWCVqQCROtqPQQVnYrDAU02BpuBonhoCfaHd3CUy', 'ZnPfFItqrnFtl', 0, '2024-11-22 15:33:48', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `welcome_drinks`
--

DROP TABLE IF EXISTS `welcome_drinks`;
CREATE TABLE IF NOT EXISTS `welcome_drinks` (
  `Reservation_ID` int NOT NULL,
  `Food_ID` int NOT NULL,
  KEY `Reservation_ID` (`Reservation_ID`),
  KEY `Food_ID` (`Food_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `food_menus`
--
ALTER TABLE `food_menus`
  ADD CONSTRAINT `Food_Menus_ibfk_1` FOREIGN KEY (`Food_ID`) REFERENCES `food` (`ID`),
  ADD CONSTRAINT `Food_Menus_ibfk_2` FOREIGN KEY (`Menu_ID`) REFERENCES `menus` (`ID`);

--
-- Megkötések a táblához `one_time_codes`
--
ALTER TABLE `one_time_codes`
  ADD CONSTRAINT `One_Time_Codes_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `Reservations_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `reservations_tables`
--
ALTER TABLE `reservations_tables`
  ADD CONSTRAINT `Reservations_Tables_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservations` (`ID`),
  ADD CONSTRAINT `Reservations_Tables_ibfk_2` FOREIGN KEY (`Table_ID`) REFERENCES `tables` (`ID`);

--
-- Megkötések a táblához `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservations` (`ID`),
  ADD CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `welcome_drinks`
--
ALTER TABLE `welcome_drinks`
  ADD CONSTRAINT `Welcome_Drinks_ibfk_1` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservations` (`ID`),
  ADD CONSTRAINT `Welcome_Drinks_ibfk_2` FOREIGN KEY (`Food_ID`) REFERENCES `food` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
