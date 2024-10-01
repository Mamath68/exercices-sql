-- 1. Afficher tous les films (titre, réalisateur) sortis en 1992, 1994 ou 1999
SELECT
    prod_nom AS "titre",
    realisateur_nom AS "réalisateur"
FROM
    produit
    INNER JOIN film ON prod_id = film_id
    INNER JOIN realiser ON realiser.realiser_film_id = film_id
    INNER JOIN realisateur ON realiser.realiser_realisateur_id = realisateur_id
WHERE
    YEAR (produit.prod_parution) IN (1992, 1994, 1999);

-- 2. Afficher les produits jamais empruntés */
SELECT
    prod_nom
FROM
    produit
WHERE
    prod_id NOT IN (
        SELECT
            emprunt.emprunt_prod_id
        FROM
            emprunt
    );

-- 3. Afficher les produits qui n'ont été empruntés que par des clients professionnels, 
par ordre alphabétique du nom du produit * /
SELECT
    prod_nom
FROM
    produit
WHERE
    prod_id IN (
        SELECT
            emprunt.emprunt_prod_id
        FROM
            emprunt
            INNER JOIN client ON emprunt.emprunt_cl_id = cl_id
            INNER JOIN pro ON pro_id = cl_id
    )
ORDER BY
    1;

-- 4. Afficher tous les clients qui sont nés la même année que la sortie de l'album "Thriller"
SELECT
    cl_nom AS "Nom",
    part.part_prenom AS "Prénom"
FROM
    client
    INNER JOIN part ON part_id = cl_id
WHERE
    YEAR (part_date_naiss) = (
        SELECT
            YEAR (prod_parution)
        FROM
            produit
        WHERE
            prod_nom = "Thriller"
    );

-- 5. Affiche les emprunts effectués lors de la première date d'emprunt pour chaque client
SELECT
    cl_nom AS "client",
    emprunt_date AS "date emprunt",
    prod_nom AS "produit emprunté"
FROM
    client
    INNER JOIN emprunt ON emprunt_cl_id = cl_id
    INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
    (cl_id, emprunt_date) IN (
        SELECT
            emprunt.emprunt_cl_id,
            MIN(emprunt.emprunt_date)
        FROM
            emprunt
        GROUP BY
            emprunt.emprunt_cl_id
    );

-- 6. Afficher tous les films qui sont plus vieux qu'au moins un client qui habite en Alsace, par ordre décroissant
SELECT
    prod_nom AS "Film"
FROM
    produit
    INNER JOIN film ON film_id = prod_id
WHERE
    prod_parution < ANY (
        SELECT
            part_date_naiss
        FROM
            client
            INNER JOIN part ON part_id = cl_id
            INNER JOIN ville ON cl_ville_id = ville_id
        WHERE
            ville_cp LIKE "67___"
            OR ville_cp LIKE "68%"
    );

-- 7. Afficher les clients qui ont emprunté plus de produits que la moyenne des emprunts de tous les clients, par ordre alphabétique du nom
SELECT
    cl_nom AS "nom",
    cl_mail AS "mail"
FROM
    client
    INNER JOIN emprunt ON emprunt_cl_id = cl_id
GROUP BY
    cl_id
HAVING
    COUNT(emprunt_id) > (
        SELECT
            AVG(nb_emprunts.nb)
        FROM
            (
                SELECT
                    emprunt.emprunt_cl_id,
                    COUNT(emprunt_id) AS "nb"
                FROM
                    emprunt
                GROUP BY
                    emprunt_cl_id
            ) AS nb_emprunts
    )
ORDER BY
    1;

-- 8. Afficher la durée moyenne d'emprunt par type de produit
SELECT
    "Livre" AS "type_produit",
    AVG(DATEDIFF (emprunt_retour, emprunt_date)) AS "duree_moyenne"
FROM
    emprunt
    INNER JOIN produit ON emprunt_prod_id = prod_id
    INNER JOIN livre ON livre_id = prod_id
WHERE
    emprunt_retour IS NOT NULL
UNION
SELECT
    "Film" AS "type_produit",
    AVG(DATEDIFF (emprunt_retour, emprunt_date)) AS "duree_moyenne"
FROM
    emprunt
    INNER JOIN produit ON emprunt_prod_id = prod_id
    INNER JOIN film ON film_id = prod_id
