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