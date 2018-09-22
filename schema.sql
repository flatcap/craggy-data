-- MySQL dump 10.16  Distrib 10.2.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: craggy
-- ------------------------------------------------------
-- Server version	10.2.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `craggy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `craggy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `craggy`;

--
-- Table structure for table `climb`
--

DROP TABLE IF EXISTS `climb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `climb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `climber_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `success_id` int(11) NOT NULL,
  `date_climbed` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route_id` (`route_id`),
  KEY `climber_id` (`climber_id`),
  KEY `success_id` (`success_id`),
  CONSTRAINT `climb_ibfk_1` FOREIGN KEY (`climber_id`) REFERENCES `climber` (`id`) ON DELETE CASCADE,
  CONSTRAINT `climb_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE CASCADE,
  CONSTRAINT `climb_ibfk_4` FOREIGN KEY (`success_id`) REFERENCES `success` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `climb_type`
--

DROP TABLE IF EXISTS `climb_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `climb_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `climb_type` tinytext NOT NULL,
  `abbr` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `climber`
--

DROP TABLE IF EXISTS `climber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `climber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `surname` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colour`
--

DROP TABLE IF EXISTS `colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colour` tinytext NOT NULL,
  `abbr` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `name` tinytext NOT NULL,
  `value` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `difficulty`
--

DROP TABLE IF EXISTS `difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL,
  `description` tinytext NOT NULL,
  `abbr` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL,
  `grade` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `climb_type_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `height` float DEFAULT NULL,
  `tags` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `climb_type_id` (`climb_type_id`),
  CONSTRAINT `panel_ibfk_1` FOREIGN KEY (`climb_type_id`) REFERENCES `climb_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `climber_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `difficulty_id` int(11) DEFAULT NULL,
  `nice` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `climber_id` (`climber_id`),
  KEY `route_id` (`route_id`),
  KEY `difficulty_id` (`difficulty_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`climber_id`) REFERENCES `climber` (`id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`),
  CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL,
  `colour_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `setter_id` int(11) DEFAULT NULL,
  `date_set` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_id` (`grade_id`),
  KEY `panel_id` (`panel_id`),
  KEY `setter_id` (`setter_id`),
  KEY `colour_id` (`colour_id`),
  KEY `date_end` (`date_end`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`id`) ON DELETE CASCADE,
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON DELETE CASCADE,
  CONSTRAINT `route_ibfk_3` FOREIGN KEY (`panel_id`) REFERENCES `panel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `route_ibfk_4` FOREIGN KEY (`setter_id`) REFERENCES `setter` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setter`
--

DROP TABLE IF EXISTS `setter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initials` tinytext NOT NULL,
  `first_name` text DEFAULT NULL,
  `surname` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `success`
--

DROP TABLE IF EXISTS `success`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `success` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL,
  `outcome` tinytext NOT NULL,
  `description` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_route`
--

DROP TABLE IF EXISTS `v_route`;
/*!50001 DROP VIEW IF EXISTS `v_route`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_route` (
  `id` tinyint NOT NULL,
  `panel` tinyint NOT NULL,
  `panel_seq` tinyint NOT NULL,
  `colour` tinyint NOT NULL,
  `grade` tinyint NOT NULL,
  `grade_seq` tinyint NOT NULL,
  `climb_type` tinyint NOT NULL,
  `setter` tinyint NOT NULL,
  `date_set` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `height` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `craggy`
--

USE `craggy`;

--
-- Final view structure for view `v_route`
--

/*!50001 DROP TABLE IF EXISTS `v_route`*/;
/*!50001 DROP VIEW IF EXISTS `v_route`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_route` AS select `route`.`id` AS `id`,`panel`.`name` AS `panel`,`panel`.`sequence` AS `panel_seq`,`colour`.`colour` AS `colour`,`grade`.`grade` AS `grade`,`grade`.`sequence` AS `grade_seq`,`climb_type`.`climb_type` AS `climb_type`,trim(concat_ws(' ',`setter`.`first_name`,`setter`.`surname`)) AS `setter`,`route`.`date_set` AS `date_set`,`route`.`notes` AS `notes`,`panel`.`height` AS `height` from (((((`route` left join `colour` on(`route`.`colour_id` = `colour`.`id`)) left join `panel` on(`route`.`panel_id` = `panel`.`id`)) left join `grade` on(`route`.`grade_id` = `grade`.`id`)) left join `setter` on(`route`.`setter_id` = `setter`.`id`)) left join `climb_type` on(`panel`.`climb_type_id` = `climb_type`.`id`)) where `route`.`date_end` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
