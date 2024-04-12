-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
-- El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom

SELECT   persona.apellido1, persona.apellido2, persona.nombre as "nombre"
FROM
persona
WHERE tipo = "alumno"
ORDER BY apellido1 ASC;

-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2
FROM
persona
WHERE tipo = "alumno" AND telefono IS NULL;

-- Retorna el llistat dels alumnes que van néixer en 1999
SELECT *
from 
persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;

-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2, nif
FROM
persona
WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE  "%k%";

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre, cuatrimestre, curso, id_grado
FROM
asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. 
-- El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
-- El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT  persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", persona.nombre as "nom", departamento.nombre as "nom del departament"
from 
persona
JOIN profesor ON profesor.id_profesor = persona.id
JOIN departamento ON  departamento.id = profesor.id_departamento
WHERE persona.tipo = "profesor"
ORDER BY persona.apellido1 ASC;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M
SELECT 
-- persona.nombre as "alumno", persona.apellido1, persona.apellido2, persona.nif, 
asignatura.nombre as "assignatura", curso_escolar.anyo_inicio, curso_escolar.anyo_fin
from 
persona
JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.tipo = "alumno" and persona.nif = "26902806M";

-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen 
-- alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015)
SELECT departamento.nombre as "nombre departamento", asignatura.nombre, profesor.id_profesor, grado.nombre
FROM departamento
JOIN profesor ON profesor.id_departamento = departamento.id
JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
JOIN grado ON grado.id = asignatura.id_grado
WHERE asignatura.id_grado =4;

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
-- he ocultado otra opciones de resultado en caso si necesitan mas datos especifico.
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2, curso_escolar.anyo_inicio, curso_escolar.anyo_fin 
-- ,alumno_se_matricula_asignatura.id_asignatura, asignatura.nombre
from persona
JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
-- JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
 WHERE curso_escolar.anyo_fin = 2019 and curso_escolar.anyo_inicio = 2018;
-- WHERE alumno_se_matricula_asignatura.id_curso_escolar = 5

-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. 
-- El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
-- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT departamento.nombre as "nombre departamento", persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", persona.nombre, persona.id
from 
persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE persona.tipo = "profesor"
ORDER BY  departamento.nombre ASC;

-- Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT departamento.nombre as "nombre departamento", persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", persona.nombre, persona.id
from 
persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE departamento.nombre IS NULL AND persona.tipo ="profesor"
ORDER BY  departamento.nombre ASC;

-- Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre , profesor.id_profesor
from departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
WHERE profesor.id_profesor IS NULL;

-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT persona.nombre as "nombre", persona.apellido1 as "prim cognom", persona.apellido2 as "segon cognom", asignatura.nombre as "asignatura"
from
persona
LEFT JOIN asignatura ON asignatura.id_profesor = persona.id
WHERE persona.tipo = "profesor" and asignatura.nombre IS NULL;

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asignatura.nombre, asignatura.id_profesor
from
asignatura
where asignatura.id_profesor IS NULL;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT departamento.nombre as "departamento"
 ,asignatura.nombre as "asignatura"
 -- , departamento.id
from
departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE profesor.id_profesor IS NULL;

-- Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS "Total alumnes"
FROM
persona
WHERE tipo = "alumno";

-- Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) AS "Tot alumnes de 1999"
FROM
persona
WHERE YEAR(fecha_nacimiento) = 1999 and tipo = "alumno";

-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, 
-- una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
-- El resultat només ha d'incloure els departaments que tenen professors/es associats
--  i haurà d'estar ordenat de major a menor pel nombre de professors/es.


SELECT 
departamento.nombre as "departamento", COUNT(DISTINCT profesor.id_profesor) as "nr profe"
from 
departamento
JOIN profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor) DESC;

-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
-- Tingui en compte que poden existir departaments que no tenen professors/es associats. 
-- Aquests departaments també han d'aparèixer en el llistat.

SELECT
departamento.nombre as "departamento", COUNT(DISTINCT profesor.id_profesor) as "nr profe"
from
departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor) DESC;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
-- Tingues en compte que poden existir graus que no tenen assignatures associades.
-- Aquests graus també han d'aparèixer en el llistat. 
-- El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT DISTINCT grado.nombre as "grado"
 , COUNT(asignatura.id_grado) as "tot asignaturas"
FROM
grado
LEFT JOIN asignatura ON asignatura.id_grado = grado.id
 GROUP BY grado.nombre
 order by COUNT(asignatura.id_grado) DESC;
 
 -- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, 
 -- dels graus que tinguin més de 40 assignatures associades.
 SELECT grado.nombre as "grado", COUNT(asignatura.id_grado) as "asignatura" 
 from
 grado
 JOIN asignatura ON asignatura.id_grado = grado.id
 GROUP BY grado.nombre
 HAVING COUNT(asignatura.id_grado) > 40
 order by COUNT(asignatura.id_grado) DESC;
 
 -- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
 -- El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
 -- no comprendo muy bien la tarea.... 
  SELECT 
  grado.nombre AS "grado", 
  asignatura.nombre AS "tipo_assignatura", 
  SUM(asignatura.creditos) AS "creditos"
FROM
  grado
JOIN 
  asignatura ON asignatura.id_grado = grado.id
GROUP BY 
  grado.nombre,
  asignatura.nombre
ORDER BY 
  grado.nombre,
  asignatura.nombre;
   /*
   SELECT 
 grado.nombre as "grado", 
--  asignatura.nombre as "asignatura", 
 SUM(asignatura.creditos) as "creditos"
 from
 grado
 JOIN asignatura ON asignatura.id_grado = grado.id
  GROUP BY grado.nombre
 -- , asignatura.nombre
  ORDER BY SUM(asignatura.creditos);
  */
  
  -- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. 
  -- El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
 SELECT curso_escolar.anyo_inicio as "any inici", COUNT(alumno_se_matricula_asignatura.id_alumno) as "nr alumnos"
 from 
 curso_escolar
 JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
 group by curso_escolar.anyo_inicio;
 
 -- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. 
 -- El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. 
 -- El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. 
 -- El resultat estarà ordenat de major a menor pel nombre d'assignatures.
 SELECT 
 persona.id as "id", persona.nombre as "nombre", 
 persona.apellido1 as "primer cognom", persona.apellido2 as "segon cognom", 
 COUNT(asignatura.nombre) as "asignatura"
 FROM persona
 LEFT JOIN asignatura ON asignatura.id_profesor = persona.id
group by persona.id, persona.apellido1
 order by COUNT(asignatura.nombre) DESC;
 
-- Retorna totes les dades de l'alumne/a més jove
SELECT * 
from
persona
where tipo ="alumno"
order by fecha_nacimiento DESC
limit 1;

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT persona.nombre as "profe", departamento.nombre as "departamento"
, asignatura.nombre as "asignatura"
from
persona
JOIN profesor ON profesor.id_profesor = persona.id
JOIN departamento ON departamento.id = profesor.id_departamento
left JOIN asignatura ON asignatura.id_profesor = persona.id and asignatura.id_profesor is null
-- where asignatura.id_profesor is null
 