-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 16 sep. 2024 à 16:14
-- Version du serveur : 8.0.31
-- Version de PHP : 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `serfa_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
CREATE TABLE IF NOT EXISTS `acteur` (
  `acteur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''acteur',
  `acteur_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''acteur',
  PRIMARY KEY (`acteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `auteur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''auteur',
  `auteur_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''auteur',
  PRIMARY KEY (`auteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categoriser`
--

DROP TABLE IF EXISTS `categoriser`;
CREATE TABLE IF NOT EXISTS `categoriser` (
  `cat_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la catégorisation',
  `cat_prod_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers prod_id',
  `cat_genre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers genre_id',
  PRIMARY KEY (`cat_id`),
  KEY `cat_prod_id` (`cat_prod_id`),
  KEY `cat_genre_id` (`cat_genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `cl_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client',
  `cl_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du client (particulier ou pro)',
  `cl_adresse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Adresse du client',
  `cl_mail` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Adresse mail',
  `cl_tel` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Numéro de téléphone',
  `cl_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création',
  `cl_modification` datetime DEFAULT NULL COMMENT 'Date de modification',
  `cl_mdp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mot de passe "haché"',
  `cl_ville_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers ville_id',
  PRIMARY KEY (`cl_id`),
  UNIQUE KEY `cl_mail` (`cl_mail`),
  UNIQUE KEY `cl_mail_2` (`cl_mail`),
  KEY `cl_ville_id` (`cl_ville_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `disque`
--

DROP TABLE IF EXISTS `disque`;
CREATE TABLE IF NOT EXISTS `disque` (
  `disque_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du disque\r\nClé étrangère vers prod_id',
  `disque_format` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Format du disque',
  PRIMARY KEY (`disque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

DROP TABLE IF EXISTS `ecrire`;
CREATE TABLE IF NOT EXISTS `ecrire` (
  `ecrire_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''écriture',
  `ecrire_livre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers livre_id',
  `ecrire_auteur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers auteur_id',
  PRIMARY KEY (`ecrire_id`),
  KEY `ecrire_auteur_id` (`ecrire_auteur_id`),
  KEY `ecrire_livre_id` (`ecrire_livre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `editer`
--

DROP TABLE IF EXISTS `editer`;
CREATE TABLE IF NOT EXISTS `editer` (
  `editer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''édition',
  `editer_livre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers livre_id',
  `editer_editeur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers editeur_id',
  PRIMARY KEY (`editer_id`),
  KEY `editer_livre_id` (`editer_livre_id`),
  KEY `editer_editeur_id` (`editer_editeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `editeur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''éditeur',
  `editeur_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''éditeur',
  PRIMARY KEY (`editeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `emprunt_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''emprunt',
  `emprunt_date` datetime NOT NULL COMMENT 'Date et heure de l''emprunt',
  `emprunt_retour` datetime DEFAULT NULL COMMENT 'Date et heure de retour',
  `emprunt_recupere` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Est-ce que la réservation a été récupérée ?',
  `emprunt_cl_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers cl_id',
  `emprunt_prod_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers prod_id',
  PRIMARY KEY (`emprunt_id`),
  KEY `emprunt_cl_id` (`emprunt_cl_id`),
  KEY `emprunt_prod_id` (`emprunt_prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `film_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du film\r\nClé étrangère vers prod_id',
  `film_duree` time NOT NULL COMMENT 'Durée du film',
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du genre',
  `genre_lib` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Libellé du genre',
  `genre_parent` int UNSIGNED DEFAULT NULL COMMENT 'Clé étrangère vers genre_id',
  PRIMARY KEY (`genre_id`),
  KEY `fk_genre_parent` (`genre_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
CREATE TABLE IF NOT EXISTS `jouer` (
  `jouer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''association jouer - acteur',
  `jouer_film_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers film_id',
  `jouer_acteur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers acteur_id',
  PRIMARY KEY (`jouer_id`),
  KEY `jouer_film_id` (`jouer_film_id`),
  KEY `jouer_acteur_id` (`jouer_acteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `livre_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du livre\r\nClé étrangère vers prod_id',
  `livre_nb_pages` int NOT NULL COMMENT 'Nombre de pages ',
  PRIMARY KEY (`livre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `part`
--

DROP TABLE IF EXISTS `part`;
CREATE TABLE IF NOT EXISTS `part` (
  `part_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du client particulier\r\nClé étrangère vers cl_id',
  `part_civilite` enum('M','Mme','Autre') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Civilité',
  `part_prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Prénom du client',
  `part_date_naiss` date NOT NULL COMMENT 'Date de naissance',
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pro`
--

DROP TABLE IF EXISTS `pro`;
CREATE TABLE IF NOT EXISTS `pro` (
  `pro_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du client particulier\r\nClé étrangère vers cl_id',
  `pro_siret` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Numéro de SIRET',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `prod_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du produit',
  `prod_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du produit',
  `prod_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Description du produit',
  `prod_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nom de l''image du produit',
  `prod_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Référence du produit',
  `prod_stock` int NOT NULL DEFAULT '1' COMMENT 'Nombre en stock',
  `prod_parution` date NOT NULL COMMENT 'Date de parution',
  `prod_delai` int NOT NULL COMMENT 'Délai max de retour de l''emprunt en nombre de jours',
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `realisateur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du réalisateur',
  `realisateur_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du réalisateur',
  PRIMARY KEY (`realisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
CREATE TABLE IF NOT EXISTS `realiser` (
  `realiser_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la réalisation',
  `realiser_film_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers film_id',
  `realiser_realisateur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers realisateur_id',
  PRIMARY KEY (`realiser_id`),
  KEY `realiser_film_id` (`realiser_film_id`),
  KEY `realiser_realisateur_id` (`realiser_realisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `ville_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la ville',
  `ville_cp` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Code postal',
  `ville_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ville',
  PRIMARY KEY (`ville_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categoriser`
--
ALTER TABLE `categoriser`
  ADD CONSTRAINT `categoriser_ibfk_1` FOREIGN KEY (`cat_prod_id`) REFERENCES `produit` (`prod_id`),
  ADD CONSTRAINT `categoriser_ibfk_2` FOREIGN KEY (`cat_genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cl_ville_id`) REFERENCES `ville` (`ville_id`);

--
-- Contraintes pour la table `disque`
--
ALTER TABLE `disque`
  ADD CONSTRAINT `fk_disque_produit` FOREIGN KEY (`disque_id`) REFERENCES `produit` (`prod_id`);

--
-- Contraintes pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD CONSTRAINT `ecrire_ibfk_1` FOREIGN KEY (`ecrire_auteur_id`) REFERENCES `auteur` (`auteur_id`),
  ADD CONSTRAINT `ecrire_ibfk_2` FOREIGN KEY (`ecrire_livre_id`) REFERENCES `livre` (`livre_id`);

--
-- Contraintes pour la table `editer`
--
ALTER TABLE `editer`
  ADD CONSTRAINT `editer_ibfk_1` FOREIGN KEY (`editer_livre_id`) REFERENCES `livre` (`livre_id`),
  ADD CONSTRAINT `editer_ibfk_2` FOREIGN KEY (`editer_editeur_id`) REFERENCES `editeur` (`editeur_id`);

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`emprunt_cl_id`) REFERENCES `client` (`cl_id`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`emprunt_prod_id`) REFERENCES `produit` (`prod_id`);

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk_film_produit` FOREIGN KEY (`film_id`) REFERENCES `produit` (`prod_id`);

--
-- Contraintes pour la table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `fk_genre_parent` FOREIGN KEY (`genre_parent`) REFERENCES `genre` (`genre_id`);

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`jouer_film_id`) REFERENCES `film` (`film_id`),
  ADD CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`jouer_acteur_id`) REFERENCES `acteur` (`acteur_id`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_livre_produit` FOREIGN KEY (`livre_id`) REFERENCES `produit` (`prod_id`);

--
-- Contraintes pour la table `part`
--
ALTER TABLE `part`
  ADD CONSTRAINT `fk_part_client` FOREIGN KEY (`part_id`) REFERENCES `client` (`cl_id`);

--
-- Contraintes pour la table `pro`
--
ALTER TABLE `pro`
  ADD CONSTRAINT `fk_pro_client` FOREIGN KEY (`pro_id`) REFERENCES `client` (`cl_id`);

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `realiser_ibfk_1` FOREIGN KEY (`realiser_film_id`) REFERENCES `film` (`film_id`),
  ADD CONSTRAINT `realiser_ibfk_2` FOREIGN KEY (`realiser_realisateur_id`) REFERENCES `realisateur` (`realisateur_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
