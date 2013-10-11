-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 11 Octobre 2013 à 17:23
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `begl`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur_chaine_instruction`
--

CREATE TABLE IF NOT EXISTS `acteur_chaine_instruction` (
  `CIN` int(11) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `DEPARTEMENT` varchar(100) DEFAULT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `MOT_PASSE` varchar(50) DEFAULT NULL,
  `DESICION` varchar(100) DEFAULT NULL,
  `AVIS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CIN`),
  UNIQUE KEY `ACTEUR_CHAINE_INSTRUCTION_PK` (`CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `IDA` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `CHEMIN` varchar(1000) DEFAULT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `IDF` int(11) NOT NULL,
  PRIMARY KEY (`IDA`),
  UNIQUE KEY `ARTICLE_PK` (`IDA`),
  KEY `SE_COMPOSE_FK` (`IDF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_chercheur`
--

CREATE TABLE IF NOT EXISTS `enseignant_chercheur` (
  `CIN_E` int(11) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `DEPARTEMENT` varchar(100) DEFAULT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `MOT_PASSE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CIN_E`),
  UNIQUE KEY `ENSEIGNANT_CHERCHEUR_PK` (`CIN_E`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `IDF` int(11) NOT NULL,
  `CIN` int(11) DEFAULT NULL,
  `CIN_E` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `ETAT` varchar(100) DEFAULT NULL,
  `DATEDEB` date DEFAULT NULL,
  PRIMARY KEY (`IDF`),
  UNIQUE KEY `FORMULAIRE_PK` (`IDF`),
  KEY `GERE_FK` (`CIN`),
  KEY `REMPLIE_FK` (`CIN_E`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`IDF`) REFERENCES `projet` (`IDF`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `acteur_chaine_instruction` (`CIN`),
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`CIN_E`) REFERENCES `enseignant_chercheur` (`CIN_E`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
