--  ***********************************
--     SELECT  Le read de notre CRUD
--  **********************************
-- * pour ALL
SELECT *
FROM employes ;  -- affiche toutes les donnees table employe
-- mm

SELECT nom, prenom
FROM employes;

SELECT service
FROM employes;

-- DISTINCT affiche les diff service sans doublons
SELECT DISTINCT service FROM employes;

-- clause WHERE   determine une condition
SELECT * FROM employes WHERE service = 'informatique';

-- LIKE employes dont le prenom commence par s
SELECT * FROM employes WHERE prenom LIKE 's%';

-- LIKE employes dont le prenom commence par e
SELECT * FROM employes WHERE prenom LIKE '%e';

-- LIKE employes dont il y a un tiret dans le prenom
SELECT * FROM employes WHERE prenom LIKE '%-%';


 select * from employes where date_embauche between '2000-01-01' and '2000-12-01';

-- operateurs de comparaison
-- <
-- >
-- <=
-- >=
-- != ou <>
-- ==
select * from employes where service != 'informatique';

-- ORDER BY
-- ASC
-- DESC
SELECT * FROM employes ORDER BY salaire ASC;

SELECT * FROM employes ORDER BY salaire DESC, prenom DESC;



SELECT * FROM employes ORDER BY salaire LIMIT 0,1; -- 0 correspond
-- l'offset (le point de départ du jeu de réultats). Il est defini par defaut à 0 sinon renseigné


SELECT * FROM employes ORDER BY salaire DESC LIMIT 1,1; 

-- attention respecter l'ordre
-- SELECT ... FROM ... WHERE ...  BETWEEN ... ORDER BY ... LIMIT



-- alias AS
SELECT salaire*12 AS salaire_annuel FROM employes;


-- fonctions d'agregat  nomFonction()

-- SUM()
SELECT SUM(salaire*12) AS masse_salariale FROM employes;

-- MIN() et MAX()
-- fonctionne sur dates et chiffres

SELECT MIN(salaire) FROM employes;

-- avg() moyenne
SELECT AVG(salaire) FROM employes;

SELECT round(AVG(salaire)) FROM employes; -- arrondir

SELECT round(AVG(salaire),1) FROM employes; -- arrondir 1 chiffre après la virgule

SELECT count(id_employes) FROM employes where sexe='m';

-- IN  semblable à = mais on peut passer plusieurs parametres
SELECT * FROM employes where service in ('comptabilite','informatique');

-- LIKE
SELECT count(*) FROM employes where date_embauche  like "2010%";

-- AND 
SELECT * FROM employes where service='comptabilite' AND salaire<=2000;

-- GROUP BY
SELECT service, COUNT(*) as nbr_employe_service FROM employes GROUP by service; 

SELECT service, COUNT(*) as nbr_employe_service FROM employes GROUP by service ORDER by service DESC; 

-- GROUP BY ... HAVING
-- CELA EQUIVAUT A UN WHERE DANS UN  GROUP BY
SELECT service, COUNT(*) as nbr_employe_service FROM employes GROUP by service HAVING nbr_employe_service > 1; 



-- exercices

SELECT * FROM `employes` WHERE `id_employes` = 547;

SELECT prenom, nom, date_embauche FROM `employes` WHERE `prenom` = 'Amandine';

SELECT * FROM `employes` WHERE `id_employes` = 547;

SELECT count(*) AS nb_employes_commercial FROM employes where service='commercial';

SELECT count(*) AS nb_employes_commercial FROM employes where service='commercial';

SELECT nom, salaire*12 AS salaire_annuel FROM employes WHERE service="commercial";

SELECT service, AVG(salaire) FROM employes GROUP BY service ;

SELECT count(*) FROM employes where date_embauche  like "2010%";
-- 8

SELECT service, AVG(salaire) FROM employes GROUP BY service ;

SELECT DISTINCT service FROM employes;

SELECT service, count(*) AS nb_employes_service FROM employes GROUP by service;

SELECT * FROM employes where service='commercial' ORDER by salaire DESC LIMIT 1;

SELECT * FROM employes ORDER by date_embauche;

SELECT * FROM employes ORDER by date_embauche DESC LIMIT 1;




























