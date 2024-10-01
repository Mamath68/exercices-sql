-- 1. Afficher tous les films (titre, réalisateur) sortis en 1992, 1994 ou 1999.
SELECT
    p.prod_nom AS "Titre",
    rea.realisateur_nom AS "Réalisateur"
FROM
    produit p
    INNER JOIN film f ON f.film_id = p.prod_id
    INNER JOIN realiser r ON r.realiser_film_id = f.film_id
    INNER JOIN realisateur rea ON r.realiser_realisateur_id = rea.realisateur_id
WHERE
    YEAR (p.prod_parution) IN (1992, 1994, 1999);

-- 2. Afficher les produits jamais empruntés
SELECT
    p.prod_nom AS "Titre"
FROM
    produit p
WHERE
    p.prod_id NOT IN (
        SELECT
            em.emprunt_prod_id
        FROM
            emprunt em
    );

-- 3. Afficher les produits qui n'ont été empruntés que par des clients professionnels, par ordre alphabétique du nom du produit.
SELECT
    p.prod_nom AS "Produit"
FROM
    produit p
WHERE
    p.prod_id IN (
        SELECT
            em.emprunt_prod_id
        FROM
            emprunt em
        WHERE
            em.emprunt_cl_id IN (
                SELECT
                    pro.pro_id
                FROM
                    pro
            )
    )
ORDER BY
    p.prod_nom;

-- Alternative:
SELECT
    p.prod_nom AS "Titre"
FROM
    produit p
WHERE
    p.prod_id IN (
        SELECT
            em.emprunt_prod_id
        FROM
            emprunt em
        WHERE
            em.emprunt_cl_id NOT IN (
                SELECT
                    part.part_id
                FROM
                    part
            )
    )
ORDER BY
    p.prod_nom;

-- 4. Afficher tous les clients qui sont nés la même année que la sortie de l'album "Thriller".
SELECT
    c.cl_nom AS "Nom",
    part.part_prenom AS "Prénom"
FROM
    CLIENT c
    INNER JOIN part ON part.part_id = c.cl_id
WHERE
    YEAR (part.part_date_naiss) IN (
        SELECT
            YEAR (p.prod_parution)
        FROM
            produit p
        WHERE
            p.prod_nom = "Thriller"
    );

-- 5. Affiche les emprunts effectués lors de la première date d'emprunt pour chaque client.


-- 8. Afficher la durée moyenne d'emprunt par type de produit
