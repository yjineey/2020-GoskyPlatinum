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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `msno` int NOT NULL AUTO_INCREMENT,
  `mssort` varchar(10) NOT NULL,
  `toid` varchar(40) NOT NULL,
  `fromid` varchar(40) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `readchk` int DEFAULT '0',
  `readdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` int NOT NULL DEFAULT '0',
  `deldate` datetime DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msno`)
) ENGINE=InnoDB AUTO_INCREMENT=10083 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (10045,'ms02','root','member','주간보호센터 입소관련 상담문의','주간보호센터 입소관련 상담문의',0,'2020-08-31 23:25:16',0,NULL,'2020-08-31 23:25:16'),(10046,'ms02','root','member','GoSky플레티넘 스쿨','GoSky플레티넘 스쿨',0,'2020-08-31 23:25:38',0,NULL,'2020-08-31 23:25:38'),(10047,'ms01','root','member','GoSky플레티넘 스쿨 9월 행사 안내입니다','GoSky플레티넘 스쿨 9월 행사 안내입니다',0,'2020-08-31 23:58:13',0,NULL,'2020-08-31 23:58:13'),(10048,'ms01','root','member','GoSky플레티넘 스쿨에 오신 것을 환영합니다','GoSky플레티넘 스쿨에 오신 것을 환영합니다',0,'2020-08-31 23:58:39',1,NULL,'2020-08-31 23:58:39'),(10053,'ms03','root','teacher','9월 10일 부터 강의해주세요','9월 10일 부터 강의해주세요',0,'2020-09-10 12:25:44',0,NULL,'2020-09-10 12:25:44'),(10054,'ms03','root','teacher','수영 강의 부탁드립니다','수영 강의 부탁드립니다',0,'2020-09-10 12:26:53',0,NULL,'2020-09-10 12:26:53'),(10055,'ms03','root','teacher','원생일지를 작성해주세요','원생일지를 작성해주세요',1,'2020-09-10 12:27:08',0,NULL,'2020-09-10 12:27:08'),(10056,'ms01','member1','member2','우리 할아버지 건드리지마','우리 할아버지 건드리지마',0,'2020-09-10 13:02:21',0,NULL,'2020-09-10 13:02:21'),(10057,'ms01','member1','member2','우리 할머니도 건드리지마','우리 할머니도 건드리지마',0,'2020-09-10 13:02:33',0,NULL,'2020-09-10 13:02:33'),(10058,'ms01','member1','member2','사이좋게 지내자','사이좋게 지내자',0,'2020-09-10 13:02:42',1,NULL,'2020-09-10 13:02:42'),(10059,'ms01','member1','member1','야야양야야야양야','야야양야야야양야',0,'2020-09-10 13:03:47',2,NULL,'2020-09-10 13:03:47'),(10060,'ms01','member1','member1','까불지마','까불지마',0,'2020-09-10 13:03:57',2,NULL,'2020-09-10 13:03:57'),(10061,'ms01','member1','member1','노는게 제일좋아','노는게 제일좋아',0,'2020-09-10 13:04:32',0,NULL,'2020-09-10 13:04:32'),(10062,'ms01','member1','member1','친구들 모여라','친구들 모여라',0,'2020-09-10 13:04:40',0,NULL,'2020-09-10 13:04:40'),(10063,'ms01','member1','member1','언제나 즐거워','언제나 즐거워',0,'2020-09-10 13:04:53',2,NULL,'2020-09-10 13:04:53'),(10064,'ms02','member1','tjgusaos','노는게 즐겁지 않습니다','노는게 즐겁지 않습니다',0,'2020-09-10 13:05:08',0,NULL,'2020-09-10 13:05:08'),(10065,'ms02','member1','tjgusaos','친구도 없어요','친구도 없어욧',0,'2020-09-10 13:05:18',0,NULL,'2020-09-10 13:05:18'),(10066,'ms02','member1','tjgusaos','원장님은 몇살이에여???????????','원장님은 몇살이에여?',0,'2020-09-10 13:05:30',1,NULL,'2020-09-10 00:00:00'),(10068,'ms01','root','root','코로나 예방교육','금주 수요일 코로나 바이러스 예방 교육이 있을 예정입니다.',0,'2020-09-15 10:44:19',2,NULL,'2020-09-15 10:44:19'),(10069,'ms01','root','root','코로나바아러스 예방교육 부탁드려요','코로나바아러스 예방교육 부탁드려요',0,'2020-09-15 10:56:45',0,NULL,'2020-09-15 10:56:45'),(10070,'ms01','root','root','선생님!!!!!!!!!','선생님!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',0,'2020-09-15 11:03:28',1,NULL,'2020-09-15 11:03:28'),(10071,'ms01','root','root','선생님!!!!!!!!!','선생님 사랑해요~~~~!!!',0,'2020-09-15 11:06:21',0,NULL,'2020-09-15 11:06:21'),(10072,'ms01','root','root','GoSky플레티넘 스쿨 9월 행사 안내입니다','GoSky플레티넘 스쿨 9월 행사 안내입니다',0,'2020-09-15 11:08:31',1,NULL,'2020-09-15 11:08:31'),(10077,'ms03','root','teacher','건의가 왔어요','해명좀',1,'2020-09-16 17:06:27',0,NULL,'2020-09-16 17:06:27');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
