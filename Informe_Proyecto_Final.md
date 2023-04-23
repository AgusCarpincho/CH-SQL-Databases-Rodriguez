# Informe del Proyecto Final

<h2>
Rodríguez Agustín Tomás Abel
</h2>

<b>
Coderhouse - Curso SQL - Comisión 39775
</b>

</br>

### Nota del autor

A continuación se hará una breve explicación sobre la temática del
proyecto final. Luego se hablará de las tablas creadas para dicho propósito y, adicionalmente, se
mostrará un diagrama entidad relación para visualizar de manera gráfica las tablas involucradas
en la creación de la base de datos.

</br>

## Objetivo

Crear una base de datos y junto con todos los scripts necesarios para la posterior puesta en marcha y mantenimiento del mismo aplicando todos los conocimientos y técnicas adquiridas a lo largo de la cursada.

</br>

## Modelo de Negocio

El modelo de negocio está exclusivamente enfocado al sector de las organizaciones de espionaje del estado como las privadas.
La finalidad del proyecto es proporcionar almacenamiento de datos sensibles, fácil acceso a los recursos de la agencia y generación de información valiosa para la organización.

</br>

## Temática

Se eligió como temática del proyecto simular la creación y mantenimiento de una base de datos utilizada por una organización de espionaje internacional.

