-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: housing
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` varchar(9) NOT NULL,
  `building_name` varchar(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `street_name` varchar(30) NOT NULL,
  `price_cat` varchar(10) NOT NULL,
  `building_class` int NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('1','Hastings Hall','316 Huntington Ave, Boston, MA 02115','Huntington','standard',2,35),('10','Levine Hall','122 St Stephen St, Boston, MA 02115','St Stephen','economy',2,65),('11','319 Huntington Ave','319 Huntington Ave, Boston, MA 02115','Huntington','economy',3,48),('12','337 Huntington Ave','337 Huntington Ave, Boston, MA 02115','Huntington','economy',3,2),('13','407 Huntington Ave','407 Huntington Ave, Boston, MA 02115','Huntington','standard',3,20),('14','780 Columbus Ave','780 Columbus Ave, Boston, MA 02120','Columbus','standard',2,0),('15','144 Hemenway','144 Hemenway St., Hemenway St, Boston, MA 02115','Hemenway','standard',3,28),('16','Burstein Hall','458 Huntington Ave, Boston, MA 02115','Huntington','economy',2,14),('17','Davenport Commons A','700 Columbus Ave, Boston, MA 02120','Columbus','enhanced',2,48),('18','Davenport Commons B','696 Columbus Ave, Boston, MA 02120','Columbus','enhanced',2,42),('19','Edwards Hall','574 Huntington Ave, Boston, MA 02115','Huntington','economy',3,34),('2','153 Hemenway Street','153 Hemenway St., Hemenway St, Boston, MA 02115','Hemenway','economy',2,54),('20','Loftman Hall','157 Hemenway St, Boston, MA 02115','Hemenway','standard',3,23),('3','International Village','1155 Tremont St. Boston, MA 02120','Tremont','enhanced',2,22),('4','East Village','291 St Botolph St, Boston, MA 02115','St Botolph','enhanced',2,32),('5','Kennedy Hall','119 Hemenway St., Hemenway St, Boston, MA 02115','Hemenway','standard',2,18),('6','10 Coventry','10 Coventry St, Boston, MA 02120','Coventry','standard',3,42),('7','106 St. Stephen Street','106 St Stephen St, Boston, MA 02115','St Stephen','economy',2,21),('8','110 St. Stephen Street','110 St Stephen St, Boston, MA 02115','St Stephen','economy',2,34),('9','116 St. Stephen Street','116 St Stephen St, Boston, MA 02115','St Stephen','economy',2,23);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dorm`
--

