--27 - Funciones para el uso de fechas y horas
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(40) not null,
apellido varchar(40) not null,
documento char(8),
fechaNacimiento datetime,
fechaIngreso datetime,
sueldo decimal(6,2),
primary key(documento) 
);

insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

select nombre + ' ' + upper(apellido), 'DNI N. ' + documento, stuff(sueldo, 1, 0, '$') from empleados;

select documento, ceiling(sueldo) from empleados;

select nombre, apellido from empleados where datename(month, fechaNacimiento) = 'october';

select nombre, apellido from empleados where datepart(year, fechaIngreso) = 2000;






--28 - Ordenar registros (order by)
--Primer Problema:

if object_id('visitas') is not null drop table visitas;

create table visitas(
numero int identity, 
nombre varchar(30) default 'Anonimo', 
mail varchar(50), 
pais varchar(20),
fecha datetime,
primary key(numero)
);

insert into visitas(nombre,mail,pais,fecha) 
values('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');

insert into visitas(nombre,mail,pais,fecha) 
values('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');

insert into visitas(nombre,mail,pais,fecha) 
values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');

insert into visitas(nombre,mail,pais,fecha) 
values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

select * from visitas order by fecha desc;

select nombre, pais, datename(month, fecha) as mes from visitas order by pais asc, mes desc;

select pais, datename(month, fecha) as mes, datename(day, fecha) as dia, datename(hour, fecha) as hora
from visitas order by mes, dia, hora;

select mail, pais from visitas where datename(month, fecha) = 'october' order by pais;






--29 - Operadores lógicos ( and - or - not)
--Primer Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo int identity, 
nombre varchar(30), 
laboratorio varchar(30), 
precio decimal(5,2), 
cantidad tinyint,
primary key(codigo)
);


insert into medicamentos values('Sertal','Roche',5.2,100);

insert into medicamentos values('Buscapina','Roche',4.10,200);

insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);

insert into medicamentos values('Paracetamol 500','Bago',1.90,200);

insert into medicamentos values('Bayaspirina','Bayer',2.10,150);

insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250);

select codigo, nombre from medicamentos where laboratorio = 'Roche' and precio < 5;

select codigo, nombre from medicamentos where laboratorio = 'Roche' or precio < 5;

select * from medicamentos where not laboratorio = 'Bayer' and cantidad = 100;

select * from medicamentos where laboratorio = 'Bayer' and not cantidad = 100;

delete from medicamentos where laboratorio = 'Bayer' and precio > 10;

update medicamentos set cantidad=200 where laboratorio = 'Roche' and precio > 5;

delete from medicamentos where laboratorio = 'Bayer' or precio > 3;

select * from medicamentos;




--Segundo Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(
codigo int identity,
titulo varchar(40) not null,
actor varchar(20),
duracion tinyint,
primary key (codigo)
);

insert into peliculas values('Mision imposible','Tom Cruise',120);

insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',180);

insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190);

insert into peliculas values('Mision imposible 2','Tom Cruise',120);

insert into peliculas values('Mujer bonita','Richard Gere',120);

insert into peliculas values('Tootsie','D. Hoffman',90);

insert into peliculas values('Un oso rojo','Julio Chavez',100);

insert into peliculas values('Elsa y Fred','China Zorrilla',110);

select * from peliculas where actor = 'Tom Cruise' or actor = 'Richard Gere';

select * from peliculas where actor = 'Tom Cruise' and duracion < 100;

update peliculas set duracion = 200 where actor = 'Daniel R.' and duracion = 180;

delete from peliculas where not actor = 'Tom Cruise' and duracion >= 100;







--30 - Otros operadores relacionales (is null)
--Primer Problema:

if object_id('peliculas') is not null drop table peliculas;

create table peliculas(
codigo int identity,
titulo varchar(40) not null,
actor varchar(20),
duracion tinyint,
primary key (codigo)
);

insert into peliculas values('Mision imposible','Tom Cruise',120);

insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null);

insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190);

insert into peliculas values('Mision imposible 2','Tom Cruise',120);

insert into peliculas values('Mujer bonita',null,120);

insert into peliculas values('Tootsie','D. Hoffman',90);

insert into peliculas(titulo) values('Un oso rojo');

select * from peliculas where actor is null;

update peliculas set duracion = 0 where duracion is null;

delete from peliculas where actor is null and duracion = 0;







--31 - Otros operadores relacionales (between)
--Primer Problema:

if object_id('visitas') is not null drop table visitas;

create table visitas(
numero int identity, 
nombre varchar(30) default 'Anonimo', 
mail varchar(50), 
pais varchar(20),
fecha datetime,
primary key(numero)
);

insert into visitas(nombre,mail,pais,fecha) 
values('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');

insert into visitas(nombre,mail,pais,fecha) 
values('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');

insert into visitas(nombre,mail,pais,fecha) 
values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');

insert into visitas(nombre,mail,pais,fecha) 
values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');

insert into visitas(nombre,mail,pais,fecha) 
values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

insert into visitas(nombre,mail,pais) 
values('Federico1','federicogarcia@xaxamail.com','Argentina');

select * from visitas where fecha between '2006-09-12' and '2006-10-11';

select * from visitas where numero between 2 and 5;



--Segundo Problema:

if object_id('autos') is not null drop table autos;

create table autos(
patente char(6),
marca varchar(20),
modelo char(4),
precio decimal(8,2),
primary key(patente)
);

insert into autos values('ACD123','Fiat 128','1970',15000);

insert into autos values('ACG234','Renault 11','1980',40000);

insert into autos values('BCD333','Peugeot 505','1990',80000);

insert into autos values('GCD123','Renault Clio','1995',70000);

insert into autos values('BCC333','Renault Megane','1998',95000);

insert into autos values('BVF543','Fiat 128','1975',20000);

