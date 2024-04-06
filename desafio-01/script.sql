-- https://www.postgresql.org/docs/7.0/syntax525.htm Nombre con _ no -

CREATE DATABASE desafio_jose_latapiatt_000;
\c desafio_jose_latapiatt_000;

CREATE TABLE clientes(
	email varchar(50),
	nombre varchar,
	teléfono varchar(16),
	empresa varchar(50),
	prioridad smallint
);

do
$$
begin
	for i in 1..5 loop
		insert into clientes (email, nombre, teléfono, empresa, prioridad) 
		values (CONCAT('nombre', floor(random() *10)), CONCAT('apellido', floor(random() *10)), CONCAT('teléfono', floor(random() *10)), CONCAT('empresa', floor(random() *10)), i+5);
	end loop;
end
$$;

SELECT * from clientes
ORDER BY prioridad
LIMIT 3;

SELECT * from clientes
WHERE prioridad = 7 OR prioridad = 9;