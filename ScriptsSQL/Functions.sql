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