-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: iverborg_leaderboard
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changelog` (
  `time_gained` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_number` varchar(50) NOT NULL DEFAULT '',
  `score` int NOT NULL,
  `map_id` varchar(6) NOT NULL DEFAULT '',
  `wr_gain` int NOT NULL DEFAULT '0',
  `has_demo` int DEFAULT '0',
  `banned` int NOT NULL DEFAULT '0',
  `youtube_id` varchar(30) DEFAULT NULL,
  `previous_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `post_rank` int DEFAULT NULL,
  `pre_rank` int DEFAULT NULL,
  `submission` int NOT NULL DEFAULT '0',
  `note` varchar(100) DEFAULT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `profile_number` (`profile_number`),
  KEY `map_id` (`map_id`),
  KEY `previous_id` (`previous_id`)
) ENGINE=InnoDB AUTO_INCREMENT=254449 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chapter_name` varchar(50) DEFAULT NULL,
  `is_multiplayer` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evidence_requirements`
--

DROP TABLE IF EXISTS `evidence_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidence_requirements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int NOT NULL,
  `demo` tinyint(1) NOT NULL,
  `video` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime NOT NULL,
  `closed_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exceptions`
--

DROP TABLE IF EXISTS `exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exceptions` (
  `map_id` varchar(5) NOT NULL,
  `legit_score` int NOT NULL,
  `curl` int NOT NULL DEFAULT '18',
  PRIMARY KEY (`map_id`,`legit_score`,`curl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leastportals`
--

DROP TABLE IF EXISTS `leastportals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leastportals` (
  `steam_id` varchar(6) NOT NULL,
  `portals` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leastportals_exceptions`
--

DROP TABLE IF EXISTS `leastportals_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leastportals_exceptions` (
  `map_id` varchar(6) NOT NULL,
  `profile_number` varchar(50) NOT NULL,
  PRIMARY KEY (`map_id`,`profile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps` (
  `id` int NOT NULL,
  `steam_id` varchar(6) NOT NULL DEFAULT '',
  `lp_id` varchar(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `level_name` varchar(128) DEFAULT NULL,
  `type` set('portals','time') NOT NULL DEFAULT 'time',
  `chapter_id` int unsigned DEFAULT NULL,
  `is_coop` int NOT NULL DEFAULT '0',
  `is_public` int NOT NULL DEFAULT '1',
  UNIQUE KEY `steam_id` (`steam_id`),
  KEY `chapter_id` (`chapter_id`),
  KEY `is_public` (`is_public`),
  CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `profile_number` varchar(50) NOT NULL DEFAULT '',
  `map_id` varchar(6) NOT NULL,
  `changelog_id` int NOT NULL,
  PRIMARY KEY (`changelog_id`),
  UNIQUE KEY `tuple` (`profile_number`,`map_id`),
  KEY `map_id` (`map_id`),
  KEY `profile_number` (`profile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `singlesegment`
--

DROP TABLE IF EXISTS `singlesegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singlesegment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `updated` varchar(250) NOT NULL COMMENT 'Last updated',
  `datatable` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersnew`
--

DROP TABLE IF EXISTS `usersnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersnew` (
  `profile_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `boardname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `steamname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `banned` int NOT NULL DEFAULT '0',
  `registered` int NOT NULL DEFAULT '0',
  `avatar` varchar(200) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `twitch` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `youtube` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `admin` int NOT NULL DEFAULT '0',
  `donation_amount` varchar(11) DEFAULT NULL,
  `auth_hash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`profile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-17  9:49:00
