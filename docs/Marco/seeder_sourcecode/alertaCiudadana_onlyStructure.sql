CREATE DATABASE  IF NOT EXISTS `bd_alertaciudadana` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_alertaciudadana`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_alertaciudadana
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `ix_categorias_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` varchar(500) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `incidente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `incidente_id` (`incidente_id`),
  KEY `ix_comentarios_id` (`id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`incidente_id`) REFERENCES `incidentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentes`
--

DROP TABLE IF EXISTS `incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL,
  `estado` enum('pendiente','en_revision','atendido','descartado') DEFAULT NULL,
  `fecha_reporte` datetime DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `ix_incidentes_id` (`id`),
  CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `incidentes_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentes`
--

LOCK TABLES `incidentes` WRITE;
/*!40000 ALTER TABLE `incidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('ciudadano','admin') NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `ix_usuarios_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_alertaciudadana'
--

--
-- Dumping routines for database 'bd_alertaciudadana'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_categoria`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE categoria_generada VARCHAR(100);

    SET categoria_generada = ELT(fn_numero_aleatorio_rangos(1,7),
        "Seguridad pública",
        "Emergencias",
        "Infraestructura urbana",
        "Servicios públicos",
        "Ruido o molestias vecinales",
        "Medio ambiente",
        "Obras o construcción irregular"
    );

    RETURN categoria_generada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_contrasena_aleatoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_contrasena_aleatoria`(longitud INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE caracteres VARCHAR(255);
    DECLARE contrasena_generada VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    DECLARE indice_aleatorio INT;

    -- Define los caracteres que pueden ser utilizados en la contraseña
    SET caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{}|;:,.<>?';

    -- Genera la contraseña caracter por caracter
    WHILE i < longitud DO
        SET indice_aleatorio = FLOOR(1 + RAND() * LENGTH(caracteres));
        SET contrasena_generada = CONCAT(contrasena_generada, SUBSTRING(caracteres, indice_aleatorio, 1));
        SET i = i + 1;
    END WHILE;

    RETURN contrasena_generada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_generado VARCHAR(100);

    SET nombre_generado = ELT(fn_numero_aleatorio_rangos(1,86),
        "Alejandro", "Sofía", "Diego", "Valentina", "Mateo",
        "Camila", "Sebastián", "Carolina", "Santiago", "Valeria",
        "Daniel", "Mariana", "Gabriel", "Andrea", "Nicolás",
        "Paula", "Emilio", "Daniela", "José", "Isabella",
        "David", "Victoria", "Fernando", "Natalia", "Javier",
        "Sara", "Ricardo", "Laura", "Arturo", "Gabriela",
        "Manuel", "Regina", "Rafael", "Ximena", "Miguel",
        "Ana", "Carlos", "Elena", "Pedro", "Fátima", "Jorge",
        "Luisa", "Juan", "Adriana", "Luis", "Verónica",
        "Roberto", "Clara", "Andrés", "Olivia", "Marco",
        "Gloria", "Felipe", "Alicia", "Eduardo", "Beatriz",
        "Sergio", "Rosa", "Antonio", "Silvia", "Gerardo",
        "Julia", "Esteban", "Patricia", "Mauricio", "Carmen",
        "Héctor", "Lorena", "Oscar", "Mónica", "Benito",
        "Irene", "Alfredo", "Teresa", "Mario", "Cristina",
        "Guillermo", "Susana", "Gonzalo", "Brenda", "Israel",
        "Liliana", "Alberto", "Diana", "Armando", "Jessica");

    RETURN nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(min_val INT, max_val INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(min_val + (RAND() * (max_val - min_val + 1)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_crear_usuarios_aleatorios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_usuarios_aleatorios`(IN cantidad_usuarios INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_correo_electronico VARCHAR(100);
    DECLARE v_contrasena VARCHAR(255);
    DECLARE v_rol ENUM('ciudadano', 'admin') DEFAULT 'ciudadano';
    DECLARE v_nombre_base_correo VARCHAR(100);
    DECLARE v_sufijo_aleatorio INT;
    DECLARE v_existente INT;

    WHILE i < cantidad_usuarios DO
        -- Generar un nombre
        SET v_nombre = fn_genera_nombre();
        SET v_nombre_base_correo = REPLACE(LOWER(v_nombre), ' ', '');

        -- Intentar generar un correo único
        REPEAT
            SET v_sufijo_aleatorio = FLOOR(1000 + (RAND() * 899999));
            SET v_correo_electronico = CONCAT(v_nombre_base_correo, v_sufijo_aleatorio, '@ejemplo.com');

            -- Verificar si ya existe ese correo
            SELECT COUNT(*) INTO v_existente FROM usuarios WHERE correo_electronico = v_correo_electronico;
        UNTIL v_existente = 0
        END REPEAT;

        -- Generar la contraseña
        SET v_contrasena = fn_genera_contrasena_aleatoria(12);

        -- Insertar usuario
        INSERT INTO usuarios (nombre, correo_electronico, contrasena, rol, fecha_creacion)
        VALUES (v_nombre, v_correo_electronico, v_contrasena, v_rol, NOW());

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generar_datos_prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_datos_prueba`(
    IN p_usuarios INT,
    IN p_incidentes INT,
    IN p_comentarios INT
)
BEGIN
    -- Crear usuarios
    CALL sp_crear_usuarios_aleatorios(p_usuarios);
    
    -- Crear incidentes
    CALL sp_insertar_incidentes_aleatorios(p_incidentes);
    
    -- Crear comentarios
    CALL sp_insertar_comentarios_aleatorios(p_comentarios);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_categorias_aleatorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_categorias_aleatorias`()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_descripcion VARCHAR(255);
    DECLARE v_existente INT;

    WHILE i < 7 DO
        -- Obtener categoría específica de la lista usando la función
        SET v_nombre = ELT(i + 1,
            "Seguridad pública",
            "Emergencias",
            "Infraestructura urbana",
            "Servicios públicos",
            "Ruido o molestias vecinales",
            "Medio ambiente",
            "Obras o construcción irregular"
        );

        -- Verificar si ya existe la categoría
        SELECT COUNT(*) INTO v_existente FROM categorias WHERE nombre = v_nombre;

        IF v_existente = 0 THEN
            SET v_descripcion = CONCAT('Descripción de la categoría: ', v_nombre);

            INSERT INTO categorias (nombre, descripcion)
            VALUES (v_nombre, v_descripcion);
        END IF;

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_comentarios_aleatorios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_comentarios_aleatorios`(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_contenido VARCHAR(500);
    DECLARE v_fecha DATETIME;
    DECLARE v_usuario_id INT;
    DECLARE v_incidente_id INT;

    DECLARE v_total_usuarios INT;
    DECLARE v_total_incidentes INT;

    DECLARE v_parte1 VARCHAR(120);
    DECLARE v_parte2 VARCHAR(120);
    DECLARE v_parte3 VARCHAR(180);

    -- Obtener los IDs máximos para seleccionar aleatoriamente
    SELECT MAX(id) INTO v_total_usuarios FROM usuarios;
    SELECT MAX(id) INTO v_total_incidentes FROM incidentes;

    WHILE i < cantidad DO
        -- Parte 1: descripción del incidente
        CASE FLOOR(1 + RAND() * 7)
            WHEN 1 THEN SET v_parte1 = 'El bache que reportaron';
            WHEN 2 THEN SET v_parte1 = 'La luminaria apagada en la calle';
            WHEN 3 THEN SET v_parte1 = 'El árbol caído en la avenida';
            WHEN 4 THEN SET v_parte1 = 'El semáforo descompuesto';
            WHEN 5 THEN SET v_parte1 = 'El encharcamiento en la colonia';
            WHEN 6 THEN SET v_parte1 = 'La fuga de agua que mencionaron';
            WHEN 7 THEN SET v_parte1 = 'El poste dañado';
        END CASE;

        -- Parte 2: estado o comentario
        CASE FLOOR(1 + RAND() * 8)
            WHEN 1 THEN SET v_parte2 = 'sigue sin atenderse';
            WHEN 2 THEN SET v_parte2 = 'ya fue reparado parcialmente';
            WHEN 3 THEN SET v_parte2 = 'cada día está peor';
            WHEN 4 THEN SET v_parte2 = 'ya lo arreglaron, gracias';
            WHEN 5 THEN SET v_parte2 = 'necesita atención urgente';
            WHEN 6 THEN SET v_parte2 = 'afecta a varias familias';
            WHEN 7 THEN SET v_parte2 = 'parece que lo ignoraron';
            WHEN 8 THEN SET v_parte2 = 'ya no representa peligro';
        END CASE;

        -- Parte 3: detalles o emociones
        CASE FLOOR(1 + RAND() * 8)
            WHEN 1 THEN SET v_parte3 = 'por favor vengan a revisarlo.';
            WHEN 2 THEN SET v_parte3 = 'gracias al equipo por la atención.';
            WHEN 3 THEN SET v_parte3 = 'urge solución antes de que ocurra un accidente.';
            WHEN 4 THEN SET v_parte3 = 'varios vecinos estamos preocupados.';
            WHEN 5 THEN SET v_parte3 = 'esperamos que no tarde más.';
            WHEN 6 THEN SET v_parte3 = 'afecta el tránsito de la zona.';
            WHEN 7 THEN SET v_parte3 = 'es la tercera vez que lo reportamos.';
            WHEN 8 THEN SET v_parte3 = 'ojalá lo resuelvan pronto.';
        END CASE;

        -- Construir el comentario completo
        SET v_contenido = CONCAT(v_parte1, ' ', v_parte2, ', ', v_parte3);

        -- Fecha aleatoria en los últimos 15 días
        SET v_fecha = NOW() - INTERVAL FLOOR(RAND() * 15) DAY;

        -- IDs aleatorios
        SET v_usuario_id = FLOOR(1 + RAND() * v_total_usuarios);
        SET v_incidente_id = FLOOR(1 + RAND() * v_total_incidentes);

        -- Insertar comentario
        INSERT INTO comentarios (contenido, fecha, usuario_id, incidente_id)
        VALUES (v_contenido, v_fecha, v_usuario_id, v_incidente_id);

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_incidentes_aleatorios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_incidentes_aleatorios`(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_titulo VARCHAR(100);
    DECLARE v_descripcion VARCHAR(500);
    DECLARE v_imagen VARCHAR(255);
    DECLARE v_latitud FLOAT;
    DECLARE v_longitud FLOAT;
    DECLARE v_estado ENUM('pendiente','en_revision','atendido','descartado');
    DECLARE v_fecha_reporte DATETIME;
    DECLARE v_usuario_id INT;
    DECLARE v_categoria_id INT;
    DECLARE v_categoria_nombre VARCHAR(100);
    DECLARE v_total_usuarios INT DEFAULT 1;
    DECLARE v_total_categorias INT DEFAULT 1;

    -- Obtener máximos existentes con manejo de NULL
    SELECT IFNULL(MAX(id), 1) INTO v_total_usuarios FROM usuarios;
    SELECT IFNULL(MAX(id), 1) INTO v_total_categorias FROM categorias;

    WHILE i < cantidad DO
        SET v_imagen = CONCAT('/img/incidente', FLOOR(1 + (RAND() * 1000)), '.jpg');
        SET v_latitud = 19.0 + (RAND() * 6);
        SET v_longitud = -102.0 + (RAND() * 8);
        SET v_estado = ELT(FLOOR(1 + RAND() * 4), 'pendiente', 'en_revision', 'atendido', 'descartado');
        SET v_fecha_reporte = NOW() - INTERVAL FLOOR(RAND() * 30) DAY;
        SET v_usuario_id = FLOOR(1 + RAND() * v_total_usuarios);
        SET v_categoria_id = FLOOR(1 + RAND() * v_total_categorias);

        -- Obtener nombre categoría con manejo seguro
        SELECT IFNULL(nombre, 'General') INTO v_categoria_nombre 
        FROM categorias 
        WHERE id = v_categoria_id
        LIMIT 1;
        
        -- Título según categoría
        SET v_titulo = CASE 
            WHEN v_categoria_id = 1 THEN 'Reporte de seguridad pública'
            WHEN v_categoria_id = 2 THEN 'Emergencia reportada'
            WHEN v_categoria_id = 3 THEN 'Problema de infraestructura urbana'
            WHEN v_categoria_id = 4 THEN 'Falla en servicios públicos'
            WHEN v_categoria_id = 5 THEN 'Reporte de ruido vecinal'
            WHEN v_categoria_id = 6 THEN 'Incidente ambiental'
            WHEN v_categoria_id = 7 THEN 'Obra irregular reportada'
            ELSE CONCAT('Incidente: ', v_categoria_nombre)
        END;

        -- Descripción natural según la categoría
        SET v_descripcion = CASE 
            WHEN v_categoria_id = 1 THEN ELT(FLOOR(1 + RAND() * 3),
                'Se observó una situación sospechosa en la zona.',
                'Vecinos reportan actividad inusual en la calle.',
                'Se requiere presencia de seguridad en el área.'
            )
            WHEN v_categoria_id = 2 THEN ELT(FLOOR(1 + RAND() * 3),
                'Una persona necesita ayuda médica inmediata.',
                'Se percibió humo en una vivienda cercana.',
                'Se solicita apoyo de bomberos en la zona.'
            )
            WHEN v_categoria_id = 3 THEN ELT(FLOOR(1 + RAND() * 3),
                'La calle presenta un bache de gran tamaño.',
                'Un poste de luz parece estar a punto de caer.',
                'Se detectó daño en la banqueta de la colonia.'
            )
            WHEN v_categoria_id = 4 THEN ELT(FLOOR(1 + RAND() * 3),
                'No hay servicio de agua desde hace horas.',
                'El alumbrado público no está funcionando.',
                'Se presentó un corte de energía en la zona.'
            )
            WHEN v_categoria_id = 5 THEN ELT(FLOOR(1 + RAND() * 3),
                'Los vecinos hacen mucho ruido en la madrugada.',
                'Se escuchan constantes fiestas en la calle.',
                'Reportan música muy fuerte a altas horas.'
            )
            WHEN v_categoria_id = 6 THEN ELT(FLOOR(1 + RAND() * 3),
                'Hay basura acumulada en la vía pública.',
                'Se detectó quema de pasto en la colonia.',
                'El río cercano presenta contaminación.'
            )
            WHEN v_categoria_id = 7 THEN ELT(FLOOR(1 + RAND() * 3),
                'Se construye sin permisos visibles en la zona.',
                'Vecinos reportan obra irregular en la colonia.',
                'Se observa material de construcción en vía pública.'
            )
            ELSE 'Incidente reportado por un ciudadano en la zona.'
        END;

        -- Insertar incidente
        INSERT INTO incidentes (
            titulo, descripcion, imagen, latitud, longitud, 
            estado, fecha_reporte, usuario_id, categoria_id
        ) VALUES (
            v_titulo, v_descripcion, v_imagen, v_latitud, v_longitud,
            v_estado, v_fecha_reporte, v_usuario_id, v_categoria_id
        );

        SET i = i + 1;
    END WHILE;
    
    SELECT CONCAT(cantidad, ' incidentes insertados exitosamente') AS Resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_incidentes_por_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_incidentes_por_categoria`(
    IN p_cantidad INT,
    IN p_categoria_id INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_titulo VARCHAR(100);
    DECLARE v_descripcion VARCHAR(500);
    DECLARE v_imagen VARCHAR(255);
    DECLARE v_latitud FLOAT;
    DECLARE v_longitud FLOAT;
    DECLARE v_estado ENUM('pendiente','en_revision','atendido','descartado');
    DECLARE v_fecha_reporte DATETIME;
    DECLARE v_usuario_id INT;
    DECLARE v_categoria_nombre VARCHAR(100);
    DECLARE v_total_usuarios INT DEFAULT 1;
    
    -- Verificar si la categoría existe
    DECLARE v_categoria_existe INT DEFAULT 0;
    SELECT COUNT(*) INTO v_categoria_existe FROM categorias WHERE id = p_categoria_id;
    
    IF v_categoria_existe = 0 THEN
        SELECT CONCAT('Error: La categoría con ID ', p_categoria_id, ' no existe') AS Mensaje;
    ELSE
        -- Obtener el nombre de la categoría
        SELECT nombre INTO v_categoria_nombre FROM categorias WHERE id = p_categoria_id LIMIT 1;
        
        -- Obtener el máximo de usuarios
        SELECT IFNULL(MAX(id), 1) INTO v_total_usuarios FROM usuarios;
        
        -- Generar incidentes
        WHILE i < p_cantidad DO
            SET v_descripcion = CONCAT('Reporte automático de ', v_categoria_nombre, ' - ', UUID_SHORT());
            SET v_imagen = CONCAT('/img/incidentes/', v_categoria_nombre, '/', FLOOR(1 + RAND() * 1000), '.jpg');
            SET v_latitud = 19.0 + (RAND() * 6);
            SET v_longitud = -102.0 + (RAND() * 8);
            SET v_estado = ELT(FLOOR(1 + RAND() * 4), 'pendiente', 'en_revision', 'atendido', 'descartado');
            SET v_fecha_reporte = NOW() - INTERVAL FLOOR(RAND() * 30) DAY;
            SET v_usuario_id = FLOOR(1 + RAND() * v_total_usuarios);
            
            -- Generar título según categoría
            SET v_titulo = CASE 
                WHEN p_categoria_id = 1 THEN 'Reporte de seguridad pública'
                WHEN p_categoria_id = 2 THEN 'Emergencia reportada'
                WHEN p_categoria_id = 3 THEN 'Problema de infraestructura urbana'
                WHEN p_categoria_id = 4 THEN 'Falla en servicios públicos'
                WHEN p_categoria_id = 5 THEN 'Reporte de ruido vecinal'
                WHEN p_categoria_id = 6 THEN 'Incidente ambiental'
                WHEN p_categoria_id = 7 THEN 'Obra irregular reportada'
                ELSE CONCAT('Incidente: ', v_categoria_nombre)
            END;

            INSERT INTO incidentes (
                titulo, descripcion, imagen, latitud, longitud, 
                estado, fecha_reporte, usuario_id, categoria_id
            ) VALUES (
                v_titulo, v_descripcion, v_imagen, v_latitud, v_longitud,
                v_estado, v_fecha_reporte, v_usuario_id, p_categoria_id
            );

            SET i = i + 1;
        END WHILE;
        
        SELECT CONCAT(p_cantidad, ' incidentes insertados para la categoría "', v_categoria_nombre, '"') AS Resultado;
    END IF;
END ;;
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

-- Dump completed on 2025-08-16 22:34:49
