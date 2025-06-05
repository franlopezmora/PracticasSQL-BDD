--Ejercicio 1
SELECT E.nombre AS "Nombre Empleado", E.depto_id AS "Depto", D.nombre AS "Nombre Departamento"
FROM empleados E
INNER JOIN depto D ON E.depto_id = D.id

--Ejercicio 2
SELECT D.id AS "Numero Departamento", R.name, R.id "Numero Region"
FROM depto D
INNER JOIN region R ON D.id_region = R.id

--Ejercicio 3
SELECT E.apellido, R.name, E.porcent_comision
FROM empleados E
INNER JOIN depto D ON E.depto_id = D.id
INNER JOIN region R ON D.id_region = R.id
WHERE E.porcent_comision is not null

--Ejercicio 4
SELECT E.apellido, E.salario, E.depto_id AS "Numero Depto", D.nombre AS "Nombre Depto"
FROM empleados E
INNER JOIN depto D ON E.depto_id = D.id
WHERE (E.depto_id = '44' AND E.salario >= 1000) OR E.depto_id = '42'

--Ejercicio 5
SELECT E.nombre AS empleado_nombre, E.id AS empleado_id, E.id_jefe, COALESCE(J.nombre, 'Sin jefe') AS nombre_jefe
FROM empleados E
LEFT JOIN empleados J ON E.id_jefe = J.id;

--Ejercicio 6
SELECT DISTINCT E.nombre, E.apellido
FROM empleados E
INNER JOIN clientes C ON E.id = C.id_vendedor
INNER JOIN pedido P ON P.id_cliente = C.id
WHERE E.titulo = 'Representante de Ventas' AND ( C.pais = 'USA' OR C.pais = 'Mexico' ) AND (P.fecha_pedido >= '1992-09-01' AND P.fecha_pedido <= '1992-09-30')