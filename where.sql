-- WHERE
SELECT *
FROM post
WHERE id <= 50;

SELECT *
FROM post
WHERE estatus = 'activo'; --'inactivo'

SELECT *
FROM post
WHERE id != 50;

SELECT *
FROM post
WHERE titulo LIKE '%escandalo%' --'escandalo%' '%escandalo'

SELECT *
FROM post
WHERE fecha_publicacion < '2025-01-01';

SELECT *
FROM post
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31';

--BETWEEN si considera el rango completo por lo que estan incluidos
SELECT *
FROM post
WHERE id BETWEEN 50 AND 60;

SELECT *
FROM post
WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';

SELECT *
FROM post
WHERE month(fecha_publicacion) = 04;

SELECT *
FROM post
WHERE usuario_id IS NOT NULL;

SELECT *
FROM post
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo'
    AND id < 50
    AND categoria_id = 2
    AND YEAR(fecha_publicacion) = '2025';


