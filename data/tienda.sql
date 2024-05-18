CREATE DATABASE  IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tienda`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Procesadores',1),(2,'Memorias',2),(3,'Discos Duros',3);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES ('01','AMAZONAS',NULL),('02','ANCASH',NULL),('03','APURIMAC',NULL),('04','AREQUIPA',NULL),('05','AYACUCHO',NULL),('06','CAJAMARCA',NULL),('07','CALLAO',NULL),('08','CUSCO',NULL),('09','HUANCAVELICA',NULL),('10','HUANUCO',NULL),('11','ICA',NULL),('12','JUNIN',NULL),('13','LA LIBERTAD',NULL),('14','LAMBAYEQUE',NULL),('15','LIMA',NULL),('16','LORETO',NULL),('17','MADRE DE DIOS',NULL),('18','MOQUEGUA',NULL),('19','PASCO',NULL),('20','PIURA',NULL),('21','PUNO',NULL),('22','SAN MARTIN',NULL),('23','TACNA',NULL),('24','TUMBES',NULL),('25','UCAYALI',NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distritos` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `provincias_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaemv7lng1ylotxc86576vibf9` (`provincias_id`),
  CONSTRAINT `FKaemv7lng1ylotxc86576vibf9` FOREIGN KEY (`provincias_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(1) NOT NULL DEFAULT 'P' COMMENT 'P: Pedido\nR: Reparto\nE: Entregado\nC: Cancelado\nA: Anulado',
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_usuarios1_idx` (`usuarios_id`),
  CONSTRAINT `fk_pedidos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_has_productos`
--

DROP TABLE IF EXISTS `pedidos_has_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_has_productos` (
  `pedidos_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pedidos_id`,`productos_id`),
  KEY `fk_pedidos_has_productos_productos1_idx` (`productos_id`),
  KEY `fk_pedidos_has_productos_pedidos1_idx` (`pedidos_id`),
  CONSTRAINT `fk_pedidos_has_productos_pedidos1` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_productos_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_has_productos`
--

LOCK TABLES `pedidos_has_productos` WRITE;
/*!40000 ALTER TABLE `pedidos_has_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_has_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorias_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `imagen_nombre` varchar(255) DEFAULT NULL,
  `imagen_tipo` varchar(100) DEFAULT NULL,
  `imagen_tamanio` int(10) DEFAULT NULL,
  `creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(1) NOT NULL DEFAULT '1',
  `detalles` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_categorias_idx` (`categorias_id`),
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Intel Core I7','Procesador Intel Core I7-8700 Lga 1151 8va',1479.99,6,NULL,NULL,NULL,'2019-12-07 22:18:05','1',NULL,NULL),(2,2,'Kingstone','Kingstone 64GB DDR3',80.00,12,NULL,NULL,NULL,'2019-12-08 12:54:57','1',NULL,NULL),(12,1,'ihpone 9','Test',2000.00,6,'1576349354337.jpg',NULL,NULL,'2019-12-14 18:49:14','1',NULL,NULL),(16,1,'Amd','Test',223.00,12,'1577030508343.jpg',NULL,NULL,'2019-12-22 16:01:48','1',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `departamentos_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr5cuwyw9xefibk0bs8ij8d0jh` (`departamentos_id`),
  CONSTRAINT `FKr5cuwyw9xefibk0bs8ij8d0jh` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Ventas'),(3,'Almacen');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecnacimiento` date DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `distritos_id` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_roles1_idx` (`roles_id`),
  KEY `test_idx` (`distritos_id`),
  CONSTRAINT `FKkp7c2owr37h9po5jh6pa30mfc` FOREIGN KEY (`distritos_id`) REFERENCES `distritos` (`id`),
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'ebenites@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Erick','Benites','M','1990-05-08','954658512','Av. Peru 123','1',NULL,NULL,NULL,NULL,NULL),(2,2,'jaraujo@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Janeth','Araujo','F',NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL),(3,3,'jflores@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Jorge','Flores','M',NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL),(4,2,'jfarfan@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Jaime','Farfan','M','2019-10-09','3258545','Av. Cascanueces 2221 Santa Anita','1',NULL,NULL,NULL,NULL,NULL),(5,1,'erick.benites@gmail.com','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Erick','Benites','M','2019-12-02','3258545','Av. Cascanueces 2221 Santa Anita','1',NULL,NULL,NULL,NULL,NULL),(6,2,'lmaza@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Luis','Maza','M','2019-12-10','3258545','Av. Cascanueces 2221 Santa Anita','1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-11 14:50:00
