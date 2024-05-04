-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: webDB
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-2

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
-- Table structure for table `antonym`
--

DROP TABLE IF EXISTS `antonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antonym` (
  `wid` int(11) DEFAULT NULL,
  `spid` varchar(10) DEFAULT NULL,
  `antonym` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antonym`
--

LOCK TABLES `antonym` WRITE;
/*!40000 ALTER TABLE `antonym` DISABLE KEYS */;
INSERT INTO `antonym` VALUES
(4,'s2','unbook'),
(7,'s3','bad'),
(9,'s3','ugly'),
(10,'s2','come');
/*!40000 ALTER TABLE `antonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meaning`
--

DROP TABLE IF EXISTS `meaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meaning` (
  `spid` varchar(10) DEFAULT NULL,
  `wid` varchar(10) DEFAULT NULL,
  `meaning` varchar(15000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meaning`
--

LOCK TABLES `meaning` WRITE;
/*!40000 ALTER TABLE `meaning` DISABLE KEYS */;
INSERT INTO `meaning` VALUES
('s1','1','a wild cat'),
('s1','2','an electronic device'),
('s2','2','making call to someone from cellphone'),
('s1','3','a herbivore animal'),
('s1','4','manuscript or written collection of papers'),
('s2','4','to reserve'),
('s1','5','a red fruit'),
('s1','6','a four-wheeler vehicle'),
('s1','7','some commodity'),
('s3','7','nice'),
('s1','8','opinion'),
('s2','8','to exclaim something'),
('s3','9','attractive, highly likely'),
('s1','10','attempt or trial'),
('s2','10','to move from one place to other');
/*!40000 ALTER TABLE `meaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos`
--

DROP TABLE IF EXISTS `pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos` (
  `spid` varchar(10) DEFAULT NULL,
  `pos` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos`
--

LOCK TABLES `pos` WRITE;
/*!40000 ALTER TABLE `pos` DISABLE KEYS */;
INSERT INTO `pos` VALUES
('s1','Noun'),
('s2','Verb'),
('s3','Adjective');
/*!40000 ALTER TABLE `pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pspeech`
--

DROP TABLE IF EXISTS `pspeech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pspeech` (
  `spid` varchar(10) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pspeech`
--

LOCK TABLES `pspeech` WRITE;
/*!40000 ALTER TABLE `pspeech` DISABLE KEYS */;
INSERT INTO `pspeech` VALUES
('s1',1),
('s1',2),
('s2',2),
('s1',3),
('s1',4),
('s2',4),
('s1',5),
('s1',6),
('s1',7),
('s3',7),
('s1',8),
('s2',8),
('s3',9),
('s1',10),
('s2',10);
/*!40000 ALTER TABLE `pspeech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_name`
--

DROP TABLE IF EXISTS `sc_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_name` (
  `wid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_name`
--

LOCK TABLES `sc_name` WRITE;
/*!40000 ALTER TABLE `sc_name` DISABLE KEYS */;
INSERT INTO `sc_name` VALUES
(1,'Panthera tigris'),
(3,'Equus caballus'),
(5,'Malus pumila');
/*!40000 ALTER TABLE `sc_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word`
--

DROP TABLE IF EXISTS `word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `word` (
  `wid` int(11) DEFAULT NULL,
  `word` varchar(100) DEFAULT NULL,
  `syll` varchar(100) DEFAULT NULL,
  `Sanskrit` varchar(100) DEFAULT NULL,
  `Hindi` varchar(100) DEFAULT NULL,
  `French` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word`
--

LOCK TABLES `word` WRITE;
/*!40000 ALTER TABLE `word` DISABLE KEYS */;
INSERT INTO `word` VALUES
(1,'Tiger','taɪɡə(r)','व्याघ्रः','बाघ','Tigre'),
(2,'Phone','fəʊn','फोनः','फ़ोन','Téléphone'),
(3,'Horse','hɔːrs','अश्वः','घोड़ा','Cheval'),
(4,'Book','bʊk','पुस्तकम्','किताब','Livre'),
(5,'Apple','ˈæp.əl','फलम्','सेब','Pomme'),
(6,'Car','kɑːr','रथः','कार','Voiture'),
(7,'Good','ɡʊd','शुभम्','अच्छा','Bien'),
(8,'Say','seɪ','वद','बोलना','Dire'),
(9,'Pretty','ˈprɪt.i','सुन्दरम्','सुंदर','Joli'),
(10,'Go','ɡəʊ','गच्छ','जाओ','Aller');
/*!40000 ALTER TABLE `word` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-03 16:40:16
