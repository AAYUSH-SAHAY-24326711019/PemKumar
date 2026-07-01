-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,20,'Philips 138 cm',1,45999.00,45999.00),(2,2,1,'Apple iPhone 17e',1,64900.00,64900.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `payment_method` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'INV-A1BCA6EC',11,'customer1','1200000012','patna','Cash On Delivery',45999.00,'2026-07-01 10:17:56','PLACED'),(2,'INV-A5580C43',11,'customer1','1200000012','Patna','Cash On Delivery',64900.00,'2026-07-01 11:12:02','PLACED');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Apple iPhone 17e','Apple',64900,'Mobile','Active','iphone.jpg','256 GB: 15.40 cm (6.1″) Super Retina XDR Display, A19 Chip, All-Day Battery Life, 48MP Fusion Camera, 256GB Starting Storage; Soft Pink'),(2,'Samsung TV','Samsung',45000,'TV','Active','tv.jpg','Smart LED TV'),(3,'Nokia 105 Classic','NOKIA',1029,'MOBILE','Active','nokia.jpg','| Single SIM Keypad Phone with Built-in UPI Payments, Long-Lasting Battery, Wireless FM Radio, Without Charger| 1 Year Replacement Guarantee | Charcoal'),(4,'OnePlus Nord 6','OnePlus ',41000,'MOBILE','Active','onep.jpg','12GB+256GB | Pitch Black | Snapdragon 8s Gen 4 | Segment\'s First Stable 165FPS Gaming | Segment\'s Largest 9000mAh Battery | Most Complete IP Rating | Personalized AI'),(5,'Samsung Galaxy S25 Ultra 5G AI Smartphone','Samsung',99999,'MOBILE','Active','sumsung25.jpg','(Titanium Whitesilver, 12GB RAM, 256GB Storage), 200MP Camera, S Pen Included, Long Battery Life'),(6,'vivo X300 FE 5G','vivo',79999,'MOBILE','Active','vivo.jpg','(Lilac Purple, 12GB RAM, 256GB Storage) with No Cost EMI/Additional Exchange Offers'),(7,'OnePlus 13','One',65999,'MOBILE','Active','onep.jpg','Smarter with OnePlus AI | Lifetime Display Warranty |16GB RAM 512GB Storage Arctic Dawn | Official Smartphone for BGMS 2025'),(8,'iQOO Z10R 5G','iQOO',22999,'MOBILE','Active','iqoo.jpg','(Aquamarine, 8GB RAM, 128GB Storage) | 32MP 4K Selfie Camera | Quad-Curved AMOLED Display | Dimensity 7400 Processor with 750K+ AnTuTu'),(9,'REDMI Note 15 5G','Redmi',24999,'MOBILE','Active','redmi.jpg','(Glacier Blue, 8GB RAM 128GB Storage) | 108MP OIS Camera | Snapdragon 6 Gen 3 | 17.2cm Tough Curved AMOLED Screen | Segment\'s Slimmest Phone | 5520mAh Si/C Battery | 45W Fas'),(10,'Haier H5E ','Haier',36490,'TV','Active','Harir.jpg','Series 127cm (50) 4K Ultra HD Smart LED Google TV 50H5E'),(11,'LG 126','LG',39999,'TV','Active','lg.jpg','cms (50 inches) NU87 AI Series Nano 4K Ultra HD Smart webOS VA LED TV 50NU870BPLA'),(12,'Samsung 50 inches','Samsung',37490,'TV','Active','sum.jpg','Crystal UHD 4K Samsung Vision AI Smart TV UA50UE83AHULXL'),(13,'Philips 127 cm','Philips ',34999,'TV','Active','philips.jpg','(50 inches) 8100 Series 4K Ultra HD Smart QLED Google TV 50PQT8100/94'),(14,'Sony 126  cm','Sony ',62990,'TV','Active','sony.jpg','(50 inches) BRAVIA 2M2 Series 4K Ultra HD Smart LED Google TV K-50S22BM2\r\n'),(15,'Toshiba 126 cm','Toshiba ',32990,'TV','Active','Toshiba.jpg','(50 Inches) 4K Ultra HD Smart QLED TV | Dolby Atmos, HDR10+ | 24W Powerful Speakers | AI Sports Mode | REGZA Engine ZR | Voice Control | AI 4K Upscaling | VIDAA OS | 50M450RP (Black)'),(16,'TCL 126 cm','TCL ',29999,'TV','Active','TCL.jpg','(50 inches) Metallic Bezel-Less, FHD Smart QLED Google TV 50S5K'),(17,'Samsung 138 cm','Samsung ',43999,'TV','Active','Sum1.jpg','(55 inches) Vision AI 4K Ultra HD Smart QLED TV QA55QEF1AULXL'),(18,'Haier H6E ','Haier ',35990,'TV','Active','Haier.jpg','Series 108cm (43) 4K QLED Ultra HD Smart LED Google TV 43H6E'),(19,'TCL 139 cm','TCL ',42990,'TV','Active','TCL1.jpg','(55 inches) 4K Ultra HD Smart QLED Google TV 55T8C'),(20,'Philips 138 cm','Philips ',45999,'TV','Active','Philips1.jpg','(55 inches) 4K Ultra HD QLED Smart QD-Mini LED Google TV 55MLED610/94');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phno` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Prem Kumar','admin@gmail.com','09471829586','admin'),(2,'VIJAY KUMAR ','Vijay@gmail.com','212121212121','12345678'),(3,'Ram','Ram@gamil.com','234233333','12345'),(4,'22222','pk2335301@gmail.com','222222','1223'),(5,'Aayush','pk2335301@gmail.com','22131231321','1223'),(6,'Pankaj','pankaj@gmail.com','12324344','1223'),(7,'Rahul kumar ','Rahulkr12@gmail.com','2398765678','44444'),(8,'Harsh','Harsh@gmail.com','222233333','4321'),(9,'Pankaj Kumar','Pankaj2@gmail.com','9875747474','123'),(10,'Aman','Aman@gmail','88888888','1234'),(11,'customer1','customer1@gmail.com','1200000012','pass');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-01 16:55:26
