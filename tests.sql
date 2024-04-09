

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