select * from autos where modelo between '1970' and '1990' order by modelo;

select * from autos where precio between 50000 and 100000;






--32 - Otros operadores relacionales (in)
--Primer Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechaVencimiento datetime not null
primary key(codigo)
);

insert into medicamentos values('Sertal','Roche',5.2,1,'2005-02-01');

insert into medicamentos values('Buscapina','Roche',4.10,3,'2006-03-01');

insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2007-05-01');

insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2008-02-01');

insert into medicamentos values('Bayaspirina','Bayer',2.10,150,'2009-12-01');

insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01');

select nombre, precio from medicamentos where laboratorio in('Bayer','Bago');

select * from medicamentos where cantidad between 1 and 5;

select * from medicamentos where cantidad in(1,5);





--33 - Búsqueda de patrones (like - not like)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaIngreso datetime,
seccion varchar(20),
sueldo decimal(6,2),
primary key(documento) 
);

insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);

insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);

insert into empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);

insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);

insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);

insert into empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);

insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

select * from empleados where nombre like '%Perez%';

select * from empleados where domicilio like 'Co%8%';

select * from empleados where domicilio like '%[02468]';

select * from empleados where documento  like '[^13]%' and nombre like '%ez';

select nombre from empleados where nombre like '%[yj]%';

select nombre, seccion from empleados where seccion like '[SG]_______';

select nombre, seccion from empleados where seccion not like '[SG]%';

select nombre, sueldo from empleados where sueldo like '%.00';

select * from empleados where fechaIngreso like '%1990%';





--34 - Contar registros (count)
--Primer Problema:

if object_id('medicamentos') is not null drop table medicamentos;

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechaVencimiento datetime not null,
numerolote int default null,
primary key(codigo)
);

insert into medicamentos values('Sertal','Roche',5.2,1,'2005-02-01',null);

insert into medicamentos values('Buscapina','Roche',4.10,3,'2006-03-01',null);

insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2007-05-01',null);

insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2008-02-01',null);

insert into medicamentos values('Bayaspirina',null,2.10,null,'2009-12-01',null);

insert into medicamentos values('Amoxidal jarabe','Bayer',null,250,'2009-12-15',null);

select count(*) from medicamentos;

select count(laboratorio) from medicamentos;

select count(precio) as 'Conteo con Precio', count(cantidad) as 'Conteo con Cantidad' from medicamentos;

select count(precio) from medicamentos where laboratorio like 'B%';

select count(numerolote) from medicamentos;






--36 - Funciones de agrupamiento (count - sum - min - max - avg)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadHijos tinyint,
primary key(documento) 
);

insert into empleados
values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);

insert into empleados
values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);

insert into empleados
values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);

insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);

insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);

insert into empleados
values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);

insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);

insert into empleados
values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);

insert into empleados 
values('Andres Costa','28444555',default,'Secretaria',null,null);

select count(*) from empleados;

select count(sueldo) from empleados where seccion = 'Secretaria';

select max(sueldo) as 'Sueldo Maximo', min(sueldo) as 'Sueldo Minimo' from empleados;

select max(cantidadHijos) from empleados where nombre like '%Perez%';

select avg(sueldo) from empleados;

select avg(sueldo) from empleados where seccion = 'Secretaria';

select avg(cantidadHijos) from empleados where seccion like '%Sistemas%';





--37 - Agrupar registros (group by)
--Primer Problema:

if object_id('visitantes') is not null drop table visitantes;

create table visitantes(
numero int identity, 
nombre varchar(30), 
edad tinyint,
sexo char(1) default 'f',
domicilio varchar(30),
ciudad varchar(20) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'No tiene',
montocompra decimal(6,2),
);

insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);

insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);

insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);

insert into visitantes (nombre, edad,sexo,telefono, mail) values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');

insert into visitantes (nombre, ciudad, montocompra) values ('Alejandra Gonzalez','La Falda',280.50);

insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra) values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);

insert into visitantes values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);

insert into visitantes values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

select ciudad, count(*) from visitantes group by ciudad;

select ciudad, count(telefono) from visitantes group by ciudad;

select sexo, sum(montocompra) from visitantes group by sexo;

select sexo, ciudad, max(montocompra), min(montocompra) from visitantes group by sexo, ciudad;

select ciudad, avg(montocompra) from visitantes group by ciudad;

select ciudad, count(*) from visitantes where mail is not null and mail <> 'No tiene' group by ciudad;

select ciudad, count(*) from visitantes where mail  is not null and mail <> 'No tiene' group by all ciudad;





--Segundo Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadHijos tinyint,
fechaIngreso datetime,
primary key(documento) 
);

insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');

insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');

insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');

insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');

insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');

insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');

insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');

insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');

insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null,null);

select seccion, count(*) from empleados group by seccion;

select seccion, avg(cantidadHijos) as 'Promedio de Hijos' from empleados group by seccion;

select datepart(year, fechaIngreso) as 'Fecha de Ingreso', count(*) from empleados 
group by datepart(year, fechaIngreso);

select seccion, avg(sueldo) as 'Sueldo Promedio' from empleados 
where cantidadHijos > 0 and cantidadHijos is not null group by seccion;

select seccion, avg(sueldo) as 'Sueldo Promedio' from empleados 
where cantidadHijos > 0 and cantidadHijos is not null group by all seccion;








--38 - Seleccionar grupos (having)
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

create table clientes(
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar(20),
telefono varchar(11),
primary key(codigo)
);

insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');

insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');

insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');

insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);

insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');

insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');

insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');

insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);

insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');

insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

select ciudad, provincia, count(*) from clientes group by ciudad, provincia;

select ciudad, provincia, count(*) as Total from clientes group by ciudad, provincia having count(*) > 1;

