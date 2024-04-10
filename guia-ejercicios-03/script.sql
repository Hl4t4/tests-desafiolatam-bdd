create table cuentas (
    numero_cuenta int not null unique primary key, 
    balance float check(balance >= 0.00)
    );

insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
commit;

BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
ROLLBACK;

BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance) VALUES (3,5000);
SAVEPOINT nueva_cuenta;

UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 3;
UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;

ROLLBACK TO nueva_cuenta;
COMMIT;


do
$$
begin
	for i in 4..20 loop
		insert into cuentas (numero_cuenta, balance) values (i, RANDOM()*10000);
	end loop;
end
$$;


do
$$
begin
	for i in 4..20 loop
        update cuentas set balance = RANDOM()*10000 where numero_cuenta = i;
	end loop;
end
$$;

select * from cuentas;


SELECT * FROM cuentas
WHERE balance > 2000;
--  numero_cuenta |      balance
-- ---------------+--------------------
--              3 |               5000
--              4 |  6219.578888041788
--              5 |  4368.656990357275
--              7 | 2576.5922814723453
--              9 |  6122.670330609561
--             10 |  4316.452727734434
--             11 |  7715.768323004717
--             12 |  3602.436795368282
--             13 |  7275.541457463015
--             14 |  5837.900977401247
--             15 |  4293.413367136447
--             17 |  7507.825538319903
--             18 |  8077.597826242786
--             19 |  9965.262401028302
--             20 |  6728.156400592397
-- (15 rows)

SELECT * FROM cuentas
WHERE balance < 1000;

--  numero_cuenta |      balance
-- ---------------+-------------------
--              1 |                 0
--              6 | 99.01963595242647
-- (2 rows)

SELECT AVG(balance) as promedio from cuentas;
--  numero_cuenta |      balance
-- ---------------+-------------------
--              1 |                 0
--              6 | 99.01963595242647
-- (2 rows)

SELECT AVG(balance) FROM cuentas
WHERE balance >= 2000;
--      promedio
-- -------------------
--  4706.169324547948
-- (1 row)