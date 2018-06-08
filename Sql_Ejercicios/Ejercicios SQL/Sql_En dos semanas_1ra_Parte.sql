 --2 - Crear una tabla (create table - sp_tables - sp_columns - drop table)

--Primer problema:

if object_id('agenda') is not null 
drop table agenda;

/*create table /agenda(nombre varchar(30), apellido varchar(20), domicilio varchar(30), telefono varchar(11));*/

create table agenda(nombre varchar(30), apellido varchar(20), domicilio varchar(30), telefono varchar(11));

sp_tables @table_owner='dbo'

sp_columns agenda;

drop table agenda;

drop table agenda;


--Segundo problema:

if object_id('libros') is not null 
drop table libros;

sp_tables @table_owner='dbo';

create table libros(titulo varchar(20), autor varchar(30), editorial varchar(15));

create table libro(titulo varchar(20), autor varchar(30), editorial varchar(15));

sp_tables @table_owner='dbo';

sp_columns libros;

drop table libros;

drop table libros;




--3 - Insertar y recuperar registros de una tabla (insert into - select)

--Primer Problema:

if object_id('agenda') is not null drop table agenda;

create table agenda(apellido varchar(30), nombre varchar(20), domicilio varchar(30), telefono varchar(11));

sp_tables @table_owner='dbo';

sp_columns agenda;

insert into agenda(apellido, nombre, domicilio, telefono) values('Torres','Alberto','Colon 123','4234567');

select * from agenda;

drop table agenda;

drop table agenda;


--Segundo Problema:

if object_id('libros') is not null
drop table libros;

create table libros(titulo varchar(20), autor varchar(30), editorial varchar(15));

sp_tables @table_owner='dbo';

sp_columns libros;

insert into libros(titulo, autor, editorial) values('El aleph', 'Borges', 'Planeta');

insert into libros(titulo, autor, editorial) values('Martin Fierro','Jose Hernandez','Emece');

insert into libros(titulo, autor, editorial) values('Aprenda PHP','Mario Molina','Emece');

select * from libros;



--4 - Tipos de datos básicos
--Primer Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(nombre varchar(20), actor varchar(20), duracion integer, cantidad integer);

sp_columns peliculas;

insert into peliculas(nombre, actor, duracion, cantidad) values('Mision imposible','Tom Cruise',128,3);

insert into peliculas(nombre, actor, duracion, cantidad) values('Mision imposible 2','Tom Cruise',130,2);

insert into peliculas(nombre, actor, duracion, cantidad) values('Mujer bonita','Julia Roberts',118,3);

insert into peliculas(nombre, actor, duracion, cantidad) values('Elsa y Fred','China Zorrilla',110,2);

select * from peliculas;


--Segundo Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(20), 
documento varchar(8), 
sexo varchar(1), 
domicilio varchar(30), 
sueldobasico float
);

sp_columns empleados;

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Juan Perez','22333444','m','Sarmiento 123',500);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Ana Acosta','24555666','f','Colon 134',650);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Bartolome Barrios','27888999','m','Urquiza 479',800);

select * from empleados;



--5 - Recuperar algunos campos (select)
--Primer Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(titulo varchar(20), actor varchar(20), duracion integer, cantidad integer);

sp_columns peliculas;

insert into peliculas(titulo, actor , duracion, cantidad) values('Mision imposible','Tom Cruise',180,3);

insert into peliculas(titulo, actor , duracion, cantidad) values('Mision imposible 2','Tom Cruise',190,2);

insert into peliculas(titulo, actor , duracion, cantidad) values('Mujer bonita','Julia Roberts',118,3);

insert into peliculas(titulo, actor , duracion, cantidad) values('Elsa y Fred','China Zorrilla',110,2);

select titulo, actor from peliculas;

select titulo, duracion from peliculas;

select titulo, cantidad from peliculas;


--Segundo Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(20), 
documento varchar(8), 
sexo varchar(1), 
domicilio varchar(30), 
sueldobasico float
);

