use spy_agency;

-- Primera transacción

-- desactivamos el autocommit y los checks de fks para poder hacer la transacción

SELECT @@autocommit;
SELECT @@foreign_key_checks;

SET autocommit = 0;
SET foreign_key_checks = 0;


-- Primera transacción

DELIMITER $$
START TRANSACTION;
BEGIN
SET @size = (SELECT count(*) FROM spy_agency.resource);
SELECT @size;

IF @size = 0 THEN
	INSERT INTO spy_agency.resource(resource_name,is_accessible,can_we_trust) values("Something cool...", true, true);
ELSE
	DELETE FROM spy_agency.resource WHERE id_resource = 1;
	-- Si se usó el script de inserts del entregable el recurso con el id = 1 al borrarlo puede ingresarse nuevamente con la sentencia de insert a continuación
	-- INSERT INTO spy_agency.resource(resource_name,is_accessible,can_we_trust) values("Person called Jhon", false, true);
END IF;

-- ROLLBACK
COMMIT;
END$$
DELIMITER ;
-- Error Code: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SET @size = SELECT count(*) FROM spy_agency.resource INTO @size;  IF size = 0 TH' at line 2

-- SELECT * FROM spy_agency.resource;


-- Segunda transacción

START TRANSACTION;


INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(26,3,"Agus",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(27,2,"Tomas",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(28,1,"Abel",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(29,3,"Pepe",1);

SAVEPOINT SP1;

INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(30,1,"Ramiro",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(31,2,"Floripondio",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(32,3,"Walter",1);
INSERT INTO spy_agency.spy(age,skill_level,real_name,id_fakeId) values(33,1,"White",1);

SAVEPOINT SP2;

-- RELEASE SAVEPOINT SP1;

COMMIT;

-- SELECT * FROM spy_agency.spy;