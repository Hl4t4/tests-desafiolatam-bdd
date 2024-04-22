create database mawashi_cars;
\c mawashi_cars;

create table autos (
    id int primary key, 
    marca varchar(25), 
    modelo varchar(25), 
    año varchar(25), 
    color varchar(25), 
    precio float);

create table ventas (
    id serial unique not null, 
    fecha varchar(20),
    id_auto int, 
    cliente varchar(25), 
    referencia int, 
    cantidad float,
    metodo_pago varchar(10), 
    foreign key (id_auto) references autos(id));

insert into autos (id, marca, modelo, año, color, precio) values (1, 'Toyota', 'Corolla Araya', '1991', 'Blanco', 1200000);
insert into autos (id, marca, modelo, año, color, precio) values (2, 'Mazda', 'Mazda 3', '2000', 'Azul',2000000);
insert into autos (id, marca, modelo, año, color, precio) values (3, 'Chevrolet', 'Spark', '1998', 'Verde Oscuro', 1200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (4, 'Nissan', 'Versa', 2018, 'Gris Plata', 5000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (5, 'Hyundai', 'Accent', 2022, 'Rojo', 10500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (6, 'Kia', 'Rio', 2020, 'Negro', 8000000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (7, 'Volkswagen', 'Gol', 2015, 'Azul Marino', 3500000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (8, 'Fiat', 'Mobi', 2017, 'Blanco', 2800000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (9, 'Suzuki', 'Swift', 2019, 'Gris Oxford', 6200000);
INSERT INTO autos (id, marca, modelo, año, color, precio) VALUES (10, 'Peugeot', '208', 2021, 'Rojo', 9800000);

insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2020-10-15', 1, 'Chuck', 43224, 12000000, 'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2020-11-15', 1, 'Donnie', 43334, 12000000, 'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2020-12-15', 3, 'Jet', 43444, 12000000, 'Cheque');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2021-01-05', 1, 'Peter', 43335, 12000000, 'Débito');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2021-01-15', 1, 'Abigail', 43554, 12000000, 'Transfer');
insert into ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) values('2021-02-01', 3, 'Jhon', 43456, 12000000, 'Cheque');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-02-01', 2, 'Walter', 54321, 2000000, 'Efectivo');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-03-15', 3, 'Sarah', 54322, 1200000, 'Tarjeta');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-04-05', 4, 'Jessica', 54323, 5000000, 'Débito');
INSERT INTO ventas (fecha, id_auto, cliente, referencia, cantidad, metodo_pago) VALUES ('2021-05-25', 5, 'Luis', 54324, 10500000, 'Transfer');

SELECT cliente, marca, modelo 
FROM ventas INNER JOIN autos ON ventas.id_auto=autos.id;

SELECT * 
FROM autos;

SELECT * 
FROM ventas;

-- Respuesta 1

SELECT autos.*
FROM autos INNER JOIN (SELECT DISTINCT autos.id FROM ventas INNER JOIN autos ON ventas.id_auto=autos.id) st ON autos.id = st.id;


SELECT autos.*
FROM autos LEFT JOIN ventas ON ventas.id_auto=autos.id
WHERE ventas.id IS NULL;

-- Respuesta 2

SELECT *
FROM ventas FULL OUTER JOIN autos ON ventas.id_auto=autos.id
WHERE autos.id IS NULL OR ventas.id_auto IS NULL;
