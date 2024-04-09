/*
-- Query: SELECT * FROM pizze2.comandes
LIMIT 0, 1000

-- Date: 2024-04-09 13:14
*/
INSERT INTO `` (`id_comanda`,`data_hora`,`tipus_entrega`,`Clients_id_client1`,`Clients_Localitads_id_localitads`,`Clients_Provinces_id_provincia`,`Botigues_id_botiga`,`DettalsComanda_Comandes_id_comanda`,`DettalsComanda_Comandes_Clients_id_client`,`DettalsComanda_Productes_id_producte`) VALUES (1,'2023-11-14 12:00:00','domicili',1,1,1,1,1,1,1);
INSERT INTO `` (`id_comanda`,`data_hora`,`tipus_entrega`,`Clients_id_client1`,`Clients_Localitads_id_localitads`,`Clients_Provinces_id_provincia`,`Botigues_id_botiga`,`DettalsComanda_Comandes_id_comanda`,`DettalsComanda_Comandes_Clients_id_client`,`DettalsComanda_Productes_id_producte`) VALUES (2,'2023-11-19 10:00:00','botiga',2,1,1,2,2,2,2);
INSERT INTO `` (`id_comanda`,`data_hora`,`tipus_entrega`,`Clients_id_client1`,`Clients_Localitads_id_localitads`,`Clients_Provinces_id_provincia`,`Botigues_id_botiga`,`DettalsComanda_Comandes_id_comanda`,`DettalsComanda_Comandes_Clients_id_client`,`DettalsComanda_Productes_id_producte`) VALUES (3,'2023-11-22 10:00:00','botiga',3,2,2,3,3,3,3);

