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