select ciudad, count(*) from clientes where domicilio = 'San Martin' group by all ciudad
having count(*) < 2 and ciudad <> 'Cordoba';





--Segundo Problema:

if object_id('visitantes') is not null drop table visitantes;

create table visitantes(
nombre varchar(30), 
edad tinyint,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
telefono varchar(11),
montocompra decimal(6,2) not null,
);

insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 

insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);

insert into visitantes values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 

insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);

insert into visitantes values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);

insert into visitantes values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);

insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);

insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);

insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);

insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select ciudad, sexo, sum(montocompra) from visitantes group by ciudad, sexo having sum(montocompra)>50;

select ciudad, sexo, count(montocompra) from visitantes where montocompra > 50 and telefono is not null
group by all ciudad, sexo having ciudad <> 'Cordoba' order by ciudad;

select ciudad, max(montocompra) as maximo from visitantes where domicilio is not null and sexo='f'
group by all ciudad having max(montocompra)>50;

select ciudad, sexo, count(*) as 'Total Visitantes', sum(montocompra) as 'Monto', avg(montocompra) 'Promedio Compra'
from visitantes
group by ciudad, sexo having  avg(montocompra)>30 order by sum(montocompra);





--39 - Registros duplicados (distinct)
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

create table clientes(
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar(20),
primary key(codigo)
);

insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');

insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');

insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');

insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');

insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');

insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');

insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');

insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');

insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');

insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

select distinct provincia from clientes;

select count(distinct provincia) from clientes;

select distinct ciudad from clientes;

select count(distinct ciudad) from clientes;

select count(distinct ciudad) from clientes where ciudad like '%Cordoba%';

select ciudad, count(distinct ciudad) as 'Cantidad de Ciudad' from clientes group by ciudad;




--Segundo Problema:

if object_id('inmuebles') is not null drop table inmuebles;

create table inmuebles(
documento char(8) not null,
apellido varchar(30),
nombre varchar(30),
domicilio varchar(20),
barrio varchar(20),
ciudad varchar(20),
tipo char(1),--b=baldio, e: edificado
superficie decimal (8,2)
);

insert into inmuebles values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);

insert into inmuebles values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);

insert into inmuebles values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);

insert into inmuebles values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);

insert into inmuebles values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);

insert into inmuebles values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);

insert into inmuebles values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);

insert into inmuebles values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);

insert into inmuebles values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

select distinct apellido from inmuebles;

select distinct documento from inmuebles;

select count(distinct documento) from inmuebles where ciudad like '%Cordoba%';

select count(distinct ciudad) from inmuebles where domicilio = 'San Martin'

select distinct nombre, apellido from inmuebles;

select documento, count(distinct barrio) from inmuebles group by documento;






--40 - Cláusula top
--Primer Problma:

if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8),
nombre varchar(30),
estadoCivil char(1), --c=casado, s=soltero,v=viudo
seccion varchar(20), 
);

insert into empleados values ('22222222','Alberto Lopez','c','Sistemas');

insert into empleados values ('23333333','Beatriz Garcia','c','Administracion');

insert into empleados values ('24444444','Carlos Fuentes','s','Administracion');

insert into empleados values ('25555555','Daniel Garcia','s','Sistemas');

insert into empleados values ('26666666','Ester Juarez','c','Sistemas');

insert into empleados values ('27777777','Fabian Torres','s','Sistemas');

insert into empleados values ('28888888','Gabriela Lopez',null,'Sistemas');

insert into empleados values ('29999999','Hector Garcia',null,'Administracion');

select top 5 * from empleados;

select top 4 nombre, seccion from empleados order by seccion;

select top 4 with ties nombre, seccion from empleados order by seccion;

select top 4 nombre, estadoCivil, seccion from empleados order by estadoCivil, seccion;

select top 4 with ties nombre, estadoCivil, seccion from empleados order by estadoCivil, seccion;






--41 - Eliminar restricciones (alter table - drop)
--Primer Problema:

if object_id('vehiculos') is not null drop table vehiculos;

create table vehiculos(
patente char(8) not null,
tipo char(10),--'a'=auto, 'm'=moto,
horallegada datetime not null,
horasalida datetime
);

alter table vehiculos add constraint CK_vehiculos_tipo check (tipo in('a','m'));

alter table vehiculos add constraint DF_vehiculos_tipo default 'a' for tipo;

alter table vehiculos add constraint CK_vehiculos_patente check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

alter table vehiculos add constraint PK_vehiculos_primary primary key(patente, horallegada);

insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

--insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

 sp_helpconstraint vehiculos;

 alter table vehiculos
  drop DF_vehiculos_tipo;

 sp_helpconstraint vehiculos;

 alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;

 sp_helpconstraint vehiculos;




--42 - Combinación interna (inner join)
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

if object_id('provincias') is not null drop table provincias;

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');

insert into provincias (nombre) values('Santa Fe');

insert into provincias (nombre) values('Corrientes');


insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);

insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);

insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);

insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);

insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);

insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);

insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);


select c.nombre, c.domicilio, c.ciudad, p.nombre from clientes as c 
join provincias as p on c.codigoprovincia = p.codigo;

select c.nombre, c.domicilio, c.ciudad, p.nombre from clientes as c 
join provincias as p on c.codigoprovincia = p.codigo order by p.nombre;

select * from clientes join provincias as p on clientes.codigoprovincia = p.codigo 
where p.nombre like '%Santa Fe%';





--Segundo Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('inasistencias') is not null drop table inasistencias;

create table inscriptos(
nombre varchar(30),
documento char(8),
deporte varchar(15),
matricula char(1),--'s' = paga 'n'=impaga
primary key(documento, deporte)
);

create table inasistencias(
documento char(8),
deporte varchar(15),
fecha datetime
);

