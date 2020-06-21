CREATE DATABASE  IF NOT EXISTS `class` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `class`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: class
-- ------------------------------------------------------
-- Server version	8.0.19

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
  `bno` int NOT NULL,
  `no` int NOT NULL,
  `userName` varchar(40) NOT NULL,
  `b_date` varchar(20) NOT NULL,
  `score` int DEFAULT NULL,
  `cmt` varchar(100) NOT NULL,
  PRIMARY KEY (`bno`),
  UNIQUE KEY `bno_UNIQUE` (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,2,'aaa','2020-06-20',4,'s'),(2,2,'aaa','2020-06-20',4,'d'),(3,2,'aaa','2020-06-20',4,'gg'),(4,2,'aaa','2020-06-20',4,'hh'),(5,2,'aaa','2020-06-20',4,'hh'),(6,8,'aaa','2020-06-20',5,'hi');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `count` int NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (2);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `userName` varchar(40) NOT NULL,
  `psw` varchar(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth` date NOT NULL,
  `mail` varchar(40) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('aaa','123','Chloe','1999-10-04','abc123@gmail.com',956387458),('manager','1234','manager','2000-04-24','manager1234@gmail.com',88888888);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orNum` varchar(10) NOT NULL,
  `userName` varchar(40) NOT NULL,
  `product` varchar(40) NOT NULL,
  `subtotal` int NOT NULL,
  `amount` int NOT NULL,
  `b_date` varchar(20) NOT NULL,
  PRIMARY KEY (`orNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('aa0011','aaa','黃鬱金香',10,1,'2020-06-19'),('aa0012','aaa','白百合',400,20,'2020-06-19'),('aa0013','aaa','粉玫瑰',15,1,'2020-06-19'),('aa0014','aaa','粉玫瑰',30,2,'2020-06-19'),('aa0015','aaa','雛菊',60,4,'2020-06-19');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `no` int NOT NULL,
  `proName` varchar(40) NOT NULL,
  `proPrice` int NOT NULL,
  `stoNum` int NOT NULL,
  `image` varchar(45) NOT NULL,
  `note` varchar(60) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'紅玫瑰',5,50,'image/redrose.jpg','熱情、熱愛著您　我愛你、熱戀，希望與你泛起激情的愛。'),(2,'藍玫瑰',10,20,'image/bluerose.jpg','奇跡与不可能實現的事，希望摯愛的你幸福。'),(3,'粉玫瑰',15,17,'image/pinkrose.jpg','感動、愛的宣言、銘記于心 、初戀，喜歡你那燦爛的笑容。'),(4,'白百合',20,80,'image/whitelily.jpg','象徵百年好合、持久的愛、纯潔、莊嚴、心心相印。'),(5,'粉百合',15,50,'image/pinklily.jpg','纯潔、可愛、象徵清纯、高雅。'),(6,'黃百合',5,20,'image/yellowlily.jpg','早日康復。象徵財富、高貴。'),(7,'紅鬱金香',10,80,'image/redtulip.jpg','愛的告白、愛的宣言、喜悅、熱愛。'),(8,'粉鬱金香',10,50,'image/pinktulip.jpg','美人、熱愛、愛惜、友誼、幸福。'),(9,'黃鬱金香',10,50,'image/yellowtulip.jpg','高雅、珍貴、財富、愛惜、友誼。'),(10,'雛菊',15,36,'image/daisy.jpg','純潔的、天真幼稚、愉快、幸福、和平、希望、深藏在心底的愛。'),(11,'乾燥花',200,200,'123','拉拉拉');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcar`
--

DROP TABLE IF EXISTS `shoppingcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcar` (
  `carNum` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) NOT NULL,
  `no` int NOT NULL,
  `product` varchar(40) NOT NULL,
  `amount` int NOT NULL,
  `subtotal` int NOT NULL,
  `t_date` varchar(20) NOT NULL,
  PRIMARY KEY (`carNum`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcar`
--

LOCK TABLES `shoppingcar` WRITE;
/*!40000 ALTER TABLE `shoppingcar` DISABLE KEYS */;
INSERT INTO `shoppingcar` VALUES (74,'aaa',3,'粉玫瑰',2,30,'2020-06-19'),(75,'aaa',10,'雛菊',4,60,'2020-06-19');
/*!40000 ALTER TABLE `shoppingcar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 22:36:45