![Imágen Agencia de Espionaje](https://www.marketingdirecto.com/wp-content/uploads/2013/07/Navegaci%C3%B3n-privada.jpg)

</br>

## Diagrama Entidad Relación

![Imágen Agencia de Espionaje](./Diagrama%20Entidad%20Relacion.jpg)

</br>

## Tablas del proyecto final

</br>

**Target**

La misma guarda registros sobre los objetivos claves de cada misión. Los mismos
pueden ser personas, objetos o metas en particulares que pueden variar según la
misión. Cada objetivo tiene un espía asignado e información del país o región
sobre la cual puede encontrarse dicho objetivo.

_Estructura:_

```sql
Columna: id_target
Tipo de dato: int
Tipo de clave: Primary

Columna: target_name
Tipo de dato: varchar(60)

Columna: id_operational_country
Tipo de dato: int
Tipo de clave: Foreign

Columna: spy_assigned
Tipo de dato: boolean
```

**Mission**

La tabla almacena los registros más importantes de la base ya que a partir de ella
se relacionan todas las demás. Además del nombre en código de la misión
también se almacena información del espía asignado, recursos disponibles y
objetivos.

_Estructura:_

```sql
Columna: id_mission
Tipo de dato: int
Tipo de clave: Primary

Columna: mission_name
Tipo de dato: varchar(30)

Columna: id_resource
Tipo de dato: int
Tipo de clave: Foreign

Columna: id_target
Tipo de dato: int
Tipo de clave: Foreign

Columna: id_spy
Tipo de dato: int
Tipo de clave: Foreign
```

**Resource**

Almacena la información sobre un recurso que puede ser asignado a una misión.
En ella se detalla el nombre del recurso, si es accesible y si se puede confiar en el
recurso.

_Estructura:_

```sql
Columna: id_resource
Tipo de dato: int
Tipo de clave: Primary

Columna: resource_name
Tipo de dato: varchar(30)

Columna: is_accessible
Tipo de dato: boolean

Columna: can_we_trust
Tipo de dato: boolean
```

**Spy**

Almacena la información de los agentes activos, su nombre real, edad, su
habilidad y su identidad falsa.

_Estructura:_

```sql
Columna: id_spy
Tipo de dato: int
Tipo de clave: Primary

Columna: age
Tipo de dato: int

Columna: skill_level
Tipo de dato: int

Columna: real_name
Tipo de dato: varchar(30)

Columna: id_fakeId
Tipo de dato: int
Tipo de clave: Foreign
```

**Operational Country**

Almacena información sobre el país o región sobre la que se opera especificando
el nivel de peligrosidad del área, las misiones y los espías asignados a la misma.

_Estructura:_

```sql
Columna: id_operational_country
Tipo de dato: int
Tipo de clave: Primary

Columna: country_name
Tipo de dato: varchar(30)

Columna: relationship
Tipo de dato: varchar(30)

Columna: sympathetic_to_the_agency
Tipo de dato: boolean

Columna: danger_level
Tipo de dato: int
```

**Fake Id**

Almacena información de las identidades falsas que se les proporcionan a los
agentes para poder circular como civiles libres de sospechas. Dentro de esa
información se les asigna un nombre falso, otra edad y una historia falsa detallada
que deben seguir acorde al personaje que se les asignó.

_Estructura:_

```sql
Columna: id_fakeId
Tipo de dato: int
Tipo de clave: Primary

Columna: fake_name
Tipo de dato: varchar(30)

Columna: fake_story
Tipo de dato: varchar(100)

Columna: fake_age
Tipo de dato: int
```

</br>

# Scripts SQL

### Aclaración

Todos los scripts mencionados aquí se encuentran dentro del entregable. Solamente se los agrega aquí para facilitar la tarea al corrector.

Si se desea partir de una base con datos cargados se puede utilizar el script de backup que se encuentra en la carpeta de Scripts adjunto al entregable.

</br>

## Script de Creación del Schema y Tables

</br>

```sql
CREATE SCHEMA if not exists spy_agency;

USE spy_agency;


-- Define un recurso que puede ser solicitado en la misión, el recurso puede ser una persona o un objeto
CREATE TABLE resource(
	id_resource int NOT NULL auto_increment,
    resource_name varchar(30) NOT NULL,
    is_accessible boolean NOT NULL,
    can_we_trust boolean NOT NULL,
    CONSTRAINT PK_RESOURCE PRIMARY KEY (id_resource)
);

-- Define una identidad falsa con datos básicos. La misma puede ser usada por cualquier espía
CREATE TABLE fake_id(
	id_fakeId int NOT NULL auto_increment,
    fake_name varchar(30) NOT NULL,
    fake_story varchar(100) NOT NULL,
    fake_age int NOT NULL,
    CONSTRAINT PK_FAKEID PRIMARY KEY (id_fakeId)
);

-- Define diversos objetivos disponibles por la agencia y el país donde opera,
-- los objetivos pueden ser personas u objetos
CREATE TABLE target(
	id_target int NOT NULL auto_increment,
	target_name varchar(60) NOT NULL,
    id_operational_country int NOT NULL,
    spy_assigned bool NOT NULL,
    CONSTRAINT PK_TARGET PRIMARY KEY (id_target)
);

-- Define el nombre de la misión, el recurso para la misión, el objetivo y el espía asignado
CREATE TABLE mission(
	id_mission int NOT NULL auto_increment,
    mission_name varchar(30) NOT NULL,
    id_resource int NOT NULL,
    id_target int NOT NULL,
    id_spy int NOT NULL,
    CONSTRAINT PK_MISSION PRIMARY KEY (id_mission)
);

-- Define un espía, datos básicos y su identidad secreta
CREATE TABLE spy(
	id_spy int NOT NULL auto_increment,
	age int NOT NULL,
    skill_level int NOT NULL,
    real_name varchar(30) NOT NULL,
    id_fakeId int NOT NULL,
    CONSTRAINT PK_SPY PRIMARY KEY (id_spy)
);

-- Define el país donde se opera, la relación que tiene el pais con la agencia , el peligro en la región y si el gobierno simpatiza con la agencia
CREATE TABLE operational_country(
	id_operational_country int NOT NULL auto_increment,
    country_name varchar(30) NOT NULL,
    relationship varchar(30) NOT NULL,
    sympathetic_to_the_agency bool NOT NULL,
    danger_level int NOT NULL,
    CONSTRAINT PK_OPERATIONAL_COUNTRY PRIMARY KEY (id_operational_country)
);


-- constraints of FKs

-- FKs tarjet
ALTER TABLE target ADD CONSTRAINT FK_TARGET_OPERATIONAL_COUNTRY
FOREIGN KEY FK_TARGET_OPERATIONAL_COUNTRY (id_operational_country)
REFERENCES operational_country (id_operational_country) ON DELETE CASCADE;


-- FKs mission
ALTER TABLE mission ADD CONSTRAINT FK_MISSION_RESOURCE
FOREIGN KEY FK_MISSION_RESOURCE (id_resource)
REFERENCES resource (id_resource) ON DELETE CASCADE;

ALTER TABLE mission ADD CONSTRAINT FK_MISSION_TARGET
FOREIGN KEY FK_MISSION_TARGET (id_target)
REFERENCES target (id_target) ON DELETE CASCADE;

ALTER TABLE mission ADD CONSTRAINT FK_MISSION_SPY
FOREIGN KEY FK_MISSION_SPY (id_spy)
REFERENCES spy (id_spy) ON DELETE CASCADE;

-- FKs spy
ALTER TABLE spy ADD CONSTRAINT FK_SPY_FAKEID
FOREIGN KEY FK_SPY_FAKEID (id_fakeId)
REFERENCES fake_id (id_fakeId) ON DELETE CASCADE;
```

## Script de Creación Functions

</br>

```sql
use spy_agency;


-- Devuelve el primer país que tenga el nivel de peligro pasado por parámetro
-- Utiliza la tabla operational_country

delimiter $$
create function fn_first_country_with_danger_level(p_level integer)
returns varchar(30)
deterministic
begin
	declare country varchar(30);
	set country = (select distinct country_name from operational_country where p_level = danger_level limit 1);
	return country;
end$$
delimiter ;

-- Pruebo
 -- select fn_first_country_with_danger_level(3)



-- Recibe un nombre de un espía y devuelve las misiones que tiene asignadas
-- utiliza la tabla mission
delimiter $$
create function fn_missions_number_assigned_to(spy_name varchar(40))
returns integer
deterministic
begin
	return (
		select count(*) from mission where mission.id_spy = (select id_spy from spy where spy.real_name like spy_name)
    );
end$$
delimiter ;

-- Pruebo
-- select fn_missions_number_assigned_to("Ana");
```

## Script de Creación Views

</br>

```sql
use spy_agency;

-- Esta vista me permite visualizar las identidades falsas con las/os espías que las usan
create or replace view vw_fakeId_per_spy as (
	select distinct fake_id.fake_name as fiction_name, spy.real_name as name
    from fake_id
    join spy
    on fake_id.id_fakeId = spy.id_fakeId
);

 -- select * from vw_fakeid_per_spy;

-- Esta vista me permite visualizar los espías asignados en cada misión, el objetivo y el país donde se debe operar
create or replace view vw_spy_assigned_per_mission as (
	select distinct spy.real_name as spy_assigned, target.target_name as target ,mission.mission_name as mission
    from mission
    join spy
    join target
    on mission.id_spy = spy.id_spy
    and mission.id_target = target.id_target
);

-- select * from vw_spy_assigned_per_mission;

-- Esta vista me permite visualizar los recursos asignados en cada pais y si son accesibles
create or replace view vw_resource_by_country as (
	select resource.resource_name as resource, operational_country.country_name as country
    from resource
    join operational_country
);

-- select * from vw_resource_by_country;

-- Esta vista me permite visualizar las misiones y el nivel de peligro en la región que opera
create or replace view vw_mission_and_danger_by_country as (
	select
		distinct
		mission.mission_name as mission,
        operational_country.country_name as country,
        operational_country.danger_level as danger
    from mission
    join operational_country
    join target
    on mission.id_target = target.id_operational_country
);

-- select * from vw_mission_and_danger_by_country;


-- Esta vista me permite visualizar recursos asignados a las misiones
create or replace view vw_resource_assigned_to_mission as (
	select
		resource.resource_name as resource,
        mission.mission_name as mission
	from resource
    join mission
    on resource.id_resource = mission.id_resource
);

-- select * from vw_resource_assigned_to_mission;
```

## Script de Creación Triggers

</br>

```sql

use spy_agency;

-- Creamos primero la tabla AuditLog para guardar los registros de los triggers
-- Si bien la tabla debería agregarse al script de creación de schema y tablas decido agregarla acá porque está relacionada
-- con la idea de los triggers

CREATE TABLE auditlog(
	id_log int NOT NULL auto_increment,
    operation varchar(10) NOT NULL,
    timestamp_operation varchar(30) NOT NULL,
    user varchar(30) NOT NULL,
    old_data varchar(150),
    new_data varchar(150),
    CONSTRAINT PK_LOG PRIMARY KEY (id_log)
);

-- Triggers para la tabla RESOURCE

-- Trigger para insertar
CREATE TRIGGER insert_resource_trigger
AFTER INSERT ON spy_agency.resource
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, new_data)
VALUES ("INSERT", CURRENT_TIMESTAMP(), user(), concat(" resource_name: ", NEW.resource_name, " is_accessible: ", NEW.is_accessible, " can_we_trust: ", NEW.can_we_trust) );

-- Trigger para actualizar
CREATE TRIGGER update_resource_trigger
AFTER UPDATE ON spy_agency.resource
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, old_data, new_data)
VALUES (
"UPDATE",
CURRENT_TIMESTAMP(),
user(),
concat(" resource_name: ", OLD.resource_name, " is_accessible: ", OLD.is_accessible, " can_we_trust: ", OLD.can_we_trust),
concat(" resource_name: ", NEW.resource_name, " is_accessible: ", NEW.is_accessible, " can_we_trust: ", NEW.can_we_trust) );

-- Trigger para borrar

CREATE TRIGGER delete_resource_trigger
AFTER DELETE ON spy_agency.resource
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, old_data)
VALUES (
"DELETE",
CURRENT_TIMESTAMP(),
user(),
concat(" resource_name: ", OLD.resource_name, " is_accessible: ", OLD.is_accessible, " can_we_trust: ", OLD.can_we_trust) );

-- Ahora creo los triggers de la siguiente tabla, voy a elegir FAKE_id

-- Trigger para insertar

CREATE TRIGGER insert_fake_id_trigger
AFTER INSERT ON spy_agency.fake_id
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, new_data)
VALUES ("INSERT", CURRENT_TIMESTAMP(), user(), concat(" fake_name: ", NEW.fake_name," fake_story: ", NEW.fake_story, " fake_age: ", NEW.fake_age));

-- Trigger para actualizar

CREATE TRIGGER update_fake_id_trigger
AFTER UPDATE ON spy_agency.fake_id
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, old_data, new_data)
VALUES (
"UPDATE",
CURRENT_TIMESTAMP(),
user(),
concat(" fake_name: ", OLD.fake_name," fake_story: ", OLD.fake_story, " fake_age: ", OLD.fake_age),
concat(" fake_name: ", NEW.fake_name," fake_story: ", NEW.fake_story, " fake_age: ", NEW.fake_age));


-- Trigger para borrar

CREATE TRIGGER delete_fake_id_trigger
AFTER DELETE ON spy_agency.fake_id
FOR EACH ROW
INSERT INTO auditlog (operation, timestamp_operation, user, old_data)
VALUES (
"DELETE",
CURRENT_TIMESTAMP(),
user(),
concat(" fake_name: ", OLD.fake_name," fake_story: ", OLD.fake_story, " fake_age: ", OLD.fake_age));

```

## Script de Inserts

</br>

```sql
use spy_agency;

insert into resource (resource_name,is_accessible,can_we_trust) values
	("Person called Jhon",false,true),
    ("AK-47",true,true),
    ("Russian Passport",false,true),
    ("A rubberduck",true,true),
    ("Hacked notebook",true,false),
    ("A subversive family",true,false),
    ("A car full of ammo",true,false),
    ("Orient Traitor",true,true),
    ("A politician informer",false,true),
    ("A bulletproof chest",true,false),
    ("A cage with granades",false,false),
    ("Camera Pen",true,true),
    ("A bag full of money",false,true),
    ("A bag full of cheese",false,true),
    ("Fake blood",true,true);

insert into fake_id (fake_name,fake_story,fake_age) values
	("Mike","A business man from Paris",35),
    ("John","A chef from London",45),
    ("Travis","A rapper from LA",25),
    ("Annie","Athlete in martial arts",25),
    ("Eren","A young explorer",27),
    ("Mikasa","Eren's sister",27),
    ("Giorno Giovana","A gentleman from Italy",25),
    ("Jonathan Joester","A gentleman from London",25),
    ("Dio Brando","A rich guy",25),
    ("Elvis","A singer from North America",37),
    ("Travolta","An actor from LA",35),
    ("Britney","A singer from LA",25),
    ("Pamela","An actor and model from Florida",25),
    ("Reiner","A member of a military group",30),
    ("Armin","A young explorer",25),
    ("Carlos","A middle school student",15);


insert into spy (age,skill_level,real_name,id_fakeId) values
	(30,1,"Michael",1),
	(30,1,"Juan",2),
	(30,1,"Esteban",3),
	(30,1,"Ana",4),
	(30,1,"Miguel",5),
	(25,2,"Micaela",6),
	(25,2,"Geno",7),
	(25,2,"Jonny",8),
	(25,2,"Braian",9),
	(27,3,"Aaron",10),
	(27,3,"Jonh",11),
	(27,3,"Spears",12),
	(27,3,"Anderson",13),
	(32,4,"Arlert",14),
	(32,4,"Charles",15);


insert into operational_country (country_name,relationship,sympathetic_to_the_agency,danger_level) values
	("USA","Ally",true,3),
    ("Russia","Neutral",false,2),
    ("Argentina","Enemy",true,1),
    ("China","Ally",false,3),
    ("India","Neutral",true,2),
    ("Turkey","Enemy",false,1),
    ("Singapore","Ally",true,3),
    ("Japan","Neutral",false,3),
    ("Yellow Country","Enemy",true,2),
    ("Purple Country","Ally",false,2),
    ("Petrol Country","Neutral",true,1),
    ("Terrorist Country","Enemy",false,1),
    ("Goodies","Ally",true,2),
    ("Normal Country","Neutral",false,3),
    ("Quiet Country","Neutral",true,1);

insert into target(target_name,id_operational_country,spy_assigned) values
	("Primery Minister of Saudi Arabia",1,false),
    ("Michael Nixon, republican senator",2,false),
    ("Boat full of uranium",3,false),
    ("Document Nº27 from Security Minister",4,true),
    ("Wagon full of guns",5,true),
    ("Active terrorist cell",6,true),
    ("Criminal organization from NY",7,false),
    ("Terrorist ammo factory",3,true),
    ("Russian president's trust man",4,false),
    ("Terrorist army from Europe",5,true),
    ("Drugs Cartel from Latinamerica",1,false),
    ("Corruption case in USA",2,false),
    ("Rich familiy with guns business",1,true),
    ("Petrol Jeque chief from Qatar",9,false),
    ("Farmaceutic Illegal medicines",1,true),
    ("Dron's blueprints from enemy country",1,true);

insert into mission(mission_name,id_resource,id_target,id_spy) values
	("Halcon",4,1,1),
    ("Barbaroja",3,2,2),
    ("Invierno",3,3,3),
    ("Primavera",1,4,4),
    ("Oro Negro",13,5,4),
    ("Perlas",13,6,3),
    ("Saladino",7,7,2),
    ("Vikingo",9,8,1),
    ("Reconquista",10,9,5),
    ("Fuego y Acero",7,10,5),
    ("Titere",6,11,7),
    ("Heavy Rain",11,12,8),
    ("Whiskey",15,13,9),
    ("Romeo",13,14,10),
    ("Sons of Anarchy",2,15,15);
```

## Script de Store Procedures

</br>

```sql
use spy_agency;

-- 1º Store Procedure que devuelve el numero de paises con cierto nivel de peligro
-- Utiliza la tabla operational_country
DELIMITER //
CREATE PROCEDURE sp_select_number_of_countries_with_danger_level(IN n_countries int, OUT p_salida int )
BEGIN

	select count(*)
    into p_salida
    from spy_agency.operational_country
    where danger_level = n_countries;

END//
DELIMITER ;

-- Para probar podemos hacer lo siguiente

-- SET @n_countries = 0; -- Seteo la variable en 0 para luego guardar el resultado del SP dentro
-- En este caso ingreso un nivel de peligrosidad (3 en este caso) y recibo el número de países que tienen ese nivel
-- CALL sp_select_number_of_countries_with_danger_level(3,@n_countries);
-- SELECT @n_countries;




-- 2º Store Procedure que sirve como procedimiento de pánico borrando toda la información de la base de datos en caso de que ésta haya sido vulnerada
-- recibe como parámetro de entrada un booleano para indicar si se debe proceder o no y retorna el número de registros borrados

-- Utiliza las tablas: fake_id, mission, operational_country, resource, spy y target
DELIMITER //
CREATE PROCEDURE sp_panic(in must_delete boolean, out registries_deleted int)
BEGIN

    DECLARE n_registries_fake_id int;
    DECLARE n_registries_mission int;
    DECLARE n_registries_operational_country int;
    DECLARE n_registries_resource int;
    DECLARE n_registries_spy int;
    DECLARE n_registries_target int;

    IF must_delete = true THEN

        SET SQL_SAFE_UPDATES = 0;
		select count(*) into n_registries_fake_id from spy_agency.fake_id;
		select count(*) into n_registries_mission from spy_agency.mission;
		select count(*) into n_registries_operational_country from spy_agency.operational_country;
		select count(*) into n_registries_resource from spy_agency.resource;
		select count(*) into n_registries_spy from spy_agency.spy;
		select count(*) into n_registries_target from spy_agency.target;

		SET registries_deleted = n_registries_fake_id + n_registries_mission + n_registries_operational_country + n_registries_resource + n_registries_spy + n_registries_target;
		delete from spy_agency.fake_id;
		delete from spy_agency.mission;
		delete from spy_agency.operational_country;
		delete from spy_agency.resource;
		delete from spy_agency.spy;
		delete from spy_agency.target;
	ELSE
		SET registries_deleted = 0;
	END IF;
END//
DELIMITER ;

-- Para probar podemos hacer lo siguiente

-- SET @registries_deleted = 0;
-- CALL sp_panic(true, @registries_deleted);
-- SELECT @registries_deleted;

-- Chequeamos que los registros se hayan borrado
-- SELECT * FROM spy_agency.fake_id;
-- SELECT * FROM spy_agency.mission;
-- SELECT * FROM spy_agency.operational_country;
-- SELECT * FROM spy_agency.resource;
-- SELECT * FROM spy_agency.spy;
-- SELECT * FROM spy_agency.target;
```

## Comentarios Finales

Aquí termina el informe propuesto. Gracias por leer y por la atención dada en la corrección del proyecto.