insert into inscriptos values('Juan Perez','22222222','tenis','s');
insert into inscriptos values('Maria Lopez','23333333','tenis','s');
insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values('Marta Garcia','25555555','natacion','s');
insert into inscriptos values('Juan Perez','22222222','natacion','s');
insert into inscriptos values('Maria Lopez','23333333','natacion','n');

insert into inasistencias values('22222222','tenis','2006-12-01');
insert into inasistencias values('22222222','tenis','2006-12-08');
insert into inasistencias values('23333333','tenis','2006-12-01');
insert into inasistencias values('24444444','tenis','2006-12-08');
insert into inasistencias values('22222222','natacion','2006-12-02');
insert into inasistencias values('23333333','natacion','2006-12-02');

select incr.nombre, incr.deporte, ins.fecha from inscriptos as incr join inasistencias as ins 
on incr.deporte = ins.deporte and incr.documento = ins.documento order by incr.nombre, incr.deporte;

select incr.nombre, incr.deporte, ins.fecha from inscriptos as incr join inasistencias as ins 
on incr.deporte = ins.deporte and incr.documento = ins.documento where incr.documento = '22222222';

select incr.nombre, incr.deporte, ins.fecha from inscriptos as incr join inasistencias as ins 
on incr.deporte = ins.deporte and incr.documento = ins.documento where matricula = 's';







--43 - Combinación externa izquierda (left join)
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

if object_id('provincias') is not null drop table provincias;

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p
on c.codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre from provincias as p left join clientes as c
on c.codigoprovincia = p.codigo;

select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p
on c.codigoprovincia = p.codigo where p.codigo is not null;

 select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p
on c.codigoprovincia = p.codigo where p.codigo is null order by c.nombre;

select c.nombre,domicilio,ciudad, p.nombre from clientes as c left join provincias as p
on c.codigoprovincia = p.codigo where p.nombre = 'Cordoba';








--44 - Combinación externa derecha (right join)
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

if object_id('provincias') is not null drop table provincias;

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.nombre, c.domicilio, c.ciudad, p.nombre from clientes as c right join provincias as p
on c.codigoprovincia = p.codigo;

select c.nombre, c.domicilio, c.ciudad, p.nombre from clientes as c left join provincias as p
on c.codigoprovincia = p.codigo;

select c.nombre, c.domicilio, c.ciudad, p.nombre from clientes as c right join provincias as p
on c.codigoprovincia = p.codigo where p.codigo is not null;

select c.nombre, c.domicilio, c.ciudad, p.nombre from provincias as p right join clientes as c
on c.codigoprovincia = p.codigo where p.codigo is null order by c.ciudad;








--45 - Combinación externa completa (full join)
--Primer Problema:

if object_id('deportes') is not null drop table deportes;

if object_id('inscriptos') is not null drop table inscriptos;

create table deportes(
codigo int identity,
nombre varchar(30),
profesor varchar(30),
primary key(codigo)
);

create table inscriptos(
documento char(8),
codigodeporte int,
matricula char(1) --'s'=paga 'n'=impaga
);

insert into deportes values('tenis','Marcelo Roca');
insert into deportes values('natacion','Marta Torres');
insert into deportes values('basquet','Luis Garcia');
insert into deportes values('futbol','Marcelo Roca');

 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n');

select ins.documento, matricula, d.nombre from inscriptos as ins join deportes as d
on ins.codigodeporte = d.codigo;

select ins.documento, matricula, d.nombre from inscriptos as ins left join deportes as d
on ins.codigodeporte = d.codigo;

select ins.documento, matricula, d.nombre from inscriptos as ins right join deportes as d
on ins.codigodeporte = d.codigo;

select nombre from deportes as d left join inscriptos as ins
on ins.codigodeporte = d.codigo where ins.codigodeporte is null;

select ins.documento from inscriptos as ins left join deportes as d
on ins.codigodeporte = d.codigo where d.codigo is null;

select documento, nombre, profesor, matricula from inscriptos as ins full join deportes as d
on ins.codigodeporte = d.codigo;






--46 - Combinaciones cruzadas (cross join)
--Primer Problema:

if object_id('mujeres') is not null drop table mujeres;

if object_id('varones') is not null drop table varones;

create table mujeres(
nombre varchar(30),
domicilio varchar(30),
edad int
);

create table varones(
nombre varchar(30),
domicilio varchar(30),
edad int
);

insert into mujeres values('Maria Lopez','Colon 123',45);
insert into mujeres values('Liliana Garcia','Sucre 456',35);
insert into mujeres values('Susana Lopez','Avellaneda 98',41);

insert into varones values('Juan Torres','Sarmiento 755',44);
insert into varones values('Marcelo Oliva','San Martin 874',56);
insert into varones values('Federico Pereyra','Colon 234',38);
insert into varones values('Juan Garcia','Peru 333',50);

select v.nombre, v.edad, m.nombre, m.edad from varones as v cross join mujeres as m;

select v.nombre, v.edad, m.nombre, m.edad from varones as v cross join mujeres as m
where v.edad > 40 and m.edad > 40;

select v.nombre, v.edad, m.nombre, m.edad from varones as v cross join mujeres as m
where v.edad - m.edad between -10 and 10;






--Segundo Problema:

if object_id('guardias') is not null drop table guardias;

if object_id('tareas') is not null drop table tareas;

create table guardias(
documento char(8),
nombre varchar(30),
sexo char(1),
domicilio varchar(30),
primary key(documento)
);

create table tareas(
codigo int identity,
domicilio varchar(30),
descripcion varchar(30),
horario char(2),
primary key(codigo)
);

