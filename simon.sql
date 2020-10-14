-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 14.Okt 2020, 08:54
-- Verzia serveru: 10.4.14-MariaDB
-- Verzia PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `simon`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `c_trieda`
--

CREATE TABLE `c_trieda` (
  `idc_trieda` int(11) NOT NULL,
  `nazovc_trieda` varchar(50) NOT NULL,
  `skupina` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sťahujem dáta pre tabuľku `c_trieda`
--

INSERT INTO `c_trieda` (`idc_trieda`, `nazovc_trieda`, `skupina`) VALUES
(1, '1.A', 2),
(2, '2.C', 1),
(3, '3.B', 1),
(4, '4.D', 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `preklad`
--

CREATE TABLE `preklad` (
  `idpreklad` int(9) NOT NULL,
  `jazyk` varchar(2) COLLATE utf8_slovak_ci NOT NULL,
  `retazec` varchar(100) COLLATE utf8_slovak_ci NOT NULL,
  `preklad` text COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `preklad`
--

INSERT INTO `preklad` (`idpreklad`, `jazyk`, `retazec`, `preklad`) VALUES
(1, 'sk', 'pfg', 'Programovacie a interaktívne prostredia'),
(2, 'en', 'pfg', 'Programming and interactive environment'),
(3, 'sk', 'nadpis', 'Toto je rozvrh:'),
(4, 'en', 'nadpis', 'This is schedule:');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `rozvrh`
--

CREATE TABLE `rozvrh` (
  `idrozvrh` int(9) NOT NULL,
  `den` int(3) NOT NULL,
  `hodina` int(3) NOT NULL,
  `predmet` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `trieda` varchar(2) COLLATE utf8_slovak_ci NOT NULL,
  `skupina` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `rozvrh`
--

INSERT INTO `rozvrh` (`idrozvrh`, `den`, `hodina`, `predmet`, `trieda`, `skupina`) VALUES
(1, 2, 2, 'pfg', '4b', 2),
(2, 2, 3, 'pfg', '4b', 2),
(3, 2, 1, 'irs', '4b', 2),
(4, 4, 0, 'pro', '3a', 1),
(5, 4, 5, 'tv', '1a', 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `uzivatelia`
--

CREATE TABLE `uzivatelia` (
  `iduzivatelia` int(9) NOT NULL,
  `meno` varchar(50) COLLATE utf8_slovak_ci NOT NULL,
  `priezvisko` varchar(100) CHARACTER SET utf16 COLLATE utf16_slovak_ci NOT NULL,
  `datum_narodenia` date NOT NULL,
  `id_c_trieda` int(3) NOT NULL DEFAULT 0,
  `logname` varchar(150) COLLATE utf8_slovak_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci COMMENT='toto je tabulka pouzivatelov od kubicu 14.10.2020';

--
-- Sťahujem dáta pre tabuľku `uzivatelia`
--

INSERT INTO `uzivatelia` (`iduzivatelia`, `meno`, `priezvisko`, `datum_narodenia`, `id_c_trieda`, `logname`, `password`) VALUES
(1, 'Šimon', 'Smolár', '2002-07-10', 0, 'simon-smolar', '7aff03960854665c74950f430469641f755d583c'),
(2, 'Tomáš', 'Čavajda', '2002-03-18', 0, 'justTom', 'e16e54dac2e779763835cfe15d02779ff19f6219'),
(3, 'Albert', 'Rakus', '2002-04-13', 0, 'berto', '363e6d58c381cc178f51a6e6ac8dc0da4e599899'),
(4, 'Viktor', 'Kovács', '2002-07-20', 0, 'viktoor', '359738011231a53199c0d3894d7a1ef6a085b584');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `c_trieda`
--
ALTER TABLE `c_trieda`
  ADD PRIMARY KEY (`idc_trieda`);

--
-- Indexy pre tabuľku `preklad`
--
ALTER TABLE `preklad`
  ADD PRIMARY KEY (`idpreklad`);

--
-- Indexy pre tabuľku `rozvrh`
--
ALTER TABLE `rozvrh`
  ADD PRIMARY KEY (`idrozvrh`);

--
-- Indexy pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  ADD PRIMARY KEY (`iduzivatelia`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `c_trieda`
--
ALTER TABLE `c_trieda`
  MODIFY `idc_trieda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `preklad`
--
ALTER TABLE `preklad`
  MODIFY `idpreklad` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `rozvrh`
--
ALTER TABLE `rozvrh`
  MODIFY `idrozvrh` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  MODIFY `iduzivatelia` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
