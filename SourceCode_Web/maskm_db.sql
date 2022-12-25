-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: web111.c9gmjjt4quct.us-east-1.rds.amazonaws.com    Database: maskm_db
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL,
  `address_line` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1000N 4st','Billing','FairField','Palestine',NULL,555),(2,'1000N 4st mmmmm','Shipping','FairField','Palestine',NULL,55555);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `a_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `FK8ahhk8vqegfrt6pd1p9i03aej` (`user_id`),
  CONSTRAINT `FK8ahhk8vqegfrt6pd1p9i03aej` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `b_id` bigint NOT NULL,
  `points` bigint NOT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `credit_card_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `FKbpd7f78fby7akt1og7t17e3et` (`billing_address_id`),
  KEY `FKdmjdy489kqpatqxo3oj8itxxx` (`credit_card_id`),
  KEY `FKsfjemlhvw7uc0e0r2mxd1xj32` (`shipping_address_id`),
  KEY `FK9c4t9576xotgiqoyc8ck5nnwe` (`user_id`),
  CONSTRAINT `FK9c4t9576xotgiqoyc8ck5nnwe` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FKbpd7f78fby7akt1og7t17e3et` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKdmjdy489kqpatqxo3oj8itxxx` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`),
  CONSTRAINT `FKsfjemlhvw7uc0e0r2mxd1xj32` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,8468,1,1,2,3);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_orders`
--

DROP TABLE IF EXISTS `buyer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer_orders` (
  `buyer_b_id` bigint NOT NULL,
  `orders_id` bigint NOT NULL,
  UNIQUE KEY `UK_byueia57hq8r71diovv62svrg` (`orders_id`),
  KEY `FKcxwk3tewxt4csukafsv7ijtfo` (`buyer_b_id`),
  CONSTRAINT `FKcxwk3tewxt4csukafsv7ijtfo` FOREIGN KEY (`buyer_b_id`) REFERENCES `buyer` (`b_id`),
  CONSTRAINT `FKso9suo7gqhnm591bn5cwcyxb0` FOREIGN KEY (`orders_id`) REFERENCES `ord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_orders`
--

LOCK TABLES `buyer_orders` WRITE;
/*!40000 ALTER TABLE `buyer_orders` DISABLE KEYS */;
INSERT INTO `buyer_orders` VALUES (1,1),(1,6),(1,7),(1,9),(1,10),(1,12),(1,13),(1,14),(1,15),(1,203),(1,205);
/*!40000 ALTER TABLE `buyer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_sellers_followed`
--

DROP TABLE IF EXISTS `buyer_sellers_followed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer_sellers_followed` (
  `buyer_b_id` bigint NOT NULL,
  `sellers_followed_s_id` bigint NOT NULL,
  UNIQUE KEY `UK_ce7xjvwmqxjedbj8pchp107qr` (`sellers_followed_s_id`),
  KEY `FKbylf92guy8332ba1yv37t09vo` (`buyer_b_id`),
  CONSTRAINT `FKbylf92guy8332ba1yv37t09vo` FOREIGN KEY (`buyer_b_id`) REFERENCES `buyer` (`b_id`),
  CONSTRAINT `FKfherm1qj7rpslof5hwaqsdhym` FOREIGN KEY (`sellers_followed_s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_sellers_followed`
--

LOCK TABLES `buyer_sellers_followed` WRITE;
/*!40000 ALTER TABLE `buyer_sellers_followed` DISABLE KEYS */;
INSERT INTO `buyer_sellers_followed` VALUES (12,2);
/*!40000 ALTER TABLE `buyer_sellers_followed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `id` bigint NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `exp_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (1,'6666-5555-6666-6666','625','12-25');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (207);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_item`
--

