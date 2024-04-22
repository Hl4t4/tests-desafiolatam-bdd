CREATE DATABASE desafio_m5_jose_latapiatt;
\c desafio_m5_jose_latapiatt;

-- create DATABASE prueba5_test;
-- \c prueba5_test;

-- Punto 1

CREATE TABLE Peliculas (
    id_pelicula SERIAL UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    anno INT NOT NULL,
    PRIMARY KEY (id_pelicula)
);

CREATE TABLE Tags (
    id_tag SERIAL UNIQUE NOT NULL,
    tag VARCHAR(32) NOT NULL,
    PRIMARY KEY (id_tag)
);

CREATE TABLE PeliculasTags (
    id_relacion SERIAL UNIQUE NOT NULL,
    id_pelicula INT NOT NULL,
    id_tag INT NOT NULL,
    PRIMARY KEY (id_relacion),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula),
    FOREIGN KEY (id_tag) REFERENCES Tags (id_tag)
);


-- Punto 2

INSERT INTO Peliculas (nombre, anno)
VALUES 
('El Señor de los anillos', 2001),
('Salvar al soldado Ryan', 1998),
('Regreso al futuro', 1985),
('Monstruos S.A.', 2001),
('Buscando a Nemo', 2003);

INSERT INTO Tags (tag)
VALUES 
('Aventura'),
('Fantasia'),
('Accion'),
('Historico'),
('Animada');

INSERT INTO PeliculasTags (id_pelicula, id_tag)
VALUES
(1,1),
(1,2),
(1,3),
(2,3),
(2,4);

-- Punto 3
SELECT Peliculas.*, COUNT(PeliculasTags.id_pelicula)
FROM Peliculas LEFT JOIN PeliculasTags ON Peliculas.id_pelicula = PeliculasTags.id_pelicula
GROUP BY Peliculas.id_pelicula;

-- Punto 4


CREATE TABLE Preguntas (
    pregunta_id SERIAL UNIQUE NOT NULL,
    pregunta VARCHAR(255) NOT NULL,
    respuesta_correcta VARCHAR NOT NULL,
    PRIMARY KEY (pregunta_id)
);

CREATE TABLE Usuarios (
    usuario_id SERIAL UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    PRIMARY KEY (usuario_id)
);

CREATE TABLE Respuestas (
    respuesta_id SERIAL UNIQUE NOT NULL,
    respuesta VARCHAR(255) NOT NULL,
    usuario_id INT NOT NULL,
    pregunta_id INT NOT NULL,
    PRIMARY KEY (respuesta_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (usuario_id),
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas (pregunta_id)
);

-- Punto 5

INSERT INTO Preguntas (pregunta, respuesta_correcta)
VALUES
('Capital de Francia?', 'Paris'),
('Que hace la marca 3M?', 'De Todo'),
('Resolucion mas utilizada en monitores?', '1920x1080'),
('Mayor causante de muertes?', 'Mosquitos'),
('Religiones mas populares?', 'Religiones abrahamicas');

INSERT INTO Usuarios (nombre, edad)
VALUES 
('Jose', 29),
('Jaime', 21),
('Andrea', 35);

INSERT INTO Respuestas (respuesta, usuario_id, pregunta_id)
VALUES
('Paris', 1, 1),
('Paris', 2, 1),
('De Todo', 3, 2),
('640x480', 1, 3),
('Humanos', 3, 4);

-- Punto 6

SELECT Respuestas.usuario_id, COUNT(Preguntas.*) AS "Respuestas Correctas"
FROM Respuestas LEFT JOIN Preguntas ON Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Respuestas.usuario_id;

-- Datos extras para probar resultados

INSERT INTO Usuarios (nombre, edad)
VALUES 
('Mario', 50);

INSERT INTO Respuestas (respuesta, usuario_id, pregunta_id)
VALUES
('Humanos', 4, 5);

SELECT Respuestas.usuario_id, COUNT(Preguntas.*) AS "Respuestas Correctas"
FROM Respuestas LEFT JOIN Preguntas ON Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Respuestas.usuario_id;

-- Punto 7

SELECT Preguntas.pregunta, COUNT(Respuestas.*) AS "Usuarios con la respuesta correcta"
FROM Respuestas RIGHT JOIN Preguntas ON Respuestas.respuesta = Preguntas.respuesta_correcta
GROUP BY Preguntas.pregunta;

-- Punto 8

\d Respuestas

ALTER TABLE Respuestas 
DROP CONSTRAINT respuestas_usuario_id_fkey,
ADD CONSTRAINT respuestas_usuario_id_fkey
    FOREIGN KEY (usuario_id) 
    REFERENCES Usuarios (usuario_id)
    ON DELETE CASCADE;

\d Respuestas

DELETE FROM Usuarios 
WHERE usuario_id = 1;

-- Punto 9

ALTER TABLE Usuarios
ADD CONSTRAINT edad_usuarios CHECK (edad >= 18);

\d Usuarios

-- Ahora falla
INSERT INTO Usuarios (nombre, edad)
VALUES 
('Mario', 5);

-- Punto 10

ALTER TABLE Usuarios
ADD COLUMN email VARCHAR(255) UNIQUE;

\d Usuarios