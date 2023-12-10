-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: metro_cdmx
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `driver_active`
--

DROP TABLE IF EXISTS `driver_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_active` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `driver_active_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_active`
--

LOCK TABLES `driver_active` WRITE;
/*!40000 ALTER TABLE `driver_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines`
--

DROP TABLE IF EXISTS `lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `color` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines`
--

LOCK TABLES `lines` WRITE;
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` VALUES
(1,'Linea 1','Rosa','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(2,'Linea 2','Azul','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(3,'Linea 3','Verde olivo','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(4,'Linea 4','Cian','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(5,'Linea 5','Amarillo','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(6,'Linea 6','Rojo','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(7,'Linea 7','Naranja','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(8,'Linea 8','Verde','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(9,'Linea 9','Cafe','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(10,'Linea A','Morado','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(11,'Linea B','Verde y gris','2023-11-28 18:37:15','2023-11-28 18:37:15'),
(12,'Linea 12','Oro','2023-11-28 18:37:15','2023-11-28 18:37:15');
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines_stations`
--

DROP TABLE IF EXISTS `lines_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines_stations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `line_id` bigint(20) unsigned NOT NULL,
  `station_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `lines_stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `lines_stations_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines_stations`
--

LOCK TABLES `lines_stations` WRITE;
/*!40000 ALTER TABLE `lines_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lines_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` bigint(20) unsigned NOT NULL,
  `location` point NOT NULL,
  `created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `crated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES
(1,'Lázaro Cárdenas','2023-11-28 18:46:23','2023-11-28 19:02:25'),
(2,'Ferrería','2023-11-28 18:46:23','2023-11-28 19:03:10'),
(3,'Pantitlán','2023-11-28 18:46:23','2023-11-28 19:03:28'),
(4,'Tacuba','2023-11-28 18:46:23','2023-11-28 19:03:47'),
(5,'Martín Carrera','2023-11-28 18:46:23','2023-11-28 19:04:07'),
(6,'Santa Anita','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(7,'Villa de Aragón','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(8,'Tezozómoc','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(9,'Tecnológico','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(10,'Colegio Militar','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(11,'Chapultepec','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(12,'Calle 11','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(13,'Constitución de 1917','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(14,'Copilco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(15,'Talismán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(16,'Terminal Aérea','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(17,'Tepito','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(18,'Hospital 20 de Nov.','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(19,'Eugenia','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(20,'Lomas Estrella','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(21,'Tlatelolco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(22,'Atlalilco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(23,'Blvd. Puerto Aéreo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(24,'Chilpancingo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(25,'Ciudad Azteca','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(26,'Niños Héroes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(27,'Popotla','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(28,'San Joaquín','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(29,'Universidad','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(30,'Instituto del Petróleo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(31,'Escuadrón 201','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(32,'Iztacalco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(33,'Juárez','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(34,'Chabacano','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(35,'Azcapotzalco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(36,'Bosque de Aragón','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(37,'Tlaltenco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(38,'Jamaica','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(39,'Oceanía','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(40,'Iztapalapa','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(41,'Mixhuca','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(42,'Centro Médico','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(43,'Balderas','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(44,'Salto del Agua','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(45,'Insurgentes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(46,'Guelatao','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(47,'Morelos','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(48,'Moctezuma','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(49,'Normal','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(50,'Zapata','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(51,'Zaragoza','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(52,'La Raza','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(53,'Constituyentes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(54,'Múzquiz','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(55,'Romero Rubio','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(56,'San Cosme','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(57,'Portales','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(58,'Puebla','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(59,'Santa Marta','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(60,'Tasqueña','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(61,'Xola','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(62,'Canal del Norte','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(63,'Buenavista','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(64,'Balbuena','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(65,'Ermita','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(66,'Aragón','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(67,'Deportivo 18 de Marzo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(68,'Auditorio','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(69,'Culhuacán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(70,'El Rosario','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(71,'Guerrero','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(72,'Hospital General','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(73,'Fray Servando','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(74,'Patriotismo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(75,'Observatorio','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(76,'La Paz','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(77,'Valle Gómez','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(78,'Tezonco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(79,'Candelaria','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(80,'Aquiles Serdán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(81,'La Viga','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(82,'Olímpica','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(83,'Mexicaltzingo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(84,'Politécnico','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(85,'Periférico Ote','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(86,'San Lázaro','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(87,'San Antonio','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(88,'Zapotitlán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(89,'Tláhuac','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(90,'Hidalgo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(91,'Etiopía / Plaza de la Transpatencia','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(92,'Deportivo Oceanía','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(93,'Impulsora','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(94,'Consulado','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(95,'Camarones','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(96,'Allende','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(97,'San Juan de Letrán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(98,'Viaducto','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(99,'Vallejo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(100,'Doctores','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(101,'Los Reyes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(102,'Bellas Artes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(103,'Autobuses del Norte','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(104,'Acatitla','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(105,'Revolución','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(106,'Polanco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(107,'San Andrés Tomatlán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(108,'Garibaldi','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(109,'Eduardo Molina','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(110,'Coyuya','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(111,'Coyoacán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(112,'Norte 45','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(113,'Lindavista','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(114,'Tacubaya','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(115,'Mixcoac','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(116,'Hangares','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(117,'Nopalera','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(118,'UAM-I','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(119,'Velódromo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(120,'Cuauhtémoc','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(121,'Apatlaco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(122,'Aculco','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(123,'Agrícola Oriental','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(124,'Eje Central','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(125,'Pino Suárez','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(126,'Río de los Remedios','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(127,'Potrero','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(128,'Sevilla','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(129,'General Anaya','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(130,'Indios Verdes','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(131,'La Villa - Basílica','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(132,'Parque de los Venados','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(133,'Juanacatlán','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(134,'Nativitas','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(135,'Misterios','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(136,'Barranca del Muerto','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(137,'Miguel Ángel de Quevedo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(138,'Lagunilla','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(139,'Olivos','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(140,'Tepalcates','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(141,'Zócalo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(142,'Gómez Farías','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(143,'San Pedro de Los Pinos','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(144,'Refinería','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(145,'Villa de Cortés','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(146,'R. Flores Magón','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(147,'Insurgentes Sur','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(148,'Viveros','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(149,'Cerro de la Estrella','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(150,'Bondojito','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(151,'Canal de San Juan','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(152,'San Antonio Abad','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(153,'Obrera','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(154,'Plaza Aragón','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(155,'Panteones','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(156,'Peñón Viejo','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(157,'División del Norte','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(158,'Cuitláhuac','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(159,'Ciudad Deportiva','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(160,'Cuatro Caminos','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(161,'Isabel la Católica','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(162,'Nezahualcóyotl','2023-11-28 18:46:23','2023-11-28 18:58:29'),
(163,'Merced','2023-11-28 18:46:23','2023-11-28 18:58:29');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trains` (
  `serial_number` varchar(10) NOT NULL,
  `line_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `year` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`serial_number`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES
('0JFxafE4q8',1,1,1963,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('2e5v4FHs0T',3,2,1984,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('5xPdsZ1x9L',3,2,1948,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('7csbz2qteT',1,1,1971,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('8PwCI0CC6n',4,1,1990,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('9ilxeEwlnH',4,2,1994,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('aWDpmlRsOG',4,2,1998,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('ax5jrpNIWG',4,2,1952,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('B83fPCVFbH',1,1,1990,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Bv1MN0DuUm',2,2,1952,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('D9m2gBhBJw',2,1,1969,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('EDUumFCvJl',2,1,1967,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('ejN3a4CsDC',3,2,1997,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('f49Bk0GzBi',4,2,1967,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Ge92a6hVX8',3,2,1967,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Huz9yGcao5',2,1,1980,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Hvhw9vxUaH',3,1,1983,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('JO5UinVh7B',2,1,1956,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('MPbPGQfWxT',2,2,1982,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('mS0SY0eScA',3,2,1986,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('oCut3fDYXE',3,2,1987,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('oRyT0nwjUn',2,1,1988,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('OtmhQxSRpS',3,2,1956,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Pazz9JGCbJ',1,2,1988,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('pBnf2N5Ncc',4,1,1981,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('pMldxCQ2sS',3,1,1984,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('q92m0d8aWM',1,1,1979,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('QJ22USb3ry',2,1,1949,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('rnpVQQPs5b',4,1,1984,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('S06Q7kXYrP',1,1,1990,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('s0QypBy7cJ',2,2,1958,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('S6R4dX4THI',2,2,1994,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('t8HhPpvYbU',1,2,1996,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('U9xuOQl3kh',3,1,1982,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('uibQ7F5VE7',4,1,1961,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Uj5G2Bodtk',4,2,1985,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('VjPElNnH29',3,2,1964,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('vOv1sCgHoa',1,1,1947,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('VViBQInzq3',4,2,1959,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('wGweNe36QH',1,2,1987,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Wh09mwE4yn',4,1,1968,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('XE89MYo0IU',3,1,1986,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('Z5qAgGpFTj',1,1,1971,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('ZbX2yY5Wyz',1,2,1966,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('zeaEgOCuYl',2,2,1997,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('ZHA4kQokXG',2,1,1977,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('zpO3I3tS4e',1,2,1995,'2023-11-28 18:47:07','2023-11-28 18:47:07'),
('zpYnPq7vmN',4,2,1976,'2023-11-28 18:47:07','2023-11-28 18:47:07');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 18:27:47
