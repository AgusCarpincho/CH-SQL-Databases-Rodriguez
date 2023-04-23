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