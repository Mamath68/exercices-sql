-- 1.Afficher tous les produits
SELECT
    *
FROM
    produit;

-- 2.Afficher tous les clients
SELECT
    *
FROM
    client;

-- 3.Afficher tous les produits (nom, description, date de parution)
SELECT
    p.prod_nom AS "nom",
    p.prod_desc AS "description",
    p.prod_parution AS "date de parution"
FROM
    produit p;

-- 4.Afficher tous les clients (nom, numéro de téléphone)
SELECT
    c.cl_nom AS "nom",
    c.cl_tel AS "numéro de téléphone"
FROM
    client c;

--5. Afficher tous les films (id et durée) qui durent plus de 2h30
SELECT
    f.film_id AS "id",
    f.film_duree AS "durée"
FROM
    film f
WHERE
    f.film_duree > '02:30:00';

-- 6. Afficher tous les produits parus avant le 01/01/1990
SELECT
    p.prod_nom AS "nom",
    p.prod_ref AS "référence",
    p.prod_parution AS "parution"
FROM
    produit p
WHERE
    p.prod_parution < "1990-01-01"
ORDER BY
    p.prod_parution ASC;

-- 7. Afficher tous les clients dont le nom contient "and"
SELECT
    c.cl_nom AS "Client"
FROM
    client c
WHERE
    c.cl_nom LIKE "%and%";

-- 8. Afficher tous les produits parus en 1999 et dont la description commence par "Film"
SELECT
    p.prod_nom AS "nom"
FROM
    produit p
WHERE
    p.prod_desc LIKE "Film%"
    AND p.prod_parution LIKE "1999-%-%";

-- 9. Afficher tous les produits parus entre 1990 et 1995 (inclus) ou entre 2000 et 2005 (inclus)
SELECT
    p.prod_nom AS "nom",
    p.prod_parution AS "parution"
FROM
    produit p
WHERE
    YEAR (p.prod_parution) BETWEEN 1990 AND 1995
    OR YEAR (p.prod_parution) BETWEEN 2000 AND 2005;