insert into guardias values('22333444','Juan Perez','m','Colon 123');
insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas values('Colon 1111','vigilancia exterior','AM');
insert into tareas values('Urquiza 234','vigilancia exterior','PM');
insert into tareas values('Peru 345','vigilancia interior','AM');
insert into tareas values('Avellaneda 890','vigilancia interior','PM');

select g.nombre, t.domicilio, t.descripcion from guardias as g cross join tareas as t;

select g.nombre, t.domicilio, t.descripcion from guardias as g cross join tareas as t
where (g.sexo = 'f' and t.descripcion like 'vigilancia interior') 
or (g.sexo = 'm' and t.descripcion like 'vigilancia exterior');






--47 - Combinación de más de dos tablas
--Primer Problema:

if object_id('socios') is not null drop table socios;

if object_id('deportes') is not null drop table deportes;

if object_id('inscriptos') is not null drop table inscriptos;

create table socios(
documento char(8) not null, 
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);

create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);

create table inscriptos(
documento char(8) not null, 
codigodeporte tinyint not null,
anio char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,anio)
);

insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');

insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');

insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

insert into inscriptos values ('26666666',0,'2006','s');

select s.nombre, d.nombre, ins.anio from inscriptos as ins 
left join socios as s on ins.documento = s.documento
right join deportes as d on ins.codigodeporte = d.codigo;

select s.nombre, d.nombre, anio, matricula from inscriptos as ins 
full join deportes as d on ins.codigodeporte = d.codigo
full join socios as s on ins.documento = s.documento;


select s.nombre, d.nombre, anio, matricula from inscriptos as ins 
join socios as s on ins.documento = s.documento
join deportes as d on ins.codigodeporte = d.codigo
where s.documento = '22222222'; 






--50 - Unión
--Primer Problema:

if object_id('clientes') is not null drop table clientes;

if object_id('proveedores') is not null drop table proveedores;

if object_id('empleados') is not null drop table empleados;

create table proveedores(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);

create table clientes(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);

create table empleados(
documento char(8) not null,
nombre varchar(20),
apellido varchar(20),
domicilio varchar(30),
primary key(documento)
);

insert into proveedores values('Bebida cola','Colon 123');
insert into proveedores values('Carnes Unica','Caseros 222');
insert into proveedores values('Lacteos Blanca','San Martin 987');

insert into clientes values('Supermercado Lopez','Avellaneda 34');
insert into clientes values('Almacen Anita','Colon 987');
insert into clientes values('Garcia Juan','Sucre 345');

insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Luis','Perez','Caseros 956');

select nombre, domicilio from proveedores
union
select nombre, domicilio from clientes
union
select nombre + ' ' + apellido, domicilio from empleados;


select nombre, domicilio, 'proveedor' as categoria from proveedores
union
select nombre, domicilio, 'cliente' from clientes
union
select nombre + ' ' + apellido, domicilio, 'empleado' from empleados order by categoria;







--51 - Agregar y eliminar campos ( alter table - add - drop)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
apellido varchar(20),
nombre varchar(20),
domicilio varchar(30),
fechaingreso datetime
);

insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

alter table empleados add sueldo decimal(5,2);

sp_columns empleados;

alter table empleados add codigo int identity;

--alter table empleados add documento char(8) not null;

alter table empleados add documento char(8) not null default '00000000';

sp_columns empleados;

alter table empleados drop column sueldo;

sp_columns empleados;

--alter table empleados drop column documento;

alter table empleados drop column codigo, fechaingreso;

sp_columns empleados;








--52 - Alterar campos (alter table - alter)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
legajo int not null,
documento char(7) not null,
nombre varchar(10),
domicilio varchar(30),
ciudad varchar(20) default 'Buenos Aires',
sueldo decimal(6,2),
cantidadhijos tinyint default 0,
primary key(legajo)
);

alter table empleados alter column nombre varchar(30);

sp_columns empleados;

alter table empleados alter column sueldo decimal(6,2) not null;

alter table empleados alter column documento char(8);

--alter table empleados alter column legajo tinyint not null;

insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);

insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

--alter table empleados alter column nombre varchar(30) not null;

delete from empleados where nombre is null;

alter table empleados alter column nombre varchar(30) not null;

alter table empleados alter column ciudad varchar(10);

--insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

alter table empleados alter column ciudad varchar(15);

insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

--alter table empleados alter column legajo int identity;








--53 - Campos calculados
--Primer Problema:

if object_id('articulos') is not null drop table articulos;

create table articulos(
codigo int identity,
descripcion varchar(30),
precio decimal(5,2) not null,
cantidad smallint not null default 0,
montototal as precio*cantidad
);

--insert into articulos values('birome',1.5,100,150);

insert into articulos values('birome',1.5,100);

insert into articulos values('cuaderno 12 hojas',4.8,150);

insert into articulos values('lapices x 12',5,200);

select * from articulos;

update articulos set precio = 10 where descripcion = 'birome';

select * from articulos;

update articulos set cantidad=200 where descripcion='birome';

select * from articulos;

--update articulos set montototal = 100 where descripcion='birome';






--54 - Subconsultas como expresión
--Primer Problema:

if object_id('alumnos') is not null drop table alumnos;

create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento),
constraint CK_alumnos_nota check (nota between 0 and 10)
);

insert into alumnos values('30111111','Ana Algarbe',5.1);

insert into alumnos values('30222222','Bernardo Bustamante',3.2);

insert into alumnos values('30333333','Carolina Conte',4.5);

insert into alumnos values('30444444','Diana Dominguez',9.7);

insert into alumnos values('30555555','Fabian Fuentes',8.5);

insert into alumnos values('30666666','Gaston Gonzalez',9.70);

select nombre, nota, documento from alumnos where nota = (select max(nota) from alumnos);

select nombre, nota, documento, nota-(select avg(nota) from alumnos) from alumnos 
where nota < (select avg(nota) from alumnos);

