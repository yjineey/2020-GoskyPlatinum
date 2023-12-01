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
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `tno` int NOT NULL AUTO_INCREMENT,
  `mid` varchar(40) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `tdate` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'teacher','\\imgUpload\\2020\\09\\16\\s\\s_2e9b247c-2b36-430e-b43e-7ef8e233eba4_GO SKY.png',0,'1','수영'),(2,'teacher2','\\imgUpload\\2020\\09\\16\\s\\s_968ed10f-b42a-4a2d-94f0-cadd4ed107cf_wkdqhdbs.jpg',0,'2','골프ㄱㄷㅎㄷㄱㅎ'),(3,'teacher3',NULL,0,'3','미술'),(4,'teacher4',NULL,0,'4','음악'),(5,'teacher5',NULL,0,'5','댄스'),(6,'teacher',NULL,1,NULL,'수영을 잘 가르치겠습니다'),(7,'teacher2','',1,'','골프꿈나무를 찾습니다 ㅇ'),(8,'teacher3','',1,'','ㅎㅇ'),(9,'teacher4',NULL,1,NULL,'베토벤을 찾습니다ㅏ. 연락주세요~'),(10,'teacher5',NULL,1,NULL,'댄스신동을 찾습니다. 누구라도 할수있어요'),(46,'root','\\imgUpload\\2020\\09\\16\\s\\s_c90db8e4-d8ae-4c37-bab2-29d6fc1312ac_GO SKY.png',0,'','');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
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
