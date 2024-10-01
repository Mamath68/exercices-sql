-- 1. Afficher tous les produits
SELECT
	*
FROM
	produit;

-- 2. Afficher tous les clients
SELECT
	*
FROM
	client;

-- 3. Afficher tous les produits (nom, description, date de parution)
SELECT
	p.prod_nom AS "nom",
	p.prod_desc AS "description",
	p.prod_parution AS "date de parution"
FROM
	produit p;

-- 4. Afficher tous les clients (nom, numéro de téléphone)
SELECT
	c.cl_nom AS "nom",
	c.cl_tel AS "Numéro de téléphone"
FROM
	client c;

-- 5. Afficher tous les films (id et durée) qui durent plus de 2h30
SELECT
	film_id AS "id",
	film_duree AS "durée"
FROM
	film
WHERE
	film_duree > "02:30:00";

-- 6. Afficher tous les produits parus avant le 01/01/1990
SELECT
	prod_nom AS "nom",
	prod_ref AS "référence",
	prod_parution AS "date de parution"
FROM
	produit
WHERE
	prod_parution < "1990-01-01";

-- 7. Afficher tous les clients dont le nom contient "and"
SELECT
	cl_nom AS "nom"
FROM
	client
WHERE
	cl_nom LIKE "%and%";

-- 8. Afficher tous les produits parus en 1999 et dont la description commence par "Film"
SELECT
	prod_nom AS "nom"
FROM
	produit
WHERE
	prod_desc LIKE "Film %"
	AND prod_parution >= '1999-01-01'
	AND prod_parution <= '1999-12-31';

SELECT
	prod_nom AS "nom"
FROM
	produit
WHERE
	prod_desc LIKE "Film %"
	AND prod_parution BETWEEN '1999-01-01' AND '1999-12-31';

SELECT
	prod_nom AS "nom"
FROM
	produit
WHERE
	prod_desc LIKE "Film %"
	AND prod_parution LIKE '1999-%';

-- ou "1999-__-__"
SELECT
	prod_nom AS "nom"
FROM
	produit
WHERE
	prod_desc LIKE "Film %"
	AND YEAR (prod_parution) = 1999;

-- 9. Afficher tous les produits parus entre 1990 et 1995 (inclus) ou entre 2000 et 2005 (inclus)
SELECT
	prod_nom AS "nom",
	prod_parution AS "parution"
FROM
	produit
WHERE
	prod_parution BETWEEN '1990-01-01' AND '1995-12-31'
	OR prod_parution BETWEEN '2000-01-01' AND '2005-12-31';

SELECT
	prod_nom AS "nom",
	prod_parution AS "parution"
FROM
	produit
WHERE
	YEAR (prod_parution) BETWEEN 1990 AND 1995
	OR YEAR (prod_parution) BETWEEN 2000 AND 2005;