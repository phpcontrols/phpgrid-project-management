# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.1.9-MariaDB-log)
# Database: phpgrid_simple_pm
# Generation Time: 2017-03-19 10:03:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Industry` varchar(255) DEFAULT NULL,
  `Revenue` varchar(255) DEFAULT NULL,
  `Description` varchar(512) DEFAULT '',
  `Phone` varchar(255) DEFAULT NULL,
  `Street1` varchar(255) DEFAULT NULL,
  `Street2` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `Name`, `Website`, `Industry`, `Revenue`, `Description`, `Phone`, `Street1`, `Street2`, `City`, `State`, `Zip`, `Country`, `Notes`)
VALUES
	(1,'Macroserve','http://www.macroserve.com','Technology','< $500,000','','310-602-4009','3976 Sumner Street','','Long Beach','CA',90802,'',''),
	(2,'Patterson-Fletcher','http://www.pfllc.com','Education','< $500,000','','402-269-1382','4435 Crummit Lane','','Syracuse','NY',68446,'',''),
	(3,'Corpbay','http://corpbay.com','Heathcare','< $500,000','A leader in HealthCare Management.','619-205-6584','4923 Holden Street','','San Diego','CA',92121,'','Strong potential for long-term partnership.'),
	(4,'Infosoft','http://www.infosoft.com','Technology','< $500,000','','520-632-3440','1 Infosoft Way','','Redmond','WA',34580,'',''),
	(5,'Mango','http://mango.com','Education','< $500,000','Mango is the premier educational software company in the world.','7173307734','4615 Center Blvd','','LIC','New York',11109,'','');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Middle` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `ClientID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client` (`ClientID`),
  CONSTRAINT `fk_client` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;

INSERT INTO `contacts` (`id`, `Title`, `FirstName`, `Middle`, `LastName`, `Email`, `Gender`, `Occupation`, `Phone`, `Birthday`, `Notes`, `ClientID`)
VALUES
	(1,'','John','','Corpbay','john@corpbay.com','M','Founder','443.744.5402','1965-10-09','Great guy!',3);

/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table costs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `costs`;

CREATE TABLE `costs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `PricePer` float DEFAULT NULL,
  `ProjectID` int(11) unsigned NOT NULL,
  `MilestoneID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cost_proj` (`ProjectID`),
  KEY `fk_cost_milestone` (`MilestoneID`),
  CONSTRAINT `fk_cost_milestone` FOREIGN KEY (`MilestoneID`) REFERENCES `milestones` (`id`),
  CONSTRAINT `fk_cost_proj` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `costs` WRITE;
/*!40000 ALTER TABLE `costs` DISABLE KEYS */;

INSERT INTO `costs` (`id`, `Name`, `Description`, `Quantity`, `PricePer`, `ProjectID`, `MilestoneID`)
VALUES
	(1,'Stock Photography','Icon Sets used in design and programming.',5,19,1,8);

/*!40000 ALTER TABLE `costs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hours`;

CREATE TABLE `hours` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Time` float DEFAULT NULL,
  `WorkCompleted` varchar(255) DEFAULT NULL,
  `TaskID` int(11) unsigned NOT NULL,
  `ProjectID` int(11) unsigned NOT NULL,
  `EmployeeID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hour_task` (`TaskID`),
  KEY `fk_hour_proj` (`ProjectID`),
  KEY `fk_hour_emp` (`EmployeeID`),
  CONSTRAINT `fk_hour_emp` FOREIGN KEY (`EmployeeID`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_hour_proj` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`id`),
  CONSTRAINT `fk_hour_task` FOREIGN KEY (`TaskID`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hours` WRITE;
/*!40000 ALTER TABLE `hours` DISABLE KEYS */;

INSERT INTO `hours` (`id`, `Date`, `Time`, `WorkCompleted`, `TaskID`, `ProjectID`, `EmployeeID`)
VALUES
	(1,'2013-10-10',1.5,'First Draft',5,1,3),
	(2,'2013-10-11',3.25,'Got started with basic definitions',1,1,2),
	(3,'2013-10-09',0.5,'Further definition work.',1,1,3),
	(4,'2013-10-02',3,'Started with our default framework; modified CSS; add HTML for initial pages',5,1,1),
	(5,'2017-02-07',1,'',7,3,1),
	(6,'2017-02-11',0.05,'',6,4,2),
	(7,'2017-02-28',1,'',4,3,2),
	(8,'2017-02-27',1,'tested out entry ',10,3,2),
	(9,'2017-03-03',0,'asdfas',10,2,1),
	(10,'2017-03-08',1,'',10,3,2),
	(11,'2017-03-08',2.25,'Testing',10,3,2);

