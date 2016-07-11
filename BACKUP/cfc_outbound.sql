-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Jul 2016 um 15:46
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cfc_outbound`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `right` int(11) NOT NULL DEFAULT '2',
  `active` int(11) NOT NULL DEFAULT '1',
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_action` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `account`
--

INSERT INTO `account` (`id`, `username`, `first_name`, `last_name`, `password`, `right`, `active`, `change_date`, `last_login`, `last_action`) VALUES
(1, 'admin', 'System', 'Admin', '$2y$10$80AmLv4xXwZmz4w.0gito.jhejAgEw2XFeTA3RapGSdM0x1P3oq36', 0, 1, '2016-02-05 12:12:48', '2016-07-04 10:52:38', 1467631380),
(2, 'U284265', 'Christian', 'Barth', '$2y$10$En13TH.m15a.jb8/6jhq5.JQM54OlS1JpelfMjmPDCZ1AjEjSVFlK', 0, 1, '2016-02-05 12:12:48', '2016-04-15 12:16:19', 1460724562),
(3, 'U284197', 'Tanja', 'Barth', '$2y$10$B4iz0BT6zy1Jlcn5e0twUu2CFY3gi4QVkQdaiNUpo4FM7jD6WoCW6', 2, 1, '2016-02-08 16:46:26', '2016-02-11 12:55:19', 0),
(4, 'U254573', 'Kerstin', 'Schwarz', '$2y$10$XS8VEUKIiB0GZEhhQKabS.ABzu5VnBq.KUZZ4YhCiIxxEeDSpc0Oe', 1, 1, '2016-02-11 10:45:01', '2016-04-05 08:37:25', 1459845638),
(5, 'U276422', 'Simone', 'Trierweiler', '$2y$10$bvnrcI3Ufwrpkzm43m358OpYzFJclmfVm4cZY.zA9JelKjcow5sCG', 2, 1, '2016-05-24 08:20:42', '2016-05-24 08:21:38', 1464082686);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `street` text COLLATE utf8_bin NOT NULL,
  `zip_code` text COLLATE utf8_bin NOT NULL,
  `city` text COLLATE utf8_bin NOT NULL,
  `url` text COLLATE utf8_bin NOT NULL,
  `country` text COLLATE utf8_bin NOT NULL,
  `state` text COLLATE utf8_bin NOT NULL,
  `buisness` text COLLATE utf8_bin NOT NULL,
  `class` text COLLATE utf8_bin NOT NULL,
  `owner` text COLLATE utf8_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`id`, `name`, `street`, `zip_code`, `city`, `url`, `country`, `state`, `buisness`, `class`, `owner`, `create_date`) VALUES
(1, 'Cargo Future Communication', 'Gebäude 1335', '55483', 'Flughafen Frankfurt Hahn', 'http://www.cfc-callcenter.com', 'Deutschland', 'Rheinland-Pfalz', 'Servicecenter', '', 'CFC', '2016-05-25 14:47:26'),
(2, 'Test Firma', 'Straße 21', '44444', 'Musterhausen', 'www.muster-firma.de', 'Deutschland', 'Baden-Württemberg', 'Handel', '', 'CFC', '2016-05-25 14:47:26');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_person`
--

CREATE TABLE `contact_person` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `salutation` text COLLATE utf8_bin NOT NULL,
  `title` text COLLATE utf8_bin NOT NULL,
  `first_name` text COLLATE utf8_bin NOT NULL,
  `last_name` text COLLATE utf8_bin NOT NULL,
  `position` text COLLATE utf8_bin NOT NULL,
  `phone` text COLLATE utf8_bin NOT NULL,
  `fax` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `contact_person`
--

INSERT INTO `contact_person` (`id`, `company_id`, `salutation`, `title`, `first_name`, `last_name`, `position`, `phone`, `fax`, `email`, `default`) VALUES
(1, 1, 'Herr', '', 'Jens', 'Gillich', 'IT-Manager', '06543 983111', '06543 983119', 'jens.gillich@dlh.de', 1),
(2, 1, 'Herr', '', 'Christian', 'Barth', 'IT-Admin', '06543 983115', '06543 983119', 'christian.barth.qw@dlh.de', 0),
(3, 1, 'Frau', '', 'Sylvia', 'Kodric', 'Secretary', '06543 983102', '06543 983119', 'silvia.kodric@lhsystems.com', 0),
(4, 2, 'Herr', 'Dr.', 'Max', 'Mustermann', 'Geschäftsleiter', '01234 101', '01233 102', 'max.mustermann@muster-firma.de', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company` text COLLATE utf8_bin NOT NULL,
  `street` text COLLATE utf8_bin NOT NULL,
  `zip_code` text COLLATE utf8_bin NOT NULL,
  `city` text COLLATE utf8_bin NOT NULL,
  `phone` text COLLATE utf8_bin NOT NULL,
  `fax` text COLLATE utf8_bin NOT NULL,
  `salutation` text COLLATE utf8_bin NOT NULL,
  `title` text COLLATE utf8_bin NOT NULL,
  `first_name` text COLLATE utf8_bin NOT NULL,
  `last_name` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `url` text COLLATE utf8_bin NOT NULL,
  `country` text COLLATE utf8_bin NOT NULL,
  `state` text COLLATE utf8_bin NOT NULL,
  `category_wzw` text COLLATE utf8_bin NOT NULL,
  `class` text COLLATE utf8_bin NOT NULL,
  `sales` text COLLATE utf8_bin NOT NULL,
  `status` text COLLATE utf8_bin NOT NULL,
  `calls` int(11) NOT NULL DEFAULT '0',
  `resubmission` int(11) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`id`, `project_id`, `company`, `street`, `zip_code`, `city`, `phone`, `fax`, `salutation`, `title`, `first_name`, `last_name`, `email`, `url`, `country`, `state`, `category_wzw`, `class`, `sales`, `status`, `calls`, `resubmission`, `create_date`) VALUES