sp_columns empleados;

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Juan Juarez','22333444','m','Sarmiento 123',500);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Ana Acosta','27888999','f','Colon 134',700);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico) 
values('Carlos Caseres','31222333','m','Urquiza 479',850);

select * from empleados;

select nombre, documento, domicilio from empleados;

select documento, sexo, sueldobasico from empleados;



--6 - Recuperar algunos registros (where)
--Primer Problema:

if object_id('agenda') is not null drop table agenda;

create table agenda(apellido varchar(30), nombre varchar(20), domicilio varchar(30), telefono varchar(11));

sp_columns agenda;


insert into agenda(apellido, nombre, domicilio, telefono) values('Acosta', 'Ana', 'Colon 123', '4234567');

insert into agenda(apellido, nombre, domicilio, telefono) values('Bustamante', 'Betina', 'Avellaneda 135', '4458787');

insert into agenda(apellido, nombre, domicilio, telefono) values('Lopez', 'Hector', 'Salta 545', '4887788');

insert into agenda(apellido, nombre, domicilio, telefono) values('Lopez', 'Luis', 'Urquiza 333', '4545454');

insert into agenda(apellido, nombre, domicilio, telefono) values('Lopez', 'Marisa', 'Urquiza 333', '4545454');

select * from agenda;

select * from agenda where nombre='Marisa';

select nombre, domicilio from agenda where apellido='Lopez';

select nombre from agenda where telefono='4545454';

--Segundo Problema:

if object_id('libros') is not null drop table libros;

create table libros(titulo varchar(20), autor varchar(30), editorial varchar(15));

sp_columns libros;


insert into libros(titulo, autor, editorial) values('El aleph', 'Borges', 'Emece');

insert into libros(titulo, autor, editorial) values('Martin Fierro','Jose Hernandez','Emece');

insert into libros(titulo, autor, editorial) values('Martin Fierro','Jose Hernandez','Planeta');

insert into libros(titulo, autor, editorial) values('Aprenda PHP','Mario Molina','Siglo XXI');

select * from libros where autor='Borges';

select titulo from libros where editorial='Emece';

select editorial from libros where titulo='Martin Fierro';



--7 - Operadores relacionales
--Primer Problema:

if object_id('articulos') is not null drop table articulos;

create table articulos(
codigo integer, 
nombre varchar(20), 
descripcion varchar(30), 
precio float, 
cantidad integer
);

sp_columns articulos;

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(1,'impresora','Epson Stylus C45',400.80,20);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(2,'impresora','Epson Stylus C85',500,30);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(3,'monitor','Samsung 14',800,10);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(4,'teclado','ingles Biswal',100,50);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(5,'teclado','español Biswal',90,50);

select * from articulos where nombre='impresora';

select * from articulos where precio >= 400;

select codigo, nombre from articulos where cantidad < 30;

select nombre, descripcion from articulos where precio <> 100;


--Segundo Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(titulo varchar(20), actor varchar(20), duracion integer, cantidad integer);

sp_columns peliculas;

insert into peliculas(titulo, actor , duracion, cantidad) values('Mision imposible','Tom Cruise',120,3);

insert into peliculas(titulo, actor , duracion, cantidad) values('Mision imposible 2','Tom Cruise',180,4);

insert into peliculas(titulo, actor , duracion, cantidad) values('Mujer bonita','Julia R.',90,1);

insert into peliculas(titulo, actor , duracion, cantidad) values('Elsa y Fred','China Zorrilla',80,2);


select * from peliculas where duracion <=90;

select titulo from peliculas where actor <> 'Tom Cruise';

select titulo, actor,cantidad from peliculas where cantidad > 2;



--8 - Borrar registros (delete)
--Primer Problema:

if object_id('agenda') is not null drop table agenda;

create table agenda(apellido varchar(30), nombre varchar(20), domicilio varchar(30), telefono varchar(11));

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Alvarez','Alberto','Colon 123','4234567');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Juarez','Juan','Avellaneda 135','4458787');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Lopez','Maria','Urquiza 333','4545454');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Lopez','Jose','Urquiza 333','4545454');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Salas','Susana','Gral. Paz 1234','4123456');

