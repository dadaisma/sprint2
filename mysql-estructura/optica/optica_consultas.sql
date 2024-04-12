
-- Llista el total de factures d'un client/a en un període determinat.
SELECT COUNT(*) AS "total de facturas 2023", cliente.nombre as "nombre cliente"
FROM venta
JOIN  optica.cliente ON venta.id_cliente = cliente.id_cliente
WHERE venta.id_cliente = 2 AND YEAR(venta.fecha_registro) = 2023;


-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT 
m.nombre AS nombre_marca, 
e.nombre AS nombre_empleado,

COUNT(*) AS totale_gafas_vendido_por_empleado_2023
FROM venta v
JOIN gafas g ON  v.id_gafas = g.id_gafas
JOIN marca m ON g.id_marca = m.id_marca
JOIN empleado e ON v.id_empleado = e.id_empleado
WHERE v.id_empleado = 4 
AND YEAR(v.fecha_registro) = 2023
GROUP BY m.nombre, e.nombre;


-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT provedor.nombre AS nombre_provedor
FROM venta
JOIN gafas ON gafas.id_gafas = venta.id_gafas
JOIN marca ON gafas.id_marca = marca.id_marca
JOIN provedor ON marca.id_provedor = provedor.id_provedor;

-- Extra lista cliente referenciador y referenciado
SELECT 
c1.nombre AS cliente_referenciador,
c2.nombre AS cliente_referenciado
FROM
cliente c1
JOIN 
cliente c2 ON c1.id_cliente = c2.id_cliente_recomendado;


