--Ejercicio 1
SELECT E.depto_id, E.apellido, E.id_jefe
FROM empleados E

--Ejercicio 2
SELECT E.apellido, E.salario * 12 AS "sueldo anual", E.porcent_comision
FROM empleados E

--Ejercicio 3
SELECT E.apellido, E.salario, (E.salario * 12 + 100) AS "compensación anual"
FROM empleados E

--Ejercicio 4
SELECT E.apellido, E.salario, E.titulo, ((E.salario) * porcent_comision/100) AS "comis calc"
FROM empleados E

--Ejercicio 5
SELECT DISTINCT(D.nombre)
FROM depto D
WHERE D.nombre LIKE '%O%'

--Ejercicio 6
SELECT E.nombre, E.apellido, E.titulo
FROM empleados E
WHERE E.nombre LIKE 'Magee'

--Ejercicio 7
SELECT *, (I.cantidad * I.precio) AS "Total"
FROM item I
WHERE I.item_id = 1

--Ejercicio 8
SELECT *
FROM empleados E
WHERE E.nombre LIKE 'C%' AND E.nombre LIKE '__r%'

--Ejercicio 9
SELECT *
FROM pedido P
WHERE P.fecha_pedido >= '1992-08-30' AND P.fecha_pedido <= '1992-09-05' AND P.tipo_pago = 'CREDITO' AND ((P.fecha_enviado - P.fecha_pedido) <= 15)
ORDER BY P.fecha_pedido DESC;

--Ejercicio 10
SELECT *
FROM empleados E
WHERE E.id_jefe is NULL

--Ejercicio 11
SELECT *
FROM clientes C
WHERE C.id_vendedor is not NULL

--Ejercicio 12
SELECT C.id, C.nombre, C.direccion
FROM clientes C
WHERE C.pais = 'USA' AND C.id_vendedor = '11'
ORDER BY C.nombre DESC

--Ejercicio 13
SELECT E.nombre, E.apellido, E.fecha_ingreso
FROM empleados E
WHERE E.fecha_ingreso >= '1991-05-09' AND E.fecha_ingreso <= '1991-06-17'