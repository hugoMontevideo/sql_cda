SELECT id_vehicule , id_conducteur
FROM association_vehicule_conducteur 
WHERE id_vehicule = 503

-- 1
SELECT prenom
FROM conducteur
WHERE id_conducteur = (SELECT id_conducteur
    FROM association_vehicule_conducteur 
    WHERE id_vehicule = 503
)


SELECT c.prenom, v.modele
FROM conducteur c
INNER JOIN association_vehicule_conducteur a
ON c.id_conducteur = a.id_conducteur
INNER JOIN vehicule v
ON a.id_vehicule = v.id_vehicule
ORDER BY c.prenom; 

insert INTO conducteur (prenom, nom)
VALUES ('moi', 'machado');

SELECT c.prenom, v.modele
FROM conducteur c
LEFT JOIN association_vehicule_conducteur a
ON c.id_conducteur = a.id_conducteur
LEFT JOIN vehicule v
ON v.id_vehicule = a.id_vehicule;

(
SELECT c.prenom, v.modele
FROM conducteur c
LEFT JOIN association_vehicule_conducteur a
ON c.id_conducteur = a.id_conducteur
LEFT JOIN vehicule v
ON v.id_vehicule = a.id_vehicule
)
UNION 
(
SELECT v.modele, c.prenom
FROM vehicule v
LEFT JOIN association_vehicule_conducteur a
ON v.id_vehicule = a.id_vehicule
left join conducteur c
on a.id_conducteur = c.id_conducteur
);

insert INTO vehicule (modele, marque, couleur, immatriculation)
VALUES('Mustang', 'Ford', 'Black', 'AZ-123-ER');

SELECT v.modele, c.prenom
FROM vehicule v
LEFT JOIN association_vehicule_conducteur a
ON v.id_vehicule = a.id_vehicule
left join conducteur c
on a.id_conducteur = c.id_conducteur;
-- ORDER BY modele;

