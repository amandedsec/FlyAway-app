DROP TABLE IF EXISTS `f_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_admin` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_admin`
--
 
LOCK TABLES `f_admin` WRITE;
/*!40000 ALTER TABLE `f_admin` DISABLE KEYS */;
INSERT INTO `f_admin` VALUES (1,'admin','aaaaaa');
/*!40000 ALTER TABLE `f_admin` ENABLE KEYS */;
UNLOCK TABLES;
 
--
-- Table structure for table `f_airlines`
--
 
DROP TABLE IF EXISTS `f_airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_airlines` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_airlines`
--
 
LOCK TABLES `f_airlines` WRITE;
/*!40000 ALTER TABLE `f_airlines` DISABLE KEYS */;
INSERT INTO `f_airlines` VALUES (2,'SpiceJet'),(3,'GoAir'),(4,'Air India'),(5,'AirAsia'),(8,'Vistara');
/*!40000 ALTER TABLE `f_airlines` ENABLE KEYS */;
UNLOCK TABLES;


 
--
-- Table structure for table `f_places`
--
 
DROP TABLE IF EXISTS `f_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_places` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_places`
--
 
LOCK TABLES `f_places` WRITE;
/*!40000 ALTER TABLE `f_places` DISABLE KEYS */;
INSERT INTO `f_places` VALUES (1,'Bangalore'),(2,'Mumbai'),(3,'New Delhi'),(4,'Chennai'),(6,'Kolkatta'),(7,'Ahmedabad'),(10,'tomato'),(11,'Hyderabad');
/*!40000 ALTER TABLE `f_places` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `f_flights`
--
 
DROP TABLE IF EXISTS `f_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_flights` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` bigint(20) NOT NULL,
  `destination` bigint(20) NOT NULL,
  `airline_id` bigint(20) NOT NULL,
  `departure` varchar(10) DEFAULT NULL,
  `arrival` varchar(10) DEFAULT NULL,
  `time_taken` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `constraint_airline` (`airline_id`),
  KEY `constraint_source` (`source`),
  KEY `constraint_destination` (`destination`),
  CONSTRAINT `constraint_airline` FOREIGN KEY (`airline_id`) REFERENCES `f_airlines` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `constraint_destination` FOREIGN KEY (`destination`) REFERENCES `f_places` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `constraint_source` FOREIGN KEY (`source`) REFERENCES `f_places` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_flights`
--
 
LOCK TABLES `f_flights` WRITE;
/*!40000 ALTER TABLE `f_flights` DISABLE KEYS */;
INSERT INTO `f_flights` VALUES (3,1,4,5,'8 pm','9.30pm','1.30 hours',4500.00),(7,1,11,8,'8 AM','10:30 AMx','2.5 HOURS',2500.00);
/*!40000 ALTER TABLE `f_flights` ENABLE KEYS */;
UNLOCK TABLES;

 
--
-- Table structure for table `f_bookings`
--
 
DROP TABLE IF EXISTS `f_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_bookings` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `flight_id` bigint(20) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `flight_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `constraint_flights` (`flight_id`),
  CONSTRAINT `constraint_flights` FOREIGN KEY (`flight_id`) REFERENCES `f_flights` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_bookings`
--
 
LOCK TABLES `f_bookings` WRITE;
/*!40000 ALTER TABLE `f_bookings` DISABLE KEYS */;
INSERT INTO `f_bookings` VALUES (8,1,3,4500.00,'2019-07-05 19:07:11','2019-07-05 19:07:11'),(9,1,3,4500.00,'2019-07-05 19:11:21','2019-07-05 19:11:21'),(10,1,3,4500.00,'2019-07-05 19:19:46','2019-07-05 19:19:46'),(13,1,3,4500.00,'2019-07-05 19:25:44','2019-07-05 19:25:44'),(14,1,3,4500.00,'2019-07-05 19:28:06','2019-07-05 19:28:06');
/*!40000 ALTER TABLE `f_bookings` ENABLE KEYS */;
UNLOCK TABLES;
 
 
--
-- Table structure for table `f_user`
--
 
DROP TABLE IF EXISTS `f_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_signup` datetime DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pwd` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
--
-- Dumping data for table `f_user`
--
 
LOCK TABLES `f_user` WRITE;
/*!40000 ALTER TABLE `f_user` DISABLE KEYS */;
INSERT INTO `f_user` VALUES (1,'amit sengupta','amit@amit.com','2019-07-05 17:40:10','This is my address','this is my city','aaaaaa'),(2,'John Doe','john@doe.com','2019-07-05 17:40:44','127 Park Avenue NYC 3817','New Delhi','aaaaaa');
/*!40000 ALTER TABLE `f_user` ENABLE KEYS */;
UNLOCK TABLES;
