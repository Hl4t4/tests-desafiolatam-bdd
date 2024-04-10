CREATE DATABASE desafio2_jose_latapiatt_001;
\c desafio2_jose_latapiatt_001

--------------------------------------------------------------------------------
-- Entregado para el desarrollo

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

--------------------------------------------------------------------------------

SELECT COUNT(*) AS cantidad_registros FROM INSCRITOS;
-- desafio2_jose_latapiatt_001=# SELECT COUNT(*) as cantidad_registros FROM INSCRITOS;
--  cantidad_registros
-- --------------------
--                  16
-- (1 row)

SELECT SUM(cantidad) AS total_inscritos FROM INSCRITOS;
-- desafio2_jose_latapiatt_001=# SELECT SUM(cantidad) as total_inscritos FROM INSCRITOS;
--  total_inscritos
-- -----------------
--              774
-- (1 row)

SELECT * FROM INSCRITOS
WHERE fecha = (
    SELECT MIN(fecha) FROM INSCRITOS
    );
-- desafio2_jose_latapiatt_001=# SELECT * FROM INSCRITOS
-- desafio2_jose_latapiatt_001-# WHERE fecha = (
-- desafio2_jose_latapiatt_001(#     SELECT MIN(fecha) FROM INSCRITOS
-- desafio2_jose_latapiatt_001(#     );
--  cantidad |   fecha    | fuente
-- ----------+------------+--------
--        44 | 2021-01-01 | Blog
--        56 | 2021-01-01 | Página
-- (2 rows)

SELECT fecha AS dia, SUM(cantidad) AS cantidad FROM INSCRITOS GROUP BY fecha;
-- desafio2_jose_latapiatt_001=# SELECT fecha AS dia, SUM(cantidad) AS cantidad FROM INSCRITOS GROUP BY fecha;
--     dia     | cantidad
-- ------------+----------
--  2021-01-08 |      182
--  2021-01-04 |       93
--  2021-01-02 |      120
--  2021-01-07 |       58
--  2021-01-03 |      103
--  2021-01-05 |       88
--  2021-01-01 |      100
--  2021-01-06 |       30
-- (8 rows)

SELECT fecha AS dia, SUM(cantidad) AS personas 
FROM INSCRITOS 
GROUP BY fecha 
ORDER BY personas DESC 
LIMIT 1;
-- desafio2_jose_latapiatt_001=# SELECT fecha AS dia, SUM(cantidad) AS personas 
-- desafio2_jose_latapiatt_001-# FROM INSCRITOS 
-- desafio2_jose_latapiatt_001-# GROUP BY fecha
-- desafio2_jose_latapiatt_001-# ORDER BY personas DESC 
-- desafio2_jose_latapiatt_001-# LIMIT 1;
--     dia     | personas
-- ------------+----------
--  2021-01-08 |      182
-- (1 row)