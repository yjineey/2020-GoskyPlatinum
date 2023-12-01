CREATE TABLE `memsort` (
  `msort` varchar(5) NOT NULL,
  `msdata` varchar(20) NOT NULL,
  `msname` varchar(20) NOT NULL,
  PRIMARY KEY (`msort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

INSERT INTO `club99`.`memsort`(`msort`,`msdata`,`msname`) VALUES('m01', 'user', '회원');
INSERT INTO `club99`.`memsort`(`msort`,`msdata`,`msname`) VALUES('m02', 'teacher', '강사');
INSERT INTO `club99`.`memsort`(`msort`,`msdata`,`msname`) VALUES('m03', 'manager', '관리자');

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
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mno`),
  KEY `msort` (`msort`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`msort`) REFERENCES `memsort` (`msort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8