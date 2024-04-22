-- Punto 1

CREATE DATABASE peliculas;
\c peliculas;

-- CREATE DATABASE peliculas_testing;
-- \c peliculas_testing;

-- Punto 2

CREATE TABLE peliculas (
    id INT UNIQUE NOT NULL,
    Pelicula VARCHAR,
    "Año estreno" INT,
    Director VARCHAR
);

COPY peliculas (id,Pelicula,"Año estreno",Director)
FROM 'E:\proyectos\bootcamp\tests-desafiolatam-bdd\desafio-03\peliculas.csv' 
DELIMITER ',' 
CSV HEADER;

CREATE TABLE reparto (
    id_pelicula INT NOT NULL,
    actor VARCHAR
);

COPY reparto (id_pelicula,actor)
FROM 'E:\proyectos\bootcamp\tests-desafiolatam-bdd\desafio-03\reparto.csv' 
DELIMITER ',' 
CSV HEADER;

-- punto 3
SELECT id, Pelicula
FROM peliculas 
WHERE Pelicula = 'Titanic';

-- Punto 4

SELECT Pelicula, actor 
FROM peliculas INNER JOIN reparto 
ON peliculas.id = reparto.id_pelicula
WHERE Pelicula = 'Titanic';

-- Punto 5 se asume que los actores solo aparecen una vez por pelicula en el csv de reparto

SELECT COUNT(actor), actor
FROM reparto
WHERE actor = 'Harrison Ford'
GROUP BY actor;

-- Punto 6

SELECT * 
FROM peliculas
WHERE "Año estreno" >= 1990 AND "Año estreno" <= 1999
ORDER BY Pelicula;

-- Punto 7

SELECT Pelicula, LENGTH(Pelicula) as longitud_titulo
FROM peliculas;

-- Punto 8 no preguntan por el nombre de la pelicula, solo la longitud

SELECT MAX(LENGTH(Pelicula))
FROM peliculas;