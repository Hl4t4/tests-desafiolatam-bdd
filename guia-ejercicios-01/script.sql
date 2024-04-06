-- Parte 1

CREATE DATABASE bbdd_gimnasios;
\c bbdd_gimnasios;

CREATE TABLE clientes(
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    rut INT,
    email VARCHAR(50)
);

ALTER TABLE clientes ADD PRIMARY KEY(rut);

CREATE TABLE matriculas(
    monto VARCHAR(50),
    estado BOOLEAN,
    cliente_rut INT REFERENCES clientes(rut)
);

INSERT INTO clientes VALUES ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com');
INSERT INTO clientes VALUES ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com');
INSERT INTO clientes VALUES ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com');
INSERT INTO clientes VALUES ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com');
INSERT INTO clientes VALUES ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com');

INSERT INTO matriculas VALUES ('40000', True, '999999999');
INSERT INTO matriculas VALUES ('40000', False, '888888888');
INSERT INTO matriculas VALUES ('55000', True, '555555555');
INSERT INTO matriculas VALUES ('35000', True, '777777777');
INSERT INTO matriculas VALUES ('60000', False, '666666666');

SELECT email, rut, monto, estado FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut;

-- Ordenado por la tabla resultante
SELECT email, rut, monto, estado FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut ORDER BY matriculas.monto;
-- Ordenando por la tabla matricula
SELECT email, rut, monto, estado FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut ORDER BY monto;

select monto, count(monto) from matriculas group by monto having count(monto) >= 2;

-- Aqui solo muestra todos con count 1
SELECT email, nombre, rut, monto, estado, count(matriculas.*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY email, monto, nombre, rut, estado;

-- No hay ningun resultado como todas tienen count 1
SELECT email, nombre, rut, monto, estado, count(matriculas.*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY email, monto, nombre, rut, estado HAVING count(matriculas.*) >= 2;

-- Parte 2

DELETE FROM matriculas;
DELETE FROM clientes;

ALTER TABLE clientes
    ADD COLUMN cliente_id INT;

ALTER TABLE matriculas
    ADD COLUMN matricula_id INT;

INSERT INTO clientes VALUES ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com', FLOOR(RANDOM()*1000));
INSERT INTO clientes VALUES ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com', FLOOR(RANDOM()*1000));
INSERT INTO clientes VALUES ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com', 123);
INSERT INTO clientes VALUES ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com', 123);
INSERT INTO clientes VALUES ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com', FLOOR(RANDOM()*1000));

INSERT INTO matriculas VALUES ('40000', True, '999999999', FLOOR(RANDOM()*1000));
INSERT INTO matriculas VALUES ('40000', False, '888888888', FLOOR(RANDOM()*1000));
INSERT INTO matriculas VALUES ('55000', True, '555555555', FLOOR(RANDOM()*1000));
INSERT INTO matriculas VALUES ('35000', True, '666666666', FLOOR(RANDOM()*1000));
INSERT INTO matriculas VALUES ('60000', False, '666666666', FLOOR(RANDOM()*1000));

SELECT email, rut, monto, estado, count(*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY email, monto, rut, estado;
SELECT email, nombre, rut, monto, estado, count(matriculas.*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY rut, monto, estado HAVING count(matriculas.*) >= 2;


SELECT email, nombre, rut, count(*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY rut;
SELECT email, nombre, rut, count(*) FROM clientes INNER JOIN matriculas ON clientes.rut = cliente_rut GROUP BY rut HAVING count(*) >= 2;