/*!40000 ALTER TABLE `hours` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table milestones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `milestones`;

CREATE TABLE `milestones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Deliverables` varchar(255) DEFAULT NULL,
  `StatusID` int(11) unsigned NOT NULL,
  `ProjectID` int(11) unsigned NOT NULL,
  `TotalHours` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_status` (`StatusID`),
  KEY `fk_ms_project` (`ProjectID`),
  CONSTRAINT `fk_ms_project` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ms_status` FOREIGN KEY (`StatusID`) REFERENCES `ms_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;

INSERT INTO `milestones` (`id`, `Name`, `DueDate`, `Deliverables`, `StatusID`, `ProjectID`, `TotalHours`)
VALUES
	(1,'Design Complete','2013-10-17','Complete Design Mocks',3,2,NULL),
	(2,'Design Converted to Code','2013-10-23','Design applied to working code base.<br />Core optimization.',1,2,4.5),
	(3,'Framework Coded','2013-10-25','Fully functioning code base',2,2,NULL),
	(4,'Project Outline','2013-11-25','Schedule and milestones',1,1,1),
	(5,'Shot 01','2013-12-10','Full database schema definition and build.',2,1,3.75),
	(6,'Programming','2013-12-18','Code Repository Sounds Good<br />',1,1,NULL),
	(7,'Testing','2014-01-04','nothing<br />',2,1,NULL),
	(8,'New bezel design','2014-01-31','CSS and JavaScript customizations --- hello',2,1,NULL),
	(9,'Create Copy','2017-01-11','Create Copy for Ad',3,3,1.05),
	(10,'Send Into Magazine','2017-01-22','',3,3,NULL),
	(11,'Rollout','2017-03-12','',3,3,NULL);

/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ms_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ms_status`;

CREATE TABLE `ms_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ms_status` WRITE;
/*!40000 ALTER TABLE `ms_status` DISABLE KEYS */;

INSERT INTO `ms_status` (`id`, `Status`)
VALUES
	(1,'Active'),
	(2,'Completed'),
	(3,'Pending');

/*!40000 ALTER TABLE `ms_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pec_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pec_users`;

CREATE TABLE `pec_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_key` varchar(32) DEFAULT NULL,
  `activated` tinyint(3) unsigned DEFAULT '1',
  `admin_id` int(10) unsigned DEFAULT NULL,
  `role` enum('super','admin','user') DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `active_calendar_id` varchar(512) NOT NULL DEFAULT '0',
  `company` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `theme` varchar(20) DEFAULT NULL,
  `kbd_shortcuts` tinyint(3) unsigned DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `i_username` (`username`),
  KEY `fk_admin_id` (`admin_id`),
  KEY `access_key` (`access_key`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `pec_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pec_users` WRITE;
/*!40000 ALTER TABLE `pec_users` DISABLE KEYS */;

INSERT INTO `pec_users` (`id`, `access_key`, `activated`, `admin_id`, `role`, `first_name`, `last_name`, `active_calendar_id`, `company`, `username`, `password`, `email`, `timezone`, `language`, `theme`, `kbd_shortcuts`, `created_on`, `updated_on`)
VALUES
	(1,'1',1,1,'super','Admin','Admin','1,16','Higpitch','admin','e10adc3949ba59abbe56e057f20f883e','admin@gmail.com','+6','English','default',1,'2013-12-18 14:27:41','2013-12-18 14:27:45');

/*!40000 ALTER TABLE `pec_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table proj_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proj_status`;

CREATE TABLE `proj_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `proj_status` WRITE;
/*!40000 ALTER TABLE `proj_status` DISABLE KEYS */;

INSERT INTO `proj_status` (`id`, `Status`)
VALUES
	(1,'Sales'),
	(2,'R & D'),
	(3,'In Production'),
	(4,'Pending Approval'),
	(5,'Complete');

