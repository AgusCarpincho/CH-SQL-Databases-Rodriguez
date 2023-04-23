-- Lista de tablas

/*

-auditlog
	Esta tabla cuya finalidad es la de auditar almacena la información vieja y nueva producto de los triggers que se ejecutan

-fake_id
	Define una identidad falsa con datos básicos. La misma puede ser usada por cualquier espía

-mission
	Define el nombre de la misión, el recurso para la misión, el objetivo y el espía asignado
	
-operational_country
	Define el país donde se opera, la relación que tiene el pais con la agencia , el peligro en la región y si el gobierno simpatiza con la agencia

-resource
	Define un recurso que puede ser solicitado en la misión, el recurso puede ser una persona o un objeto

-spy
	Define un espía, datos básicos y su identidad secreta

-target
	 Define diversos objetivos disponibles por la agencia y el país donde opera. Los objetivos pueden ser personas u objetos

*/

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spy_agency
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Person called Jhon is_accessible: 0 can_we_trust: 1'),(2,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: AK-47 is_accessible: 1 can_we_trust: 1'),(3,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Russian Passport is_accessible: 0 can_we_trust: 1'),(4,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A rubberduck is_accessible: 1 can_we_trust: 1'),(5,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Hacked notebook is_accessible: 1 can_we_trust: 0'),(6,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A subversive family is_accessible: 1 can_we_trust: 0'),(7,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A car full of ammo is_accessible: 1 can_we_trust: 0'),(8,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Orient Traitor is_accessible: 1 can_we_trust: 1'),(9,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A politician informer is_accessible: 0 can_we_trust: 1'),(10,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A bulletproof chest is_accessible: 1 can_we_trust: 0'),(11,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A cage with granades is_accessible: 0 can_we_trust: 0'),(12,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Camera Pen is_accessible: 1 can_we_trust: 1'),(13,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A bag full of money is_accessible: 0 can_we_trust: 1'),(14,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: A bag full of cheese is_accessible: 0 can_we_trust: 1'),(15,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' resource_name: Fake blood is_accessible: 1 can_we_trust: 1'),(16,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Mike fake_story: A business man from Paris fake_age: 35'),(17,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: John fake_story: A chef from London fake_age: 45'),(18,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Travis fake_story: A rapper from LA fake_age: 25'),(19,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Annie fake_story: Athlete in martial arts fake_age: 25'),(20,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Eren fake_story: A young explorer fake_age: 27'),(21,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Mikasa fake_story: Eren\'s sister fake_age: 27'),(22,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Giorno Giovana fake_story: A gentleman from Italy fake_age: 25'),(23,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Jonathan Joester fake_story: A gentleman from London fake_age: 25'),(24,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Dio Brando fake_story: A rich guy fake_age: 25'),(25,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Elvis fake_story: A singer from North America fake_age: 37'),(26,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Travolta fake_story: An actor from LA fake_age: 35'),(27,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Britney fake_story: A singer from LA fake_age: 25'),(28,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Pamela fake_story: An actor and model from Florida fake_age: 25'),(29,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Reiner fake_story: A member of a military group fake_age: 30'),(30,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Armin fake_story: A young explorer fake_age: 25'),(31,'INSERT','2023-03-27 16:52:22','root@localhost',NULL,' fake_name: Carlos fake_story: A middle school student fake_age: 15'),(32,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Person called Jhon is_accessible: 0 can_we_trust: 1'),(33,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: AK-47 is_accessible: 1 can_we_trust: 1'),(34,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Russian Passport is_accessible: 0 can_we_trust: 1'),(35,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A rubberduck is_accessible: 1 can_we_trust: 1'),(36,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Hacked notebook is_accessible: 1 can_we_trust: 0'),(37,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A subversive family is_accessible: 1 can_we_trust: 0'),(38,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A car full of ammo is_accessible: 1 can_we_trust: 0'),(39,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Orient Traitor is_accessible: 1 can_we_trust: 1'),(40,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A politician informer is_accessible: 0 can_we_trust: 1'),(41,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A bulletproof chest is_accessible: 1 can_we_trust: 0'),(42,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A cage with granades is_accessible: 0 can_we_trust: 0'),(43,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Camera Pen is_accessible: 1 can_we_trust: 1'),(44,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A bag full of money is_accessible: 0 can_we_trust: 1'),(45,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: A bag full of cheese is_accessible: 0 can_we_trust: 1'),(46,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' resource_name: Fake blood is_accessible: 1 can_we_trust: 1'),(47,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Mike fake_story: A business man from Paris fake_age: 35'),(48,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: John fake_story: A chef from London fake_age: 45'),(49,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Travis fake_story: A rapper from LA fake_age: 25'),(50,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Annie fake_story: Athlete in martial arts fake_age: 25'),(51,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Eren fake_story: A young explorer fake_age: 27'),(52,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Mikasa fake_story: Eren\'s sister fake_age: 27'),(53,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Giorno Giovana fake_story: A gentleman from Italy fake_age: 25'),(54,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Jonathan Joester fake_story: A gentleman from London fake_age: 25'),(55,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Dio Brando fake_story: A rich guy fake_age: 25'),(56,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Elvis fake_story: A singer from North America fake_age: 37'),(57,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Travolta fake_story: An actor from LA fake_age: 35'),(58,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Britney fake_story: A singer from LA fake_age: 25'),(59,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Pamela fake_story: An actor and model from Florida fake_age: 25'),(60,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Reiner fake_story: A member of a military group fake_age: 30'),(61,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Armin fake_story: A young explorer fake_age: 25'),(62,'INSERT','2023-03-29 16:53:41','root@localhost',NULL,' fake_name: Carlos fake_story: A middle school student fake_age: 15');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fake_id`
--

LOCK TABLES `fake_id` WRITE;
/*!40000 ALTER TABLE `fake_id` DISABLE KEYS */;
INSERT INTO `fake_id` VALUES (1,'Mike','A business man from Paris',35),(2,'John','A chef from London',45),(3,'Travis','A rapper from LA',25),(4,'Annie','Athlete in martial arts',25),(5,'Eren','A young explorer',27),(6,'Mikasa','Eren\'s sister',27),(7,'Giorno Giovana','A gentleman from Italy',25),(8,'Jonathan Joester','A gentleman from London',25),(9,'Dio Brando','A rich guy',25),(10,'Elvis','A singer from North America',37),(11,'Travolta','An actor from LA',35),(12,'Britney','A singer from LA',25),(13,'Pamela','An actor and model from Florida',25),(14,'Reiner','A member of a military group',30),(15,'Armin','A young explorer',25),(16,'Carlos','A middle school student',15),(17,'Mike','A business man from Paris',35),(18,'John','A chef from London',45),(19,'Travis','A rapper from LA',25),(20,'Annie','Athlete in martial arts',25),(21,'Eren','A young explorer',27),(22,'Mikasa','Eren\'s sister',27),(23,'Giorno Giovana','A gentleman from Italy',25),(24,'Jonathan Joester','A gentleman from London',25),(25,'Dio Brando','A rich guy',25),(26,'Elvis','A singer from North America',37),(27,'Travolta','An actor from LA',35),(28,'Britney','A singer from LA',25),(29,'Pamela','An actor and model from Florida',25),(30,'Reiner','A member of a military group',30),(31,'Armin','A young explorer',25),(32,'Carlos','A middle school student',15);
/*!40000 ALTER TABLE `fake_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (1,'Halcon',4,1,1),(2,'Barbaroja',3,2,2),(3,'Invierno',3,3,3),(4,'Primavera',1,4,4),(5,'Oro Negro',13,5,4),(6,'Perlas',13,6,3),(7,'Saladino',7,7,2),(8,'Vikingo',9,8,1),(9,'Reconquista',10,9,5),(10,'Fuego y Acero',7,10,5),(11,'Titere',6,11,7),(12,'Heavy Rain',11,12,8),(13,'Whiskey',15,13,9),(14,'Romeo',13,14,10),(15,'Sons of Anarchy',2,15,15),(16,'Halcon',4,1,1),(17,'Barbaroja',3,2,2),(18,'Invierno',3,3,3),(19,'Primavera',1,4,4),(20,'Oro Negro',13,5,4),(21,'Perlas',13,6,3),(22,'Saladino',7,7,2),(23,'Vikingo',9,8,1),(24,'Reconquista',10,9,5),(25,'Fuego y Acero',7,10,5),(26,'Titere',6,11,7),(27,'Heavy Rain',11,12,8),(28,'Whiskey',15,13,9),(29,'Romeo',13,14,10),(30,'Sons of Anarchy',2,15,15);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `operational_country`
--

LOCK TABLES `operational_country` WRITE;
/*!40000 ALTER TABLE `operational_country` DISABLE KEYS */;
INSERT INTO `operational_country` VALUES (1,'USA','Ally',1,3),(2,'Russia','Neutral',0,2),(3,'Argentina','Enemy',1,1),(4,'China','Ally',0,3),(5,'India','Neutral',1,2),(6,'Turkey','Enemy',0,1),(7,'Singapore','Ally',1,3),(8,'Japan','Neutral',0,3),(9,'Yellow Country','Enemy',1,2),(10,'Purple Country','Ally',0,2),(11,'Petrol Country','Neutral',1,1),(12,'Terrorist Country','Enemy',0,1),(13,'Goodies','Ally',1,2),(14,'Normal Country','Neutral',0,3),(15,'Quiet Country','Neutral',1,1),(16,'USA','Ally',1,3),(17,'Russia','Neutral',0,2),(18,'Argentina','Enemy',1,1),(19,'China','Ally',0,3),(20,'India','Neutral',1,2),(21,'Turkey','Enemy',0,1),(22,'Singapore','Ally',1,3),(23,'Japan','Neutral',0,3),(24,'Yellow Country','Enemy',1,2),(25,'Purple Country','Ally',0,2),(26,'Petrol Country','Neutral',1,1),(27,'Terrorist Country','Enemy',0,1),(28,'Goodies','Ally',1,2),(29,'Normal Country','Neutral',0,3),(30,'Quiet Country','Neutral',1,1);
/*!40000 ALTER TABLE `operational_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'Person called Jhon',0,1),(2,'AK-47',1,1),(3,'Russian Passport',0,1),(4,'A rubberduck',1,1),(5,'Hacked notebook',1,0),(6,'A subversive family',1,0),(7,'A car full of ammo',1,0),(8,'Orient Traitor',1,1),(9,'A politician informer',0,1),(10,'A bulletproof chest',1,0),(11,'A cage with granades',0,0),(12,'Camera Pen',1,1),(13,'A bag full of money',0,1),(14,'A bag full of cheese',0,1),(15,'Fake blood',1,1),(16,'Person called Jhon',0,1),(17,'AK-47',1,1),(18,'Russian Passport',0,1),(19,'A rubberduck',1,1),(20,'Hacked notebook',1,0),(21,'A subversive family',1,0),(22,'A car full of ammo',1,0),(23,'Orient Traitor',1,1),(24,'A politician informer',0,1),(25,'A bulletproof chest',1,0),(26,'A cage with granades',0,0),(27,'Camera Pen',1,1),(28,'A bag full of money',0,1),(29,'A bag full of cheese',0,1),(30,'Fake blood',1,1);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `spy`
--

LOCK TABLES `spy` WRITE;
/*!40000 ALTER TABLE `spy` DISABLE KEYS */;
INSERT INTO `spy` VALUES (1,30,1,'Michael',1),(2,30,1,'Juan',2),(3,30,1,'Esteban',3),(4,30,1,'Ana',4),(5,30,1,'Miguel',5),(6,25,2,'Micaela',6),(7,25,2,'Geno',7),(8,25,2,'Jonny',8),(9,25,2,'Braian',9),(10,27,3,'Aaron',10),(11,27,3,'Jonh',11),(12,27,3,'Spears',12),(13,27,3,'Anderson',13),(14,32,4,'Arlert',14),(15,32,4,'Charles',15),(16,26,3,'Agus',1),(17,27,2,'Tomas',1),(18,28,1,'Abel',1),(19,26,3,'Agus',1),(20,27,2,'Tomas',1),(21,28,1,'Abel',1),(22,26,3,'Agus',1),(23,27,2,'Tomas',1),(24,28,1,'Abel',1),(25,29,3,'Pepe',1),(26,30,1,'Ramiro',1),(27,31,2,'Floripondio',1),(28,32,3,'Walter',1),(29,33,1,'White',1),(30,30,1,'Michael',1),(31,30,1,'Juan',2),(32,30,1,'Esteban',3),(33,30,1,'Ana',4),(34,30,1,'Miguel',5),(35,25,2,'Micaela',6),(36,25,2,'Geno',7),(37,25,2,'Jonny',8),(38,25,2,'Braian',9),(39,27,3,'Aaron',10),(40,27,3,'Jonh',11),(41,27,3,'Spears',12),(42,27,3,'Anderson',13),(43,32,4,'Arlert',14),(44,32,4,'Charles',15);
/*!40000 ALTER TABLE `spy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (1,'Primery Minister of Saudi Arabia',1,0),(2,'Michael Nixon, republican senator',2,0),(3,'Boat full of uranium',3,0),(4,'Document Nº27 from Security Minister',4,1),(5,'Wagon full of guns',5,1),(6,'Active terrorist cell',6,1),(7,'Criminal organization from NY',7,0),(8,'Terrorist ammo factory',3,1),(9,'Russian president\'s trust man',4,0),(10,'Terrorist army from Europe',5,1),(11,'Drugs Cartel from Latinamerica',1,0),(12,'Corruption case in USA',2,0),(13,'Rich familiy with guns business',1,1),(14,'Petrol Jeque chief from Qatar',9,0),(15,'Farmaceutic Illegal medicines',1,1),(16,'Dron\'s blueprints from enemy country',1,1),(17,'Primery Minister of Saudi Arabia',1,0),(18,'Michael Nixon, republican senator',2,0),(19,'Boat full of uranium',3,0),(20,'Document Nº27 from Security Minister',4,1),(21,'Wagon full of guns',5,1),(22,'Active terrorist cell',6,1),(23,'Criminal organization from NY',7,0),(24,'Terrorist ammo factory',3,1),(25,'Russian president\'s trust man',4,0),(26,'Terrorist army from Europe',5,1),(27,'Drugs Cartel from Latinamerica',1,0),(28,'Corruption case in USA',2,0),(29,'Rich familiy with guns business',1,1),(30,'Petrol Jeque chief from Qatar',9,0),(31,'Farmaceutic Illegal medicines',1,1),(32,'Dron\'s blueprints from enemy country',1,1);
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 17:01:05
