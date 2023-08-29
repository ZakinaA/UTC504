-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 09 sep. 2022 à 06:16
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `poudlardlic`
--

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `matiere_id` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_compet_matiere` (`matiere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`id`, `libelle`, `description`, `matiere_id`) VALUES
(1, 'Connaissances en magie noire', 'Pour comprendre des phénomènes de magie noire observés, identifier des rituels interdits, comprendre les livres de magie noire avancés…. ', 'DEF'),
(2, 'Sang-froid', 'Pour résister à l’intimidation, la peur, ou certains sorts ', 'DEF'),
(3, 'Legilimencie', 'Lire les esprits et y résister ', 'DEF'),
(4, 'Arithmancie', 'Mathématiques et enchantement complexes d’objet. Peut être combiné avec de la divination. ', 'SOR'),
(5, 'Connaissance des plantes et minéraux', ' Reconnaissance des spécimens et connaissance de leurs propriétés, utile aussi bien dans la nature qu’en cours de potions, pour toutes les actions en rapport avec les plantes', 'MET'),
(13, 'Connaissances des runes', 'Savoir déchiffrer et interpréter les runes, un ancien alphabet sorcier. Englobe la connaissance des objets enchantés grâce à ces runes il y a de nombreuses années.', 'POT'),
(14, 'Divination/Astronomie', 'Savoir lire des signes prémonitoires, avoir des éléments d’interprétation des étoiles et des prophéties, savoir s’orienter la nuit avec les étoiles.', 'XYZ'),
(15, 'Contrôle/Visée', ' Pour maintenir certains sorts actifs sans en perdre le contrôle et pour être précis dans le jet du sort', 'MET');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naiss` date NOT NULL,
  `chemin_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maison_id` int(11) NOT NULL,
  `statut_id` int(11) DEFAULT NULL,
  `patronus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_717E22E39D67D8AF` (`maison_id`),
  KEY `IDX_717E22E3F6203804` (`statut_id`),
  KEY `IDX_717E22E37602A6AC` (`patronus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `date_naiss`, `chemin_img`, `maison_id`, `statut_id`, `patronus_id`) VALUES
(1, 'Potter', 'Harry', '1980-07-31', '1.jpg', 1, 2, 1),
(2, 'Granger', 'Hermione', '1980-07-31', '2.jpg', 1, 1, 2),
(3, 'Weasley', 'Ron', '1980-07-31', '3.jpg', 2, 1, 3),
(4, 'Malfoy', 'Drago', '1979-08-20', '4.jpg', 2, 1, 5),
(5, 'Weasley', 'Fred', '1972-11-20', '5.jpg', 2, 1, 4),
(6, 'Weasley', 'Ginny', '1983-12-10', '6.jpg', 4, 1, 4),
(7, 'Lovegood', 'Luna', '1980-11-02', '7.jpg', 3, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `etudiant_id` int(11) NOT NULL,
  `matiere_id` varchar(3) NOT NULL,
  KEY `fk_etudiant` (`etudiant_id`),
  KEY `fk_matiere` (`matiere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`etudiant_id`, `matiere_id`) VALUES
(1, 'DEF'),
(1, 'MET'),
(1, 'POT'),
(2, 'DEF'),
(2, 'SOR'),
(3, 'DEF'),
(3, 'SOR'),
(4, 'DEF'),
(4, 'MET');

-- --------------------------------------------------------

--
-- Structure de la table `maison`
--

DROP TABLE IF EXISTS `maison`;
CREATE TABLE IF NOT EXISTS `maison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `maison`
--

INSERT INTO `maison` (`id`, `code`, `nom`) VALUES
(1, 'GFD', 'Griffondor'),
(2, 'SPT', 'Serpentard'),
(3, 'PFS', 'Poufsouffle'),
(4, 'SRD', 'Serdaigle');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `code` varchar(3) NOT NULL,
  `libelle` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`code`, `libelle`, `description`) VALUES
('DEF', 'Défense contre les forces du mal ', 'Il s’agit d\'étudier la magie noire, les créatures des ténèbres et la façon de les affronter. '),
('MET', 'Métamorphose ', 'La métamorphose est une matière magique difficile, on y apprend à métamorphoser les objets, les animaux et les êtres humains. '),
('POT', 'Potions et arts mystiques ', 'Préparation des potions, des élixirs et d\'autres breuvages magiques. Les Arts Mystiques englobent les runes (arithmancie) et la divination '),
('SOR', 'Sortilèges ', 'Il s’agit d’une forme d’ensorcellement consistant à envoûter un objet pour qu’il agisse d’une façon qui ne lui est pas propre.');

-- --------------------------------------------------------

--
-- Structure de la table `patronus`
--

DROP TABLE IF EXISTS `patronus`;
CREATE TABLE IF NOT EXISTS `patronus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chemin_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patronus`
--

INSERT INTO `patronus` (`id`, `nom`, `chemin_img`) VALUES
(1, 'cerf', 'patronus/cerf.jpg'),
(2, 'loutre', 'patronus/loutre.jpg'),
(3, 'Jack Terrier Rusell', 'patronus/terrier.jpg'),
(4, 'cheval', 'patronus/cheval.jpg'),
(5, 'hibou', 'patronus/hibou.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `nom`, `descriptif`) VALUES
(1, 'Sang-pur', 'Un sorcier dit de « sang-pur » (pure-blood en anglais) n\'a pour ancêtres que des sorciers.'),
(2, 'Sang-Mêlé', 'Un sorcier dit de « sang-mêlé » (half-blood en anglais) est un sorcier ayant un ancêtre moldu.'),
(3, 'Né-moldu', 'Un sorcier « né-Moldu » (muggle-born en anglais) est un sorcier dont les parents sont Moldus.'),
(4, 'Cracmol', 'Le terme « Cracmol » (squib en anglais, qui désigne un pétard) est employé pour désigner une personne appartenant à une famille de sorciers, mais pratiquement dépourvue de toute capacité magique'),
(5, 'Moldu', ' Moldu » (muggle en anglais) est un terme inventé par les sorciers pour désigner une personne ne possédant pas de pouvoirs magiques');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_717E22E37602A6AC` FOREIGN KEY (`patronus_id`) REFERENCES `patronus` (`id`),
  ADD CONSTRAINT `FK_717E22E39D67D8AF` FOREIGN KEY (`maison_id`) REFERENCES `maison` (`id`),
  ADD CONSTRAINT `FK_717E22E3F6203804` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `fk_etudiant` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `fk_matiere` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