update alumnos set nota = 4 where nota = (select min(nota) from alumnos);

delete from alumnos where nota < (select avg(nota) from alumnos);






--55 - Subconsultas con in
--Primer Problema:

if object_id('ciudades') is not null drop table ciudades;

if object_id('clientes') is not null drop table clientes;

create table ciudades(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
codigociudad tinyint not null,
primary key(codigo),
constraint FK_clientes_codigociudad foreign key(codigociudad) references ciudades(codigo) on update cascade
);

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');

insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
insert into clientes values ('Garcia Juan','Rivadavia 444',3);
insert into clientes values ('Perez Luis','Sarmiento 555',3);
insert into clientes values ('Gomez Ines','San Martin 666',4);
insert into clientes values ('Torres Fabiola','Alem 777',5);
insert into clientes values ('Garcia Luis','Sucre 888',5);

select nombre from ciudades where codigo in(select codigociudad from clientes where domicilio like 'San Martin%');

select c.nombre from ciudades as c join clientes as cl on c.codigo = cl.codigociudad
where domicilio like 'San Martin%';

select nombre from ciudades where codigo not in(select codigociudad from clientes where nombre like 'A%');

select codigociudad from clientes where nombre like 'G%'







--56 - Subconsultas any - some - all
--Primer Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('socios') is not null drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas check (cuotas between 0 and 10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select s.numero, nombre, i.deporte from socios as s join inscriptos as i on s.numero = i.numerosocio;

select nombre from socios join inscriptos as i on numero = numerosocio 
where i.deporte = 'natacion' and numero = any(select numerosocio from inscriptos as i where deporte = 'tenis');

select deporte from inscriptos 
where numerosocio = 1 and deporte = any(select deporte from inscriptos where numerosocio = 2);

select i1.deporte from inscriptos as i1 join inscriptos as i2 on i1.deporte = i2.deporte
where i1.numerosocio = 1 and i2.numerosocio = 2;

select deporte from inscriptos 
where numerosocio = 2 and cuotas > any(select cuotas from inscriptos where numerosocio = 1);

select deporte from inscriptos 
where numerosocio = 2 and cuotas > all(select cuotas from inscriptos where numerosocio = 1);

delete from inscriptos where numerosocio = any(select numerosocio from inscriptos where cuotas = 0);






--58 - Subconsultas correlacionadas
--Primer Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('socios') is not null drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas check (cuotas between 0 and 10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select nombre, domicilio, 
(select count(*) from inscriptos where s.numero = numerosocio) as 'Cantidad deportes' 
from socios as s;

select nombre, (select count(*)*10 from inscriptos where s.numero = numerosocio) as 'Total coutas',
(select sum(cuotas) from inscriptos where s.numero = numerosocio) as 'Total cuotas pagas'
from socios as s;

select nombre, count(deporte), sum(cuotas) from socios join inscriptos on numero = numerosocio group by nombre;







--59 - Exists y No Exists
--Primer Problema:


if object_id('inscriptos') is not null drop table inscriptos;

if object_id('socios') is not null drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas check (cuotas between 0 and 10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select nombre from socios as s 
where exists (select * from inscriptos where s.numero = numerosocio and deporte like 'tenis');

select nombre from socios as s 
where not exists (select * from inscriptos where s.numero = numerosocio and deporte like 'basquet');

select nombre from socios as s 
where exists (select * from inscriptos where s.numero = numerosocio and cuotas = 10);







--60 - Subconsulta en lugar de una tabla
--Primer Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('deportes') is not null drop table deportes;

if object_id('socios') is not null drop table socios;

create table socios(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
primary key (documento)
);

create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);
 
create table inscriptos (
documento char(8) not null, 
codigodeporte tinyint not null,
año char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,año),
constraint FK_inscriptos_socio
foreign key (documento)
references socios(documento)
on update cascade
on delete cascade
);

insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

select documento, año, matricula, d.nombre, d.profesor from inscriptos as i 
join deportes as d on codigodeporte = codigo;

select s.nombre, t.deporte, t.profesor, t.año from socios as s
join (select documento, año, matricula, d.nombre as deporte, d.profesor from inscriptos as i 
join deportes as d on codigodeporte = codigo) as t on t.documento = s.documento;






--61 - Subconsulta (update - delete)
--Primer Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('socios') is not null drop table socios;

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
matricula char(1),-- 'n' o 's',
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
);

insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(1,'basquet','s');
insert into inscriptos values(1,'natacion','s');
insert into inscriptos values(2,'tenis','s');
insert into inscriptos values(2,'natacion','s');
insert into inscriptos values(2,'basquet','n');
insert into inscriptos values(2,'futbol','n');
insert into inscriptos values(3,'tenis','s');
insert into inscriptos values(3,'basquet','s');
insert into inscriptos values(3,'natacion','n');
insert into inscriptos values(4,'basquet','n');

update inscriptos set matricula = 's' 
where numerosocio = (select numero from socios where documento = '25555555');

delete from inscriptos 
where numerosocio in(select numero from socios join inscriptos on numero = numerosocio where matricula = 'n');





--62 - Subconsulta (insert)
--Primer Problema:

if object_id('facturas') is not null drop table facturas;

if object_id('clientes') is not null drop table clientes;

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);

create table facturas(
numero int not null,
fecha datetime,
codigocliente int not null,
total decimal(6,2),
primary key(numero),
constraint FK_facturas_cliente
foreign key (codigocliente)
references clientes(codigo)
on update cascade
);

insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');
insert into clientes values('Ana Garcia','Sarmiento 576');
insert into clientes values('Susana Molina','San Martin 555');

insert into facturas values(1200,'2007-01-15',1,300);
insert into facturas values(1201,'2007-01-15',2,550);
insert into facturas values(1202,'2007-01-15',3,150);
insert into facturas values(1300,'2007-01-20',1,350);
insert into facturas values(1310,'2007-01-22',3,100);