/*
-- Query: SELECT * FROM pizze2.dettalscomanda
LIMIT 0, 1000

-- Date: 2024-04-09 13:15
*/
INSERT INTO `` (`quantitat`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Productes_id_producte`) VALUES (1,1,1,1);
INSERT INTO `` (`quantitat`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Productes_id_producte`) VALUES (2,1,1,6);
INSERT INTO `` (`quantitat`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Productes_id_producte`) VALUES (1,2,2,3);
INSERT INTO `` (`quantitat`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Productes_id_producte`) VALUES (2,2,2,4);
INSERT INTO `` (`quantitat`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Productes_id_producte`) VALUES (6,3,3,5);

-- Query: SELECT * FROM pizze2.repartiments
INSERT INTO `` (`data_hora_entrega`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Empleats_id_empleat`,`Empleats_Botigues_id_botiga`) VALUES ('2023-11-14 13:00:00',1,1,1,1);
INSERT INTO `` (`data_hora_entrega`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Empleats_id_empleat`,`Empleats_Botigues_id_botiga`) VALUES ('2023-11-19 11:00:00',2,2,2,2);
INSERT INTO `` (`data_hora_entrega`,`Comandes_id_comanda`,`Comandes_Clients_id_client`,`Empleats_id_empleat`,`Empleats_Botigues_id_botiga`) VALUES ('2023-11-22 10:44:00',2,3,3,3);
/*
-- Query: SELECT * FROM pizze2.provinces
LIMIT 0, 1000

-- Date: 2024-04-09 12:09
*/
INSERT INTO `` (`id_provincia`,`nom`) VALUES (1,'Barcelona');
INSERT INTO `` (`id_provincia`,`nom`) VALUES (2,'Girona');
INSERT INTO `` (`id_provincia`,`nom`) VALUES (3,'Lleida');
INSERT INTO `` (`id_provincia`,`nom`) VALUES (4,'Tarragona');

/*
-- Query: SELECT * FROM pizze2.empleats
LIMIT 0, 1000

-- Date: 2024-04-09 12:10
*/
INSERT INTO `` (`id_empleat`,`nom`,`cognoms`,`nif`,`telefon`,`tipus_treballador`,`Botigues_id_botiga`) VALUES (1,'Pere','Lluís','12345678A','654321098','repartidor',1);
INSERT INTO `` (`id_empleat`,`nom`,`cognoms`,`nif`,`telefon`,`tipus_treballador`,`Botigues_id_botiga`) VALUES (2,'Jonny','Bel','32323223B','454545452','repartidor',2);
INSERT INTO `` (`id_empleat`,`nom`,`cognoms`,`nif`,`telefon`,`tipus_treballador`,`Botigues_id_botiga`) VALUES (3,'Pippo','Corto','23232323C','332323232','cuiner',3);
INSERT INTO `` (`id_empleat`,`nom`,`cognoms`,`nif`,`telefon`,`tipus_treballador`,`Botigues_id_botiga`) VALUES (4,'Wanda','Lea','32323232W','121212122','repartidor',4);
INSERT INTO `` (`id_empleat`,`nom`,`cognoms`,`nif`,`telefon`,`tipus_treballador`,`Botigues_id_botiga`) VALUES (5,'Renzo','Film','32323232Q','323232332','repartidor',1);
/*
-- Query: SELECT * FROM pizze2.botigues
LIMIT 0, 1000

-- Date: 2024-04-09 12:12
*/
INSERT INTO `` (`id_botiga`,`address`,`postal code`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (1,'Carrer Major, 5','8001',1,1);
INSERT INTO `` (`id_botiga`,`address`,`postal code`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (2,'Carrer del Sol, 6','8002',1,1);
INSERT INTO `` (`id_botiga`,`address`,`postal code`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (3,'Carrer de la Lluna, 7','8003',2,2);
INSERT INTO `` (`id_botiga`,`address`,`postal code`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (4,'Carrer de les Estrelles, 8','8004',2,2);
/*
-- Query: SELECT * FROM pizze2.categories
LIMIT 0, 1000

-- Date: 2024-04-09 12:13
*/
INSERT INTO `` (`id_categoria`,`nom`) VALUES (1,'Pizzes');
INSERT INTO `` (`id_categoria`,`nom`) VALUES (2,'Hamburgueses');
INSERT INTO `` (`id_categoria`,`nom`) VALUES (3,'Begudes');
/*
-- Query: SELECT * FROM pizze2.clients
LIMIT 0, 1000

-- Date: 2024-04-09 12:14
*/
INSERT INTO `` (`id_client`,`name`,`surname`,`address`,`postalcode`,`phone`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (1,'Joan','Garcia','Carrer Major, 1','8001','123456789',1,1);
INSERT INTO `` (`id_client`,`name`,`surname`,`address`,`postalcode`,`phone`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (2,'Maria','Pérez','Carrer del Sol, 2','8002','987654321',1,1);
INSERT INTO `` (`id_client`,`name`,`surname`,`address`,`postalcode`,`phone`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (3,'Josep','Martínez','Carrer de la Lluna, 3','8003','123456789',2,2);
INSERT INTO `` (`id_client`,`name`,`surname`,`address`,`postalcode`,`phone`,`Localitads_id_localitads`,`Provinces_id_provincia`) VALUES (4,'Anna','López','Carrer de les Estrelles, 4','8004','987654321',2,2);
/*
-- Query: SELECT * FROM pizze2.productes
LIMIT 0, 1000

-- Date: 2024-04-09 12:16
*/
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (1,'pizza','Margarita','Pizza tradicional amb mozzarella i tomàquet',?,10.00,1);
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (2,'pizza','Quatre formatges','Pizza amb mozzarella, gorgonzola, provolone i parmesà',?,12.00,1);
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (3,'hamburguesa','Bacon cheeseburger','Hamburguesa amb carn de vedella, bacon, formatge cheddar i enciam',?,8.00,2);
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (4,'hamburguesa','Vegetariana','Hamburguesa amb pa de sègol, falafel, hummus i verdures',?,7.00,2);
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (5,'beguda','Coca-Cola','Refresc de cola',?,2.00,3);
INSERT INTO `` (`id_producte`,`tipus`,`nom`,`description`,`image`,`preu`,`Categories_id_categoria`) VALUES (6,'beguda','Aigua','Aigua mineral',?,1.50,3);
/*
-- Query: SELECT * FROM pizze2.localitads
LIMIT 0, 1000

-- Date: 2024-04-09 12:18
*/
INSERT INTO `` (`id_localitads`,`name`,`Provinces_id_provincia`) VALUES (1,'Barcelona',1);
INSERT INTO `` (`id_localitads`,`name`,`Provinces_id_provincia`) VALUES (2,'Girona',2);
INSERT INTO `` (`id_localitads`,`name`,`Provinces_id_provincia`) VALUES (3,'Lleida',3);
INSERT INTO `` (`id_localitads`,`name`,`Provinces_id_provincia`) VALUES (4,'Tarragona',4);

