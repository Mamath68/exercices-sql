-- 1. Afficher tous les clients (nom, mail, téléphone) par ordre alphabétique du nom
SELECT
    c.cl_nom AS "nom",
    c.cl_mail AS "mail",
    c.cl_tel AS "téléphone"
FROM
    client c
ORDER BY
    cl_nom ASC;

-- 2. Afficher tous les produits (nom, parution, delai) par ordre de délai (croissante) et du nom (décroissant)
SELECT
    p.prod_nom AS "nom",
    p.prod_parution AS "parution",
    p.prod_delai AS "délai"
FROM
    produit p
ORDER BY
    p.prod_delai ASC,
    p.prod_nom DESC;

-- 3. Afficher les civilités de façon unique, par ordre décroissant
SELECT DISTINCT
    p.part_civilite AS "civilités"
FROM
    part p
ORDER BY
    p.part_civilite DESC;

-- 4. Afficher les 5 films (id) qui durent le plus longtemps
SELECT
    f.film_id as "id"
FROM
    film f
ORDER BY
    f.film_duree DESC
limit
    5;

-- 5. Afficher la liste des emprunts qui ont été récupérés mais qui n'ont pas été rapportés, classés par date d'emprunt décroissante
SELECT
    em.emprunt_id as "id"
FROM
    emprunt em
where
    em.emprunt_recupere = 1
    AND em.emprunt_retour is null
order by
    em.emprunt_date desc;

-- 6. Afficher la référence et le nom des produits (dans un seul champ, en majuscule, par ordre croissant du nom), qui ont un nom qui contient "BB", "LL" ou "TT", et qui sont parus après 1965
SELECT
    CONCAT (p.prod_ref, " ", UPPER(p.prod_nom)) AS "produit"
FROM
    produit p
WHERE
    (
        p.prod_nom LIKE '%BB%'
        OR p.prod_nom LIKE '%LL%'
        OR p.prod_nom LIKE '%TT%'
    )
    AND p.prod_parution > 1965
ORDER BY
    p.prod_nom ASC;

-- Alternative
SELECT
    UPPER(CONCAT (p.prod_ref, " ", p.prod_nom)) AS "produit"
FROM
    produit p
WHERE
    (
        p.prod_nom LIKE '%BB%'
        OR p.prod_nom LIKE '%LL%'
        OR p.prod_nom LIKE '%TT%'
    )
    AND p.prod_parution > 1965
ORDER BY
    p.prod_nom ASC;

-- 7. Afficher le nombre de clients
SELECT
    COUNT(c.cl_id) AS "nb de clients"
FROM
    client c
SELECT
    CONCAT ("Il y a", " ", COUNT(c.cl_id), " ", "clients") AS "nb de clients"
FROM
    client c;

-- 8. Afficher le nombre de produits par année de parution décroissante
SELECT
    YEAR (p.prod_parution) as "année",
    count(p.prod_id) as "nb de produits"
FROM
    produit p
GROUP BY
    YEAR (p.prod_parution)
ORDER BY
    YEAR (p.prod_parution) DESC;

-- Alternative
SELECT
    YEAR (p.prod_parution) as "année",
    count(p.prod_id) as "nb de produits"
FROM
    produit p
GROUP BY
    1
ORDER BY
    1 DESC;

-- 9. Afficher la durée moyenne arrondie des films
SELECT
    SEC_TO_TIME (ROUND(AVG(time_to_sec (f.film_duree)))) as "durée moyenne des films"
FROM
    film f;