if object_id ('clientespref') is not null drop table clientespref;

create table clientespref(
nombre varchar(30),
domicilio varchar(30)
);

insert into clientespref(nombre, domicilio)
select nombre, domicilio from clientes 
where codigo in(select codigocliente from facturas join clientes on codigo = codigocliente
group by codigocliente having sum(total) > 500)

select * from clientespref;







--63 - Crear tabla a partir de otra (select - into)
--Primer Problema:

if object_id('empleados')is not null drop table empleados;

if object_id('sucursales')is not null drop table sucursales;

create table sucursales( 
codigo int identity,
ciudad varchar(30) not null,
primary key(codigo)
); 

create table empleados( 
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
codigosucursal int,
primary key(documento),
constraint FK_empleados_sucursal
foreign key (codigosucursal)
references sucursales(codigo)
on update cascade
); 

insert into sucursales values('Cordoba');
insert into sucursales values('Villa Maria');
insert into sucursales values('Carlos Paz');
insert into sucursales values('Cruz del Eje');

insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

select documento, nombre, domicilio, seccion, sueldo, ciudad from empleados 
join sucursales on codigo = codigosucursal;

if object_id('secciones') is not null drop table secciones;

select distinct seccion as nombre into secciones from empleados;

select * from secciones;

if object_id('sueldoxseccion') is not null drop table sueldoxseccion;

select seccion, sum(sueldo) as total into sueldoxseccion from empleados group by seccion;

select * from sueldoxseccion;

if object_id('maximossueldos') is not null drop table sueldoxseccion;

select top 3 * into maximossueldos from empleados order by sueldo;

select * from maximossueldos;

if object_id('sucursalCordoba') is not null drop table sucursalCordoba;

select nombre, ciudad into sucursalCordoba from empleados join sucursales on codigo = codigosucursal
where ciudad = 'Cordoba';

select *from sucursalCordoba;







--64 - Vistas
--Primer Problema:

if object_id('inscriptos') is not null drop table inscriptos;

if object_id('socios') is not null drop table socios;

if object_id('profesores') is not null drop table profesores; 

if object_id('cursos') is not null drop table cursos;

create table socios(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_socios_documento
primary key (documento)
);

create table profesores(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_profesores_documentos
primary key (documento)
);

create table cursos(
numero tinyint identity,
deporte varchar(20),
dia varchar(15),
constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
documentoprofesor char(8),
constraint PK_cursos_numero
primary key (numero),
);

create table inscriptos(
documentosocio char(8) not null,
numero tinyint not null,
matricula char(1),
constraint CK_inscriptos_matricula check (matricula in('s','n')),
constraint PK_inscriptos_documento_numero
primary key (documentosocio,numero)
);

insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos values('tenis','lunes','22222222');
insert into cursos values('tenis','martes','22222222');
insert into cursos values('natacion','miercoles','22222222');
insert into cursos values('natacion','jueves','23333333');
insert into cursos values('natacion','viernes','23333333');
insert into cursos values('futbol','sabado','24444444');
insert into cursos values('futbol','lunes','24444444');
insert into cursos values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');

if object_id('vista_club') is not null drop view vista_club;

create view vista_club (socio, documento, deporte, dia, profesor, matricula) as
select s.nombre ,s.documento, c.deporte,dia, p.nombre, matricula from socios as s
full join inscriptos as i on s.documento = i.documentosocio
full join cursos as c on i.numero = c.numero
full join profesores as p on c.documentoprofesor = p.documento;

select * from vista_club;

select deporte,dia,count(socio) as cantidad from vista_club 
where deporte is not null group by deporte,dia order by cantidad;

select deporte,dia from vista_club where socio is null and deporte is not null;

select socio from vista_club where socio is null;

select profesor from vista_club where deporte is null;

select distinct profesor, dia from vista_club;

select distinct profesor, dia from vista_club order by dia;

select socio from vista_club where deporte='tenis' and dia='lunes';

if object_id('vista_inscriptos') is not null drop view vista_inscriptos;

create view vista_inscriptos (cantidadins, numero, deporte, dia) as
select (select count(*) from inscriptos where c.numero = numero), numero ,deporte, dia from cursos as c;

select * from vista_inscriptos;






--67 - Lenguaje de control de flujo (case)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
fechaingreso datetime,
cantidadhijos tinyint,
sueldo decimal(5,2),
primary key(documento)
);

insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

select sexo, count(*), regalo = 
case
when sexo = 'f' then 'ramo'
when sexo = 'm' then 'corbata'
end
from empleados where datepart(month, fechanacimiento) = 5 group by sexo;

select nombre, datepart(year, getdate()) - datepart(year, fechaingreso) as 'Anios servicio', placa =
case (datepart(year, getdate()) - datepart(year, fechaingreso)%10)
when 0 then 'si'
else 'no'
end
from empleados where datepart(year, fechaingreso) = 4;


select nombre, sueldo, cantidadhijos, porhijo =
case 
when sueldo <= 500 then 200
else 100
end,
salariofamilar =
case
when sueldo <= 500 then 200*cantidadhijos
else 100*cantidadhijos
end,
sueldototal=
case
when sueldo < = 500 then sueldo+( 200*cantidadhijos)
else sueldo+(100*cantidadhijos)
end
from empleados order by sueldototal;





--68 - Lenguaje de control de flujo (if)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
sueldo decimal(5,2),
primary key(documento)
);

insert into empleados values ('22333111','Juan Perez','m','1970-05-10',550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06',650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25',510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29',700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22',400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10',420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21',350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12',390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02',400);

if exists(select * from empleados where datepart(month,fechanacimiento)=5)
select sexo, count(*) from empleados where datepart(month,fechanacimiento)=5 group by sexo
else
select 'no hay empleados';







