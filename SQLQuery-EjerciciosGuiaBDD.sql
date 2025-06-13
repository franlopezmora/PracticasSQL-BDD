SELECT E.*
FROM Equipos E
JOIN Resultados R ON R.IDEquipoVisit = E.ID
JOIN Fechas F ON R.NroFecha = F.Nro
WHERE E.ID IN 
( SELECT X.IDEquipoVisit
FROM Resultados X
JOIN Fechas F ON
WHERE YEAR(F.Fechas) = 2013
GROUP BY X.IDEquipoVisit
HAVING COUNT(*) > 20
)
AND EXISTS 
( SELECT 1
FROM JugadoresxEquipo JE
JOIN Jugador_Tecnico J ON JE.DNIJugador = J.DNI
WHERE J.FecNacim > 1990 AND (J.Nombre LIKE 'Juan' OR J.Apellido LIKE 'JUAN')
AND JE.IDEquipo = E.ID
)



SELECT E.ID, E.Nombre, E.FecAlta, 
FROM Equipos E
JOIN Resultados R ON R.IDEquipoLocal = E.ID
WHERE R.GolesLocales>R.GolesVisitantes
GROUP BY E.ID, E.Nombre, E.FecAlta
HAVING COUNT(*) = ()



SELECT E.ID, E.Nombre, E.FecAlta
FROM Equipos E
JOIN Resultados R ON R.IDEquipoLocal = E.ID
WHERE R.GolesLocales > R.GolesVisitantes
GROUP BY E.ID, E.Nombre, E.FecAlta
HAVING COUNT(*) = (
SELECT MAX(Cant)
FROM (
SELECT COUNT(*) AS Cant
FROM Equipos E2
JOIN Resultados R2 ON R2.IDEquipoLocal = E2.ID
WHERE R2.GolesLocales > R2.GolesVisitantes
GROUP BY E2.ID)
)




SELECT J.*
FROM Fechas F
JOIN Resultados R ON F.Nro = R.NroFecha
JOIN Goles G ON R.NroFecha = G.NroFecha
JOIN Jugador_Tecnico J ON G.DNIJugador = J.DNI
WHERE G.CantGoles >= all 
(
SELECT G2.CantGoles
FROM Goles G2
)
AND R.GolesLocales > R.GolesVisita
GROUP BY J.DNI



UPDATE Remedios R 
SET R.Precio_Lista = (R.Precio_Lista)*1.10
WHERE (R.Id_Laboratorio = 10 OR R.Id_Laboratorio = 18) AND YEAR(R.Fecha_Alta) = YEAR(GetDate()) AND R.Precio_Lista > 70 AND R.Precio_Lista < 700



SELECT D.id, AVG(E.salario) AS Promedio
FROM depto D
JOIN empleados E ON E.depto_id = D.id
GROUP BY D.id
HAVING AVG(E.salario) > 2000


SELECT COUNT(I.item_id) AS "Número de Ítems"
FROM pedido P
JOIN item I ON I.ord_id = P.id
GROUP BY I.item_id
ORDER BY COUNT(I.item_id) DESC






SELECT E.id, EA.salario
FROM empleados E
JOIN empleados EA ON EA.id_jefe = E.id
WHERE EA.salario <= all ( SELECT X.salario
				FROM empleados X
				WHERE X.id_jefe = E.id)
AND EA.salario >= 1000
ORDER BY EA.salario ASC





SELECT (MAX(E.salario) - MAX(E.salario)) AS "Diferencia"
FROM empleados E


SELECT R.id, R.name, COUNT(D.id) AS "Cantidad deptos"
FROM region R
JOIN depto D ON D.id_region = R.id
GROUP BY R.id, R.name




SELECT E.nombre, E.apellido, DAY(E.fecha_ingreso)
FROM empleados E
WHERE E.depto_id IN 
(SELECT X.depto_id
FROM empleados E
WHERE X.apellido = 'Magee'
)



SELECT E.id, E.nombre, E.apellido, E.id_usuario
FROM empleados E
WHERE E.salario > (
SELECT AVG(X.salario)
FROM empleados X
)




SELECT E.apellido, E.depto_id, E.titulo
FROM empleados E
JOIN depto D ON D.id = E.depto_id
JOIN region R ON D.id_region = R.id
WHERE R.id IN 
(SELECT X.id
FROM region X
WHERE X.id = 1 OR X.id = 2
)

--ALTERNATIVA SIN SUBCONSULTA

SELECT E.apellido, E.depto_id, E.titulo
FROM empleados E
JOIN depto D ON D.id = E.depto_id
JOIN region R ON D.id_region = R.id
WHERE R.id IN (1, 2)



