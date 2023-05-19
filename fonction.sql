---------------------------------------------- FONCTIONS PREDEFINIES ----------------------------------------------
-- FONCTIONS PREDEFINIES : pr�vue par le langage SQL et ex�cut� par le d�veloppeur.
SELECT DATABASE(); --  indique qu`elle bdd est actuellement s�l�ctionn�
SELECT VERSION(); --  affiche la version de mysql
INSERT INTO employes (prenom) VALUES ('test');
SELECT LAST_INSERT_ID(); --  permet d`afficher le dernier identifiant ins�r�. Si vous ins�rez plusieurs lignes au m�me moment avec une requ�te INSERT, LAST_INSERT_ID() retourne la valeur de la premi�re ligne ins�r�e.
SELECT DATE_ADD('2012-01-02', INTERVAL 31 DAY);	ou SELECT ADDDATE('1998-01-02', 31); --  31 jours plus tard (pratique pour une dur�e de JEU ou d`ench�re ouverte style Ebay)
SELECT CURDATE(); --  Retourne la date du jour au format 'YYYY-MM-DD' (pratique pour afficher les billets de trains non reserv� et pas les anciens d`hier)
SELECT CURDATE() + 0;  --  YYYYMMDD
SELECT CURTIME(); --  Retourne l'heure courante au format 'HH:MM:SS
//SELECT DATE_FORMAT('2012-10-03 22:23:00', '%d/%m/%Y - %H:%i:%s');    --   -> '22:23:00'
SELECT *, DATE_FORMAT(date_rendu,'le %d/%m/%Y') FROM emprunt; --  met les dates au format fran�ais (bibliotheque)
SELECT DAYNAME('2011-03-28'); --  affiche le jour d`une date en particulier
SELECT DAYNAME(CURDATE()); --  affiche le jour que nous sommes aujourd`hui
SELECT DAYOFYEAR('2012-02-03'); --  affiche le num�ro du jour de l`ann�e
SELECT NOW();	--  affiche la date et l`heure du jour
SELECT PASSWORD('mypass');
INSERT INTO abonne (prenom) VALUES(PASSWORD('mypass')) --  permet de crypt� le mdp en algorithme AES
SELECT 1+1;     --  Ce commentaire se continue jusqu`� la fin de la ligne
SELECT CONCAT('a','b','c'); --  Concat�nation : pratique pour r�unir une adresse (adresse, ville, cp)
SELECT CONCAT_WS("-","Premier nom","Deuxi�me nom","Dernier nom"); --  La fonction CONCAT_WS() signifie CONCAT With Separator, c`est-�-dire "concat�nation avec s�parateur"-> 'Premier nom,Deuxi�me nom,Dernier nom'
SELECT CONCAT_WS(" ", id_abonne, prenom) AS 'liste' FROM tic_bibliotheque.abonne ; -- Liste des abonn�s avec leur num�ro dans une seule colonne de r�sultat.
SELECT LENGTH('moi');   --   -> 3
SELECT LOCATE('j', 'aujourdhui'); --  	-> 3
SELECT REPLACE('www.ifocop.fr', 'w', 'W');   --   -> WWW.ifocop.fr 
UPDATE employes set id_secteur = replace(id_secteur, '10', '100');  --  permet de remplacer des valeurs par d`autres dans une colonne!
SELECT SUBSTRING('bonjour',4);  --       -> jour
SELECT TRIM('  bonsoir   ');   --   -> bonsoir
SELECT UPPER('Hey');  --    ou SELECT UPPER(prenom) FROM abonne -> 'HEY'
-- Ne pas pr�senter: ALTER TABLE employes ENGINE = MYISAM; (il faut que la table soit en MYISAM pour pouvoir utiliser la recherche en fulltext, passer ensuite une colonne en indexfulltext) puis taper cette requete: SELECT * FROM employes WHERE MATCH (prenom) AGAINST ('julien'); # http://dev.mysql.com/doc/refman/5.0/fr/fulltext-search.html
SELECT SQL_CALC_FOUND_ROWS * FROM employes; --  permet de connaitre le nombre de r�sultat
SELECT FOUND_ROWS(); --  on peux y avoir acc�s de cette mani�re (pas besoin de relancer une requete avec un count()).
---------------------------------------------- FIN FONCTIONS PREDEFINIES ----------------------------------------------
---------------------------------------------- FONCTIONS UTILISATEUR ---------------------------------------------------
-- FONCTIONS UTILISATEUR : pr�vue, inscrite et ex�cut� par le d�veloppeur pour un traitement sp�cifique.
-- Une fonction permet d'effectuer un traitement en particulier (ex: calcul d`impot avec taux d`imposition, revenu imposable, etc.). il s'agit d'un calcul compliqu�, le but est de le trouver une fois pour l'enferm� dans une fonction que l'on pourra rappeler � volont�e.
-- Un argument dans une fonction permet de compl�ter, modifier ou encore alt�r� le comportement initialement pr�vu par la fonction. (ex: age, sexe, situation viendront en argument car nous avons besoin de les prendres en compte pour calculer le montant de l`impot).
	DELIMITER $ --  on change le d�limiter car en inscrivant la fonction, on devra inscrire des points virugles ";" alors qu'il ne s'agira pas de la fin de notre fonction. On pr�cise donc � la console Mysql qu'elle ne doit pas ex�cut� le code tant qu'elle ne voit pas le signe dollar "$".
	CREATE FUNCTION calcul_tva(nb INT) RETURNS TEXT --  on re�oit un argument INT et on pr�cise que la fonction renverra du texte.
	COMMENT 'Fonction permettant le calcul de la TVA'
	READS SQL DATA
		BEGIN
			RETURN CONCAT_WS(': ','le resultat est', (nb*1.196)); 
		END $
	DELIMITER ;
	SELECT calcul_tva(10);
	------
	--- Exercice : Le m�me calcul de TVA avec le choix du taux
	CREATE FUNCTION calcul_tva(nb INT, taux FLOAT) RETURNS TEXT --  on re�oit un argument INT et on pr�cise que la fonction renverra du texte.
	COMMENT 'Fonction permettant le calcul de la TVA'
	READS SQL DATA
		BEGIN
			RETURN CONCAT_WS(': ','le resultat est', ROUND((nb*taux), 2)); 
		END $
	DELIMITER ;
	SELECT calcul_tva(10,1.196);
	------
	DELIMITER $
	CREATE FUNCTION nombre_employes_par_service(servicerecu VARCHAR(255)) RETURNS INT
	READS SQL DATA -- juste pour lire les donn�es
	BEGIN
		DECLARE resultat INT;
		SELECT count(*) FROM employes WHERE service = servicerecu INTO resultat;
		RETURN resultat;
	END $
	------
	DELIMITER $
	CREATE FUNCTION salaire_brut_en_net(sal INT) RETURNS INT --  on re�oit un argument INT et on pr�cise que la fonction renverra du texte.
	COMMENT 'Fonction permettant le calcul du salaire'
	COTAINS SQL
	BEGIN
		RETURN (sal*0.7915); 
	END $
	DELIMITER ;
	SELECT salaire_brut_en_net(1365);
	SELECT salaire_brut_en_net(2000);
	-- Exemple d'utilisation :
	INSERT INTO employes (prenom, salaire) values ('test2', salaire_brut_en_net(1365));
	SELECT prenom, salaire_brut_en_net(salaire) FROM employes;
	SELECT * FROM employes;
	------

