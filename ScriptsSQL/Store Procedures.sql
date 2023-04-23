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