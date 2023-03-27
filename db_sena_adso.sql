-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: db_sena_adso
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `tbl_accesorio`
--

DROP TABLE IF EXISTS `tbl_accesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_accesorio` (
  `id_accesorio` bigint NOT NULL AUTO_INCREMENT,
  `id_equipo` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `serial_proveedor` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(150) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_accesorio`),
  KEY `fk_equipo` (`id_equipo`),
  KEY `fk_estado` (`id_estado`),
  CONSTRAINT `fk_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `tbl_equipo` (`id_equipo`),
  CONSTRAINT `fk_estado` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accesorio`
--

LOCK TABLES `tbl_accesorio` WRITE;
/*!40000 ALTER TABLE `tbl_accesorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_accesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_area`
--

DROP TABLE IF EXISTS `tbl_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_area` (
  `id_area` bigint NOT NULL AUTO_INCREMENT,
  `id_mapa` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_area`),
  KEY `fk_mapa` (`id_mapa`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_estado_1` (`id_estado`),
  CONSTRAINT `fk_estado_1` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_mapa` FOREIGN KEY (`id_mapa`) REFERENCES `tbl_mapa` (`id_mapa`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_area`
--

LOCK TABLES `tbl_area` WRITE;
/*!40000 ALTER TABLE `tbl_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empresa`
--

DROP TABLE IF EXISTS `tbl_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empresa` (
  `id_empresa` bigint NOT NULL AUTO_INCREMENT,
  `id_estado` bigint NOT NULL,
  `nit` varchar(300) NOT NULL,
  `razon_social` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_estado_2` (`id_estado`),
  CONSTRAINT `fk_estado_2` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empresa`
--

LOCK TABLES `tbl_empresa` WRITE;
/*!40000 ALTER TABLE `tbl_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_equipo`
--

DROP TABLE IF EXISTS `tbl_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_equipo` (
  `id_equipo` bigint NOT NULL AUTO_INCREMENT,
  `id_proveedor` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `serial_proveedor` varchar(150) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `serial_fabrica` varchar(150) DEFAULT NULL,
  `placa_madre` varchar(150) DEFAULT NULL,
  `procesador` varchar(150) DEFAULT NULL,
  `memoria_ram` varchar(150) DEFAULT NULL,
  `almacenamiento` varchar(100) DEFAULT NULL,
  `tajeta_grafica` varchar(150) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_equipo`),
  KEY `fk_proveedor` (`id_proveedor`),
  KEY `fk_estado_3` (`id_estado`),
  CONSTRAINT `fk_estado_3` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_equipo`
--

LOCK TABLES `tbl_equipo` WRITE;
/*!40000 ALTER TABLE `tbl_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado` (
  `id_estado` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES (1,'Activo','El usuario esta activo','2023-03-07 05:51:08','2023-03-07 05:51:08','2023-03-07 05:51:08');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mapa`
--

DROP TABLE IF EXISTS `tbl_mapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mapa` (
  `id_mapa` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mapa`),
  KEY `fk_usuario_1` (`id_usuario`),
  KEY `fk_estado_4` (`id_estado`),
  CONSTRAINT `fk_estado_4` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mapa`
--

LOCK TABLES `tbl_mapa` WRITE;
/*!40000 ALTER TABLE `tbl_mapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perfil`
--

DROP TABLE IF EXISTS `tbl_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_perfil` (
  `id_perfil` bigint NOT NULL AUTO_INCREMENT,
  `id_estado` bigint NOT NULL,
  `perfil` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `permisos` varchar(600) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perfil`),
  UNIQUE KEY `perfil` (`perfil`),
  KEY `fk_estado_5` (`id_estado`),
  CONSTRAINT `fk_estado_5` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perfil`
--

LOCK TABLES `tbl_perfil` WRITE;
/*!40000 ALTER TABLE `tbl_perfil` DISABLE KEYS */;
INSERT INTO `tbl_perfil` VALUES (1,1,'SuperUsuario','Tiene todos los permisos','TODO',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reingreso`
--

DROP TABLE IF EXISTS `tbl_reingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reingreso` (
  `id_ueu` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ueu`),
  KEY `fk_usuario_2` (`id_usuario`),
  KEY `fk_estado_6` (`id_estado`),
  CONSTRAINT `fk_estado_6` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_2` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reingreso`
--

LOCK TABLES `tbl_reingreso` WRITE;
/*!40000 ALTER TABLE `tbl_reingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reporte`
--

DROP TABLE IF EXISTS `tbl_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reporte` (
  `id_reporte` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint DEFAULT NULL,
  `reporte` varchar(150) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reporte`),
  KEY `fk_usuario_3` (`id_usuario`),
  CONSTRAINT `fk_usuario_3` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reporte`
--

LOCK TABLES `tbl_reporte` WRITE;
/*!40000 ALTER TABLE `tbl_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicio`
--

DROP TABLE IF EXISTS `tbl_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_servicio` (
  `id_servicio` bigint NOT NULL AUTO_INCREMENT,
  `id_empresa` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_equipo` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_empresa` (`id_empresa`),
  KEY `fk_usuario_5` (`id_usuario`),
  KEY `fk_equipo_1` (`id_equipo`),
  KEY `fk_estado_7` (`id_estado`),
  CONSTRAINT `fk_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `tbl_empresa` (`id_empresa`),
  CONSTRAINT `fk_equipo_1` FOREIGN KEY (`id_equipo`) REFERENCES `tbl_equipo` (`id_equipo`),
  CONSTRAINT `fk_estado_7` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_5` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_servicio`
--

LOCK TABLES `tbl_servicio` WRITE;
/*!40000 ALTER TABLE `tbl_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_documento`
--

DROP TABLE IF EXISTS `tbl_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_documento` (
  `id_td` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_td`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_documento`
--

LOCK TABLES `tbl_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_documento` DISABLE KEYS */;
INSERT INTO `tbl_tipo_documento` VALUES (1,'cedula','cedula','2023-03-11 19:15:44','2023-03-11 19:15:44','2023-03-11 19:15:44');
/*!40000 ALTER TABLE `tbl_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_traslado`
--

DROP TABLE IF EXISTS `tbl_traslado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_traslado` (
  `id_ueu` bigint NOT NULL AUTO_INCREMENT,
  `id_estado` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `acceso_remoto` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ueu`),
  KEY `fk_estado_8` (`id_estado`),
  KEY `fk_usuario_4` (`id_usuario`),
  CONSTRAINT `fk_estado_8` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_4` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_traslado`
--

LOCK TABLES `tbl_traslado` WRITE;
/*!40000 ALTER TABLE `tbl_traslado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_traslado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_traslado_accesorio_reingreso`
--

DROP TABLE IF EXISTS `tbl_traslado_accesorio_reingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_traslado_accesorio_reingreso` (
  `id_tar` bigint NOT NULL AUTO_INCREMENT,
  `id_ueu` bigint NOT NULL,
  `id_accesorio` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tar`),
  KEY `fk_ueu` (`id_ueu`),
  KEY `fk_accesorio` (`id_accesorio`),
  KEY `fk_estado_9` (`id_estado`),
  CONSTRAINT `fk_accesorio` FOREIGN KEY (`id_accesorio`) REFERENCES `tbl_accesorio` (`id_accesorio`),
  CONSTRAINT `fk_estado_9` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_ueu` FOREIGN KEY (`id_ueu`) REFERENCES `tbl_usuario_equipo_ubicacion` (`id_ueu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_traslado_accesorio_reingreso`
--

LOCK TABLES `tbl_traslado_accesorio_reingreso` WRITE;
/*!40000 ALTER TABLE `tbl_traslado_accesorio_reingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_traslado_accesorio_reingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ubicacion`
--

DROP TABLE IF EXISTS `tbl_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ubicacion` (
  `id_ubicacion` bigint NOT NULL AUTO_INCREMENT,
  `id_area` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `posicion` varchar(100) NOT NULL,
  `cardinalidad` varchar(100) NOT NULL,
  `punto_red` varchar(150) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ubicacion`),
  KEY `fk_area` (`id_area`),
  KEY `fk_usuario_6` (`id_usuario`),
  KEY `fk_estado_10` (`id_estado`),
  CONSTRAINT `fk_area` FOREIGN KEY (`id_area`) REFERENCES `tbl_area` (`id_area`),
  CONSTRAINT `fk_estado_10` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_6` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ubicacion`
--

LOCK TABLES `tbl_ubicacion` WRITE;
/*!40000 ALTER TABLE `tbl_ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `id_perfil` bigint NOT NULL,
  `id_td` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `correo` varchar(300) DEFAULT NULL,
  `clave` varchar(400) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_perfil` (`id_perfil`),
  KEY `fk_td` (`id_td`),
  KEY `fk_estado_11` (`id_estado`),
  CONSTRAINT `fk_estado_11` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `tbl_perfil` (`id_perfil`),
  CONSTRAINT `fk_td` FOREIGN KEY (`id_td`) REFERENCES `tbl_tipo_documento` (`id_td`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (28,1,1,1,'Pedro','Pascal','54353','pedro@htomail.com','manqueca','2023-03-16 23:02:57','2023-03-16 23:02:57','2023-03-16 23:02:57'),(33,1,1,1,'Estiven','Pinillo',NULL,'estivenpinillo@hotmail.com','estiven1234','2023-03-26 17:56:01','2023-03-26 17:56:01','2023-03-26 17:56:01'),(34,1,1,1,'Juan','sanchez',NULL,'juan@hotmail.com','12345','2023-03-26 18:09:36','2023-03-26 18:09:36','2023-03-26 18:09:36'),(35,1,1,1,'Pedro Juan','Pascal',NULL,'juanpedro@hotmail.com','juanpedro1234','2023-03-26 22:36:41','2023-03-26 22:36:41','2023-03-26 22:36:41');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_equipo_ubicacion`
--

DROP TABLE IF EXISTS `tbl_usuario_equipo_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario_equipo_ubicacion` (
  `id_ueu` bigint NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint NOT NULL,
  `id_equipo` bigint NOT NULL,
  `id_estado` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ueu`),
  KEY `fk_usuario_7` (`id_usuario`),
  KEY `fk_equipo_2` (`id_equipo`),
  KEY `fk_estado_12` (`id_estado`),
  CONSTRAINT `fk_equipo_2` FOREIGN KEY (`id_equipo`) REFERENCES `tbl_equipo` (`id_equipo`),
  CONSTRAINT `fk_estado_12` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id_estado`),
  CONSTRAINT `fk_usuario_7` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_equipo_ubicacion`
--

LOCK TABLES `tbl_usuario_equipo_ubicacion` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_equipo_ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_equipo_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-26 22:31:48
