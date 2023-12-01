-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: club99
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `act`
--

DROP TABLE IF EXISTS `act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act` (
  `ssno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `room` int NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ssno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act`
--

LOCK TABLES `act` WRITE;
/*!40000 ALTER TABLE `act` DISABLE KEYS */;
INSERT INTO `act` VALUES (1,'수영',1,'https://cdn.pixabay.com/photo/2013/02/09/04/23/swimmers-79592_960_720.jpg','',1),(2,'골프',2,'https://cdn.pixabay.com/photo/2015/05/28/10/12/golf-787826_960_720.jpg','',1),(3,'미술',3,'https://cdn.pixabay.com/photo/2016/02/19/10/59/art-1209519_960_720.jpg','',1),(4,'음악',4,' https://cdn.pixabay.com/photo/2016/09/08/21/09/piano-1655558_960_720.jpg',' ',1),(5,'댄스',5,'https://cdn.pixabay.com/photo/2016/05/06/17/06/ballet-1376250_960_720.jpg',' 두유 노 마이클잭슨?',1);
/*!40000 ALTER TABLE `act` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-17 15:30:31
