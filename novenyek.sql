DROP TABLE IF EXISTS novenyek;
DROP TABLE IF EXISTS fajta;
DROP TABLE IF EXISTS kapcsolat;

CREATE TABLE fajta (
    id int NOT NULL,
    nev varchar(50),
    novenyek_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (novenyek_id) REFERENCES novenyek(id)
);

CREATE TABLE novenyek (
    id int NOT NULL,
    magyar_nev varchar(50),
    latin_nev varchar(50),
    sor_tav int,
    to_tav int,
    kep varchar(50),
    PRIMARY KEY (id)
);


CREATE TABLE kapcsolat (
    noveny1_id int NOT NULL,
    noveny2_id int NOT NULL,
    kapcsolatuk varchar(50) NOT NULL, 
    FOREIGN KEY (noveny1_id) REFERENCES novenyek(id),
    FOREIGN KEY (noveny2_id) REFERENCES novenyek(id)
);


INSERT INTO fajta (id, nev, novenyek_id)
VALUES
(1, 'Nantes', 1),
(2, 'Imperator ', 1),

(3, 'Cherry', 2),
(4, 'Roma', 2),

(5, 'Savoy',3),
(6, 'Red Cabbage',3),

(7, 'Marketmore', 5),
(8, 'Lemon',5),

(9, 'Calabrese', 4),
(10, 'Romanesco',4),

(11, 'Silver Queen',6),
(12, 'Golden Bantam',6),

(13, 'Softneck',7),
(14, 'Hardneck',7),

(15, 'Sweet Bell',8),
(16, 'Jalapeño',8),

(17, 'Butternut',9),
(18, 'Zucchini',9),

(19, 'Sugar Snap', 10),
(20, 'Green Arrow', 10),

(21, 'Chioggia', 12),
(22, 'Detroit Dark Red', 12),

(23, 'Cherry Belle', 13),
(24, 'White Icicle', 13),

(25, 'Black Beauty', 11),
(26, 'Listada de Gandia', 11),

(27, 'Tyee', 14),
(28, 'Bloomsdale', 14),

(29, 'Broad Windsor',15),
(30, 'Aquadulce Claudia', 15),

(31, 'Hard Red Winter', 16),
(32, 'Soft Red Winter', 16),

(33, 'Yukon Gold',17),
(34, 'Russet', 17),

(35, 'Granny Smith', 18),
(36, 'Fuji', 18),

(37, 'Turkish Filbert', 19),
(38, 'Hazel', 19),

(39, 'Red Latham',20),
(40, 'Heritage', 20);


INSERT INTO novenyek (id, magyar_nev, latin_nev, sor_tav, to_tav, kep)
VALUES
(1, 'Sárgarépa', 'Daucus carota', 30, 5, 'novenyek/repa.png'),
(2, 'Paradicsom', 'Solanum lycopersicum', 70, 30, 'novenyek/paradicsom.png'),
(3, 'Káposzta', 'Brassica oleracea', 50, 40, 'novenyek/kaposzta.png'),
(4, 'Brokkoli', 'Brassica oleracea var. italica', 50, 40, 'novenyek/brokkoli.png'),
(5, 'Uborka', 'Cucumis sativus', 100, 40, 'novenyek/uborka.png'),
(6, 'Kukorica', 'Zea mays', 75, 30, 'novenyek/kukorica.png'),
(7, 'Fokhagyma', 'Allium sativum',30, 10, 'novenyek/fokhagyma.png'),
(8, 'Paprika', 'Capsicum annuum', 50, 40, 'novenyek/paprika.png'),
(9, 'Tök', 'Cucurbita pepo', 120, 90, 'novenyek/tok.png'),
(10, 'Borsó', 'Pisom sativum', 60, 20, 'novenyek/borso.png'),
(11, 'Padlizsán', 'Solanum melongena', 60, 40, 'novenyek/padlizsan.png'),
(12, 'Cékla', 'Beta vulgaris', 30, 8, 'novenyek/cekla.png'),
(13, 'Retek', 'Raphanus sativus', 20, 5, 'novenyek/retek.png'),
(14, 'Spenót', 'Spinicia oleracea', 30, 5, 'novenyek/spenot.png'),
(15, 'Bab', 'Vicia faba', 50, 15, 'novenyek/bab.png'),
(16, 'Búza', 'Triticum aestivum', 30, 5, 'novenyek/buza.png'),
(17, 'Burgonya', 'Solanum tuberosum', 75, 30, 'novenyek/burgonya.png'),
(18, 'Mogyoró', 'Corylus avellana', 400, 300, 'novenyek/mogyoro.png'),
(19, 'Almafa', 'Malus domestica', 300, 300, 'novenyek/alma.png'),
(20, 'Málna', 'Rubus idaeus', 200, 40, 'novenyek/malna.png');


INSERT INTO kapcsolat (noveny1_id, noveny2_id, kapcsolatuk)
VALUES
(1, 7, 'szeret'),

(2, 3, 'nem'),
(2, 17, 'nem'),
(2, 6, 'szeret'),

(3, 7, 'szeret'),
(3, 10, 'szeret'),
(3, 2, 'nem'),

(4, 13, 'szeret'),
(4, 1, 'szeret'),
(4, 2, 'nem'),

(5, 17, 'nem'),
(5, 2, 'nem'),
(5, 15, 'szeret'),

(6, 2, 'szeret'),
(6, 15, 'szeret'),
(6, 3, 'nem'),

(7, 1, 'szeret'),
(7, 3, 'szeret'),
(7, 10, 'nem'),
(7, 17, 'nem'),

(8, 17, 'nem'),

(9, 6, 'szeret'),
(9, 15, 'szeret'),
(9, 3, 'nem'),
(9, 17, 'nem'),

(10, 6, 'szeret'),
(10, 1, 'szeret'),
(10, 7, 'nem'),

(11, 15, 'szeret'),
(11, 2, 'szeret'),
(11, 8, 'szeret'),
(11, 17, 'nem'),
(11, 7, 'nem'),


(12, 4, 'szeret'),
(12, 3, 'nem'),
(12, 17, 'nem'),

(13, 4, 'szeret'),
(13, 3, 'nem'),

(14, 1, 'szeret'),
(14, 12, 'nem'),
(14, 15, 'nem'),

(15, 3, 'szeret'),
(15, 6, 'szeret'),
(15, 2, 'nem'),
(15, 17, 'nem'),

(16, 10, 'szeret'),
(16, 3, 'nem'),

(17, 6, 'szeret'),
(17, 3, 'szeret'),
(17, 2, 'nem'),

(18, 19, 'nem'),

(19, 3, 'nem'),
(19, 17, 'nem'),

(20, 19, 'szeret'),
(20, 3, 'nem'),
(20, 2, 'nem');

