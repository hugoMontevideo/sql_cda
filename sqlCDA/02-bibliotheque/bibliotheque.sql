
-- 1. Quel est l'id_abonne de Laura ?

SELECT id_abonne as 'identifiant' FROM `abonne` WHERE prenom = 'Laura';

-- 2. L'abonné d'id_abonne 2 est venu emprunter un livre à quelles dates (date_sortie) ?
SELECT id_abonne, date_sortie AS emprunts_date FROM emprunt WHERE id_abonne = 2;

-- 3. Combien d'emprunts ont été effectués en tout ?
SELECT COUNT(id_emprunt) AS nb_emprunts FROM emprunt;

-- 4. Combien de livres sont sortis le 2011-12-19 ?
SELECT COUNT(id_emprunt) FROM emprunt WHERE date_sortie = '2011-12-19';

-- 5. Une Vie est de quel auteur ?
SELECT auteur FROM livre WHERE titre = 'Une Vie';

-- 6. De combien de livres d'Alexandre Dumas dispose-t-on ?
SELECT COUNT(id_livre) FROM livre WHERE auteur = 'Alexandre Dumas';

-- 7. Quel id_livre est le plus emprunté ?
SELECT id_livre, COUNT(id_emprunt) AS nombre FROM emprunt GROUP BY id_livre ORDER BY nombre DESC LIMIT 0,1;
