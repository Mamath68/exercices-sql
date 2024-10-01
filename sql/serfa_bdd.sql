-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2024 at 12:05 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serfa_bdd`
--
-- --------------------------------------------------------
--
-- Table structure for table `acteur`
--
CREATE TABLE
  `acteur` (
    `acteur_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''acteur',
    `acteur_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''acteur'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `acteur`
--
INSERT INTO
  `acteur` (`acteur_id`, `acteur_nom`)
VALUES
  (1, 'Leonardo DiCaprio'),
  (2, 'Joseph Gordon-Levitt'),
  (3, 'Tom Hardy'),
  (4, 'Ellen Page'),
  (5, 'Matt Damon'),
  (6, 'Anne Hathaway'),
  (7, 'Christian Bale'),
  (8, 'Scarlett Johansson'),
  (9, 'Robert Downey Jr.'),
  (10, 'Chris Evans'),
  (11, 'Brad Pitt'),
  (12, 'Angelina Jolie'),
  (13, 'Joaquin Phoenix'),
  (14, 'Meryl Streep'),
  (15, 'Al Pacino'),
  (16, 'Robert De Niro'),
  (17, 'Jack Nicholson'),
  (18, 'Johnny Depp'),
  (19, 'Tom Hanks'),
  (20, 'Natalie Portman'),
  (21, 'Ryan Gosling'),
  (22, 'Emma Stone'),
  (23, 'Samuel L. Jackson'),
  (24, 'Denzel Washington'),
  (25, 'Morgan Freeman'),
  (26, 'Tim Robbins'),
  (27, 'Hugh Jackman'),
  (28, 'Harrison Ford');

-- --------------------------------------------------------
--
-- Table structure for table `auteur`
--
CREATE TABLE
  `auteur` (
    `auteur_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''auteur',
    `auteur_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''auteur'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `auteur`
--
INSERT INTO
  `auteur` (`auteur_id`, `auteur_nom`)
VALUES
  (1, 'Antoine de Saint-Exupéry'),
  (2, 'J.K. Rowling'),
  (3, 'George Orwell'),
  (4, 'Albert Camus'),
  (5, 'Victor Hugo'),
  (6, 'Fiodor Dostoïevski'),
  (7, 'Stendhal'),
  (8, 'Alexandre Dumas'),
  (9, 'J.R.R. Tolkien'),
  (10, 'Ernest Hemingway'),
  (11, 'Marcel Proust'),
  (12, 'Gabriel García Márquez'),
  (13, 'Jane Austen'),
  (14, 'Hermann Hesse'),
  (15, 'Franz Kafka'),
  (16, 'Mark Twain'),
  (17, 'William Shakespeare'),
  (18, 'Charles Dickens'),
  (19, 'Edgar Allan Poe'),
  (20, 'Arthur Conan Doyle'),
  (21, 'Haruki Murakami'),
  (22, 'Sylvia Plath'),
  (23, 'Virginia Woolf'),
  (24, 'Oscar Wilde'),
  (25, 'Jules Verne'),
  (26, 'Frank Herbert'),
  (27, 'Paulo Coelho'),
  (28, 'Jean-Paul Sartre');

-- --------------------------------------------------------
--
-- Table structure for table `categoriser`
--
CREATE TABLE
  `categoriser` (
    `cat_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de la catégorisation',
    `cat_prod_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers prod_id',
    `cat_genre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers genre_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `categoriser`
--
INSERT INTO
  `categoriser` (`cat_id`, `cat_prod_id`, `cat_genre_id`)
VALUES
  (1, 1, 8),
  (2, 2, 9),
  (3, 2, 11),
  (4, 3, 12),
  (5, 4, 13),
  (6, 4, 14),
  (7, 5, 9),
  (8, 5, 15),
  (9, 6, 16),
  (10, 7, 17),
  (11, 8, 9),
  (12, 8, 11),
  (13, 8, 14),
  (14, 9, 12),
  (15, 10, 18),
  (16, 10, 17),
  (17, 11, 18),
  (18, 12, 19),
  (19, 12, 18),
  (20, 14, 18),
  (21, 15, 9),
  (22, 15, 14),
  (23, 15, 20),
  (24, 16, 21),
  (25, 17, 17),
  (26, 18, 19),
  (27, 18, 14),
  (28, 20, 13),
  (29, 20, 14),
  (31, 22, 18),
  (32, 22, 11),
  (33, 24, 19),
  (34, 24, 17),
  (35, 25, 11),
  (36, 32, 9),
  (38, 32, 21),
  (39, 33, 17),
  (40, 33, 22),
  (41, 35, 19),
  (42, 36, 11),
  (43, 37, 11),
  (44, 37, 9);