delete from agenda where nombre='Juan';

delete from agenda where telefono='4545454';

select * from agenda;

delete from agenda;

select * from agenda;


--Segundo Problema:

if object_id('articulos') is not null drop table articulos;

create table articulos(
codigo integer, 
nombre varchar(20), 
descripcion varchar(30), 
precio float, 
cantidad integer
);

sp_columns articulos;

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(1,'impresora','Epson Stylus C45',400.80,20);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(2,'impresora','Epson Stylus C85',500,30);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(3,'monitor','Samsung 14',800,10);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(4,'teclado','ingles Biswal',100,50);

insert into articulos(codigo, nombre, descripcion, precio,cantidad) 
values(5,'teclado','español Biswal',90,50);

delete from articulos where precio >= 500;

delete from articulos where nombre='impresora';

delete from articulos where codigo <> 4;

select * from articulos;



--9 - Actualizar registros (update)
--Primer problema:

if object_id('agenda') is not null drop table agenda;

create table agenda(apellido varchar(30), nombre varchar(20), domicilio varchar(30), telefono varchar(11));

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Acosta','Alberto','Colon 123','4234567');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Juarez','Juan','Avellaneda 135','4458787');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Lopez','Maria','Urquiza 333','4545454');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Lopez','Jose','Urquiza 333','4545454');

insert into agenda(apellido, nombre, domicilio, telefono) 
values('Suarez','Susana','Gral. Paz 1234','4123456');

update agenda set nombre='Juan Jose' where nombre='Juan';

update agenda set telefono='4445566' where telefono='4545454';

update agenda set nombre='Juan Jose' where nombre='Juan';

select * from agenda;


--Segundo Problema:


if object_id('libros') is not null drop table libros;

create table libros(titulo varchar(30), autor varchar(30), editorial varchar(15), precio float);

sp_columns libros;

insert into libros(titulo, autor, editorial, precio) values('El aleph', 'Borges', 'Emece',25.00);

insert into libros(titulo, autor, editorial, precio) values('Martin Fierro','Jose Hernandez','Planeta',35.50);

insert into libros(titulo, autor, editorial, precio) values('Aprenda PHP','Mario Molina','Emece',45.50);

insert into libros(titulo, autor, editorial, precio) values('Cervantes y el quijote','Borges','Emece',25);

insert into libros(titulo, autor, editorial, precio) values('Matematica estas ahi','Paenza','Siglo XXI',15);

select * from libros;

update libros set autor='Adrian Paenza' where autor='Paenza';

update libros set precio = 27 where autor='Mario Molina';


update libros set editorial='Emece S.A' where editorial='Emece';

select * from libros;




--11 - Valores null (is null)
--Primer Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo integer not null, 
nombre varchar(20) not null, 
laboratorio varchar(20), 
precio float, 
cantidad integer not null
);

sp_columns medicamentos;

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(1,'Sertal gotas',null,null,100);

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(2,'Sertal compuesto',null,8.90,150);

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(3,'Buscapina','Roche',null,200);

select * from medicamentos;

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad)
values(4,'Bayaspirina','',0,150);

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad)
values(0,'', 'Bayer', 15.60, 0);

select * from medicamentos;

/*insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(null,'Amoxidal jarabe','Bayer',25,120)*/

select * from medicamentos where laboratorio is null;

select * from medicamentos where laboratorio='';

select * from medicamentos where precio is null;

select * from medicamentos where precio='0';

select * from medicamentos where laboratorio <> '';

select * from medicamentos where laboratorio is not null;

select * from medicamentos where precio <> 0;

select * from medicamentos where precio is not null;


--Segundo Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(
codigo integer not null, 
titulo varchar(40), 
actor varchar(20), 
duracion integer 
);

sp_columns peliculas;

