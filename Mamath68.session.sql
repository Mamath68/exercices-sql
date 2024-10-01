SELECT
    AVG(DATEDIFF (em.emprunt_retour, em.emprunt_date))
FROM
    emprunt em
    INNER JOIN produit p ON em.emprunt_prod_id = p.prod_id
    INNER JOIN livre l ON l.livre_id = p.prod_id
WHERE
    em.emprunt_retour IS NOT NULL;