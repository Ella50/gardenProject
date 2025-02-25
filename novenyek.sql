DROP TABLE IF EXISTS novenyek;
DROP TABLE IF EXISTS fajta;
DROP TABLE IF EXISTS kapcsolat;

CREATE TABLE fajta (
    id int NOT NULL,
    nev varchar(50),
    sor_tav int,
    to_tav int,
    PRIMARY KEY (id)
);

CREATE TABLE novenyek ( /*faj --> pl. paradicsom*/
    id int NOT NULL,
    magyar_nev varchar(50),
    latin_nev varchar(50),
    fajta_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fajta_id) REFERENCES fajta(id)
);


CREATE TABLE kapcsolat (
    noveny1_id int NOT NULL,
    noveny2_id int NOT NULL,
    kapcsolatuk varchar(50) NOT NULL, 
    FOREIGN KEY (noveny1_id) REFERENCES novenyek(id),
    FOREIGN KEY (noveny2_id) REFERENCES novenyek(id)
);


INSERT INTO fajta (id, nev, sor_tav, to_tav)
VALUES
(1, 'Nantes', 30, 5),
(2, 'Chantenay', 30, 5),

(3, 'Cherry', 60, 40),
(4, 'Roma', 60, 40),

(5, 'Fehér Káposzta', 50, 30),
(6, 'Kelkáposzta', 50, 30);



INSERT INTO novenyek (id, magyar_nev, latin_nev, fajta_id)
VALUES
(1, 'Sárgarépa', 'Daucus Carota', 1),
(2, 'Paradicsom', 'Solanum lycopersicum', 3),

(3, 'Káposzta', 'Brassica oleracea', 5),

(4, 'Káposzta', 'valami masik', 6);






INSERT INTO kapcsolat (noveny1_id, noveny2_id, kapcsolatuk)
VALUES
(1, 2, 'Nem szeret'),
(2, 3, 'Szeret');