WHERE
    emprunt_retour IS NOT NULL
UNION
SELECT
    "Disque" AS "type_produit",
    AVG(DATEDIFF (emprunt_retour, emprunt_date)) AS "duree_moyenne"
FROM
    emprunt
    INNER JOIN produit ON emprunt_prod_id = prod_id
    INNER JOIN disque ON disque_id = prod_id
WHERE
    emprunt_retour IS NOT NULL
UNION
SELECT
    NULL AS "type_produit",
    AVG(DATEDIFF (emprunt_retour, emprunt_date)) AS "duree_moyenne"
FROM
    emprunt
    INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
    prod_id NOT IN (
        SELECT
            film_id
        FROM
            film
        UNION
        SELECT
            livre_id
        FROM
            livre
        UNION
        SELECT
            disque_id
        FROM
            disque
    )
    AND emprunt_retour IS NOT NULL;

-- autre version / Attention delta sur les disques
SELECT
    CASE
        WHEN livre_id IS NOT NULL THEN 'Livre'
        WHEN film_id IS NOT NULL THEN 'Film'
        WHEN disque_id IS NOT NULL THEN 'Disque'
    END AS "type_produit",
    AVG(DATEDIFF (emprunt_retour, emprunt_date)) AS "duree_moyenne"
FROM
    emprunt
    INNER JOIN produit ON produit.prod_id = emprunt_prod_id
    LEFT OUTER JOIN livre ON prod_id = livre_id
    LEFT OUTER JOIN film ON prod_id = film_id
    LEFT OUTER JOIN disque ON prod_id = disque_id
WHERE
    emprunt_retour IS NOT NULL
GROUP BY
    type_produit;

-- 9. Afficher la liste des emprunts sans retour ou non récupérés, selon l’affichage, par nom client croissant et nom de produit décroissant
SELECT
    cl_nom,
    prod_nom,
    'Non retourné' AS statut
FROM
    emprunt
    INNER JOIN client ON emprunt_cl_id = cl_id
    INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
    emprunt_retour IS NULL
UNION
SELECT
    cl_nom AS client_nom,
    prod_nom AS produit_nom,
    'Non récupéré' AS statut
FROM
    emprunt
    INNER JOIN client ON emprunt_cl_id = cl_id
    INNER JOIN produit ON emprunt_prod_id = prod_id
WHERE
    emprunt_recupere = 0
ORDER BY
    1,
    2 DESC;

-- 10. Afficher la liste des emprunts sans retour ou non récupérés, selon l’affichage, par nom client croissant et nom de produit décroissant
SELECT
    cl_nom AS "nom",
    prod_nom AS "produit",
    GROUP_CONCAT (statut) AS "statut"
FROM
    (
        SELECT
            cl_nom,
            prod_nom,
            'Non retourné' AS statut
        FROM
            emprunt
            INNER JOIN client ON emprunt_cl_id = cl_id
            INNER JOIN produit ON emprunt_prod_id = prod_id
        WHERE
            emprunt_retour IS NULL
        UNION
        SELECT
            cl_nom AS client_nom,
            prod_nom,
            'Non récupéré'
        FROM
            emprunt
            INNER JOIN client ON emprunt_cl_id = cl_id
            INNER JOIN produit ON emprunt_prod_id = prod_id
        WHERE
            emprunt_recupere = 0
    ) AS liste
GROUP BY
    1,
    2
ORDER BY
    1,
    2 DESC;

-- 11. Afficher les clients qui ont emprunté au moins un produit de chaque type (livre, film, disque)
SELECT
    cl_nom,
    cl_mail
FROM
    client
WHERE
    cl_id IN (
        SELECT
            emprunt_cl_id
        FROM
            emprunt
            INNER JOIN produit ON emprunt_prod_id = prod_id
            LEFT OUTER JOIN livre ON prod_id = livre_id
            LEFT OUTER JOIN film ON prod_id = film_id
            LEFT OUTER JOIN disque d ON prod_id = disque_id
        GROUP BY
            emprunt_cl_id
        HAVING
            COUNT(
                DISTINCT CASE
                    WHEN livre_id IS NOT NULL THEN 'Livre'
                    WHEN film_id IS NOT NULL THEN 'Film'
                    WHEN disque_id IS NOT NULL THEN 'Disque'
                END
            ) = 3
    );