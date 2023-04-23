/*

-- Template para crear un trigger

CREATE TRIGGER triggerName
(AFTER BEFORE) (INSERT UPDATE DELETE) ON tableToTrigger
FOR EACH ROW
INSERT INTO auditlog (field1, field2 ...)
VALUES (NEW OLD.field1, NEW OLD.field2 ...)

*/

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


-- Probamos agregando un registro a resource
-- INSERT INTO resource(resource_name, is_accessible, can_we_trust) values("A spy pen",true,true);
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;

-- Probamos actualizando un registro en resource
-- UPDATE resource SET resource_name = "A spy pencil" WHERE id_resource = 1; // tomando como ejemplo el primer registro
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;

-- Probamos borrando registros de resource
-- DELETE FROM resource WHERE id_resource > 10;
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;



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


-- Probamos agregando un registro a fake_id
-- INSERT INTO fake_id(fake_name,fake_story,fake_age) values("Mr X","I reveal sensible info about people !",36);
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;

-- Probamos actualizando un registro en fake_id
-- UPDATE fake_id SET fake_name = "MAX POWER" WHERE id_fakeId = 20; // en mi caso tengo registros con el id 20 pero esto puede variar dependiendo de como uno haya generado la tabla y de cuantos inserts hizo
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;

-- Probamos borrando registros de fake_id
-- DELETE FROM fake_id WHERE id_fakeId = 20;
-- Nos fijamos en la tabla de auditoría
-- SELECT * FROM auditlog;