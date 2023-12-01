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
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `pno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(30) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pinfo` varchar(20) NOT NULL,
  `psex` varchar(20) NOT NULL,
  `pnumber` varchar(20) NOT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'member1','김아빠','19701010','male','1111222'),(2,'member1','김엄마','19701010','female','11111'),(3,'member2','엄정현','19930211','male','333-333'),(4,'member2','엄미숙','19701111','male','444-444'),(5,'member3','양이원','19701111','male','555-555'),(6,'member3','양방원','19701111','male','666-666'),(7,'member4','조광래','19701111','male','777-777'),(8,'member4','조용필','19701111','male','888-888'),(9,'member5','김부자','19701111','male','999-999'),(10,'member5','김이빨','19701111','male','100-100'),(11,'member6','김이연','19701111','male','110-110'),(12,'member6','김미연','19701111','male','112-112'),(13,'member7','채구원','19701111','male','113-113'),(14,'member7','채경원','19701111','male','114-114'),(15,'member8','이봉원','19701111','female','115-115'),(16,'member8','이광래','19701111','female','116-116'),(37,'member1','김할아버지','19000101','male','0106666666');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-17 15:30:30