DROP TABLE IF EXISTS `line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_item` (
  `id` bigint NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK237t8tbj9haibqe7wafj4t54x` (`product_id`),
  CONSTRAINT `FK237t8tbj9haibqe7wafj4t54x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_item`
--

LOCK TABLES `line_item` WRITE;
/*!40000 ALTER TABLE `line_item` DISABLE KEYS */;
INSERT INTO `line_item` VALUES (1,36000,1,1),(2,250000,1,3),(3,36000,1,1),(4,250000,2,3),(5,36000,1,1),(6,250000,1,3),(7,250000,2,3),(8,250000,2,3),(9,36000,1,1),(10,36000,4,1),(11,250000,1,3),(12,36000,1,1),(13,250000,2,3),(14,36000,1,1),(15,50000,1,6),(16,250000,1,3),(17,20000,2,4),(18,20000,1,4),(19,250000,2,3),(20,36000,1,1),(21,250000,2,3),(22,36000,1,1),(23,250000,2,3),(24,36000,1,1),(25,250000,2,3),(26,36000,1,1),(27,250000,1,3),(28,600000,1,9),(29,600000,2,9),(30,250000,2,3),(31,250000,1,3),(204,979.999,2,7),(206,979.999,2,7);
/*!40000 ALTER TABLE `line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord`
--

DROP TABLE IF EXISTS `ord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ord` (
  `id` bigint NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `order_paid` bit(1) DEFAULT NULL,
  `price` double NOT NULL,
  `buyer_b_id` bigint DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2kq4cjo79k4kgxo2qamidwaws` (`buyer_b_id`),
  CONSTRAINT `FK2kq4cjo79k4kgxo2qamidwaws` FOREIGN KEY (`buyer_b_id`) REFERENCES `buyer` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord`
--

LOCK TABLES `ord` WRITE;
/*!40000 ALTER TABLE `ord` DISABLE KEYS */;
INSERT INTO `ord` VALUES (1,'2021-08-13 00:00:00',_binary '\0',500000,1,'Shipped'),(2,'2021-08-13 00:00:00',_binary '\0',536000,1,'Cancelled'),(3,'2021-08-13 00:00:00',_binary '\0',394000,1,'Cancelled'),(4,'2021-08-13 00:00:00',_binary '\0',536000,1,'Cancelled'),(5,'2021-08-13 00:00:00',_binary '\0',86000,1,'Pending'),(6,'2021-08-13 00:00:00',_binary '\0',290000,1,'Pending'),(7,'2021-08-13 00:00:00',_binary '\0',20000,1,'Pending'),(8,'2021-08-13 00:00:00',_binary '\0',536000,1,'Pending'),(9,'2021-08-13 00:00:00',_binary '\0',536000,1,'Pending'),(10,'2021-08-13 00:00:00',_binary '\0',536000,1,'Cancelled'),(11,'2021-08-13 00:00:00',_binary '\0',536000,1,'Pending'),(12,'2021-08-14 00:00:00',_binary '\0',250000,1,'Pending'),(13,'2021-08-14 00:00:00',_binary '\0',600000,1,'Pending'),(14,'2021-08-14 00:00:00',_binary '\0',1700000,1,'Pending'),(15,'2021-08-14 00:00:00',_binary '\0',250000,1,'Cancelled'),(203,'2022-12-15 00:00:00',_binary '\0',1959.998,1,'Pending'),(205,'2022-12-15 00:00:00',_binary '\0',1959.998,1,'Pending');
/*!40000 ALTER TABLE `ord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord_line_items`
--

DROP TABLE IF EXISTS `ord_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ord_line_items` (
  `ord_id` bigint NOT NULL,
  `line_items_id` bigint NOT NULL,
  UNIQUE KEY `UK_ko4ghe0a5ej0rlmjyxo7fvt71` (`line_items_id`),
  KEY `FKgusy1j2uygmhh746oiy176x94` (`ord_id`),
  CONSTRAINT `FKgusy1j2uygmhh746oiy176x94` FOREIGN KEY (`ord_id`) REFERENCES `ord` (`id`),
  CONSTRAINT `FKtl3ui44krjccii8tjk39vw0f4` FOREIGN KEY (`line_items_id`) REFERENCES `line_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord_line_items`
--

LOCK TABLES `ord_line_items` WRITE;
/*!40000 ALTER TABLE `ord_line_items` DISABLE KEYS */;
INSERT INTO `ord_line_items` VALUES (1,7),(2,8),(2,9),(3,10),(3,11),(4,12),(4,13),(5,14),(5,15),(6,16),(6,17),(7,18),(8,19),(8,20),(9,21),(9,22),(10,23),(10,24),(11,25),(11,26),(12,27),(13,28),(14,29),(14,30),(15,31),(203,204),(205,206);
/*!40000 ALTER TABLE `ord_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` bigint NOT NULL,
  `card_expiry_date` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `id` bigint NOT NULL,
  `area_code` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,'84','819','1397');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `created_on` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `featured` bit(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `rating` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  `seller_s_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcwclrqu392y86y0pmyrsi649r` (`product_category_id`),
  KEY `FK41ftb3njjurjerd6nl4ivo0xi` (`seller_s_id`),
  CONSTRAINT `FK41ftb3njjurjerd6nl4ivo0xi` FOREIGN KEY (`seller_s_id`) REFERENCES `seller` (`s_id`),
  CONSTRAINT `FKcwclrqu392y86y0pmyrsi649r` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2021-08-14','Giày thể thao XETIC Halflife',_binary '\0','https://product.hstatic.net/1000284478/product/03_195196_2_0337ee4c5fa944ac9e9df30ba9888044_large.jpg',869.999,0,'Pending','XETIC Halflife',1,1),(2,'2021-08-12','Giày thể thao nữ PWRFrame Stardust Training ',_binary '\0','https://product.hstatic.net/1000284478/product/01_376239_2_b39b55b3a8d1444cb2d97b9d1ea49165_large.jpg',999.999,0,'Pending','PWRFrame Stardust Training',1,1),(3,'2021-08-12','Giày thể thao nam Voyage Nitro Running',_binary '\0','https://product.hstatic.net/1000284478/product/04_195504_2_f5368b431fd74b3dbfc09d5919ae1f05_large.jpg',899.999,0,'Pending','Voyage Nitro Running',1,1),(4,'2021-08-13','Quần jogger nam lưng thun Classics Sweatpants',_binary '\0','https://product.hstatic.net/1000284478/product/01_535597_1_c562ac65ffa24d969e381eee8fb1612e_large.jpg',559.999,0,'Pending','Classics Sweatpants',2,3),(5,'2021-08-13','Vớ cổ cao thể thao unisex phối logo nổi bật',_binary '\0','https://product.hstatic.net/1000284478/product/01_935386_1_5a303ea2d07b40c0b0022fbfe10891c5_large.jpg',249.999,0,'Pending','Vớ cổ cao thể thao unisex',3,1),(6,'2021-08-13','Áo thun thể thao nam tay ngắn cổ tròn CLOUDSPUN Training',_binary '\0','https://product.hstatic.net/1000284478/product/01_522322_1_d5f5435bf26c4e8cbfa78a7df7aefcd2_grande.jpg',797.999,0,'Pending','CLOUDSPUN Training',5,3),(7,'2021-08-13','Áo khoác nam cổ trụ phối zip BVB Prematch Football',_binary '\0','https://product.hstatic.net/1000284478/product/05_765020_1_d3574bdfcc3a4cd59acb866a712ecc7b_large.jpg',979.999,0,'Pending','BVB Prematch Football',6,3),(8,'2021-08-13','Áo thun thể thao nữ ngắn tay Cloudspun',_binary '\0','https://product.hstatic.net/1000284478/product/01_522152_1_b09643e0667d439386564c5b6d03e52f_large.jpg',759.999,0,'Pending','Cloudspun',5,3),(9,'2021-08-13','Áo thun thể thao BVB AWAY Replica Jersey',_binary '\0','https://product.hstatic.net/1000284478/product/02_765892_1_61262562219b4e928f606ce1d023905f_large.jpg',869.999,0,'Pending','BVB AWAY Replica Jersey',5,3),(10,'2021-08-14','Quần shorts thể thao nam Manchester City FC 22/23 Replica',_binary '\0','https://product.hstatic.net/1000284478/product/04_765752_1_944d29fbda714eb283d8592343e347a0_large.jpg',599.999,0,'Pending','Manchester City FC 22/23 Replica',5,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Giày thể thao'),(2,'Quần nam'),(3,'Vớ thể thao'),(4,'Áo thun thể thao'),(5,'Quần, áo thể thao'),(6,'Áo khoác nam');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_products`
--

DROP TABLE IF EXISTS `product_category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_products` (
  `product_category_id` bigint NOT NULL,
  `products_id` bigint NOT NULL,
  UNIQUE KEY `UK_5syc7h37jhgb1frcsdad03v6j` (`products_id`),
  KEY `FKam9av2exs30qk3ark7n6wqtj6` (`product_category_id`),
  CONSTRAINT `FKam9av2exs30qk3ark7n6wqtj6` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FKb0m89ku69wht90w0wr580cvtx` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_products`
--

LOCK TABLES `product_category_products` WRITE;
/*!40000 ALTER TABLE `product_category_products` DISABLE KEYS */;
INSERT INTO `product_category_products` VALUES (1,2),(2,8),(2,9);
/*!40000 ALTER TABLE `product_category_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `product_id` bigint NOT NULL,
  `reviews_id` bigint NOT NULL,
  UNIQUE KEY `UK_3ccouv5pw4emhrij6823d0vf7` (`reviews_id`),
  KEY `FKipftsx386s1e9e1lk5onryuh5` (`product_id`),
  CONSTRAINT `FK4m1i84jhctsjdu73v2wrjwe63` FOREIGN KEY (`reviews_id`) REFERENCES `review` (`id`),
  CONSTRAINT `FKipftsx386s1e9e1lk5onryuh5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (1,9),(3,1),(3,2),(3,3),(3,5),(3,6),(4,7),(4,8),(8,4);
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `stars` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiyof1sindb9qiqr9o8npj8klt` (`product_id`),
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Like it',5,'Approved',3),(2,'perfect',5,'Pending',3),(3,'very Good',3.5,'Pending',3),(4,'ahmed1500',5,'Pending',8),(5,'Awesome ',3,'Pending',3),(6,'very very good',3,'Pending',3),(7,'not bad',2,'Approved',4),(8,'perfect',3,'Approved',4),(9,'didn\'t like it',3,'Approved',1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'BUYER'),(3,'SELLER'),(4,'SELLER'),(5,'BUYER'),(6,'BUYER'),(7,'BUYER'),(8,'ADMIN'),(9,'SELLER'),(10,'SELLER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `s_id` bigint NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK6rgw0e6tb24n93c27njlv0wcl` (`user_id`),
  CONSTRAINT `FK6rgw0e6tb24n93c27njlv0wcl` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Approved',2),(2,'Approved',4),(3,'Approved',5);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_products`
--

DROP TABLE IF EXISTS `seller_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_products` (
  `seller_s_id` bigint NOT NULL,
  `products_id` bigint NOT NULL,
  UNIQUE KEY `UK_iemjsutf7nimmyt7xoelaktg1` (`products_id`),
  KEY `FKbc6tlerj1lh78pnqkaovv194t` (`seller_s_id`),
  CONSTRAINT `FK1lvaagcjjuytidwm9608hsg0y` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKbc6tlerj1lh78pnqkaovv194t` FOREIGN KEY (`seller_s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_products`
--

LOCK TABLES `seller_products` WRITE;
/*!40000 ALTER TABLE `seller_products` DISABLE KEYS */;
INSERT INTO `seller_products` VALUES (1,1),(1,3),(1,5),(1,6),(1,7),(1,10);
/*!40000 ALTER TABLE `seller_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjghkvw2snnsr5gpct0of7xfcf` (`product_id`),
  KEY `FKqgx53awcrek7n79p4cq5u6qtg` (`seller_id`),
  CONSTRAINT `FKjghkvw2snnsr5gpct0of7xfcf` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKqgx53awcrek7n79p4cq5u6qtg` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `f_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `phone_id` bigint DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `FK5vq5p57v94ao9chhr4g398fe9` (`phone_id`),
  CONSTRAINT `FK5vq5p57v94ao9chhr4g398fe9` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','Admin','System','123456','admin',NULL,'https://png.pngtree.com/png-clipart/20201223/ourlarge/pngtree-cute-cartoon-boy-avatar-material-illustration-element-png-png-image_2604806.jpg'),(2,'doanquocbao@gmail.com','Doan','Bao','123456','doanquocbao',NULL,'https://png.pngtree.com/png-clipart/20190921/original/pngtree-user-cartoon-flat-girl-character-design-free-download-png-image_4744923.jpg'),(3,'hothanhdanh@hotmail.com','Ho','Danh','123456','hothanhdanh',NULL,'https://png.pngtree.com/element_our/20190529/ourlarge/pngtree-avatar-pattern-flat-cartoon-user-image_1200105.jpg'),(4,'nguenvanb@gmail.com','Nguyen','VanB','123456','nguyenvanb',NULL,NULL),(5,'nguyenvana@hotmail.com','Nguyen','VanA','123456','nguyenvana',NULL,'https://png.pngtree.com/png-clipart/20200224/original/pngtree-businessman-avatar-cartoon-style-png-image_5234654.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,4),(3,7),(1,8),(4,9),(5,10);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-15 14:45:43
