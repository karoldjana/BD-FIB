-- Q1:
-- Sentències de preparació de la base de dades:
create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);
-- instantFi te valor null quan una assignacio es encara vigent.

-- Sentències d'esborrat de la base de dades:
DROP TABLE assignacions;
DROP TABLE despatxos;
DROP TABLE professors;

--------------------------
-- Joc de proves Public
--------------------------

-- Sentències d'inicialització:
insert into professors values('111','toni','3111',3500);

insert into despatxos values('omega','120',20);

insert into assignacions values('111','omega','120',345,null);

-- Sentències de neteja de les taules:
DELETE FROM assignacions;
DELETE FROM despatxos;
DELETE FROM professors;

/*
Doneu una sentència SQL per obtenir el nom dels professors que o bé se sap el seu número de telèfon (valor diferent de null) i 
tenen un sou superior a 2500, o bé no se sap el seu número de telèfon (valor null) i no tenen cap assignació a un despatx amb 
superfície inferior a 20. 

Pel joc de proves que trobareu al fitxer adjunt, la sortida seria: 

NomProf
toni
*/

-- Solución:
select p.nomProf
from professors p
where (p.telefon is not null and p.sou > 2500) or 
		(p.telefon is null and not exists (
				select d1.superficie
				from despatxos d1, assignacions a1
				where p.dni = a1.dni and a1.modul = d1.modul and a1.numero = d1.numero and d1.superficie < 20));



-- Q2:
-- Sentències de preparació de la base de dades:
create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);
-- instantFi te valor null quan una assignacio es encara vigent.

-- Sentències d'esborrat de la base de dades:
DROP TABLE assignacions;
DROP TABLE despatxos;
DROP TABLE professors;

--------------------------
-- Joc de proves Public
--------------------------

-- Sentències d'inicialització:
insert into professors values('111','toni','3111',100);

insert into despatxos values('omega','118',16);
insert into despatxos values('omega','120',20);

insert into assignacions values('111','omega','118',109,344);
insert into assignacions values('111','omega','120',345,null);

-- Sentències de neteja de les taules:
DELETE FROM assignacions;
DELETE FROM despatxos;
DELETE FROM professors;

/*
Donar una sentència SQL per obtenir els professors que tenen alguna assignació finalitzada (instantFi diferent de null) a un 
despatx amb superfície superior a 15 i que cobren un sou inferior o igual a la mitjana del sou de tots els professors.
En el resultat de la consulta ha de sortir el dni del professor, el nom del professor, i el darrer instant en què el professor 
ha estat assignat a un despatx amb superfície superior a 15. 

Pel joc de proves que trobareu al fitxer adjunt, la sortida ha de ser:

DNI	NomProf	Darrer_instant
111	toni	344
*/

-- Solución:
select distinct p.dni, p.nomProf, MAX(a.instantFi) as Darrer_instant
from professors p natural inner join assignacions a natural inner join despatxos d
where a.instantFi is not null and d.superficie > 15 and
 p.sou <= (select AVG(p1.sou) from professors p1)
group by p.dni;



-- Q3:
-- Sentències de preparació de la base de dades:
create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);
-- instantFi te valor null quan una assignacio es encara vigent.

-- Sentències d'esborrat de la base de dades:
drop table Assignacions;
drop table Despatxos;
drop table Professors;

/*
Suposem la base de dades que podeu trobar al fitxer adjunt. 
Suposem que aquesta base de dades està en un estat on no hi ha cap fila. 
Doneu una seqüència de sentències SQL d'actualització (INSERTs i/o UPDATEs) que violi la integritat referencial de la clau forana 
de la taula Assignacions que referencia la taula Despatxos. 
Les sentències NOMÉS han de violar aquesta restricció. 
*/

-- Solución:
insert into professors values('111','toni','3111',100);
insert into despatxos values('omega','120',20);
insert into assignacions values('111','omega','120',345,null);

update assignacions 
set modul = 'iasi', numero = '1' 
where dni ='111';



-- Q4:
-- Sentències de preparació de la base de dades:
create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);
-- instantFi te valor null quan una assignacio es encara vigent.

-- Sentències d'esborrat de la base de dades:
drop table Assignacions;
drop table Despatxos;
drop table Professors;

--------------------------
-- Joc de proves Public
--------------------------

-- Sentències de neteja de les taules:
delete from assignacions;
delete from despatxos;
delete from professors;

/*
Suposeu la base de dades que podeu trobar al fitxer adjunt. 
Doneu una seqüència de sentències SQL d'actualització (INSERTs i/o UPDATEs) de tal manera que, un cop executades, el resultat 
de la consulta següent sigui el que s'indica. El nombre de files de cada taula ha de ser el més petit possible, i hi ha d'haver 
com a màxim un professor. 

Per a la consulta:

Select count(*) as quant 
From assignacions ass 
Where ass.instantInici>50 
Group by ass.instantInici 
order by quant; 

El resultat haurà de ser:

quant
1
2
*/

-- Solución:
insert into professors values('111','toni','3111',100);

insert into despatxos values('omega','119',16);
insert into despatxos values('omega','120',16);

insert into assignacions values('111','omega','119',109,344);
insert into assignacions values('111','omega','119',345,null);
insert into assignacions values('111','omega','120',109,null);
