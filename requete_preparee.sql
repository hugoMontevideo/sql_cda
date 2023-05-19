---------------------------------------------- REQUETE PREPAREE -----------------------------------------------------------------
--# Ce passage est � inscrire au tableau :
	--# Cycle: Analyse / Interpretation / Ex�cution (avec les requetes pr�par�e on les analyse, interpr�te, ensuite on effectue que la derni�re �tape sur les 3).
	
PREPARE req FROM 'SELECT * FROM employes WHERE service = "commercial"';

EXECUTE req;
	
PREPARE req2 FROM 'SELECT * FROM abonne WHERE prenom=?'; --#  D�clar� une req pr�par�e (DANS LA SESSION EN COURS)

SET @prenom='laura'; --#  affecte une variable

EXECUTE req2 USING @prenom ; --#  utilise la req pr�par�e

DROP PREPARE req2; --#  supprime req pr�par�e


--# Dur�e de vie tr�s courte, elles sont supprim�es d�s que l'on ferme la console !

--# MySQL dispose de 3 types de variables :
--#     locale (� l'int�rieur d'une proc�dure, cr��e et typ�e avec DECLARE, sans @) ;
--#     utilisateur (valable pour la session, non d�clar�e, non typ�e, pr�fix�e par @) ;
--#     syst�me (port�e globale ou session, pr�-d�finie, pr�fix�e par @@).
--# source: http://mysql.developpez.com/faq/?page=VARIABLES
---------------------------------------------- FIN REQUETE PREPAREE -----------------------------------------------------------------