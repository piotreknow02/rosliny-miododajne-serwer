-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: RoslinyMiododajne
-- ------------------------------------------------------
-- Server version       10.6.5-MariaDB-1:10.6.5+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorie` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nazwa` (`Nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (1,'Drzewo'),(3,'Krzew'),(4,'Krzewinki'),(2,'Kwiat');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraje`
--

DROP TABLE IF EXISTS `kraje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraje` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Kraj` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Kraj` (`Kraj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kraje`
--

LOCK TABLES `kraje` WRITE;
/*!40000 ALTER TABLE `kraje` DISABLE KEYS */;
INSERT INTO `kraje` VALUES (1,'Polska');
/*!40000 ALTER TABLE `kraje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kraje_roslin`
--

DROP TABLE IF EXISTS `kraje_roslin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kraje_roslin` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Id_kraju` int(10) unsigned NOT NULL,
  `Id_rosliny` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_rosliny` (`Id_rosliny`),
  KEY `Id_kraju` (`Id_kraju`),
  CONSTRAINT `kraje_roslin_ibfk_2` FOREIGN KEY (`Id_kraju`) REFERENCES `kraje` (`Id`),
  CONSTRAINT `kraje_roslin_ibfk_3` FOREIGN KEY (`Id_rosliny`) REFERENCES `rosliny` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--