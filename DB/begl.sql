-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 11 Octobre 2013 à 15:33
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
  `CIN` int(11) NOT NULL DEFAULT '0',
  `NOM` varchar(100) DEFAULT NULL,
  `PRENOM` varchar(100) DEFAULT NULL,
  `DEPARTEMENT` varchar(100) DEFAULT NULL,
  `LOGIN` varchar(100) DEFAULT NULL,
  `PASSWD` varchar(100) DEFAULT NULL,
  `DECISION` text NOT NULL,
  `AVIS` text NOT NULL,
  PRIMARY KEY (`CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `IDA` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` date DEFAULT NULL,
  `CHEMIN` varchar(100) DEFAULT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_chercheur`
--

CREATE TABLE IF NOT EXISTS `enseignant_chercheur` (
  `CIN` int(11) NOT NULL DEFAULT '0',
  `NOM` varchar(100) DEFAULT NULL,
  `PRENOM` varchar(100) DEFAULT NULL,
  `DEPARTEMENT` varchar(100) DEFAULT NULL,
  `LOGIN` varchar(100) DEFAULT NULL,
  `PASSWD` varchar(100) DEFAULT NULL,
  `ETABLISSEMENT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `formulaire`
--

CREATE TABLE IF NOT EXISTS `formulaire` (
  `IDF` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_F` date DEFAULT NULL,
  PRIMARY KEY (`IDF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `IDP` int(11) NOT NULL AUTO_INCREMENT,
  `ETAT` varchar(100) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  PRIMARY KEY (`IDP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acteur_chaine_instruction`
--
ALTER TABLE `acteur_chaine_instruction`
  ADD CONSTRAINT `acteur_chaine_instruction_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `formulaire` (`IDF`);

--
-- Contraintes pour la table `enseignant_chercheur`
--
ALTER TABLE `enseignant_chercheur`
  ADD CONSTRAINT `enseignant_chercheur_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `formulaire` (`IDF`);

--
-- Contraintes pour la table `formulaire`
--
ALTER TABLE `formulaire`
  ADD CONSTRAINT `formulaire_ibfk_1` FOREIGN KEY (`IDF`) REFERENCES `projet` (`IDP`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`IDP`) REFERENCES `article` (`IDA`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
