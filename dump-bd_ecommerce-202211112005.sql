-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `foto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbyh5eextelhhs5gyxj7giuspd` (`foto_id`),
  CONSTRAINT `FKbyh5eextelhhs5gyxj7giuspd` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Hogar',_binary '',10),(2,'Farmacia',_binary '',11),(3,'Restaurante',_binary '',13),(4,'Ferreteria',_binary '',12);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `direccion_envio` varchar(500) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `num_doc` varchar(11) DEFAULT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `tipo_doc` varchar(20) DEFAULT NULL,
  `foto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKorx40wtfkkqg46bht8mt4vb3a` (`foto_id`),
  CONSTRAINT `FKorx40wtfkkqg46bht8mt4vb3a` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,'Alba','Forero','Cundinamarca','Avenida Siempre','Engativa','Jean','123456','Bogota','654321','CC',1),(3,'forero','forero','Lambayeque','asdf','Ferreñafe','jorge','55555','Chiclayo','55556','DNI',2),(4,'alba','foreroo','Lambayeque','asdas','Ferreñafe','jorge','55556','Chiclayo','55559','DNI',6);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `pedido_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqo6dpjql5wwuhf11fouj94gdh` (`item_id`),
  KEY `FKgqvba9e7dildyw45u0usdj1k2` (`pedido_id`),
  CONSTRAINT `FKgqvba9e7dildyw45u0usdj1k2` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FKqo6dpjql5wwuhf11fouj94gdh` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,6500,1,1),(2,1,8500,2,1),(3,3,8500,2,2),(4,1,8500,2,3),(5,2,8500,2,4),(6,2,4500,3,4),(7,8,8500,2,5);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_almacenado`
--

DROP TABLE IF EXISTS `documento_almacenado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento_almacenado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eliminado` bit(1) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_almacenado`
--

LOCK TABLES `documento_almacenado` WRITE;
/*!40000 ALTER TABLE `documento_almacenado` DISABLE KEYS */;
INSERT INTO `documento_almacenado` VALUES (1,_binary '\0','A','.jpg','468bc133-4b68-4a20-8d8d-ac6463d962fe','jean'),(2,_binary '\0','A','.jpg','86672ff9-464a-4519-a889-bad6f26773ef','profilePh8122022194053'),(3,_binary '\0','A','.jpg','7b7cba3c-adde-4353-bfd6-4d7576c772c1','profilePh8122022194252'),(4,_binary '\0','A','.jpg','9de06d34-1783-4808-bc2a-78c701b72ded','profilePh8122022194322'),(5,_binary '\0','A','.jpg','d61dbbee-b82b-4f3d-9a1d-6d6af6278da7','profilePh8122022194432'),(6,_binary '\0','A','.jpg','f9aeedc7-a6f1-40ce-8a8b-1b227e460dd1','profilePh8122022194449'),(7,_binary '\0','A','.jpg','93dd493e-4916-4467-8bf7-3d74603df1c5','profilePh8122022194525'),(8,_binary '\0','A','.jpg','79a1085d-0c0b-4f5f-b9a0-da003c064d19','profilePh8122022194539'),(9,_binary '\0','A','.jpg','fccdf875-74f8-4cf4-839e-912ea97b6991','profilePh812202219461'),(10,_binary '\0','A','.jpg','ea6bd6d8-8ac3-409e-8852-452c89311ab3','hogarcat'),(11,_binary '\0','A','.jpg','0da980a2-e6c9-43d0-9c9a-1b9378b5eb21','farmaciacat'),(12,_binary '\0','A','.jpg','8822a26b-a659-412d-ab22-e3ce9204aae1','ferreteriacat'),(13,_binary '\0','A','.jpg','e8232d4f-9c7f-498b-90f5-532584168557','restaurantecat'),(14,_binary '\0','A','.png','180b546e-2921-4fde-b5aa-bf067b8e3565','limpiavidrios'),(15,_binary '\0','A','.jpg','a8585294-e056-4d1c-b4c8-125ac632c4ce','escoba'),(16,_binary '\0','A','.png','a529202e-0023-4fe3-a3e6-15b0b429b7b4','acetaminofen'),(17,_binary '\0','A','.png','496386ba-ce45-46ea-9d87-d4bad637f50a','perro'),(18,_binary '\0','A','.png','12ceca9e-d9ae-4c74-a82e-39c49dc6c968','comboperro'),(19,_binary '\0','A','.jpg','09672b49-8a0b-4142-be4e-068fb723a203','hamburguesa'),(20,_binary '\0','A','.jpg','75c63aca-de9a-4e4c-8992-19eeec200196','combohamburguesa'),(21,_binary '\0','A','.jpg','1dbcd115-2194-49eb-973a-49f86ae9dcc9','pizza'),(22,_binary '\0','A','.jpg','b7c92e75-9d0d-49ae-97f2-eb8c9bc072de','gaseosa'),(23,_binary '\0','A','.jpg','51c179ed-bfff-40b3-b1ad-8a8591a05027','combopizza');
/*!40000 ALTER TABLE `documento_almacenado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion_item` varchar(500) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `recomendado` bit(1) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `foto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgunwc9qk1hc1yt3qk6urk2gfh` (`categoria_id`),
  KEY `FK4bwtfto5mqr0pyoipqrvfbtmh` (`foto_id`),
  CONSTRAINT `FK4bwtfto5mqr0pyoipqrvfbtmh` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`),
  CONSTRAINT `FKgunwc9qk1hc1yt3qk6urk2gfh` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Limpiador de vidrios Suramar','Limpiavidrios',6500,_binary '\0',20,_binary '',1,14),(2,'Escoba Fuller','Escoba',8500,_binary '',-4,_binary '',1,15),(3,'Acetaminofen MK','Acetaminofen',4500,_binary '',8,_binary '',2,16),(4,'Perro Caliente','Perro Caliente',12500,_binary '',10,_binary '',3,17),(5,'Combo Perro','Combo Perro',12500,_binary '',10,_binary '',3,18),(6,'Hmaburguesa','hamburuesa',12500,_binary '',10,_binary '',3,19),(7,'Combo Hamburguesa','Combo Hamburguesa',19500,_binary '',10,_binary '',3,20),(8,'Gaseosa 400 ml Coca Cola','Gaseosa 400 ml',4500,_binary '\0',100,_binary '',3,22),(9,'Pizza','Pizza',6500,_binary '\0',100,_binary '',3,21),(10,'Combo Pizza','Combo Pizza',9500,_binary '',100,_binary '',3,23);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `anular_pedido` bit(1) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  CONSTRAINT `FK30s8j2ktpay6of18lbyqn3632` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,_binary '','2022-11-10 15:16:32',15000,2),(2,_binary '\0','2022-11-11 09:54:52',25500,2),(3,_binary '\0','2022-11-11 10:11:11',8500,2),(4,_binary '\0','2022-11-11 10:45:39',26000,2),(5,_binary '\0','2022-11-11 11:13:44',68000,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp3dqdf5mc3lqr5y9p3b0omjl9` (`cliente_id`),
  CONSTRAINT `FKp3dqdf5mc3lqr5y9p3b0omjl9` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'123456','jf@gmail.com',_binary '',2),(2,'123456','jorge',_binary '',3),(3,'123456','jorge2',_binary '',4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11 20:05:40
