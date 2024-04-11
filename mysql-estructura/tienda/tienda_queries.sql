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