-- - * Dessiner le [SCHEMA9_fonction] *
	
-- NO SQL
	-- Indique que la fonction ne contient aucune instruction SQL. Cette valeur est utilis�e avec un langage non SQL.
	
-- COTAINS SQL
	-- Indique que la fonction contient des instructions SQL qui n'effectuent ni lecture ni modification. c'est la valeur par d�faut.
	
-- READS SQL DATA
	-- Indique que la fonction contient des instructions SELECT ou FETCH.
	
-- MODIFIES SQL DATA
	-- Indique que la fonction contient des instructions INSERT, UPDATE ou DELETE.
	
--https://books.google.fr/books?id=Ialyn2vbUUwC&pg=PA110&lpg=PA110&dq=a+quoi+sert+READS+SQL+DATA&source=bl&ots=x6TLSldGOK&sig=hV-DVlU9LkCA297-b_sRZE7ow8g&hl=fr&sa=X&ved=0ahUKEwiZkfv8mqLOAhUCXhoKHXzJDowQ6AEIQzAE#v=onepage&q=a%20quoi%20sert%20READS%20SQL%20DATA&f=false
	
	
-- - "DETERMINISTIC" pr�cise que le r�sultat reste le m�me si on passe les m�mes param�tres,
-- - "READS SQL DATA" signifie que cette proc�dure ne fait que lire des donn�es, Cette ligne permet d'indiquer au syst�me que notre traitement ne fera que lire (et non pas modifier, supprimer) des donn�es.


SHOW FUNCTION STATUS ; --  permet de voir les fonctions d�clar�es
DROP FUNCTION calcul_tva ; --   supprime une fonction
---------------------------------------------- FIN FONCTIONS UTILISATEUR ----------------------------------------------