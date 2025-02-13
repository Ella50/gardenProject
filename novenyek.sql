CREATE TABLE novenyek ( /*faj*/
    id int NOT NULL
    PRIMARY KEY (id)
    magyar_nev varchar(50),
    latin_nev varchar(50),
    fajta_id int NOT NULL,
    FOREIGN KEY (fajta_id) REFERENCES fajta(id)
)

CREATE TABLE kapcsolat (
    noveny1_id int NOT NULL,
    noveny2_id int NOT NULL,
    kapcsolatuk varchar(50)
    FOREIGN KEY (noveny1_id) REFERENCES novenyek(id)
    FOREIGN KEY (noveny2_id) REFERENCES novenyek(id)
)

CREATE TABLE fajta (
    id int not NULL 
    PRIMARY KEY (id),
    nev varchar(50)
    sor_tav int,
    to_tav int
)



INSERT INTO novenyek (id, magyar_nev, latin_nev, fajta_id)
VALUES
(1, 'Sárgarépa', 'Daucus Carota', 1),
(2, 'Paradicsom', 'Solanum lycopersicum', 2),
(3, 'Káposzta', 'Brassica oleracea', 3),



INSERT INTO fajta (id, nev, sor_tav, to_tav)
(1, 'Nantes', 30, 5),
(1, 'Chantenay', 30, 5),

(2, 'Cherry', 60, 40)
(2, 'Roma', 60, 40)

(3, 'Fehér Káposzta', 50, 30)
(3, 'Kelkáposzta', 50, 30)




INSERT INTO kapcsolat (noveny1_id, noveny2_id, kapcsolatuk)
VALUES
(1, 2, "Nem szeret")
(2, 3, "Szeret")
