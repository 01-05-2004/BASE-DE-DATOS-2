CREATE DATABASE  IF NOT EXISTS `bdHotelHG` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdHotelHG`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdHotelHG
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `checkin_hg`
--

DROP TABLE IF EXISTS `checkin_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin_hg` (
  `id_checkin` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `fecha_checkin` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_checkin`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `checkin_hg_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva_hg` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin_hg`
--

LOCK TABLES `checkin_hg` WRITE;
/*!40000 ALTER TABLE `checkin_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_hg`
--

DROP TABLE IF EXISTS `checkout_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_hg` (
  `id_checkout` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `fecha_checkout` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_checkout`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `checkout_hg_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva_hg` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_hg`
--

LOCK TABLES `checkout_hg` WRITE;
/*!40000 ALTER TABLE `checkout_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_hg`
--

DROP TABLE IF EXISTS `cliente_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_hg` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_hg`
--

LOCK TABLES `cliente_hg` WRITE;
/*!40000 ALTER TABLE `cliente_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion_hg`
--

DROP TABLE IF EXISTS `habitacion_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion_hg` (
  `id_habitacion` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) NOT NULL,
  `id_hotel` int NOT NULL,
  `id_tipo_habitacion` int NOT NULL,
  PRIMARY KEY (`id_habitacion`),
  KEY `id_hotel` (`id_hotel`),
  KEY `id_tipo_habitacion` (`id_tipo_habitacion`),
  CONSTRAINT `habitacion_hg_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel_hg` (`id_hotel`),
  CONSTRAINT `habitacion_hg_ibfk_2` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion_hg` (`id_tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion_hg`
--

LOCK TABLES `habitacion_hg` WRITE;
/*!40000 ALTER TABLE `habitacion_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitacion_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_hg`
--

DROP TABLE IF EXISTS `hotel_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_hg` (
  `id_hotel` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` text,
  PRIMARY KEY (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_hg`
--

LOCK TABLES `hotel_hg` WRITE;
/*!40000 ALTER TABLE `hotel_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_hg`
--

DROP TABLE IF EXISTS `pago_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_hg` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pago`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `pago_hg_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva_hg` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_hg`
--

LOCK TABLES `pago_hg` WRITE;
/*!40000 ALTER TABLE `pago_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_hg`
--

DROP TABLE IF EXISTS `reserva_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_hg` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_habitacion` int NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `estado` enum('Pendiente','Confirmada','Cancelada') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_reserva`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `reserva_hg_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente_hg` (`id_cliente`),
  CONSTRAINT `reserva_hg_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion_hg` (`id_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_hg`
--

LOCK TABLES `reserva_hg` WRITE;
/*!40000 ALTER TABLE `reserva_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_servicio_hg`
--

DROP TABLE IF EXISTS `reserva_servicio_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_servicio_hg` (
  `id_reserva_servicio` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_servicio` int NOT NULL,
  PRIMARY KEY (`id_reserva_servicio`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `reserva_servicio_hg_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva_hg` (`id_reserva`),
  CONSTRAINT `reserva_servicio_hg_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_hg` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_servicio_hg`
--

LOCK TABLES `reserva_servicio_hg` WRITE;
/*!40000 ALTER TABLE `reserva_servicio_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_servicio_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_hg`
--

DROP TABLE IF EXISTS `servicio_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_hg` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_hg`
--

LOCK TABLES `servicio_hg` WRITE;
/*!40000 ALTER TABLE `servicio_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa_hg`
--

DROP TABLE IF EXISTS `tarifa_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifa_hg` (
  `id_tarifa` int NOT NULL AUTO_INCREMENT,
  `id_tipo_habitacion` int NOT NULL,
  `id_temporada` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_tarifa`),
  KEY `id_tipo_habitacion` (`id_tipo_habitacion`),
  KEY `id_temporada` (`id_temporada`),
  CONSTRAINT `tarifa_hg_ibfk_1` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion_hg` (`id_tipo_habitacion`),
  CONSTRAINT `tarifa_hg_ibfk_2` FOREIGN KEY (`id_temporada`) REFERENCES `temporada_hg` (`id_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa_hg`
--

LOCK TABLES `tarifa_hg` WRITE;
/*!40000 ALTER TABLE `tarifa_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarifa_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada_hg`
--

DROP TABLE IF EXISTS `temporada_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporada_hg` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_temporada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada_hg`
--

LOCK TABLES `temporada_hg` WRITE;
/*!40000 ALTER TABLE `temporada_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporada_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_habitacion_hg`
--

DROP TABLE IF EXISTS `tipo_habitacion_hg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_habitacion_hg` (
  `id_tipo_habitacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_tipo_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion_hg`
--

LOCK TABLES `tipo_habitacion_hg` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion_hg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_habitacion_hg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdHotelHG'
--

--
-- Dumping routines for database 'bdHotelHG'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-14 16:17:54