insert into peliculas(codigo, titulo, actor , duracion) 
values(1,'Mision imposible','Tom Cruise',120);

insert into peliculas(codigo, titulo, actor , duracion) 
values(2,'Harry Potter y la piedra filosofal',null,180);

insert into peliculas(codigo, titulo, actor , duracion) 
values(3,'Harry Potter y la camara secreta','Daniel R.',null);

insert into peliculas(codigo, titulo, actor , duracion) 
values(0,'Mision imposible 2','',150);

insert into peliculas(codigo, titulo, actor , duracion) 
values(4,'','L. Di Caprio',220);

insert into peliculas(codigo, titulo, actor , duracion) 
values(5,'Mujer bonita','R. Gere-J. Roberts',0);

select * from peliculas;


/*insert into peliculas (codigo, titulo, actor, duracion)
values(null,'Mujer bonita','R. Gere-J. Roberts',190)*/


select * from peliculas where actor is null;

select * from peliculas where actor ='';


update peliculas set duracion = 120 where duracion is null;

update peliculas set actor='Desconocido' where actor='';

select * from peliculas;

delete from peliculas where titulo='';

select * from peliculas;




--12 - Clave primaria
--Primer Problema:

if object_id('libros') is not null drop table libros;

create table libros(codigo integer, 
titulo varchar(40), 
autor varchar(20), 
editorial varchar(15),
primary key(codigo)
);

insert into libros(codigo, titulo, autor, editorial) values(1,'El aleph','Borges','Emece');

insert into libros(codigo, titulo, autor, editorial) values(2,'Martin Fierro','Jose Hernandez','Planeta');

insert into libros(codigo, titulo, autor, editorial) values(3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

--insert into libros(codigo, titulo, autor, editorial) values(3,'Vca','Nola','falso Siglo');

--insert into libros(codigo, titulo, autor, editorial) values(null,'Vca','Nola','falso Siglo');

--update libros set codigo=1 where titulo='Martin Fierro';


--Segundo Problema:

if object_id('alumnos') is not null drop table alumnos;

/*create table alumnos( 
legajo varchar(4), 
documento varchar(8), 
nombre varchar(30),
domicilio varchar(30),
primary key(documento),
primary key(legajo)
)*/

create table alumnos(legajo varchar(4),
documento varchar(8), 
nombre varchar(30), 
domicilio varchar(30), 
primary key(documento)
);

sp_columns alumnos;

insert into alumnos(legajo, documento, nombre, domicilio) 
values('A233','22345345','Perez Mariana','Colon 234');

insert into alumnos(legajo, documento, nombre, domicilio) 
values('A567','23545345','Morales Marcos','Avellaneda 348');

/*insert into alumnos(legajo, documento, nombre, domicilio) 
values('A666','23545345','Jose Manuel','Uganda')*/

/*insert into alumnos(legajo, documento, nombre, domicilio) 
values('A756','null','Martin Luz','Avenida Caceres')*/




--13 - Campo con atributo Identity
--Primero Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo integer identity, 
nombre varchar(20) not null, 
laboratorio varchar(20), 
precio float, 
cantidad integer not null,
primary key(codigo)
);

sp_columns medicamentos;

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Sertal','Roche',5.2,100);

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Buscapina','Roche',4.10,200);

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Amoxidal 500','Bayer',15.60,100);

select * from medicamentos;

--insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) values(1,'Amoxidal 500','Bayer',15.60,100);

--update medicamentos set codigo=2 where nombre = 'Buscapina';

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Amoxilina 500','Bayer',15.60,100);

select * from medicamentos;




--Segundo Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(
codigo integer identity, 
titulo varchar(40), 
actor varchar(20), 
duracion integer,
primary key(codigo)
);

sp_columns peliculas;

insert into peliculas(titulo, actor , duracion) 
values('Mision imposible','Tom Cruise',120);

insert into peliculas(titulo, actor , duracion) 
values('Harry Potter y la piedra filosofal','Daniel R.',180);

