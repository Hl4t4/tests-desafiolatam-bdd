drop table clientes CASCADE;
drop table productos CASCADE;

create table clientes(
    cliente_id serial primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(250) not null,
    dni varchar(50) not null unique
);

create table productos(
    producto_id serial primary key,
    codigo varchar(250) not null unique
);

create table compras(
    compra_id serial primary key,
    cliente_id int,
    producto_id int,
    foreign key(cliente_id) references clientes(cliente_id),
    foreign key(producto_id) references productos(producto_id) 
);

INSERT INTO clientes (nombre, apellido, direccion, dni) 
VALUES 
('asdf', 'fghh', 'jkli', 'sd4516'),
('asdf', 'fg4hh', 'jkli', 'sd4256'),
('agsdf', 'fgh3h', 'jkli', 'sd3456'),
('asdfsad', '1fghh', 'j45kli', 's4d456'),
('asjuydf', 'fghh', 'jkli', 'sd5456');

INSERT INTO productos (codigo) 
VALUES 
('asdf'),
('a45sykudf'),
('as4656df'),
('astkydf'),
('asjtyjytdf'),
('asyjutdf'),
('asjtydf');

INSERT INTO compras (cliente_id, producto_id) 
VALUES 
(1, 3),
(2, 3),
(1, 3),
(4, 5),
(1, 4);