--70- Procedimientos almacenados (crear - ejecutar)
--Primer Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8),
nombre varchar(20),
apellido varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
seccion varchar(20),
primary key(documento)
);

insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

if object_id('pa_empleados_sueldo') is not null drop procedure pa_empleados_sueldo;

create procedure pa_empleados_sueldo
 as
select nombre, apellido, sueldo from empleados;

exec pa_empleados_sueldo;

if object_id('pa_empleados_hijos') is not null drop procedure pa_empleados_hijos;

create procedure pa_empleados_hijos as
select nombre, apellido, cantidadhijos from empleados where cantidadhijos <> 0;

exec pa_empleados_hijos;

update empleados set cantidadhijos = 3 where cantidadhijos = 0;

exec pa_empleados_hijos;






--73 - Funciones escalares (crear y llamar)
--Primer Problema:

if object_id('consultas') is not null drop table consultas;

if object_id('medicos') is not null drop table medicos;

create table medicos (
documento char(8) not null,
nombre varchar(30),
constraint PK_medicos 
primary key clustered (documento)
);

create table consultas(
fecha datetime,
medico char(8) not null,
paciente varchar(30),
constraint PK_consultas
primary key (fecha,medico),
constraint FK_consultas_medico
foreign key (medico)
references medicos(documento)
on update cascade
on delete cascade
);

insert into medicos values('22222222','Alfredo Acosta');
insert into medicos values('23333333','Pedro Perez');
insert into medicos values('24444444','Marcela Morales');

insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

if object_id('f_nombreDia') is not null drop function f_nombreDia;

create function f_nombreDia(@fecha varchar(30))
returns varchar(10)
as
begin
 declare @nom varchar(10)
 set @nom = 
 case datename(day, @fecha)
       when 'Monday' then 'Lunes'
       when 'Tuesday' then 'Martes'
       when 'Wednesday' then 'Miercoles'
       when 'Thursday' then 'Jueves'
       when 'Friday' then 'Viernes'
       when 'Saturday' then 'Sabado'
       when 'Sunday' then 'Domingo'
 end
return @nom
end;


if object_id('f_horario') is not null drop function f_horario;

create function f_horario (@fecha varchar(30))
returns varchar(5)
  as
  begin
    declare @nombre varchar(5)
    if (isdate(@fecha)= 1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
      set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
    end
    return @nombre
 end;

if object_id('f_fecha') is not null drop function f_fecha;

create function f_fecha(@fecha varchar(30))
returns varchar(12)
  as
  begin
    declare @nombre varchar(12)
    if (isdate(@fecha) = 1)
    begin
      set @fecha=cast(@fecha as date)
      set @nombre=rtrim(cast(@fecha as varchar(12)))
    end
    return @nombre
 end;

select dbo.f_nombreDia(fecha), dbo.f_horario(fecha), dbo.f_fecha(fecha), paciente from consultas
join medicos on documento = medico where nombre = 'Alfredo Acosta';  

select fecha, m.nombre from consultas as c
join medicos as m on m.documento = c.medico where dbo.f_nombredia(fecha)= 'Sabado';

declare @valor char(30)
set @valor='2007/04/09'
select dbo.f_nombreDia(@valor);






--Segundo Problema:

if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8) not null,
nombre varchar(30),
fechanacimiento datetime,
fechaingreso datetime,
telefono char(12),
mail varchar(50)
);

insert into empleados 
values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');

insert into empleados 
values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);

insert into empleados 
values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);

insert into empleados 
values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

if object_id('f_edad') is not null drop function f_edad;

create function f_edad(@fecha1 datetime, @fecha2 datetime = '2007/01/01')
returns tinyint
 begin
  declare @edad tinyint
  if(@fecha1 > @fecha2)
   begin
    set @edad = datepart(year, @fecha1)- datepart(year, @fecha2)
    if(datepart(year, @fecha1) < datepart(year, @fecha2))
     set @edad = @edad-1
  else
   if(datepart(month, @fecha1) = datepart(month, @fecha2) and 
      datepart(day, @fecha1) < datepart(day, @fecha2))
    set @edad = @edad-1
   end
  return @edad
 end;

select nombre, dbo.f_edad(getdate(), fechanacimiento) as edad from empleados;

select nombre, dbo.f_edad(fechaingreso , fechanacimiento) as 'Anios Servicios' from empleados;

select dbo.f_edad(getdate(), '6/26/1995');

--select dbo.f_edad();

select dbo.f_edad(getdate(), default);

if object_id('f_valorNulos') is not null drop function f_valorNulos;

create function f_valorNulos(@valor varchar(50))
returns varchar(50)
 begin
  declare @dato varchar(50)
  if(@valor is null)
   set @dato = 'No tiene'
  return @dato
 end;

select dbo.f_valorNulos(mail), dbo.f_valorNulos(telefono) from empleados;








--74 - Funciones de tabla de varias instrucciones
--Primer Problema:


if object_id('empleados') is not null drop table empleados;

create table empleados(
documento char(8) not null,
apellido varchar(30) not null,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(30),
fechanacimiento datetime,
constraint PK_empleados
primary key(documento)
);

insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

if object_id('f_empleados') is not null drop function f_empleados;

create function f_empleados(@valor varchar(10))
returns @list table(documento char(8), nombre varchar(60), domicilio varchar(60), nacimiento varchar(12))
as
 begin
  if(@valor = 'total')
   insert @list select documento, nombre, domicilio, fechanacimiento from empleados
  if(@valor = 'parcial')
   insert @list select documento, apellido, ciudad, fechanacimiento from empleados
  return
 end;

select * from f_empleados('total');

--select * from f_empleados();

select * from f_empleados('');

select * from f_empleados('parcial') where domicilio like 'Cordoba';





