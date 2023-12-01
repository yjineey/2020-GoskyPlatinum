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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `bsort` varchar(10) NOT NULL,
  `btitle` varchar(50) NOT NULL,
  `bcontent` varchar(1000) NOT NULL,
  `mid` varchar(45) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del` int NOT NULL DEFAULT '0',
  `deldate` datetime DEFAULT NULL,
  `readcnt` int NOT NULL DEFAULT '0',
  `etc` varchar(45) DEFAULT NULL,
  `cno` int DEFAULT NULL,
  `supload` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`bno`),
  KEY `bsort` (`bsort`),
  CONSTRAINT `bsort` FOREIGN KEY (`bsort`) REFERENCES `boardsort` (`bsort`)
) ENGINE=InnoDB AUTO_INCREMENT=2581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (2566,'b01','신종코로나바이러스 감영증으로 인한 센터 방문 자제 요청.','<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/PsxjjpKMBQA\" width=\"640\"></iframe></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>신종코로나바이러스 감영증으로 인한 센터 방문 자제 요청.</p>\r\n\r\n<p>현재 신종코로나바이러스 감영증이 큰 사회적 문제가 되고 있습니다.</p>\r\n\r\n<p>많은 노력으로 다행히 현재까지는 큰 문제가 발생하지는 않았으나 앞으로 발생할지 모를 위험에 대비하여 외부인은 센터 방문을 자제하여 주시고</p>\r\n\r\n<p>부득이 방문하실 때에는 방문전 먼저 센터에 알려주시고 센터에서 제공하는 소독 절차에 협조하여 주시기 바랍니다.</p>\r\n\r\n<p>면역력이 특히 약한 어르신들이 바이러스에 노출될 경우 치명적 위험이 발생 할 수 있음을 인지하여 주시고 널리 양해하여 주시기 바랍니다.<br />\r\n&nbsp;</p>\r\n','admin','2020-08-28 15:10:18',0,NULL,11,NULL,NULL,NULL),(2568,'b01','노인학대 예방교육 영상','<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/R74HRUP_ItU\" width=\"640\"></iframe></p>\r\n\r\n<p>노인학대예방교육 영상입니다.</p>\r\n\r\n<p><!-- 스크랩 추천 비추천 시작 { --><!-- } 스크랩 추천 비추천 끝 --><!-- 링크 버튼 --></p>\r\n','admin','2020-08-28 15:07:14',0,NULL,5,NULL,NULL,NULL),(2569,'b01','신종 코로나바이러스 예방행동 수칙','<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/yDu0IFgNmNM\" width=\"640\"></iframe></p>\r\n\r\n<p>중국에서 넘어온 신종 코로나바이러스 때문에 전세계가 두려움에 떨고있습니다.&nbsp;&nbsp;</p>\r\n\r\n<p>코로나 바이러스 감염의 위험을 막기위해 예방행동 수칙을 참고 하시길 바랍니다.</p>\r\n\r\n<p>신종코로나 바이러스 예방행동 수칙&nbsp;<br />\r\n1.손으로 얼굴이나 입 등을&nbsp;만지지 않기.&nbsp;﻿<br />\r\n2.마스크 착용을 생활화 하기.<br />\r\n3.흐르는 물에 30초 이상 비누로 손 씻기.<br />\r\n4.옷소매로 가리고 기침하기.</p>\r\n\r\n<p>저희 GoSky플레티넘 스쿨은&nbsp;방문하시는 모든 분들은 마스크 착용과 손소독을 원칙으로 하고 있습니다.<br />\r\n또 손씻기를 생활화 하며 센터 내부 소독을 수시로 하고 있습니다.<br />\r\n저희 GoSky플레티넘 스쿨은 어르신들의 건강을 위해&nbsp;최선의 노력을 다하고 있습니다.&nbsp;</p>\r\n','admin','2020-08-28 15:05:14',0,NULL,13,NULL,NULL,NULL),(2570,'b03','경기 부천에 사는 5등급도 이용할 수 있나요?','<p>저희 어머님이 지난 달에 5등급을 받으셨고 본인 스스로&nbsp;겨우 화장실에 가실 정도는 되지만<br />\r\n하루종일 집에서만 계시는게 어려워서 그러는데 5등급도 센터를 이용할 수 있는지요?<br />\r\n가능하다면 하루에 몇 시간까지 한달에 몇일을 할 수 있는지요?<br />\r\n자세히 알려 주시면 감사하겠읍니다.<br />\r\n거주지는 경기도 부천입니다.</p>\r\n','member','2020-08-28 14:17:23',0,NULL,5,NULL,NULL,'\\imgUpload\\2020\\08\\28\\s\\s_D:\\project-workspace\\aaBackup7\\src\\main\\webapp\\resources\\images\\none.png'),(2571,'b03','요양등급이 없는데 이용 가능 한가요?','<p>저희 아버지 연세가 78세이신데 화장실을 간신히 다니실 정도로 관절염이 심하시고</p>\r\n\r\n<p>낮에는 혼자계셔서 도움이 필요한데 요양등급은 어떻게 받아야하며,</p>\r\n\r\n<p>등급을 못받으면 이용을 할 수 없는건지요?</p>\r\n\r\n<p>주간보호 시설을 이용한 경험이 없어서 그러니 자세한 설명을 부탁함니다~&nbsp;<br />\r\n&nbsp;</p>\r\n','member','2020-08-28 14:22:42',0,NULL,9,NULL,NULL,'\\imgUpload\\2020\\08\\28\\s\\s_D:\\project-workspace\\aaBackup7\\src\\main\\webapp\\resources\\images\\none.png'),(2572,'b02','관내 스포츠 수업이 생겼으면 합니다..','<p>관내&nbsp;스포츠 수업이 생겼으면 좋겠습니다.</p>\r\n\r\n<p>보통 외부에서 하는 수업이라 부모님께서 이동하시기 힘드시다고 하셔서요 ㅠㅠ</p>\r\n\r\n<p>관내&nbsp;스포츠 수업도 더 생겼으면 좋겠습니다 ㅠㅠ</p>\r\n','admin','2020-08-28 14:40:05',0,NULL,3,NULL,NULL,'\\imgUpload\\2020\\08\\28\\s\\s_D:\\project-workspace\\aaBackup7\\src\\main\\webapp\\resources\\images\\none.png'),(2573,'b02','코로나 관련한 대처?','<p>코로나 관련한 대처가 잘 되고 있는지 궁굼합니다.</p>\r\n\r\n<p>현재 방역이 잘 이루어지고 있는지 궁굼합니다.</p>\r\n\r\n<p>사진 및 다양한 자료를 통한 정보를 알려주셨으면 합니다.........</p>\r\n','admin','2020-08-28 14:41:47',0,NULL,19,NULL,NULL,'\\imgUpload\\2020\\08\\28\\s\\s_D:\\project-workspace\\aaBackup7\\src\\main\\webapp\\resources\\images\\none.png'),(2576,'b02','고발합니다','<p>이 강사님은</p>\r\n','member1','2020-09-16 16:43:18',0,NULL,2,NULL,NULL,'\\imgUpload\\2020\\09\\16\\s\\s_6f50af45-be92-4ec0-81c2-07215c25d719_didwls.jpg'),(2579,'b04','오늘 날씨가 참 좋네요','모두들 코로나 바이러스 조심하시고 행복한 하루 되세요~~~','member2','2020-09-17 15:28:40',0,NULL,1,NULL,NULL,NULL),(2580,'b05','플레티넘 스쿨을 졸업하며','부모님이 학원에 다니시는 동안 즐겁고 편하게 생활 할 수 있도록 신경써주셔서 감사합니다 !!','member3','2020-09-17 15:28:40',0,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