(765, 10, 'Chocoladenfabriken', 'Süsterfeldstr. 130', '52072', 'Aachen', '0241-8881-0', '0241-8889-313', 'Herr', 'Dr.', 'Adalbert', 'Lechner', '', 'http://www.lindt.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '434', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(766, 10, 'Schumag AG', 'Nerscheider Weg 170', '52076', 'Aachen', '02408-12-0', '02408-12-256', 'Herr', 'Dr.', 'Johannes', 'Ohlinger', 'info@schumag.de', 'http://www.schumag.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '56', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(767, 10, 'ZENTIS GmbH & Co. KG', 'Jülicher Str. 177', '52070', 'Aachen', '0241-4760-0', '0241-4760-369', 'Herr', '', 'Karl-Heinz', 'Johnen', 'info@zentis.de', 'http://www.zentis.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '643', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(768, 10, 'MAPAL Fabrik für Präzisionswerkzeuge', 'Obere Bahnstr. 13', '73431', 'Aalen', '07361-585-0', '07361-585-150', 'Herr', 'Dr.', 'Dieter', 'Kress', 'info@de.mapal.com', 'http://www.mapal.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '310', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(769, 10, 'Maschinenfabrik ALFING Kessler GmbH', 'Auguste-Kessler-Str. 20', '73433', 'Aalen', '07361-501-0', '07361-501-1970', 'Herr', '', 'Eberhard', 'Funk', 'info@mafa.alfing.de', 'http://www.alfing.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '230', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(770, 10, 'SHW Casting Technologies GmbH', 'Stiewingstr. 101', '73433', 'Aalen', '07361-3702-396', '07361-3702-487', 'Herr', '', 'Ulrich', 'Severing', '', 'http://www.shw-ct.eu', 'Deutschland', 'Bauindustrie & Stahl', 'E 200-499', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(771, 10, 'Norgren GmbH', 'Bruckstr. 93', '46519', 'Alpen', '02802-49-0', '02802-49-356', 'Herr', '', 'Peter', 'Varwijk', '', 'http://www.norgren.com/de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '330', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(772, 10, 'Cinram GmbH', 'Max-Planck-Str. 1-9', '52477', 'Alsdorf', '02404-58-444', '02404-58-111', 'Herr', '', 'Dieter', 'Lubberich', 'info-de@cinram.com', 'http://www.cinram.de/de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '250', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(773, 10, 'Medical Park AG', 'Freiberger-Platz 1', '83123', 'Amerang', '08075-91311-0', '08075-91311-116', 'Herr', 'Dr.', 'Ulrich Richard', 'Mauerer', 'info@medicalpark.de', 'http://www.medicalpark.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '112', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(774, 10, 'OECHSLER AG', 'Matthias-Oechsler-Str. 9', '91522', 'Ansbach', '0981-1807-0', '0981-1807-222', 'Herr', 'Dr.', 'Claudius M.', 'Kozlik', 'info@oechsler.com', 'http://www.oechsler.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '233', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(775, 10, '"Thüfleiwa" Thüringer Fleischwaren,', 'Buttstädter Str. 26', '99510', 'Apolda', '03644-5189-0', '03644-5189-37', 'Herr', '', 'Thomas', 'Kämmerer', 'apolda@thuefleiwa.de', 'http://www.thuefleiwa.de/', 'Deutschland', 'Lebensmittelhandel', 'F 100-200', '0', 'Thüringen', 'new', 0, 0, '2016-02-04 16:10:46'),
(776, 10, 'frischBack GmbH Arnstadt', 'Mühlweg 3', '99310', 'Arnstadt', '03628-7411-0', '03628-7411-15', 'Herr', '', 'Alfred', 'Heyl', 'info@frischback.de', 'http://www.frischback.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '30', 'Thüringen', 'new', 0, 0, '2016-02-04 16:10:46'),
(777, 10, 'Knürr Electronics GmbH', 'Mariakirchener Str. 38', '94424', 'Arnstorf', '08723-27-0', '08723-27-154', 'Herr', '', 'Daniel', 'Graf', 'info@knuerr.com', 'http://www.emersonnetworkpower.com/en-EMEA/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '81', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(778, 10, 'ADO Goldkante GmbH & Co. KG', 'Hüntestr. 68', '26821', 'Aschendorf', '04962-505-0', '04962-505-250', 'Herr', '', 'Andreas', 'Zimmer', 'info?@?ado-goldkante.de', 'http://www.ado-goldkante.de/', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '129', 'Niedersachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(779, 10, 'Pfeiffer Vacuum GmbH', 'Berliner Straße 43', '35614', 'Aßlar', '06441-802-0', '06441-802-1202', 'Herr', '', 'Manfred', 'Bender', 'info@pfeiffer-vacuum.de', 'http://www.pfeiffer-vacuum.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '221', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(780, 10, 'Labor Schottdorf MVZ GmbH', 'August-Wessels-Str. 5', '86154', 'Augsburg', '0821-4201-0', '0821-417992', 'Frau', '', 'Gabriele', 'Schottdorf', 'labor@schottdorf.de', 'http://www.schottdorf.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(781, 10, 'manroland web systems GmbH', 'Alois-Senefelder-Allee 1', '86153', 'Augsburg', '0821-424-0', '0821-424-3303', 'Herr', '', 'Jörn', 'Gossé', 'info@manroland-web.com', 'http://www.manroland-web.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(782, 10, 'RENK Aktiengesellschaft', 'Gögginger Str. 73', '86159', 'Augsburg', '0821-5700-681', '0821-5700-552', 'Herr', '', 'Florian', 'Hofbauer', '', 'http://www.renk.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '148', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(783, 10, 'Schuhhof GmbH', 'Kobelweg 82', '86156', 'Augsburg', '0821-2408-0', '0821-2408-284', 'Herr', '', 'Frank', 'Pohl', 'info@schuhhof-gmbh.de', 'http://www.schuhhof.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(784, 10, 'UPM GmbH', 'Georg-Haindl-Str. 4', '86153', 'Augsburg', '0821-3109-0', '0821-3109-156', 'Herr', 'Dr.', 'Bernd', 'Eikens', 'germany.communications@upm-kymmene.com', 'http://www.upm-kymmene.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '893', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(785, 10, 'WashTec AG', 'Argonstr. 7', '86153', 'Augsburg', '0821-5584-0', '0821-5584-1410', 'Frau', '', 'Karoline', 'Kalb', 'washtec@washtec.de', 'http://www.washtec.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '302', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(786, 10, 'Johannesbad Holding AG & Co. KG', 'Johannesstr. 2', '94072', 'Bad Füssing', '08531-232102', '08531-232732', 'Herr', 'Dr.', 'York', 'Dhein', 'info@johannesbad.de', 'http://www.johannesbad.com/', 'Deutschland', 'Kommunales', 'C 1000-5000', '82', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(787, 10, 'Jos. Schneider Optische Werke GmbH', 'Ringstr. 132', '55543', 'Bad Kreuznach', '0671-601-0', '0671-601-109', 'Herr', 'Dr.', 'Josef', 'Staub', 'sales@schneiderkreuznach.com', 'http://www.schneiderkreuznach.com/', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '82', 'Rheinland-Pfalz', 'new', 0, 0, '2016-02-04 16:10:46'),
(788, 10, 'Wellemöbel GmbH', 'Zum Strothebach 11', '33175', 'Bad Lippspringe', '05252-9890-0', '05252-9890-585', 'Herr', '', 'Volker', 'Meurer', 'info@welle.com', 'http://www.welle-moebel.de/', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '78', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(789, 10, 'Gardner Denver / Comp Air Simmern ', 'Argenthalerstrasse 11', '55469', 'Simmern ', '', '', 'Herr', '', 'Jan Erik ', 'Dreier ', 'Jan-ErikDreier@Compair.com', 'http://www.gd-elmorietschle.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '82', 'Rheinland-Pfalz', 'new', 0, 0, '2016-02-04 16:10:46'),
(790, 10, 'Gießerei Heunisch GmbH', 'Westheimer Str. 6', '91438', 'Bad Windsheim', '09841-408-0', '09841-408-238', 'Frau', 'Dr.', 'Christiane', 'Heunisch-Grotz', 'info@heunisch-guss.com', 'http://www.heunisch-guss.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '138', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(791, 10, 'Auto-Scholz GmbH & Co. KG', 'Kärntenstr. 1', '96052', 'Bamberg', '0951-9333-0', '0951-9333-160', 'Herr', '', 'Michael', 'Eidenmüller', 'dialog@auto-scholz.de', 'http://www.auto-scholz.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '404', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(792, 10, 'Wieland Electric GmbH', 'Brennerstr. 10-14', '96052', 'Bamberg', '0951-9324-0', '0951-9324-198', 'Herr', 'Dr.', 'Ulrich', 'Schaarschmidt', 'info@wieland-electric.com', 'http://www.wieland-electric.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(793, 10, 'Auto-Jet Waschstraßen', 'Memminger Str. 51', '87743', 'Benningen', '08331-857-422', '08331-857-175', 'Herr', '', 'Otto', 'Christ jun.', 'info@auto-jet.de', 'http://www.auto-jet.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(794, 10, 'C S P GmbH', 'Am Schlagbaum 4', '59192', 'Bergkamen', '02307-20844-0', '02307-20844-20', 'Herr', '', 'Andreas', 'Conradi', 'info@csp-bergkamen.de', 'http://www.csp-bergkamen.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(795, 10, 'Steilmann Holding AG', 'Industriestr. 42', '59192', 'Bergkamen', '02389-783-0', '02389-783-112', 'Herr', 'Dr.', 'Michele', 'Puller', 'info@radici.de', 'http://www.steilmann-holding.eu', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '850', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(796, 10, 'Albert Handtmann Holding GmbH & Co. KG', 'Arthur-Handtmann-Str. 23', '88400', 'Biberach an der Riß', '07351-342-0', '07351-342-2762', 'Herr', '', 'Thomas', 'Handtmann', 'info@handtmann.de', 'http://www.handtmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '505', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(797, 10, 'JAB Josef Anstoetz KG', 'Potsdamer Str. 160', '33719', 'Bielefeld', '0521-2093-0', '0521-2093-388', 'Herr', '', 'Ralph', 'Anstoetz', 'jabverkauf@jab.de', 'http://www.jab.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '235', 'Nordrhein-Westfalen', 'open', 8, 0, '2016-02-04 16:10:46'),
(798, 10, 'Jibi Handel GmbH & Co.', 'Kurze Str. 4-6', '33613', 'Bielefeld', '0521-52006-0', '0521-52006-29', 'Herr', '', 'Manfred', 'Neumann', 'info@jibi.de', 'http://www.jibi.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '275', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(799, 10, 'Seidensticker GmbH', 'Herforder Str. 182-194', '33609', 'Bielefeld', '0521-306-0', '0521-306-111', 'Herr', '', 'Frank-Walter', 'Seidensticker', 'info@seidensticker.de', 'http://www.seidensticker.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '180', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(800, 10, 'Wilhelm Böllhoff GmbH & Co. KG', 'Archimedesstr. 1-4', '33649', 'Bielefeld', '0521-4482-01', '0521-4493-64', 'Herr', '', 'Michael W.', 'Böllhoff', 'info@boellhoff.com', 'http://www.boellhoff.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '135', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(801, 10, 'NKD Deutschland GmbH', 'Bühlstr. 5-7', '95463', 'Bindlach', '09208-699-0', '09208-699-209', 'Herr', '', 'Frank', 'Beeck', 'service@nkd.de', 'http://www2.nkd.com/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '505', 'Bayern', 'open', 1, 1, '2016-02-04 16:10:46'),
(802, 10, 'Trevira GmbH', 'Max-Fischer-Str. 11', '86399', 'Bobingen', '08234-9688-2222', '08234-9688-5432', 'Herr', '', 'Klaus', 'Holz', 'trevira.info@trevira.com', 'http://www.trevira.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '255', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(803, 10, 'Agilent Technologies Deutschland GmbH', 'Herrenberger Str. 130', '71034', 'Böblingen', '07031-464-0', '07031-464-2020', 'Herr', '', 'Manfred', 'Seitz', '', 'http://www.home.agilent.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '46', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(804, 10, 'EISENMANN SE', 'Tübinger Str. 81', '71032', 'Böblingen', '07031-78-0', '07031-78-1000', 'Herr', 'Dr.', 'Matthias', 'von Krauland', 'info@eisenmann.com', 'http://www.eisenmann.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '596', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(805, 10, 'Fahrzeug-Werke Lueg AG', 'Universitätsstr. 44-46', '44789', 'Bochum', '0234-318-0', '0234-318-337', 'Herr', '', 'Jürgen', 'Tauscher', 'info@lueg.de', 'http://www.lueg.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '613', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(806, 10, 'Gebr.Eickhoff Maschinenfabrik', 'Am Eickhoffpark 1', '44789', 'Bochum', '0234-975-0', '0234-975-2445', 'Herr', 'Dr.', 'Paul', 'Rheinländer', 'kontakt@eickhoff-bochum.de', 'http://www.eickhoff-bochum.de', 'Deutschland', 'Maschinenbau', 'G unter 100', '11', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(807, 10, 'RECTICEL SCHLAFKOMFORT GmbH', 'Schlaraffiastr. 1-10', '44867', 'Bochum', '02327-325-0', '', 'Herr', '', 'Jörg', 'Söltzer', 'info@schlaraffia.de', 'http://www.schlaraffia.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '313', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(808, 10, 'Wüstenberg Landtechnik Börm GmbH & Co.KG', 'Dorfstr. 3', '24863', 'Börm', '04627-18780', '04627-187860', 'Herr', '', 'Holger', 'Wüstenberg', 'info@wuestenberg-landtechnik.de', 'http://www.wuestenberg-landtechnik.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Schleswig-Holstein', 'new', 0, 0, '2016-02-04 16:10:46'),
(809, 10, 'MC-BAUCHEMIE MÜLLER GmbH & Co.', 'Am Kruppwald 1-8', '46238', 'Bottrop', '02041-101-0', '02041-64017', 'Frau', '', 'Hilde', 'Müller', 'info@mc-bauchemie.de', 'http://www.mc-bauchemie.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(810, 10, 'EFAFLEX Tor- und Sicherheitssysteme', 'Fliederstr. 14', '84079', 'Bruckberg', '08765-82-0', '08765-82-200', 'Herr', '', 'Ulrico', 'Becker', 'info@efaflex.com', 'http://www.efaflex.com/', 'Deutschland', 'Bauindustrie & Stahl', 'E 200-499', '86', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(811, 10, 'SURTECO SE', 'Johan-Viktor-Bausch-Str. 2', '86647', 'Buttenwiesen', '08274-9988-0', '08274-9988-505', 'Herr', '', 'Friedhelm', 'Päfgen', 'info@surteco.com', 'http://www.surteco.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '408', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(812, 10, 'Simmel AG', 'Chemnitzer Str. 105', '09224', 'Chemnitz', '0371-809-0', '0371-810-15', 'Herr', '', 'Peter', 'Simmel', 'service@simmel.de', 'http://www.simmel.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '122', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(813, 10, 'Wismut GmbH', 'Jagdschänkenstr. 29', '09117', 'Chemnitz', '0371-8120-0', '0371-8120-584', 'Herr', 'Dr.', 'Stefan', 'Mann', 'info@wismut.de', 'http://www.wismut.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '158', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(814, 10, 'KAESER KOMPRESSOREN SE', 'Carl-Kaeser-Str. 26', '96450', 'Coburg', '09561-640-0', '', 'Herr', '', 'Thomas', 'Kaeser', 'info@kaeser.com', 'http://www.kaeser.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '618', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(815, 10, 'ROLL Truck Service GmbH', 'Ludwig-Erhard-Str. 102', '74564', 'Crailsheim', '07951-29793-0', '07951-29793-39', 'Herr', '', 'Heinrich', 'Roll', 'info@rolltruck.de', 'http://www.rolltruck.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(816, 10, 'Mylan dura GmbH', 'Wittichstr. 6', '64295', 'Darmstadt', '06151-9512-0', '06151-9512-471', 'Herr', '', 'Lloyd', 'Gotsell', 'info@mylan-dura.de', 'http://www.mylan-dura.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '120', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(817, 10, 'Weidmüller Interface GmbH & Co. KG', 'Klingenbergstr. 16', '32758', 'Detmold', '05231-14-0', '05231-14-292083', 'Herr', '', 'Harald', 'Vogelsang', 'info@weidmueller.de', 'http://www.weidmueller.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '620', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(818, 10, 'Edeka C+C Großhandel GmbH', 'Mainfrankenpark 39-41', '97337', 'Dettelbach', '09302-9327-00', '09302-9327-12', 'Herr', '', 'Heiko', 'Kordmann', '', 'http://www.edeka-cc.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(819, 10, 'Isabellenhütte Heusler GmbH & Co. KG', 'Eibacher Weg 3-5', '35683', 'Dillenburg', '02771-934-0', '02771-23030', 'Herr', '', 'Jürgen', 'Brust', 'info@isabellenhuette.de', 'http://www.isabellenhuette.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '99', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(820, 10, 'Wendel GmbH', 'Am Güterbahnhof 30', '35683', 'Dillenburg', '02771-906-0', '02771-906-160', 'Herr', '', 'Klaus-Achim', 'Wendel', 'info@wendel-email.de', 'http://www.wendel-email.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '0', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(821, 10, 'GEERS Hörakustik AG & Co. KG', 'Otto-Hahn-Str. 35', '44227', 'Dortmund', '0231-9760-0', '0231-9760-100', 'Herr', '', 'Ulrich', 'Koch', 'info@geers.de', 'http://www.geers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(822, 10, 'Hellweg Die Profi-Baumärkte', 'Zeche Oespel 15', '44149', 'Dortmund', '0231-22618240', '0231-96965151', 'Herr', '', 'Christoph', 'Semer', 'Kundenservice@hellweg.de', 'http://www.hellweg.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '630', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(823, 10, 'REWE DORTMUND Großhandel eG', 'Asselner Hellweg 1-3', '44309', 'Dortmund', '0231-25000', '0231-2500177', 'Herr', '', 'Heinz-Bert', 'Zander', 'info@rewe-dortmund.de', 'http://www.rewe-dortmund.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(824, 10, 'ThyssenKrupp Rothe Erde GmbH', 'Tremoniastr. 5-11', '44137', 'Dortmund', '0231-186-0', '0231-186-2500', 'Herr', 'Dr.', 'Arno', 'Schuppert', 'rotheerde@thyssenkrupp.com', 'http://www.rotheerde.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(825, 10, 'Applied Materials GmbH', 'Buchenstr. 16 b', '01097', 'Dresden', '06023-92-6000', '06023-92-6020', 'Herr', '', 'Jürgen', 'Johnke', '', 'http://www.appliedmaterials.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '124', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(826, 10, 'GLOBALFOUNDRIES Dresden Module One', 'Wilschdorfer Landstr. 101', '01109', 'Dresden', '0351-2770', '', 'Herr', 'Dr.', 'Udo', 'Nothelfer', 'global.sales@globalfoundries.com', 'http://www.globalfoundries.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '891', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(827, 10, 'IKK classic', 'Tannenstr. 4b', '01099', 'Dresden', '0800-4551111', '0351-4292-200-99', 'Herr', '', 'Gerd', 'Ludwig', 'info@ikk-classic.de', 'http://www.ikk-classic.de/', 'Deutschland', 'Finanzen & Versicherung', 'C 1000-5000', '0', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(828, 10, 'Sächsische Dampfschiffahrts GmbH & Co.', 'Georg-Treu-Platz 3', '01067', 'Dresden', '0351-86609-0', '0351-86609-88', 'Frau', '', 'Karin', 'Hildebrand', 'info@saechsische-dampfschiffahrt.de', 'http://www.saechsische-dampfschiffahrt.de/', 'Deutschland', 'Gastronomie & Touristik', 'G unter 100', '9', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(829, 10, 'VEM Sachsenwerk GmbH', 'Pirnaer Landstr. 176', '01257', 'Dresden', '0351-208-0', '0351-208-1028', 'Herr', '', 'Gerhard', 'Freymuth', 'sachsenwerk@vem-group.com', 'http://www.vem-group.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '260', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:46'),
(830, 10, 'BiBA GmbH', 'Daimlerstr. 3', '47167', 'Duisburg', '0203-5196-0', '0203-5196-190', 'Herr', '', 'Oliver', 'Kessel', 'info@biba.de', 'http://www.biba.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '101', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(831, 10, 'Grillo-Werke AG', 'Weseler Str. 1', '47169', 'Duisburg', '0203-5557-0', '0203-5557-440', 'Herr', '', 'Ulrich', 'Grillo', 'info@grillo.de', 'http://www.grillo.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '539', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(832, 10, 'Hitachi Power Europe GmbH', 'Schifferstr. 80', '47059', 'Duisburg', '0203-8038-0', '0203-8038-1809', 'Herr', '', 'Klaus Dieter', 'Rennert', 'infobox@hitachi-power.com', 'http://www.hitachi-power.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '29', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(833, 10, 'Sachtleben Chemie GmbH', 'Dr.-Rudolf-Sachtleben-Str. 4', '47198', 'Duisburg', '02066-22-0', '02066-22-2000', 'Herr', 'Dr.', 'Jörg', 'Eraßme', 'info@sachtleben.de', 'http://www.sachtleben.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '550', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(834, 10, 'Akzo Nobel GmbH', 'Kreuzauer Str. 46', '52355', 'Düren', '02421-595-616', '', 'Herr', '', 'Dietmar', 'Stolle', 'info.deutsch@akzonobel.com', 'http://www.akzonobel.com/de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(835, 10, 'Heimbach GmbH & Co. KG', 'An Gut Nazareth 73', '52353', 'Düren', '02421-802-0', '02421-802-700', 'Herr', '', 'Peter', 'Michels', 'heimbach-paper@heimbach.com', 'http://www.heimbach.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '177', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(836, 10, 'AHG Allgemeine Hospitalgesellschaft', 'Benrather Schloßallee 31', '40215', 'Düsseldorf', '0211-3011-01', '0211-3011-2121', 'Herr', '', 'Norbert', 'Glahn', 'info@ahg.de', 'http://www.ahg.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '158', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(837, 10, 'Alloheim Senioren-Residenzen GmbH', 'Am Seestern 1', '40547', 'Düsseldorf', '0211-47870-0', '0211-47870-50', 'Herr', '', 'Rainer', 'Hohmann', 'info@alloheim.de', 'http://www.alloheim.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '52', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(838, 10, 'Anson''s Herrenhaus KG', 'Berliner Allee 2', '40212', 'Düsseldorf', '0211-1798-0', '0211-1798-697', 'Herr', 'Dr.', 'Horst', 'Clemens', 'kontakt@ansons.de', 'http://www.ansons.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(839, 10, 'BBDO Group Germany GmbH', 'Königsallee 92', '40212', 'Düsseldorf', '0211-1379-0', '0211-1379-8362', 'Herr', '', 'Frank', 'Lotze', 'info@bbdo.de', 'http://www.bbdo.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '433', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(840, 10, 'CEMEX Deutschland AG', 'Theodortstr. 178', '40472', 'Düsseldorf', '0211-4470-0', '0211-4470-1601', 'Herr', '', 'Eric', 'Wittmann', 'kundenservice.de@cemex.com', 'http://www.cemex.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '318', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(841, 10, 'Ericsson GmbH', 'Prinzenallee 21', '40549', 'Düsseldorf', '0211-534-0', '0211-534-1000', 'Herr', '', 'Stefan', 'Koetz', '', 'http://www.ericsson.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '681', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(842, 10, 'Gigaset Communications GmbH', 'Hansaallee 299', '40549', 'Düsseldorf', '089-722-0', '', 'Herr', '', 'Charles', 'Fränkl', '', 'http://gigaset.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '361', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(843, 10, 'Grohe AG', 'Feldmühleplatz 15', '40545', 'Düsseldorf', '0211-9130-3000', '0211-9130-3031', 'Herr', '', 'Thomas', 'Fuhr', 'presse@grohe.de', 'http://www.grohe.com', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '933', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(844, 10, 'Lieken AG', 'Fritz-Vomfelde-Str. 14-20', '40547', 'Düsseldorf', '0211-530634-0', '0211-530634-34', 'Herr', '', 'Markus', 'Biermann', 'pressestelle@lieken.de', 'http://www.lieken.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '780', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(845, 10, 'M.A.X. Automation AG', 'Breite Str. 29-31', '40213', 'Düsseldorf', '0211-90991-0', '0211-90991-11', 'Herr', '', 'Fabian', 'Spilker', 'info@maxautomation.de', 'http://www.maxautomation.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '260', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(846, 10, 'MEDIMAX Zentrale Electronic SE', 'Mündelheimer Weg 40', '40472', 'Düsseldorf', '0211-4156-0', '0211-4156-150', 'Herr', '', 'Friedrich', 'Sobol', 'info@medimax.de', 'http://www.medimax.de', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(847, 10, 'METRO Cash & Carry Deutschland GmbH', 'Metro-Str. 8', '40235', 'Düsseldorf', '0800-7242737', '0511-679986-19', 'Herr', '', 'Alain', 'Cappannelli', 'info@ccschaper.de', 'http://www.ccschaper.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '67', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(848, 10, 'O-I Glasspack GmbH & Co. KG', 'Goethestr. 75', '40237', 'Düsseldorf', '0211-2809-0', '0211-2809-246', 'Herr', '', 'Joachim', 'Herzig', '', 'http://www.o-i.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '110', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(849, 10, 'Ranger Marketing & Vertriebs GmbH', 'Parsevalstr. 11', '40468', 'Düsseldorf', '0211-20008100', '0211-20008101', 'Herr', '', 'Frank', 'Rittmann', 'info@ranger.de', 'http://www.ranger.de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(850, 10, 'SMS Siemag AG', 'Eduard-Schloemann-Str. 4', '40237', 'Düsseldorf', '0211-881-0', '0211-881-4902', 'Herr', '', 'Burkhard', 'Dahmen', 'communications@sms-demag.com', 'http://www.sms-demag.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(851, 10, 'Terex Germany GmbH & Co KG', 'Forststr. 16', '40597', 'Düsseldorf', '0211-598844-10', '0211-598844-50', 'Herr', '', 'Lutz', 'Henschen', 'info@terex.com', 'http://www.terex.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '486', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(852, 10, 'MAG IAS GmbH', 'Salacher Str. 93', '73054', 'Eislingen', '07161-805-0', '07161-805-223', 'Herr', '', 'Rainer', 'Schmückle', 'contact-eu@mag-ias.com', 'http://www.mag-ias.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '326', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:46'),
(853, 10, 'Peter Kölln', 'Westerstr. 22-24', '25336', 'Elmshorn', '04121-648-0', '04121-6639', 'Herr', 'Prof. Dr.', 'Hans Heinrich', 'Driftmann', 'kontakt@koelln.de', 'http://www.koelln.de', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '84', 'Schleswig-Holstein', 'new', 0, 0, '2016-02-04 16:10:46'),
(854, 10, 'SPAX International GmbH & Co. KG', 'Kölner Str. 71-77', '58256', 'Ennepetal', '02333-799-0', '02333-799-199', 'Herr', '', 'Michael A.', 'Thomas', 'info@spax.com', 'http://www.abc-verbindungstechnik.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '190', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(855, 10, 'Rottendorf Pharma GmbH', 'Ostenfelder Str. 51- 61', '59320', 'Ennigerloh', '02524-268-0', '02524-268-100', 'Herr', 'Dr.', 'Stephan', 'Fleck', 'info@rottendorf.de', 'http://www.rottendorf.de/', 'Deutschland', 'Chemieindustrie', 'D 500-999', '74', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(856, 10, 'X-FAB Semiconductor Foundries AG', 'Haarbergstr. 67', '99097', 'Erfurt', '0361-427-6000', '0361-427-6111', 'Herr', 'Dr.', 'Jens', 'Kosch', 'info@xfab.com', 'http://www.xfab.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '66', 'Thüringen', 'new', 0, 0, '2016-02-04 16:10:46'),
(857, 10, 'GRUNDFOS GMBH', 'Schlüterstr. 33', '40699', 'Erkrath', '0211-92969-0', '', 'Herr', '', 'Ralf', 'Brechmann', 'infoservice@grundfos.de', 'http://de.grundfos.com/about-us/grundfos-in-deutschland/grundfos-hilge.html', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '226', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(858, 10, 'Gauselmann AG', 'Merkur-Allee 1-15', '32339', 'Espelkamp', '05772-49-0', '05772-49-165', 'Herr', '', 'Paul', 'Gauselmann', 'info@gauselmann.de', 'http://www.gauselmann.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '711', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(859, 10, 'HARTING KGaA', 'Marienwerderstr. 3', '32339', 'Espelkamp', '05772-47-0', '05772-47-400', 'Herr', '', 'Dietmar', 'Harting', 'info@harting.com', 'http://www.harting.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '36', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(860, 10, 'Alfried Krupp von Bohlen und', 'Alfried-Krupp-Str. 21', '45131', 'Essen', '0201-434-1', '0201-434-2399', 'Herr', 'Dr.', 'Günther', 'Flämig', 'info@krupp-krankenhaus.de', 'http://www.krupp-krankenhaus.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '102', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(861, 10, 'Atlas Copco Holding GmbH', 'Langemarckstr. 35', '45141', 'Essen', '0201-2177-0', '0201-290874', 'Herr', '', 'Piet', 'Leys', 'info.acholding@de.atlascopco.com', 'http://www.atlascopco.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '678', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(862, 10, 'BackWerk Management GmbH', 'Limbecker Str. 25-37', '45127', 'Essen', '0201-20189-0', '0201-20189-200', 'Herr', 'Dr.', 'Dirk', 'Schneider', 'info@back-werk.com', 'http://www.back-werk.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '163', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(863, 10, 'i f m electronic gmbh', 'Friedrichstr. 1', '45128', 'Essen', '0201-2422-0', '0201-2422-1200', 'Herr', '', 'Michael', 'Marhofer', 'info@ifm.com', 'http://www.ifm-electronic.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '580', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(864, 10, 'Mr. Wash Autoservice AG', 'Westendstr. 8', '45143', 'Essen', '0201-220880-0', '0201-220880-40', 'Herr', '', 'Richard', 'Enning', 'info@mrwash.de', 'http://www.mr-wash.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '245', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(865, 10, 'Metsä Tissue GmbH', 'Adolf-Halstrick-Str. 6-12', '53879', 'Euskirchen', '02251-812-0', '02251-812-144', 'Herr', '', 'Michael', 'Päckner', '', 'http://www.metsatissue.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '437', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:46'),
(866, 10, 'Piasten GmbH & Co. KG', 'Piastenstr. 1', '91301', 'Forchheim', '09191-611-0', '09191-611-144', 'Herr', '', 'Rolf', 'Schröppel', 'office@piasten.de', 'http://www.piasten.com', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '75', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(867, 10, 'Texas Instruments Deutschland GmbH', 'Haggertystr. 1', '85356', 'Freising', '08161-802121', '08161-802045', 'Herr', 'Dr.', 'Wolfram', 'Tietscher', '', 'http://www.ti.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '236', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(868, 10, 'Rosenberger Hochfrequenztechnik', 'Hauptstr. 1', '83413', 'Fridolfing', '08684-18-0', '08684-18-499', 'Herr', '', 'Peter', 'Rosenberger', 'info@rosenberger.de', 'http://www.rosenberger.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(869, 10, 'Hans Segmüller Polstermöbelfabrik', 'Münchner Str. 35', '86316', 'Friedberg', '0821-6006-0', '0821-6006-1299', 'Herr', '', 'Johannes', 'Segmüller', 'friedberg@segmueller.de', 'http://www.segmueller.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '684', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(870, 10, 'Landbäckerei Ihle GmbH', 'Dr.-Balthasar-Hubmaier-Str. 6', '86316', 'Friedberg', '0821-66007-0', '', 'Herr', '', 'Wilhelm-Peter', 'Ihle', 'info@ihle.de', 'http://www.ihle.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '79', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(871, 10, 'axicorp GmbH', 'Max-Planck-Str. 36b', '61381', 'Friedrichsdorf', '06172-4999-0', '06172-4999-129', 'Herr', '', 'Dirk', 'Ullrich', 'service@axicorp.de', 'http://www.axicorp.de/', 'Deutschland', 'Chemieindustrie', 'E 200-499', '200', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(872, 10, 'Bose GmbH', 'Max-Planck-Str. 36', '61381', 'Friedrichsdorf', '06172-7104-0', '06172-7104-19', 'Herr', '', 'Anton', 'Schalkamp', 'info_de@bose.com', 'http://www.bose.de', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '129', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(873, 10, 'Milupa GmbH', 'Bahnstr. 14-30', '61381', 'Friedrichsdorf', '06172-99-0', '06172-99-1595', 'Frau', '', 'Christine', 'Siemssen', 'pr@milupa.de', 'http://www.milupa-gmbh.de/', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '213', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:46'),
(874, 10, 'Kennametal Holding GmbH', 'Wehlauer Str. 73', '90766', 'Fürth', '0911-9735-0', '0911-9735-388', 'Herr', 'Dr.', 'Joachim', 'Fabry', 'ebusiness.service@kennametal.com', 'http://www.kennametal.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '636', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(875, 10, 'LEONHARD KURZ Stiftung & Co. KG', 'Schwabacher Str. 482', '90763', 'Fürth', '0911-7141-0', '0911-7141-357', 'Herr', '', 'Walter', 'Kurz', 'sales@kurz.de', 'http://www.kurz.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '559', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(876, 10, 'Trolli GmbH', 'Oststr. 94', '90763', 'Fürth', '0911-78703-0', '0911-7870311-10', 'Herr', '', 'Herbert', 'Mederer', 'info@trolli.de', 'http://www.trolli.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '200', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:46'),
(877, 10, 'UVEX WINTER HOLDING GmbH & Co. KG', 'Würzburger Str. 181', '90766', 'Fürth', '0911-9736-0', '0911-9736-375', 'Herr', '', 'Rainer', 'Winter', 'holding@uvex.de', 'http://www.uvex.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '303', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(878, 10, 'Fachkliniken Hohenurach', 'Höhenstr. 56', '87629', 'Füssen', '08362-12-0', '08362-12-4000', 'Herr', '', 'Heinz', 'Dahlhaus', 'info@enzensberg.de', 'http://www.enzensberg.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '29', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(879, 10, 'PHÖNIX Seniorenzentren', 'Hiebelerstr. 29', '87629', 'Füssen', '08362-9128-0', '08362-9128-600', 'Frau', '', 'Susanne', 'Momberg', 'info@phoenix.nu', 'http://www.phoenix.nu/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(880, 10, 'Bott GmbH & Co. KG', 'Bahnstr. 17', '74405', 'Gaildorf', '07971-251-0', '07971-251-285', 'Herr', 'Dr.', 'Reinhard', 'Wollermann-Windgasse', 'info@bott.de', 'http://www.bott.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '81', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(881, 10, 'Backstube Wünsche GmbH', 'Gutenbergstr. 11', '85080', 'Gaimersheim', '08458-3279-0', '08458-3279-30', 'Herr', '', 'Hans Georg', 'Maier', 'kontakt@backstube-wuensche.de', 'http://www.backstube-wuensche.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '37', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(882, 10, 'Union SB-Großmarkt Südbayern GmbH', 'Ingolstädter Str. 120', '85080', 'Gaimersheim', '08458-62-0', '08458-62-213', 'Herr', '', '', 'Hollinger oder Gruber', 'Michaela.Mossburger@edeka.de', 'http://www.sb-union.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '466', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(883, 10, 'Bayerische Zugspitzbahn Bergbahn', 'Olympiastr. 27', '82467', 'Garmisch-Partenkirchen', '08821-797-0', '08821-797-900', 'Herr', '', '', 'Stauch', 'M.Stauch@Zugspitze.de', 'http://www.zugspitze.de', 'Deutschland', 'Transport & Logistik', 'E 200-499', '25', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(884, 10, 'BP Gelsenkirchen GmbH', 'Pawiker Str. 30', '45896', 'Gelsenkirchen', '0209-366-0', '', 'Herr', 'Dr.', 'Klaus', 'Niemann', '', 'http://www.bpge.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '193', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(885, 10, 'Detlef Malzer''s Backstube GmbH & Co. KG', 'Ulrichstr. 13', '45891', 'Gelsenkirchen', '0209-97074-0', '0209-97074-70', 'Herr', '', 'Hans-Joachim', 'Scherpel', 'info@malzers.de', 'http://www.malzers.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '90', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(886, 10, 'Flachglas MarkenKreis GmbH', 'Auf der Reihe 2', '45884', 'Gelsenkirchen', '0209-91329-0', '0209-91329-29', 'Herr', '', 'Thomas', 'Stukenkemper', 'info@flachglas-markenkreis.de', 'http://www.flachglas-markenkreis.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(887, 10, 'Pilkington Holding GmbH', 'Haydnstr. 19', '45884', 'Gelsenkirchen', '0209-168-0', '0209-168-2025', 'Herr', 'Dr.', 'Christian', 'Quenett', '', 'http://www.pilkington.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '448', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(888, 10, 'Voigt & Schweitzer GmbH & Co. KG', 'Nordring 4', '45894', 'Gelsenkirchen', '0209-319270-0', '0209-319270-16', 'Herr', '', 'Lars', 'Baumgürtel', 'info@zinq.com', 'http://www.zinq.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '18', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(889, 10, 'Deutsche Rockwool', 'Rockwool-Str. 37-41', '45966', 'Gladbeck', '02043-408-0', '02043-408-444', 'Herr', '', 'Volker', 'Christmann', 'info@rockwool.de', 'http://www.rockwool.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '317', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(890, 10, 'Berendsen GmbH', 'Stadtstr. 3-7', '25348', 'Glückstadt', '04124-914-0', '04124-914-123', 'Herr', '', 'Carsten', 'Best', 'info@berendsen.de', 'http://www.berendsen.de/', 'Deutschland', 'Kommunales', 'F 100-200', '46', 'Schleswig-Holstein', 'new', 0, 0, '2016-02-04 16:10:47'),
(891, 10, 'Möbel Rieger GmbH & Co. KG', 'Holzheimer Str. 2', '73037', 'Göppingen', '07161-621-0', '07161-621-196', 'Herr', '', 'Franz', 'Rieger', 'info@moebel-rieger.de', 'http://www.moebel-rieger.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '200', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(892, 10, 'Fossil (Europe) GmbH', 'Oberwinkl 1', '83355', 'Grabenstätt', '08661- 6226000', '', 'Herr', '', 'Christian', 'Coenen', 'info@fossil.de', 'http://www.fossil.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '349', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(893, 10, 'Opto GmbH', 'Lochhammer Schlag 14', '82166', 'Gräfelfing', '089-898055-0', '089-898055-18', 'Herr', '', 'Markus', 'Riedi', 'info@opto.de', 'http://www.opto.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'G unter 100', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(894, 10, 'IMO Holding GmbH', 'Imostr. 1', '91350', 'Gremsdorf', '09193-6395-0', '09193-6395-1140', 'Herr', '', 'Erich', 'Ruß', 'mail@imo.de', 'http://www.imo.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '85', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(895, 10, 'Mondi Consumer Packaging', 'Hüttruper Heide 88', '48268', 'Greven', '02571-9191-0', '02571-9191-91', 'Herr', '', 'Ralph', 'Landwehr', 'greven@nordenia.com', 'http://www.mondigroup.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '881', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(896, 10, 'Engbers GmbH & Co.KG', 'Düppelstr. 4', '48599', 'Gronau', '02562-713-0', '02562-713-169', 'Herr', '', 'Bernd', 'Bosch', 'info@engbers.de', 'http://www.engbers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '103', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(897, 10, 'Resopal GmbH', 'Hans-Böckler-Str. 4', '64823', 'Groß-Umstadt', '06078-80-0', '06078-80-624', 'Herr', '', 'Alan Timothy', 'Pearson', 'info@resopal.de', 'http://www.resopal.de/', 'Deutschland', 'Bauindustrie & Stahl', 'D 500-999', '0', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(898, 10, 'Bender GmbH & Co. KG', 'Londorfer Str. 65', '35305', 'Grünberg', '06401-807-0', '06401-807-259', 'Herr', 'Dr.', 'Dirk', 'Pieler', 'info@bender-de.com', 'http://www.bender-de.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '0', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(899, 10, 'Bavaria Film GmbH', 'Bavariafilmplatz 7', '82031', 'Grünwald', '089-6499-0', '089-6492-507', 'Herr', '', 'Achim', 'Rohnke', 'info@bavaria-film.de', 'http://www.bavaria-film.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '249', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(900, 10, 'Brandt Zwieback-Schokoladen', 'Kölner Str. 32-34', '58135', 'Hagen', '02331-477-0', '02331-477-190', 'Herr', '', 'Carl-Jürgen', 'Brandt', 'marketing@brandt-gmbh.de', 'http://www.brandt-gmbh.de', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '155', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(901, 10, 'Christ Juweliere und Uhrmacher', 'Kabeler Str. 4', '58099', 'Hagen', '02331-690-6286', '02331-690-8375', 'Frau', '', 'Elisabeth', 'Laraia', 'info@christ.de', 'http://www.christ.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '310', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(902, 10, 'Diakonie Mark-Ruhr gemeinnützige GmbH', 'Martin-Luther-Str. 9-11', '58095', 'Hagen', '02331-3809-00', '02331-3809-09', 'Herr', '', 'Volker', 'Holländer', 'info@diakonie-mark-ruhr.de', 'http://www.diakonie-mark-ruhr.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '155', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(903, 10, 'Hussel GmbH', 'Kabeler Str. 4', '58099', 'Hagen', '02331-690-8181', '02331-690-681', 'Herr', '', 'Sven', 'Eklöh', 'service@hussel.de', 'http://www.hussel.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '99', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(904, 10, 'Michael Brücken Kaufpark GmbH & Co OHG', 'Weststr. 4', '58089', 'Hagen', '02331-300-0', '02331-300-271', 'Herr', '', 'Günter', 'Zeitz', 'post@ihr-kaufpark.de', 'http://www.ihr-kaufpark.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '819', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(905, 10, 'SinnLeffers GmbH', 'Batheyer Str. 115-117', '58099', 'Hagen', '02331-620-0', '02331-620-100', 'Herr', '', 'Friedrich-Wilhelm', 'Göbel', 'info@sinnleffers.de', 'http://www.sinnleffers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '257', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(906, 10, 'MAHA Maschinenbau', 'Hoyen 20', '87490', 'Haldenwang', '08374-585-0', '08374-585-590', 'Herr', '', 'Thomas', 'Förg', 'maha@maha.de', 'http://www.maha.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(907, 10, 'TTL Tapeten-Teppichbodenland', 'Emil-Kemmer-Str. 3', '96103', 'Hallstadt', '0951-96232-0', '0951-96232-33', 'Herr', '', 'Heinz', 'Fuchs', 'info@ttl-ttm.de', 'http://www.ttl-ttm.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(908, 10, 'f & w fördern und wohnen', 'Grüner Deich 17', '20097', 'Hamburg', '040-42835-0', '040-42835-3584', 'Herr', 'Dr.', 'Rembert', 'Vaerst', 'wohnen@foerdernundwohnen.de', 'http://www.foerdernundwohnen.de', 'Deutschland', 'Kommunales', 'D 500-999', '46', 'Hamburg', 'new', 0, 0, '2016-02-04 16:10:47'),
(909, 10, 'Hamburger Senioren Domizile GmbH', 'Reichsbahnstr. 20', '22525', 'Hamburg', '040-57203-0', '040-57203-6012', 'Herr', '', 'Lutz', 'Gornik', 'info@hamburger-senioren-domizile.de', 'http://www.hamburger-senioren-domizile.de/', 'Deutschland', 'Kommunales', 'E 200-499', '0', 'Hamburg', 'new', 0, 0, '2016-02-04 16:10:47'),
(910, 10, 'Plath GmbH', 'Gotenstr. 18', '20097', 'Hamburg', '040-23734-0', '040-23734-173', 'Herr', '', 'Nico', 'Scharfe', 'info@plath.de', 'http://www.plath.de', 'Deutschland', 'Maschinenbau', 'F 100-200', '0', 'Hamburg', 'new', 0, 0, '2016-02-04 16:10:47'),
(911, 10, 'RÄDER-VOGEL', 'Sperlsdeicher Weg 19-23', '21109', 'Hamburg', '040-75499-0', '040-75499-175', 'Herr', '', 'Dieter', 'Henning', 'rv@raedervogel.de', 'http://www.raedervogel.de', 'Deutschland', 'Maschinenbau', 'E 200-499', '60', 'Hamburg', 'new', 0, 0, '2016-02-04 16:10:47'),
(912, 10, 'Anton Hosselmann GmbH & Co. KG', 'Römerstr. 28', '59075', 'Hamm', '02381-97007-0', '02381-789286', 'Herr', '', 'Jürgen', 'Aust', 'info@hosselmann.de', 'http://www.hosselmann.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '70', 'Nordrhein-Westfalen', 'open', 2, 0, '2016-02-04 16:10:47'),
(913, 10, 'Westfälische Drahtindustrie GmbH', 'Wilhelmstr. 7', '59067', 'Hamm', '02381-276-0', '02381-276-211', 'Frau', '', 'Katja', 'Pampus', 'draht.hamm@wdi.de', 'http://www.wdi.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '621', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(914, 10, 'Eckart GmbH', 'Güntersthal 4', '91235', 'Hartenstein', '09152-77-0', '09152-77-7008', 'Herr', 'Dr.', 'Wolfgang', 'Schütt', 'info.eckart@altana.com', 'http://www.eckart.net', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(915, 10, 'Carl Edelmann GmbH', 'Steinheimer Str. 45', '89518', 'Heidenheim an der Brenz', '07321-340-0', '07321-340-244', 'Herr', '', 'Dierk', 'Schröder', 'info@edelmann.de', 'http://www.edelmann.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '188', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(916, 10, 'Uniklinikum Marien Hospital Herne', 'Hölkeskampring 40', '44625', 'Herne', '02323-499-0', '02323-499-1999', 'Herr', '', 'Theo', 'Freitag', 'info@marienhospital-herne.de', 'http://www.marienhospital-herne.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(917, 10, 'STABILO International GmbH', 'Schwanweg 1', '90562', 'Heroldsberg', '0911-567-0', '0911-567-4444', 'Herr', '', 'Sebastian', 'Schwanhäusser', 'info@stabilo.com', 'http://www.stabilo.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '370', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(918, 10, 'Herta GmbH', 'Westerholter Str. 750-770', '45701', 'Herten', '02366-301-701', '02366-301-370', 'Herr', '', 'Volker', 'Baltes', 'info@herta.de', 'http://www.hertaland.de/', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '250', 'Nordrhein-Westfalen', 'open', 3, 0, '2016-02-04 16:10:47'),
(919, 10, 'ASK Chemicals GmbH', 'Reisholzstr. 16 - 18', '40721', 'Hilden', '0211-711030', '0211-7110335', 'Herr', '', 'Frank', 'Coenen', 'info@ask-chemicals.de', 'http://www.ask-chemicals.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '109', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(920, 10, 'Conrad Electronic SE', 'Klaus-Conrad-Str. 1', '92242', 'Hirschau', '0180-5312111', '0180-5312110', 'Herr', '', 'Holger', 'Ruban', 'webmaster@conrad.de', 'http://www.conrad.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '804', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(921, 10, 'Roth & Rau AG', 'An der Baumschule 6-8', '09337', 'Hohenstein-Ernstthal', '03723-671234', '03723-6711000', 'Herr', '', 'Peter M.', 'Wagner', 'info@roth-rau.com', 'http://www.roth-rau.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '154', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:47'),
(922, 10, 'Hexal Aktiengesellschaft', 'Industriestr. 25', '83607', 'Holzkirchen', '08024-908-0', '08024-908-1290', 'Herr', '', 'Sandrine', 'Piret-Gerard', 'service@hexal.de', 'http://www.hexal.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(923, 10, 'Montanhydraulik GmbH', 'Bahnhofstr. 39', '59439', 'Holzwickede', '02301-916-0', '02301-916-123', 'Herr', 'Dr.-Ing.', 'Ralf', 'Becker', 'info@montanhydraulik.com', 'http://www.montanhydraulik.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '210', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(924, 10, 'Jeans Fritz', 'Tengerner Str. 143', '32609', 'Hüllhorst', '05744-512-0', '05744-512-111', 'Herr', '', 'Ernst', 'Schäfer', 'info@jeans-fritz.de', 'http://www.jeans-fritz.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '123', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(925, 10, 'RAG Anthrazit Ibbenbüren GmbH', 'Osnabrücker Str. 112', '49477', 'Ibbenbüren', '05451-51-0', '05451-51-3200', 'Herr', 'Dr.', 'Heinz-Werner', 'Voß', 'ib.gmbh@rag.de', 'http://www.anthrazit-ibbenbueren.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '383', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(926, 10, 'Alcoa Aluminium Deutschland, Inc.', 'Stenglingser Weg 65-78', '58642', 'Iserlohn', '02374-936-0', '', 'Herr', '', 'Edwin P.', 'Drake', '', 'http://www.alcoa.com/germany/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '700', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(927, 10, 'Constantin Medien AG', 'Münchener Str. 101g', '85737', 'Ismaning', '089-99500-0', '089-99500-111', 'Herr', '', 'Bernhard', 'Burgener', 'info@constantin-medien.de', 'http://www.constantin-medien.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '520', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47');
INSERT INTO `customer` (`id`, `project_id`, `company`, `street`, `zip_code`, `city`, `phone`, `fax`, `salutation`, `title`, `first_name`, `last_name`, `email`, `url`, `country`, `state`, `category_wzw`, `class`, `sales`, `status`, `calls`, `resubmission`, `create_date`) VALUES
(928, 10, 'Vinnolit GmbH & Co. KG', 'Carl-Zeiss-Ring 25', '85737', 'Ismaning', '089-96103-0', '089-96103-103', 'Herr', 'Dr.', 'Josef', 'Ertl', 'info@vinnolit.com', 'http://www.vinnolit.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '905', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(929, 10, 'JENOPTIK AG', 'Carl-Zeiss-Str. 1', '07739', 'Jena', '03641-65-0', '03641-424514', 'Herr', 'Dr.', 'Michael', 'Mertin', 'pr@jenoptik.com', 'http://www.jenoptik.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '585', 'Thüringen', 'new', 0, 0, '2016-02-04 16:10:47'),
(930, 10, 'PAPSTAR GmbH', 'Daimlerstr. 4-8', '53925', 'Kall', '02441-83-0', '02441-83-100', 'Herr', '', 'Hubertus', 'Kantelberg', 'info@papstar.de', 'http://www.papstar.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '119', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(931, 10, 'Düker GmbH & Co. KGaA', 'Würzburger Str. 10', '97753', 'Karlstadt', '09353-7910', '09353-791198', 'Herr', '', 'Martin', 'Simons', 'info@dueker.de', 'http://www.dueker.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '122', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(932, 10, 'Hilti Deutschland AG (Liechtenstein),', 'Hiltistr. 2', '86916', 'Kaufering', '0800-8885522', '0800-8885523', 'Herr', '', 'Jochen', 'Olbert', 'de.kundenservice@hilti.com', 'http://www.hilti.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '411', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(933, 10, 'Ponnath DIE MEISTERMETZGER GmbH', 'Bayreuther Str. 40', '95478', 'Kemnath', '09642-30-0', '09642-30-128', 'Herr', '', 'Michael', 'Ponnath', 'ponnath@ponnath.de', 'http://www.ponnath.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '154', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(934, 10, 'Feneberg Lebensmittel GmbH', 'Ursulasrieder Str. 2', '87437', 'Kempten', '0831-5717-0', '0831-5717-344', 'Herr', '', 'Christof', 'Feneberg', 'info@feneberg.de', 'http://www.feneberg.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '300', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(935, 10, 'Boll & Kirch Filterbau GmbH', 'Siemensstr. 10-14', '50170', 'Kerpen', '02273-562-0', '02273-562-185', 'Herr', 'Dr.', 'Heinz', 'Lux', 'info@bollfilter.de', 'http://www.bollfilter.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '143', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(936, 10, 'Hettich Holding GmbH & Co. oHG', 'Vahrenkampstr. 12-16', '32278', 'Kirchlengern', '05223-77-0', '05223-77-1414', 'Herr', 'Dr.', 'Andreas', 'Hettich', 'info@de.hettich.com', 'http://www.hettich.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '754', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(937, 10, 'Hörmann GmbH', 'Hauptstr. 45-47', '85614', 'Kirchseeon', '08091-52261', '08091-1275', 'Herr', '', 'Matthias', 'Müllner', 'info@hoermann-gmbh.de', 'http://www.hoermann-gmbh.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '590', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(938, 10, 'WEKA Holding GmbH & Co. KG', 'Römerstr. 4', '86438', 'Kissing', '08233-23-0', '08233-23-195', 'Herr', '', 'Werner', 'Mützel', 'info@weka-holding.de', 'http://www.weka-holding.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '217', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(939, 10, 'WIKA Alexander Wiegand SE & Co. KG', 'Alexander-Wiegand-Str. 30', '63911', 'Klingenberg', '09372-132-0', '09372-132-406', 'Herr', '', 'Alexander', 'Wiegand', 'info@wika.de', 'http://www.wika.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '800', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(940, 10, 'Funkwerk AG', 'Im Funkwerk 5', '99625', 'Kölleda', '03635-600-0', '03635-600-507', 'Frau', '', 'Kerstin', 'Schreiber', 'info@funkwerk.com', 'http://www.funkwerk.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '211', 'Thüringen', 'new', 0, 0, '2016-02-04 16:10:47'),
(941, 10, 'CARGLASS GmbH', 'Godorfer Hauptstr. 175', '50997', 'Köln', '0800-0363636', '02236-96206-34', 'Herr', '', 'Jean-Pierre', 'Filippini', 'webmaster@carglass.de', 'http://www.carglass.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '248', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(942, 10, 'Peugeot Deutschland GmbH', 'Edmund-Rumpler-Str. 4', '51149', 'Köln', '0800-1111999', '', 'Herr', '', 'Rick', 'Hermanns', 'inf.de@peugeot.com', 'http://www.peugeot.de', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '1660', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(943, 10, 'Fränkische Rohrwerke', 'Hellinger Str. 1', '97486', 'Königsberg', '09525-88-0', '09525-88-150', 'Herr', '', 'Otto', 'Kirchner', 'info.kbg@fraenkische.de', 'http://www.fraenkische.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '317', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(944, 10, 'Bodensee-Schiffsbetriebe GmbH', 'Hafenstr. 6', '78462', 'Konstanz', '07531-3640-0', '07531-3640-373', 'Herr', '', 'Stefan', 'Ballier', 'info@bsb.de', 'http://www.bsb-online.com/', 'Deutschland', 'Gastronomie & Touristik', 'F 100-200', '16', 'Baden-Württemberg', 'open', 2, 1, '2016-02-04 16:10:47'),
(945, 10, 'AL-KO KOBER SE', 'Ichenhauser Str. 14', '89359', 'Kötz', '08221-97-0', '08221-97-393', 'Herr', '', 'Stefan', 'Kober', 'info@al-ko.de', 'http://www.al-ko.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '706', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(946, 10, 'G. Siempelkamp GmbH & Co.KG', 'Siempelkampstr. 75', '47803', 'Krefeld', '02151-92-30', '02151-92-5604', 'Herr', 'Dr.', 'Hans W.', 'Fechner', 'info@siempelkamp.com', 'http://www.siempelkamp.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '798', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(947, 10, 'Kurtz Holding GmbH & Co', 'Industriegebiet Wiebelbach', '97892', 'Kreuzwertheim', '09342-807-0', '09342-807-404', 'Herr', '', 'Rainer', 'Kurtz', 'info@kurtz.de', 'http://www.kurtz.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '190', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(948, 10, 'IREKS GmbH', 'Lichtenfelser Str. 20', '95326', 'Kulmbach', '09221-706-0', '09221-706-306', 'Herr', '', 'Jürgen', 'Brinkmann', 'info@ireks.com', 'http://www.ireks.de/', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '231', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(949, 10, 'Markgrafen-Getränkevertrieb-GmbH', 'Lichtenfelser Str. 6', '95326', 'Kulmbach', '09221-6003-0', '09221-6003-306', 'Herr', '', 'Korel', 'Gülmen', 'info@markgrafen.com', 'http://www.markgrafen.com', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(950, 10, 'Einhell Germany AG', 'Wiesenweg 22', '94405', 'Landau an der Isar', '09951-942-0', '09951-1702', 'Herr', '', 'Andreas', 'Kroiss', 'info@einhell.de', 'http://www.einhell.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '365', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(951, 10, 'ara Shoes AG', 'Zur Schlenkhecke 4', '40764', 'Langenfeld', '02173-105-0', '02173-105-108', 'Herr', '', 'Maximilian', 'Müller', 'info@ara-shoes.de', 'http://www.ara-shoes.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '386', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(952, 10, 'Strauss INNOVATION GmbH & Co.', 'Elisabeth-Selbert-Str. 13', '40764', 'Langenfeld', '02173-99-0001', '02173-99-2390', 'Herr', 'Dr.', 'Hans Peter', 'Döhmen', 'unternehmen@strauss-innovation.de', 'http://www.strauss-innovation.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '116', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(953, 10, 'Gallus Druckmaschinen GmbH', 'Steinbruchstr. 5', '35428', 'Langgöns', '06447-9250', '', 'Herr', '', 'Udo', 'Gabriel', '', 'http://www.gallus-group.com/', 'Deutschland', 'Maschinenbau', 'F 100-200', '44', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(954, 10, 'Käserei Champignon', 'Kemptener Str. 17-24', '87493', 'Lauben', '08374-92-0', '08374-92-169', 'Herr', '', 'Robert', 'Hofmeister', 'info@kaeserei-champignon.de', 'http://www.champignon.de/de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '271', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(955, 10, 'EMUGE-Werk Richard Glimpel GmbH & Co. KG', 'Nürnberger Str. 96-100', '91207', 'Lauf a. d. Pegnitz', '09123-186-0', '09123-14313', 'Herr', '', 'Helmut', 'Glimpel', 'info@emuge.de', 'http://www.emuge.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(956, 10, 'Uhlmann Pac-Systeme GmbH & Co. KG', 'Uhlmannstr. 14-18', '88471', 'Laupheim', '07392-702-0', '07392-18972', 'Herr', '', 'Norbert', 'Gruber', 'info@uhlmann.de', 'http://www.uhlmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '139', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(957, 10, 'Bolta Werke GmbH', 'Industriestr. 22', '91227', 'Leinburg', '09120-90-0', '09120-6141', 'Herr', '', 'Christian', 'Falk', 'info@bolta.de', 'http://www.bolta.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '98', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(958, 10, 'Wanzl Metallwarenfabrik GmbH', 'Rudolf-Wanzl-Str. 4', '89340', 'Leipheim', '08221-729-0', '08221-729-1000', 'Herr', '', 'Bernhard', 'Renzhofer', 'info@wanzl.de', 'http://www.wanzl.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '309', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(959, 10, 'Unister Holding GmbH', 'Barfußgäßchen 11', '04109', 'Leipzig', '0341-650-500', '0341-650-5023299', 'Herr', '', 'Thomas', 'Wagner', 'info@unister-gmbh.de', 'http://www.unister.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '227', 'Sachsen', 'new', 0, 0, '2016-02-04 16:10:47'),
(960, 10, 'Bischof + Klein GmbH & Co. KG', 'Rahestr. 47', '49525', 'Lengerich', '05481-920-0', '05481-920-541', 'Herr', 'Dr.', 'Volker', 'Pfennig', 'info@bk-international.com', 'http://www.bk-international.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '475', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(961, 10, 'Windmöller & Hölscher KG', 'Münsterstr. 50', '49525', 'Lengerich', '05481-14-0', '05481-14-2649', 'Herr', 'Dr.', 'Jürgen', 'Vutz', 'info@wuh-lengerich.de', 'http://www.wuh-lengerich.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '480', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(962, 10, 'Harmonic Drive AG', 'Hoenbergstr. 14', '65555', 'Limburg', '06431-5008-0', '06431-5008-119', 'Herr', '', 'Ekrem', 'Sirman', 'info@harmonicdrive.de', 'http://www.harmonicdrive.de/', 'Deutschland', 'Maschinenbau', 'E 200-499', '0', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(963, 10, 'SIG Combibloc GmbH', 'Rurstr. 58', '52441', 'Linnich', '02462-79-0', '02462-79-2519', 'Herr', 'Dr.', 'Thomas', 'Kloubert', 'info@sigcombibloc.com', 'http://www.sig.biz', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '808', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(964, 10, 'Nolte Küchen GmbH und Co. KG', 'Anni-Nolte-Str. 4', '32584', 'Löhne', '05732-899-0', '', 'Herr', '', 'Manfred', 'Wippermann', 'info@nolte-kuechen.de', 'http://www.nolte-kuechen.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(965, 10, 'FRIMO Group GmbH', 'Hansaring 6', '49504', 'Lotte', '05404-886-0', '05404-886-333', 'Herr', '', 'Hans-Günter', 'Bayer', 'info@frimo.com', 'http://www.frimo.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '135', 'Nordrhein-Westfalen', 'open', 1, 1, '2016-02-04 16:10:47'),
(966, 10, 'TT-Line GmbH & Co. KG', 'Zum Hafenplatz 1', '23570', 'Lübeck', '04502-801-0', '04502-801407', 'Herr', 'Dr.', 'Hanns Heinrich', 'Conzen', 'info@ttline.com', 'http://www.tt-line.de', 'Deutschland', 'Gastronomie & Touristik', 'G unter 100', '0', 'Schleswig-Holstein', 'new', 0, 0, '2016-02-04 16:10:47'),
(967, 10, 'HASCO Hasenclever GmbH + Co KG', 'Römersweg 4', '58513', 'Lüdenscheid', '02351-957-0', '02351-957-237', 'Herr', '', 'Christoph', 'Ehrlich', 'info@hasco.com', 'http://www.hasco.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(968, 10, 'CARAT Systementwicklungs-', 'Am Victoria-Turm 2', '68163', 'Mannheim', '0621-86080-0', '0621-86080-914', 'Herr', '', 'Thomas', 'Vollmar', 'info@carat-gruppe.de', 'http://www.carat-gruppe.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '128', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(969, 10, 'WAREMA Renkhoff SE', 'Hans-Wilhelm-Renkhoff-Str. 2', '97828', 'Marktheidenfeld', '09391-20-0', '09391-20-4299', 'Frau', '', 'Angelique', 'Renkhoff-Mücke', 'info@warema.de', 'http://www.warema.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '376', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(970, 10, 'AGCO GmbH', 'Johann-Georg-Fendt-Str. 4', '87616', 'Marktoberdorf', '08342-77-0', '08342-77-220', 'Herr', '', 'Michael', 'Gschwender', 'info@xfendt.de', 'http://www.fendt.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '850', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(971, 10, 'SCHERDEL GmbH', 'Scherdelstr. 2', '95615', 'Marktredwitz', '09231-603-0', '09231-62938', 'Herr', '', 'Walter', 'Bach', 'info@scherdel.de', 'http://www.scherdel.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '480', 'Bayern', 'open', 3, 0, '2016-02-04 16:10:47'),
(972, 10, 'Georg Jos. Kaes GmbH', 'Am Ring 15', '87665', 'Mauerstetten', '08341-807-0', '08341-807-202', 'Herr', '', 'Helmut', 'Hermann', 'info@v-markt.de', 'http://www.v-markt.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '616', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(973, 10, 'Clean Car AG', 'Am Meerkamp 19', '40667', 'Meerbusch', '02132-9311-0', '02132-9311-30', 'Herr', '', 'Holger', 'Dörner', 'info@cleancar.de', 'http://www.cleancar.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '115', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(974, 10, '>rational< einbauküchen GmbH', 'Rationalstr. 4', '49328', 'Melle', '05226-58-0', '05226-58-212', 'Herr', '', 'Andrea', 'Lodetti', 'info@rational.de', 'http://www.rational.de/', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '32', 'Niedersachsen', 'open', 1, 0, '2016-02-04 16:10:47'),
(975, 10, 'Berger Holding GmbH & Co. KG', 'In der Neuen Welt 14', '87700', 'Memmingen', '08331-930-01', '08331-930-101', 'Herr', '', 'Oswald', 'Berger', 'berger-holding@aberger.de', 'http://www.aberger.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '240', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(976, 10, 'Magnet-Schultz GmbH & Co.', 'Allgäuer Str. 30', '87700', 'Memmingen', '08331-104-0', '08331-104-333', 'Herr', '', 'Wolfgang', 'Schultz', 'info@magnet-schultz.de', 'http://www.magnet-schultz.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '143', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(977, 10, 'Heinrich Rosier GmbH & Co. KG', 'Fröndenberger Str. 138-148', '58706', 'Menden', '02373-171-01', '02373-171-108', 'Herr', '', 'Heinrich', 'Rosier', 'info@rosier.de', 'http://www.rosier.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '571', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(978, 10, 'OBO Bettermann GmbH & Co. KG', 'Hüingser Ring 52', '58710', 'Menden', '02373-89-0', '02373-89-238', 'Herr', '', 'Ulrich', 'Bettermann', 'info@obo.de', 'http://www.bettermann.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '400', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(979, 10, 'Zott SE & Co. KG', 'Dr.-Steichele-Str. 4', '86690', 'Mertingen', '09078-801-0', '09078-801-110', 'Frau', '', 'Christine', 'Weber', 'info@zott.de', 'http://www.zott-dairy.com/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '697', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(980, 10, 'GROB-WERKE GmbH & Co. KG', 'Industriestr. 4', '87719', 'Mindelheim', '08261-996-0', '', 'Herr', '', 'German', 'Wankmiller', 'info@grobgroup.com', 'http://www.grob.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '388', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(981, 10, 'EDEKA-Markt Minden-Hannover GmbH', 'Wittelsbacherallee 61', '32427', 'Minden', '0571-802-0', '0571-802-1804', 'Herr', '', 'Bernhard', 'Berger', 'joerg.brockhoff@minden.edeka.de', 'http://www.niedrig-preis.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(982, 10, 'Karl Preuß GmbH & Co.', 'Viktoriastr. 27', '32423', 'Minden', '0571-3908-0', '0571-3908-15', 'Herr', '', 'Rüdiger', 'Heß', 'info@wez.de', 'http://www.wez.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '186', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(983, 10, 'MIOS Großhandel GmbH', 'Wittelsbacherallee 61', '32427', 'Minden', '0571-802-1761', '0571-802-1315', 'Frau', '', 'Heike', 'Kryszat', 'info@minden.edeka.de', 'http://www.mios.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '716', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(984, 10, 'WAGO Kontakttechnik GmbH', 'Hansastr. 27', '32423', 'Minden', '0571-887-0', '0571-887-169', 'Herr', '', 'Sven', 'Hohorst', 'info@wago.com', 'http://www.wago.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '661', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(985, 10, 'Trinkgut', 'Chemnitzer Str. 24', '47441', 'Moers', '02841-209-0', '02841-209-2435', 'Herr', '', 'Dirk', 'Neuhaus', 'kundenservice@trinkgut.de', 'http://www.trinkgut.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '516', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(986, 10, 'Scheidt & Bachmann GmbH', 'Breite Str. 132', '41238', 'Mönchengladbach', '02166-266-0', '02166-266-375', 'Herr', 'Dr.-Ing.', 'Norbert', 'Miller', 'admin@scheidt-bachmann.de', 'http://www.scheidt-bachmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '245', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(987, 10, 'Siemes Schuhcenter GmbH & Co. KG', 'Krefelder Str. 310', '41066', 'Mönchengladbach', '02161-965-0', '02161-965-111', 'Herr', '', 'Heinz Willi', 'Siemes', 'info@siemes.de', 'http://www.schuhcenter.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '385', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(988, 10, 'Hama GmbH & Co KG', 'Dresdner Str. 9', '86651', 'Monheim', '09091-502-0', '09091-502-279', 'Herr', '', 'Christoph', 'Thomas', 'hama@hama.de', 'http://www.hama.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(989, 10, 'WEISS-DRUCK GmbH & Co. KG', 'Hans-Georg-Weiss-Str. 7', '52156', 'Monschau', '02472-982-0', '02472-982-200', 'Herr', '', 'Georg', 'Weiss', 'info@weiss-druck.de', 'http://www.weiss-druck.de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '138', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(990, 10, 'Hans Turck GmbH & Co. KG', 'Witzlebenstr. 7', '45472', 'Mülheim an der Ruhr', '0208-4952-0', '0208-4952-264', 'Herr', '', 'Ulrich', 'Turck', 'more@turck.com', 'http://www.turck.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(991, 10, 'Mannesmannröhren-Werke GmbH', 'Wiesenstr. 36', '45473', 'Mülheim an der Ruhr', '0208-458-0', '0208-458-1999', 'Herr', '', 'Wolfgang', 'Eging', 'info.service@smrw.de', 'http://www.smrw.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(992, 10, 'Salzgitter Mannesmann Precision GmbH', 'Wiesenstr. 36', '45473', 'Mülheim an der Ruhr', '0208-458-1507', '0208-458-1635', 'Herr', '', 'Heinrich', 'Clören', 'marketing@smp-tubes.com', 'http://praezisrohr.smp-tubes.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '450', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(993, 10, 'Alois Dallmayr KG', 'Dienerstr. 14-15', '80331', 'München', '089-2135-0', '089-2135-167', 'Herr', '', 'Wolfgang', 'Wille', 'info@dallmayr.de', 'http://www.dallmayr.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '859', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(994, 10, 'Augustinum gemeinnützige GmbH', 'Stiftsbogen 74', '81375', 'München', '089-7098-0', '089-7098-199', 'Herr', 'Prof. Dr.', 'Markus', 'Rückert', 'info@augustinum.de', 'http://www.augustinum.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '171', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(995, 10, 'Balfour Beatty Rail GmbH', 'Garmischer Str. 35', '81373', 'München', '089-41999-0', '089-41999-270', 'Herr', 'Dr.', 'Norbert', 'Stadhouders', 'info.de@bbrail.com', 'http://www.bbrail.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '197', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(996, 10, 'Caverion Deutschland GmbH', 'Riesstr. 8', '80992', 'München', '089-374288-500', '089-374288-520', 'Herr', '', 'Albert', 'Vonnahme', 'info@yit.de', 'http://www.caverion.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '566', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(997, 10, 'CURANUM AG', 'Zirkus-Krone-Str. 10', '80335', 'München', '089-242065-0', '089-242065-10', 'Herr', '', 'Yann', 'Coléou', 'info@curanum.de', 'http://www.curanum.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '216', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(998, 10, 'DSI Holding GmbH', 'Destouchesstr. 68', '80769', 'München', '089-309050-200', '089-309050-252', 'Herr', '', 'Alan', 'Bate', 'info@dywidag-systems.com', 'http://www.dywidag-systems.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '518', 'Bayern', 'open', 1, 1, '2016-02-04 16:10:47'),
(999, 10, 'Flughafen München GmbH', 'Nordallee 25', '85356', 'München', '089-975-00', '089-975-57906', 'Herr', 'Dr.', 'Michael', 'Kerkloh', 'info@munich-airport.de', 'http://www.munich-airport.de/de/micro/eurotrade/index.jsp', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1000, 10, 'Franz Xaver Meiller Fahrzeug- und', 'Untermenzinger Str. 1', '80997', 'München', '089-1487-0', '089-1487-1355', 'Herr', 'Dr.-Ing.', 'Daniel', 'Böhmer', 'info@meiller.com', 'http://www.meiller.com/', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '258', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1001, 10, 'HAWE Hydraulik SE', 'Streitfeldstr. 25', '81673', 'München', '089-379100-0', '089-379100-91000', 'Herr', '', 'Karl', 'Haeusgen', 'info@hawe.de', 'http://www.hawe.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '310', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1002, 10, 'Heinrich Hugendubel GmbH & Co. KG', 'Hilblestr. 54', '80636', 'München', '089-30757575', '089-30757530', 'Herr', 'Dr.', 'Stefan', 'Höllermann', 'service@hugendubel.de', 'http://www.hugendubel.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '302', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1003, 10, 'HEV Heimwerkermarkt GmbH & Co. KG', 'Leopoldstr. 236', '80807', 'München', '089-457692-0', '089-457692-77', 'Herr', '', 'Eckart', 'Brandhoff', '', 'http://www.hev-gmbh.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '210', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1004, 10, 'Kraftanlagen München GmbH', 'Ridlerstr. 31c', '80339', 'München', '089-6237-0', '089-6237-223', 'Herr', '', 'Alexander', 'Gremm', 'muenchen@kraftanlagen.com', 'http://www.ka-muenchen.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '366', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1005, 10, 'MAHAG Automobilhandel und Service', 'Schleibingerstr. 12-16', '81669', 'München', '089-48001-0', '089-48001-500', 'Herr', 'Dr.', 'Volker', 'Borkowski', 'info@mahag.de', 'http://www.mahag.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '458', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1006, 10, 'MÜNCHENSTIFT GmbH', 'Severinstr. 4', '81541', 'München', '089-62020-300', '', 'Herr', '', 'Siegfried', 'Benker', 'info@muenchenstift.de', 'http://www.muenchenstift.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '94', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1007, 10, 'Paulaner Brauerei GmbH & Co KG', 'Hochstr. 75', '81541', 'München', '089-48005-0', '089-48005-409', 'Herr', '', 'Roland', 'Tobias', 'info@paulaner.de', 'http://www.paulaner.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '280', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1008, 10, 'Rodenstock GmbH', 'Elsenheimerstr. 33', '80687', 'München', '089-7202-0', '089-7202-629', 'Herr', '', 'Oliver', 'Kastalio', 'info@rodenstock.de', 'http://www.rodenstock.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '401', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1009, 10, 'SBK Siemens-Betriebskrankenkasse', 'Heimeranstr. 31', '80339', 'München', '0800-07257257250', '0800-07257257251', 'Herr', 'Dr.', 'Hans', 'Unterhuber', 'info@sbk.org', 'http://www.sbk.org/', 'Deutschland', 'Finanzen & Versicherung', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1010, 10, 'Schaltbau Holding AG', 'Hollerithstr. 5', '81829', 'München', '089-93005-0', '089-93005-350', 'Herr', 'Dr.', 'Jürgen', 'Cammann', 'schaltbau@schaltbau.de', 'http://www.schaltbau.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '390', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1011, 10, 'Serviceplan Gruppe für innovative', 'Brienner Str. 45a-d', '80333', 'München', '089-2050-20', '089-2050-2111', 'Herr', '', 'Florian', 'Haller', 'info@serviceplan.de', 'http://www.serviceplan.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '126', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1012, 10, 'Siltronic AG', 'Hanns-Seidel-Platz. 4', '81737', 'München', '089-8564-3000', '089-8564-3219', 'Herr', '', 'Christoph', 'von Plotho', 'info@siltronic.com', 'http://www.siltronic.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '743', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1013, 10, 'Silver Care Holding GmbH', 'Uhlandstr. 4', '80336', 'München', '089-59068580', '089-59068589', 'Herr', '', 'Marc', 'Hildebrand', 'info@silvercareholding.de', 'http://silvercareholding.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1014, 10, 'Sozialservice-Gesellschaft', 'Hofmannstr. 54', '81379', 'München', '089-613047-0', '089-613047-99', 'Herr', '', 'Christian', 'Pietig', 'info@ssg.brk.de', 'http://www.seniorenwohnen.brk.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '115', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1015, 10, 'TNS Infratest Shared Service', 'Landsberger Str. 284', '80687', 'München', '089-5600-0', '089-5600-1313', 'Herr', '', 'Harmut', 'Scheffler', 'tnsde@tns-infratest.com', 'http://www.tns-infratest.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '190', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1016, 10, 'Triumph International Aktiengesellschaft', 'Marsstr. 40', '80335', 'München', '089-5111-80', '089-5111-8427', 'Herr', '', 'Gerhard', 'Geuder', 'infoline@triumph-international.de', 'http://www.triumph-international.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '280', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1017, 10, 'Vinzenz Murr Vertriebs GmbH', 'Hofmannstr. 9', '81379', 'München', '089-78043-0', '089-78043-100', 'Frau', '', 'Evi', 'Brandl', 'info@vinzenzmurr.de', 'http://www.vinzenzmurr.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '195', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1018, 10, 'Brillux GmbH & Co. Kommanditgesellschaft', 'Weseler Str. 401', '48163', 'Münster', '0251-7188-0', '0251-7188-439', 'Herr', '', 'Peter', 'König', 'info@brillux.de', 'http://www.brillux.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '507', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1019, 10, 'L. Stroetmann Lebensmittel GmbH & Co. KG', 'Harkortstr. 30', '48163', 'Münster', '0251-7182-0', '0251-7182-130', 'Herr', '', 'Lutz', 'Stroetmann', 'eurocash@stroetmann.de', 'http://www.stroetmann.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '416', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1020, 10, 'Landesbetrieb Wald und Holz', 'Albrecht-Thaer-Str. 34', '48147', 'Münster', '0251-91797-0', '0251-91797-100', 'Herr', '', 'Andreas', 'Wiebe', 'info@wald-und-holz.nrw.de', 'http://www.wald-und-holz.nrw.de/', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1021, 10, 'TKD Kabel GmbH', 'An der Kleinbahn 16', '41334', 'Nettetal', '02157-8979-0', '02157-8979-89', 'Herr', 'Dr.', 'Wilhelm', 'Engst', 'nettetal@tkd-kabel.de', 'http://www.tkd-gruppe.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '185', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1022, 10, 'Höflinger Müller GmbH', 'Ludwig-Erhard-Str. 2', '85375', 'Neufahrn', '08165-79-0', '08165-4003', 'Frau', '', 'Eva', 'Müller', 'info@hm-gmbh.de', 'http://www.hm-gmbh.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '140', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1023, 10, 'Aluminium Norf GmbH', 'Koblenzer Str. 120', '41468', 'Neuss', '02131-937-0', '02131-937-8599', 'Herr', '', 'Thomas', 'Geupel', 'kontakt@alunorf.de', 'http://www.alunorf.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '381', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1024, 10, 'MM Kartonvertrieb GmbH', 'Düsseldorfer Str. 182-184', '41460', 'Neuss', '02131-2690-41511', '02131-2690-141511', 'Herr', 'Dr.', 'Wilhelm', 'Hörmanseder', 'sales.neuss@mm-karton.com', 'http://www.mm-karton.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '766', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1025, 10, 'F.X. Nachtmann Bleikristallwerke GmbH', 'Zacharias-Frank-Str. 7', '92660', 'Neustadt', '09602-30-0', '09602-30-1100', 'Herr', '', 'Alois', 'Kaufmann', 'info@nachtmann.com', 'http://www.nachtmann.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '47', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1026, 10, 'Gries Deco Company GmbH', 'Boschstr. 7a', '63843', 'Niedernberg', '06028-944-0', '06028-944-74099', 'Herr', '', 'Christian', 'Gries', 'info@g-d-c.eu', 'http://www.gries-deco-company.com/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '90', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1027, 10, 'Ensinger GmbH', 'Rudolf-Diesel-Str. 8', '71154', 'Nufringen', '07032-819-0', '07032-819-100', 'Herr', '', 'Klaus', 'Ensinger', 'info@ensinger-online.com', 'http://www.ensinger-online.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '350', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1028, 10, 'CCUniRent System GmbH', 'Thomas-Mann-Str. 16-20', '90471', 'Nürnberg', '0911-480499-0', '0911-480499-29', 'Herr', '', 'Jürgen', 'Lobach', 'info@ccunirent.com', 'http://www.ccunirent.com', 'Deutschland', 'Gastronomie & Touristik', 'C 1000-5000', '14', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1029, 10, 'DEHN + SÖHNE GmbH + Co.KG.', 'Rennweg 15', '90489', 'Nürnberg', '09181-906-0', '09181-906-100', 'Herr', 'Dr.', 'Philipp', 'Dehn', 'info@dehn.de', 'http://www.dehn.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1030, 10, 'Electrolux Hausgeräte GmbH', 'Fürther Str. 246', '90429', 'Nürnberg', '0911-323-0', '0911-323-1770', 'Herr', '', 'Josef', 'Klebl', 'info@electrolux.de', 'http://www.electrolux.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '867', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1031, 10, 'mister * lady GmbH', 'Sprottauer Str. 4-10', '90475', 'Nürnberg', '0911-98476-0', '0911-98476-304', 'Herr', '', 'Jürgen', 'Hanslbauer', 'info@mister-lady.com', 'http://www.mister-lady.com/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '129', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1032, 10, 'Rudolf Wöhrl Aktiengesellschaft', 'Lina-Ammon-Str. 10', '90471', 'Nürnberg', '0911-8121-0', '0911-8121-100', 'Herr', '', 'Olivier', 'Wöhrl', 'info@woehrl.de', 'http://www.woehrl.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '271', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1033, 10, 'SEMIKRON Elektronik GmbH & Co. KG', 'Sigmundstr. 200', '90431', 'Nürnberg', '0911-6559-0', '0911-6559-262', 'Herr', '', 'Harald', 'Jäger', 'sales.skd@semikron.com', 'http://www.semikron.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1034, 10, 'Staedtler Mars GmbH & Co. KG', 'Moosäckerstr. 3', '90427', 'Nürnberg', '0911-9365-0', '0911-9365-400', 'Herr', '', 'Axel', 'Marx', 'info@staedtler.de', 'http://www.staedtler.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '158', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1035, 10, 'TA Triumph-Adler GmbH', 'Südwestpark 23', '90449', 'Nürnberg', '0911-6898-0', '0911-6898-204', 'Herr', '', 'Masafumi', 'Yoda', '', 'http://www.ta-experts.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '291', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1036, 10, 'WIEGEL Verwaltung GmbH & Co KG', 'Hans-Bunte-Str. 25', '90431', 'Nürnberg', '0911-32420-200', '0911-32420-299', 'Herr', '', 'Harald', 'Füchtenbusch', 'info@wiegel.de', 'http://www.wiegel.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '160', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1037, 10, 'Ziehm Imaging GmbH', 'Donaustr. 31', '90451', 'Nürnberg', '0911-2172-0', '0911-2172-390', 'Herr', '', 'Klaus', 'Hörndler', 'info@ziehm-eu.com', 'http://www.ziehm-imaging.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '73', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1038, 10, 'Bilfinger Piping Technologies GmbH', 'Europaallee 1', '46047', 'Oberhausen', '0201-3645-0', '', 'Herr', '', 'Holger', 'Bennies', 'info.piping@bilfinger.com', 'http://www.piping.bilfinger.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '160', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1039, 10, 'KODI Diskontläden GmbH', 'Zum Eisenhammer 52', '46049', 'Oberhausen', '0208-85007-0', '0208-85007-112', 'Herr', '', 'Reinhold', 'Kuch', 'info@kodi.de', 'http://www.kodi.de', 'Deutschland', 'Drogerie & Haushalt', 'C 1000-5000', '115', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1040, 10, 'Leitz GmbH & Co.KG', 'Leitzstr. 2', '73447', 'Oberkochen', '07364-950-0', '07364-950-662', 'Herr', '', 'Michael', 'Voss', 'leitz@leitz.org', 'http://www.leitz.org', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '450', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1041, 10, 'Sumida AG', 'Dr.-Hans-Vogt-Platz 1', '94130', 'Obernzell', '08591-937-0', '08591-937-103', 'Herr', '', 'Paul', 'Hofbauer', 'contact@sumida-eu.com', 'http://www.sumida-eu.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1042, 10, 'Ehrmann AG Oberschönegg im Allgäu', 'Hauptstr. 19', '87770', 'Oberschönegg', '08333-301-0', '08333-301-310', 'Herr', '', 'Christian', 'Ehrmann', 'info@ehrmann.de', 'http://www.ehrmann.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '415', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1043, 10, 'Haver & Boecker OHG', 'Carl-Haver-Platz 3', '59302', 'Oelde', '02522-30-0', '02522-30-403', 'Herr', '', 'Florian', 'Festge', 'haver@haverboecker.com', 'http://www.haverboecker.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '373', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1044, 10, 'Gustoland GmbH', 'Industriestr. 8-14', '45739', 'Oer-Erkenschwick', '02368-61-300', '02368-61-237', 'Herr', '', 'Michael', 'Redding', 'info@gustoland.de', 'http://www.gustoland.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1045, 10, 'Oettinger Brauerei GmbH', 'Brauhausstr. 8', '86732', 'Oettingen', '09082-708-0', '09082-708-110', 'Herr', '', 'Michael', 'Mayer', 'mail@oettinger-bier.de', 'http://www.oettinger-bier.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '417', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1046, 10, 'BWF Offermann, Schmid & Co. KG', 'Bahnhofstr. 20', '89362', 'Offingen', '08224-71-0', '08224-71-2091', 'Herr', '', 'Stefan', 'Offermann', 'info@bwf-group.de', 'http://www.bwf-group.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1047, 10, 'Tyco Electronics Raychem GmbH', 'Finsinger Feld 1', '85521', 'Ottobrunn', '089-6089-0', '089-6096-345', 'Herr', '', 'Jörg', 'Mann', '', 'http://www.raychem.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '238', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1048, 10, 'Finke Das Erlebnis-Einrichten', 'Paderborner Str. 97', '33104', 'Paderborn', '05251-302-0', '05251-302-2840', 'Herr', '', 'Wilfried', 'Finke', 'info@moebel-finke.de', 'http://www.finke.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '126', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1049, 10, 'Buchbauer Handelsmärkte GmbH', 'Hennebergerstr. 4', '94036', 'Passau', '0851-88669-0', '0851-88669-66', 'Herr', '', 'Andreas', 'Kapfhammer', 'buchbauer@ihb-buchbauer.com', 'http://www.ihb-buchbauer.com/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1050, 10, 'HiPP GmbH & Co. Vertrieb KG', 'Georg-Hipp-Str. 7', '85276', 'Pfaffenhofen', '08441-757-0', '08441-757-654', 'Herr', 'Dr.', 'Claus', 'Hipp', 'information@hipp.de', 'http://www.hipp.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '383', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1051, 10, 'Prettl Produktions Holding GmbH', 'Sandwiesenstr. 6', '72793', 'Pfullingen', '07121-707-0', '07121-707-105', 'Herr', '', 'Erhardt', 'Prettl', 'info@prettl.com', 'http://www.prettl.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '800', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1052, 10, 'HAMMER System Management GmbH', 'Oehrkstr. 1', '32457', 'Porta Westfalica', '05731-765-0', '05731-765-150', 'Herr', 'Dr.', 'Ralf', 'Bartsch', 'info@hammer-heimtex.de', 'http://www.hammer-heimtex.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '370', 'Nordrhein-Westfalen', 'open', 1, 0, '2016-02-04 16:10:47'),
(1053, 10, 'SB-Möbel Boss', 'Bakenweg 16-20', '32457', 'Porta-Westfalica', '05731-609-600', '05731-609-588', 'Herr', '', 'Stefan', 'Kopmann', 'info@moebel-boss.de', 'http://www.moebel-boss.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '324', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1054, 10, 'Rheinland Kultur GmbH', 'Abtei Brauweiler', '50529', 'Pulheim', '02234-9921-0', '02234-9921-219', 'Herr', '', 'Sebastian', 'Emunds', 'info@rheinlandkultur.de', 'http://www.rheinlandkultur.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '24', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1055, 10, 'W.L.Gore & Associates GmbH', 'Hermann-Oberth-Str. 22', '85640', 'Putzbrunn', '0806380-10', '0806380-1850', 'Herr', '', 'Oskar', 'Berger', 'servicefabrics_de@wlgore.com', 'http://www.gore-tex.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '558', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1056, 10, 'KOLBUS GmbH & Co. KG', 'Osnabrücker Str. 77', '32369', 'Rahden', '05771-71-0', '05771-71-333', 'Herr', '', 'Kai', 'Büntemeyer', 'info@kolbus.de', 'http://www.kolbus.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '164', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1057, 10, 'Dehner GmbH & Co. KG', 'Donauwörther Str. 3-5', '86641', 'Rain am Lech', '09090-77-0', '09090-77-7770', 'Herr', '', 'Georg', 'Weber', 'info@dehner.de', 'http://www.dehner.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1058, 10, 'Prosegur GmbH', 'Kokkolastr. 5', '40882', 'Ratingen', '02102-1248-0', '0211-17165-166', 'Herr', '', 'Lucas', 'Sánchez Borgnis-Desbordes', 'welcome@prosegur.com', 'http://www.prosegur.de/', 'Deutschland', 'Immobilien & Gebäudeservice', 'C 1000-5000', '146', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1059, 10, 'Zapp AG', 'Zapp-Platz 1', '40880', 'Ratingen', '02102-710-0', '02102-710-200', 'Herr', 'Dr.', 'Heiner', 'Schunk', 'info@zapp.com', 'http://www.zapp.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '339', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1060, 10, 'Runners Point', 'Tiroler Str. 26', '45659', 'Recklinghausen', '02361-3003-0', '02361-3003-105', 'Herr', '', 'Sebastian', 'Janus', 'info@runnerspoint.de', 'http://www.runnerspoint.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '159', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1061, 10, 'Novoferm GmbH', 'Isselburger Str. 31', '46459', 'Rees', '02850-910-0', '02850-910-646', 'Herr', '', 'Rainer', 'Schackmann', 'info@novoferm.com', 'http://www.novoferm.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '239', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1062, 10, 'Bayerische Staatsforsten', 'Tillystr. 2', '93053', 'Regensburg', '0941-6909-0', '0941-6909-495', 'Herr', 'Dr.', 'Rudolf', 'Freidhager', 'info@baysf.de', 'http://www.baysf.de/de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '341', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1063, 10, 'Maschinenfabrik Reinhausen GmbH', 'Falkensteinstr. 8', '93059', 'Regensburg', '0941-4090-0', '', 'Herr', 'Dr.', 'Nicolas', 'Maier-Scheubeck', 'info@reinhausen.com', 'http://www.reinhausen.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1064, 10, 'Regensburger Druckgußwerk Wolf GmbH', 'Prüfeninger Schloss Str. 7', '93051', 'Regensburg', '0941-39649-0', '0941-39649-30', 'Herr', '', 'Wilhelm', 'Rambold', 'info@rdw-wolf.de', 'http://www.firmengruppe-wolf.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '91', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1065, 10, 'BEST CARWASH Dienstleistungs-GmbH', 'Neuenkamper Str. 3-9', '42855', 'Remscheid', '02191-3705-0', '02191-3705-57', 'Herr', '', 'Michael', 'Dattner', 'info@bestcarwash.de', 'http://www.bestcarwash.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1066, 10, 'GEDORE Tool Center GmbH & Co. KG', 'Remscheider Str. 149', '42899', 'Remscheid', '02191-596-900', '02191-596-999', 'Frau', '', 'Karen', 'Dowidat', 'zentrale@gedore.de', 'http://www.gedore.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1067, 10, 'Oerlikon Textile GmbH & Co. KG', 'Leverkuser Str. 65', '42897', 'Remscheid', '02191-67-0', '', 'Herr', '', 'Claus-Ulrich', 'Mai', 'info.textile@oerlikon.com', 'http://www.oerlikontextile.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '918', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1068, 10, 'RM Buch und Medien Vertrieb GmbH', 'Ringstr. 16-20', '33378', 'Rheda-Wiedenbrück', '0180-5415233', '0180-5415700', 'Herr', 'Dr.', 'Christoph', 'Mittendorf', 'service@derclub.de', 'http://www.derclub.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1069, 10, 'Westag & Getalit AG', 'Hellweg 15', '33378', 'Rheda-Wiedenbrück', '05242-17-0', '05242-17-75000', 'Herr', '', 'Bernhard', 'Wenninger', 'pr@westag-getalit.de', 'http://www.westag-getalit.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '224', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1070, 10, 'apetito Aktiengesellschaft', 'Bonifatiusstr. 305', '48432', 'Rheine', '05971-799-0', '05971-799-9350', 'Herr', '', 'Jörg', 'Baumgart', 'info@apetito.de', 'http://www.apetito.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '749', 'Nordrhein-Westfalen', 'open', 2, 0, '2016-02-04 16:10:47'),
(1071, 10, 'Senger Holding GmbH', 'Oldenburger Str. 1-11', '48429', 'Rheine', '05971-7913-0', '05971-7913-4109', 'Herr', '', 'Andreas', 'Senger', 'info@auto-senger.de', 'http://www.auto-senger.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '368', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1072, 10, 'Lüning Handels-GmbH & Co. KG', 'Westerwieher Str. 33', '33397', 'Rietberg', '05244-705-0', '05244-705-145', 'Herr', '', 'Wolfgang', 'Rieländer', 'info@luening.de', 'http://www.luening.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '325', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1073, 10, 'Hubert Stüken GmbH & Co. KG', 'Alte Todenmanner Str. 42', '31737', 'Rinteln', '05751-702-0', '05751-702-188', 'Herr', 'Dr.', 'Hubert', 'Schmidt', 'info@stueken.de', 'http://www.stueken.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '0', 'Niedersachsen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1074, 10, 'Mühlbauer Aktiengesellschaft', 'Josef-Mühlbauer-Platz 1', '93426', 'Roding', '09461-952-0', '09461-952-1101', 'Herr', '', 'Hubert', 'Forster', 'info@muehlbauer.de', 'http://www.muehlbauer.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '213', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1075, 10, 'KARL BACHL GmbH & Co KG', 'Deching 3', '94133', 'Röhrnbach', '08582-18-0', '08582-18-118', 'Herr', '', 'Karl', 'Bachl', 'deching@bachl.de', 'http://www.bachl.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '198', 'Bayern', 'open', 5, 0, '2016-02-04 16:10:47'),
(1076, 10, 'Huhtamaki Flexible Packaging Germany', 'Heinrich-Nicolaus-Str. 6', '87671', 'Ronsberg', '0831-785491', '0831-785250', 'Herr', '', 'Michael', 'Feiler', 'info.ronsberg@de.huhtamaki.com', 'http://www.huhtamaki.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1077, 10, 'J. Rettenmaier & Söhne GmbH + Co KG', 'Holzmühle Rosenberg', '73494', 'Rosenberg', '07967-152-0', '07967-152-222', 'Herr', '', 'Josef', 'Rettenmaier', 'info@jrs.de', 'http://www.jrs.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1078, 10, 'EMAG Holding GmbH', 'Austr. 24', '73084', 'Salach', '07162-17-0', '07162-17-199', 'Herr', '', 'Norbert', 'Heßbrüggen', 'communications@emag.com', 'http://www.emag.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '466', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1079, 10, 'Minipreis - Läden GmbH', 'Eichfeld 3', '33154', 'Salzkotten', '05258-504-0', '05258-504-149', 'Herr', '', 'Jürgen', 'Schroers', 'info@minipreis.de', 'http://www.minipreis.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '160', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1080, 10, 'Westfälische Fleischwarenfabrik', 'Stockmeyer-Str. 1', '48336', 'Sassenberg', '05426-82-0', '05426-82-222', 'Herr', '', 'Hans-Jürgen', 'Meschkat', 'info@stockmeyer.de', 'http://www.heristo.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '249', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1081, 10, 'AMT Alumetall Gießtechnik GmbH', 'Glörstr. 20-22', '58579', 'Schalksmühle', '02355-508313', '02355-509777', 'Herr', '', 'Harald', 'Möhl', 'info@gastroguss.de', 'http://www.gastroguss.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1082, 10, 'HOERBIGER Kompressortechnik GmbH', 'Im Forchet 5', '86956', 'Schongau', '08861-210-0', '08861-210-3278', 'Herr', '', 'Johannes', 'Hunschofsky', 'info-hks@hoerbiger.com', 'http://www.hoerbiger.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '950', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1083, 10, 'MBDA Deutschland GmbH', 'Hagenauer Forst 27', '86526', 'Schrobenhausen', '08252-99-0', '08252-99-6120', 'Herr', '', 'Thomas', 'Homberg', '', 'http://www.mbda-systems.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '303', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1084, 10, 'Apollo-Optik Holding GmbH & Co. KG', 'Wallenrodstr. 3', '91126', 'Schwabach', '09122-831-0', '', 'Herr', 'Dr.', 'Jörg', 'Ehmer', 'service@apollo-optik.com', 'http://www.apollo.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '355', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1085, 10, 'Kamps Management GmbH', 'Auf dem Mutzer 11', '41366', 'Schwalmtal', '02163-947-700', '02163-947-70137708', 'Herr', '', 'Jaap', 'Schalken', 'kundenservice@kamps.de', 'http://www.kamps.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '300', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1086, 10, 'MEILLERGHP GmbH', 'Gutenbergstr. 1-5', '92421', 'Schwandorf', '09431-620-194', '09431-620-540', 'Herr', '', 'Holger', 'Schneider', 'dialog@meillerghp.com', 'http://www.meillerghp.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '148', 'Bayern', 'open', 4, 0, '2016-02-04 16:10:47'),
(1087, 10, 'Wolf Wurstspezialitäten GmbH', 'Am Ahornhof 2', '92421', 'Schwandorf', '09431-384-0', '09431-384-225', 'Herr', '', 'Christian', 'Wolf', 'vertrieb@wolf-wurst.de', 'http://www.wolf-wurst.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '267', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1088, 10, 'Blumen-Risse GmbH & Co.', 'Im Ostfeld 5', '58239', 'Schwerte', '02304-965-0', '02304-965-300', 'Frau', '', 'Tina', 'Risse-Stock', 'info@blumenrisse.de', 'http://www.blumenrisse.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '129', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1089, 10, 'BHS tabletop Aktiengesellschaft', 'Ludwigsmühle 1', '95100', 'Selb', '09287-73-0', '09287-73-1114', 'Herr', '', 'Christian', 'Strootmann', 'kontakt@bhs-tabletop.de', 'http://www.bhs-tabletop.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '82', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47');
INSERT INTO `customer` (`id`, `project_id`, `company`, `street`, `zip_code`, `city`, `phone`, `fax`, `salutation`, `title`, `first_name`, `last_name`, `email`, `url`, `country`, `state`, `category_wzw`, `class`, `sales`, `status`, `calls`, `resubmission`, `create_date`) VALUES
(1090, 10, 'Möbel Inhofer GmbH & Co. KG', 'Ulmer Str. 50', '89250', 'Senden', '07307-85-0', '07307-85-8200', 'Herr', '', 'August', 'Inhofer', 'info@moebel-inhofer.de', 'http://www.inhofer.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '200', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1091, 10, 'VEKA AG', 'Dieselstr. 8', '48324', 'Sendenhorst', '02526-29-0', '02526-29-3710', 'Herr', '', 'Andreas', 'Hartleif', 'info@veka.com', 'http://www.veka.com', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '736', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1092, 10, 'Brückner Group GmbH', 'Königsberger Str. 5-7', '83313', 'Siegsdorf', '08662-63-0', '08662-63-9350', 'Herr', '', 'Maximilian', 'Schneider', 'brueckner.group@brueckner.com', 'http://www.brueckner.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '700', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1093, 10, 'Bitzer SE', 'Eschenbrünnlestr. 15', '71065', 'Sindelfingen', '07031-932-0', '07031-932-147', 'Herr', '', 'Peter', 'Schaufler', 'mail@bitzer.de', 'http://www.bitzer.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '632', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1094, 10, 'Paul Wilhelm von Keppler-Stiftung', 'Warmbronner Str. 22', '71063', 'Sindelfingen', '07031-63301-0', '07031-63301-111', 'Herr', 'Dr.', 'Alfons', 'Maurer', 'geschaeftsstelle@keppler-stiftung.de', 'http://www.keppler-stiftung.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1095, 10, 'Röhm GmbH', 'Heinrich-Röhm-Str. 50', '89567', 'Sontheim an der Brenz', '07325-16-0', '07325-16-492', 'Herr', 'Dr.', 'Michael', 'Fried', 'info@roehm.biz', 'http://www.roehm.biz/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1096, 10, 'hülsta-werke Hüls GmbH & Co KG', 'Karl-Hüls-Str. 1', '48703', 'Stadtlohn', '02563-86-0', '02563-86-1417', 'Herr', '', 'Oliver', 'Bialowons', 'info@huelsta.de', 'http://www.huelsta.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '254', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1097, 10, 'Aenova Holding GmbH', 'Berger Str. 8-10', '82319', 'Starnberg', '08683-895-0', '08683-895-100', 'Herr', '', 'Karl-Heinrich', 'Hoppmann', 'info@aenova-group.com', 'http://www.aenova.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '260', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1098, 10, 'More & More AG', 'Schorn 1', '82319', 'Starnberg', '089-55270550', '089-14367152-600', 'Herr', '', 'Karl-Heinz', 'Mohr', 'service@more-and-more.com', 'http://www.more-and-more.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '45', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1099, 10, 'Hamberger Flooring GmbH & Co. KG', 'Rohrdorfer Str. 133', '83071', 'Stephanskirchen', '08031-700-714', '08031-700-299', 'Herr', '', 'Peter', 'Hamberger', 'info@haro.de', 'http://www.haro.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '270', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1100, 10, 'Marc O´Polo Einzelhandels GmbH', 'Hofgartenstr. 1', '83071', 'Stephanskirchen', '08036-90-0', '08036-90-1890', 'Herr', '', 'Alexander', 'Gedat', 'Zentrale@marc-o-polo.de', 'http://www.marc-o-polo.de', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '452', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1101, 10, 'DALLI-WERKE GmbH & Co. KG', 'Zweifaller Str. 120', '52220', 'Stolberg', '02402-89-00', '02402-89-2222', 'Herr', 'Dr.', 'Hermann', 'Wirtz', 'kontakt@dalli-group.com', 'http://www.dalli-group.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '852', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1102, 10, 'MEGA Das Fach-Zentrum für die', 'Schlachthofstr. 6', '70188', 'Stuttgart', '0711-1684-0', '0711-1684-125', 'Herr', '', 'Marc', 'Klaiber', 'info@mega-stuttgart.de', 'http://www.mega-stuttgart.de/', 'Deutschland', 'Grosshandel', 'E 200-499', '80', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1103, 10, 'Brita GmbH', 'Heinrich-Hertz-Str. 4', '65232', 'Taunusstein', '06128-746-0', '06128-746-355', 'Herr', '', 'Markus', 'Hankammer', 'info@brita.net', 'http://www.brita.net', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '208', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1104, 10, 'Winkhaus Holding', 'August-Winkhaus-Str. 31', '48291', 'Telgte', '02504-921-0', '02504-921-340', 'Frau', '', 'Sofie', 'Winkhaus', 'info@winkhaus.de', 'http://www.winkhaus.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '283', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1105, 10, 'Heinz Holding GmbH', 'Glashüttenplatz 1-7', '96355', 'Tettau', '09269-77-0', '09269-77-333', 'Herr', '', 'Carl-August', 'Heinz', 'sales@heinz-glas.com', 'http://www.heinz-glas.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '250', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1106, 10, 'dennree GmbH', 'Hofer Str. 11', '95183', 'Töpen', '09295-18-0', '09295-18-101', 'Herr', '', 'Thomas', 'Greim', 'zentrale@dennree.de', 'http://www.dennree.de/', 'Deutschland', 'Grosshandel', 'C 1000-5000', '420', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1107, 10, 'denn''s Biomarkt GmbH', 'Hofer Str. 11', '95183', 'Töpen', '09295-18-500', '09295-9141-500', 'Herr', '', 'Thomas', 'Greim', 'info@denns.de', 'http://www.denns-biomarkt.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '102', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1108, 10, 'DR. JOHANNES HEIDENHAIN GmbH', 'Dr.-Johannes-Heidenhain-Str. 5', '83301', 'Traunreut', '08669-31-0', '08669-38609', 'Herr', '', 'Thomas', 'Sesselmann', 'info@heidenhain.de', 'http://www.heidenhain.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '622', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1109, 10, 'Siteco Beleuchtungstechnik GmbH', 'Georg-Simon-Ohm-Str. 50', '83301', 'Traunreut', '08669-33-0', '08669-33-397', 'Herr', '', 'Christophe', 'Poméon', 'info@siteco.de', 'http://www.siteco.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '220', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1110, 10, 'AlzChem AG', 'Dr.-Albert-Frank-Str. 32', '83308', 'Trostberg', '08621-86-0', '08621-86-2020', 'Herr', '', 'Ulli', 'Seibel', 'info@alzchem.com', 'http://www.alzchem.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '245', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1111, 10, 'Eder GmbH', 'Moorweg 5', '83104', 'Tuntenhausen', '08067-181-0', '08067-181-788', 'Herr', '', 'Peter', 'Eder', 'info@eder-gmbh.de', 'http://www.eder-gmbh.de', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '400', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1112, 10, 'HATLAPA Uetersener Maschinenfabrik', 'Tornescher Weg 5-7', '25436', 'Uetersen', '04122-711-0', '04122-711-104', 'Herr', 'Dr.', 'Alexander', 'Nürnberg', 'info@hatlapa.de', 'http://www.hatlapa.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '120', 'Schleswig-Holstein', 'new', 0, 0, '2016-02-04 16:10:47'),
(1113, 10, 'ratiopharm GmbH', 'Graf-Arco-Str. 3', '89079', 'Ulm', '0731-402-02', '0731-402-7832', 'Herr', 'Dr.', 'Markus Leyck', 'Dieken', 'info@ratiopharm.de', 'http://www.ratiopharm.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '636', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1114, 10, 'SCHWENK Zement KG', 'Hindenburgring 15', '89077', 'Ulm', '0731-9341-0', '0731-9341-416', 'Herr', '', 'Eduard', 'Schleicher', 'info@schwenk-servicecenter.de', 'http://www.schwenk.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '794', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1115, 10, 'TEVA GmbH', 'Graf-Arco-Str. 3', '89079', 'Ulm', '0731-402-02', '0731-402-7832', 'Herr', 'Dr.', 'Christian Horst', 'Holzmann', 'info.teva-deutschland@teva.de', 'http://www.teva-deutschland.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '81', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1116, 10, 'Woolworth GmbH', 'Formerstr. 6', '59425', 'Unna', '02303-5938-100', '', 'Herr', '', 'Thomas', 'Leege', 'info@woolworth.de', 'http://www.woolworth.de', 'Deutschland', 'Drogerie & Haushalt', 'C 1000-5000', '798', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1117, 10, 'Zurbrüggen Wohn-Zentrum GmbH', 'Hans-Böckler-Str. 4', '59423', 'Unna', '02303-208-0', '', 'Herr', '', 'Christian', 'Zurbrüggen', 'service@zurbrueggen.de', 'http://www.zurbrueggen.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '280', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1118, 10, 'Develey Senf & Feinkost GmbH', 'Ottobrunner Str. 45', '82008', 'Unterhaching', '089-61102-0', '089-61102-127', 'Herr', '', 'Michael', 'Durach', 'develey-kontakt@develey.de', 'http://www.develey.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '386', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1119, 10, 'KWA Kuratorium', 'Biberger Str. 50', '82008', 'Unterhaching', '089-66558-500', '089-66558-538', 'Herr', '', 'Horst', 'Schmieder', 'kwainfo@kwa.de', 'http://www.kwa.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '108', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1120, 10, 'Vossloh-Schwabe Deutschland GmbH', 'Wasenstr. 25', '73660', 'Urbach', '02351-101-0', '02351-101-217', 'Herr', '', 'Klaus', 'Breisch', 'info.vsv@vsv.vossloh-schwabe.com', 'http://www.vossloh-schwabe.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1121, 10, 'Schmidt, Kranz & Co. GmbH', 'Hauptstr. 123', '42555', 'Velbert', '02052-888-0', '02052-888-10', 'Herr', 'Dr.', 'Hans-Caspar', 'Glinz', 'info@sk-velbert.de', 'http://www.schmidt-kranz.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '312', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1122, 10, 'nobilia-Werke', 'Waldstr. 53-57', '33415', 'Verl', '05246-508-0', '05246-508-96999', 'Herr', 'Dr.', 'Oliver', 'Streit', 'info@nobilia.de', 'http://www.nobilia.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '707', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1123, 10, 'H. & E. Reinert Westfälische', 'Mittel-Loxten 37', '33775', 'Versmold', '05423-966-0', '05423-966-130', 'Herr', '', 'Hans-Ewald', 'Reinert', 'reinert@reinert.de', 'http://www.reinert.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '350', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1124, 10, 'Heinrich Nölke GmbH & Co. KG', 'Ziegeleistr. 5', '33775', 'Versmold', '05423-969-0', '05423-969-267', 'Herr', '', 'Axel', 'Knau', 'info@noelke.de', 'http://www.noelke.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '231', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1125, 10, 'Linhardt GmbH & Co KG', 'Dr.-Winterling-Str. 40', '94234', 'Viechtach', '09942-951-0', '09942-3424', 'Frau', 'Dr.', 'Monika', 'Kopra-Schäfer', 'info@linhardt.com', 'http://www.linhardt.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '77', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1126, 10, 'Herbert Kannegiesser GmbH', 'Kannegiesserring 7-8', '32602', 'Vlotho', '05733-12-0', '05733-12-8204', 'Herr', '', 'Martin', 'Kannegiesser', 'info@kannegiesser.de', 'http://www.kannegiesser.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '174', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1127, 10, 'Saueressig GmbH + Co.', 'Gutenbergstr. 1-3', '48961', 'Vreden', '02564-12-0', '02564-12-420', 'Herr', 'Dr.', 'Tomas', 'Sterkenburgh', 'mail@saueressig.de', 'http://www.saueressig.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1128, 10, 'Alfred Ritter GmbH & Co. KG', 'Alfred-Ritter-Str. 25', '71111', 'Waldenbuch', '07157-97-0', '07157-97-399', 'Herr', '', 'Jürgen', 'Herrmann', 'info@ritter-sport.de', 'http://www.ritter-sport.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '359', 'Baden-Württemberg', 'new', 0, 0, '2016-02-04 16:10:47'),
(1129, 10, 'Mecklenburger Metallguß GmbH', 'Teterower Str. 1', '17192', 'Waren (Müritz)', '03991-736-0', '03991-736-210', 'Herr', '', 'Manfred', 'Urban', 'sales@mmgprop.de', 'http://www.mmgprop.de/', 'Deutschland', 'Maschinenbau', 'F 100-200', '0', 'Mecklenburg-Vorpommern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1130, 10, 'Warsteiner Brauerei Haus Cramer KG', 'Domring 4-10', '59581', 'Warstein', '02902-88-0', '02902-88-1299', 'Frau', '', 'Catharina', 'Cramer', 'info@warsteiner.com', 'http://www.warsteiner-gruppe.de/', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '519', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1131, 10, 'Porzellanfabriken', 'Christian-Seltmann-Str. 59-67', '92637', 'Weiden', '0961-204-0', '0961-204-116', 'Herr', '', 'Christian R. W.', 'Seltmann', 'service@seltmann.com', 'http://www.seltmann-weiden.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '46', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1132, 10, 'K&L Ruppert Stiftung & Co. Handels-KG', 'Paradeisstr. 67', '82362', 'Weilheim', '0881-180-0', '0881-180-221', 'Frau', '', 'Susanne', 'Ruppert', 'info@kl-ruppert.de', 'http://www.kl-ruppert.com', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '217', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1133, 10, 'ZARGES GmbH', 'Zargesstr. 7', '82362', 'Weilheim', '0881-687-100', '0881-687-500', 'Herr', '', 'Dieter', 'Reis', 'zarges@zarges.de', 'http://www.zarges.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '244', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1134, 10, 'Gutmann AG', 'Nürnberger Str. 57-81', '91781', 'Weißenburg', '09141-992-0', '09141-992-212', 'Herr', '', 'Theodoros', 'Tzortzis', 'gutmann@gutmann.de', 'http://www.gutmann.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '138', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1135, 10, 'LUKAD HOLDING GmbH & Co. KG', 'Plettenberger Str. 12 b', '58791', 'Werdohl', '02392-916-550', '02392-916-559', 'Herr', '', 'Knut', 'Menshen', 'menshen@menshen.de', 'http://www.lukad.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '230', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1136, 10, 'BYK-Chemie GmbH', 'Abelstr. 45', '46483', 'Wesel', '0281-670-0', '0281-657-35', 'Herr', 'Dr.', 'Christoph', 'Schlünken', 'info@byk.com', 'http://www.byk.com/', 'Deutschland', 'Chemieindustrie', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1137, 10, 'ELANTAS GmbH', 'Abelstr. 43', '46483', 'Wesel', '0281-670-8', '0281-670-10999', 'Herr', 'Dr.', 'Guido', 'Forstbach', 'info.ELANTAS@altana.com', 'http://www.elantas.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '391', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1138, 10, 'Hexagon Metrology GmbH', 'Siegmund-Hiepe-Str. 2-12', '35578', 'Wetzlar', '06441-207-0', '06441-207-122', 'Herr', '', 'Holger', 'Fritze', 'contact.de@hexagonmetrology.com', 'http://www.hexagonmetrology.com', 'Deutschland', 'Maschinenbau', 'E 200-499', '75', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1139, 10, 'Satisloh GmbH', 'Wilhelm-Loh-Str. 2-4', '35578', 'Wetzlar', '06441-912-0', '06441-912-130', 'Herr', '', 'Bruno', 'Fischer', 'info@satisloh.com', 'http://www.satisloh.com/', 'Deutschland', 'Maschinenbau', 'F 100-200', '97', 'Hessen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1140, 10, 'Wittur Holding GmbH', 'Rohrbachstr. 26-30', '85259', 'Wiedenzhausen', '08134-18-0', '08134-1849', 'Herr', 'Dr.', 'Walter', 'Rohregger', 'info@wittur.com', 'http://www.wittur.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '339', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1141, 10, 'Rettenmeier Holding AG', 'Industriestr. 1', '91634', 'Wilburgstetten', '09853-338-0', '09853-338-100', 'Herr', '', 'Dietmar', 'Breithaupt', 'info@rettenmeier.com', 'http://www.rettenmeier.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '314', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1142, 10, 'Einrichtungshaus Ostermann GmbH & Co. KG', 'Fredi-Ostermann-Str. 1-3', '58454', 'Witten', '02302-985-0', '02302-985-1814', 'Herr', '', 'Rolf', 'Ostermann', 'kontakt@ostermann.de', 'http://www.ostermann.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '300', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:47'),
(1143, 10, 'EagleBurgmann Germany GmbH & Co. KG', 'Äußere Sauerlacher Str. 6-10', '82515', 'Wolfratshausen', '08171-23-0', '08171-23-1214', 'Herr', 'Dr.', 'Stefan', 'Sacré', 'info@de.eagleburgmann.com', 'http://www.eagleburgmann.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '679', 'Bayern', 'new', 0, 0, '2016-02-04 16:10:47'),
(1144, 10, 'Schuhhaus Klauser GmbH & Co. KG', 'Wasserstr. 29', '42283', 'Wuppertal', '0202-55119-0', '0202-593556', 'Herr', '', 'Peter', 'Prange', 'info@klauser-schuhe.de', 'http://www.klauser-schuhe.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '113', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:48'),
(1145, 10, 'Konditorei Brüder Oebel GmbH', 'Fronhofstr. 30', '52146', 'Würselen', '0221-9878431', '0221-987872', 'Herr', '', 'Lothar', 'Mainz', 'shop@oebel.de', 'http://www.oebel.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:48'),
(1146, 10, 'Kronenbrot KG Franz Mainz', 'Fronhofstr. 30', '52146', 'Würselen', '02405-484-0', '02405-484-117', 'Herr', '', 'Lothar', 'Mainz', 'info@kronenbrot.de', 'http://www.kronenbrot.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-02-04 16:10:48'),
(1147, 15, 'Chocoladenfabriken', 'Süsterfeldstr. 130', '52072', 'Aachen', '0241-8881-0', '0241-8889-313', 'Herr', 'Dr.', 'Adalbert', 'Lechner', '', 'http://www.lindt.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '434', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1148, 15, 'Schumag AG', 'Nerscheider Weg 170', '52076', 'Aachen', '02408-12-0', '02408-12-256', 'Herr', 'Dr.', 'Johannes', 'Ohlinger', 'info@schumag.de', 'http://www.schumag.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '56', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1149, 15, 'ZENTIS GmbH & Co. KG', 'Jülicher Str. 177', '52070', 'Aachen', '0241-4760-0', '0241-4760-369', 'Herr', '', 'Karl-Heinz', 'Johnen', 'info@zentis.de', 'http://www.zentis.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '643', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1150, 15, 'MAPAL Fabrik für Präzisionswerkzeuge', 'Obere Bahnstr. 13', '73431', 'Aalen', '07361-585-0', '07361-585-150', 'Herr', 'Dr.', 'Dieter', 'Kress', 'info@de.mapal.com', 'http://www.mapal.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '310', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1151, 15, 'Maschinenfabrik ALFING Kessler GmbH', 'Auguste-Kessler-Str. 20', '73433', 'Aalen', '07361-501-0', '07361-501-1970', 'Herr', '', 'Eberhard', 'Funk', 'info@mafa.alfing.de', 'http://www.alfing.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '230', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1152, 15, 'SHW Casting Technologies GmbH', 'Stiewingstr. 101', '73433', 'Aalen', '07361-3702-396', '07361-3702-487', 'Herr', '', 'Ulrich', 'Severing', '', 'http://www.shw-ct.eu', 'Deutschland', 'Bauindustrie & Stahl', 'E 200-499', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1153, 15, 'Norgren GmbH', 'Bruckstr. 93', '46519', 'Alpen', '02802-49-0', '02802-49-356', 'Herr', '', 'Peter', 'Varwijk', '', 'http://www.norgren.com/de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '330', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1154, 15, 'Cinram GmbH', 'Max-Planck-Str. 1-9', '52477', 'Alsdorf', '02404-58-444', '02404-58-111', 'Herr', '', 'Dieter', 'Lubberich', 'info-de@cinram.com', 'http://www.cinram.de/de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '250', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1155, 15, 'Medical Park AG', 'Freiberger-Platz 1', '83123', 'Amerang', '08075-91311-0', '08075-91311-116', 'Herr', 'Dr.', 'Ulrich Richard', 'Mauerer', 'info@medicalpark.de', 'http://www.medicalpark.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '112', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1156, 15, 'OECHSLER AG', 'Matthias-Oechsler-Str. 9', '91522', 'Ansbach', '0981-1807-0', '0981-1807-222', 'Herr', 'Dr.', 'Claudius M.', 'Kozlik', 'info@oechsler.com', 'http://www.oechsler.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '233', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1157, 15, '"Thüfleiwa" Thüringer Fleischwaren,', 'Buttstädter Str. 26', '99510', 'Apolda', '03644-5189-0', '03644-5189-37', 'Herr', '', 'Thomas', 'Kämmerer', 'apolda@thuefleiwa.de', 'http://www.thuefleiwa.de/', 'Deutschland', 'Lebensmittelhandel', 'F 100-200', '0', 'Thüringen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1158, 15, 'frischBack GmbH Arnstadt', 'Mühlweg 3', '99310', 'Arnstadt', '03628-7411-0', '03628-7411-15', 'Herr', '', 'Alfred', 'Heyl', 'info@frischback.de', 'http://www.frischback.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '30', 'Thüringen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1159, 15, 'Knürr Electronics GmbH', 'Mariakirchener Str. 38', '94424', 'Arnstorf', '08723-27-0', '08723-27-154', 'Herr', '', 'Daniel', 'Graf', 'info@knuerr.com', 'http://www.emersonnetworkpower.com/en-EMEA/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '81', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1160, 15, 'ADO Goldkante GmbH & Co. KG', 'Hüntestr. 68', '26821', 'Aschendorf', '04962-505-0', '04962-505-250', 'Herr', '', 'Andreas', 'Zimmer', 'info?@?ado-goldkante.de', 'http://www.ado-goldkante.de/', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '129', 'Niedersachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1161, 15, 'Pfeiffer Vacuum GmbH', 'Berliner Str. 43', '35614', 'Aßlar', '06441-802-0', '06441-802-1202', 'Herr', '', 'Manfred', 'Bender', 'info@pfeiffer-vacuum.de', 'http://www.pfeiffer-vacuum.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '221', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1162, 15, 'Labor Schottdorf MVZ GmbH', 'August-Wessels-Str. 5', '86154', 'Augsburg', '0821-4201-0', '0821-417992', 'Frau', '', 'Gabriele', 'Schottdorf', 'labor@schottdorf.de', 'http://www.schottdorf.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1163, 15, 'manroland web systems GmbH', 'Alois-Senefelder-Allee 1', '86153', 'Augsburg', '0821-424-0', '0821-424-3303', 'Herr', '', 'Jörn', 'Gossé', 'info@manroland-web.com', 'http://www.manroland-web.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1164, 15, 'RENK Aktiengesellschaft', 'Gögginger Str. 73', '86159', 'Augsburg', '0821-5700-681', '0821-5700-552', 'Herr', '', 'Florian', 'Hofbauer', '', 'http://www.renk.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '148', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1165, 15, 'Schuhhof GmbH', 'Kobelweg 82', '86156', 'Augsburg', '0821-2408-0', '0821-2408-284', 'Herr', '', 'Frank', 'Pohl', 'info@schuhhof-gmbh.de', 'http://www.schuhhof.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1166, 15, 'UPM GmbH', 'Georg-Haindl-Str. 4', '86153', 'Augsburg', '0821-3109-0', '0821-3109-156', 'Herr', 'Dr.', 'Bernd', 'Eikens', 'germany.communications@upm-kymmene.com', 'http://www.upm-kymmene.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '893', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1167, 15, 'WashTec AG', 'Argonstr. 7', '86153', 'Augsburg', '0821-5584-0', '0821-5584-1410', 'Frau', '', 'Karoline', 'Kalb', 'washtec@washtec.de', 'http://www.washtec.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '302', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1168, 15, 'Johannesbad Holding AG & Co. KG', 'Johannesstr. 2', '94072', 'Bad Füssing', '08531-232102', '08531-232732', 'Herr', 'Dr.', 'York', 'Dhein', 'info@johannesbad.de', 'http://www.johannesbad.com/', 'Deutschland', 'Kommunales', 'C 1000-5000', '82', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1169, 15, 'Jos. Schneider Optische Werke GmbH', 'Ringstr. 132', '55543', 'Bad Kreuznach', '0671-601-0', '0671-601-109', 'Herr', 'Dr.', 'Josef', 'Staub', 'sales@schneiderkreuznach.com', 'http://www.schneiderkreuznach.com/', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '82', 'Rheinland-Pfalz', 'new', 0, 0, '2016-05-24 08:17:19'),
(1170, 15, 'Wellemöbel GmbH', 'Zum Strothebach 11', '33175', 'Bad Lippspringe', '05252-9890-0', '05252-9890-585', 'Herr', '', 'Volker', 'Meurer', 'info@welle.com', 'http://www.welle-moebel.de/', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '78', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1171, 15, 'Gardner Denver / Comp Air Simmern ', 'Argenthalerstrasse 11', '55469', 'Simmern ', '', '', 'Herr', '', 'Jan Erik ', 'Dreier ', 'Jan-ErikDreier@Compair.com', 'http://www.gd-elmorietschle.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '82', 'Rheinland-Pfalz', 'new', 0, 0, '2016-05-24 08:17:19'),
(1172, 15, 'Gießerei Heunisch GmbH', 'Westheimer Str. 6', '91438', 'Bad Windsheim', '09841-408-0', '09841-408-238', 'Frau', 'Dr.', 'Christiane', 'Heunisch-Grotz', 'info@heunisch-guss.com', 'http://www.heunisch-guss.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '138', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1173, 15, 'Auto-Scholz GmbH & Co. KG', 'Kärntenstr. 1', '96052', 'Bamberg', '0951-9333-0', '0951-9333-160', 'Herr', '', 'Michael', 'Eidenmüller', 'dialog@auto-scholz.de', 'http://www.auto-scholz.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '404', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1174, 15, 'Wieland Electric GmbH', 'Brennerstr. 10-14', '96052', 'Bamberg', '0951-9324-0', '0951-9324-198', 'Herr', 'Dr.', 'Ulrich', 'Schaarschmidt', 'info@wieland-electric.com', 'http://www.wieland-electric.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1175, 15, 'Auto-Jet Waschstraßen', 'Memminger Str. 51', '87743', 'Benningen', '08331-857-422', '08331-857-175', 'Herr', '', 'Otto', 'Christ jun.', 'info@auto-jet.de', 'http://www.auto-jet.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1176, 15, 'C S P GmbH', 'Am Schlagbaum 4', '59192', 'Bergkamen', '02307-20844-0', '02307-20844-20', 'Herr', '', 'Andreas', 'Conradi', 'info@csp-bergkamen.de', 'http://www.csp-bergkamen.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1177, 15, 'Steilmann Holding AG', 'Industriestr. 42', '59192', 'Bergkamen', '02389-783-0', '02389-783-112', 'Herr', 'Dr.', 'Michele', 'Puller', 'info@radici.de', 'http://www.steilmann-holding.eu', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '850', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1178, 15, 'Albert Handtmann Holding GmbH & Co. KG', 'Arthur-Handtmann-Str. 23', '88400', 'Biberach an der Riß', '07351-342-0', '07351-342-2762', 'Herr', '', 'Thomas', 'Handtmann', 'info@handtmann.de', 'http://www.handtmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '505', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1179, 15, 'JAB Josef Anstoetz KG', 'Potsdamer Str. 160', '33719', 'Bielefeld', '0521-2093-0', '0521-2093-388', 'Herr', '', 'Ralph', 'Anstoetz', 'jabverkauf@jab.de', 'http://www.jab.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '235', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1180, 15, 'Jibi Handel GmbH & Co.', 'Kurze Str. 4-6', '33613', 'Bielefeld', '0521-52006-0', '0521-52006-29', 'Herr', '', 'Manfred', 'Neumann', 'info@jibi.de', 'http://www.jibi.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '275', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1181, 15, 'Seidensticker GmbH', 'Herforder Str. 182-194', '33609', 'Bielefeld', '0521-306-0', '0521-306-111', 'Herr', '', 'Frank-Walter', 'Seidensticker', 'info@seidensticker.de', 'http://www.seidensticker.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '180', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1182, 15, 'Wilhelm Böllhoff GmbH & Co. KG', 'Archimedesstr. 1-4', '33649', 'Bielefeld', '0521-4482-01', '0521-4493-64', 'Herr', '', 'Michael W.', 'Böllhoff', 'info@boellhoff.com', 'http://www.boellhoff.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '135', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1183, 15, 'NKD Deutschland GmbH', 'Bühlstr. 5-7', '95463', 'Bindlach', '09208-699-0', '09208-699-209', 'Herr', '', 'Frank', 'Beeck', 'service@nkd.de', 'http://www2.nkd.com/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '505', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1184, 15, 'Trevira GmbH', 'Max-Fischer-Str. 11', '86399', 'Bobingen', '08234-9688-2222', '08234-9688-5432', 'Herr', '', 'Klaus', 'Holz', 'trevira.info@trevira.com', 'http://www.trevira.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '255', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1185, 15, 'Agilent Technologies Deutschland GmbH', 'Herrenberger Str. 130', '71034', 'Böblingen', '07031-464-0', '07031-464-2020', 'Herr', '', 'Manfred', 'Seitz', '', 'http://www.home.agilent.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '46', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1186, 15, 'EISENMANN SE', 'Tübinger Str. 81', '71032', 'Böblingen', '07031-78-0', '07031-78-1000', 'Herr', 'Dr.', 'Matthias', 'von Krauland', 'info@eisenmann.com', 'http://www.eisenmann.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '596', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1187, 15, 'Fahrzeug-Werke Lueg AG', 'Universitätsstr. 44-46', '44789', 'Bochum', '0234-318-0', '0234-318-337', 'Herr', '', 'Jürgen', 'Tauscher', 'info@lueg.de', 'http://www.lueg.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '613', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1188, 15, 'Gebr.Eickhoff Maschinenfabrik', 'Am Eickhoffpark 1', '44789', 'Bochum', '0234-975-0', '0234-975-2445', 'Herr', 'Dr.', 'Paul', 'Rheinländer', 'kontakt@eickhoff-bochum.de', 'http://www.eickhoff-bochum.de', 'Deutschland', 'Maschinenbau', 'G unter 100', '11', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1189, 15, 'RECTICEL SCHLAFKOMFORT GmbH', 'Schlaraffiastr. 1-10', '44867', 'Bochum', '02327-325-0', '', 'Herr', '', 'Jörg', 'Söltzer', 'info@schlaraffia.de', 'http://www.schlaraffia.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '313', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1190, 15, 'Wüstenberg Landtechnik Börm GmbH & Co.KG', 'Dorfstr. 3', '24863', 'Börm', '04627-18780', '04627-187860', 'Herr', '', 'Holger', 'Wüstenberg', 'info@wuestenberg-landtechnik.de', 'http://www.wuestenberg-landtechnik.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Schleswig-Holstein', 'new', 0, 0, '2016-05-24 08:17:19'),
(1191, 15, 'MC-BAUCHEMIE MÜLLER GmbH & Co.', 'Am Kruppwald 1-8', '46238', 'Bottrop', '02041-101-0', '02041-64017', 'Frau', '', 'Hilde', 'Müller', 'info@mc-bauchemie.de', 'http://www.mc-bauchemie.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1192, 15, 'EFAFLEX Tor- und Sicherheitssysteme', 'Fliederstr. 14', '84079', 'Bruckberg', '08765-82-0', '08765-82-200', 'Herr', '', 'Ulrico', 'Becker', 'info@efaflex.com', 'http://www.efaflex.com/', 'Deutschland', 'Bauindustrie & Stahl', 'E 200-499', '86', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1193, 15, 'SURTECO SE', 'Johan-Viktor-Bausch-Str. 2', '86647', 'Buttenwiesen', '08274-9988-0', '08274-9988-505', 'Herr', '', 'Friedhelm', 'Päfgen', 'info@surteco.com', 'http://www.surteco.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '408', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1194, 15, 'Simmel AG', 'Chemnitzer Str. 105', '09224', 'Chemnitz', '0371-809-0', '0371-810-15', 'Herr', '', 'Peter', 'Simmel', 'service@simmel.de', 'http://www.simmel.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '122', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1195, 15, 'Wismut GmbH', 'Jagdschänkenstr. 29', '09117', 'Chemnitz', '0371-8120-0', '0371-8120-584', 'Herr', 'Dr.', 'Stefan', 'Mann', 'info@wismut.de', 'http://www.wismut.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '158', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1196, 15, 'KAESER KOMPRESSOREN SE', 'Carl-Kaeser-Str. 26', '96450', 'Coburg', '09561-640-0', '', 'Herr', '', 'Thomas', 'Kaeser', 'info@kaeser.com', 'http://www.kaeser.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '618', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1197, 15, 'ROLL Truck Service GmbH', 'Ludwig-Erhard-Str. 102', '74564', 'Crailsheim', '07951-29793-0', '07951-29793-39', 'Herr', '', 'Heinrich', 'Roll', 'info@rolltruck.de', 'http://www.rolltruck.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1198, 15, 'Mylan dura GmbH', 'Wittichstr. 6', '64295', 'Darmstadt', '06151-9512-0', '06151-9512-471', 'Herr', '', 'Lloyd', 'Gotsell', 'info@mylan-dura.de', 'http://www.mylan-dura.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '120', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1199, 15, 'Weidmüller Interface GmbH & Co. KG', 'Klingenbergstr. 16', '32758', 'Detmold', '05231-14-0', '05231-14-292083', 'Herr', '', 'Harald', 'Vogelsang', 'info@weidmueller.de', 'http://www.weidmueller.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '620', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1200, 15, 'Edeka C+C Großhandel GmbH', 'Mainfrankenpark 39-41', '97337', 'Dettelbach', '09302-9327-00', '09302-9327-12', 'Herr', '', 'Heiko', 'Kordmann', '', 'http://www.edeka-cc.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1201, 15, 'Isabellenhütte Heusler GmbH & Co. KG', 'Eibacher Weg 3-5', '35683', 'Dillenburg', '02771-934-0', '02771-23030', 'Herr', '', 'Jürgen', 'Brust', 'info@isabellenhuette.de', 'http://www.isabellenhuette.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '99', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1202, 15, 'Wendel GmbH', 'Am Güterbahnhof 30', '35683', 'Dillenburg', '02771-906-0', '02771-906-160', 'Herr', '', 'Klaus-Achim', 'Wendel', 'info@wendel-email.de', 'http://www.wendel-email.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '0', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1203, 15, 'GEERS Hörakustik AG & Co. KG', 'Otto-Hahn-Str. 35', '44227', 'Dortmund', '0231-9760-0', '0231-9760-100', 'Herr', '', 'Ulrich', 'Koch', 'info@geers.de', 'http://www.geers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1204, 15, 'Hellweg Die Profi-Baumärkte', 'Zeche Oespel 15', '44149', 'Dortmund', '0231-22618240', '0231-96965151', 'Herr', '', 'Christoph', 'Semer', 'Kundenservice@hellweg.de', 'http://www.hellweg.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '630', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1205, 15, 'REWE DORTMUND Großhandel eG', 'Asselner Hellweg 1-3', '44309', 'Dortmund', '0231-25000', '0231-2500177', 'Herr', '', 'Heinz-Bert', 'Zander', 'info@rewe-dortmund.de', 'http://www.rewe-dortmund.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1206, 15, 'ThyssenKrupp Rothe Erde GmbH', 'Tremoniastr. 5-11', '44137', 'Dortmund', '0231-186-0', '0231-186-2500', 'Herr', 'Dr.', 'Arno', 'Schuppert', 'rotheerde@thyssenkrupp.com', 'http://www.rotheerde.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1207, 15, 'Applied Materials GmbH', 'Buchenstr. 16 b', '01097', 'Dresden', '06023-92-6000', '06023-92-6020', 'Herr', '', 'Jürgen', 'Johnke', '', 'http://www.appliedmaterials.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '124', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1208, 15, 'GLOBALFOUNDRIES Dresden Module One', 'Wilschdorfer Landstr. 101', '01109', 'Dresden', '0351-2770', '', 'Herr', 'Dr.', 'Udo', 'Nothelfer', 'global.sales@globalfoundries.com', 'http://www.globalfoundries.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '891', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1209, 15, 'IKK classic', 'Tannenstr. 4b', '01099', 'Dresden', '0800-4551111', '0351-4292-200-99', 'Herr', '', 'Gerd', 'Ludwig', 'info@ikk-classic.de', 'http://www.ikk-classic.de/', 'Deutschland', 'Finanzen & Versicherung', 'C 1000-5000', '0', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1210, 15, 'Sächsische Dampfschiffahrts GmbH & Co.', 'Georg-Treu-Platz 3', '01067', 'Dresden', '0351-86609-0', '0351-86609-88', 'Frau', '', 'Karin', 'Hildebrand', 'info@saechsische-dampfschiffahrt.de', 'http://www.saechsische-dampfschiffahrt.de/', 'Deutschland', 'Gastronomie & Touristik', 'G unter 100', '9', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1211, 15, 'VEM Sachsenwerk GmbH', 'Pirnaer Landstr. 176', '01257', 'Dresden', '0351-208-0', '0351-208-1028', 'Herr', '', 'Gerhard', 'Freymuth', 'sachsenwerk@vem-group.com', 'http://www.vem-group.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '260', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1212, 15, 'BiBA GmbH', 'Daimlerstr. 3', '47167', 'Duisburg', '0203-5196-0', '0203-5196-190', 'Herr', '', 'Oliver', 'Kessel', 'info@biba.de', 'http://www.biba.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '101', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1213, 15, 'Grillo-Werke AG', 'Weseler Str. 1', '47169', 'Duisburg', '0203-5557-0', '0203-5557-440', 'Herr', '', 'Ulrich', 'Grillo', 'info@grillo.de', 'http://www.grillo.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '539', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1214, 15, 'Hitachi Power Europe GmbH', 'Schifferstr. 80', '47059', 'Duisburg', '0203-8038-0', '0203-8038-1809', 'Herr', '', 'Klaus Dieter', 'Rennert', 'infobox@hitachi-power.com', 'http://www.hitachi-power.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '29', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1215, 15, 'Sachtleben Chemie GmbH', 'Dr.-Rudolf-Sachtleben-Str. 4', '47198', 'Duisburg', '02066-22-0', '02066-22-2000', 'Herr', 'Dr.', 'Jörg', 'Eraßme', 'info@sachtleben.de', 'http://www.sachtleben.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '550', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1216, 15, 'Akzo Nobel GmbH', 'Kreuzauer Str. 46', '52355', 'Düren', '02421-595-616', '', 'Herr', '', 'Dietmar', 'Stolle', 'info.deutsch@akzonobel.com', 'http://www.akzonobel.com/de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1217, 15, 'Heimbach GmbH & Co. KG', 'An Gut Nazareth 73', '52353', 'Düren', '02421-802-0', '02421-802-700', 'Herr', '', 'Peter', 'Michels', 'heimbach-paper@heimbach.com', 'http://www.heimbach.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '177', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1218, 15, 'AHG Allgemeine Hospitalgesellschaft', 'Benrather Schloßallee 31', '40215', 'Düsseldorf', '0211-3011-01', '0211-3011-2121', 'Herr', '', 'Norbert', 'Glahn', 'info@ahg.de', 'http://www.ahg.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '158', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1219, 15, 'Alloheim Senioren-Residenzen GmbH', 'Am Seestern 1', '40547', 'Düsseldorf', '0211-47870-0', '0211-47870-50', 'Herr', '', 'Rainer', 'Hohmann', 'info@alloheim.de', 'http://www.alloheim.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '52', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1220, 15, 'Anson''s Herrenhaus KG', 'Berliner Allee 2', '40212', 'Düsseldorf', '0211-1798-0', '0211-1798-697', 'Herr', 'Dr.', 'Horst', 'Clemens', 'kontakt@ansons.de', 'http://www.ansons.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1221, 15, 'BBDO Group Germany GmbH', 'Königsallee 92', '40212', 'Düsseldorf', '0211-1379-0', '0211-1379-8362', 'Herr', '', 'Frank', 'Lotze', 'info@bbdo.de', 'http://www.bbdo.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '433', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1222, 15, 'CEMEX Deutschland AG', 'Theodortstr. 178', '40472', 'Düsseldorf', '0211-4470-0', '0211-4470-1601', 'Herr', '', 'Eric', 'Wittmann', 'kundenservice.de@cemex.com', 'http://www.cemex.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '318', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1223, 15, 'Ericsson GmbH', 'Prinzenallee 21', '40549', 'Düsseldorf', '0211-534-0', '0211-534-1000', 'Herr', '', 'Stefan', 'Koetz', '', 'http://www.ericsson.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '681', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1224, 15, 'Gigaset Communications GmbH', 'Hansaallee 299', '40549', 'Düsseldorf', '089-722-0', '', 'Herr', '', 'Charles', 'Fränkl', '', 'http://gigaset.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '361', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1225, 15, 'Grohe AG', 'Feldmühleplatz 15', '40545', 'Düsseldorf', '0211-9130-3000', '0211-9130-3031', 'Herr', '', 'Thomas', 'Fuhr', 'presse@grohe.de', 'http://www.grohe.com', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '933', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1226, 15, 'Lieken AG', 'Fritz-Vomfelde-Str. 14-20', '40547', 'Düsseldorf', '0211-530634-0', '0211-530634-34', 'Herr', '', 'Markus', 'Biermann', 'pressestelle@lieken.de', 'http://www.lieken.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '780', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1227, 15, 'M.A.X. Automation AG', 'Breite Str. 29-31', '40213', 'Düsseldorf', '0211-90991-0', '0211-90991-11', 'Herr', '', 'Fabian', 'Spilker', 'info@maxautomation.de', 'http://www.maxautomation.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '260', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1228, 15, 'MEDIMAX Zentrale Electronic SE', 'Mündelheimer Weg 40', '40472', 'Düsseldorf', '0211-4156-0', '0211-4156-150', 'Herr', '', 'Friedrich', 'Sobol', 'info@medimax.de', 'http://www.medimax.de', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1229, 15, 'METRO Cash & Carry Deutschland GmbH', 'Metro-Str. 8', '40235', 'Düsseldorf', '0800-7242737', '0511-679986-19', 'Herr', '', 'Alain', 'Cappannelli', 'info@ccschaper.de', 'http://www.ccschaper.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '67', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1230, 15, 'O-I Glasspack GmbH & Co. KG', 'Goethestr. 75', '40237', 'Düsseldorf', '0211-2809-0', '0211-2809-246', 'Herr', '', 'Joachim', 'Herzig', '', 'http://www.o-i.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '110', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1231, 15, 'Ranger Marketing & Vertriebs GmbH', 'Parsevalstr. 11', '40468', 'Düsseldorf', '0211-20008100', '0211-20008101', 'Herr', '', 'Frank', 'Rittmann', 'info@ranger.de', 'http://www.ranger.de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1232, 15, 'SMS Siemag AG', 'Eduard-Schloemann-Str. 4', '40237', 'Düsseldorf', '0211-881-0', '0211-881-4902', 'Herr', '', 'Burkhard', 'Dahmen', 'communications@sms-demag.com', 'http://www.sms-demag.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1233, 15, 'Terex Germany GmbH & Co KG', 'Forststr. 16', '40597', 'Düsseldorf', '0211-598844-10', '0211-598844-50', 'Herr', '', 'Lutz', 'Henschen', 'info@terex.com', 'http://www.terex.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '486', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1234, 15, 'MAG IAS GmbH', 'Salacher Str. 93', '73054', 'Eislingen', '07161-805-0', '07161-805-223', 'Herr', '', 'Rainer', 'Schmückle', 'contact-eu@mag-ias.com', 'http://www.mag-ias.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '326', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:19'),
(1235, 15, 'Peter Kölln', 'Westerstr. 22-24', '25336', 'Elmshorn', '04121-648-0', '04121-6639', 'Herr', 'Prof. Dr.', 'Hans Heinrich', 'Driftmann', 'kontakt@koelln.de', 'http://www.koelln.de', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '84', 'Schleswig-Holstein', 'new', 0, 0, '2016-05-24 08:17:19'),
(1236, 15, 'SPAX International GmbH & Co. KG', 'Kölner Str. 71-77', '58256', 'Ennepetal', '02333-799-0', '02333-799-199', 'Herr', '', 'Michael A.', 'Thomas', 'info@spax.com', 'http://www.abc-verbindungstechnik.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '190', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1237, 15, 'Rottendorf Pharma GmbH', 'Ostenfelder Str. 51- 61', '59320', 'Ennigerloh', '02524-268-0', '02524-268-100', 'Herr', 'Dr.', 'Stephan', 'Fleck', 'info@rottendorf.de', 'http://www.rottendorf.de/', 'Deutschland', 'Chemieindustrie', 'D 500-999', '74', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1238, 15, 'X-FAB Semiconductor Foundries AG', 'Haarbergstr. 67', '99097', 'Erfurt', '0361-427-6000', '0361-427-6111', 'Herr', 'Dr.', 'Jens', 'Kosch', 'info@xfab.com', 'http://www.xfab.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '66', 'Thüringen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1239, 15, 'GRUNDFOS GMBH', 'Schlüterstr. 33', '40699', 'Erkrath', '0211-92969-0', '', 'Herr', '', 'Ralf', 'Brechmann', 'infoservice@grundfos.de', 'http://de.grundfos.com/about-us/grundfos-in-deutschland/grundfos-hilge.html', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '226', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1240, 15, 'Gauselmann AG', 'Merkur-Allee 1-15', '32339', 'Espelkamp', '05772-49-0', '05772-49-165', 'Herr', '', 'Paul', 'Gauselmann', 'info@gauselmann.de', 'http://www.gauselmann.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '711', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1241, 15, 'HARTING KGaA', 'Marienwerderstr. 3', '32339', 'Espelkamp', '05772-47-0', '05772-47-400', 'Herr', '', 'Dietmar', 'Harting', 'info@harting.com', 'http://www.harting.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '36', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1242, 15, 'Alfried Krupp von Bohlen und', 'Alfried-Krupp-Str. 21', '45131', 'Essen', '0201-434-1', '0201-434-2399', 'Herr', 'Dr.', 'Günther', 'Flämig', 'info@krupp-krankenhaus.de', 'http://www.krupp-krankenhaus.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '102', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1243, 15, 'Atlas Copco Holding GmbH', 'Langemarckstr. 35', '45141', 'Essen', '0201-2177-0', '0201-290874', 'Herr', '', 'Piet', 'Leys', 'info.acholding@de.atlascopco.com', 'http://www.atlascopco.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '678', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1244, 15, 'BackWerk Management GmbH', 'Limbecker Str. 25-37', '45127', 'Essen', '0201-20189-0', '0201-20189-200', 'Herr', 'Dr.', 'Dirk', 'Schneider', 'info@back-werk.com', 'http://www.back-werk.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '163', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1245, 15, 'i f m electronic gmbh', 'Friedrichstr. 1', '45128', 'Essen', '0201-2422-0', '0201-2422-1200', 'Herr', '', 'Michael', 'Marhofer', 'info@ifm.com', 'http://www.ifm-electronic.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '580', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1246, 15, 'Mr. Wash Autoservice AG', 'Westendstr. 8', '45143', 'Essen', '0201-220880-0', '0201-220880-40', 'Herr', '', 'Richard', 'Enning', 'info@mrwash.de', 'http://www.mr-wash.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '245', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1247, 15, 'Metsä Tissue GmbH', 'Adolf-Halstrick-Str. 6-12', '53879', 'Euskirchen', '02251-812-0', '02251-812-144', 'Herr', '', 'Michael', 'Päckner', '', 'http://www.metsatissue.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '437', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:19'),
(1248, 15, 'Piasten GmbH & Co. KG', 'Piastenstr. 1', '91301', 'Forchheim', '09191-611-0', '09191-611-144', 'Herr', '', 'Rolf', 'Schröppel', 'office@piasten.de', 'http://www.piasten.com', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '75', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:19'),
(1249, 15, 'Texas Instruments Deutschland GmbH', 'Haggertystr. 1', '85356', 'Freising', '08161-802121', '08161-802045', 'Herr', 'Dr.', 'Wolfram', 'Tietscher', '', 'http://www.ti.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '236', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1250, 15, 'Rosenberger Hochfrequenztechnik', 'Hauptstr. 1', '83413', 'Fridolfing', '08684-18-0', '08684-18-499', 'Herr', '', 'Peter', 'Rosenberger', 'info@rosenberger.de', 'http://www.rosenberger.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20');
INSERT INTO `customer` (`id`, `project_id`, `company`, `street`, `zip_code`, `city`, `phone`, `fax`, `salutation`, `title`, `first_name`, `last_name`, `email`, `url`, `country`, `state`, `category_wzw`, `class`, `sales`, `status`, `calls`, `resubmission`, `create_date`) VALUES
(1251, 15, 'Hans Segmüller Polstermöbelfabrik', 'Münchner Str. 35', '86316', 'Friedberg', '0821-6006-0', '0821-6006-1299', 'Herr', '', 'Johannes', 'Segmüller', 'friedberg@segmueller.de', 'http://www.segmueller.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '684', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1252, 15, 'Landbäckerei Ihle GmbH', 'Dr.-Balthasar-Hubmaier-Str. 6', '86316', 'Friedberg', '0821-66007-0', '', 'Herr', '', 'Wilhelm-Peter', 'Ihle', 'info@ihle.de', 'http://www.ihle.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '79', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1253, 15, 'axicorp GmbH', 'Max-Planck-Str. 36b', '61381', 'Friedrichsdorf', '06172-4999-0', '06172-4999-129', 'Herr', '', 'Dirk', 'Ullrich', 'service@axicorp.de', 'http://www.axicorp.de/', 'Deutschland', 'Chemieindustrie', 'E 200-499', '200', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1254, 15, 'Bose GmbH', 'Max-Planck-Str. 36', '61381', 'Friedrichsdorf', '06172-7104-0', '06172-7104-19', 'Herr', '', 'Anton', 'Schalkamp', 'info_de@bose.com', 'http://www.bose.de', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '129', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1255, 15, 'Milupa GmbH', 'Bahnstr. 14-30', '61381', 'Friedrichsdorf', '06172-99-0', '06172-99-1595', 'Frau', '', 'Christine', 'Siemssen', 'pr@milupa.de', 'http://www.milupa-gmbh.de/', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '213', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1256, 15, 'Kennametal Holding GmbH', 'Wehlauer Str. 73', '90766', 'Fürth', '0911-9735-0', '0911-9735-388', 'Herr', 'Dr.', 'Joachim', 'Fabry', 'ebusiness.service@kennametal.com', 'http://www.kennametal.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '636', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1257, 15, 'LEONHARD KURZ Stiftung & Co. KG', 'Schwabacher Str. 482', '90763', 'Fürth', '0911-7141-0', '0911-7141-357', 'Herr', '', 'Walter', 'Kurz', 'sales@kurz.de', 'http://www.kurz.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '559', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1258, 15, 'Trolli GmbH', 'Oststr. 94', '90763', 'Fürth', '0911-78703-0', '0911-7870311-10', 'Herr', '', 'Herbert', 'Mederer', 'info@trolli.de', 'http://www.trolli.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '200', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1259, 15, 'UVEX WINTER HOLDING GmbH & Co. KG', 'Würzburger Str. 181', '90766', 'Fürth', '0911-9736-0', '0911-9736-375', 'Herr', '', 'Rainer', 'Winter', 'holding@uvex.de', 'http://www.uvex.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '303', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1260, 15, 'Fachkliniken Hohenurach', 'Höhenstr. 56', '87629', 'Füssen', '08362-12-0', '08362-12-4000', 'Herr', '', 'Heinz', 'Dahlhaus', 'info@enzensberg.de', 'http://www.enzensberg.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '29', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1261, 15, 'PHÖNIX Seniorenzentren', 'Hiebelerstr. 29', '87629', 'Füssen', '08362-9128-0', '08362-9128-600', 'Frau', '', 'Susanne', 'Momberg', 'info@phoenix.nu', 'http://www.phoenix.nu/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1262, 15, 'Bott GmbH & Co. KG', 'Bahnstr. 17', '74405', 'Gaildorf', '07971-251-0', '07971-251-285', 'Herr', 'Dr.', 'Reinhard', 'Wollermann-Windgasse', 'info@bott.de', 'http://www.bott.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '81', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1263, 15, 'Backstube Wünsche GmbH', 'Gutenbergstr. 11', '85080', 'Gaimersheim', '08458-3279-0', '08458-3279-30', 'Herr', '', 'Hans Georg', 'Maier', 'kontakt@backstube-wuensche.de', 'http://www.backstube-wuensche.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '37', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1264, 15, 'Union SB-Großmarkt Südbayern GmbH', 'Ingolstädter Str. 120', '85080', 'Gaimersheim', '08458-62-0', '08458-62-213', 'Herr', '', '', 'Hollinger oder Gruber', 'Michaela.Mossburger@edeka.de', 'http://www.sb-union.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '466', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1265, 15, 'Bayerische Zugspitzbahn Bergbahn', 'Olympiastr. 27', '82467', 'Garmisch-Partenkirchen', '08821-797-0', '08821-797-900', 'Herr', '', '', 'Stauch', 'M.Stauch@Zugspitze.de', 'http://www.zugspitze.de', 'Deutschland', 'Transport & Logistik', 'E 200-499', '25', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1266, 15, 'BP Gelsenkirchen GmbH', 'Pawiker Str. 30', '45896', 'Gelsenkirchen', '0209-366-0', '', 'Herr', 'Dr.', 'Klaus', 'Niemann', '', 'http://www.bpge.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '193', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1267, 15, 'Detlef Malzer''s Backstube GmbH & Co. KG', 'Ulrichstr. 13', '45891', 'Gelsenkirchen', '0209-97074-0', '0209-97074-70', 'Herr', '', 'Hans-Joachim', 'Scherpel', 'info@malzers.de', 'http://www.malzers.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '90', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1268, 15, 'Flachglas MarkenKreis GmbH', 'Auf der Reihe 2', '45884', 'Gelsenkirchen', '0209-91329-0', '0209-91329-29', 'Herr', '', 'Thomas', 'Stukenkemper', 'info@flachglas-markenkreis.de', 'http://www.flachglas-markenkreis.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1269, 15, 'Pilkington Holding GmbH', 'Haydnstr. 19', '45884', 'Gelsenkirchen', '0209-168-0', '0209-168-2025', 'Herr', 'Dr.', 'Christian', 'Quenett', '', 'http://www.pilkington.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '448', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1270, 15, 'Voigt & Schweitzer GmbH & Co. KG', 'Nordring 4', '45894', 'Gelsenkirchen', '0209-319270-0', '0209-319270-16', 'Herr', '', 'Lars', 'Baumgürtel', 'info@zinq.com', 'http://www.zinq.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '18', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1271, 15, 'Deutsche Rockwool', 'Rockwool-Str. 37-41', '45966', 'Gladbeck', '02043-408-0', '02043-408-444', 'Herr', '', 'Volker', 'Christmann', 'info@rockwool.de', 'http://www.rockwool.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '317', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1272, 15, 'Berendsen GmbH', 'Stadtstr. 3-7', '25348', 'Glückstadt', '04124-914-0', '04124-914-123', 'Herr', '', 'Carsten', 'Best', 'info@berendsen.de', 'http://www.berendsen.de/', 'Deutschland', 'Kommunales', 'F 100-200', '46', 'Schleswig-Holstein', 'new', 0, 0, '2016-05-24 08:17:20'),
(1273, 15, 'Möbel Rieger GmbH & Co. KG', 'Holzheimer Str. 2', '73037', 'Göppingen', '07161-621-0', '07161-621-196', 'Herr', '', 'Franz', 'Rieger', 'info@moebel-rieger.de', 'http://www.moebel-rieger.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '200', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1274, 15, 'Fossil (Europe) GmbH', 'Oberwinkl 1', '83355', 'Grabenstätt', '08661- 6226000', '', 'Herr', '', 'Christian', 'Coenen', 'info@fossil.de', 'http://www.fossil.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '349', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1275, 15, 'Opto GmbH', 'Lochhammer Schlag 14', '82166', 'Gräfelfing', '089-898055-0', '089-898055-18', 'Herr', '', 'Markus', 'Riedi', 'info@opto.de', 'http://www.opto.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'G unter 100', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1276, 15, 'IMO Holding GmbH', 'Imostr. 1', '91350', 'Gremsdorf', '09193-6395-0', '09193-6395-1140', 'Herr', '', 'Erich', 'Ruß', 'mail@imo.de', 'http://www.imo.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '85', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1277, 15, 'Mondi Consumer Packaging', 'Hüttruper Heide 88', '48268', 'Greven', '02571-9191-0', '02571-9191-91', 'Herr', '', 'Ralph', 'Landwehr', 'greven@nordenia.com', 'http://www.mondigroup.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '881', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1278, 15, 'Engbers GmbH & Co.KG', 'Düppelstr. 4', '48599', 'Gronau', '02562-713-0', '02562-713-169', 'Herr', '', 'Bernd', 'Bosch', 'info@engbers.de', 'http://www.engbers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '103', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1279, 15, 'Resopal GmbH', 'Hans-Böckler-Str. 4', '64823', 'Groß-Umstadt', '06078-80-0', '06078-80-624', 'Herr', '', 'Alan Timothy', 'Pearson', 'info@resopal.de', 'http://www.resopal.de/', 'Deutschland', 'Bauindustrie & Stahl', 'D 500-999', '0', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1280, 15, 'Bender GmbH & Co. KG', 'Londorfer Str. 65', '35305', 'Grünberg', '06401-807-0', '06401-807-259', 'Herr', 'Dr.', 'Dirk', 'Pieler', 'info@bender-de.com', 'http://www.bender-de.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '0', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1281, 15, 'Bavaria Film GmbH', 'Bavariafilmplatz 7', '82031', 'Grünwald', '089-6499-0', '089-6492-507', 'Herr', '', 'Achim', 'Rohnke', 'info@bavaria-film.de', 'http://www.bavaria-film.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '249', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1282, 15, 'Brandt Zwieback-Schokoladen', 'Kölner Str. 32-34', '58135', 'Hagen', '02331-477-0', '02331-477-190', 'Herr', '', 'Carl-Jürgen', 'Brandt', 'marketing@brandt-gmbh.de', 'http://www.brandt-gmbh.de', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '155', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1283, 15, 'Christ Juweliere und Uhrmacher', 'Kabeler Str. 4', '58099', 'Hagen', '02331-690-6286', '02331-690-8375', 'Frau', '', 'Elisabeth', 'Laraia', 'info@christ.de', 'http://www.christ.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '310', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1284, 15, 'Diakonie Mark-Ruhr gemeinnützige GmbH', 'Martin-Luther-Str. 9-11', '58095', 'Hagen', '02331-3809-00', '02331-3809-09', 'Herr', '', 'Volker', 'Holländer', 'info@diakonie-mark-ruhr.de', 'http://www.diakonie-mark-ruhr.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '155', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1285, 15, 'Hussel GmbH', 'Kabeler Str. 4', '58099', 'Hagen', '02331-690-8181', '02331-690-681', 'Herr', '', 'Sven', 'Eklöh', 'service@hussel.de', 'http://www.hussel.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '99', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1286, 15, 'Michael Brücken Kaufpark GmbH & Co OHG', 'Weststr. 4', '58089', 'Hagen', '02331-300-0', '02331-300-271', 'Herr', '', 'Günter', 'Zeitz', 'post@ihr-kaufpark.de', 'http://www.ihr-kaufpark.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '819', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1287, 15, 'SinnLeffers GmbH', 'Batheyer Str. 115-117', '58099', 'Hagen', '02331-620-0', '02331-620-100', 'Herr', '', 'Friedrich-Wilhelm', 'Göbel', 'info@sinnleffers.de', 'http://www.sinnleffers.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '257', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1288, 15, 'MAHA Maschinenbau', 'Hoyen 20', '87490', 'Haldenwang', '08374-585-0', '08374-585-590', 'Herr', '', 'Thomas', 'Förg', 'maha@maha.de', 'http://www.maha.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1289, 15, 'TTL Tapeten-Teppichbodenland', 'Emil-Kemmer-Str. 3', '96103', 'Hallstadt', '0951-96232-0', '0951-96232-33', 'Herr', '', 'Heinz', 'Fuchs', 'info@ttl-ttm.de', 'http://www.ttl-ttm.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1290, 15, 'f & w fördern und wohnen', 'Grüner Deich 17', '20097', 'Hamburg', '040-42835-0', '040-42835-3584', 'Herr', 'Dr.', 'Rembert', 'Vaerst', 'wohnen@foerdernundwohnen.de', 'http://www.foerdernundwohnen.de', 'Deutschland', 'Kommunales', 'D 500-999', '46', 'Hamburg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1291, 15, 'Hamburger Senioren Domizile GmbH', 'Reichsbahnstr. 20', '22525', 'Hamburg', '040-57203-0', '040-57203-6012', 'Herr', '', 'Lutz', 'Gornik', 'info@hamburger-senioren-domizile.de', 'http://www.hamburger-senioren-domizile.de/', 'Deutschland', 'Kommunales', 'E 200-499', '0', 'Hamburg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1292, 15, 'Plath GmbH', 'Gotenstr. 18', '20097', 'Hamburg', '040-23734-0', '040-23734-173', 'Herr', '', 'Nico', 'Scharfe', 'info@plath.de', 'http://www.plath.de', 'Deutschland', 'Maschinenbau', 'F 100-200', '0', 'Hamburg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1293, 15, 'RÄDER-VOGEL', 'Sperlsdeicher Weg 19-23', '21109', 'Hamburg', '040-75499-0', '040-75499-175', 'Herr', '', 'Dieter', 'Henning', 'rv@raedervogel.de', 'http://www.raedervogel.de', 'Deutschland', 'Maschinenbau', 'E 200-499', '60', 'Hamburg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1294, 15, 'Anton Hosselmann GmbH & Co. KG', 'Römerstr. 28', '59075', 'Hamm', '02381-97007-0', '02381-789286', 'Herr', '', 'Jürgen', 'Aust', 'info@hosselmann.de', 'http://www.hosselmann.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '70', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1295, 15, 'Westfälische Drahtindustrie GmbH', 'Wilhelmstr. 7', '59067', 'Hamm', '02381-276-0', '02381-276-211', 'Frau', '', 'Katja', 'Pampus', 'draht.hamm@wdi.de', 'http://www.wdi.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '621', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1296, 15, 'Eckart GmbH', 'Güntersthal 4', '91235', 'Hartenstein', '09152-77-0', '09152-77-7008', 'Herr', 'Dr.', 'Wolfgang', 'Schütt', 'info.eckart@altana.com', 'http://www.eckart.net', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1297, 15, 'Carl Edelmann GmbH', 'Steinheimer Str. 45', '89518', 'Heidenheim an der Brenz', '07321-340-0', '07321-340-244', 'Herr', '', 'Dierk', 'Schröder', 'info@edelmann.de', 'http://www.edelmann.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '188', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1298, 15, 'Uniklinikum Marien Hospital Herne', 'Hölkeskampring 40', '44625', 'Herne', '02323-499-0', '02323-499-1999', 'Herr', '', 'Theo', 'Freitag', 'info@marienhospital-herne.de', 'http://www.marienhospital-herne.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1299, 15, 'STABILO International GmbH', 'Schwanweg 1', '90562', 'Heroldsberg', '0911-567-0', '0911-567-4444', 'Herr', '', 'Sebastian', 'Schwanhäusser', 'info@stabilo.com', 'http://www.stabilo.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '370', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1300, 15, 'Herta GmbH', 'Westerholter Str. 750-770', '45701', 'Herten', '02366-301-701', '02366-301-370', 'Herr', '', 'Volker', 'Baltes', 'info@herta.de', 'http://www.hertaland.de/', 'Deutschland', 'Lebensmittelindustrie', 'E 200-499', '250', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1301, 15, 'ASK Chemicals GmbH', 'Reisholzstr. 16 - 18', '40721', 'Hilden', '0211-711030', '0211-7110335', 'Herr', '', 'Frank', 'Coenen', 'info@ask-chemicals.de', 'http://www.ask-chemicals.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '109', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1302, 15, 'Conrad Electronic SE', 'Klaus-Conrad-Str. 1', '92242', 'Hirschau', '0180-5312111', '0180-5312110', 'Herr', '', 'Holger', 'Ruban', 'webmaster@conrad.de', 'http://www.conrad.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '804', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1303, 15, 'Roth & Rau AG', 'An der Baumschule 6-8', '09337', 'Hohenstein-Ernstthal', '03723-671234', '03723-6711000', 'Herr', '', 'Peter M.', 'Wagner', 'info@roth-rau.com', 'http://www.roth-rau.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '154', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1304, 15, 'Hexal Aktiengesellschaft', 'Industriestr. 25', '83607', 'Holzkirchen', '08024-908-0', '08024-908-1290', 'Herr', '', 'Sandrine', 'Piret-Gerard', 'service@hexal.de', 'http://www.hexal.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1305, 15, 'Montanhydraulik GmbH', 'Bahnhofstr. 39', '59439', 'Holzwickede', '02301-916-0', '02301-916-123', 'Herr', 'Dr.-Ing.', 'Ralf', 'Becker', 'info@montanhydraulik.com', 'http://www.montanhydraulik.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '210', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1306, 15, 'Jeans Fritz', 'Tengerner Str. 143', '32609', 'Hüllhorst', '05744-512-0', '05744-512-111', 'Herr', '', 'Ernst', 'Schäfer', 'info@jeans-fritz.de', 'http://www.jeans-fritz.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '123', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1307, 15, 'RAG Anthrazit Ibbenbüren GmbH', 'Osnabrücker Str. 112', '49477', 'Ibbenbüren', '05451-51-0', '05451-51-3200', 'Herr', 'Dr.', 'Heinz-Werner', 'Voß', 'ib.gmbh@rag.de', 'http://www.anthrazit-ibbenbueren.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '383', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1308, 15, 'Alcoa Aluminium Deutschland, Inc.', 'Stenglingser Weg 65-78', '58642', 'Iserlohn', '02374-936-0', '', 'Herr', '', 'Edwin P.', 'Drake', '', 'http://www.alcoa.com/germany/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '700', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1309, 15, 'Constantin Medien AG', 'Münchener Str. 101g', '85737', 'Ismaning', '089-99500-0', '089-99500-111', 'Herr', '', 'Bernhard', 'Burgener', 'info@constantin-medien.de', 'http://www.constantin-medien.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '520', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1310, 15, 'Vinnolit GmbH & Co. KG', 'Carl-Zeiss-Ring 25', '85737', 'Ismaning', '089-96103-0', '089-96103-103', 'Herr', 'Dr.', 'Josef', 'Ertl', 'info@vinnolit.com', 'http://www.vinnolit.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '905', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1311, 15, 'JENOPTIK AG', 'Carl-Zeiss-Str. 1', '07739', 'Jena', '03641-65-0', '03641-424514', 'Herr', 'Dr.', 'Michael', 'Mertin', 'pr@jenoptik.com', 'http://www.jenoptik.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '585', 'Thüringen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1312, 15, 'PAPSTAR GmbH', 'Daimlerstr. 4-8', '53925', 'Kall', '02441-83-0', '02441-83-100', 'Herr', '', 'Hubertus', 'Kantelberg', 'info@papstar.de', 'http://www.papstar.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '119', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1313, 15, 'Düker GmbH & Co. KGaA', 'Würzburger Str. 10', '97753', 'Karlstadt', '09353-7910', '09353-791198', 'Herr', '', 'Martin', 'Simons', 'info@dueker.de', 'http://www.dueker.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '122', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1314, 15, 'Hilti Deutschland AG (Liechtenstein),', 'Hiltistr. 2', '86916', 'Kaufering', '0800-8885522', '0800-8885523', 'Herr', '', 'Jochen', 'Olbert', 'de.kundenservice@hilti.com', 'http://www.hilti.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '411', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1315, 15, 'Ponnath DIE MEISTERMETZGER GmbH', 'Bayreuther Str. 40', '95478', 'Kemnath', '09642-30-0', '09642-30-128', 'Herr', '', 'Michael', 'Ponnath', 'ponnath@ponnath.de', 'http://www.ponnath.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '154', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1316, 15, 'Feneberg Lebensmittel GmbH', 'Ursulasrieder Str. 2', '87437', 'Kempten', '0831-5717-0', '0831-5717-344', 'Herr', '', 'Christof', 'Feneberg', 'info@feneberg.de', 'http://www.feneberg.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '300', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1317, 15, 'Boll & Kirch Filterbau GmbH', 'Siemensstr. 10-14', '50170', 'Kerpen', '02273-562-0', '02273-562-185', 'Herr', 'Dr.', 'Heinz', 'Lux', 'info@bollfilter.de', 'http://www.bollfilter.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '143', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1318, 15, 'Hettich Holding GmbH & Co. oHG', 'Vahrenkampstr. 12-16', '32278', 'Kirchlengern', '05223-77-0', '05223-77-1414', 'Herr', 'Dr.', 'Andreas', 'Hettich', 'info@de.hettich.com', 'http://www.hettich.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '754', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1319, 15, 'Hörmann GmbH', 'Hauptstr. 45-47', '85614', 'Kirchseeon', '08091-52261', '08091-1275', 'Herr', '', 'Matthias', 'Müllner', 'info@hoermann-gmbh.de', 'http://www.hoermann-gmbh.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '590', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1320, 15, 'WEKA Holding GmbH & Co. KG', 'Römerstr. 4', '86438', 'Kissing', '08233-23-0', '08233-23-195', 'Herr', '', 'Werner', 'Mützel', 'info@weka-holding.de', 'http://www.weka-holding.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '217', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1321, 15, 'WIKA Alexander Wiegand SE & Co. KG', 'Alexander-Wiegand-Str. 30', '63911', 'Klingenberg', '09372-132-0', '09372-132-406', 'Herr', '', 'Alexander', 'Wiegand', 'info@wika.de', 'http://www.wika.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '800', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1322, 15, 'Funkwerk AG', 'Im Funkwerk 5', '99625', 'Kölleda', '03635-600-0', '03635-600-507', 'Frau', '', 'Kerstin', 'Schreiber', 'info@funkwerk.com', 'http://www.funkwerk.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '211', 'Thüringen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1323, 15, 'CARGLASS GmbH', 'Godorfer Hauptstr. 175', '50997', 'Köln', '0800-0363636', '02236-96206-34', 'Herr', '', 'Jean-Pierre', 'Filippini', 'webmaster@carglass.de', 'http://www.carglass.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '248', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1324, 15, 'Peugeot Deutschland GmbH', 'Edmund-Rumpler-Str. 4', '51149', 'Köln', '0800-1111999', '', 'Herr', '', 'Rick', 'Hermanns', 'inf.de@peugeot.com', 'http://www.peugeot.de', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '1660', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1325, 15, 'Fränkische Rohrwerke', 'Hellinger Str. 1', '97486', 'Königsberg', '09525-88-0', '09525-88-150', 'Herr', '', 'Otto', 'Kirchner', 'info.kbg@fraenkische.de', 'http://www.fraenkische.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '317', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1326, 15, 'Bodensee-Schiffsbetriebe GmbH', 'Hafenstr. 6', '78462', 'Konstanz', '07531-3640-0', '07531-3640-373', 'Herr', '', 'Stefan', 'Ballier', 'info@bsb.de', 'http://www.bsb-online.com/', 'Deutschland', 'Gastronomie & Touristik', 'F 100-200', '16', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1327, 15, 'AL-KO KOBER SE', 'Ichenhauser Str. 14', '89359', 'Kötz', '08221-97-0', '08221-97-393', 'Herr', '', 'Stefan', 'Kober', 'info@al-ko.de', 'http://www.al-ko.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '706', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1328, 15, 'G. Siempelkamp GmbH & Co.KG', 'Siempelkampstr. 75', '47803', 'Krefeld', '02151-92-30', '02151-92-5604', 'Herr', 'Dr.', 'Hans W.', 'Fechner', 'info@siempelkamp.com', 'http://www.siempelkamp.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '798', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1329, 15, 'Kurtz Holding GmbH & Co', 'Industriegebiet Wiebelbach', '97892', 'Kreuzwertheim', '09342-807-0', '09342-807-404', 'Herr', '', 'Rainer', 'Kurtz', 'info@kurtz.de', 'http://www.kurtz.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '190', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1330, 15, 'IREKS GmbH', 'Lichtenfelser Str. 20', '95326', 'Kulmbach', '09221-706-0', '09221-706-306', 'Herr', '', 'Jürgen', 'Brinkmann', 'info@ireks.com', 'http://www.ireks.de/', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '231', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1331, 15, 'Markgrafen-Getränkevertrieb-GmbH', 'Lichtenfelser Str. 6', '95326', 'Kulmbach', '09221-6003-0', '09221-6003-306', 'Herr', '', 'Korel', 'Gülmen', 'info@markgrafen.com', 'http://www.markgrafen.com', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1332, 15, 'Einhell Germany AG', 'Wiesenweg 22', '94405', 'Landau an der Isar', '09951-942-0', '09951-1702', 'Herr', '', 'Andreas', 'Kroiss', 'info@einhell.de', 'http://www.einhell.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '365', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1333, 15, 'ara Shoes AG', 'Zur Schlenkhecke 4', '40764', 'Langenfeld', '02173-105-0', '02173-105-108', 'Herr', '', 'Maximilian', 'Müller', 'info@ara-shoes.de', 'http://www.ara-shoes.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '386', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1334, 15, 'Strauss INNOVATION GmbH & Co.', 'Elisabeth-Selbert-Str. 13', '40764', 'Langenfeld', '02173-99-0001', '02173-99-2390', 'Herr', 'Dr.', 'Hans Peter', 'Döhmen', 'unternehmen@strauss-innovation.de', 'http://www.strauss-innovation.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '116', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1335, 15, 'Gallus Druckmaschinen GmbH', 'Steinbruchstr. 5', '35428', 'Langgöns', '06447-9250', '', 'Herr', '', 'Udo', 'Gabriel', '', 'http://www.gallus-group.com/', 'Deutschland', 'Maschinenbau', 'F 100-200', '44', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1336, 15, 'Käserei Champignon', 'Kemptener Str. 17-24', '87493', 'Lauben', '08374-92-0', '08374-92-169', 'Herr', '', 'Robert', 'Hofmeister', 'info@kaeserei-champignon.de', 'http://www.champignon.de/de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '271', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1337, 15, 'EMUGE-Werk Richard Glimpel GmbH & Co. KG', 'Nürnberger Str. 96-100', '91207', 'Lauf a. d. Pegnitz', '09123-186-0', '09123-14313', 'Herr', '', 'Helmut', 'Glimpel', 'info@emuge.de', 'http://www.emuge.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1338, 15, 'Uhlmann Pac-Systeme GmbH & Co. KG', 'Uhlmannstr. 14-18', '88471', 'Laupheim', '07392-702-0', '07392-18972', 'Herr', '', 'Norbert', 'Gruber', 'info@uhlmann.de', 'http://www.uhlmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '139', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1339, 15, 'Bolta Werke GmbH', 'Industriestr. 22', '91227', 'Leinburg', '09120-90-0', '09120-6141', 'Herr', '', 'Christian', 'Falk', 'info@bolta.de', 'http://www.bolta.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '98', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1340, 15, 'Wanzl Metallwarenfabrik GmbH', 'Rudolf-Wanzl-Str. 4', '89340', 'Leipheim', '08221-729-0', '08221-729-1000', 'Herr', '', 'Bernhard', 'Renzhofer', 'info@wanzl.de', 'http://www.wanzl.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '309', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1341, 15, 'Unister Holding GmbH', 'Barfußgäßchen 11', '04109', 'Leipzig', '0341-650-500', '0341-650-5023299', 'Herr', '', 'Thomas', 'Wagner', 'info@unister-gmbh.de', 'http://www.unister.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '227', 'Sachsen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1342, 15, 'Bischof + Klein GmbH & Co. KG', 'Rahestr. 47', '49525', 'Lengerich', '05481-920-0', '05481-920-541', 'Herr', 'Dr.', 'Volker', 'Pfennig', 'info@bk-international.com', 'http://www.bk-international.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '475', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1343, 15, 'Windmöller & Hölscher KG', 'Münsterstr. 50', '49525', 'Lengerich', '05481-14-0', '05481-14-2649', 'Herr', 'Dr.', 'Jürgen', 'Vutz', 'info@wuh-lengerich.de', 'http://www.wuh-lengerich.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '480', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1344, 15, 'Harmonic Drive AG', 'Hoenbergstr. 14', '65555', 'Limburg', '06431-5008-0', '06431-5008-119', 'Herr', '', 'Ekrem', 'Sirman', 'info@harmonicdrive.de', 'http://www.harmonicdrive.de/', 'Deutschland', 'Maschinenbau', 'E 200-499', '0', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1345, 15, 'SIG Combibloc GmbH', 'Rurstr. 58', '52441', 'Linnich', '02462-79-0', '02462-79-2519', 'Herr', 'Dr.', 'Thomas', 'Kloubert', 'info@sigcombibloc.com', 'http://www.sig.biz', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '808', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1346, 15, 'Nolte Küchen GmbH und Co. KG', 'Anni-Nolte-Str. 4', '32584', 'Löhne', '05732-899-0', '', 'Herr', '', 'Manfred', 'Wippermann', 'info@nolte-kuechen.de', 'http://www.nolte-kuechen.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1347, 15, 'FRIMO Group GmbH', 'Hansaring 6', '49504', 'Lotte', '05404-886-0', '05404-886-333', 'Herr', '', 'Hans-Günter', 'Bayer', 'info@frimo.com', 'http://www.frimo.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '135', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1348, 15, 'TT-Line GmbH & Co. KG', 'Zum Hafenplatz 1', '23570', 'Lübeck', '04502-801-0', '04502-801407', 'Herr', 'Dr.', 'Hanns Heinrich', 'Conzen', 'info@ttline.com', 'http://www.tt-line.de', 'Deutschland', 'Gastronomie & Touristik', 'G unter 100', '0', 'Schleswig-Holstein', 'new', 0, 0, '2016-05-24 08:17:20'),
(1349, 15, 'HASCO Hasenclever GmbH + Co KG', 'Römersweg 4', '58513', 'Lüdenscheid', '02351-957-0', '02351-957-237', 'Herr', '', 'Christoph', 'Ehrlich', 'info@hasco.com', 'http://www.hasco.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1350, 15, 'CARAT Systementwicklungs-', 'Am Victoria-Turm 2', '68163', 'Mannheim', '0621-86080-0', '0621-86080-914', 'Herr', '', 'Thomas', 'Vollmar', 'info@carat-gruppe.de', 'http://www.carat-gruppe.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '128', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1351, 15, 'WAREMA Renkhoff SE', 'Hans-Wilhelm-Renkhoff-Str. 2', '97828', 'Marktheidenfeld', '09391-20-0', '09391-20-4299', 'Frau', '', 'Angelique', 'Renkhoff-Mücke', 'info@warema.de', 'http://www.warema.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '376', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1352, 15, 'AGCO GmbH', 'Johann-Georg-Fendt-Str. 4', '87616', 'Marktoberdorf', '08342-77-0', '08342-77-220', 'Herr', '', 'Michael', 'Gschwender', 'info@xfendt.de', 'http://www.fendt.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '850', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1353, 15, 'SCHERDEL GmbH', 'Scherdelstr. 2', '95615', 'Marktredwitz', '09231-603-0', '09231-62938', 'Herr', '', 'Walter', 'Bach', 'info@scherdel.de', 'http://www.scherdel.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '480', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1354, 15, 'Georg Jos. Kaes GmbH', 'Am Ring 15', '87665', 'Mauerstetten', '08341-807-0', '08341-807-202', 'Herr', '', 'Helmut', 'Hermann', 'info@v-markt.de', 'http://www.v-markt.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '616', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1355, 15, 'Clean Car AG', 'Am Meerkamp 19', '40667', 'Meerbusch', '02132-9311-0', '02132-9311-30', 'Herr', '', 'Holger', 'Dörner', 'info@cleancar.de', 'http://www.cleancar.de/', 'Deutschland', 'Transport & Logistik', 'E 200-499', '115', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1356, 15, '>rational< einbauküchen GmbH', 'Rationalstr. 4', '49328', 'Melle', '05226-58-0', '05226-58-212', 'Herr', '', 'Andrea', 'Lodetti', 'info@rational.de', 'http://www.rational.de/', 'Deutschland', 'Konsumgüterhersteller', 'E 200-499', '32', 'Niedersachsen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1357, 15, 'Berger Holding GmbH & Co. KG', 'In der Neuen Welt 14', '87700', 'Memmingen', '08331-930-01', '08331-930-101', 'Herr', '', 'Oswald', 'Berger', 'berger-holding@aberger.de', 'http://www.aberger.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '240', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1358, 15, 'Magnet-Schultz GmbH & Co.', 'Allgäuer Str. 30', '87700', 'Memmingen', '08331-104-0', '08331-104-333', 'Herr', '', 'Wolfgang', 'Schultz', 'info@magnet-schultz.de', 'http://www.magnet-schultz.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '143', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1359, 15, 'Heinrich Rosier GmbH & Co. KG', 'Fröndenberger Str. 138-148', '58706', 'Menden', '02373-171-01', '02373-171-108', 'Herr', '', 'Heinrich', 'Rosier', 'info@rosier.de', 'http://www.rosier.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '571', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1360, 15, 'OBO Bettermann GmbH & Co. KG', 'Hüingser Ring 52', '58710', 'Menden', '02373-89-0', '02373-89-238', 'Herr', '', 'Ulrich', 'Bettermann', 'info@obo.de', 'http://www.bettermann.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '400', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1361, 15, 'Zott SE & Co. KG', 'Dr.-Steichele-Str. 4', '86690', 'Mertingen', '09078-801-0', '09078-801-110', 'Frau', '', 'Christine', 'Weber', 'info@zott.de', 'http://www.zott-dairy.com/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '697', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1362, 15, 'GROB-WERKE GmbH & Co. KG', 'Industriestr. 4', '87719', 'Mindelheim', '08261-996-0', '', 'Herr', '', 'German', 'Wankmiller', 'info@grobgroup.com', 'http://www.grob.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '388', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1363, 15, 'EDEKA-Markt Minden-Hannover GmbH', 'Wittelsbacherallee 61', '32427', 'Minden', '0571-802-0', '0571-802-1804', 'Herr', '', 'Bernhard', 'Berger', 'joerg.brockhoff@minden.edeka.de', 'http://www.niedrig-preis.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1364, 15, 'Karl Preuß GmbH & Co.', 'Viktoriastr. 27', '32423', 'Minden', '0571-3908-0', '0571-3908-15', 'Herr', '', 'Rüdiger', 'Heß', 'info@wez.de', 'http://www.wez.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '186', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1365, 15, 'MIOS Großhandel GmbH', 'Wittelsbacherallee 61', '32427', 'Minden', '0571-802-1761', '0571-802-1315', 'Frau', '', 'Heike', 'Kryszat', 'info@minden.edeka.de', 'http://www.mios.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '716', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1366, 15, 'WAGO Kontakttechnik GmbH', 'Hansastr. 27', '32423', 'Minden', '0571-887-0', '0571-887-169', 'Herr', '', 'Sven', 'Hohorst', 'info@wago.com', 'http://www.wago.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '661', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1367, 15, 'Trinkgut', 'Chemnitzer Str. 24', '47441', 'Moers', '02841-209-0', '02841-209-2435', 'Herr', '', 'Dirk', 'Neuhaus', 'kundenservice@trinkgut.de', 'http://www.trinkgut.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '516', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1368, 15, 'Scheidt & Bachmann GmbH', 'Breite Str. 132', '41238', 'Mönchengladbach', '02166-266-0', '02166-266-375', 'Herr', 'Dr.-Ing.', 'Norbert', 'Miller', 'admin@scheidt-bachmann.de', 'http://www.scheidt-bachmann.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '245', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1369, 15, 'Siemes Schuhcenter GmbH & Co. KG', 'Krefelder Str. 310', '41066', 'Mönchengladbach', '02161-965-0', '02161-965-111', 'Herr', '', 'Heinz Willi', 'Siemes', 'info@siemes.de', 'http://www.schuhcenter.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '385', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1370, 15, 'Hama GmbH & Co KG', 'Dresdner Str. 9', '86651', 'Monheim', '09091-502-0', '09091-502-279', 'Herr', '', 'Christoph', 'Thomas', 'hama@hama.de', 'http://www.hama.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1371, 15, 'WEISS-DRUCK GmbH & Co. KG', 'Hans-Georg-Weiss-Str. 7', '52156', 'Monschau', '02472-982-0', '02472-982-200', 'Herr', '', 'Georg', 'Weiss', 'info@weiss-druck.de', 'http://www.weiss-druck.de', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '138', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1372, 15, 'Hans Turck GmbH & Co. KG', 'Witzlebenstr. 7', '45472', 'Mülheim an der Ruhr', '0208-4952-0', '0208-4952-264', 'Herr', '', 'Ulrich', 'Turck', 'more@turck.com', 'http://www.turck.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1373, 15, 'Mannesmannröhren-Werke GmbH', 'Wiesenstr. 36', '45473', 'Mülheim an der Ruhr', '0208-458-0', '0208-458-1999', 'Herr', '', 'Wolfgang', 'Eging', 'info.service@smrw.de', 'http://www.smrw.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1374, 15, 'Salzgitter Mannesmann Precision GmbH', 'Wiesenstr. 36', '45473', 'Mülheim an der Ruhr', '0208-458-1507', '0208-458-1635', 'Herr', '', 'Heinrich', 'Clören', 'marketing@smp-tubes.com', 'http://praezisrohr.smp-tubes.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '450', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1375, 15, 'Alois Dallmayr KG', 'Dienerstr. 14-15', '80331', 'München', '089-2135-0', '089-2135-167', 'Herr', '', 'Wolfgang', 'Wille', 'info@dallmayr.de', 'http://www.dallmayr.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '859', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1376, 15, 'Augustinum gemeinnützige GmbH', 'Stiftsbogen 74', '81375', 'München', '089-7098-0', '089-7098-199', 'Herr', 'Prof. Dr.', 'Markus', 'Rückert', 'info@augustinum.de', 'http://www.augustinum.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '171', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1377, 15, 'Balfour Beatty Rail GmbH', 'Garmischer Str. 35', '81373', 'München', '089-41999-0', '089-41999-270', 'Herr', 'Dr.', 'Norbert', 'Stadhouders', 'info.de@bbrail.com', 'http://www.bbrail.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '197', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1378, 15, 'Caverion Deutschland GmbH', 'Riesstr. 8', '80992', 'München', '089-374288-500', '089-374288-520', 'Herr', '', 'Albert', 'Vonnahme', 'info@yit.de', 'http://www.caverion.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '566', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1379, 15, 'CURANUM AG', 'Zirkus-Krone-Str. 10', '80335', 'München', '089-242065-0', '089-242065-10', 'Herr', '', 'Yann', 'Coléou', 'info@curanum.de', 'http://www.curanum.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '216', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1380, 15, 'DSI Holding GmbH', 'Destouchesstr. 68', '80769', 'München', '089-309050-200', '089-309050-252', 'Herr', '', 'Alan', 'Bate', 'info@dywidag-systems.com', 'http://www.dywidag-systems.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '518', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1381, 15, 'Flughafen München GmbH', 'Nordallee 25', '85356', 'München', '089-975-00', '089-975-57906', 'Herr', 'Dr.', 'Michael', 'Kerkloh', 'info@munich-airport.de', 'http://www.munich-airport.de/de/micro/eurotrade/index.jsp', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1382, 15, 'Franz Xaver Meiller Fahrzeug- und', 'Untermenzinger Str. 1', '80997', 'München', '089-1487-0', '089-1487-1355', 'Herr', 'Dr.-Ing.', 'Daniel', 'Böhmer', 'info@meiller.com', 'http://www.meiller.com/', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '258', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1383, 15, 'HAWE Hydraulik SE', 'Streitfeldstr. 25', '81673', 'München', '089-379100-0', '089-379100-91000', 'Herr', '', 'Karl', 'Haeusgen', 'info@hawe.de', 'http://www.hawe.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '310', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1384, 15, 'Heinrich Hugendubel GmbH & Co. KG', 'Hilblestr. 54', '80636', 'München', '089-30757575', '089-30757530', 'Herr', 'Dr.', 'Stefan', 'Höllermann', 'service@hugendubel.de', 'http://www.hugendubel.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '302', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1385, 15, 'HEV Heimwerkermarkt GmbH & Co. KG', 'Leopoldstr. 236', '80807', 'München', '089-457692-0', '089-457692-77', 'Herr', '', 'Eckart', 'Brandhoff', '', 'http://www.hev-gmbh.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '210', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1386, 15, 'Kraftanlagen München GmbH', 'Ridlerstr. 31c', '80339', 'München', '089-6237-0', '089-6237-223', 'Herr', '', 'Alexander', 'Gremm', 'muenchen@kraftanlagen.com', 'http://www.ka-muenchen.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '366', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1387, 15, 'MAHAG Automobilhandel und Service', 'Schleibingerstr. 12-16', '81669', 'München', '089-48001-0', '089-48001-500', 'Herr', 'Dr.', 'Volker', 'Borkowski', 'info@mahag.de', 'http://www.mahag.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '458', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1388, 15, 'MÜNCHENSTIFT GmbH', 'Severinstr. 4', '81541', 'München', '089-62020-300', '', 'Herr', '', 'Siegfried', 'Benker', 'info@muenchenstift.de', 'http://www.muenchenstift.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '94', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1389, 15, 'Paulaner Brauerei GmbH & Co KG', 'Hochstr. 75', '81541', 'München', '089-48005-0', '089-48005-409', 'Herr', '', 'Roland', 'Tobias', 'info@paulaner.de', 'http://www.paulaner.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '280', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1390, 15, 'Rodenstock GmbH', 'Elsenheimerstr. 33', '80687', 'München', '089-7202-0', '089-7202-629', 'Herr', '', 'Oliver', 'Kastalio', 'info@rodenstock.de', 'http://www.rodenstock.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '401', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1391, 15, 'SBK Siemens-Betriebskrankenkasse', 'Heimeranstr. 31', '80339', 'München', '0800-07257257250', '0800-07257257251', 'Herr', 'Dr.', 'Hans', 'Unterhuber', 'info@sbk.org', 'http://www.sbk.org/', 'Deutschland', 'Finanzen & Versicherung', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1392, 15, 'Schaltbau Holding AG', 'Hollerithstr. 5', '81829', 'München', '089-93005-0', '089-93005-350', 'Herr', 'Dr.', 'Jürgen', 'Cammann', 'schaltbau@schaltbau.de', 'http://www.schaltbau.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '390', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1393, 15, 'Serviceplan Gruppe für innovative', 'Brienner Str. 45a-d', '80333', 'München', '089-2050-20', '089-2050-2111', 'Herr', '', 'Florian', 'Haller', 'info@serviceplan.de', 'http://www.serviceplan.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '126', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1394, 15, 'Siltronic AG', 'Hanns-Seidel-Platz. 4', '81737', 'München', '089-8564-3000', '089-8564-3219', 'Herr', '', 'Christoph', 'von Plotho', 'info@siltronic.com', 'http://www.siltronic.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '743', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1395, 15, 'Silver Care Holding GmbH', 'Uhlandstr. 4', '80336', 'München', '089-59068580', '089-59068589', 'Herr', '', 'Marc', 'Hildebrand', 'info@silvercareholding.de', 'http://silvercareholding.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1396, 15, 'Sozialservice-Gesellschaft', 'Hofmannstr. 54', '81379', 'München', '089-613047-0', '089-613047-99', 'Herr', '', 'Christian', 'Pietig', 'info@ssg.brk.de', 'http://www.seniorenwohnen.brk.de', 'Deutschland', 'Kommunales', 'C 1000-5000', '115', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1397, 15, 'TNS Infratest Shared Service', 'Landsberger Str. 284', '80687', 'München', '089-5600-0', '089-5600-1313', 'Herr', '', 'Harmut', 'Scheffler', 'tnsde@tns-infratest.com', 'http://www.tns-infratest.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '190', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1398, 15, 'Triumph International Aktiengesellschaft', 'Marsstr. 40', '80335', 'München', '089-5111-80', '089-5111-8427', 'Herr', '', 'Gerhard', 'Geuder', 'infoline@triumph-international.de', 'http://www.triumph-international.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '280', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1399, 15, 'Vinzenz Murr Vertriebs GmbH', 'Hofmannstr. 9', '81379', 'München', '089-78043-0', '089-78043-100', 'Frau', '', 'Evi', 'Brandl', 'info@vinzenzmurr.de', 'http://www.vinzenzmurr.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '195', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1400, 15, 'Brillux GmbH & Co. Kommanditgesellschaft', 'Weseler Str. 401', '48163', 'Münster', '0251-7188-0', '0251-7188-439', 'Herr', '', 'Peter', 'König', 'info@brillux.de', 'http://www.brillux.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '507', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1401, 15, 'L. Stroetmann Lebensmittel GmbH & Co. KG', 'Harkortstr. 30', '48163', 'Münster', '0251-7182-0', '0251-7182-130', 'Herr', '', 'Lutz', 'Stroetmann', 'eurocash@stroetmann.de', 'http://www.stroetmann.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '416', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1402, 15, 'Landesbetrieb Wald und Holz', 'Albrecht-Thaer-Str. 34', '48147', 'Münster', '0251-91797-0', '0251-91797-100', 'Herr', '', 'Andreas', 'Wiebe', 'info@wald-und-holz.nrw.de', 'http://www.wald-und-holz.nrw.de/', 'Deutschland', 'Lebensmittelindustrie', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1403, 15, 'TKD Kabel GmbH', 'An der Kleinbahn 16', '41334', 'Nettetal', '02157-8979-0', '02157-8979-89', 'Herr', 'Dr.', 'Wilhelm', 'Engst', 'nettetal@tkd-kabel.de', 'http://www.tkd-gruppe.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '185', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1404, 15, 'Höflinger Müller GmbH', 'Ludwig-Erhard-Str. 2', '85375', 'Neufahrn', '08165-79-0', '08165-4003', 'Frau', '', 'Eva', 'Müller', 'info@hm-gmbh.de', 'http://www.hm-gmbh.de', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '140', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1405, 15, 'Aluminium Norf GmbH', 'Koblenzer Str. 120', '41468', 'Neuss', '02131-937-0', '02131-937-8599', 'Herr', '', 'Thomas', 'Geupel', 'kontakt@alunorf.de', 'http://www.alunorf.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '381', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1406, 15, 'MM Kartonvertrieb GmbH', 'Düsseldorfer Str. 182-184', '41460', 'Neuss', '02131-2690-41511', '02131-2690-141511', 'Herr', 'Dr.', 'Wilhelm', 'Hörmanseder', 'sales.neuss@mm-karton.com', 'http://www.mm-karton.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '766', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1407, 15, 'F.X. Nachtmann Bleikristallwerke GmbH', 'Zacharias-Frank-Str. 7', '92660', 'Neustadt', '09602-30-0', '09602-30-1100', 'Herr', '', 'Alois', 'Kaufmann', 'info@nachtmann.com', 'http://www.nachtmann.com', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '47', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1408, 15, 'Gries Deco Company GmbH', 'Boschstr. 7a', '63843', 'Niedernberg', '06028-944-0', '06028-944-74099', 'Herr', '', 'Christian', 'Gries', 'info@g-d-c.eu', 'http://www.gries-deco-company.com/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '90', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1409, 15, 'Ensinger GmbH', 'Rudolf-Diesel-Str. 8', '71154', 'Nufringen', '07032-819-0', '07032-819-100', 'Herr', '', 'Klaus', 'Ensinger', 'info@ensinger-online.com', 'http://www.ensinger-online.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '350', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1410, 15, 'CCUniRent System GmbH', 'Thomas-Mann-Str. 16-20', '90471', 'Nürnberg', '0911-480499-0', '0911-480499-29', 'Herr', '', 'Jürgen', 'Lobach', 'info@ccunirent.com', 'http://www.ccunirent.com', 'Deutschland', 'Gastronomie & Touristik', 'C 1000-5000', '14', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1411, 15, 'DEHN + SÖHNE GmbH + Co.KG.', 'Rennweg 15', '90489', 'Nürnberg', '09181-906-0', '09181-906-100', 'Herr', 'Dr.', 'Philipp', 'Dehn', 'info@dehn.de', 'http://www.dehn.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1412, 15, 'Electrolux Hausgeräte GmbH', 'Fürther Str. 246', '90429', 'Nürnberg', '0911-323-0', '0911-323-1770', 'Herr', '', 'Josef', 'Klebl', 'info@electrolux.de', 'http://www.electrolux.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '867', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1413, 15, 'mister * lady GmbH', 'Sprottauer Str. 4-10', '90475', 'Nürnberg', '0911-98476-0', '0911-98476-304', 'Herr', '', 'Jürgen', 'Hanslbauer', 'info@mister-lady.com', 'http://www.mister-lady.com/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '129', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20');
INSERT INTO `customer` (`id`, `project_id`, `company`, `street`, `zip_code`, `city`, `phone`, `fax`, `salutation`, `title`, `first_name`, `last_name`, `email`, `url`, `country`, `state`, `category_wzw`, `class`, `sales`, `status`, `calls`, `resubmission`, `create_date`) VALUES
(1414, 15, 'Rudolf Wöhrl Aktiengesellschaft', 'Lina-Ammon-Str. 10', '90471', 'Nürnberg', '0911-8121-0', '0911-8121-100', 'Herr', '', 'Olivier', 'Wöhrl', 'info@woehrl.de', 'http://www.woehrl.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '271', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1415, 15, 'SEMIKRON Elektronik GmbH & Co. KG', 'Sigmundstr. 200', '90431', 'Nürnberg', '0911-6559-0', '0911-6559-262', 'Herr', '', 'Harald', 'Jäger', 'sales.skd@semikron.com', 'http://www.semikron.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1416, 15, 'Staedtler Mars GmbH & Co. KG', 'Moosäckerstr. 3', '90427', 'Nürnberg', '0911-9365-0', '0911-9365-400', 'Herr', '', 'Axel', 'Marx', 'info@staedtler.de', 'http://www.staedtler.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '158', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1417, 15, 'TA Triumph-Adler GmbH', 'Südwestpark 23', '90449', 'Nürnberg', '0911-6898-0', '0911-6898-204', 'Herr', '', 'Masafumi', 'Yoda', '', 'http://www.ta-experts.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '291', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1418, 15, 'WIEGEL Verwaltung GmbH & Co KG', 'Hans-Bunte-Str. 25', '90431', 'Nürnberg', '0911-32420-200', '0911-32420-299', 'Herr', '', 'Harald', 'Füchtenbusch', 'info@wiegel.de', 'http://www.wiegel.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '160', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1419, 15, 'Ziehm Imaging GmbH', 'Donaustr. 31', '90451', 'Nürnberg', '0911-2172-0', '0911-2172-390', 'Herr', '', 'Klaus', 'Hörndler', 'info@ziehm-eu.com', 'http://www.ziehm-imaging.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'E 200-499', '73', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1420, 15, 'Bilfinger Piping Technologies GmbH', 'Europaallee 1', '46047', 'Oberhausen', '0201-3645-0', '', 'Herr', '', 'Holger', 'Bennies', 'info.piping@bilfinger.com', 'http://www.piping.bilfinger.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '160', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1421, 15, 'KODI Diskontläden GmbH', 'Zum Eisenhammer 52', '46049', 'Oberhausen', '0208-85007-0', '0208-85007-112', 'Herr', '', 'Reinhold', 'Kuch', 'info@kodi.de', 'http://www.kodi.de', 'Deutschland', 'Drogerie & Haushalt', 'C 1000-5000', '115', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1422, 15, 'Leitz GmbH & Co.KG', 'Leitzstr. 2', '73447', 'Oberkochen', '07364-950-0', '07364-950-662', 'Herr', '', 'Michael', 'Voss', 'leitz@leitz.org', 'http://www.leitz.org', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '450', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1423, 15, 'Sumida AG', 'Dr.-Hans-Vogt-Platz 1', '94130', 'Obernzell', '08591-937-0', '08591-937-103', 'Herr', '', 'Paul', 'Hofbauer', 'contact@sumida-eu.com', 'http://www.sumida-eu.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1424, 15, 'Ehrmann AG Oberschönegg im Allgäu', 'Hauptstr. 19', '87770', 'Oberschönegg', '08333-301-0', '08333-301-310', 'Herr', '', 'Christian', 'Ehrmann', 'info@ehrmann.de', 'http://www.ehrmann.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '415', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1425, 15, 'Haver & Boecker OHG', 'Carl-Haver-Platz 3', '59302', 'Oelde', '02522-30-0', '02522-30-403', 'Herr', '', 'Florian', 'Festge', 'haver@haverboecker.com', 'http://www.haverboecker.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '373', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1426, 15, 'Gustoland GmbH', 'Industriestr. 8-14', '45739', 'Oer-Erkenschwick', '02368-61-300', '02368-61-237', 'Herr', '', 'Michael', 'Redding', 'info@gustoland.de', 'http://www.gustoland.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1427, 15, 'Oettinger Brauerei GmbH', 'Brauhausstr. 8', '86732', 'Oettingen', '09082-708-0', '09082-708-110', 'Herr', '', 'Michael', 'Mayer', 'mail@oettinger-bier.de', 'http://www.oettinger-bier.de', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '417', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1428, 15, 'BWF Offermann, Schmid & Co. KG', 'Bahnhofstr. 20', '89362', 'Offingen', '08224-71-0', '08224-71-2091', 'Herr', '', 'Stefan', 'Offermann', 'info@bwf-group.de', 'http://www.bwf-group.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1429, 15, 'Tyco Electronics Raychem GmbH', 'Finsinger Feld 1', '85521', 'Ottobrunn', '089-6089-0', '089-6096-345', 'Herr', '', 'Jörg', 'Mann', '', 'http://www.raychem.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'D 500-999', '238', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1430, 15, 'Finke Das Erlebnis-Einrichten', 'Paderborner Str. 97', '33104', 'Paderborn', '05251-302-0', '05251-302-2840', 'Herr', '', 'Wilfried', 'Finke', 'info@moebel-finke.de', 'http://www.finke.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '126', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1431, 15, 'Buchbauer Handelsmärkte GmbH', 'Hennebergerstr. 4', '94036', 'Passau', '0851-88669-0', '0851-88669-66', 'Herr', '', 'Andreas', 'Kapfhammer', 'buchbauer@ihb-buchbauer.com', 'http://www.ihb-buchbauer.com/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1432, 15, 'HiPP GmbH & Co. Vertrieb KG', 'Georg-Hipp-Str. 7', '85276', 'Pfaffenhofen', '08441-757-0', '08441-757-654', 'Herr', 'Dr.', 'Claus', 'Hipp', 'information@hipp.de', 'http://www.hipp.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '383', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1433, 15, 'Prettl Produktions Holding GmbH', 'Sandwiesenstr. 6', '72793', 'Pfullingen', '07121-707-0', '07121-707-105', 'Herr', '', 'Erhardt', 'Prettl', 'info@prettl.com', 'http://www.prettl.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '800', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1434, 15, 'HAMMER System Management GmbH', 'Oehrkstr. 1', '32457', 'Porta Westfalica', '05731-765-0', '05731-765-150', 'Herr', 'Dr.', 'Ralf', 'Bartsch', 'info@hammer-heimtex.de', 'http://www.hammer-heimtex.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '370', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1435, 15, 'SB-Möbel Boss', 'Bakenweg 16-20', '32457', 'Porta-Westfalica', '05731-609-600', '05731-609-588', 'Herr', '', 'Stefan', 'Kopmann', 'info@moebel-boss.de', 'http://www.moebel-boss.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '324', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1436, 15, 'Rheinland Kultur GmbH', 'Abtei Brauweiler', '50529', 'Pulheim', '02234-9921-0', '02234-9921-219', 'Herr', '', 'Sebastian', 'Emunds', 'info@rheinlandkultur.de', 'http://www.rheinlandkultur.de/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '24', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1437, 15, 'W.L.Gore & Associates GmbH', 'Hermann-Oberth-Str. 22', '85640', 'Putzbrunn', '0806380-10', '0806380-1850', 'Herr', '', 'Oskar', 'Berger', 'servicefabrics_de@wlgore.com', 'http://www.gore-tex.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '558', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1438, 15, 'KOLBUS GmbH & Co. KG', 'Osnabrücker Str. 77', '32369', 'Rahden', '05771-71-0', '05771-71-333', 'Herr', '', 'Kai', 'Büntemeyer', 'info@kolbus.de', 'http://www.kolbus.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '164', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1439, 15, 'Dehner GmbH & Co. KG', 'Donauwörther Str. 3-5', '86641', 'Rain am Lech', '09090-77-0', '09090-77-7770', 'Herr', '', 'Georg', 'Weber', 'info@dehner.de', 'http://www.dehner.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1440, 15, 'Prosegur GmbH', 'Kokkolastr. 5', '40882', 'Ratingen', '02102-1248-0', '0211-17165-166', 'Herr', '', 'Lucas', 'Sánchez Borgnis-Desbordes', 'welcome@prosegur.com', 'http://www.prosegur.de/', 'Deutschland', 'Immobilien & Gebäudeservice', 'C 1000-5000', '146', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1441, 15, 'Zapp AG', 'Zapp-Platz 1', '40880', 'Ratingen', '02102-710-0', '02102-710-200', 'Herr', 'Dr.', 'Heiner', 'Schunk', 'info@zapp.com', 'http://www.zapp.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '339', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1442, 15, 'Runners Point', 'Tiroler Str. 26', '45659', 'Recklinghausen', '02361-3003-0', '02361-3003-105', 'Herr', '', 'Sebastian', 'Janus', 'info@runnerspoint.de', 'http://www.runnerspoint.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '159', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1443, 15, 'Novoferm GmbH', 'Isselburger Str. 31', '46459', 'Rees', '02850-910-0', '02850-910-646', 'Herr', '', 'Rainer', 'Schackmann', 'info@novoferm.com', 'http://www.novoferm.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '239', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1444, 15, 'Bayerische Staatsforsten', 'Tillystr. 2', '93053', 'Regensburg', '0941-6909-0', '0941-6909-495', 'Herr', 'Dr.', 'Rudolf', 'Freidhager', 'info@baysf.de', 'http://www.baysf.de/de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '341', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1445, 15, 'Maschinenfabrik Reinhausen GmbH', 'Falkensteinstr. 8', '93059', 'Regensburg', '0941-4090-0', '', 'Herr', 'Dr.', 'Nicolas', 'Maier-Scheubeck', 'info@reinhausen.com', 'http://www.reinhausen.com', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '430', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1446, 15, 'Regensburger Druckgußwerk Wolf GmbH', 'Prüfeninger Schloss Str. 7', '93051', 'Regensburg', '0941-39649-0', '0941-39649-30', 'Herr', '', 'Wilhelm', 'Rambold', 'info@rdw-wolf.de', 'http://www.firmengruppe-wolf.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '91', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1447, 15, 'BEST CARWASH Dienstleistungs-GmbH', 'Neuenkamper Str. 3-9', '42855', 'Remscheid', '02191-3705-0', '02191-3705-57', 'Herr', '', 'Michael', 'Dattner', 'info@bestcarwash.de', 'http://www.bestcarwash.de/', 'Deutschland', 'Transport & Logistik', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1448, 15, 'GEDORE Tool Center GmbH & Co. KG', 'Remscheider Str. 149', '42899', 'Remscheid', '02191-596-900', '02191-596-999', 'Frau', '', 'Karen', 'Dowidat', 'zentrale@gedore.de', 'http://www.gedore.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1449, 15, 'Oerlikon Textile GmbH & Co. KG', 'Leverkuser Str. 65', '42897', 'Remscheid', '02191-67-0', '', 'Herr', '', 'Claus-Ulrich', 'Mai', 'info.textile@oerlikon.com', 'http://www.oerlikontextile.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '918', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1450, 15, 'RM Buch und Medien Vertrieb GmbH', 'Ringstr. 16-20', '33378', 'Rheda-Wiedenbrück', '0180-5415233', '0180-5415700', 'Herr', 'Dr.', 'Christoph', 'Mittendorf', 'service@derclub.de', 'http://www.derclub.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1451, 15, 'Westag & Getalit AG', 'Hellweg 15', '33378', 'Rheda-Wiedenbrück', '05242-17-0', '05242-17-75000', 'Herr', '', 'Bernhard', 'Wenninger', 'pr@westag-getalit.de', 'http://www.westag-getalit.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '224', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1452, 15, 'apetito Aktiengesellschaft', 'Bonifatiusstr. 305', '48432', 'Rheine', '05971-799-0', '05971-799-9350', 'Herr', '', 'Jörg', 'Baumgart', 'info@apetito.de', 'http://www.apetito.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '749', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1453, 15, 'Senger Holding GmbH', 'Oldenburger Str. 1-11', '48429', 'Rheine', '05971-7913-0', '05971-7913-4109', 'Herr', '', 'Andreas', 'Senger', 'info@auto-senger.de', 'http://www.auto-senger.de/', 'Deutschland', 'Technik & Auto', 'C 1000-5000', '368', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1454, 15, 'Lüning Handels-GmbH & Co. KG', 'Westerwieher Str. 33', '33397', 'Rietberg', '05244-705-0', '05244-705-145', 'Herr', '', 'Wolfgang', 'Rieländer', 'info@luening.de', 'http://www.luening.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '325', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1455, 15, 'Hubert Stüken GmbH & Co. KG', 'Alte Todenmanner Str. 42', '31737', 'Rinteln', '05751-702-0', '05751-702-188', 'Herr', 'Dr.', 'Hubert', 'Schmidt', 'info@stueken.de', 'http://www.stueken.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '0', 'Niedersachsen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1456, 15, 'Mühlbauer Aktiengesellschaft', 'Josef-Mühlbauer-Platz 1', '93426', 'Roding', '09461-952-0', '09461-952-1101', 'Herr', '', 'Hubert', 'Forster', 'info@muehlbauer.de', 'http://www.muehlbauer.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '213', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1457, 15, 'KARL BACHL GmbH & Co KG', 'Deching 3', '94133', 'Röhrnbach', '08582-18-0', '08582-18-118', 'Herr', '', 'Karl', 'Bachl', 'deching@bachl.de', 'http://www.bachl.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '198', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1458, 15, 'Huhtamaki Flexible Packaging Germany', 'Heinrich-Nicolaus-Str. 6', '87671', 'Ronsberg', '0831-785491', '0831-785250', 'Herr', '', 'Michael', 'Feiler', 'info.ronsberg@de.huhtamaki.com', 'http://www.huhtamaki.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1459, 15, 'J. Rettenmaier & Söhne GmbH + Co KG', 'Holzmühle Rosenberg', '73494', 'Rosenberg', '07967-152-0', '07967-152-222', 'Herr', '', 'Josef', 'Rettenmaier', 'info@jrs.de', 'http://www.jrs.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1460, 15, 'EMAG Holding GmbH', 'Austr. 24', '73084', 'Salach', '07162-17-0', '07162-17-199', 'Herr', '', 'Norbert', 'Heßbrüggen', 'communications@emag.com', 'http://www.emag.de/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '466', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1461, 15, 'Minipreis - Läden GmbH', 'Eichfeld 3', '33154', 'Salzkotten', '05258-504-0', '05258-504-149', 'Herr', '', 'Jürgen', 'Schroers', 'info@minipreis.de', 'http://www.minipreis.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '160', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1462, 15, 'Westfälische Fleischwarenfabrik', 'Stockmeyer-Str. 1', '48336', 'Sassenberg', '05426-82-0', '05426-82-222', 'Herr', '', 'Hans-Jürgen', 'Meschkat', 'info@stockmeyer.de', 'http://www.heristo.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '249', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1463, 15, 'AMT Alumetall Gießtechnik GmbH', 'Glörstr. 20-22', '58579', 'Schalksmühle', '02355-508313', '02355-509777', 'Herr', '', 'Harald', 'Möhl', 'info@gastroguss.de', 'http://www.gastroguss.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1464, 15, 'HOERBIGER Kompressortechnik GmbH', 'Im Forchet 5', '86956', 'Schongau', '08861-210-0', '08861-210-3278', 'Herr', '', 'Johannes', 'Hunschofsky', 'info-hks@hoerbiger.com', 'http://www.hoerbiger.com', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '950', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1465, 15, 'MBDA Deutschland GmbH', 'Hagenauer Forst 27', '86526', 'Schrobenhausen', '08252-99-0', '08252-99-6120', 'Herr', '', 'Thomas', 'Homberg', '', 'http://www.mbda-systems.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '303', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1466, 15, 'Apollo-Optik Holding GmbH & Co. KG', 'Wallenrodstr. 3', '91126', 'Schwabach', '09122-831-0', '', 'Herr', 'Dr.', 'Jörg', 'Ehmer', 'service@apollo-optik.com', 'http://www.apollo.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '355', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1467, 15, 'Kamps Management GmbH', 'Auf dem Mutzer 11', '41366', 'Schwalmtal', '02163-947-700', '02163-947-70137708', 'Herr', '', 'Jaap', 'Schalken', 'kundenservice@kamps.de', 'http://www.kamps.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '300', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1468, 15, 'MEILLERGHP GmbH', 'Gutenbergstr. 1-5', '92421', 'Schwandorf', '09431-620-194', '09431-620-540', 'Herr', '', 'Holger', 'Abeln', 'dialog@meillerghp.com', 'http://www.meillerghp.com/', 'Deutschland', 'Medien & Agenturen', 'C 1000-5000', '148', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1469, 15, 'Wolf Wurstspezialitäten GmbH', 'Am Ahornhof 2', '92421', 'Schwandorf', '09431-384-0', '09431-384-225', 'Herr', '', 'Christian', 'Wolf', 'vertrieb@wolf-wurst.de', 'http://www.wolf-wurst.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '267', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1470, 15, 'Blumen-Risse GmbH & Co.', 'Im Ostfeld 5', '58239', 'Schwerte', '02304-965-0', '02304-965-300', 'Frau', '', 'Tina', 'Risse-Stock', 'info@blumenrisse.de', 'http://www.blumenrisse.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '129', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1471, 15, 'BHS tabletop Aktiengesellschaft', 'Ludwigsmühle 1', '95100', 'Selb', '09287-73-0', '09287-73-1114', 'Herr', '', 'Christian', 'Strootmann', 'kontakt@bhs-tabletop.de', 'http://www.bhs-tabletop.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '82', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1472, 15, 'Möbel Inhofer GmbH & Co. KG', 'Ulmer Str. 50', '89250', 'Senden', '07307-85-0', '07307-85-8200', 'Herr', '', 'August', 'Inhofer', 'info@moebel-inhofer.de', 'http://www.inhofer.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '200', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1473, 15, 'VEKA AG', 'Dieselstr. 8', '48324', 'Sendenhorst', '02526-29-0', '02526-29-3710', 'Herr', '', 'Andreas', 'Hartleif', 'info@veka.com', 'http://www.veka.com', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '736', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1474, 15, 'Brückner Group GmbH', 'Königsberger Str. 5-7', '83313', 'Siegsdorf', '08662-63-0', '08662-63-9350', 'Herr', '', 'Maximilian', 'Schneider', 'brueckner.group@brueckner.com', 'http://www.brueckner.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '700', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1475, 15, 'Bitzer SE', 'Eschenbrünnlestr. 15', '71065', 'Sindelfingen', '07031-932-0', '07031-932-147', 'Herr', '', 'Peter', 'Schaufler', 'mail@bitzer.de', 'http://www.bitzer.de/', 'Deutschland', 'Maschinenbau', 'D 500-999', '632', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1476, 15, 'Paul Wilhelm von Keppler-Stiftung', 'Warmbronner Str. 22', '71063', 'Sindelfingen', '07031-63301-0', '07031-63301-111', 'Herr', 'Dr.', 'Alfons', 'Maurer', 'geschaeftsstelle@keppler-stiftung.de', 'http://www.keppler-stiftung.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1477, 15, 'Röhm GmbH', 'Heinrich-Röhm-Str. 50', '89567', 'Sontheim an der Brenz', '07325-16-0', '07325-16-492', 'Herr', 'Dr.', 'Michael', 'Fried', 'info@roehm.biz', 'http://www.roehm.biz/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '0', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1478, 15, 'hülsta-werke Hüls GmbH & Co KG', 'Karl-Hüls-Str. 1', '48703', 'Stadtlohn', '02563-86-0', '02563-86-1417', 'Herr', '', 'Oliver', 'Bialowons', 'info@huelsta.de', 'http://www.huelsta.de', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '254', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1479, 15, 'Aenova Holding GmbH', 'Berger Str. 8-10', '82319', 'Starnberg', '08683-895-0', '08683-895-100', 'Herr', '', 'Karl-Heinrich', 'Hoppmann', 'info@aenova-group.com', 'http://www.aenova.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '260', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1480, 15, 'More & More AG', 'Schorn 1', '82319', 'Starnberg', '089-55270550', '089-14367152-600', 'Herr', '', 'Karl-Heinz', 'Mohr', 'service@more-and-more.com', 'http://www.more-and-more.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '45', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1481, 15, 'Hamberger Flooring GmbH & Co. KG', 'Rohrdorfer Str. 133', '83071', 'Stephanskirchen', '08031-700-714', '08031-700-299', 'Herr', '', 'Peter', 'Hamberger', 'info@haro.de', 'http://www.haro.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '270', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1482, 15, 'Marc O´Polo Einzelhandels GmbH', 'Hofgartenstr. 1', '83071', 'Stephanskirchen', '08036-90-0', '08036-90-1890', 'Herr', '', 'Alexander', 'Gedat', 'Zentrale@marc-o-polo.de', 'http://www.marc-o-polo.de', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '452', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1483, 15, 'DALLI-WERKE GmbH & Co. KG', 'Zweifaller Str. 120', '52220', 'Stolberg', '02402-89-00', '02402-89-2222', 'Herr', 'Dr.', 'Hermann', 'Wirtz', 'kontakt@dalli-group.com', 'http://www.dalli-group.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '852', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1484, 15, 'MEGA Das Fach-Zentrum für die', 'Schlachthofstr. 6', '70188', 'Stuttgart', '0711-1684-0', '0711-1684-125', 'Herr', '', 'Marc', 'Klaiber', 'info@mega-stuttgart.de', 'http://www.mega-stuttgart.de/', 'Deutschland', 'Grosshandel', 'E 200-499', '80', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1485, 15, 'Brita GmbH', 'Heinrich-Hertz-Str. 4', '65232', 'Taunusstein', '06128-746-0', '06128-746-355', 'Herr', '', 'Markus', 'Hankammer', 'info@brita.net', 'http://www.brita.net', 'Deutschland', 'Konsumgüterhersteller', 'D 500-999', '208', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1486, 15, 'Winkhaus Holding', 'August-Winkhaus-Str. 31', '48291', 'Telgte', '02504-921-0', '02504-921-340', 'Frau', '', 'Sofie', 'Winkhaus', 'info@winkhaus.de', 'http://www.winkhaus.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '283', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1487, 15, 'Heinz Holding GmbH', 'Glashüttenplatz 1-7', '96355', 'Tettau', '09269-77-0', '09269-77-333', 'Herr', '', 'Carl-August', 'Heinz', 'sales@heinz-glas.com', 'http://www.heinz-glas.com/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '250', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1488, 15, 'dennree GmbH', 'Hofer Str. 11', '95183', 'Töpen', '09295-18-0', '09295-18-101', 'Herr', '', 'Thomas', 'Greim', 'zentrale@dennree.de', 'http://www.dennree.de/', 'Deutschland', 'Grosshandel', 'C 1000-5000', '420', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1489, 15, 'denn''s Biomarkt GmbH', 'Hofer Str. 11', '95183', 'Töpen', '09295-18-500', '09295-9141-500', 'Herr', '', 'Thomas', 'Greim', 'info@denns.de', 'http://www.denns-biomarkt.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '102', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1490, 15, 'DR. JOHANNES HEIDENHAIN GmbH', 'Dr.-Johannes-Heidenhain-Str. 5', '83301', 'Traunreut', '08669-31-0', '08669-38609', 'Herr', '', 'Thomas', 'Sesselmann', 'info@heidenhain.de', 'http://www.heidenhain.de/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '622', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1491, 15, 'Siteco Beleuchtungstechnik GmbH', 'Georg-Simon-Ohm-Str. 50', '83301', 'Traunreut', '08669-33-0', '08669-33-397', 'Herr', '', 'Christophe', 'Poméon', 'info@siteco.de', 'http://www.siteco.de', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '220', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1492, 15, 'AlzChem AG', 'Dr.-Albert-Frank-Str. 32', '83308', 'Trostberg', '08621-86-0', '08621-86-2020', 'Herr', '', 'Ulli', 'Seibel', 'info@alzchem.com', 'http://www.alzchem.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '245', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1493, 15, 'Eder GmbH', 'Moorweg 5', '83104', 'Tuntenhausen', '08067-181-0', '08067-181-788', 'Herr', '', 'Peter', 'Eder', 'info@eder-gmbh.de', 'http://www.eder-gmbh.de', 'Deutschland', 'Autoindustrie & Flugzeugbau', 'C 1000-5000', '400', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1494, 15, 'HATLAPA Uetersener Maschinenfabrik', 'Tornescher Weg 5-7', '25436', 'Uetersen', '04122-711-0', '04122-711-104', 'Herr', 'Dr.', 'Alexander', 'Nürnberg', 'info@hatlapa.de', 'http://www.hatlapa.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '120', 'Schleswig-Holstein', 'new', 0, 0, '2016-05-24 08:17:20'),
(1495, 15, 'ratiopharm GmbH', 'Graf-Arco-Str. 3', '89079', 'Ulm', '0731-402-02', '0731-402-7832', 'Herr', 'Dr.', 'Markus Leyck', 'Dieken', 'info@ratiopharm.de', 'http://www.ratiopharm.de', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '636', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1496, 15, 'SCHWENK Zement KG', 'Hindenburgring 15', '89077', 'Ulm', '0731-9341-0', '0731-9341-416', 'Herr', '', 'Eduard', 'Schleicher', 'info@schwenk-servicecenter.de', 'http://www.schwenk.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '794', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1497, 15, 'TEVA GmbH', 'Graf-Arco-Str. 3', '89079', 'Ulm', '0731-402-02', '0731-402-7832', 'Herr', 'Dr.', 'Christian Horst', 'Holzmann', 'info.teva-deutschland@teva.de', 'http://www.teva-deutschland.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '81', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1498, 15, 'Woolworth GmbH', 'Formerstr. 6', '59425', 'Unna', '02303-5938-100', '', 'Herr', '', 'Thomas', 'Leege', 'info@woolworth.de', 'http://www.woolworth.de', 'Deutschland', 'Drogerie & Haushalt', 'C 1000-5000', '798', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1499, 15, 'Zurbrüggen Wohn-Zentrum GmbH', 'Hans-Böckler-Str. 4', '59423', 'Unna', '02303-208-0', '', 'Herr', '', 'Christian', 'Zurbrüggen', 'service@zurbrueggen.de', 'http://www.zurbrueggen.de', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '280', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1500, 15, 'Develey Senf & Feinkost GmbH', 'Ottobrunner Str. 45', '82008', 'Unterhaching', '089-61102-0', '089-61102-127', 'Herr', '', 'Michael', 'Durach', 'develey-kontakt@develey.de', 'http://www.develey.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '386', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1501, 15, 'KWA Kuratorium', 'Biberger Str. 50', '82008', 'Unterhaching', '089-66558-500', '089-66558-538', 'Herr', '', 'Horst', 'Schmieder', 'kwainfo@kwa.de', 'http://www.kwa.de/', 'Deutschland', 'Kommunales', 'C 1000-5000', '108', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1502, 15, 'Vossloh-Schwabe Deutschland GmbH', 'Wasenstr. 25', '73660', 'Urbach', '02351-101-0', '02351-101-217', 'Herr', '', 'Klaus', 'Breisch', 'info.vsv@vsv.vossloh-schwabe.com', 'http://www.vossloh-schwabe.com/', 'Deutschland', 'Elektrotechnik & Medizintechnik', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1503, 15, 'Schmidt, Kranz & Co. GmbH', 'Hauptstr. 123', '42555', 'Velbert', '02052-888-0', '02052-888-10', 'Herr', 'Dr.', 'Hans-Caspar', 'Glinz', 'info@sk-velbert.de', 'http://www.schmidt-kranz.de', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '312', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1504, 15, 'nobilia-Werke', 'Waldstr. 53-57', '33415', 'Verl', '05246-508-0', '05246-508-96999', 'Herr', 'Dr.', 'Oliver', 'Streit', 'info@nobilia.de', 'http://www.nobilia.de/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '707', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1505, 15, 'H. & E. Reinert Westfälische', 'Mittel-Loxten 37', '33775', 'Versmold', '05423-966-0', '05423-966-130', 'Herr', '', 'Hans-Ewald', 'Reinert', 'reinert@reinert.de', 'http://www.reinert.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '350', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1506, 15, 'Heinrich Nölke GmbH & Co. KG', 'Ziegeleistr. 5', '33775', 'Versmold', '05423-969-0', '05423-969-267', 'Herr', '', 'Axel', 'Knau', 'info@noelke.de', 'http://www.noelke.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '231', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1507, 15, 'Linhardt GmbH & Co KG', 'Dr.-Winterling-Str. 40', '94234', 'Viechtach', '09942-951-0', '09942-3424', 'Frau', 'Dr.', 'Monika', 'Kopra-Schäfer', 'info@linhardt.com', 'http://www.linhardt.com', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '77', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1508, 15, 'Herbert Kannegiesser GmbH', 'Kannegiesserring 7-8', '32602', 'Vlotho', '05733-12-0', '05733-12-8204', 'Herr', '', 'Martin', 'Kannegiesser', 'info@kannegiesser.de', 'http://www.kannegiesser.de', 'Deutschland', 'Maschinenbau', 'D 500-999', '174', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1509, 15, 'Saueressig GmbH + Co.', 'Gutenbergstr. 1-3', '48961', 'Vreden', '02564-12-0', '02564-12-420', 'Herr', 'Dr.', 'Tomas', 'Sterkenburgh', 'mail@saueressig.de', 'http://www.saueressig.de/', 'Deutschland', 'Chemieindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1510, 15, 'Alfred Ritter GmbH & Co. KG', 'Alfred-Ritter-Str. 25', '71111', 'Waldenbuch', '07157-97-0', '07157-97-399', 'Herr', '', 'Jürgen', 'Herrmann', 'info@ritter-sport.de', 'http://www.ritter-sport.de/', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '359', 'Baden-Württemberg', 'new', 0, 0, '2016-05-24 08:17:20'),
(1511, 15, 'Mecklenburger Metallguß GmbH', 'Teterower Str. 1', '17192', 'Waren (Müritz)', '03991-736-0', '03991-736-210', 'Herr', '', 'Manfred', 'Urban', 'sales@mmgprop.de', 'http://www.mmgprop.de/', 'Deutschland', 'Maschinenbau', 'F 100-200', '0', 'Mecklenburg-Vorpommern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1512, 15, 'Warsteiner Brauerei Haus Cramer KG', 'Domring 4-10', '59581', 'Warstein', '02902-88-0', '02902-88-1299', 'Frau', '', 'Catharina', 'Cramer', 'info@warsteiner.com', 'http://www.warsteiner-gruppe.de/', 'Deutschland', 'Getränkeindustrie & Tabakwaren', 'C 1000-5000', '519', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1513, 15, 'Porzellanfabriken', 'Christian-Seltmann-Str. 59-67', '92637', 'Weiden', '0961-204-0', '0961-204-116', 'Herr', '', 'Christian R. W.', 'Seltmann', 'service@seltmann.com', 'http://www.seltmann-weiden.com/', 'Deutschland', 'Konsumgüterhersteller', 'C 1000-5000', '46', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1514, 15, 'K&L Ruppert Stiftung & Co. Handels-KG', 'Paradeisstr. 67', '82362', 'Weilheim', '0881-180-0', '0881-180-221', 'Frau', '', 'Susanne', 'Ruppert', 'info@kl-ruppert.de', 'http://www.kl-ruppert.com', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '217', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1515, 15, 'ZARGES GmbH', 'Zargesstr. 7', '82362', 'Weilheim', '0881-687-100', '0881-687-500', 'Herr', '', 'Dieter', 'Reis', 'zarges@zarges.de', 'http://www.zarges.de', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '244', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1516, 15, 'Gutmann AG', 'Nürnberger Str. 57-81', '91781', 'Weißenburg', '09141-992-0', '09141-992-212', 'Herr', '', 'Theodoros', 'Tzortzis', 'gutmann@gutmann.de', 'http://www.gutmann.de/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '138', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1517, 15, 'LUKAD HOLDING GmbH & Co. KG', 'Plettenberger Str. 12 b', '58791', 'Werdohl', '02392-916-550', '02392-916-559', 'Herr', '', 'Knut', 'Menshen', 'menshen@menshen.de', 'http://www.lukad.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '230', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1518, 15, 'BYK-Chemie GmbH', 'Abelstr. 45', '46483', 'Wesel', '0281-670-0', '0281-657-35', 'Herr', 'Dr.', 'Christoph', 'Schlünken', 'info@byk.com', 'http://www.byk.com/', 'Deutschland', 'Chemieindustrie', 'D 500-999', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1519, 15, 'ELANTAS GmbH', 'Abelstr. 43', '46483', 'Wesel', '0281-670-8', '0281-670-10999', 'Herr', 'Dr.', 'Guido', 'Forstbach', 'info.ELANTAS@altana.com', 'http://www.elantas.de/', 'Deutschland', 'Chemieindustrie', 'F 100-200', '391', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1520, 15, 'Hexagon Metrology GmbH', 'Siegmund-Hiepe-Str. 2-12', '35578', 'Wetzlar', '06441-207-0', '06441-207-122', 'Herr', '', 'Holger', 'Fritze', 'contact.de@hexagonmetrology.com', 'http://www.hexagonmetrology.com', 'Deutschland', 'Maschinenbau', 'E 200-499', '75', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1521, 15, 'Satisloh GmbH', 'Wilhelm-Loh-Str. 2-4', '35578', 'Wetzlar', '06441-912-0', '06441-912-130', 'Herr', '', 'Bruno', 'Fischer', 'info@satisloh.com', 'http://www.satisloh.com/', 'Deutschland', 'Maschinenbau', 'F 100-200', '97', 'Hessen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1522, 15, 'Wittur Holding GmbH', 'Rohrbachstr. 26-30', '85259', 'Wiedenzhausen', '08134-18-0', '08134-1849', 'Herr', 'Dr.', 'Walter', 'Rohregger', 'info@wittur.com', 'http://www.wittur.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '339', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1523, 15, 'Rettenmeier Holding AG', 'Industriestr. 1', '91634', 'Wilburgstetten', '09853-338-0', '09853-338-100', 'Herr', '', 'Dietmar', 'Breithaupt', 'info@rettenmeier.com', 'http://www.rettenmeier.com/', 'Deutschland', 'Bauindustrie & Stahl', 'C 1000-5000', '314', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1524, 15, 'Einrichtungshaus Ostermann GmbH & Co. KG', 'Fredi-Ostermann-Str. 1-3', '58454', 'Witten', '02302-985-0', '02302-985-1814', 'Herr', '', 'Rolf', 'Ostermann', 'kontakt@ostermann.de', 'http://www.ostermann.de/', 'Deutschland', 'DIY & Einrichten', 'C 1000-5000', '300', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1525, 15, 'EagleBurgmann Germany GmbH & Co. KG', 'Äußere Sauerlacher Str. 6-10', '82515', 'Wolfratshausen', '08171-23-0', '08171-23-1214', 'Herr', 'Dr.', 'Stefan', 'Sacré', 'info@de.eagleburgmann.com', 'http://www.eagleburgmann.com/', 'Deutschland', 'Maschinenbau', 'C 1000-5000', '679', 'Bayern', 'new', 0, 0, '2016-05-24 08:17:20'),
(1526, 15, 'Schuhhaus Klauser GmbH & Co. KG', 'Wasserstr. 29', '42283', 'Wuppertal', '0202-55119-0', '0202-593556', 'Herr', '', 'Peter', 'Prange', 'info@klauser-schuhe.de', 'http://www.klauser-schuhe.de/', 'Deutschland', 'Mode & Lifestyle', 'C 1000-5000', '113', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1527, 15, 'Konditorei Brüder Oebel GmbH', 'Fronhofstr. 30', '52146', 'Würselen', '0221-9878431', '0221-987872', 'Herr', '', 'Lothar', 'Mainz', 'shop@oebel.de', 'http://www.oebel.de/', 'Deutschland', 'Lebensmittelhandel', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20'),
(1528, 15, 'Kronenbrot KG Franz Mainz', 'Fronhofstr. 30', '52146', 'Würselen', '02405-484-0', '02405-484-117', 'Herr', '', 'Lothar', 'Mainz', 'info@kronenbrot.de', 'http://www.kronenbrot.de', 'Deutschland', 'Lebensmittelindustrie', 'C 1000-5000', '0', 'Nordrhein-Westfalen', 'new', 0, 0, '2016-05-24 08:17:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_changes`
--

CREATE TABLE `customer_changes` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `table_field` text COLLATE utf8_bin NOT NULL,
  `value_old` text COLLATE utf8_bin NOT NULL,
  `value_new` text COLLATE utf8_bin NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer_changes`
--

INSERT INTO `customer_changes` (`customer_id`, `user_id`, `table_field`, `value_old`, `value_new`, `change_date`) VALUES
(1070, 1, 'title', '', 'Dr', '2016-04-19 14:11:47'),
(1070, 1, 'title', '', 'All', '2016-04-19 14:13:37'),
(1070, 1, 'first_name', 'Jörg', 'Joerg', '2016-04-19 14:13:37'),
(1070, 1, 'title', 'All', '', '2016-04-19 14:21:55'),
(1070, 1, 'first_name', 'Joerg', 'Jörg', '2016-04-19 14:21:55'),
(1070, 1, 'title', '', 'Dr.', '2016-04-19 14:22:44'),
(1070, 1, 'title', 'Dr.', '', '2016-04-19 14:22:55'),
(779, 1, 'street', 'Berliner Str. 43', 'Berliner Straße 43', '2016-04-26 10:14:37'),
(1086, 5, 'last_name', 'Abeln', 'Schneider', '2016-05-24 08:42:58');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_info`
--

CREATE TABLE `customer_info` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `info` text COLLATE utf8_bin NOT NULL,
  `info_typ` text COLLATE utf8_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer_info`
--

INSERT INTO `customer_info` (`customer_id`, `user_id`, `info`, `info_typ`, `create_date`) VALUES
(797, 1, 'Eine Info', 'user_text', '2016-04-05 09:24:13'),
(797, 1, 'Eine Info', 'user_text', '2016-04-05 09:24:50'),
(797, 1, 'eine Info oder so', 'user_text', '2016-04-05 09:39:33'),
(0, 1, 'Update resubmission to 2016-04-12 on 17:15', 'system', '2016-04-12 15:10:45'),
(0, 0, 'Unset resubmission', 'system', '2016-04-12 15:29:18'),
(912, 0, 'Resubmission time expired', 'system', '2016-04-12 15:32:52'),
(912, 0, 'Resubmission time expired', 'system', '2016-04-12 15:33:00'),
(912, 1, 'Set resubmission to 2016-04-13 on 17:00', 'system', '2016-04-12 15:33:00'),
(912, 0, 'Resubmission time expired', 'system', '2016-04-12 15:33:05'),
(1075, 1, 'Set resubmission to 2016-04-13 on 17:00', 'system', '2016-04-12 15:33:40'),
(944, 1, 'Set resubmission to 2016-04-13 on 17:00', 'system', '2016-04-12 15:34:11'),
(918, 1, 'Set resubmission to 2016-04-13 on 17:00', 'system', '2016-04-12 15:35:57'),
(998, 2, 'Set resubmission to 2016-04-18 on 14:00', 'system', '2016-04-15 12:19:07'),
(998, 2, 'Eine Info', 'user_text', '2016-04-15 12:19:22'),
(918, 0, 'Resubmission time expired', 'system', '2016-04-15 12:20:17'),
(918, 0, 'Resubmission time expired', 'system', '2016-04-15 12:20:20'),
(918, 0, 'Resubmission time expired', 'system', '2016-04-15 12:20:29'),
(918, 1, 'Set resubmission to 2016-04-15 on 16:00', 'system', '2016-04-15 12:20:29'),
(918, 0, 'Resubmission time expired', 'system', '2016-04-15 12:20:45'),
(918, 1, 'Resubmission geändert', 'user_text', '2016-04-15 12:20:45'),
(1075, 0, 'Resubmission time expired', 'system', '2016-04-18 08:05:01'),
(1075, 0, 'Resubmission time expired', 'system', '2016-04-18 08:10:29'),
(944, 0, 'Resubmission time expired', 'system', '2016-04-18 08:10:36'),
(944, 1, 'Set resubmission to 2016-04-18 on 11:00', 'system', '2016-04-18 08:10:54'),
(1070, 1, 'Edit some customer values', 'user_change', '2016-04-19 14:13:37'),
(1070, 1, 'Edit some customer values', 'user_change', '2016-04-19 14:21:55'),
(1070, 1, 'Edit some customer values', 'user_change', '2016-04-19 14:22:44'),
(1070, 1, 'Edit some customer values', 'user_change', '2016-04-19 14:22:55'),
(1070, 1, 'Set resubmission to 2016-04-20 on 16:00', 'user_change', '2016-04-19 14:23:16'),
(1070, 1, 'Info Text', 'user_text', '2016-04-19 14:23:42'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-19 14:25:15'),
(1070, 1, 'Set resubmission to 2016-04-20 on 16:00', 'user_change', '2016-04-19 14:27:56'),
(1070, 1, 'nochmal text', 'user_text', '2016-04-19 14:28:06'),
(1070, 1, 'Unset resubmission befor time expired', 'user_change', '2016-04-19 14:28:27'),
(1070, 1, 'Set resubmission to 2016-04-20 on 12:00', 'user_change', '2016-04-19 14:29:38'),
(1070, 1, 'Update resubmission to 2016-04-20 on 13:00', 'user_change', '2016-04-19 14:39:12'),
(801, 1, 'Set resubmission to 2016-04-20 on 16:00', 'user_change', '2016-04-19 14:44:45'),
(1075, 1, 'Set resubmission to 2016-04-21 on 07:00', 'user_change', '2016-04-20 05:49:46'),
(1075, 1, 'Update resubmission to 2016-04-21 on 08:00', 'user_change', '2016-04-20 06:16:20'),
(1070, 1, 'Unset resubmission befor time expired', 'user_change', '2016-04-20 09:35:22'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:40:48'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:41:07'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:42:09'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:43:13'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:43:16'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:44:11'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:51:16'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:51:20'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:51:24'),
(1070, 0, 'Resubmission time expired', 'system', '2016-04-20 09:51:46'),
(1075, 0, 'Resubmission time expired', 'system', '2016-04-26 08:55:36'),
(1075, 1, 'Set resubmission to 2016-04-27 on 10:00', 'user_change', '2016-04-26 08:56:25'),
(1075, 1, 'Und noch eine kleine Info für die anderen', 'user_text', '2016-04-26 08:58:03'),
(998, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:18'),
(944, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:18'),
(801, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:18'),
(998, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:55'),
(944, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:55'),
(801, 0, 'Resubmission time expired', 'system', '2016-04-26 09:19:55'),
(998, 0, 'Resubmission time expired', 'system', '2016-04-26 09:21:15'),
(944, 0, 'Resubmission time expired', 'system', '2016-04-26 09:21:15'),
(801, 0, 'Resubmission time expired', 'system', '2016-04-26 09:21:15'),
(998, 0, 'Resubmission time expired', 'system', '2016-04-26 09:29:25'),
(944, 0, 'Resubmission time expired', 'system', '2016-04-26 09:29:25'),
(801, 0, 'Resubmission time expired', 'system', '2016-04-26 09:29:25'),
(779, 1, 'Edit some customer values', 'user_change', '2016-04-26 10:14:37'),
(1075, 0, 'Resubmission time expired', 'system', '2016-04-27 08:24:08'),
(1075, 5, 'Set resubmission to 2016-05-24 on 12:00', 'user_change', '2016-05-24 08:30:44'),
(1075, 5, 'Unset resubmission befor time expired', 'user_change', '2016-05-24 08:40:24'),
(1086, 5, 'Edit some customer values', 'user_change', '2016-05-24 08:42:58'),
(965, 1, 'Set resubmission to 2016-06-03 on 14:00', 'user_change', '2016-06-02 12:07:30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_lock`
--

CREATE TABLE `customer_lock` (
  `customer_id` int(11) NOT NULL,
  `lock_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer_lock`
--

INSERT INTO `customer_lock` (`customer_id`, `lock_time`, `user_id`) VALUES
(923, '2016-06-08 16:12:38', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_resubmission`
--

CREATE TABLE `customer_resubmission` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `expired` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer_resubmission`
--

INSERT INTO `customer_resubmission` (`id`, `project_id`, `customer_id`, `priority`, `user_id`, `date`, `time`, `expired`, `timestamp`) VALUES
(11, 10, 998, 0, 2, '2016-04-18', '14:00:00', 1, '2016-04-15 12:19:07'),
(12, 10, 944, 0, 1, '2016-04-18', '11:00:00', 1, '2016-04-18 08:10:54'),
(16, 10, 801, 0, 1, '2016-04-20', '16:00:00', 1, '2016-04-19 14:44:45'),
(20, 10, 965, 0, 1, '2016-06-03', '14:00:00', 0, '2016-06-02 12:07:30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_time_info`
--

CREATE TABLE `customer_time_info` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `stop_time` time NOT NULL,
  `total_time` int(11) NOT NULL,
  `date` date NOT NULL,
  `typ` text COLLATE utf8_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `info` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `customer_time_info`
--

INSERT INTO `customer_time_info` (`id`, `project_id`, `customer_id`, `user_id`, `start_time`, `stop_time`, `total_time`, `date`, `typ`, `timestamp`, `info`) VALUES
(1, 10, 797, 1, '12:07:08', '12:09:06', 118, '2016-04-05', 'outbound', '2016-04-05 10:09:06', '4. Outbound Call'),
(2, 10, 797, 1, '12:09:09', '12:09:10', 1, '2016-04-05', 'outbound', '2016-04-05 10:09:10', '5. Outbound Call'),
(3, 10, 797, 1, '12:09:12', '12:09:13', 1, '2016-04-05', 'outbound', '2016-04-05 10:09:13', '6. Outbound Call'),
(4, 10, 797, 1, '12:09:14', '12:09:15', 1, '2016-04-05', 'outbound', '2016-04-05 10:09:15', '7. Outbound Call'),
(5, 10, 797, 1, '12:09:17', '12:09:18', 1, '2016-04-05', 'outbound', '2016-04-05 10:09:18', '8. Outbound Call'),
(6, 10, 912, 1, '14:11:52', '14:13:58', 126, '2016-04-12', 'outbound', '2016-04-12 12:13:58', '1. Outbound Call'),
(7, 10, 971, 1, '17:07:40', '17:10:22', 162, '2016-04-12', 'outbound', '2016-04-12 15:10:22', '1. Outbound Call'),
(8, 10, 971, 1, '17:10:35', '17:10:53', 18, '2016-04-12', 'outbound', '2016-04-12 15:10:53', '2. Outbound Call'),
(9, 10, 971, 1, '17:14:52', '17:14:59', 7, '2016-04-12', 'outbound', '2016-04-12 15:14:59', '3. Outbound Call'),
(10, 10, 912, 1, '17:29:18', '17:33:05', 227, '2016-04-12', 'outbound', '2016-04-12 15:33:05', '2. Outbound Call'),
(11, 10, 1075, 1, '17:33:36', '17:34:00', 24, '2016-04-12', 'outbound', '2016-04-12 15:34:00', '1. Outbound Call'),
(12, 10, 944, 1, '17:34:07', '17:34:27', 20, '2016-04-12', 'outbound', '2016-04-12 15:34:27', '1. Outbound Call'),
(13, 10, 918, 1, '17:35:52', '17:36:02', 10, '2016-04-12', 'outbound', '2016-04-12 15:36:02', '1. Outbound Call'),
(14, 10, 1052, 1, '11:34:52', '11:35:00', 8, '2016-04-13', 'outbound', '2016-04-13 09:35:00', '1. Outbound Call'),
(15, 10, 998, 2, '14:18:47', '14:19:22', 35, '2016-04-15', 'outbound', '2016-04-15 12:19:22', '1. Outbound Call'),
(16, 10, 918, 1, '14:20:17', '14:20:45', 28, '2016-04-15', 'outbound', '2016-04-15 12:20:45', '2. Outbound Call'),
(17, 10, 944, 1, '10:10:36', '10:10:59', 23, '2016-04-18', 'outbound', '2016-04-18 08:10:59', '2. Outbound Call'),
(18, 10, 1070, 1, '16:05:38', '16:23:42', 1084, '2016-04-19', 'outbound', '2016-04-19 14:23:42', '1. Outbound Call'),
(19, 10, 1070, 1, '16:25:15', '16:28:06', 171, '2016-04-19', 'outbound', '2016-04-19 14:28:06', '2. Outbound Call'),
(20, 10, 801, 1, '16:44:35', '16:45:05', 30, '2016-04-19', 'outbound', '2016-04-19 14:45:05', '1. Outbound Call'),
(21, 10, 1075, 1, '07:49:32', '08:20:40', 1868, '2016-04-20', 'outbound', '2016-04-20 06:20:40', '2. Outbound Call'),
(22, 10, 918, 1, '08:20:46', '08:23:18', 152, '2016-04-20', 'outbound', '2016-04-20 06:23:18', '3. Outbound Call'),
(23, 10, 1075, 1, '10:55:36', '10:58:03', 147, '2016-04-26', 'outbound', '2016-04-26 08:58:03', '3. Outbound Call'),
(24, 10, 1075, 5, '10:26:52', '10:31:02', 250, '2016-05-24', 'outbound', '2016-05-24 08:31:02', '4. Outbound Call'),
(25, 10, 1075, 5, '10:40:24', '10:41:10', 46, '2016-05-24', 'outbound', '2016-05-24 08:41:10', '5. Outbound Call'),
(26, 10, 1086, 5, '10:41:14', '10:53:33', 739, '2016-05-24', 'outbound', '2016-05-24 08:53:33', '4. Outbound Call'),
(27, 10, 974, 5, '10:55:34', '11:03:10', 456, '2016-05-24', 'outbound', '2016-05-24 09:03:10', '1. Outbound Call'),
(28, 10, 965, 1, '14:07:11', '14:07:34', 23, '2016-06-02', 'outbound', '2016-06-02 12:07:34', '1. Outbound Call');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `image` text COLLATE utf8_bin NOT NULL,
  `client` text COLLATE utf8_bin NOT NULL,
  `project_manager` text COLLATE utf8_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `image`, `client`, `project_manager`, `create_date`) VALUES
(1, 'My Poroject', 'My first Project for testing this tool', '', 'CFC GmbH', 'Christian Barth', '2016-01-28 16:43:11'),
(10, 'CFC Outbound', 'Programierung', '', 'CFC GmbH', 'Christian Barth', '2016-02-03 11:01:59'),
(15, 'MITENANT', 'dsfiljf lijf l', '', 'MITENANT', 'Kerstin Schwarz', '2016-02-11 10:49:02');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `project_customer`
--

CREATE TABLE `project_customer` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `status` text COLLATE utf8_bin NOT NULL,
  `calls` int(11) NOT NULL,
  `resubmission` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `project_right`
--

CREATE TABLE `project_right` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `account_group_id` int(11) NOT NULL DEFAULT '0',
  `read` int(11) NOT NULL DEFAULT '0',
  `edit` int(11) NOT NULL DEFAULT '0',
  `report` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `project_right`
--

INSERT INTO `project_right` (`id`, `project_id`, `account_id`, `account_group_id`, `read`, `edit`, `report`) VALUES
(1, 1, 1, 0, 0, 0, 0),
(37, 10, 1, 0, 0, 0, 0),
(38, 10, 2, 0, 1, 1, 1),
(39, 10, 3, 0, 1, 0, 0),
(40, 1, 2, 0, 1, 0, 0),
(41, 1, 3, 0, 0, 0, 0),
(42, 15, 4, 0, 1, 1, 1),
(43, 10, 4, 0, 1, 1, 0),
(44, 10, 5, 0, 1, 1, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);
ALTER TABLE `customer` ADD FULLTEXT KEY `status` (`status`);

--
-- Indizes für die Tabelle `customer_changes`
--
ALTER TABLE `customer_changes`
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `customer_info`
--
ALTER TABLE `customer_info`
  ADD KEY `customer_id` (`customer_id`);
ALTER TABLE `customer_info` ADD FULLTEXT KEY `info_typ` (`info_typ`);

--
-- Indizes für die Tabelle `customer_resubmission`
--
ALTER TABLE `customer_resubmission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `customer_time_info`
--
ALTER TABLE `customer_time_info`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `project_customer`
--
ALTER TABLE `project_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `project_right`
--
ALTER TABLE `project_right`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`,`account_group_id`,`project_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1529;
--
-- AUTO_INCREMENT für Tabelle `customer_resubmission`
--
ALTER TABLE `customer_resubmission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT für Tabelle `customer_time_info`
--
ALTER TABLE `customer_time_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT für Tabelle `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT für Tabelle `project_customer`
--
ALTER TABLE `project_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `project_right`
--
ALTER TABLE `project_right`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
