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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mno` int NOT NULL AUTO_INCREMENT,
  `msort` varchar(5) NOT NULL DEFAULT 'm01',
  `mname` varchar(20) NOT NULL,
  `mid` varchar(30) NOT NULL,
  `mpw` varchar(30) DEFAULT NULL,
  `memail` varchar(50) DEFAULT NULL,
  `mjoindate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdel` int NOT NULL DEFAULT '0',
  `mdeldate` datetime DEFAULT NULL,
  `etc` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mno`),
  KEY `msort` (`msort`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`msort`) REFERENCES `memsort` (`msort`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (31,'m03','관리자','root','root','root@naver.com','2020-08-26 15:00:22',0,NULL,'관리자','https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png','010-1111-1111'),(32,'m02','장보윤','teacher','teacher','member11@naver.com','2020-08-26 15:03:32',0,NULL,'강사','/resources/img/wkdqhdbs.jpg','010-2222-2222'),(33,'m02','엄정현','teacher2','teacher2','member2@naver.com','2020-08-26 15:03:32',0,NULL,'강사','/resources/img/djawjdgus.JPG','010-3333-3333'),(34,'m02','양진','teacher3','teacher3','teacher3@naver.com','2020-08-28 16:54:41',0,NULL,'강사','/resources/img/didwls.jpg','010-4444-4444'),(35,'m02','조서현','teacher4','teacher4','teacher4@naver.com','2020-09-10 12:05:47',0,NULL,'강사','/resources/img/KakaoTalk_20200916_145933538.jpg','010-5555-5555'),(36,'m02','김재창','teacher5','teacher5','teacher5@naver.com','2020-09-10 12:05:47',0,NULL,'강사','/resources/img/djawjdgus.JPG','010-6666-6666'),(37,'m01','장여사','member1','member1','member2021@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'010-7777-7777'),(38,'m01','엄미종','member2','member2','member2@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'010-8888-8888'),(39,'m01','양진영','member3','member3','member3@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'010-9999-9999'),(40,'m01','조미종','member4','member4','member4@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'018-1111-2222'),(41,'m01','김미역','member5','member5','member5@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'018-1111-3333'),(42,'m01','감스트','member6','member6','member6@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'018-1111-2224'),(43,'m01','채지혜','member7','member7','member7@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'018-1111-2225'),(44,'m01','이화영','member8','member8','member8@naver.com','2020-09-10 12:09:51',0,NULL,'회원',NULL,'018-1111-2226'),(45,'m00','김강사','ta1','ta1','ta1@naver.com','2020-09-10 12:09:51',0,NULL,'강사신청',NULL,'018-1111-2227'),(46,'m00','이강사','ta2','ta2','ta2@naver.com','2020-09-10 12:09:51',0,NULL,'강사신청',NULL,'018-3111-2226'),(47,'m00','박강사','ta3','ta3','ta3@naver.com','2020-09-10 12:09:51',0,NULL,'강사신청',NULL,'018-211-2222'),(48,'m00','심강사','ta4','ta4','ta4@naver.com','2020-09-10 12:09:51',0,NULL,'강사신청',NULL,'018-1111-2221');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
