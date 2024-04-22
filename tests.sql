

do
$$
begin
	for i in 1..5 loop
		insert into clientes (nombre, apellido) values ('nombre', CONCAT('apellido ',i));
	end loop;
end
$$;

C:\Program Files\PostgreSQL\16\scripts\runpsql.bat

cmd /c chcp 1252
powershell /c chcp 1252

SELECT * from clientes;


--------------------------------------------------------------------------------

create table cocina_chilena(id int, nombre varchar(50)); 

insert into cocina_chilena (id, nombre) values (1,'Pastel de choclo');
insert into cocina_chilena (id, nombre) values (2, 'Umitas');
insert into cocina_chilena (id, nombre) values (3,'Asados'), (4, 'Mariscos'), (4, 'Pescado');
update cocina_chilena 
set id=
	case
		when nombre = 'Mariscos' then 4
		when nombre = 'Pescado' then 5
		else id
	end;

delete from cocina_chilena where id = 2;

--------------------------------------------------------------------------------

create database animales;
\c animales

create table gatos_y_perros(id int, nombre varchar(50), raza varchar(50), edad int);

insert into gatos_y_perros (id, nombre, raza, edad) values 
(1, 'Cuchupin', 'Danes', 500),
(2, 'Cucho', 'Calico', 5),
(3, 'Max', 'Calico', 110),
(4, 'Sara', 'Schnauzer', 8),
(5, 'Leopold', 'sdflhkj', 1);

select * from gatos_y_perros;

update gatos_y_perros
set raza = 'Pug' where raza not in ('Danes', 'Calico', 'Schnauzer');

select * from gatos_y_perros;

delete from gatos_y_perros where edad > 20;

select * from gatos_y_perros;

update gatos_y_perros set edad = edad * 1.5;

--------------------------------------------------------------------------------

INSERT INTO Empleados (apellido) VALUES ('Gómez');

INSERT INTO Empleados (EmpleadoID, nombre, apellido, rut) VALUES (11, 'Juan',
'Gonzalez', 'RUT1');
INSERT INTO Empleados (EmpleadoID, nombre, apellido, rut) VALUES (12, 'Maria',
'Perez', 'RUT2');
INSERT INTO Empleados (EmpleadoID, nombre, apellido, rut) VALUES (13, 'Pedro',
'Fuentes', 'RUT2');

--------------------------------------------------------------------------------

INSERT INTO Autores (AutorID, NombreAutor) VALUES (2, 'Autor A malo');

INSERT INTO Libros (LibroID, Titulo, AutorID) VALUES (101, 'Libro Ejemplo', 1);

DELETE FROM Autores WHERE AutorID = 2;

--------------------------------------------------------------------------------

create database restricciones_psql;
\c restricciones_psql

create table company (id serial primary key, nombre varchar not null unique);

insert into company(nombre) values('Amazon');
insert into company(nombre) values('Apple');

insert into company(nombre) values('Apple');

insert into company(nombre) values(NULL);


--------------------------------------------------------------------------------

ALTER TABLE company
ADD COLUMN direccion varchar not null,
ADD COLUMN edad int not null,
ADD COLUMN nomina int not null;

delete from company;

insert into company(nombre, direccion, edad, nomina) values('Amazon', 'direccion 1', 1, 500000);
insert into company(nombre, direccion, edad, nomina) values('Apple', 'direccion 2', 10, 5000);
insert into company(nombre, direccion, edad, nomina) values('Google', 'direccion 3', 100, 50);

insert into company(nombre, direccion, edad, nomina) values('AirBnB', NULL, 100, 50);
insert into company(nombre, direccion, edad, nomina) values('AirBnB', 'direccion 4', NULL, 50);
insert into company(nombre, direccion, edad, nomina) values('AirBnB', 'direccion 4', 100, NULL);
insert into company(nombre, direccion, edad, nomina) values(NULL, 'direccion 4', 100, 50);

--------------------------------------------------------------------------------

create database transacciones;
\c transacciones;

create table cuentas 
(numero_cuenta int not null unique primary key, balance float check(balance >= 0.00));

insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
commit;

insert into cuentas (numero_cuenta, balance) values (3, 1000);

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;

select * from cuentas;

rollback;

--------------------------------------------------------------------------------
create database d8;
\c d8;


create table clientes (id integer unique not null, name varchar(25) not null, email varchar(50));

insert into clientes(id, name) values (1, 'Nombre 1');
insert into clientes(id, name) values (2, 'Nombre 2');
insert into clientes(id, name) values (3, 'Nombre 3');

ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

UPDATE clientes SET email = '' WHERE email IS NULL;

ALTER TABLE clientes ADD COLUMN fecha date;

UPDATE clientes SET fecha = COALESCE(fecha, '2024-01-01');

ALTER TABLE clientes ALTER COLUMN fecha SET NOT NULL;

--------------------------------------------------------------------------------