-- --------------------------------------------------------
--
-- Table structure for table `client`
--
CREATE TABLE
  `client` (
    `cl_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du client',
    `cl_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du client (particulier ou pro)',
      `cl_adresse` text CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Adresse du client',
      `cl_mail` varchar(320) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Adresse mail',
      `cl_tel` char(10) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Numéro de téléphone',
      `cl_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création',
      `cl_modification` datetime DEFAULT NULL COMMENT 'Date de modification',
      `cl_mdp` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mot de passe "haché"',
      `cl_ville_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers ville_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `client`
--
INSERT INTO
  `client` (
    `cl_id`,
    `cl_nom`,
    `cl_adresse`,
    `cl_mail`,
    `cl_tel`,
    `cl_creation`,
    `cl_modification`,
    `cl_mdp`,
    `cl_ville_id`
  )
VALUES
  (
    1,
    'Dupont',
    '12 rue de Rivoli, 75001 Paris',
    'dupont@gmail.com',
    '0102030405',
    '2023-01-10 14:30:00',
    NULL,
    'mdpHash1',
    1
  ),
  (
    2,
    'Martin',
    '34 rue de la République, 69001 Lyon',
    'martin@hotmail.com',
    '0607080910',
    '2023-02-15 10:25:00',
    NULL,
    'mdpHash2',
    2
  ),
  (
    3,
    'Durand',
    '50 rue Sainte-Catherine, 33000 Bordeaux',
    'durand@yahoo.com',
    '0506070809',
    '2023-03-18 16:45:00',
    NULL,
    'mdpHash3',
    3
  ),
  (
    4,
    'Bernard',
    '22 rue Saint-Ferréol, 13001 Marseille',
    'bernard@gmail.com',
    '0405060708',
    '2023-04-20 09:50:00',
    NULL,
    'mdpHash4',
    4
  ),
  (
    5,
    'Petit',
    '89 rue d\'Alsace, 31000 Toulouse',
    'petit@outlook.com',
    '0203040506',
    '2023-05-25 11:00:00',
    NULL,
    'mdpHash5',
    5
  ),
  (
    6,
    'Robert',
    '76 rue de Béthune, 59000 Lille',
    'robert@orange.fr',
    '0801020304',
    '2023-06-30 08:40:00',
    NULL,
    'mdpHash6',
    6
  ),
  (
    7,
    'Richard',
    '13 rue des Frères Lumière, 67000 Strasbourg',
    'richard@hotmail.com',
    '0908070605',
    '2023-07-15 13:20:00',
    NULL,
    'mdpHash7',
    7
  ),
  (
    8,
    'Simon',
    '27 boulevard Louis Blanc, 34000 Montpellier',
    'simon@gmail.com',
    '0706050403',
    '2023-08-01 17:10:00',
    NULL,
    'mdpHash8',
    8
  ),
  (
    9,
    'Legrand',
    '10 avenue de la Loire, 44000 Nantes',
    'legrand@gmail.com',
    '0605040302',
    '2023-09-05 12:30:00',
    NULL,
    'mdpHash9',
    9
  ),
  (
    10,
    'Moreau',
    '5 rue de France, 06000 Nice',
    'moreau@hotmail.com',
    '0504030201',
    '2023-10-10 15:45:00',
    NULL,
    'mdpHash10',
    10
  ),
  (
    11,
    'Masson',
    '4 avenue Victor Hugo, 35000 Rennes',
    'masson@gmail.com',
    '0112233445',
    '2023-01-20 11:30:00',
    NULL,
    'mdpHash11',
    11
  ),
  (
    12,
    'Girard',
    '8 rue de Metz, 57000 Metz',
    'girard@hotmail.com',
    '0667788990',
    '2023-02-25 09:15:00',
    NULL,
    'mdpHash12',
    12
  ),
  (
    13,
    'Roche',
    '17 rue de la Liberté, 21000 Dijon',
    'roche@yahoo.com',
    '0526374859',
    '2023-03-30 14:55:00',
    NULL,
    'mdpHash13',
    13
  ),
  (
    14,
    'Perrin',
    '6 rue de Picardie, 80000 Amiens',
    'perrin@gmail.com',
    '0412233445',
    '2023-04-12 12:40:00',
    NULL,
    'mdpHash14',
    14
  ),
  (
    15,
    'Colin',
    '27 rue Nationale, 37000 Tours',
    'colin@outlook.com',
    '0223344556',
    '2023-05-08 13:50:00',
    NULL,
    'mdpHash15',
    15
  ),
  (
    16,
    'Fernandez',
    '3 rue Charles, 87000 Limoges',
    'fernandez@gmail.com',
    '0822334455',
    '2023-06-16 09:30:00',
    NULL,
    'mdpHash16',
    16
  ),
  (
    17,
    'Arnaud',
    '1 rue du Manège, 72000 Le Mans',
    'arnaud@hotmail.com',
    '0722334455',
    '2023-07-22 10:40:00',
    NULL,
    'mdpHash17',
    17
  ),
  (
    18,
    'Giraud',
    '9 rue Thiers, 38000 Grenoble',
    'giraud@orange.fr',
    '0323344455',
    '2023-08-28 08:20:00',
    NULL,
    'mdpHash18',
    18
  ),
  (
    19,
    'Perez',
    '14 rue de l\'Europe, 37000 Orléans',
    'perez@yahoo.com',
    '0522334455',
    '2023-09-10 14:25:00',
    NULL,
    'mdpHash19',
    19
  ),
  (
    20,
    'Marchand',
    '5 rue Voltaire, 62000 Arras',
    'marchand@gmail.com',
    '0423344455',
    '2023-10-15 09:55:00',
    NULL,
    'mdpHash20',
    20
  ),
  (
    21,
    'Blanc',
    '7 rue Lamartine, 83000 Toulon',
    'blanc@free.fr',
    '0645789123',
    '2023-11-10 08:00:00',
    NULL,
    'mdpHash21',
    21
  ),
  (
    22,
    'Meunier',
    '9 rue des Romains, 68100 Mulhouse',
    'meunier@laposte.net',
    '0345678234',
    '2023-11-20 16:30:00',
    NULL,
    'mdpHash22',
    22
  ),
  (
    23,
    'Langlois',
    '12 rue de l\'Industrie, 68110 Illzach',
    'langlois@gmail.com',
    '0654789124',
    '2023-12-05 13:10:00',
    NULL,
    'mdpHash23',
    23
  ),
  (
    24,
    'Lopez',
    '15 rue Jean Moulin, 68200 Colmar',
    'lopez@hotmail.com',
    '0954728361',
    '2023-12-10 11:45:00',
    NULL,
    'mdpHash24',
    24
  ),
  (
    25,
    'Brun',
    '17 boulevard Haussmann, 75009 Paris',
    'brun@gmail.com',
    '0754637289',
    '2023-12-18 09:20:00',
    NULL,
    'mdpHash25',
    25
  ),
  (
    26,
    'Dupont',
    '123 Rue de Paris',
    'dupont@example.com',
    '0123456789',
    '2024-09-17 11:51:18',
    NULL,
    'password123',
    26
  );

-- --------------------------------------------------------
--
-- Table structure for table `disque`
--
CREATE TABLE
  `disque` (
    `disque_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du disque\r\nClé étrangère vers prod_id',
    `disque_format` varchar(50) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Format du disque'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `disque`
--
INSERT INTO
  `disque` (`disque_id`, `disque_format`)
VALUES
  (3, 'Vinyle'),
  (6, 'CD'),
  (9, 'Vinyle'),
  (24, 'CD'),
  (25, 'CD'),
  (38, 'CD'),
  (39, 'Vinyle'),
  (40, 'CD');

-- --------------------------------------------------------
--
-- Table structure for table `ecrire`
--
CREATE TABLE
  `ecrire` (
    `ecrire_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''écriture',
    `ecrire_livre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers livre_id',
    `ecrire_auteur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers auteur_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `ecrire`
--
INSERT INTO
  `ecrire` (
    `ecrire_id`,
    `ecrire_livre_id`,
    `ecrire_auteur_id`
  )
VALUES
  (1, 1, 1),
  (2, 4, 2),
  (3, 7, 3),
  (4, 10, 4),
  (5, 11, 6),
  (8, 14, 8),
  (11, 17, 10),
  (14, 20, 12),
  (18, 24, 16),
  (19, 32, 26),
  (20, 33, 27),
  (21, 34, 28);

-- --------------------------------------------------------
--
-- Table structure for table `editer`
--
CREATE TABLE
  `editer` (
    `editer_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''édition',
    `editer_livre_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers livre_id',
    `editer_editeur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers editeur_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `editer`
--
INSERT INTO
  `editer` (
    `editer_id`,
    `editer_livre_id`,
    `editer_editeur_id`
  )
VALUES
  (1, 1, 1),
  (2, 4, 2),
  (3, 7, 3),
  (4, 10, 4),
  (5, 11, 5),
  (8, 14, 7),
  (11, 17, 10),
  (14, 20, 13),
  (18, 24, 17);

-- --------------------------------------------------------
--
-- Table structure for table `editeur`
--
CREATE TABLE
  `editeur` (
    `editeur_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''éditeur',
    `editeur_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom de l''éditeur'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `editeur`
--
INSERT INTO
  `editeur` (`editeur_id`, `editeur_nom`)
VALUES
  (1, 'Gallimard'),
  (2, 'Penguin Books'),
  (3, 'Hachette'),
  (4, 'Random House'),
  (5, 'HarperCollins'),
  (6, 'Flammarion'),
  (7, 'Le Seuil'),
  (8, 'Folio'),
  (9, 'Grasset'),
  (10, 'Simon & Schuster'),
  (11, 'Albin Michel'),
  (12, 'Hatier'),
  (13, 'Casterman'),
  (14, 'Michel Lafon'),
  (15, 'L\'Harmattan'),
  (16, 'Seuil Jeunesse'),
  (17, 'Bayard'),
  (18, 'Plon'),
  (19, 'Librairie Générale Française'),
  (20, 'Payot & Rivages'),
  (21, 'Actes Sud'),
  (22, 'Editions Belfond'),
  (23, 'Les Editions de Minuit'),
  (24, 'L\'École des loisirs'),
  (25, 'Rivages');

-- --------------------------------------------------------
--
-- Table structure for table `emprunt`
--
CREATE TABLE
  `emprunt` (
    `emprunt_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''emprunt',
    `emprunt_date` datetime NOT NULL COMMENT 'Date et heure de l''emprunt',
    `emprunt_retour` datetime DEFAULT NULL COMMENT 'Date et heure de retour',
    `emprunt_recupere` tinyint (1) NOT NULL DEFAULT '0' COMMENT 'Est-ce que la réservation a été récupérée ?',
    `emprunt_cl_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers cl_id',
    `emprunt_prod_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers prod_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `emprunt`
--
INSERT INTO
  `emprunt` (
    `emprunt_id`,
    `emprunt_date`,
    `emprunt_retour`,
    `emprunt_recupere`,
    `emprunt_cl_id`,
    `emprunt_prod_id`
  )
VALUES
  (
    1,
    '2023-01-15 10:00:00',
    '2023-02-15 10:00:00',
    0,
    1,
    1
  ),
  (
    2,
    '2023-03-12 15:30:00',
    '2023-04-12 15:30:00',
    1,
    2,
    2
  ),
  (3, '2023-05-20 09:00:00', NULL, 0, 3, 3),
  (
    4,
    '2023-06-05 11:00:00',
    '2023-07-05 11:00:00',
    1,
    4,
    4
  ),
  (
    5,
    '2023-07-18 14:00:00',
    '2023-08-18 14:00:00',
    0,
    5,
    5
  ),
  (
    6,
    '2023-08-25 16:45:00',
    '2023-09-25 16:45:00',
    1,
    6,
    6
  ),
  (7, '2023-09-10 13:30:00', NULL, 0, 7, 7),
  (
    8,
    '2023-10-02 10:15:00',
    '2023-11-02 10:15:00',
    1,
    8,
    8
  ),
  (
    9,
    '2023-11-15 12:30:00',
    '2023-12-15 12:30:00',
    0,
    9,
    9
  ),
  (
    10,
    '2023-12-01 09:45:00',
    '2024-01-01 09:45:00',
    1,
    10,
    10
  ),
  (
    11,
    '2023-02-01 14:30:00',
    '2023-03-01 14:30:00',
    1,
    11,
    11
  ),
  (
    12,
    '2023-04-10 09:45:00',
    '2023-05-10 09:45:00',
    0,
    12,
    12
  ),
  (
    13,
    '2023-06-15 13:15:00',
    '2023-07-15 13:15:00',
    1,
    13,
    13
  ),
  (14, '2023-08-05 11:00:00', NULL, 0, 14, 14),
  (
    15,
    '2023-09-18 16:00:00',
    '2023-10-18 16:00:00',
    1,
    15,
    15
  ),
  (
    16,
    '2023-11-05 15:00:00',
    '2023-12-05 15:00:00',
    0,
    16,
    16
  ),
  (17, '2024-01-01 09:30:00', NULL, 1, 17, 17),
  (
    18,
    '2024-02-12 13:45:00',
    '2024-03-12 13:45:00',
    0,
    18,
    18
  ),
  (
    19,
    '2024-03-28 10:30:00',
    '2024-04-28 10:30:00',
    1,
    19,
    19
  ),
  (
    20,
    '2024-04-15 17:00:00',
    '2024-05-15 17:00:00',
    0,
    20,
    20
  ),
  (
    22,
    '2024-06-10 14:15:00',
    '2024-07-10 14:15:00',
    0,
    22,
    22
  ),
  (
    23,
    '2024-07-01 15:30:00',
    '2024-08-01 15:30:00',
    1,
    23,
    23
  ),
  (
    24,
    '2024-08-18 09:00:00',
    '2024-09-18 09:00:00',
    0,
    24,
    24
  ),
  (
    25,
    '2024-09-30 10:50:00',
    '2024-10-30 10:50:00',
    1,
    25,
    25
  ),
  (26, '2024-09-17 09:53:45', NULL, 1, 26, 7),
  (27, '2024-09-17 09:53:45', NULL, 1, 26, 11);

-- --------------------------------------------------------
--
-- Table structure for table `film`
--
CREATE TABLE
  `film` (
    `film_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du film\r\nClé étrangère vers prod_id',
    `film_duree` time NOT NULL COMMENT 'Durée du film'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `film`
--
INSERT INTO
  `film` (`film_id`, `film_duree`)
VALUES
  (2, '02:28:00'),
  (5, '02:49:00'),
  (8, '02:16:00'),
  (18, '02:40:00'),
  (22, '01:56:00'),
  (25, '01:40:00'),
  (35, '02:22:00'),
  (36, '02:10:00'),
  (37, '01:57:00');

-- --------------------------------------------------------
--
-- Table structure for table `genre`
--
CREATE TABLE
  `genre` (
    `genre_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du genre',
    `genre_lib` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Libellé du genre',
      `genre_parent` int UNSIGNED DEFAULT NULL COMMENT 'Clé étrangère vers genre_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--
INSERT INTO
  `genre` (`genre_id`, `genre_lib`, `genre_parent`)
VALUES
  (1, 'Literature & Fiction', NULL),
  (2, 'Non-Fiction', NULL),
  (3, 'Historique & Guerre', NULL),
  (4, 'Animation & Jeunesse', NULL),
  (5, 'Action & Aventure', NULL),
  (6, 'Comédie & Drame', NULL),
  (8, 'Biographie', 2),
  (9, 'Science-fiction', 1),
  (10, 'Thriller & Policier', NULL),
  (11, 'Thriller', 10),
  (12, 'Comédie', 6),
  (13, 'Fantasy', 1),
  (14, 'Action', 5),
  (15, 'Guerre', 3),
  (16, 'Fantastique', 1),
  (17, 'Philosophie', 2),
  (18, 'Historique', 3),
  (19, 'Dramatique', 6),
  (20, 'Animation', 4),
  (21, 'Aventure', 5),
  (22, 'fiction', 1);

-- --------------------------------------------------------
--
-- Table structure for table `jouer`
--
CREATE TABLE
  `jouer` (
    `jouer_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de l''association jouer - acteur',
    `jouer_film_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers film_id',
    `jouer_acteur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers acteur_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `jouer`
--
INSERT INTO
  `jouer` (`jouer_id`, `jouer_film_id`, `jouer_acteur_id`)
VALUES
  (1, 2, 1),
  (2, 2, 2),
  (3, 5, 5),
  (4, 5, 6),
  (5, 8, 7),
  (6, 8, 8),
  (8, 18, 14),
  (12, 22, 11),
  (15, 25, 1),
  (16, 35, 26),
  (17, 36, 27),
  (20, 37, 28);

-- --------------------------------------------------------
--
-- Table structure for table `livre`
--
CREATE TABLE
  `livre` (
    `livre_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du livre\r\nClé étrangère vers prod_id',
    `livre_nb_pages` int NOT NULL COMMENT 'Nombre de pages '
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `livre`
--
INSERT INTO
  `livre` (`livre_id`, `livre_nb_pages`)
VALUES
  (1, 96),
  (4, 500),
  (7, 328),
  (10, 368),
  (11, 578),
  (14, 300),
  (17, 300),
  (20, 1200),
  (24, 410),
  (32, 412),
  (33, 208),
  (34, 230);

-- --------------------------------------------------------
--
-- Table structure for table `part`
--
CREATE TABLE
  `part` (
    `part_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du client particulier\r\nClé étrangère vers cl_id',
    `part_civilite` enum ('M', 'Mme', 'Autre') CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Civilité',
      `part_prenom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Prénom du client',
      `part_date_naiss` date NOT NULL COMMENT 'Date de naissance'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `part`
--
INSERT INTO
  `part` (
    `part_id`,
    `part_civilite`,
    `part_prenom`,
    `part_date_naiss`
  )
VALUES
  (1, 'M', 'Jean', '1980-05-12'),
  (2, 'Mme', 'Sophie', '1985-07-22'),
  (3, 'M', 'Paul', '1990-10-10'),
  (6, 'Mme', 'Julie', '1988-12-25'),
  (7, 'M', 'David', '1992-01-05'),
  (8, 'Mme', 'Emma', '1987-04-09'),
  (10, 'Mme', 'Laura', '1993-11-03'),
  (11, 'M', 'Vincent', '1982-05-02'),
  (14, 'Mme', 'Louise', '1989-12-15'),
  (15, 'M', 'Antoine', '1987-07-12'),
  (16, 'Mme', 'Elodie', '1992-03-17'),
  (17, 'M', 'Pierre', '1995-04-28'),
  (18, 'Mme', 'Manon', '1986-01-23'),
  (20, 'Mme', 'Lucie', '1990-10-15'),
  (23, 'M', 'François', '1989-07-11'),
  (25, 'M', 'Arthur', '1990-06-10'),
  (26, 'M', 'Jean', '1985-03-15');

-- --------------------------------------------------------
--
-- Table structure for table `pro`
--
CREATE TABLE
  `pro` (
    `pro_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du client particulier\r\nClé étrangère vers cl_id',
    `pro_siret` char(14) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Numéro de SIRET'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `pro`
--
INSERT INTO
  `pro` (`pro_id`, `pro_siret`)
VALUES
  (4, '98712345678901'),
  (5, '12345612345678'),
  (9, '32145678998765'),
  (12, '55443322110099'),
  (13, '66554433221100'),
  (19, '88997766554433'),
  (21, '12345987654321'),
  (22, '09876543211234'),
  (24, '77889911223344');

-- --------------------------------------------------------
--
-- Table structure for table `produit`
--
CREATE TABLE
  `produit` (
    `prod_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du produit',
    `prod_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du produit',
      `prod_desc` text CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Description du produit',
      `prod_image` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nom de l''image du produit',
      `prod_ref` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Référence du produit',
      `prod_stock` int NOT NULL DEFAULT '1' COMMENT 'Nombre en stock',
      `prod_parution` date NOT NULL COMMENT 'Date de parution',
      `prod_delai` int NOT NULL COMMENT 'Délai max de retour de l''emprunt en nombre de jours'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `produit`
--
INSERT INTO
  `produit` (
    `prod_id`,
    `prod_nom`,
    `prod_desc`,
    `prod_image`,
    `prod_ref`,
    `prod_stock`,
    `prod_parution`,
    `prod_delai`
  )
VALUES
  (
    1,
    'Le Petit Prince',
    'Un classique de la littérature française.',
    'petit_prince.jpg',
    'REF123',
    10,
    '1943-04-06',
    15
  ),
  (
    2,
    'Inception',
    'Film de science-fiction réalisé par Christopher Nolan.',
    'inception.jpg',
    'REF456',
    5,
    '2010-07-16',
    30
  ),
  (
    3,
    'Thriller',
    'Album de Michael Jackson.',
    'thriller.jpg',
    'REF789',
    7,
    '1982-11-30',
    30
  ),
  (
    4,
    'Harry Potter',
    'Roman de J.K. Rowling.',
    'harry_potter.jpg',
    'REF987',
    15,
    '1997-06-26',
    20
  ),
  (
    5,
    'Interstellar',
    'Film de science-fiction réalisé par Christopher Nolan.',
    'interstellar.jpg',
    'REF654',
    8,
    '2014-11-07',
    30
  ),
  (
    6,
    'The Wall',
    'Album de Pink Floyd.',
    'the_wall.jpg',
    'REF321',
    12,
    '1979-11-30',
    25
  ),
  (
    7,
    '1984',
    'Un roman dystopique classique de George Orwell',
    '1984.jpg',
    'REF852',
    20,
    '1949-06-08',
    10
  ),
  (
    8,
    'The Matrix',
    'Film de science-fiction réalisé par les Wachowski.',
    'matrix.jpg',
    'REF753',
    6,
    '1999-03-31',
    35
  ),
  (
    9,
    'Abbey Road',
    'Album des Beatles.',
    'abbey_road.jpg',
    'REF159',
    9,
    '1969-09-26',
    28
  ),
  (
    10,
    'La Peste',
    'Roman d\'Albert Camus.',
    'la_peste.jpg',
    'REF951',
    13,
    '1947-06-05',
    12
  ),
  (
    11,
    'Le Rouge et le Noir',
    'Roman de Stendhal.',
    'rouge_noir.jpg',
    'REF1234',
    8,
    '1830-11-01',
    15
  ),
  (
    12,
    'Gladiator',
    'Film historique réalisé par Ridley Scott.',
    'gladiator.jpg',
    'REF567',
    5,
    '2000-05-05',
    30
  ),
  (
    13,
    'Back in Black',
    'Album d\'AC/DC.',
    'back_in_black.jpg',
    'REF112',
    7,
    '1980-07-25',
    25
  ),
  (
    14,
    'Les Misérables',
    'Roman de Victor Hugo.',
    'les_miserables.jpg',
    'REF888',
    12,
    '1862-04-03',
    20
  ),
  (
    15,
    'Avatar',
    'Film de science-fiction réalisé par James Cameron.',
    'avatar.jpg',
    'REF777',
    10,
    '2009-12-18',
    30
  ),
  (
    16,
    'Rumours',
    'Album de Fleetwood Mac.',
    'rumours.jpg',
    'REF444',
    5,
    '1977-02-04',
    30
  ),
  (
    17,
    'L\'Étranger',
    'Roman d\'Albert Camus.',
    'etranger.jpg',
    'REF222',
    8,
    '1942-05-01',
    12
  ),
  (
    18,
    'Titanic',
    'Film dramatique réalisé par James Cameron.',
    'titanic.jpg',
    'REF555',
    15,
    '1997-12-19',
    35
  ),
  (
    19,
    'The Dark Side of the Moon',
    'Album de Pink Floyd.',
    'dark_side.jpg',
    'REF333',
    9,
    '1973-03-01',
    30
  ),
  (
    20,
    'Le Seigneur des Anneaux',
    'Roman de J.R.R. Tolkien.',
    'seigneur_anneaux.jpg',
    'REF999',
    18,
    '1954-07-29',
    40
  ),
  (
    22,
    'The Godfather',
    'Film réalisé par Francis Ford Coppola.',
    'godfather.jpg',
    'REF852',
    9,
    '1972-03-15',
    20
  ),
  (
    23,
    'Highway to Hell',
    'Album d\'AC/DC.',
    'highway_to_hell.jpg',
    'REF963',
    6,
    '1979-07-27',
    15
  ),
  (
    24,
    'Crime et Châtiment',
    'Roman de Fiodor Dostoïevski.',
    'crime_chatiment.jpg',
    'REF159',
    11,
    '1866-01-01',
    20
  ),
  (
    25,
    'Pulp Fiction',
    'Film réalisé par Quentin Tarantino.',
    'pulp_fiction.jpg',
    'REF456',
    7,
    '1994-10-14',
    20
  ),
  (
    32,
    'Dune',
    'L\'histoire se déroule dans un empire interstellaire féodal, où plusieurs maisons s\'affrontent pour le contrôle de la planète Arrakis, également baptisée Dune par ses habitants.',
    'dune.jpg',
    NULL,
    1,
    '1965-08-01',
    15
  ),
  (
    33,
    'L\'alchemist',
    'L\'histoire est celle de Santiago, jeune berger andalou parti à la recherche d\'un trésor enfoui au pied des pyramides.\"',
    'alchemist.jpg',
    NULL,
    1,
    '1988-05-15',
    11
  ),
  (
    34,
    'La Nausée',
    'La Nausée est un roman philosophique et partiellement autofictionnel de Jean-Paul Sartre, publié en 1938',
    'nausee.jpg',
    NULL,
    1,
    '1938-09-06',
    10
  ),
  (
    35,
    'Les évadés',
    'Il raconte l\' histoire d\'Andy Dufresne (Tim Robbins), un homme injustement condamné pour les meurtres de sa femme et de l\'amant de celle-ci.',
    'evade.jpg',
    NULL,
    1,
    '1994-09-14',
    5
  ),
  (
    36,
    'Le Prestige',
    'Londres, au début du siècle dernier... Robert Angier et Alfred Borden sont deux magiciens surdoués, promis dès leur plus jeune âge à un glorieux avenir.',
    'prestige.jpg',
    NULL,
    1,
    '2006-10-20',
    5
  ),
  (
    37,
    'Blade Runner',
    'Son scénario s\'inspire assez librement du roman Les androïdes rêvent-ils de moutons électriques ?',
    'blade_runner.jpg',
    NULL,
    1,
    '1982-06-25',
    5
  ),
  (
    38,
    'Abey Road',
    NULL,
    NULL,
    NULL,
    1,
    '1969-01-01',
    5
  ),
  (
    39,
    'The Velvet Underground & Nico',
    'Sorti en 1967, le légendaire « Velvet Underground & Nico », produit par le génial Andy Warhol », va devenir l’album référence des New Yorkais et l’emblème d’une nouvelle génération de rockers',
    NULL,
    NULL,
    1,
    '1967-01-01',
    5
  ),
  (
    40,
    'The Joshua Tree',
    'Sorti en mars 1987, cet album propulsa U2 au rang de stars internationales et changea définitivement le statut du groupe',
    NULL,
    NULL,
    1,
    '1987-03-01',
    5
  );

-- --------------------------------------------------------
--
-- Table structure for table `realisateur`
--
CREATE TABLE
  `realisateur` (
    `realisateur_id` int UNSIGNED NOT NULL COMMENT 'Identifiant du réalisateur',
    `realisateur_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nom du réalisateur'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `realisateur`
--
INSERT INTO
  `realisateur` (`realisateur_id`, `realisateur_nom`)
VALUES
  (1, 'Christopher Nolan'),
  (2, 'James Cameron'),
  (3, 'Ridley Scott'),
  (4, 'Steven Spielberg'),
  (5, 'Quentin Tarantino'),
  (6, 'Martin Scorsese'),
  (7, 'Alfred Hitchcock'),
  (8, 'Francis Ford Coppola'),
  (9, 'Peter Jackson'),
  (10, 'Stanley Kubrick'),
  (11, 'David Fincher'),
  (12, 'George Lucas'),
  (13, 'Tim Burton'),
  (14, 'Clint Eastwood'),
  (15, 'Paul Thomas Anderson'),
  (16, 'Sofia Coppola'),
  (17, 'Guillermo del Toro'),
  (18, 'Michael Bay'),
  (19, 'David Lynch'),
  (20, 'Coen Brothers'),
  (21, 'Sam Mendes'),
  (22, 'Wes Anderson'),
  (23, 'Jean-Luc Godard'),
  (24, 'Ingmar Bergman'),
  (25, 'Akira Kurosawa'),
  (26, 'Frank Darabon');

-- --------------------------------------------------------
--
-- Table structure for table `realiser`
--
CREATE TABLE
  `realiser` (
    `realiser_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de la réalisation',
    `realiser_film_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers film_id',
    `realiser_realisateur_id` int UNSIGNED NOT NULL COMMENT 'Clé étrangère vers realisateur_id'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `realiser`
--
INSERT INTO
  `realiser` (
    `realiser_id`,
    `realiser_film_id`,
    `realiser_realisateur_id`
  )
VALUES
  (1, 2, 1),
  (2, 5, 1),
  (3, 8, 1),
  (5, 18, 3),
  (9, 22, 4),
  (12, 25, 1),
  (13, 35, 26),
  (14, 36, 1),
  (15, 37, 3);

-- --------------------------------------------------------
--
-- Table structure for table `ville`
--
CREATE TABLE
  `ville` (
    `ville_id` int UNSIGNED NOT NULL COMMENT 'Identifiant de la ville',
    `ville_cp` char(5) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Code postal',
      `ville_nom` varchar(255) CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ville'
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `ville`
--
INSERT INTO
  `ville` (`ville_id`, `ville_cp`, `ville_nom`)
VALUES
  (1, '75001', 'Paris'),
  (2, '69001', 'Lyon'),
  (3, '33000', 'Bordeaux'),
  (4, '13001', 'Marseille'),
  (5, '31000', 'Toulouse'),
  (6, '59000', 'Lille'),
  (7, '67000', 'Strasbourg'),
  (8, '34000', 'Montpellier'),
  (9, '44000', 'Nantes'),
  (10, '06000', 'Nice'),
  (11, '35000', 'Rennes'),
  (12, '57000', 'Metz'),
  (13, '21000', 'Dijon'),
  (14, '80000', 'Amiens'),
  (15, '37000', 'Tours'),
  (16, '87000', 'Limoges'),
  (17, '72000', 'Le Mans'),
  (18, '38000', 'Grenoble'),
  (19, '37000', 'Orléans'),
  (20, '62000', 'Arras'),
  (21, '83000', 'Toulon'),
  (22, '68100', 'Mulhouse'),
  (23, '68110', 'Illzach'),
  (24, '68200', 'Colmar'),
  (25, '75009', 'Paris 9e'),
  (26, '78000', 'Versaille');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `acteur`
--
ALTER TABLE `acteur` ADD PRIMARY KEY (`acteur_id`);

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur` ADD PRIMARY KEY (`auteur_id`);

--
-- Indexes for table `categoriser`
--
ALTER TABLE `categoriser` ADD PRIMARY KEY (`cat_id`),
ADD KEY `cat_prod_id` (`cat_prod_id`),
ADD KEY `cat_genre_id` (`cat_genre_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client` ADD PRIMARY KEY (`cl_id`),
ADD UNIQUE KEY `cl_mail` (`cl_mail`),
ADD UNIQUE KEY `cl_mail_2` (`cl_mail`),
ADD KEY `cl_ville_id` (`cl_ville_id`);

--
-- Indexes for table `disque`
--
ALTER TABLE `disque` ADD PRIMARY KEY (`disque_id`);

--
-- Indexes for table `ecrire`
--
ALTER TABLE `ecrire` ADD PRIMARY KEY (`ecrire_id`),
ADD KEY `ecrire_auteur_id` (`ecrire_auteur_id`),
ADD KEY `ecrire_livre_id` (`ecrire_livre_id`);

--
-- Indexes for table `editer`
--
ALTER TABLE `editer` ADD PRIMARY KEY (`editer_id`),
ADD KEY `editer_livre_id` (`editer_livre_id`),
ADD KEY `editer_editeur_id` (`editer_editeur_id`);

--
-- Indexes for table `editeur`
--
ALTER TABLE `editeur` ADD PRIMARY KEY (`editeur_id`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt` ADD PRIMARY KEY (`emprunt_id`),
ADD KEY `emprunt_cl_id` (`emprunt_cl_id`),
ADD KEY `emprunt_prod_id` (`emprunt_prod_id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film` ADD PRIMARY KEY (`film_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre` ADD PRIMARY KEY (`genre_id`),
ADD KEY `fk_genre_parent` (`genre_parent`);

--
-- Indexes for table `jouer`
--
ALTER TABLE `jouer` ADD PRIMARY KEY (`jouer_id`),
ADD KEY `jouer_film_id` (`jouer_film_id`),
ADD KEY `jouer_acteur_id` (`jouer_acteur_id`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre` ADD PRIMARY KEY (`livre_id`);

--
-- Indexes for table `part`
--
ALTER TABLE `part` ADD PRIMARY KEY (`part_id`);

--
-- Indexes for table `pro`
--
ALTER TABLE `pro` ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit` ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `realisateur`
--
ALTER TABLE `realisateur` ADD PRIMARY KEY (`realisateur_id`);

--
-- Indexes for table `realiser`
--
ALTER TABLE `realiser` ADD PRIMARY KEY (`realiser_id`),
ADD KEY `realiser_film_id` (`realiser_film_id`),
ADD KEY `realiser_realisateur_id` (`realiser_realisateur_id`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville` ADD PRIMARY KEY (`ville_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `acteur`
--
ALTER TABLE `acteur` MODIFY `acteur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''acteur',
AUTO_INCREMENT = 32;

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur` MODIFY `auteur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''auteur',
AUTO_INCREMENT = 29;

--
-- AUTO_INCREMENT for table `categoriser`
--
ALTER TABLE `categoriser` MODIFY `cat_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la catégorisation',
AUTO_INCREMENT = 45;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client` MODIFY `cl_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client',
AUTO_INCREMENT = 27;

--
-- AUTO_INCREMENT for table `ecrire`
--
ALTER TABLE `ecrire` MODIFY `ecrire_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''écriture',
AUTO_INCREMENT = 23;

--
-- AUTO_INCREMENT for table `editer`
--
ALTER TABLE `editer` MODIFY `editer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''édition',
AUTO_INCREMENT = 19;

--
-- AUTO_INCREMENT for table `editeur`
--
ALTER TABLE `editeur` MODIFY `editeur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''éditeur',
AUTO_INCREMENT = 26;

--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt` MODIFY `emprunt_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''emprunt',
AUTO_INCREMENT = 28;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre` MODIFY `genre_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du genre',
AUTO_INCREMENT = 23;

--
-- AUTO_INCREMENT for table `jouer`
--
ALTER TABLE `jouer` MODIFY `jouer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''association jouer - acteur',
AUTO_INCREMENT = 21;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit` MODIFY `prod_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du produit',
AUTO_INCREMENT = 41;

--
-- AUTO_INCREMENT for table `realisateur`
--
ALTER TABLE `realisateur` MODIFY `realisateur_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du réalisateur',
AUTO_INCREMENT = 27;

--
-- AUTO_INCREMENT for table `realiser`
--
ALTER TABLE `realiser` MODIFY `realiser_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la réalisation',
AUTO_INCREMENT = 16;

--
-- AUTO_INCREMENT for table `ville`
--
ALTER TABLE `ville` MODIFY `ville_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la ville',
AUTO_INCREMENT = 27;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `categoriser`
--
ALTER TABLE `categoriser` ADD CONSTRAINT `categoriser_ibfk_1` FOREIGN KEY (`cat_prod_id`) REFERENCES `produit` (`prod_id`),
ADD CONSTRAINT `categoriser_ibfk_2` FOREIGN KEY (`cat_genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client` ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cl_ville_id`) REFERENCES `ville` (`ville_id`);

--
-- Constraints for table `disque`
--
ALTER TABLE `disque` ADD CONSTRAINT `fk_disque_produit` FOREIGN KEY (`disque_id`) REFERENCES `produit` (`prod_id`);

--
-- Constraints for table `ecrire`
--
ALTER TABLE `ecrire` ADD CONSTRAINT `ecrire_ibfk_1` FOREIGN KEY (`ecrire_auteur_id`) REFERENCES `auteur` (`auteur_id`),
ADD CONSTRAINT `ecrire_ibfk_2` FOREIGN KEY (`ecrire_livre_id`) REFERENCES `livre` (`livre_id`);

--
-- Constraints for table `editer`
--
ALTER TABLE `editer` ADD CONSTRAINT `editer_ibfk_1` FOREIGN KEY (`editer_livre_id`) REFERENCES `livre` (`livre_id`),
ADD CONSTRAINT `editer_ibfk_2` FOREIGN KEY (`editer_editeur_id`) REFERENCES `editeur` (`editeur_id`);

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt` ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`emprunt_cl_id`) REFERENCES `client` (`cl_id`),
ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`emprunt_prod_id`) REFERENCES `produit` (`prod_id`);

--
-- Constraints for table `film`
--
ALTER TABLE `film` ADD CONSTRAINT `fk_film_produit` FOREIGN KEY (`film_id`) REFERENCES `produit` (`prod_id`);

--
-- Constraints for table `genre`
--
ALTER TABLE `genre` ADD CONSTRAINT `fk_genre_parent` FOREIGN KEY (`genre_parent`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `jouer`
--
ALTER TABLE `jouer` ADD CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`jouer_film_id`) REFERENCES `film` (`film_id`),
ADD CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`jouer_acteur_id`) REFERENCES `acteur` (`acteur_id`);

--
-- Constraints for table `livre`
--
ALTER TABLE `livre` ADD CONSTRAINT `fk_livre_produit` FOREIGN KEY (`livre_id`) REFERENCES `produit` (`prod_id`);

--
-- Constraints for table `part`
--
ALTER TABLE `part` ADD CONSTRAINT `fk_part_client` FOREIGN KEY (`part_id`) REFERENCES `client` (`cl_id`);

--
-- Constraints for table `pro`
--
ALTER TABLE `pro` ADD CONSTRAINT `fk_pro_client` FOREIGN KEY (`pro_id`) REFERENCES `client` (`cl_id`);

--
-- Constraints for table `realiser`
--
ALTER TABLE `realiser` ADD CONSTRAINT `realiser_ibfk_1` FOREIGN KEY (`realiser_film_id`) REFERENCES `film` (`film_id`),
ADD CONSTRAINT `realiser_ibfk_2` FOREIGN KEY (`realiser_realisateur_id`) REFERENCES `realisateur` (`realisateur_id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;