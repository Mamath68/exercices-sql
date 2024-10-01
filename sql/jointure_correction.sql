-- 1. Afficher la liste des livres (titre, description, date de parution, nombre de pages), classés par titre
SELECT
	prod_nom AS "titre",
	prod_desc AS "description",
	prod_parution AS "date de parution",
	livre_nb_pages AS "nombre de pages"
FROM
	produit
	INNER JOIN livre ON livre.livre_id = produit.prod_id
ORDER BY
	1;

-- ORDER BY prod_nom;
-- 2. Afficher la durée moyenne arrondie des films par année de parution, par durée décroissante
SELECT
	YEAR (prod_parution) AS "année",
	SEC_TO_TIME (ROUND(AVG(TIME_TO_SEC (film_duree)))) AS "durée moyenne"
FROM
	produit
	INNER JOIN film ON film.film_id = produit.prod_id
GROUP BY
	1
ORDER BY
	2 DESC;

-- 3. Afficher tous les produits, avec le nombre de fois empruntés, y compris ceux qui n'ont jamais été empruntés
SELECT
	produit.prod_nom AS "produit",
	COUNT(emprunt.emprunt_id) AS "nb"
FROM
	produit
	LEFT OUTER JOIN emprunt ON emprunt_prod_id = prod_id
GROUP BY
	prod_id;

-- 4. Afficher la liste des films, ainsi que leur réalisateur
SELECT
	prod_nom AS "titre",
	YEAR (prod_parution) AS "année",
	realisateur.realisateur_nom AS "réalisateur"
FROM
	produit
	INNER JOIN film ON produit.prod_id = film.film_id
	INNER JOIN realiser ON realiser.realiser_film_id = film.film_id
	INNER JOIN realisateur ON realiser.realiser_realisateur_id = realisateur.realisateur_id
ORDER BY
	2;

-- 5. Afficher la liste des films (titre, année, réalisateur) sortis après 1990, dont le titre contient "a" et termine par "x" ou par "c", par ordre de titre décroissant
SELECT
	prod_nom AS "titre",
	YEAR (prod_parution) AS "année",
	realisateur.realisateur_nom AS "réalisateur"
FROM
	produit
	INNER JOIN film ON produit.prod_id = film.film_id
	INNER JOIN realiser ON realiser.realiser_film_id = film.film_id
	INNER JOIN realisateur ON realiser.realiser_realisateur_id = realisateur.realisateur_id
WHERE
	YEAR (prod_parution) > 1990
	AND prod_nom LIKE "%a%"
	AND (
		prod_nom LIKE "%x"
		OR prod_nom LIKE "%c"
	)
ORDER BY
	1 DESC;

SELECT
	prod_nom AS "titre",
	YEAR (prod_parution) AS "année",
	realisateur.realisateur_nom AS "réalisateur"
FROM
	produit
	INNER JOIN film ON produit.prod_id = film.film_id
	INNER JOIN realiser ON realiser.realiser_film_id = film.film_id
	INNER JOIN realisateur ON realiser.realiser_realisateur_id = realisateur.realisateur_id
WHERE
	YEAR (prod_parution) > 1990
	AND (
		prod_nom LIKE "%a%x"
		OR prod_nom LIKE "%a%c"
	)
ORDER BY
	1 DESC;

-- 6. Afficher la liste des genres, ainsi que le nombre de films associés
SELECT
	genre_lib AS "genre",
	COUNT(film_id) AS "nb films"
FROM
	genre
	INNER JOIN categoriser ON cat_genre_id = genre_id
	INNER JOIN produit ON cat_prod_id = prod_id
	INNER JOIN film ON film_id = prod_id
GROUP BY
	genre_id
ORDER BY
	2 DESC;

-- 7. Afficher les genres de film de manière hiérarchique
SELECT
	parent.genre_lib AS "catégorie",
	enfant.genre_lib AS "sous-catégorie"
FROM
	genre AS parent
	LEFT OUTER JOIN genre AS enfant ON enfant.genre_parent = parent.genre_id
WHERE
	parent.genre_parent IS NULL
ORDER BY
	1,
	2;

-- 8. Afficher les emprunts non retournés par les clients
SELECT
	cl_nom AS "nom",
	cl_mail AS "mail",
	prod_nom AS "produit",
	emprunt_date AS "date d'emprunt"
FROM
	client
	INNER JOIN emprunt ON emprunt_cl_id = cl_id
	INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
	emprunt.emprunt_retour IS NULL;

SELECT
	cl_nom AS "nom",
	cl_mail AS "mail",
	prod_nom AS "produit",
	emprunt_date AS "date d'emprunt"
FROM
	emprunt
	INNER JOIN client ON emprunt_cl_id = cl_id
	INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
	emprunt.emprunt_retour IS NULL;

SELECT
	cl_nom AS "nom",
	cl_mail AS "mail",
	prod_nom AS "produit",
	emprunt_date AS "date d'emprunt"
FROM
	produit
	INNER JOIN emprunt ON emprunt_prod_id = prod_id
	INNER JOIN client ON emprunt_cl_id = cl_id
WHERE
	emprunt.emprunt_retour IS NULL;

-- 9. Afficher les genres de produit qui ont été empruntés plus de 10 fois, par ordre alphabétique du genre
SELECT
	genre_lib AS "genre"
FROM
	genre
	INNER JOIN categoriser ON cat_genre_id = genre_id
	INNER JOIN produit ON cat_prod_id = prod_id
	INNER JOIN emprunt ON emprunt_prod_id = prod_id
GROUP BY
	genre_id
HAVING
	COUNT(emprunt_id) > 10
ORDER BY
	1;

-- 10. Afficher tous les clients (nom, prénom, date de naissance) de manière unique qui ont emprunté un livre sorti le même siècle que leur date de naissance, par ordre alphabétique du nom et du prénom
SELECT DISTINCT
	cl_nom AS "nom",
	part_prenom AS "prénom",
	part_date_naiss AS "Date de naissance"
FROM
	client
	INNER JOIN part ON part_id = cl_id
	INNER JOIN emprunt ON emprunt_cl_id = cl_id
	INNER JOIN produit ON emprunt_prod_id = prod_id
	INNER JOIN livre ON livre_id = prod_id
WHERE
	SUBSTRING(part_date_naiss, 1, 2) = SUBSTRING(prod_parution, 1, 2)
ORDER BY
	1,
	2;