CREATE TABLE productos (
  id serial PRIMARY KEY,
  nombre varchar(255) NOT NULL,
  precio numeric(10,2) NOT NULL,
  sku text
);

INSERT INTO productos (nombre, precio, sku)
VALUES
  ('Televisor 50 pulgadas', 1500.00, NULL),
  ('Celular de alta gama', 1000.00, NULL),
  ('Laptop de última generación', 2000.00, NULL),
  ('Nevera con congelador', 500.00, NULL),
  ('Lavadora automática', 300.00, NULL),
  ('Cocina a gas', 400.00, NULL),
  ('Horno microondas', 250.00, NULL),
  ('Juego de ollas', 100.00, NULL),
  ('Set de cubiertos', 50.00, NULL),
  ('Cafetera eléctrica', 75.00, NULL),
  ('Tostadora', 50.00, NULL),
  ('Plancha de vapor', 100.00, NULL),
  ('Secadora de ropa', 200.00, NULL),
  ('Aspiradora', 150.00, NULL),
  ('Robot aspirador', 300.00, NULL),
  ('Silla de oficina', 200.00, NULL),
  ('Mesa de escritorio', 150.00, NULL),
  ('Escritorio para computadora', 250.00, NULL),
  ('Sillón para sala', 300.00, NULL),
  ('Sofá cama', 400.00, NULL),
  ('Mesa de centro', 200.00, NULL),
  ('Silla para comedor', 150.00, NULL),
  ('Mesa para comedor', 250.00, NULL),
  ('Cama matrimonial', 400.00, NULL),
  ('Cabecera para cama', 250.00, NULL),
  ('Mesa de noche', 150.00, NULL),
  ('Armario ropero', 300.00, NULL),
  ('Espejo para baño', 200.00, NULL),
  ('Inodoro', 150.00, NULL),
  ('Lavabo', 250.00, NULL),
  ('Grifería para baño', 100.00, NULL),
  ('Ducha', 75.00, NULL),
  ('Bañera', 50.00, NULL),
  ('Cocina de inducción', 400.00, NULL),
  ('Campana extractora', 300.00, NULL),
  ('Microondas', 250.00, NULL),
  ('Lavavajillas', 1000.00, NULL),
  ('Lavadora secadora', 2000.00, NULL);

UPDATE productos SET sku = COALESCE(sku, 'Dato no ingresado');


ALTER TABLE productos ALTER COLUMN sku SET NOT NULL;

--------------------------------------------------------------------------------

CREATE TABLE autores (
id INT NOT NULL,
nombre VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE libros (
id INT NOT NULL,
titulo VARCHAR(255) NOT NULL,
autor_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (autor_id) REFERENCES autores (id)
);

INSERT INTO autores (id, nombre)
VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Pedro Rodríguez');

INSERT INTO libros (id, titulo, autor_id)
VALUES
(1, 'El Quijote', 1),
(2, 'La Divina Comedia', 2),
(3, 'Hamlet', 3);

SELECT libros.titulo, autores.nombre
FROM libros
INNER JOIN autores
ON libros.autor_id = autores.id;

delete from autores;
delete from libros;

----------------------- d9


create database mawashi_phones;
\c mawashi_phones;

create table phones (
	id int primary key, 
	modelo varchar(50), 
	mac_address int unique,
	fecha_fabricacion varchar(50));

insert into phones (id, modelo, mac_address, fecha_fabricacion) 
values (
	1, 
	'Iphone 14',
	'1B:2A:3C:4D:5F:6G',
	'2022-09-09');

alter table phones alter column mac_address type varchar(50);

\d phones;

alter table phones alter column mac_address set  NOT NULL;

insert into phones (id, modelo, mac_address, fecha_fabricacion) values (2, 'Iphone
13', '5B:1A:2C:7D:8F:7h', '2021-09-24');

truncate phones;

select * from phones;

--------------------------------------------------------------------------------

ALTER TABLE phones
ADD COLUMN memoria_interna VARCHAR NOT NULL,
ADD COLUMN memoria_ram VARCHAR NOT NULL,
ADD COLUMN peso VARCHAR NOT NULL,
ADD COLUMN dimensiones VARCHAR NOT NULL;


-- ALTER COLUMN id TYPE serial;

-- Create the sequence.
CREATE SEQUENCE public."id_seq" OWNED BY public.phones.id;

-- Assign it to the table default value.
ALTER TABLE phones ALTER COLUMN id SET DEFAULT nextval('public."id_seq"');

select COUNT(id),  from peliculas where "Director" = 'Peter Jackson';
select COUNT(id), "Pelicula", "Año estreno"  from peliculas where "Director" = 'Peter Jackson';

-------------------------------------------------------------------------------- d10


create database Productos_feria;
\c productos_feria;

\i E:/proyectos/bootcamp/tests-desafiolatam-bdd/script_clientes_productos.sql;

\i E:/proyectos/bootcamp/tests-desafiolatam-bdd/script_clientes_productos.sql;


select * from clientes;
select * from productos;
select * from compras;