DROP TABLE IF EXISTS `dorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dorm` (
  `dorm_num` varchar(9) NOT NULL,
  `no_of_rooms` int NOT NULL,
  `capacity` int NOT NULL,
  `building_id` varchar(9) NOT NULL,
  PRIMARY KEY (`dorm_num`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `dorm_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dorm_chk_1` CHECK ((`capacity` between 1 and 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorm`
--

LOCK TABLES `dorm` WRITE;
/*!40000 ALTER TABLE `dorm` DISABLE KEYS */;
INSERT INTO `dorm` VALUES ('1',1,1,'14'),('10',3,5,'6'),('11',1,1,'2'),('12',1,2,'2'),('13',2,3,'5'),('14',2,4,'5'),('15',3,5,'15'),('16',3,6,'15'),('17',4,7,'20'),('18',4,8,'20'),('19',2,4,'1'),('2',1,2,'14'),('20',3,5,'1'),('21',1,1,'12'),('22',1,2,'12'),('23',3,5,'11'),('24',3,6,'11'),('25',4,7,'11'),('26',3,5,'13'),('27',1,1,'13'),('28',4,7,'16'),('29',4,8,'16'),('3',2,3,'14'),('30',2,4,'19'),('31',3,5,'19'),('32',3,6,'19'),('33',1,2,'4'),('34',2,4,'4'),('35',3,6,'4'),('36',3,6,'4'),('37',2,4,'7'),('38',3,6,'7'),('39',3,6,'7'),('4',2,4,'17'),('40',4,8,'8'),('41',2,4,'8'),('42',3,5,'9'),('43',3,6,'9'),('44',4,7,'9'),('45',2,3,'10'),('46',2,4,'10'),('47',1,1,'10'),('48',1,2,'3'),('49',2,4,'3'),('5',3,5,'17'),('50',3,6,'3'),('51',3,6,'3'),('6',3,6,'17'),('7',4,7,'18'),('8',4,8,'18'),('9',2,4,'6');
/*!40000 ALTER TABLE `dorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `preference_id` int NOT NULL AUTO_INCREMENT,
  `building_name` varchar(60) DEFAULT NULL,
  `building_id` varchar(9) DEFAULT NULL,
  `p_price_cat` varchar(10) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `rooming_group_id` int NOT NULL,
  PRIMARY KEY (`preference_id`),
  KEY `rooming_group_id` (`rooming_group_id`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`rooming_group_id`) REFERENCES `rooming_group` (`rooming_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'10 Coventry',NULL,NULL,NULL,1),(2,'10 Coventry',NULL,NULL,NULL,1),(3,'Levine Hall','10','St Stephen','economy',4),(4,'levine hall','2','economy','Hemenway',4),(5,'levine hall','2','economy','Hemenway',4),(6,'10 Coventry',NULL,NULL,NULL,1),(7,'10 Coventry',NULL,NULL,NULL,1),(8,'10 Coventry',NULL,NULL,NULL,1),(9,'10 Coventry',NULL,NULL,NULL,1),(10,'10 Coventry',NULL,NULL,NULL,1),(11,'10 Coventry',NULL,NULL,NULL,1),(12,'10 Coventry',NULL,NULL,NULL,1),(13,'10 Coventry',NULL,NULL,NULL,1),(14,'10 Coventry',NULL,NULL,NULL,1),(15,'10 Coventry',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` varchar(9) NOT NULL,
  `capacity` int DEFAULT NULL,
  `dorm_num` varchar(9) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `dorm_num` (`dorm_num`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`dorm_num`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_chk_1` CHECK ((`capacity` between 1 and 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('1',1,'1'),('10',2,'6'),('100',3,'43'),('101',2,'43'),('102',1,'43'),('103',2,'44'),('104',2,'44'),('105',2,'44'),('106',1,'44'),('107',2,'45'),('108',1,'45'),('109',2,'46'),('11',2,'6'),('110',2,'46'),('111',1,'47'),('112',3,'48'),('113',2,'49'),('114',2,'49'),('115',2,'50'),('116',2,'50'),('117',2,'50'),('118',3,'51'),('119',3,'51'),('12',2,'6'),('120',2,'51'),('13',2,'7'),('14',2,'7'),('15',2,'7'),('16',1,'7'),('17',3,'8'),('18',3,'8'),('19',1,'8'),('2',2,'2'),('20',1,'8'),('21',2,'9'),('22',2,'9'),('23',3,'10'),('24',2,'10'),('25',1,'11'),('26',2,'12'),('27',3,'13'),('28',2,'14'),('29',2,'14'),('3',2,'3'),('30',2,'15'),('31',2,'15'),('32',1,'15'),('33',3,'16'),('34',3,'16'),('35',3,'17'),('36',3,'17'),('37',1,'17'),('38',2,'18'),('39',2,'18'),('4',1,'3'),('40',2,'18'),('41',2,'18'),('42',2,'19'),('43',2,'19'),('44',2,'20'),('45',2,'20'),('46',1,'20'),('47',1,'21'),('48',2,'22'),('49',2,'23'),('5',2,'4'),('50',2,'23'),('51',1,'23'),('52',3,'24'),('53',3,'24'),('54',3,'25'),('55',2,'25'),('56',2,'25'),('57',2,'26'),('58',2,'26'),('59',1,'26'),('6',2,'4'),('60',1,'27'),('61',2,'28'),('62',2,'28'),('63',2,'28'),('64',1,'28'),('65',3,'29'),('66',3,'29'),('67',2,'29'),('68',2,'30'),('69',2,'30'),('7',2,'5'),('70',2,'31'),('71',2,'31'),('72',1,'31'),('73',2,'32'),('74',2,'32'),('75',2,'32'),('76',2,'33'),('77',2,'34'),('78',2,'34'),('79',2,'35'),('8',2,'5'),('80',2,'35'),('81',2,'35'),('82',3,'36'),('83',3,'36'),('84',2,'37'),('85',2,'37'),('86',3,'38'),('87',3,'38'),('88',2,'39'),('89',2,'39'),('9',1,'5'),('90',2,'39'),('91',2,'40'),('92',2,'40'),('93',2,'40'),('94',2,'40'),('95',3,'41'),('96',1,'41'),('97',2,'42'),('98',2,'42'),('99',1,'42');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooming_group`
--

DROP TABLE IF EXISTS `rooming_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooming_group` (
  `rooming_group_id` int NOT NULL AUTO_INCREMENT,
  `selection_num` int DEFAULT NULL,
  `g_class_standing` int NOT NULL,
  `student_1_id` varchar(9) DEFAULT NULL,
  `student_2_id` varchar(9) DEFAULT NULL,
  `student_3_id` varchar(9) DEFAULT NULL,
  `student_4_id` varchar(9) DEFAULT NULL,
  `student_5_id` varchar(9) DEFAULT NULL,
  `student_6_id` varchar(9) DEFAULT NULL,
  `student_7_id` varchar(9) DEFAULT NULL,
  `student_8_id` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`rooming_group_id`),
  CONSTRAINT `rooming_group_chk_1` CHECK ((`selection_num` between 1000 and 9999))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooming_group`
--

LOCK TABLES `rooming_group` WRITE;
/*!40000 ALTER TABLE `rooming_group` DISABLE KEYS */;
INSERT INTO `rooming_group` VALUES (1,1829,2,'123456786','123456788','123456787','123456786','123456786','123456786','123456786','123456786'),(2,3321,3,'216770354','002155547','888111222',NULL,NULL,NULL,NULL,NULL),(3,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(4,3300,2,'888999888','666777888','111333','555888111','999333888','444999222',NULL,NULL),(5,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(6,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(7,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(8,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(9,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(10,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(11,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(12,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(13,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL),(14,1829,2,'123456789','123456788','123456787',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rooming_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `time_slot_insert` AFTER INSERT ON `rooming_group` FOR EACH ROW begin
	declare selection_num_var int;
    
    select selection_num into selection_num_var from rooming_group where rooming_group_id = new.rooming_group_id;
    
    if (selection_num_var between 1000 and 2000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 1 hour);
    end if;
    if (selection_num_var between 2001 and 3000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 2 hour);
    end if;
    if (selection_num_var between 3001 and 4000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 3 hour);
    end if;
    if (selection_num_var between 4001 and 5000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 4 hour);
    end if;
    if (selection_num_var between 5001 and 6000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 5 hour);
    end if;
    if (selection_num_var between 6001 and 7000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 6 hour);
    end if;
    if (selection_num_var between 7001 and 8000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 7 hour);
    end if;
    if (selection_num_var between 8001 and 9000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 8 hour);
    end if;
    if (selection_num_var between 9001 and 9999)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 9 hour);
    end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_student_group_id` AFTER UPDATE ON `rooming_group` FOR EACH ROW begin
	declare group_id int;
    
    select new.rooming_group_id into group_id;

    update student 
		set s_rooming_group_id = group_id
		where s_rooming_group_id is null;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_group_after_delete` AFTER DELETE ON `rooming_group` FOR EACH ROW begin
    declare selection_1 int;
    declare selection_2 int;
    declare selection_3 int;
    declare selection_4 int;
    declare selection_5 int;
    declare selection_6 int;
    declare selection_7 int;
    declare selection_8 int;
	declare standing_1 int;
    declare standing_2 int;
    declare standing_3 int;
    declare standing_4 int;
    declare standing_5 int;
    declare standing_6 int;
    declare standing_7 int;
    declare standing_8 int;
    declare new_group_selection_num int;
    declare new_group_class_standing int;
    
    select get_selection_num(student_id_1) into selection_1 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_2) into selection_2 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_3) into selection_3 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_4) into selection_4 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_5) into selection_5 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_6) into selection_6 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_7) into selection_7 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_8) into selection_8 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_1) into standing_1 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_2) into standing_2 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_3) into standing_3 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_4) into standing_4 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_5) into standing_5 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_6) into standing_6 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_7) into standing_7 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_8) into standing_8 from rooming_group where selection_num = old.selection_num;
    
    select get_rooming_group_selection_num(selection_1, selection_2, selection_3, selection_4, selection_5, selection_6,
    selection_7, selection_8) into new_group_selection_num;
    
    select get_rooming_group_class_standing(standing_1, standing_2, standing_3, standing_4, standing_5, standing_6,
    standing_7, standing_8) into new_group_class_standing;
    
	update rooming_group
		set selection_num = new_group_selection_num
        where selection_num = old.selection_num;
	update rooming_group
		set g_class_standing = new_group_class_standing
        where selection_num = old.selection_num;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` varchar(9) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `s_class_standing` int NOT NULL,
  `selection_num` int NOT NULL,
  `s_rooming_group_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `s_rooming_group_id` (`s_rooming_group_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`s_rooming_group_id`) REFERENCES `rooming_group` (`rooming_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_chk_1` CHECK ((`s_class_standing` between 2 and 4)),
  CONSTRAINT `student_chk_2` CHECK ((`selection_num` between 1000 and 9999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('002155547','r','badkul',3,3321,1),('123456786','john','bro',4,4329,1),('123456787','john','bruh',2,1829,1),('123456788','john','dill',2,2829,1),('216770354','d','chandra',2,4312,1),('888999888','g','chandra',2,3300,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `rooming_group_id` int NOT NULL,
  `selection_time` datetime NOT NULL,
  PRIMARY KEY (`rooming_group_id`),
  CONSTRAINT `time_slot_ibfk_1` FOREIGN KEY (`rooming_group_id`) REFERENCES `rooming_group` (`rooming_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES (1,'2022-07-02 13:00:00'),(2,'2022-07-02 15:00:00'),(3,'2022-07-02 13:00:00'),(4,'2022-07-02 15:00:00'),(5,'2022-07-02 13:00:00'),(6,'2022-07-02 13:00:00'),(7,'2022-07-02 13:00:00'),(8,'2022-07-02 13:00:00'),(9,'2022-07-02 13:00:00'),(10,'2022-07-02 13:00:00'),(11,'2022-07-02 13:00:00'),(12,'2022-07-02 13:00:00'),(13,'2022-07-02 13:00:00'),(14,'2022-07-02 13:00:00');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'housing'
--

--
-- Dumping routines for database 'housing'
--
/*!50003 DROP FUNCTION IF EXISTS `get_class_standing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_class_standing`(
	student_id_p varchar(11)
) RETURNS int
    DETERMINISTIC
begin 
	declare standing_var int;
    
    if (student_id_p is null) then 
		return 2;
	else
		select s_class_standing into standing_var from student
			where student_id = student_id_p;
	end if;
	
    return standing_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_rooming_group_class_standing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_rooming_group_class_standing`(
	student_1_class_standing varchar(11),
    student_2_class_standing varchar(11),
    student_3_class_standing varchar(11),
    student_4_class_standing varchar(11),
    student_5_class_standing varchar(11),
    student_6_class_standing varchar(11),
    student_7_class_standing varchar(11),
    student_8_class_standing varchar(11)
) RETURNS int
    DETERMINISTIC
begin 
	declare class_standing_var int;
    
    select greatest(student_1_class_standing, student_2_class_standing, student_3_class_standing, student_4_class_standing,
    student_5_class_standing, student_6_class_standing, student_7_class_standing, student_8_class_standing) into class_standing_var;
	
    return class_standing_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_rooming_group_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_rooming_group_id`(
	student_id_p varchar(9)
) RETURNS int
    DETERMINISTIC
begin
	declare rooming_id int;
    
    select s_rooming_group_id into rooming_id from student where student_id = student_id_p;
    
    return rooming_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_rooming_group_selection_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_rooming_group_selection_num`(
	student_1_selection_num varchar(9),
    student_2_selection_num varchar(9),
    student_3_selection_num varchar(9),
    student_4_selection_num varchar(9),
    student_5_selection_num varchar(9),
    student_6_selection_num varchar(9),
    student_7_selection_num varchar(9),
    student_8_selection_num varchar(9)
) RETURNS int
    DETERMINISTIC
begin 
	declare selection_num_var int;
    
    select least(student_1_selection_num, student_2_selection_num, student_3_selection_num, 
    student_4_selection_num, student_5_selection_num, student_6_selection_num, student_7_selection_num, student_8_selection_num) into selection_num_var;
	
    return selection_num_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_selection_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_selection_num`(
	student_id_p varchar(9)
) RETURNS int
    DETERMINISTIC
begin 
	declare selection_num_var int;
    
    if (student_id_p is null) then 
		return 9999;
	else
		select selection_num into selection_num_var from student
			where student_id = student_id_p;
	end if;
	
    return selection_num_var;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_group`(
	student_1_id_p varchar(9),
    student_2_id_p varchar(9),
    student_3_id_p varchar(9),
    student_4_id_p varchar(9),
    student_5_id_p varchar(9),
    student_6_id_p varchar(9),
    student_7_id_p varchar(9),
    student_8_id_p varchar(9)
)
begin
	declare selection_1 int;
    declare selection_2 int;
    declare selection_3 int;
    declare selection_4 int;
    declare selection_5 int;
    declare selection_6 int;
    declare selection_7 int;
    declare selection_8 int;
    declare standing_1 int;
    declare standing_2 int;
    declare standing_3 int;
    declare standing_4 int;
    declare standing_5 int;
    declare standing_6 int;
    declare standing_7 int;
    declare standing_8 int;
    declare group_selection_num int;
    declare group_class_standing int;
    
    select get_selection_num(student_1_id_p) into selection_1;
    select get_selection_num(student_2_id_p) into selection_2;
    select get_selection_num(student_3_id_p) into selection_3;
    select get_selection_num(student_4_id_p) into selection_4;
    select get_selection_num(student_5_id_p) into selection_5;
    select get_selection_num(student_6_id_p) into selection_6;
    select get_selection_num(student_7_id_p) into selection_7;
    select get_selection_num(student_8_id_p) into selection_8;
    
    select get_class_standing(student_1_id_p) into standing_1;
    select get_class_standing(student_2_id_p) into standing_2;
    select get_class_standing(student_3_id_p) into standing_3;
    select get_class_standing(student_4_id_p) into standing_4;
    select get_class_standing(student_5_id_p) into standing_5;
    select get_class_standing(student_6_id_p) into standing_6;
    select get_class_standing(student_7_id_p) into standing_7;
    select get_class_standing(student_8_id_p) into standing_8;

	select get_rooming_group_selection_num(selection_1, selection_2, selection_3, selection_4, 
		selection_5, selection_6, selection_7, selection_8) into group_selection_num;
	select get_rooming_group_class_standing(standing_1, standing_2, standing_3, standing_4, 
		standing_5, standing_6, standing_7, standing_8) into group_class_standing;
        
	insert into rooming_group (selection_num, g_class_standing, student_1_id, student_2_id, student_3_id, 
    student_4_id, student_5_id, student_6_id, student_7_id, student_8_id) 
    values(group_selection_num, group_class_standing, student_1_id_p, student_2_id_p, student_3_id_p, 
    student_4_id_p, student_5_id_p, student_6_id_p, student_7_id_p, student_8_id_p);

		
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_preference` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_preference`(
building_name_p varchar(60),
building_id_p varchar(9),
p_price_cat_p varchar(10),
location_p varchar(60),
rooming_group_id_p int
)
begin
	insert into preferences (building_name, building_id, p_price_cat, location, rooming_group_id)
    values (building_name_p, building_id_p, p_price_cat_p, location_p, rooming_group_id_p);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_student`(
	student_id_p varchar(9),
    first_name_p varchar(30),
	last_name_p varchar(30),
	s_class_standing_p varchar(11),
    selection_num_p int
)
begin
	if exists (select * from student where student_id = student_id_p) then
		select student_id_p, "is already in a rooming group." as message;
	else
		insert into student values(student_id_p, first_name_p, last_name_p, s_class_standing_p, selection_num_p, null);
    end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_student_to_existing_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_student_to_existing_group`(
	student_id_p varchar(9),
    rooming_group_id_p int
)
add_student_to_existing_group: begin
	if (select student_1_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_1_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_2_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_2_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_3_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_3_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_4_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_4_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_5_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_5_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_6_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_6_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_7_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_7_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_8_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_8_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	else 
		select "This rooming group is already full!";
	end if;
    
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_student`(
student_id_p varchar(9)
)
begin

declare rooming_id int;

select get_rooming_group_id(student_id_p) into rooming_id;

if (select count(student_1_id) from rooming_group where student_1_id = student_id_p) = 1
then update rooming_group set student_1_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_2_id) from rooming_group where student_2_id = student_id_p) = 1
then update rooming_group set student_2_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_3_id) from rooming_group where student_3_id = student_id_p) = 1
then update rooming_group set student_3_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_4_id) from rooming_group where student_4_id = student_id_p) = 1
then update rooming_group set student_4_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_5_id) from rooming_group where student_5_id = student_id_p) = 1
then update rooming_group set student_5_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_6_id) from rooming_group where student_6_id = student_id_p) = 1
then update rooming_group set student_6_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_7_id) from rooming_group where student_7_id = student_id_p) = 1
then update rooming_group set student_7_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_8_id) from rooming_group where student_8_id = student_id_p) = 1
then update rooming_group set student_8_id = null where rooming_group_id = rooming_id;
end if;

delete from student where student_id = student_id_p;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_group`(
	rooming_group_id_p int
)
begin
	select * from rooming_group where rooming_group_id = rooming_group_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23 23:58:28
