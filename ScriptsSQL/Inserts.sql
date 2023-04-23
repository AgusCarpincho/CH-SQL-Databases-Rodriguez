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