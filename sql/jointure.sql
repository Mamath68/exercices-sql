-- Afficher la liste des livres (titre, description, date de parution, nombre de pages), classés par titre
SELECT
    p.prod_nom AS "titre",
    p.prod_desc AS "description",
    p.prod_parution AS "date de parution",
    l.livre_nb_pages AS "nombre de page"
FROM
    livre l
    INNER JOIN produit p ON p.prod_id = l.livre_id
ORDER BY
    p.prod_nom;

-- 2. Afficher la durée moyenne arrondie des films par année de parution, par durée décroissantes
SELECT
    YEAR (p.prod_parution) AS "année",
    SEC_TO_TIME (ROUND(AVG(TIME_TO_SEC (f.film_duree)))) AS "durée moyenne des films"
FROM
    produit p
    INNER JOIN film f ON p.prod_id = f.film_id
GROUP BY
    1
ORDER BY
    2 DESC;

-- 3. Afficher tous les produits, avec le nombre de fois empruntés, y compris ceux qui n'ont jamais été empruntés
SELECT
    p.prod_nom AS "produit",
    COUNT(em.emprunt_id) AS "nb"
FROM
    produit p
    LEFT OUTER JOIN emprunt em ON p.prod_id = em.emprunt_prod_id
GROUP BY
    1;

-- 4. Afficher la liste des films, ainsi que leur réalisateur
SELECT
    p.prod_nom AS "titre",
    YEAR (p.prod_parution) AS "année",
    re.realisateur_nom AS "réalisateur"
FROM
    produit p
    INNER JOIN film f ON p.prod_id = f.film_id
    INNER JOIN realiser rea ON rea.realiser_film_id = f.film_id
    INNER JOIN realisateur re ON rea.realiser_realisateur_id = re.realisateur_id
ORDER BY
    2;

-- 5. Afficher la liste des films (titre, année, réalisateur) sortis après 1990, dont le titre contient "a" et termine par "x" ou par "c", par ordre de titre décroissant
SELECT
    p.prod_nom AS "titre",
    YEAR (p.prod_parution) AS "année",
    re.realisateur_nom AS "realisateur"
FROM
    produit p
    INNER JOIN film f ON f.film_id = p.prod_id
    INNER JOIN realiser rea ON rea.realiser_film_id = f.film_id
    INNER JOIN realisateur re ON re.realisateur_id = rea.realiser_realisateur_id
WHERE
    YEAR (p.prod_parution) > 1990
    AND p.prod_nom LIKE '%a%'
    AND (
        p.prod_nom LIKE '%x'
        OR p.prod_nom LIKE '%c'
    )
ORDER BY
    1 DESC;

-- 6. Afficher la liste des genres, ainsi que le nombre de films associés
SELECT
    g.genre_lib as "genre",
    COUNT(f.film_id) AS "nb films"
FROM
    genre g
    INNER JOIN categoriser c ON c.cat_genre_id = g.genre_id
    INNER JOIN produit p ON c.cat_prod_id = p.prod_id
    INNER JOIN film f ON f.film_id = p.prod_id
GROUP BY
    g.genre_id
ORDER BY
    2 DESC;

-- 7. Afficher les genres de film de manière hiérarchique
SELECT
    gp.genre_lib AS "catégorie",
    ge.genre_lib AS "sous-catégorie"
FROM
    genre as gp
    LEFT OUTER JOIN genre as ge ON ge.genre_parent = gp.genre_id
WHERE
    gp.genre_parent IS NULL
ORDER BY
    1,
    2;

-- 8. Afficher les emprunts non retournés par les clients
SELECT
    c.cl_nom AS "nom",
    c.cl_mail AS "mail",
    p.prod_nom AS "produit",
    em.emprunt_date AS "date"
FROM
    CLIENT c
    INNER JOIN emprunt em ON em.emprunt_cl_id = c.cl_id
    INNER JOIN produit p ON em.emprunt_prod_id = p.prod_id
WHERE
    em.emprunt_retour IS NULL;

-- 9. Afficher les genres de produit qui ont été empruntés plus de 10 fois, par ordre alphabétique du genre
SELECT
    g.genre_lib AS "catégorie"
FROM
    genre g
    INNER JOIN categoriser c ON c.cat_genre_id = g.genre_id
    INNER JOIN produit p ON c.cat_prod_id = p.prod_id
    INNER JOIN emprunt em ON em.emprunt_prod_id = p.prod_id
GROUP BY
    genre_id
HAVING
    COUNT(g.genre_id) > 10
ORDER BY
    COUNT(g.genre_id) ASC;

-- 10. Afficher tous les clients (nom, prénom, date de naissance) qui ont emprunté un livre sorti la même décennie que leur date de naissance, par ordre alphabétique du nom et du prénom
SELECT DISTINCT
    c.cl_nom AS "nom",
    part.part_prenom AS "prénom",
    part.part_date_naiss AS "date de naissance"
FROM
    client c
    INNER JOIN part ON part.part_id = c.cl_id
    INNER JOIN emprunt em ON em.emprunt_cl_id = c.cl_id
    INNER JOIN produit p ON em.emprunt_prod_id = p.prod_id
    INNER JOIN livre li ON li.livre_id = p.prod_id
where
    SUBSTRING(part.part_date_naiss, 1, 2) = SUBSTRING(p.prod_parution, 1, 2)
ORDER BY
    1,
    2;