insert into peliculas(titulo, actor , duracion) 
values('Harry Potter y la camara secreta','Daniel R.',190);

insert into peliculas(titulo, actor , duracion) 
values('Mision imposible 2','Tom Cruise',120);

insert into peliculas(titulo, actor , duracion) 
values('La vida es bella','zzz',220);

select * from peliculas;

--update peliculas set codigo=2 where actor='Daniel R.';

delete from peliculas where titulo='La vida es bella';

insert into peliculas(titulo, actor , duracion) 
values('El sol naciente','Galileo',100);

select * from peliculas;






--14 - Otras características del atributo Identity
--Primer Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo integer identity(10,1), 
nombre varchar(20) not null, 
laboratorio varchar(20), 
precio float, 
cantidad integer not null
);


insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Sertal','Roche',5.2,100);

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Buscapina','Roche',4.10,200);

insert into medicamentos(nombre, laboratorio, precio, cantidad) 
values('Amoxidal 500','Bayer',15.60,100);

select * from medicamentos;

/*insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(14,'Aspirina','Bayer',10,300)*/

set identity_insert medicamentos on;

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(14,'Aspirina','Bayer',10,300);

insert into medicamentos(codigo, nombre, laboratorio, precio, cantidad) 
values(14,'Sertal','Generico',50,120);

select ident_seed('medicamentos');

select ident_incr('medicamentos');




--Segundo Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(
codigo integer identity(50,3), 
titulo varchar(40), 
actor varchar(20), 
duracion integer,
);

insert into peliculas(titulo, actor , duracion) values('Mision imposible','Tom Cruise',120);

insert into peliculas(titulo, actor , duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180);

insert into peliculas(titulo, actor , duracion) values('Harry Potter y la camara secreta','Daniel R.',190);

select * from peliculas;

set identity_insert peliculas on;

insert into peliculas(codigo, titulo, actor , duracion) values(45,'Mision imposible 2','Tom Cruise',120);

insert into peliculas(codigo, titulo, actor , duracion) values(60,'La vida es bella','zzz',220);

select ident_seed('peliculas');

select ident_incr('peliculas');


--insert into peliculas(titulo, actor , duracion) values('DBZ BDD','Toei',130);

set identity_insert peliculas off;

insert into peliculas(titulo, actor , duracion) values('OP Gold film','Toei',110);

select * from peliculas;




--15 - Truncate table
--Primer Problema:

if object_id('alumnos') is not null drop table alumnos;

create table alumnos(legajo integer identity, documento varchar(8), nombre varchar(30), domicilio varchar(30));

