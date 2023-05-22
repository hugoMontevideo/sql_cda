insert INTO employes (prenom,nom,sexe,service,date_embauche,salaire) values ('alexis', 'richy', 'm', 'informatique', '2011-12-28', 1800);

SELECT * FROM employes;

INSERT INTO employes VALUES (NULL, 'John', 'Doe', 'm', 'communication', '2019-12-15', 2000);

UPDATE employes SET salaire = 1871 WHERE id_employes = 699;


start transaction;

rollback


create view vue_femme as SELECT * from employes WHERE sexe ='f';

SHOW tables;

SELECT * from vue_femme WHERE sexe ='f';

update vue_femme set salaire = 6000;

drop view vue_femme;

CREATE TEMPORARY TABLE temp SELECT * FROM employes WHERE sexe = 'f';

SELECT * from temp;

SELECT DATE_ADD('2023-02-20', INTERVAL 20 DAY);

SHOW GLOBAL VARIABLES like 'event_scheduler';

show events \G 

SELECT * from employes;

DROP EVENT IF EXISTS enregistrement_employes 


