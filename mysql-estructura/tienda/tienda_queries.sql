-- Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre
FROM tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio
FROM tienda.producto;

-- Llista totes les columnes de la taula producto.
SELECT *
FROM tienda.producto;

-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio as precio_EUR, ROUND((precio * 1.08),2) as precio_USD
FROM tienda.producto;

-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS "nom de producto", precio as euros, ROUND((precio * 1.08),2) as dòlars
FROM tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio as precio_EUR, ROUND((precio * 1.08),2) as precio_USD
FROM tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula
SELECT LOWER(nombre), precio as precio_EUR, ROUND((precio * 1.08),2) as precio_USD
FROM tienda.producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna
SELECT nombre, nombre FROM tienda.fabricante;

-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio, 2)
FROM tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, ROUND(precio, 0)
FROM tienda.producto;

-- Llista el codi dels fabricants que tenen productes en la taula producto.
SELECT codigo_fabricante
FROM tienda.producto;

-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante
FROM tienda.producto;

-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre
FROM
tienda.fabricante
ORDER BY nombre ASC;

-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre
FROM
tienda.fabricante
ORDER BY nombre DESC;

-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre as "nombre asc by name"  
FROM
tienda.producto
ORDER BY  nombre ASC;

SELECT nombre as "nombre desc by price" 
FROM
tienda.producto
ORDER BY  precio DESC;

-- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * 
FROM
tienda.fabricante
ORDER BY codigo
LIMIT 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT *
FROM
tienda.fabricante
LIMIT 3,2;

-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). 
-- NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio
FROM 
tienda.producto
order by precio ASC
LIMIT 1;

-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). 
-- NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio
FROM 
tienda.producto
order by precio DESC
LIMIT 1;

-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre
FROM
tienda.producto
WHERE codigo_fabricante =2;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre AS "nombre producto", producto.precio, fabricante.nombre AS "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. 
-- Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre AS "nombre producto", producto.precio, fabricante.nombre AS "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;

-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.codigo as "codigo producto", producto.nombre as "nombre producto", producto.codigo_fabricante as "codigo fabricante", fabricante.nombre as "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre as "nombre producto", producto.precio as "precio", fabricante.nombre as "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre as "nombre producto", producto.precio as "precio", fabricante.nombre as "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;

-- Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre as "nombre producto"
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Lenovo";

-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre as "nombre producto", precio
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Crucial"
and producto.precio > 200;

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre as "nombre producto" , fabricante.nombre as "fabricante"
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus" OR fabricante.nombre ="Hewlett-Packard" OR fabricante.nombre = "Seagate" ;

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
SELECT producto.nombre as "nombre producto" , fabricante.nombre as "fabricante"
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ( "Asus","Hewlett-Packard", "Seagate");

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre as "nombre producto", producto.precio
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE RIGHT(fabricante.nombre, 1)= "e";

-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre as "nombre producto", producto.precio, fabricante.nombre
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE "%w%";

-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. 
-- Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).

SELECT producto.nombre as "nombre producto", producto.precio, fabricante.nombre as "fabricante"
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
 WHERE producto.precio >= 180
 ORDER BY producto.precio DESC;
 
 SELECT producto.nombre as "nombre producto", producto.precio, fabricante.nombre as "fabricante"
FROM
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
 WHERE producto.precio >= 180
 ORDER BY producto.nombre ASC;
 
 -- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
 SELECT DISTINCT fabricante.codigo as "codigo fabricante", fabricante.nombre as "fabricante"
 FROM
 tienda.producto
 JOIN
 tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
 ORDER BY  fabricante.nombre;
 
 -- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. 
 -- El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
 SELECT fabricante.nombre as "fabricante", producto.nombre as "nombre producto"
 FROM
 tienda.fabricante
 LEFT JOIN 
 tienda.producto ON producto.codigo_fabricante = fabricante.codigo
 ORDER BY fabricante.nombre;
 
 -- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
  SELECT fabricante.nombre as "fabricante", producto.nombre as "nombre producto"
 FROM
 tienda.fabricante
 LEFT JOIN 
 tienda.producto ON producto.codigo_fabricante = fabricante.codigo
 WHERE producto.codigo_fabricante IS NULL
ORDER BY fabricante.nombre;

-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre as "nombre producto", fabricante.nombre as "fabricante"
FROM
tienda.producto
CROSS JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Lenovo";

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
SELECT *
FROM
tienda.producto
WHERE precio =( SELECT MAX(precio)
FROM tienda.producto
WHERE codigo_fabricante =(
SELECT codigo
FROM tienda.fabricante
WHERE nombre = "Lenovo"));

-- Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre
FROM
tienda.producto
WHERE precio =( SELECT MAX(precio)
FROM tienda.producto
WHERE codigo_fabricante =(
SELECT codigo
FROM tienda.fabricante
WHERE nombre = "Lenovo"));

-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre
 FROM 
 tienda.producto
 JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
-- WHERE fabricante.nombre = "Hewlett-Packard" 
-- ORDER BY producto.precio ASC
-- LIMIT 1
AND producto.precio = (SELECT MIN(producto.precio)
                       FROM tienda.producto
                       JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
                       WHERE fabricante.nombre = 'Hewlett-Packard'); 

-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre as "nombre producto", producto.precio
 FROM 
 tienda.producto
 WHERE precio >= (SELECT MAX(precio)
FROM tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Lenovo");

-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre as "nombre producto", precio, fabricante.nombre as "fabricante"
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus"
AND producto.precio >(SELECT AVG(precio)
FROM 
tienda.producto
JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = "Asus");
/*
FROM tienda.producto
WHERE codigo_fabricante = ( 
SELECT codigo 
FROM tienda.fabricante
 WHERE nombre = "Asus"));
*/