/*!40000 ALTER TABLE `proj_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(255) DEFAULT NULL,
  `ProjectManagerID` int(11) unsigned NOT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` float DEFAULT NULL,
  `Budget` float DEFAULT NULL,
  `Active` int(11) unsigned NOT NULL,
  `StatusID` int(11) unsigned NOT NULL,
  `ClientID` int(11) unsigned DEFAULT NULL,
  `TotalHours` float DEFAULT NULL,
  `LaborCosts` float DEFAULT NULL,
  `MaterialCosts` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projectmanager` (`ProjectManagerID`),
  KEY `fk_proj_status` (`StatusID`),
  KEY `fk_proj_client` (`ClientID`),
  CONSTRAINT `fk_proj_client` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_proj_status` FOREIGN KEY (`StatusID`) REFERENCES `proj_status` (`id`),
  CONSTRAINT `fk_projectmanager` FOREIGN KEY (`ProjectManagerID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `ProjectName`, `ProjectManagerID`, `StartDate`, `HourlyRate`, `Budget`, `Active`, `StatusID`, `ClientID`, `TotalHours`, `LaborCosts`, `MaterialCosts`)
VALUES
	(1,'Application Build',1,'2015-10-21',100,6000,0,3,3,8.25,825,95),
	(2,'New Intranet Website',1,'2015-10-26',130,2000,1,3,1,0,0,0),
	(3,'Ad Campaign',1,'2015-12-04',125,1900,1,4,2,6.25,781.25,0),
	(4,'test',1,'0000-00-00',100,15000,1,1,1,0.05,5,0),
	(5,'Blog Writing',1,'0000-00-00',50,800,1,1,3,0,0,0),
	(6,'Tester',1,'0000-00-00',12.75,NULL,1,1,1,0,0,0);

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_status`;

CREATE TABLE `task_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;

INSERT INTO `task_status` (`id`, `Status`)
VALUES
	(1,'Pending Start'),
	(2,'Active'),
	(3,'Pending Feedback'),
	(4,'Completed');

/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TaskName` varchar(255) DEFAULT NULL,
  `Instructions` varchar(255) DEFAULT NULL,
  `StatusID` int(11) unsigned NOT NULL,
  `TotalHours` float DEFAULT NULL,
  `MilestoneID` int(11) unsigned DEFAULT NULL,
  `ProjectID` int(11) unsigned NOT NULL,
  `EmployeeID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status` (`StatusID`),
  KEY `fk_task_milestone` (`MilestoneID`),
  KEY `fk_task_project` (`ProjectID`),
  KEY `fk_task_emp` (`EmployeeID`),
  CONSTRAINT `fk_status` FOREIGN KEY (`StatusID`) REFERENCES `task_status` (`id`),
  CONSTRAINT `fk_task_emp` FOREIGN KEY (`EmployeeID`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_task_milestone` FOREIGN KEY (`MilestoneID`) REFERENCES `milestones` (`id`),
  CONSTRAINT `fk_task_project` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id`, `TaskName`, `Instructions`, `StatusID`, `TotalHours`, `MilestoneID`, `ProjectID`, `EmployeeID`)
VALUES
	(1,'Define Database','Set all tables and fields.  Reference data schema from client.',4,3.75,5,1,3),
	(2,'Wireframe sketches','Sketch out initial wireframe designs',1,0,8,1,2),
	(3,'Program Framework','Add all the function stubs with comments.',1,0,6,1,2),
	(4,'Prepare Outline','Prepare full outline document for client deliverable',4,1,4,1,1),
	(5,'HTML Coding','This is description',4,4.5,2,1,2),
	(6,'Open Up Word','',1,0.05,9,3,NULL),
	(7,'Write Stuff','',1,1,9,3,NULL),
	(8,'Configure Software','',1,0,10,3,2),
	(9,'Migrate Content','',1,0,11,3,2),
	(10,'test task','this is a test',2,4.25,NULL,3,2),
	(11,'Blah','asdfsadf',1,0,NULL,2,3);

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `Email`, `FirstName`, `LastName`, `Role`)
VALUES
	(1,'tom.cage@example.com','Tom','Cage','Manager'),
	(2,'johnny.black@example.com','Johnny','Black','Employee'),
	(3,'joe.blow@example.com','Joe','Blow','Employee'),
	(4,'luke.admin@example.com','Luke','Sky','Admin');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
