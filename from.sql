-- FROM
-- Ejemplo de conjuntos diagrama de Venv

SELECT *
FROM post;

SELECT *
FROM usuarios
    LEFT JOIN post on usuarios.id = post.usuario_id;

SELECT *
FROM usuarios
    LEFT JOIN post on usuarios.id = post.usuario_id
WHERE post.usuario_id IS NULL;

SELECT *
FROM usuarios
    RIGHT JOIN post on usuarios.id = post.usuario_id;

SELECT *
FROM usuarios
    RIGHT JOIN post on usuarios.id = post.usuario_id
WHERE post.usuario_id IS NULL;

SELECT *
FROM usuarios
    INNER JOIN post on usuarios.id = post.usuario_id;

SELECT *
FROM usuarios
    JOIN post on usuarios.id = post.usuario_id;

    SELECT *
    FROM usuarios
        LEFT JOIN post ON usuarios.id = post.usuario_id
UNION
    SELECT *
    FROM usuarios
        RIGHT JOIN post ON usuarios.id = post.usuario_id;

    SELECT *
    FROM usuarios
        LEFT JOIN post on usuarios.id = post.usuario_id
    WHERE	post.usuario_id IS NULL
UNION
    SELECT *
    FROM usuarios
        RIGHT JOIN post on usuarios.id = post.usuario_id
    WHERE	post.usuario_id IS NULL;