insert into alumnos(documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');

insert into alumnos(documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');

insert into alumnos(documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');

insert into alumnos(documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

delete from alumnos;


insert into alumnos(documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');

insert into alumnos(documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');

insert into alumnos(documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');

insert into alumnos(documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

truncate table alumnos;


insert into alumnos(documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');

insert into alumnos(documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');

insert into alumnos(documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');

insert into alumnos(documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;




--Segundo Problema:

if object_id('articulos') is not null drop table articulos;

create table articulos(
codigo integer identity, 
nombre varchar(20), 
descripcion varchar(30), 
precio float
);


insert into articulos(nombre, descripcion, precio) values('impresora','Epson Stylus C45',400.80);

insert into articulos(nombre, descripcion, precio) values('impresora','Epson Stylus C85',500);

select * from articulos;

truncate table articulos;


insert into articulos(nombre, descripcion, precio) values('monitor','Samsung 14',800);

insert into articulos(nombre, descripcion, precio) values('teclado','ingles Biswal',100);

insert into articulos(nombre, descripcion, precio) values('teclado','español Biswal',90);

select * from articulos;

delete from articulos;


insert into articulos(nombre, descripcion, precio) values('monitor','Samsung 14',800);

insert into articulos(nombre, descripcion, precio) values('teclado','ingles Biswal',100);

insert into articulos(nombre, descripcion, precio) values('teclado','español Biswal',90);

select * from articulos;





--17 - Tipo de dato (texto)
--Primer problema:

if object_id('autos') is not null drop table autos;

create table autos(patente char(6), marca varchar(20), modelo char(4), precio float, primary key (patente));

insert into autos values('ACD123','Fiat 128','1970',15000);

insert into autos values('ACG234','Renault 11','1990',40000);

insert into autos values('BCD333','Peugeot 505','1990',80000);

insert into autos values('GCD123','Renault Clio','1990',70000);

insert into autos values('BCC333','Renault Megane','1998',95000);

insert into autos values('BVF543','Fiat 128','1975',20000);

select *from autos where modelo='1990';




--Segundo Problema:

if object_id('clientes') is not null drop table clientes;

create table clientes(
documento char(8), 
apellido varchar(20), 
nombre varchar(20), 
domicilio varchar(30),
telefono varchar(11)
);

insert into clientes(documento, apellido, nombre, domicilio, telefono) 
values('2233344','Perez','Juan','Sarmiento 980','4342345');

insert into clientes(documento, apellido, nombre, domicilio, telefono) 
values('2333344','Perez','Ana','Colon 234',7542045);

insert into clientes(documento, apellido, nombre, domicilio, telefono)
values('2433344','Garcia','Luis','Avellaneda 1454','4558877');

insert into clientes(documento, apellido, nombre, domicilio, telefono) 
values('2533344','Juarez','Ana','Urquiza 444','4789900');


select * from clientes where apellido='Perez';





--18 - Tipo de dato (numérico)
--Primer Problema:

if object_id('cuentas') is not null drop table cuentas;

create table cuentas(
numero int, 
documento char(8), 
nombre varchar(30), 
saldo decimal(30,2), 
primary key(numero)
);

insert into cuentas(numero, documento, nombre, saldo) values('1234','25666777','Pedro Perez',500000.60);

insert into cuentas(numero, documento, nombre, saldo) values('2234','27888999','Juan Lopez',-250000);

insert into cuentas(numero, documento, nombre, saldo) values('3344','27888999','Juan Lopez',4000.50);

insert into cuentas(numero, documento, nombre, saldo) values('3346','32111222','Susana Molina',1000);

select * from cuentas where saldo > 4000;

select numero, saldo from cuentas where nombre='Juan Lopez';

select * from cuentas where saldo < 0;

select * from cuentas where numero>= 3000;




--Segundo Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
sexo char(1), 
domicilio varchar(30),
sueldobasico decimal(7,2),
cantidadhijos tinyint
);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos) 
values('Juan Perez','22333444','m','Sarmiento 123',500,2);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos) 
values('Ana Acosta','24555666','f','Colon 134',850,0);

insert into empleados(nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos) 
values('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

insert into empleados (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Susana Molina','29000555','f','Salta 876',800.888,3);

/*insert into empleados (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Jose Manuel','29033484','m','Uganda',900000.99,3)*/


select * from empleados where sueldobasico< 900;

select nombre from empleados where cantidadhijos <> 0;





--19 - Tipo de dato (fecha y hora)
--Primer Problrema:

if object_id('alumnos') is not null drop table alumnos;

create table alumnos(
apellido varchar(30),
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso datetime,
fechanacimiento datetime
);

set dateformat dmy;

insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Gonzalez','Ana','22222222','Colon 123','03-03-1990','15/02/1972');

insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Juarez','Bernardo','25555555','Sucre 456','3-3-91','15/2/72');

insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

/*insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)*/

select * from alumnos where fechaingreso < '1-1-91';

select * from alumnos where fechanacimiento is null;


/*insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Rosas','Romina','28888888','Avellaneda 487','03151990',null)*/

set dateformat mdy;

insert into alumnos(apellido, nombre, documento, domicilio, fechaingreso, fechanacimiento) 
values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

select * from alumnos;







--20 - Ingresar algunos campos (insert into)
--Primer Problema:

if object_id('cuentas') is not null drop table cuentas;

create table cuentas(
numero int identity, 
documento char(8) not null, 
nombre varchar(30), 
saldo money, 
primary key(numero)
);

--insert into cuentas values(1,'25666777','Juan Perez',2500.50);

insert into cuentas values('25666777','Juan Perez',2500.50);

--insert into cuentas(numero, documento, saldo) values(2,'27888999',4000.50);

--insert into cuentas(numero, documento, nombre, saldo) values(5,'28999777','Luis Lopez',34000);

--insert into cuentas(numero, documento, nombre) values('32111222','Susana Molina',444,232);

--insert into cuentas(nombre, saldo) values('Frank', 500);

select * from cuentas;







--21 - Valores por defecto (default)
--Primer Problema:

if object_id('visitantes') is not null drop table visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1) default 'f',
domicilio varchar(30),
cuidad varchar(30) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'no tiene',
montocompra decimal(6,2)
);

sp_columns visitantes;

insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80);

insert into visitantes (nombre, edad, cuidad, mail) 
values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

select * from visitantes;

insert into visitantes (nombre, edad, sexo, domicilio, cuidad, telefono, mail, montocompra) 
values ('Marcos Torres',29,default,'Un lado','Carlos Paz','126846585',default, 500.00);

insert into visitantes default values

select * from visitantes;




--Segundo Problema:

if object_id('prestamos') is not null drop table prestamos;

create table prestamos(
titulo varchar(40) not null, 
documento char(8) not null, 
fechaprestamo datetime not null, 
fechadevolucion datetime, 
devuelto char(1) default 'n'
);

insert into prestamos(titulo, documento, fechaprestamo, fechadevolucion) 
values('Manual de 1 grado','23456789','2006-12-15','2006-12-18');

insert into prestamos(titulo, documento, fechaprestamo) 
values('Alicia en el pais de las maravillas','23456789','2006-12-16');

insert into prestamos(titulo, documento, fechaprestamo, fechadevolucion) 
values('El aleph','22543987','2006-12-16','2006-08-19');

insert into prestamos(titulo, documento, fechaprestamo, devuelto) 
values('Manual de geografia 5 grado','25555666','2006-12-18','s');

select * from prestamos;

insert into prestamos(titulo, documento, fechaprestamo, fechadevolucion, devuelto) 
values('El MAl', '23856612', '2006/6/6', '2014-8-25', default);

select * from prestamos;

--insert into prestamos default values;








--22 - Columnas calculadas (operadores aritméticos y de concatenación)
--Primer Problema:

if object_id('articulos') is not null drop table articulos;

create table articulos(
codigo int identity, 
nombre varchar(20), 
descripcion varchar(30), 
precio smallmoney,
cantidad tinyint default 0,
primary key(codigo)
);


insert into articulos(nombre, descripcion, precio, cantidad) 
values('impresora','Epson Stylus C45',400.80,20);

insert into articulos(nombre, descripcion, precio) 
values('impresora','Epson Stylus C85',500);

insert into articulos(nombre, descripcion, precio) 
values('monitor','Samsung 14',800);

insert into articulos(nombre, descripcion, precio, cantidad) 
values('teclado','ingles Biswal',100,50);

select * from articulos;

update articulos set precio = precio + (precio*0.15);

select nombre +','+ descripcion from articulos;

update articulos set cantidad = cantidad-5 where nombre='teclado';

select * from articulos;






--23 - Alias
--Primer Problema:

if object_id('libros') is not null drop table libros;

create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
cantidad int default 0,
primary key(codigo)
);

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);

insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);

insert into libros (titulo,autor,editorial,precio,cantidad)
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select codigo, titulo, autor, editorial, precio, cantidad, precio*cantidad as 'Monto total'
from libros;

select titulo, autor, precio, precio*0.1 as descuento, precio-(precio*0.1) as 'precio final'
from libros where editorial='Emece';

select titulo + ' y ' + autor from libros;









