

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