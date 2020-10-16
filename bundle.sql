  -- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
  --
  -- Host: 127.0.0.1    Database: escuelita_pancho_27_08_2020
  -- ------------------------------------------------------
  -- Server version	5.5.5-10.4.11-MariaDB

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
  -- Table structure for table `actividad`
  --

  DROP DATABASE IF EXISTS la_escuelita_de_pancho;
  CREATE DATABASE la_escuelita_de_pancho;

  USE la_escuelita_de_pancho;

  DROP TABLE IF EXISTS `actividad`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `actividad` (
    `id_actividad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el codigo de la actividad',
    `id_unidad` int(11) NOT NULL COMMENT 'la unidad que esta trabajando',
    `id_asignacion` int(11) NOT NULL COMMENT 'llamamos la asignacion ya que esta definida por el curso y maestro',
    `titulo_actividad` varchar(45) NOT NULL COMMENT 'el nombre que define la actividad',
    `descripcion` varchar(45) NOT NULL COMMENT 'descripcion para definir la actividad ',
    `fecha_creacion` date NOT NULL COMMENT 'fecha de creacion de la actividad',
    `fecha_cierre` date NOT NULL COMMENT 'fecha cuando termine la entrega de la actividad',
    `puntos_zona` int(11) NOT NULL COMMENT 'define los puntos acumulados para la zona',
    `estado` enum('A','B') DEFAULT NULL COMMENT 'estado si esta activa o termino como baja',
    PRIMARY KEY (`id_actividad`),
    KEY `act_id_unidad_idx` (`id_unidad`),
    KEY `act_asignacion_idx` (`id_asignacion`),
    CONSTRAINT `act_asignacion` FOREIGN KEY (`id_asignacion`) REFERENCES `asignacion` (`id_asignacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `act_id_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='define si es examen o tarea';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `actividad`
  --

  LOCK TABLES `actividad` WRITE;
  /*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
  /*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `alumno`
  --

  DROP TABLE IF EXISTS `alumno`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `alumno` (
    `id_alumno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de alumno',
    `nombre_alumno` varchar(45) NOT NULL COMMENT 'nombre completo del alumno',
    `id_usuario` int(11) NOT NULL COMMENT 'codigo de usuario para uso del sistema',
    `direccion` varchar(155) NOT NULL COMMENT 'direccion donde vive el alumno',
    `celular` int(11) NOT NULL COMMENT 'numero de telefono para notificaiones',
    `correo` varchar(45) NOT NULL COMMENT 'correo electronico para notificaciones',
    `fecha_creacion` date NOT NULL COMMENT 'fecha que se creo el alumno',
    `id_grado` int(11) NOT NULL COMMENT 'fk codigo de grado',
    PRIMARY KEY (`id_alumno`),
    KEY `id_grado_idx` (`id_grado`),
    CONSTRAINT `id_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `id_usuario` FOREIGN KEY (`id_alumno`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `alumno`
  --

  LOCK TABLES `alumno` WRITE;
  /*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
  /*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `asignacion`
  --

  DROP TABLE IF EXISTS `asignacion`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `asignacion` (
    `id_asignacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de identificacion de asignacion',
    `id_alumno` int(11) NOT NULL COMMENT 'codigo del alumno asignado',
    `id_maestro_curso` int(11) NOT NULL COMMENT 'codigo que define el curso por maestro',
    `estado` enum('A','B') NOT NULL COMMENT 'asignacion activa o inactiva',
    PRIMARY KEY (`id_asignacion`),
    KEY `asig_id_alumno_idx` (`id_alumno`),
    KEY `asig_id_macu_idx` (`id_maestro_curso`),
    CONSTRAINT `asig_id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `asig_id_macu` FOREIGN KEY (`id_maestro_curso`) REFERENCES `maestro_curso` (`id_maestro_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='asignacion de alumnos a curso y maestros';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `asignacion`
  --

  LOCK TABLES `asignacion` WRITE;
  /*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
  /*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `aula`
  --

  DROP TABLE IF EXISTS `aula`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `aula` (
    `id_aula` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de identificacion para el aula',
    `nombre_aula` varchar(150) NOT NULL COMMENT 'nombre del aula ',
    `capacidad` int(11) DEFAULT NULL COMMENT 'numero de alumnos que puede contener dicha aula',
    `usuario_creacion` varchar(45) DEFAULT NULL COMMENT 'usuario que crea',
    `fecha_creacion` varchar(45) DEFAULT NULL COMMENT 'fecha en que se crea el aula',
    `usuario_modifica` varchar(45) DEFAULT NULL COMMENT 'usuario que modifica ',
    `fecha_modifica` varchar(45) DEFAULT NULL COMMENT 'fecha en que se le hacen cambios',
    `estado` enum('A','B') DEFAULT NULL COMMENT 'Indica si esta de Alta o de Baja el aula\n',
    PRIMARY KEY (`id_aula`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='define las aulas en disposicion y el numero maximo de alumnos que puede contener';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `aula`
  --

  LOCK TABLES `aula` WRITE;
  UNLOCK TABLES;

  --
  -- Table structure for table `curso`
  --

  DROP TABLE IF EXISTS `curso`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
    `id_curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de curso',
    `nombre_curso` varchar(150) NOT NULL COMMENT 'nombre de curso a impartir',
    `observacion` varchar(155) NOT NULL COMMENT 'algun comentario del curso',
    `estado` enum('A','B') NOT NULL COMMENT 'indica si esta de Alta o Baja ',
    `fecha_creacion` date NOT NULL COMMENT 'indicador de la fecha que se creo ',
    `id_grado` int(11) NOT NULL COMMENT 'LLAVE QUE APUNTA A LA TABLA GRADO',
    PRIMARY KEY (`id_curso`),
    CONSTRAINT `llave_grado_curso` FOREIGN KEY (`id_grado`) REFERENCES `grado`(`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla que contendra todos los cursos en general\n';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `curso`
  --

  LOCK TABLES `curso` WRITE;
  /*!40000 ALTER TABLE `curso` DISABLE KEYS */;
  /*!40000 ALTER TABLE `curso` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `detalle_alumno`
  --

  DROP TABLE IF EXISTS `detalle_alumno`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `detalle_alumno` (
    `id_detalle_alumno` int(11) NOT NULL AUTO_INCREMENT,
    `id_alumno` int(11) NOT NULL COMMENT 'codigo del alumno ',
    `lugar_nacimiento` varchar(100) NOT NULL COMMENT 'lugar de nacimiento\n',
    `fecha_nacimiento` date NOT NULL COMMENT 'cuando nacio',
    `genero` enum('A','B') NOT NULL COMMENT 'orientacion sexual del ser',
    `nacionalidad` varchar(100) NOT NULL COMMENT 'de donde es',
    `estatura` decimal(11, 2) DEFAULT NULL COMMENT 'medicion el metros y centimetros',
    `peso` int(11) DEFAULT NULL COMMENT 'medicion en libras y gramos',
    `religion` varchar(45) DEFAULT NULL COMMENT 'que profesa',
    `fecha_ingreso` date DEFAULT NULL COMMENT 'cuando ingreso ',
    `tipo_sangre` varchar(3) DEFAULT NULL COMMENT 'datos de emergencia ',
    `alergias` varchar(145) DEFAULT NULL COMMENT 'problemas de salud',
    `celular_emergencia` int(11) NOT NULL COMMENT 'celular como datos de contacto ',
    `padre_emergencia` varchar(150) NOT NULL COMMENT 'padre encargado del ser',
    `estado` enum('A', 'B') NOT NULL COMMENT 'Este es el estado de si el alumno esta en e colegio o no',
    PRIMARY KEY (`id_detalle_alumno`),
    KEY `id_alumno_idx` (`id_alumno`),
    CONSTRAINT `id_alumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='detalle de datos para el alumno';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `detalle_alumno`
  --

  LOCK TABLES `detalle_alumno` WRITE;
  /*!40000 ALTER TABLE `detalle_alumno` DISABLE KEYS */;
  /*!40000 ALTER TABLE `detalle_alumno` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `grado`
  --

  DROP TABLE IF EXISTS `grado`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `grado` (
    `id_grado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo que identifica al grado',
    `nombre_grado` varchar(45) NOT NULL COMMENT 'describe el nombre del grado',
    `estado` enum('A','B') NOT NULL COMMENT 'Se evalua si esta activo o de baja los grados del colegio',
    PRIMARY KEY (`id_grado`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla contiene los grados del nivel primario';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `grado`
  --

  LOCK TABLES `grado` WRITE;
  /*!40000 ALTER TABLE `grado` DISABLE KEYS */;
  /*!40000 ALTER TABLE `grado` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `horario`
  --

  DROP TABLE IF EXISTS `horario`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `horario` (
    `id_horario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del horario del dia',
    `descripcion` varchar(155) NOT NULL COMMENT 'descripcion para el horario',
    `id_periodo_dia` int(11) NOT NULL COMMENT 'id del periodo que define la hora y dia del curspo',
    `id_maestro_curso` int(11) NOT NULL COMMENT 'contiene todos los datos necesarios como el maestro curso aula y otros',
    `estado` enum('A','B') NOT NULL COMMENT 'si esta de alta o baja',
    PRIMARY KEY (`id_horario`),
    KEY `ho_id_periodo_dia_idx` (`id_periodo_dia`),
    KEY `ho_id_macu_idx` (`id_maestro_curso`),
    CONSTRAINT `ho_id_macu` FOREIGN KEY (`id_maestro_curso`) REFERENCES `maestro_curso` (`id_maestro_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `ho_id_periodo_dia` FOREIGN KEY (`id_periodo_dia`) REFERENCES `periodo_dia` (`id_periodo_dia`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='asignacion de los cursos al dia de periodo';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `horario`
  --

  LOCK TABLES `horario` WRITE;
  /*!40000 ALTER TABLE `horario` DISABLE KEYS */;
  /*!40000 ALTER TABLE `horario` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `identificacion`
  --

  DROP TABLE IF EXISTS `identificacion`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `identificacion` (
    `id_identificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de identificacion ',
    `nombre_identificacion` varchar(45) NOT NULL COMMENT 'nombre de la identificacion',
    `estado` enum('A','B') NOT NULL COMMENT 'Indica si esta de Alta o de Baja el aula\n',
    PRIMARY KEY (`id_identificacion`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='nos indica el tipo de documento que puede utizar ';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `identificacion`
  --

  LOCK TABLES `identificacion` WRITE;
  /*!40000 ALTER TABLE `identificacion` DISABLE KEYS */;
  /*!40000 ALTER TABLE `identificacion` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `maestro`
  --

  DROP TABLE IF EXISTS `maestro`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `maestro` (
    `id_maestro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo que identifica al maestro',
    `id_identificacion` int(11) NOT NULL COMMENT 'fk a la tabla de identificacion ',
    `codigo_identificacion` varchar(45) NOT NULL COMMENT 'codigo del tipo de identificacion',
    `direccion` varchar(150) NOT NULL COMMENT 'lugar de residencia del maestro',
    `correo` varchar(75) NOT NULL COMMENT 'correo electronico de contacto del maestro',
    `celular` int(11) NOT NULL COMMENT 'numero de celular ',
    `estado` enum('A','B') NOT NULL COMMENT 'Indica si esta de Alta o de Baja del maestro',
    PRIMARY KEY (`id_maestro`),
    KEY `id_identificacion_idx` (`id_identificacion`),
    CONSTRAINT `id_identificacion` FOREIGN KEY (`id_identificacion`) REFERENCES `identificacion` (`id_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla con los datos importantes del maestro';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `maestro`
  --

  LOCK TABLES `maestro` WRITE;
  /*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
  /*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `maestro_curso`
  --

  DROP TABLE IF EXISTS `maestro_curso`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `maestro_curso` (
    `id_maestro_curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de asignacion',
    `id_maestro` int(11) NOT NULL COMMENT 'id maestro para hacer match',
    `id_curso` int(11) NOT NULL COMMENT 'id del curso asignado al maestro\n',
    `id_grado` int(11) NOT NULL COMMENT 'grado al que le dara clases',
    `id_aula` int(11) NOT NULL COMMENT 'el aula asignada ',
    `descripcion` varchar(155) NOT NULL COMMENT 'descripcion del conjunto',
    `fecha_creacion` date NOT NULL COMMENT 'dia de creacion ',
    `estado` enum('A','B') NOT NULL COMMENT 'esta activo o de baja para funcionar',
    PRIMARY KEY (`id_maestro_curso`),
    KEY `macu_id_curso_idx` (`id_curso`),
    KEY `macu_id_grado_idx` (`id_grado`),
    KEY `macu_id_aula_idx` (`id_aula`),
    CONSTRAINT `macu_id_aula` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `macu_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `macu_id_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `macu_id_maestro` FOREIGN KEY (`id_maestro_curso`) REFERENCES `maestro` (`id_maestro`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='match entre maestro y curso ';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `maestro_curso`
  --

  LOCK TABLES `maestro_curso` WRITE;
  /*!40000 ALTER TABLE `maestro_curso` DISABLE KEYS */;
  /*!40000 ALTER TABLE `maestro_curso` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `papeleria_alumno`
  --

  DROP TABLE IF EXISTS `papeleria_alumno`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `papeleria_alumno` (
    `id_papeleria_alumno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de papeleria de alumno\n',
    `id_alumno` int(11) NOT NULL COMMENT 'codigo del alumno ',
    `partida_nacimiento` mediumblob NOT NULL COMMENT 'certificado de nacimiento\n',
    `certificado_vacunas` mediumblob NOT NULL COMMENT 'imagen de certificado de vacunas\n',
    `certificado_preprimaria` mediumblob DEFAULT NULL COMMENT 'certificado de preprimaria',
    `certificado_primero_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de primero primaria',
    `certificacdo_segundo_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de segundo primaria',
    `certificado_tercero_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de tercero primaria',
    `certificado_cuarto_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de cuarto primaria',
    `certificado_quinto_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de quinto primaria',
    `certificado_sexto_primaria` mediumblob DEFAULT NULL COMMENT 'certificado de sexto primaria',
    PRIMARY KEY (`id_papeleria_alumno`),
    KEY `id_alumno_idx` (`id_alumno`),
    CONSTRAINT `id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='contiene datos de certificaciones del alumno';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `papeleria_alumno`
  --

  LOCK TABLES `papeleria_alumno` WRITE;
  /*!40000 ALTER TABLE `papeleria_alumno` DISABLE KEYS */;
  /*!40000 ALTER TABLE `papeleria_alumno` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `periodo_dia`
  --

  DROP TABLE IF EXISTS `periodo_dia`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `periodo_dia` (
    `id_periodo_dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo para definir el periodo en el que esta',
    `nombre_periodo` varchar(45) NOT NULL COMMENT 'descripcion o titulo para el periodo',
    `observacion` varchar(145) NOT NULL COMMENT 'algun comentario para la definicion del periodo',
    `dia_horario` varchar(45) DEFAULT NULL COMMENT 'dia para el periodo\n',
    `hora_horario` datetime NOT NULL COMMENT 'la hora del horario para el periodo',
    `estado` enum('A','B') NOT NULL,
    PRIMARY KEY (`id_periodo_dia`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='grupo por dias de horario';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `periodo_dia`
  --

  LOCK TABLES `periodo_dia` WRITE;
  /*!40000 ALTER TABLE `periodo_dia` DISABLE KEYS */;
  /*!40000 ALTER TABLE `periodo_dia` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `respuesta_actividad`
  --

  DROP TABLE IF EXISTS `respuesta_actividad`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `respuesta_actividad` (
    `id_respuesta_actividad` int(11) NOT NULL AUTO_INCREMENT,
    `id_actividad` int(11) NOT NULL,
    `id_alumno` int(11) NOT NULL,
    `nota` int(11) NOT NULL,
    `descripcion_respuesta` varchar(45) NOT NULL,
    `trabajo_respuesta` mediumblob DEFAULT NULL,
    `fecha_respuesta` varchar(45) NOT NULL COMMENT 'fecha en que subio la actividad',
    `estado` enum('AT','NE','FT') NOT NULL COMMENT 'estados para los trabajos\nAT= a tiempo\nNE = no entrego\nFT = fuera de tiempo\n',
    `respuesta_actividadcol` varchar(45) NOT NULL,
    PRIMARY KEY (`id_respuesta_actividad`),
    KEY `reac_id_actividad_idx` (`id_actividad`),
    KEY `reac_id_alumno_idx` (`id_alumno`),
    CONSTRAINT `reac_id_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `reac_id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='respuesta a la actividad creada';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `respuesta_actividad`
  --

  LOCK TABLES `respuesta_actividad` WRITE;
  /*!40000 ALTER TABLE `respuesta_actividad` DISABLE KEYS */;
  /*!40000 ALTER TABLE `respuesta_actividad` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `unidad`
  --

  DROP TABLE IF EXISTS `unidad`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `unidad` (
    `id_unidad` int(11) NOT NULL COMMENT 'codigo de identificacion de unidad',
    `nombre_unidad` varchar(45) DEFAULT NULL COMMENT 'nombre de identificacion para unidad',
    `fecha_inicio` date DEFAULT NULL COMMENT 'fecha donde inicia la unidad',
    `fecha_fin` date DEFAULT NULL COMMENT 'fecha donde termina la unidad',
    `estado` enum('A','I') DEFAULT NULL COMMENT 'Unidad activa o inactiva',
    PRIMARY KEY (`id_unidad`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `unidad`
  --

  LOCK TABLES `unidad` WRITE;
  /*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
  /*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Table structure for table `usuario`
  --

  DROP TABLE IF EXISTS `usuario`;
  /*!40101 SET @saved_cs_client     = @@character_set_client */;
  /*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `usuario` (
    `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del usuario',
    `usuario` varchar(45) NOT NULL COMMENT 'nombre del usuario',
    `password` varchar(15) NOT NULL COMMENT 'contraseña definida por usuario',
    `fecha_ultimo_cambio_password` date NOT NULL COMMENT 'ultima fecha de cambio de passowrd',
    `contador_intento_fallidos` varchar(45) NOT NULL COMMENT 'contador de intentos fallidos al acceder',
    `codigo_restauracion` varchar(45) NOT NULL COMMENT 'codigo de nuevo acceso por si se olvido el password',
    `correo` varchar(45) NOT NULL COMMENT 'correo_restauracion_usuario',
    `celular` int(11) NOT NULL COMMENT 'numero_telefono_para_restauracion',
    `status` enum('A','B') NOT NULL COMMENT 'Indica si esta de Alta o de Baja del usuario',
    PRIMARY KEY (`id_usuario`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla que contiene a los usuarios que manejaran la informacion ';
  /*!40101 SET character_set_client = @saved_cs_client */;

  --
  -- Dumping data for table `usuario`
  --

  LOCK TABLES `usuario` WRITE;
  /*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
  /*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
  UNLOCK TABLES;

  --
  -- Dumping events for database 'escuelita_pancho_27_08_2020'
  --

  --
  -- Dumping routines for database 'escuelita_pancho_27_08_2020'
  --
  /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

  /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
  /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
  /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
  /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

  -- Dump completed on 2020-08-28 13:18:30

  INSERT INTO `aula` ( `nombre_aula`, `capacidad`, `usuario_creacion`, `fecha_creacion`, `usuario_modifica`, `fecha_modifica`, `estado`) VALUES
  ('c-0001', 27, 'coordinador', '7/25/2020', 'maestro', '8/22/2020', 'A'),
  ('c-0002', 26, 'coordinador', '7/25/2020', 'maestro', '8/24/2020', 'A'),
  ('c-0003', 21, 'maestro', '7/25/2020', 'maestro', '8/25/2020', 'A'),
  ('c-0004', 28, 'director', '7/24/2020', 'coordinador', '8/24/2020', 'A'),
  ('c-0005', 21, 'auxiliar', '7/23/2020', 'director', '8/24/2020', 'B');





  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

  -- phpMyAdmin SQL Dump
  -- version 5.0.2
  -- https://www.phpmyadmin.net/
  --
  -- Host: 127.0.0.1
  -- Generation Time: Aug 29, 2020 at 02:54 PM
  -- Server version: 10.4.11-MariaDB
  -- PHP Version: 7.4.5

  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
  START TRANSACTION;
  SET time_zone = "+00:00";


  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;

  --
  -- Database: `la_escuelita_de_pancho`
  --

  -- --------------------------------------------------------

  --
  -- Table structure for table `usuario`
  --

  --
  -- Dumping data for table `usuario`
  --

  INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `fecha_ultimo_cambio_password`, `contador_intento_fallidos`, `codigo_restauracion`, `correo`, `celular`, `status`) VALUES
  (1, 'Lyle', 'WJzTv62Fjq', '2020-08-25', '9', 'U5290BZqTY', 'Abra@Phasellus.com', 623, 'B'),
  (2, 'Porter', 'hNu03gpeCs', '2020-08-22', '1', 'aNoAPolDUa', 'Ruby@Duis.net', 595, 'B'),
  (3, 'Nash', 'jGbjYhYgHw', '2020-08-23', '1', 'MxNhIxaZiD', 'Vanna@Suspendisse.com', 720, 'A'),
  (4, 'Elijah', 'n4eEaDCMmk', '2020-08-26', '3', 'qVkqVyn74k', 'Jenna@gravida.com', 777, 'B'),
  (5, 'Karyn', 'nGYxTeogwo', '2020-08-22', '1', 'qoN4GSbcY7', 'Savannah@hendrerit.net', 309, 'B'),
  (6, 'Brendan', 'PuwvmjWNQ6', '2020-08-23', '5', 'zW2CNvblto', 'Maite@molestie.com', 995, 'A'),
  (7, 'Geraldine', 'dZO0Cz41VK', '2020-08-27', '7', 'XzvHcdjiBV', 'Malachi@Duis.com', 805, 'A'),
  (8, 'Lael', 'xoO0IEHHtD', '2020-08-24', '8', 'Qnvds2krBa', 'Tamekah@posuere.us', 131, 'B'),
  (9, 'Vaughan', 'fgJJgdP0VB', '2020-08-22', '0', 'rSgWa0Lllo', 'Abdul@Mauris.net', 129, 'B'),
  (10, 'Charde', 'aCWsnyzvka', '2020-08-23', '5', 'OgZDaDNrEl', 'Holmes@libero.gov', 426, 'A'),
  (11, 'Tashya', 'I90Ss DFOP', '2020-08-24', '4', 'zw0HbxGPZR', 'Colleen@Nunc.us', 912, 'B'),
  (12, 'Azalia', 'PeKta5iiTu', '2020-08-27', '4', '4FRCv70WVK', 'Rhonda@consequat.org', 393, 'B'),
  (13, 'Naomi', 'T0Wkry3bRz', '2020-08-23', '3', 'KObWI4DLOG', 'Renee@dui.gov', 870, 'A'),
  (14, 'Beau', 'Lp8v0oBxoL', '2020-08-24', '8', 'cv7eGvg0H1', 'Richard@euismod.com', 792, 'B'),
  (15, 'Sigourney', 'B5uZxyz3ah', '2020-08-27', '9', 'd3AZzSYDKt', 'Gillian@luctus.com', 417, 'A'),
  (16, 'Kenneth', 'C9yjK9bujN', '2020-08-22', '9', 'CD9ZQe2Kxb', 'Caleb@condimentum.us', 351, 'A'),
  (17, 'Rhona', 'FMPEHcOa1h', '2020-08-25', '3', 'iwyXsIKmAw', 'Rajah@nisi.com', 747, 'B'),
  (18, 'Whitney', 'TsXGrLas W', '2020-08-25', '10', 'LbLbl6D0dc', 'Walter@dapibus.org', 222, 'A'),
  (19, 'Daphne', 'ShLY0kskzk', '2020-08-23', '8', 'qNYWu63Kej', 'Barrett@quam.org', 60, 'A'),
  (20, 'Fiona', 'ZKOIistxvr', '2020-08-22', '6', 'yLv4rDvlAv', 'Thane@bibendum.edu', 758, 'A'),
  (21, 'Zoe', 'nqrJtMHFBH', '2020-08-24', '9', 'PGqlg7Dhfq', 'Irma@posuere.com', 999, 'B'),
  (22, 'Jordan', '6vU5lmND98', '2020-08-22', '8', 'ealrsdBL8I', 'Ann@Phasellus.us', 166, 'B'),
  (23, 'Noelle', 't41MQ8uoGa', '2020-08-28', '10', 'oPtrkgPb4y', 'Shelby@justo.org', 231, 'A'),
  (24, 'Myra', 'nD5PPUGezu', '2020-08-22', '7', 'KHjowUKI14', 'Stacey@justo.edu', 184, 'B'),
  (25, 'Gavin', 'J2uoTemB9g', '2020-08-23', '2', 'wM7dfF3nJp', 'Keiko@per.net', 358, 'B'),
  (26, 'Amaya', '6tjDUHEcwz', '2020-08-24', '4', 'FnjO4mrF0G', 'Jermaine@Cras.net', 352, 'B'),
  (27, 'Tad', '7V6GByWkhq', '2020-08-25', '7', 'u27D4yLyVH', 'Fatima@pulvinar.com', 481, 'B'),
  (28, 'Luke', 'ZwZUsz910a', '2020-08-27', '6', 'XmmioJbnQC', 'Josephine@Duis.com', 159, 'B'),
  (29, 'Abigail', 'mBDK8ZHb4j', '2020-08-27', '10', 'r5WqHGYATd', 'Jermaine@Fusce.org', 89, 'A'),
  (30, 'Hyatt', 'qfOhK4EjEL', '2020-08-28', '3', 'SdrbVmKyAb', 'Sara@Nunc.us', 470, 'A'),
  (31, 'Ray', 'auIhzvUhEv', '2020-08-24', '5', 'lBGYQ1QSq2', 'Thane@varius.com', 475, 'B'),
  (32, 'Jocelyn', '0YkOPnNqj6', '2020-08-26', '0', '2q1xfWH3Vz', 'John@Cum.us', 337, 'B'),
  (33, 'Yetta', 'yR8bT03Prp', '2020-08-27', '2', '45Gsz4onxN', 'Aurelia@hymenaeos.net', 282, 'B'),
  (34, 'Maya', 'jq2kpQoPzo', '2020-08-27', '9', 'A7jduezl7Y', 'Karina@at.net', 199, 'A'),
  (35, 'Baker', 'JgpPGaeQLr', '2020-08-22', '7', 'PFzL8CHefj', 'Yardley@sodales.edu', 425, 'A'),
  (36, 'Caryn', 'RpSZ7NI5nf', '2020-08-27', '6', 'pGHV5qecYE', 'Scarlet@est.com', 189, 'B'),
  (37, 'Lara', 'cRa6m1HBsO', '2020-08-25', '5', 'GVywOa2Fwp', 'Elvis@parturient.net', 778, 'B'),
  (38, 'Chaney', '3 nB8Fb4mG', '2020-08-28', '6', 'h0a2W1goSD', 'Ferris@parturient.gov', 60, 'A'),
  (39, 'Herrod', 'B3j4DEvaoS', '2020-08-28', '9', 'h5wKPuM8hy', 'Hyacinth@Curabitur.org', 723, 'B'),
  (40, 'Carissa', 'BkRVzs276F', '2020-08-23', '7', 'jgDhWRvX2I', 'Dana@in.us', 699, 'B'),
  (41, 'Mira', 'JFaP7dQWjj', '2020-08-24', '4', 'MAkHFDJBCT', 'Mufutau@tellus.org', 389, 'A'),
  (42, 'Berk', 'Sqc5WlyEN2', '2020-08-24', '6', '4gqDbdjFEB', 'Erich@augue.gov', 443, 'A'),
  (43, 'Yasir', 'xR5vH3L5Mi', '2020-08-28', '1', 'ng9eC3XuQI', 'Mufutau@mauris.gov', 147, 'B'),
  (44, 'Arthur', 'Sdq5mNw3WT', '2020-08-24', '4', '1EbtUdp3zT', 'Scarlett@Proin.gov', 268, 'B'),
  (45, 'Burton', 'tGXqscR4rc', '2020-08-28', '5', '00C12YvTbQ', 'Micah@libero.com', 979, 'A'),
  (46, 'Macon', 'MUA2zKfl8L', '2020-08-24', '0', 'vvKfG12M2W', 'Jillian@Proin.com', 653, 'B'),
  (47, 'Travis', '2HhYDNLntM', '2020-08-24', '2', '3hfFneUkf0', 'Drake@sem.us', 638, 'B'),
  (48, 'Lane', 'nrJMbGSmKd', '2020-08-23', '6', 'CTfs7Dp5Uh', 'Maggie@sit.net', 660, 'A'),
  (49, 'Kameko', '7bVuqdnZrp', '2020-08-25', '0', '961NJ30UVQ', 'Kiara@lobortis.org', 423, 'A'),
  (50, 'Aline', 'uwBoe15 FP', '2020-08-23', '7', 'nPmw1gWMHF', 'Nash@pulvinar.gov', 961, 'A'),
  (51, 'Isaac', 'W4GKHVNCXW', '2020-08-26', '1', 'qEgNVJ96nZ', 'Damian@rutrum.edu', 585, 'B'),
  (52, 'Reed', 'g2kthM52Dn', '2020-08-28', '10', 'aPW2imyPzl', 'Rajah@erat.org', 240, 'B'),
  (53, 'Whilemina', 'iIW6 C5xTy', '2020-08-26', '5', 'NzTvVXyutN', 'Orson@nibh.us', 171, 'B'),
  (54, 'Addison', 't6jsY43TUj', '2020-08-24', '2', 'WZedzjNk0F', 'Brendan@convallis.edu', 58, 'A'),
  (55, 'Sandra', 'GolaDhcR5u', '2020-08-28', '10', 'AbOLNx58nL', 'Steven@leo.org', 881, 'A'),
  (56, 'Carson', ' HphVeFdkR', '2020-08-25', '9', 'd7vbBjB2CC', 'Wylie@arcu.net', 234, 'B'),
  (57, 'Chandler', 'pcykRfwES7', '2020-08-22', '6', 'cb6NxCBsEj', 'Kellie@Curabitur.com', 89, 'B'),
  (58, 'Camille', 'Qb8hLmXSWU', '2020-08-27', '2', 'EspXh2Rdwt', 'Yoshi@nibh.org', 741, 'B'),
  (59, 'Elmo', 'FahSsmSm9e', '2020-08-25', '2', 'pnDBr9tKRp', 'Arthur@Integer.gov', 65, 'A'),
  (60, 'Samuel', 'z6lVveaais', '2020-08-26', '9', 'OratvG5BD4', 'Quemby@ridiculus.gov', 658, 'A'),
  (61, 'Kirk', 'Ed TZlSveg', '2020-08-28', '1', 'xlMDrqGdHj', 'Sharon@sapien.com', 65, 'A'),
  (62, 'Lilah', 'VtcafEM8IZ', '2020-08-27', '5', '5rbPLwptLh', 'Whoopi@nec.us', 404, 'A'),
  (63, 'Armando', 'tvAjvFI9XU', '2020-08-27', '2', '1mPHnZMp1B', 'Dennis@tincidunt.edu', 201, 'B'),
  (64, 'Hedwig', 'wR2UwWy1KE', '2020-08-24', '2', 'TBsPJcnLyp', 'Kennedy@consectetuer.edu', 570, 'B'),
  (65, 'Imelda', 'JRHMxiUk3G', '2020-08-25', '6', 'DlSy0jAF2x', 'Beverly@sapien.edu', 954, 'B'),
  (66, 'Hammett', 'Iay5nsEeC3', '2020-08-25', '2', '6hawZitMqw', 'Elvis@rhoncus.gov', 401, 'A'),
  (67, 'Jasmine', 'qfxXdBeCnz', '2020-08-28', '7', 'cCkS7Yx64J', 'Brianna@Phasellus.us', 228, 'A'),
  (68, 'Imelda', 'DUIdieSwzQ', '2020-08-26', '3', '7lYkcgXlzd', 'Carla@inceptos.us', 61, 'A'),
  (69, 'Tad', 'cCMoOUb4dI', '2020-08-27', '1', 'qUmGjcLPqI', 'Vance@montes.net', 14, 'A'),
  (70, 'Linus', 'bw6 dhTtoJ', '2020-08-26', '3', 'GCKqj3cTZ7', 'Tarik@aliquet.org', 787, 'A'),
  (71, 'Rudyard', 'OlCWK8e5HG', '2020-08-26', '9', '19CBrGS4a7', 'Armand@vestibulum.us', 827, 'B'),
  (72, 'Rajah', 'Ft9EWINKbg', '2020-08-24', '1', 'MXNP6a5UZ5', 'Darius@Lorem.com', 535, 'A'),
  (73, 'Anne', 'SiNz7IxHVv', '2020-08-26', '3', '1dQwaeyWPC', 'Martin@nascetur.org', 550, 'B'),
  (74, 'Gretchen', 'M7chk99NQZ', '2020-08-28', '6', 'K6XP4NG2fz', 'Lyle@placerat.com', 226, 'B'),
  (75, 'Emery', 'VPoDlFlLHO', '2020-08-23', '3', 'AYgUSQjBcO', 'Blake@turpis.org', 795, 'A'),
  (76, 'Justin', 'MiM0aIsNON', '2020-08-22', '3', 'FnJ337XGX0', 'Price@Cras.com', 967, 'A'),
  (77, 'Walter', 'BnFhxjBpYw', '2020-08-27', '5', 'R38tZXKu2H', 'Raphael@Praesent.gov', 407, 'B'),
  (78, 'Alexa', 'F6rMUQQUNA', '2020-08-24', '4', 'Sjx2IaQC5X', 'Bernard@est.net', 554, 'B'),
  (79, 'Aaron', 'NUjYQRyUJd', '2020-08-28', '9', 'P3w37vX1zM', 'Lisandra@dis.net', 642, 'B'),
  (80, 'Jemima', 'juKxlOK5VQ', '2020-08-25', '7', 'lZ1QRvT3En', 'Cooper@est.edu', 348, 'B'),
  (81, 'Rafael', 'lqk5MUswNu', '2020-08-24', '7', '0eGuHjJa7w', 'Jena@feugiat.net', 65, 'B'),
  (82, 'Lucas', 'pU9sBRrwHp', '2020-08-22', '3', 'F2FbH1Azsn', 'TaShya@Aliquam.org', 825, 'B'),
  (83, 'Mollie', 'P571hRM7EK', '2020-08-24', '10', 'BmTMclhBEa', 'Berk@egestas.com', 820, 'A'),
  (84, 'Sheila', 'PCxIZKn6AG', '2020-08-26', '9', 'W0GKbqsiMB', 'Nadine@Aliquam.net', 314, 'A'),
  (85, 'Althea', 'gLvNsIyyZp', '2020-08-22', '4', 'oIRAUwnpag', 'Isaac@bibendum.org', 934, 'A'),
  (86, 'Ray', 'PLkg9SKwqb', '2020-08-24', '5', 'cN7vLypCWP', 'Ferdinand@Cum.us', 271, 'A'),
  (87, 'Duncan', '4HwO8kF 9C', '2020-08-25', '4', '7CmAOMYdlm', 'Kibo@Duis.us', 244, 'B'),
  (88, 'Helen', '9Cs0HEruVz', '2020-08-27', '6', 'IGdz9CsA8I', 'Armand@vulputate.com', 701, 'A'),
  (89, 'Lillith', 'GYG3r56VL1', '2020-08-24', '6', 'mcGTyLzfKH', 'Germane@dis.org', 98, 'A'),
  (90, 'Keely', 'XXWubCQz5R', '2020-08-22', '3', 'ieJnKABwwJ', 'Shafira@primis.gov', 206, 'B'),
  (91, 'Jerry', 'hGIePeiEG9', '2020-08-25', '5', 'BI26XjdzUw', 'Joel@Curabitur.org', 492, 'A'),
  (92, 'MacKensie', 'EKhSul58za', '2020-08-24', '8', 'q2pTioR4Op', 'Ian@Cum.gov', 161, 'B'),
  (93, 'Lillith', 'A4lOgc6gyG', '2020-08-23', '4', 'lTSp8Mgu6I', 'Derek@Duis.us', 481, 'B'),
  (94, 'Kadeem', 'S5LSJRLgnr', '2020-08-23', '9', 'QPZOTfQHPK', 'Leandra@Lorem.gov', 180, 'A'),
  (95, 'Tanner', 'coWLwhwPzE', '2020-08-23', '7', 'NWW53SPvpC', 'Beau@turpis.com', 891, 'B'),
  (96, 'Upton', 'GNUH6XxgFb', '2020-08-23', '4', 'p9Ne75uQXk', 'Aquila@tellus.net', 322, 'B'),
  (97, 'Leslie', 'ypFaZeq0TM', '2020-08-24', '10', 'kTw2M8oGn8', 'Unity@porta.com', 657, 'A'),
  (98, 'Fallon', 'GhJs2GqvbW', '2020-08-24', '0', 'IbmUrQ49KW', 'Constance@dui.net', 578, 'B'),
  (99, 'Miranda', 'aWHeoGOdum', '2020-08-22', '4', 'dT7ChhXeYB', 'Ruth@eleifend.com', 888, 'A'),
  (100, 'Cheyenne', 'oUfBgyn0gM', '2020-08-25', '10', 'VdJlpYfxtr', 'Stephanie@tristique.edu', 248, 'B'),
  (101, 'Grady', 'U2GLbxXv8w', '2020-08-25', '3', 'dMcYf3PqPu', 'Erich@Vivamus.org', 831, 'A'),
  (102, 'Wallace', 'dkIII9gPtq', '2020-08-25', '4', 'gne86LDswG', 'Sierra@semper.com', 912, 'A'),
  (103, 'Tate', '4lA54KAwMG', '2020-08-25', '7', 'CNp4qleP3R', 'Andrew@enim.org', 835, 'B'),
  (104, 'George', 'aM0USpaYmx', '2020-08-22', '1', '2R7Egltes6', 'Kitra@Etiam.net', 975, 'B'),
  (105, 'Briar', 'bLYAcN156N', '2020-08-27', '4', 'BMEpoOaQ06', 'Abbot@suscipit.us', 144, 'B'),
  (106, 'Zephr', 'ibw2AlxuNE', '2020-08-28', '6', 'E0mAFl1SV1', 'Aladdin@porttitor.org', 952, 'A'),
  (107, 'Preston', '14B9iMtsI1', '2020-08-28', '8', 'qWq1Ex5V2o', 'Paul@lectus.com', 73, 'A'),
  (108, 'Lance', 'DuCC7 iIBL', '2020-08-23', '5', 'b8jsuoNDnV', 'Emily@Vestibulum.gov', 207, 'B'),
  (109, 'Renee', 'D8nFmnX1wA', '2020-08-24', '8', '7FKcxm7Oeu', 'Zorita@cursus.gov', 191, 'B'),
  (110, 'Eric', 'Wd3MbFByJY', '2020-08-26', '0', 'h0ruBbySjC', 'Jerry@felis.org', 380, 'B'),
  (111, 'Ignacia', 'XAuyBOGrdq', '2020-08-22', '2', 'X3wNCb9Ik6', 'Chaney@vulputate.edu', 359, 'B'),
  (112, 'Lysandra', 'AhCN tbmsJ', '2020-08-22', '4', '5C7Ee6hbyk', 'Whoopi@ipsum.gov', 19, 'B'),
  (113, 'Brandon', 'P8GxsVHtoq', '2020-08-25', '7', 'qWE29fGANm', 'Delilah@gravida.gov', 844, 'B'),
  (114, 'Benedict', 'FNQ xCZ e6', '2020-08-23', '2', 'IM86eI0dIh', 'Adam@risus.org', 169, 'A'),
  (115, 'Tatyana', 'OIqB KJ75M', '2020-08-27', '6', 'X8oktBX8p3', 'Warren@nunc.us', 868, 'B'),
  (116, 'Constance', 'ni1nYb7VlQ', '2020-08-27', '3', 'aJkCtAKBRu', 'Hunter@felis.com', 464, 'B'),
  (117, 'Quentin', '9X03RmNKZv', '2020-08-27', '5', 'Wb8Bmr3iZj', 'Ayanna@viverra.us', 22, 'A'),
  (118, 'Adele', '0D9Sl9FY3i', '2020-08-23', '0', 'NaD94MMkAK', 'Orla@laoreet.edu', 633, 'B'),
  (119, 'Kadeem', 'Jf1jnfZsqc', '2020-08-26', '9', 'Drycl7n5Ss', 'Summer@pede.edu', 13, 'A'),
  (120, 'Daquan', 'sb9NlEa2vk', '2020-08-27', '8', 'Va2EfeFrXh', 'Natalie@neque.us', 704, 'B'),
  (121, 'Pandora', 'vSFqyne1O2', '2020-08-26', '8', 'IwFOvw7WON', 'Flynn@velit.net', 876, 'A'),
  (122, 'Lucius', 'Znyqh3QGdP', '2020-08-25', '9', 'ErCSANVLMH', 'Ali@ipsum.gov', 516, 'B'),
  (123, 'Ivana', '62g 9UsPNu', '2020-08-28', '4', 's9uivHX78i', 'Madonna@pede.org', 712, 'B'),
  (124, 'Sophia', 'eYpzw88H6F', '2020-08-27', '6', 'NuogNXie7b', 'Dexter@hendrerit.org', 413, 'B'),
  (125, 'Lee', 'Z16qZjRaSY', '2020-08-27', '9', 'nuuReuIEtS', 'Gil@tincidunt.net', 673, 'B'),
  (126, 'Melvin', 'gCu7JnJPed', '2020-08-22', '4', 'QDiNMangbv', 'Susan@est.com', 65, 'A'),
  (127, 'Edward', 'tOv9yfAv8I', '2020-08-22', '7', 'AFxZaP7nP4', 'Driscoll@vel.com', 995, 'A'),
  (128, 'Tad', 'HalRcmIiEg', '2020-08-25', '9', 'fiKu5ZzRqZ', 'Nicholas@lacus.org', 120, 'A'),
  (129, 'Yasir', 'o8 wB5HRLi', '2020-08-28', '3', 'f1CPhZSLZC', 'Kai@id.edu', 985, 'B'),
  (130, 'Kirestin', 'jKeM2jJS6p', '2020-08-26', '0', 'CyFWnlDRGb', 'Janna@sociis.org', 452, 'B'),
  (131, 'Chase', 'RQ5Oj6oaRh', '2020-08-24', '3', '8ii8SiUHJ5', 'Kelsey@rhoncus.edu', 739, 'B'),
  (132, 'Abbot', 'eaazEYCzFz', '2020-08-26', '7', 'anvJYIPxTc', 'Xenos@aliquet.edu', 47, 'A'),
  (133, 'Nolan', 'd15YT19WuG', '2020-08-28', '4', 'W6IQYN1R2F', 'Garrett@congue.org', 88, 'A'),
  (134, 'Alfonso', 'NNa9GyqzIQ', '2020-08-28', '1', 'U9IESBJkcl', 'Audra@per.gov', 166, 'A'),
  (135, 'Zeus', 'ZbS6689mgs', '2020-08-27', '6', 'L8cjhqh1rB', 'Yasir@accumsan.org', 89, 'B'),
  (136, 'Julian', '9ZRJfkP9PI', '2020-08-24', '3', 'a1asOJttDj', 'Vladimir@netus.us', 393, 'A'),
  (137, 'Shannon', 'DXusIzNnQT', '2020-08-28', '9', 'TMRNu2MDwj', 'Elliott@pretium.net', 299, 'B'),
  (138, 'Seth', 'lZaKLA Qop', '2020-08-25', '3', 'RzTqPxUQUa', 'Blaze@lorem.gov', 752, 'B'),
  (139, 'Donovan', 'hVl3HHnuHn', '2020-08-27', '2', 'HKmG7MDiVq', 'Jared@feugiat.gov', 816, 'B'),
  (140, 'Preston', 'WFqk6hvpkF', '2020-08-27', '2', 'PMk1ULoBVZ', 'Zahir@sed.edu', 92, 'A'),
  (141, 'Christopher', 'W Wrjc rOX', '2020-08-25', '1', 'ZYKpwKTbla', 'Holmes@inceptos.gov', 360, 'A'),
  (142, 'Nicole', 'SHUNr9p7P9', '2020-08-22', '1', 'sOvzt7qWAJ', 'Jamal@inceptos.org', 739, 'A'),
  (143, 'Zeus', 'cUpjxutE1Y', '2020-08-25', '10', 'RMdhaPctqL', 'Astra@Curabitur.org', 143, 'A'),
  (144, 'Maisie', 'c88HfSKB5W', '2020-08-23', '3', '3LUGcT9dWh', 'Stacy@Aliquam.com', 473, 'A'),
  (145, 'Sarah', '4MH7MlB mY', '2020-08-26', '2', 'ktwB1y1TTf', 'Mara@et.edu', 517, 'B'),
  (146, 'Kirsten', 'gEil2 8ZBD', '2020-08-28', '3', 'bNX4vJi790', 'Aphrodite@bibendum.us', 356, 'A'),
  (147, 'Eleanor', 'eh8qTGfSwR', '2020-08-24', '9', 'a8zxpbvREl', 'Vivien@pretium.net', 213, 'B'),
  (148, 'Suki', 'bByY51aLbV', '2020-08-24', '7', 'bWv3EVBf9S', 'Lamar@eros.gov', 170, 'A'),
  (149, 'Murphy', 'ayzHmbdBn6', '2020-08-27', '7', 'aidvEacipM', 'Silas@Sed.gov', 735, 'A'),
  (150, 'Chester', 'ceoDWEPnRy', '2020-08-26', '1', 'RL5ALj2Ugl', 'Curran@dis.com', 10, 'A'),
  (151, 'Uriah', 'tAT95WyuSd', '2020-08-25', '8', 'svII1oj1Ph', 'Lyle@Class.gov', 665, 'B'),
  (152, 'Susan', 'E8JlI5NXxv', '2020-08-27', '2', 'GCvO7B8Axv', 'Dylan@Lorem.com', 315, 'A'),
  (153, 'Irma', 'hAGP1B76Ow', '2020-08-26', '4', 'iw3ZHiShcH', 'Reese@venenatis.gov', 28, 'A'),
  (154, 'Colin', 'aUCm1ayRmb', '2020-08-23', '5', 'jf3ASa6aiq', 'Constance@torquent.com', 799, 'A'),
  (155, 'Andrew', 'SRzzHTUoyD', '2020-08-23', '8', 'sMJUjjlxES', 'Halee@porta.com', 958, 'A'),
  (156, 'Evan', 'J0AujwUlNB', '2020-08-25', '3', 'e8YfStgg9Q', 'Kirk@turpis.edu', 529, 'B'),
  (157, 'Joshua', '6ypngfFBx2', '2020-08-28', '1', 'dChV3DJjk4', 'Laurel@purus.gov', 650, 'A'),
  (158, 'Fallon', '7Whp4TTxoU', '2020-08-24', '1', 'l4By3PQOwb', 'Jenna@purus.gov', 81, 'B'),
  (159, 'Samson', 'CQpsIyqOKo', '2020-08-28', '6', 'Y0ewyzPzd8', 'Kiayada@ullamcorper.gov', 273, 'B'),
  (160, 'Wayne', 'Iq1LFJnENh', '2020-08-26', '9', 'yNfE8NAA0u', 'Constance@augue.com', 848, 'A'),
  (161, 'Jesse', 'CcrKiwVuQd', '2020-08-22', '1', 'hZLuC15kFj', 'Ralph@magnis.edu', 930, 'B'),
  (162, 'Grace', 'yacuUGOqm7', '2020-08-27', '3', '3gly8m2GTy', 'Timon@ultrices.edu', 479, 'B'),
  (163, 'Naida', 'OHX9npRl7H', '2020-08-25', '4', 'TyiWn8tTPS', 'Katelyn@quis.net', 463, 'B'),
  (164, 'Kellie', 'rvIE8EGtRl', '2020-08-25', '0', 'R7szi3qDt6', 'Armand@felis.com', 257, 'A'),
  (165, 'Leo', 'l8Vtgiygor', '2020-08-27', '9', '1ReozFOFiy', 'Troy@Nam.com', 388, 'B'),
  (166, 'Nadine', '2bH13YUP8b', '2020-08-22', '7', 'l9W2mnF29p', 'Ainsley@sit.com', 655, 'A'),
  (167, 'Walker', 'orB45nEaS7', '2020-08-23', '0', '9kg8pQ5kOJ', 'Akeem@inceptos.org', 370, 'A'),
  (168, 'Madeline', 'JLOC4a WLv', '2020-08-26', '10', 'ZG1WodibR4', 'Gail@vitae.com', 747, 'B'),
  (169, 'Stephanie', 'ish1rM0Gj5', '2020-08-22', '10', '2pZwCizVtI', 'Hunter@turpis.gov', 773, 'A'),
  (170, 'Joshua', 'sY 6iiwjZD', '2020-08-24', '2', 'GMjmXYFd4c', 'Megan@sollicitudin.us', 500, 'A'),
  (171, 'Cain', 'G0s3 KJNdL', '2020-08-28', '8', 'DknlLFz6O9', 'Lane@parturient.gov', 894, 'A'),
  (172, 'Jada', 'y3slsqmTJU', '2020-08-23', '8', 'LOGA0Ls7rQ', 'Chase@sociosqu.org', 119, 'A'),
  (173, 'Quyn', 'xdFrYnFTit', '2020-08-26', '7', 'B3nmLYqoi0', 'Dustin@penatibus.gov', 694, 'B'),
  (174, 'Medge', 'qkmio8x6UD', '2020-08-26', '7', '7cCKM6Cpzm', 'Theodore@gravida.com', 522, 'A'),
  (175, 'Mason', 'o8LcwxXdmh', '2020-08-26', '0', 'SeGCWNKYMg', 'Sandra@facilisi.gov', 501, 'B'),
  (176, 'Wing', 'F6jnBMVOxO', '2020-08-22', '10', 'VGZQkijR7S', 'Brianna@vulputate.net', 277, 'A'),
  (177, 'Aristotle', 'MzYaHK0n84', '2020-08-22', '0', 'WvKeFZTdUP', 'Hedwig@aptent.gov', 16, 'B'),
  (178, 'Scott', 'mGuUxtrgn2', '2020-08-26', '0', '0IfizddRSJ', 'Gabriel@lectus.com', 341, 'A'),
  (179, 'Rhonda', 'C0Q M0CD0H', '2020-08-23', '6', 'AGwJ1V5S3P', 'Madaline@cursus.edu', 645, 'B'),
  (180, 'Zahir', 'egVIs1s1Yo', '2020-08-25', '3', 'tutasjkdrz', 'Bree@tristique.org', 873, 'B'),
  (181, 'Chase', 'PjTNn2HhUL', '2020-08-28', '5', 'N4FKLrlMPf', 'Chase@ipsum.org', 957, 'B'),
  (182, 'Shannon', 'AzsqmAIoml', '2020-08-25', '3', 'RA43CIYnSu', 'Carolyn@odio.gov', 321, 'A'),
  (183, 'Julie', '2Kc7GTqFn3', '2020-08-24', '5', 'oRfLrn66gD', 'Olivia@nisi.com', 155, 'B'),
  (184, 'Rachel', 'lYqXOTCweV', '2020-08-24', '6', 'j3CLWGMWuu', 'Kylie@gravida.org', 650, 'B'),
  (185, 'Maggie', 'B5cfWRz78m', '2020-08-28', '6', 'M2EHDr4lMv', 'Jasmine@convallis.gov', 41, 'A'),
  (186, 'Maggie', '4T0BEtszkk', '2020-08-24', '5', 'zyvXSwgXAT', 'Samantha@massa.us', 843, 'A'),
  (187, 'Carter', 'qZFQjw4vF0', '2020-08-27', '5', 'lN1c1V0djJ', 'Zachery@nec.us', 491, 'B'),
  (188, 'Hedy', 'VWy9yDihbC', '2020-08-23', '9', 'CgvREU4Fmb', 'Leilani@mus.net', 558, 'B'),
  (189, 'Chadwick', 'noLQFWSOLj', '2020-08-28', '8', 'JSkdgtmO7d', 'Kirk@viverra.gov', 180, 'A'),
  (190, 'Marvin', 'jkl3zJ20Xq', '2020-08-27', '1', '7O0eKmm8jJ', 'Tad@id.us', 890, 'B'),
  (191, 'Darryl', 'VsQaMUcL2z', '2020-08-26', '1', 'FPHcKpONAS', 'Dawn@natoque.edu', 869, 'A'),
  (192, 'Gregory', 'MoCgyaE1kj', '2020-08-22', '1', '78cDRAHXte', 'Cherokee@pellentesque.net', 607, 'B'),
  (193, 'Dieter', 'rO6iKntMbH', '2020-08-22', '5', 'uzK6UUQgVj', 'Orlando@laoreet.us', 46, 'A'),
  (194, 'Mercedes', 'xHyYJj3FDg', '2020-08-26', '0', 'b8b275MA29', 'Kyle@rutrum.gov', 460, 'A'),
  (195, 'Kirsten', 'qOpQCmONRT', '2020-08-26', '0', 'BvT4d77P0R', 'Rana@feugiat.net', 494, 'B'),
  (196, 'Cade', 'VfUFvyMnYD', '2020-08-27', '5', 'uLePy7G4nX', 'Odessa@cursus.org', 973, 'A'),
  (197, 'Sydney', 'daZUVsqqd1', '2020-08-24', '9', 'wOFOSIh9Dw', 'Ebony@convallis.edu', 819, 'B'),
  (198, 'Connor', 'igxq7N1Xpj', '2020-08-27', '10', 'yDQHVLh9Zs', 'Cameron@aptent.us', 691, 'B'),
  (199, 'Driscoll', 'm YiuC1P0b', '2020-08-28', '3', 'puTwEQmXd7', 'Stephanie@tellus.net', 331, 'A'),
  (200, 'Brett', 'eHeMjmiQwc', '2020-08-27', '3', '6pfRCYKb9Z', 'Lynn@lacus.edu', 62, 'A'),
  (201, 'Beck', 'GfNHJFn24z', '2020-08-26', '1', 'HrjcdBGVhc', 'Malik@Nunc.com', 943, 'A'),
  (202, 'Jared', 'pI5cxNiCvF', '2020-08-27', '9', '8bO8bTtJ4A', 'Laurel@suscipit.com', 976, 'B'),
  (203, 'Rachel', 'Hok3f3OhEH', '2020-08-26', '3', 'X3cPRkQpzL', 'Uriah@neque.net', 952, 'B'),
  (204, 'Cole', 'BayFfyWn2K', '2020-08-26', '6', 'BaOWUvmbMG', 'Shana@ante.edu', 849, 'A'),
  (205, 'Scarlett', 'T0NFVr4kV7', '2020-08-24', '6', 'rJRyWt0ul1', 'Steven@commodo.net', 536, 'A'),
  (206, 'Gavin', 'aaAGpY wY0', '2020-08-28', '3', 'FmhqPX1OOR', 'Nissim@sociis.gov', 66, 'A'),
  (207, 'Xandra', 'lQRQf4zIdb', '2020-08-24', '10', 'v0GiYrABou', 'Evelyn@Vivamus.com', 142, 'A'),
  (208, 'Forrest', 'qOAQUHMzeA', '2020-08-26', '8', 'D6fO039h3X', 'Alyssa@eleifend.us', 776, 'A'),
  (209, 'Jarrod', 'nV3eWmnE0W', '2020-08-22', '1', 'sbajTnDUMv', 'Matthew@posuere.net', 9, 'A'),
  (210, 'Hope', 'X3XaWErjkM', '2020-08-26', '5', 'AH8YkO8IE7', 'Rigel@ipsum.gov', 637, 'A'),
  (211, 'Alan', 'kH8eFRttje', '2020-08-25', '1', '5wSZ4UbxkA', 'Dana@morbi.us', 999, 'A'),
  (212, 'Flynn', 'PvHSXIhSbY', '2020-08-24', '1', 'k0nJkwNzaG', 'Danielle@Curae.org', 856, 'B'),
  (213, 'Aline', 'DKiu52hGyy', '2020-08-22', '8', '8wEpVl3fYn', 'Gay@vestibulum.com', 833, 'B'),
  (214, 'Henry', 'd9UQtqfwP6', '2020-08-26', '3', 'L98WXuggdq', 'Aimee@primis.gov', 210, 'B'),
  (215, 'Holmes', 'PHUZZ70Spf', '2020-08-28', '7', 'pgTEgk5wFk', 'Hollee@In.edu', 341, 'B'),
  (216, 'Castor', 'y5oo7wbB4x', '2020-08-24', '1', '4CyONUO7jI', 'Acton@nibh.net', 65, 'B'),
  (217, 'Conan', 'MOt88X8EM ', '2020-08-23', '7', 'jJFJcLedds', 'Jarrod@sociis.us', 851, 'A'),
  (218, 'Ella', 'D9MFqEgb1R', '2020-08-24', '4', 'qNBez3GDMe', 'Walker@pretium.edu', 120, 'B'),
  (219, 'Nina', 'HFpUNbGYGq', '2020-08-24', '5', 'eGVd8B29au', 'Phoebe@Curabitur.com', 879, 'A'),
  (220, 'Lillith', 'F44NUhnnsP', '2020-08-28', '4', 'kwnI8anauQ', 'Marny@quis.edu', 665, 'A'),
  (221, 'Candace', 'zwlTV94s9O', '2020-08-26', '7', 'odcbFxWwuc', 'Akeem@molestie.net', 288, 'B'),
  (222, 'Abdul', 'h6nCDzF5Zs', '2020-08-26', '9', 'D4pCKhj4bL', 'Yoshio@in.com', 698, 'A'),
  (223, 'Cullen', 'dPdreYuWXs', '2020-08-26', '6', 'rofz5hzhUt', 'Karyn@mus.net', 355, 'B'),
  (224, 'Quon', '4advDn2w H', '2020-08-24', '8', '3InnH9iDPx', 'Fitzgerald@mi.gov', 65, 'B'),
  (225, 'Gray', 'zezd8OqPQV', '2020-08-28', '2', 'oB1L51Ag0v', 'Beau@ridiculus.gov', 768, 'A'),
  (226, 'Heidi', '9HWBZJBQBr', '2020-08-27', '3', 'nAijId9iK2', 'Kevin@In.gov', 607, 'B'),
  (227, 'Caldwell', 'Gp1nMZtPhQ', '2020-08-24', '10', 'wmci5yvCdA', 'Martin@morbi.edu', 876, 'A'),
  (228, 'Sacha', 'vdpNoZxevl', '2020-08-27', '4', 'j4FYIZz5yD', 'Xantha@Donec.us', 689, 'B'),
  (229, 'Kiayada', '0tEsDG9aM5', '2020-08-28', '2', 'ZklaKMNFL3', 'Levi@ullamcorper.gov', 419, 'B'),
  (230, 'Sharon', 'HRKlr F8oG', '2020-08-22', '6', 'OnTXbUp5A0', 'Linus@penatibus.us', 721, 'B'),
  (231, 'Dante', 'QoASiUs3Wc', '2020-08-27', '0', 'LYGPOljrBX', 'Dara@neque.org', 793, 'A'),
  (232, 'Burke', 'pvT7Rad0BM', '2020-08-22', '6', 'fvLVJGv5Uj', 'Dean@consectetuer.com', 343, 'A'),
  (233, 'Zachery', 'VecEEJNfaF', '2020-08-28', '2', 'lbem5Dpwmb', 'Maryam@adipiscing.edu', 712, 'B'),
  (234, 'Martena', 'HyjcxA4D1Q', '2020-08-24', '5', '12IzzfPg8o', 'Harding@pharetra.org', 898, 'A'),
  (235, 'Kyra', 'ZQsBSB AEb', '2020-08-24', '4', '1qqdEDUu7W', 'Hyacinth@Etiam.edu', 612, 'A'),
  (236, 'Illiana', 'H1DBgDDqGk', '2020-08-26', '10', '3FlMm0jfEl', 'Rae@taciti.com', 493, 'A'),
  (237, 'Keely', 'oKizhPPw2t', '2020-08-26', '5', 'hfcZJlOkBM', 'Gray@convallis.net', 318, 'B'),
  (238, 'Tyrone', 'W2Rk6FxwRz', '2020-08-27', '1', 'EYlbQ4Peh6', 'Whilemina@fames.us', 691, 'B'),
  (239, 'Caleb', 'RuR0pDfzxC', '2020-08-26', '0', 'lA6zRatxDa', 'Alden@commodo.edu', 362, 'A'),
  (240, 'Nathaniel', 'lzUf18ICxc', '2020-08-23', '8', 'ysJitW4pFQ', 'Elaine@facilisis.net', 544, 'B'),
  (241, 'Alvin', '45ThYGAbcw', '2020-08-26', '0', '21OlPHRXoS', 'Lyle@lectus.com', 724, 'B'),
  (242, 'Colt', 'Md2gblZ52h', '2020-08-22', '6', '9GJjNLCTtm', 'Zelenia@sapien.edu', 160, 'B'),
  (243, 'Hilel', 'jtjZhJbrDh', '2020-08-24', '4', 'QkiCNyRNcA', 'Hannah@imperdiet.org', 396, 'A'),
  (244, 'Rhona', 'KTVVypaKih', '2020-08-28', '9', 'GTQLFgjx7U', 'Stewart@nonummy.gov', 553, 'B'),
  (245, 'Rana', 'oCk4QuCArR', '2020-08-24', '3', '4GOaKBBKR9', 'Reuben@purus.edu', 947, 'B'),
  (246, 'Addison', 'FjiSHFlMnr', '2020-08-24', '0', 'S6XCkd4fyy', 'Vera@nonummy.gov', 803, 'B'),
  (247, 'Shaeleigh', 'pIiy4TOJJm', '2020-08-26', '4', 'u0btd8lFa9', 'Rama@sodales.net', 604, 'A'),
  (248, 'Gareth', 'ek8gId3 Wj', '2020-08-27', '7', 'e2vYfnZydT', 'Nash@tempus.us', 820, 'B'),
  (249, 'Warren', 'PilAgYJztu', '2020-08-27', '6', 'odTVUdUY5c', 'Joshua@ac.gov', 331, 'B'),
  (250, 'Dane', 'lz hxrt9xa', '2020-08-22', '5', 'mnfxDb0Kjh', 'Nicholas@auctor.com', 935, 'B'),
  (251, 'Bianca', 'jgnnkDXjsE', '2020-08-27', '8', '3rCLnsAqXR', 'Isabella@ultrices.gov', 383, 'A'),
  (252, 'Hayden', 'E20TtAFgos', '2020-08-25', '2', 'RkDqwaC5vR', 'Marcia@pulvinar.org', 942, 'A'),
  (253, 'Samuel', 'mydHmNs5HE', '2020-08-28', '3', '5rKvjohfOH', 'Heather@nisi.gov', 509, 'A'),
  (254, 'Lucian', 'w JdR1WUmn', '2020-08-28', '6', 'BBo7amDNJR', 'Jared@porta.org', 700, 'A'),
  (255, 'Colt', 'kCgMW28PCk', '2020-08-22', '9', 'olPANGODST', 'Kato@volutpat.us', 28, 'B'),
  (256, 'Hyatt', 'GE763wvnhl', '2020-08-22', '8', 'LaatF0sQF4', 'Ayanna@suscipit.org', 357, 'B'),
  (257, 'Astra', 'rN95IjKGWp', '2020-08-22', '2', 'FIdAr6CRk3', 'Dorian@turpis.com', 868, 'A'),
  (258, 'Georgia', 'ewkxAUl9Tg', '2020-08-26', '9', 'jpHTs8qEcI', 'Jesse@Curabitur.com', 30, 'B'),
  (259, 'Chantale', 'I03Sv4pjeB', '2020-08-24', '4', 'X835eG4Bdi', 'Jakeem@arcu.us', 582, 'A'),
  (260, 'Salvador', '0PbCe6axVM', '2020-08-25', '3', 'a3pchcOBaN', 'Brenden@aptent.net', 268, 'A'),
  (261, 'Geoffrey', 'hQmo lPbcw', '2020-08-23', '2', 't2myXiZSGx', 'Merritt@orci.org', 744, 'B'),
  (262, 'Rachel', 'QdDSm98k5g', '2020-08-28', '5', 're8LVgMBTH', 'Aspen@hymenaeos.gov', 412, 'A'),
  (263, 'Anne', 'ADdIcE42qI', '2020-08-22', '5', 'eTnobNLOqm', 'Grady@venenatis.gov', 749, 'B'),
  (264, 'Ishmael', '1DawYBAS5y', '2020-08-26', '3', 'vt1JS2NkFW', 'Imelda@congue.gov', 799, 'B'),
  (265, 'Deanna', 'CRu3jzGVyg', '2020-08-24', '8', 'U0JqcOgW7t', 'Clinton@hymenaeos.edu', 540, 'B'),
  (266, 'Ruby', 'GkqJv4HVoa', '2020-08-28', '1', 'wBFSnMrDwM', 'Christen@parturient.net', 874, 'A'),
  (267, 'Carolyn', 'LmQ7TCTw0d', '2020-08-25', '7', 'I6m3RRMtKf', 'Jemima@nostra.edu', 111, 'B'),
  (268, 'Hashim', 'XDgFQAGOgM', '2020-08-25', '1', 'rBnVFNmPPy', 'Lacy@in.org', 280, 'A'),
  (269, 'Helen', 'gFw9IDEaJJ', '2020-08-22', '9', '17yy1Gvr9U', 'Sopoline@pellentesque.edu', 565, 'A'),
  (270, 'Hop', '2KXmI1MA2F', '2020-08-22', '1', 'q2fNAtHZab', 'Nash@iaculis.org', 507, 'B'),
  (271, 'Charlotte', 'Vm5Gl62TMu', '2020-08-25', '7', 'eurdLWBXWi', 'Abigail@accumsan.org', 472, 'A'),
  (272, 'Megan', '7A3aQQZv2X', '2020-08-22', '9', 'EFsNz3feUE', 'George@feugiat.gov', 311, 'A'),
  (273, 'Beverly', 'mKF6XCwEkN', '2020-08-26', '10', '9qD0G5bWDX', 'Knox@facilisi.us', 300, 'B'),
  (274, 'Emily', '5SsPLtvUEA', '2020-08-25', '7', 'YJKAtmtfxq', 'Hedy@primis.us', 127, 'A'),
  (275, 'Nita', '0ELidAnBpY', '2020-08-23', '5', 'AxXghxtI6d', 'Tamekah@ridiculus.gov', 470, 'B'),
  (276, 'Gwendolyn', 'ogvaiyVhJT', '2020-08-25', '10', 'YwRGO3nbP6', 'Jacob@Aliquam.org', 336, 'B'),
  (277, 'Chantale', 'jq20R8GsQ9', '2020-08-24', '10', 'CBwe3Td3pa', 'Teegan@eleifend.gov', 185, 'B'),
  (278, 'Karina', ' qBldnVH8o', '2020-08-27', '5', '8L5oRj3qS4', 'Fay@lorem.com', 315, 'A'),
  (279, 'Herman', 'LypV6cnwVb', '2020-08-25', '5', '6zqWilOJiM', 'Imelda@orci.us', 358, 'B'),
  (280, 'Sasha', 'A gDpibitU', '2020-08-27', '6', 'b94zU3J2st', 'Amos@convallis.org', 579, 'B'),
  (281, 'Laura', 'dGCin9NJWZ', '2020-08-26', '3', 'gpSdTbXjbp', 'Nell@Pellentesque.org', 715, 'A'),
  (282, 'Cassidy', 'dBI8eigrCO', '2020-08-27', '4', 'UOYKJsAKPq', 'Jared@purus.com', 683, 'B'),
  (283, 'Adria', '4eW05Wg2Po', '2020-08-27', '6', 'rJ7NNakKga', 'Gil@condimentum.com', 681, 'A'),
  (284, 'Deacon', '52v57uCWY0', '2020-08-24', '1', '953bNhTw3e', 'Jarrod@pellentesque.com', 179, 'A'),
  (285, 'Mercedes', 'RLK4xtqrzK', '2020-08-28', '10', 'fip0bFbARq', 'Signe@quis.edu', 430, 'B'),
  (286, 'Salvador', 'Zy44F0XJJ4', '2020-08-27', '5', 'u7mx5CdNo0', 'Irene@posuere.gov', 250, 'A'),
  (287, 'Kieran', 'fcz kaGHtS', '2020-08-28', '0', 'Pu7ldzXJUY', 'Ezra@eu.org', 890, 'B'),
  (288, 'Len', '9IWJQUj01I', '2020-08-26', '3', 'LdX72NqBGQ', 'Anastasia@torquent.edu', 770, 'B'),
  (289, 'Galena', 'VZCcUbdo3T', '2020-08-28', '8', '4V0fjzdiW4', 'Abra@consectetuer.edu', 19, 'B'),
  (290, 'Whoopi', 'YZm1bXhnLa', '2020-08-25', '0', 'FaCzgMoqdL', 'Zane@in.org', 533, 'B'),
  (291, 'Penelope', 'QQj0q7Z7dg', '2020-08-24', '4', '3826yF3bj6', 'Jamalia@natoque.net', 515, 'A'),
  (292, 'Brent', '3n31kt7S1P', '2020-08-27', '1', 'IPENCOBAeT', 'Keaton@id.org', 910, 'A'),
  (293, 'Fulton', '1zMfAMrlUM', '2020-08-22', '9', 'wYWpCBKRqf', 'Aiko@aliquet.org', 598, 'B'),
  (294, 'Shelby', 'E3i9w4qUcs', '2020-08-26', '9', '5sOqYfA90D', 'Rama@fermentum.net', 553, 'A'),
  (295, 'Warren', 'edZnWc629H', '2020-08-22', '8', 'tRPFJAcU2F', 'Buffy@id.us', 727, 'B'),
  (296, 'Jamalia', 'QsJhzfvXKk', '2020-08-27', '4', '7LdluYbvxu', 'Rhoda@ullamcorper.us', 132, 'B'),
  (297, 'Hammett', 'LGRXUDDJ1F', '2020-08-23', '5', 'CMAKAkv9c6', 'Erica@Nunc.edu', 639, 'A'),
  (298, 'Pascale', 'iOQ8qxoFsr', '2020-08-25', '6', 'axgorY4Smo', 'Rhonda@est.us', 946, 'B'),
  (299, 'Yolanda', 'wtMbjYe3tG', '2020-08-22', '6', 'NVl86SEWc1', 'Dexter@Proin.org', 944, 'B'),
  (300, 'Fallon', '4CTInE5ZgK', '2020-08-25', '3', 'F9jhyNbjLG', 'Hope@Aliquam.edu', 765, 'A'),
  (301, 'Gretchen', 'WnjjfdTd H', '2020-08-27', '6', 'K74E7UI8PP', 'Amy@Phasellus.us', 589, 'A'),
  (302, 'Simon', 'K mB2Y6rpU', '2020-08-26', '8', 'nNx5JmNmr8', 'Wyatt@Maecenas.net', 317, 'B'),
  (303, 'Grady', 'NXKv AtLGl', '2020-08-26', '2', 'G9huR4t9OR', 'Cadman@diam.edu', 530, 'A'),
  (304, 'Dana', 'I2y7XEhNSR', '2020-08-27', '10', 'Cx6Kl5BajF', 'Doris@Etiam.edu', 732, 'B'),
  (305, 'Palmer', 'lPlrXnL87x', '2020-08-27', '7', 'btwaMbQpr8', 'Lilah@ipsum.edu', 57, 'A'),
  (306, 'Ciara', 'wFtolfMBFm', '2020-08-25', '8', 'SFfMqn6j1e', 'Declan@quam.net', 75, 'B'),
  (307, 'Hamish', 'J25TUDAdJY', '2020-08-23', '8', '0FR3obueSF', 'Daryl@ac.org', 65, 'A'),
  (308, 'Hedy', 'bq7qMvZjI9', '2020-08-28', '5', '1EUJzmdByM', 'Alec@tellus.edu', 949, 'B'),
  (309, 'Victor', 'PnI4AS9LXc', '2020-08-24', '1', 'aeqMZ5GczN', 'Steel@parturient.net', 718, 'A'),
  (310, 'Delilah', 'T05AB6Rads', '2020-08-22', '4', 'Lj24oo41JA', 'Candace@turpis.edu', 659, 'B'),
  (311, 'Ramona', 'RjRjyHCAQM', '2020-08-27', '3', 'ep0JjAgeea', 'Shafira@adipiscing.gov', 568, 'B'),
  (312, 'Merrill', 'T7nMaMrnhm', '2020-08-24', '8', 'SK8Rtzt6o8', 'Jasper@aptent.com', 569, 'B'),
  (313, 'Chanda', 'mfNacgquJG', '2020-08-24', '2', 'HQ7YujDReG', 'Emery@nunc.gov', 835, 'B'),
  (314, 'Kamal', 'L9ppVvsX46', '2020-08-25', '1', 'QqDnUOsH5n', 'Judith@elementum.edu', 929, 'A'),
  (315, 'Cain', 'BNH7WdMgMN', '2020-08-25', '6', 'HpenJBzU8B', 'Aspen@placerat.com', 254, 'B'),
  (316, 'Chiquita', '4x7xyhfNKo', '2020-08-26', '2', 'iQZx3ycf75', 'Amela@Nulla.org', 811, 'A'),
  (317, 'Lynn', 'idgaT59A4M', '2020-08-27', '9', 'b1GGQViORY', 'Blaze@luctus.com', 733, 'A'),
  (318, 'Barbara', '4NJHeeAlAv', '2020-08-25', '7', 'OX4IMviGnK', 'Leah@turpis.com', 962, 'A'),
  (319, 'Karleigh', 'O6YlJIZDUt', '2020-08-22', '9', 'v7T3yTimRg', 'Jescie@Lorem.gov', 327, 'B'),
  (320, 'Althea', 'X0zBx4sJQS', '2020-08-28', '8', '4cirpFSw4H', 'Ivan@consequat.org', 224, 'B'),
  (321, 'Quintessa', 'jHR64hOeZQ', '2020-08-27', '4', 'OEWFuEsPkW', 'Keelie@volutpat.com', 446, 'B'),
  (322, 'Quinn', 'S8UF7kRI43', '2020-08-26', '0', 's9MrWPUL65', 'Fletcher@urna.edu', 203, 'A'),
  (323, 'Germaine', 's3Reycca1V', '2020-08-23', '8', '9iv6zczBWh', 'Ivor@varius.gov', 564, 'A'),
  (324, 'Serina', '99O4qnqs8V', '2020-08-24', '0', 'yYqtg9z975', 'Kristen@iaculis.net', 567, 'B'),
  (325, 'Riley', 'AqDhK6anBd', '2020-08-26', '0', 'SJsyQwQ3NZ', 'Calvin@ut.com', 663, 'A'),
  (326, 'Grady', 't43V9bkjD4', '2020-08-28', '6', 'OkezN2Swf2', 'Holmes@Integer.gov', 293, 'B'),
  (327, 'Jillian', 'zQCMDQ4Jvk', '2020-08-24', '0', 'fxon28mZ3d', 'Sage@ullamcorper.edu', 455, 'A'),
  (328, 'Davis', 'NZqfxn2D0i', '2020-08-25', '5', 'VCcq9Csvx6', 'Emery@Vivamus.edu', 336, 'B'),
  (329, 'Kadeem', 'K3jF43mvWn', '2020-08-25', '7', 'TauUjcEKEQ', 'Porter@morbi.net', 454, 'A'),
  (330, 'Elliott', 'S6bW9K6g2n', '2020-08-27', '0', 'b4FZwdlVBU', 'Shelley@suscipit.edu', 563, 'B'),
  (331, 'Acton', 'yZZWSlFvnv', '2020-08-24', '4', '4WMdXJZOLa', 'Genevieve@lacus.edu', 849, 'A'),
  (332, 'Brenda', '0OISnTNrLV', '2020-08-24', '7', 'nOxRQfaL20', 'Tanya@mollis.us', 930, 'B'),
  (333, 'Bernard', 'D74RSUSo7u', '2020-08-26', '7', 'lIMVF2HQzK', 'Xander@gravida.edu', 301, 'B'),
  (334, 'Gay', 'i9o x1DOrb', '2020-08-26', '2', 'BahFhs9WD3', 'Amy@enim.gov', 748, 'A'),
  (335, 'Ginger', 'cCXbYs6eMN', '2020-08-28', '2', 'kMLnpoeRNJ', 'Alexis@hymenaeos.edu', 861, 'B'),
  (336, 'Oscar', 'hNStNfAQmz', '2020-08-23', '9', 'KynWGlCbbm', 'Kieran@quam.edu', 497, 'A'),
  (337, 'Kylynn', 'csvcURIAzO', '2020-08-24', '5', '45BzoL03Ip', 'Leigh@gravida.org', 806, 'B'),
  (338, 'Elton', '1R7oIKbKJh', '2020-08-25', '6', 'Uun4gZ3Tia', 'Bruno@Pellentesque.edu', 707, 'A'),
  (339, 'Amanda', ' GqVXQURSF', '2020-08-22', '4', 'paQGmn3wOq', 'Upton@Lorem.org', 148, 'B'),
  (340, 'Aimee', 'bZEC9m75Km', '2020-08-22', '4', 'E0zxgyzYRf', 'Melissa@tempor.gov', 99, 'B'),
  (341, 'Nathan', 'UIbaPoVjx5', '2020-08-25', '7', '8uOXqW3Bpu', 'Sebastian@adipiscing.us', 549, 'B'),
  (342, 'Isabelle', 'CQyzu8zwAj', '2020-08-28', '7', 'uv9LwpKlux', 'Jessica@sed.com', 308, 'B'),
  (343, 'Bradley', 'ACjyfTU7Fb', '2020-08-22', '5', 'j5E2HB4Ib5', 'Jack@netus.org', 244, 'A'),
  (344, 'Micah', 'wz1gWyMyd9', '2020-08-24', '2', 'ibHgJCj2FH', 'Carson@Nunc.org', 314, 'B'),
  (345, 'Shad', 'QmrJ0myk8C', '2020-08-22', '7', 'ZQS3ML2QAr', 'Noble@vulputate.us', 519, 'A'),
  (346, 'Brennan', 'fsx7OpT WQ', '2020-08-24', '6', 'HJ8GqaeYU9', 'Naomi@commodo.net', 766, 'B'),
  (347, 'Kevyn', '3i53Wk7yn9', '2020-08-23', '1', 'khs2rF3eYZ', 'Brandon@sollicitudin.gov', 443, 'B'),
  (348, 'Kasimir', 'npQPtnKZfa', '2020-08-27', '9', 'roentzPAP1', 'Chava@per.us', 779, 'B'),
  (349, 'Avye', 'vpiwsqszBE', '2020-08-26', '0', 'eF3xq17On9', 'Lance@magna.org', 846, 'A'),
  (350, 'Upton', ' C QGND7YU', '2020-08-27', '10', 'PEeblzWDWS', 'Dominique@dolor.com', 537, 'B'),
  (351, 'Odessa', 'LCK VdsM8F', '2020-08-26', '1', 'RkbsdKif7T', 'Dane@Class.gov', 977, 'A'),
  (352, 'Nyssa', 'NtJYCAtRMn', '2020-08-22', '3', 'ZJGafxQxXq', 'Germane@montes.edu', 906, 'A'),
  (353, 'Kelsie', 'eT8mKWDq3e', '2020-08-27', '4', 'zX0Gu4eDy7', 'Regina@Suspendisse.us', 859, 'A'),
  (354, 'Thor', 'xyOnmJ1s i', '2020-08-26', '3', 'sBY0N4YrJj', 'Neil@leo.gov', 965, 'A'),
  (355, 'Clementine', 'IslVi588ld', '2020-08-25', '8', 'PkQzHj6IvP', 'Kirk@Cras.edu', 184, 'A'),
  (356, 'Vance', '5pVxLBmH9o', '2020-08-23', '5', 'pM7iNkTPf0', 'Dacey@erat.gov', 592, 'A'),
  (357, 'Tallulah', 'yDr2G24xcI', '2020-08-25', '4', 'nqvxMg5TYC', 'Scott@diam.org', 237, 'B'),
  (358, 'Sean', 'YbXar74HDz', '2020-08-28', '4', 'CtlQwA0PV5', 'Eric@sodales.com', 786, 'A'),
  (359, 'Lareina', 'EDluW76Id1', '2020-08-28', '4', 'sP7yCDodLo', 'Sandra@leo.us', 630, 'A'),
  (360, 'Willow', 'jStGphL0Uq', '2020-08-28', '4', 'LmYoIsD3iz', 'Sopoline@porttitor.org', 720, 'B'),
  (361, 'Ivor', 'b69PnBZmSm', '2020-08-28', '8', 'QZWw0QfH3d', 'Nell@nascetur.org', 653, 'A'),
  (362, 'Elvis', 'WOBDYQx66w', '2020-08-26', '8', 'iuwUpmar4n', 'Alden@penatibus.com', 314, 'B'),
  (363, 'Jael', 'sYA5OwRDB3', '2020-08-25', '6', 'o5xNXLFryh', 'Vance@nonummy.gov', 878, 'A'),
  (364, 'Macaulay', 'myirior9fF', '2020-08-24', '8', '3xP3TSNdDu', 'Zephr@tempor.edu', 685, 'B'),
  (365, 'Kitra', 'AqKBQS3W3u', '2020-08-22', '9', 'afaZoDjzcr', 'Mufutau@ullamcorper.gov', 710, 'A'),
  (366, 'Mari', 'kT7q6S2YSc', '2020-08-28', '5', '05UWjUK0VZ', 'Kermit@porttitor.edu', 791, 'B'),
  (367, 'Camille', 'TnZuljXzmN', '2020-08-22', '6', 'VqKx3dVVuB', 'Yasir@Vivamus.us', 425, 'A'),
  (368, 'Wilma', 'RQ4BHHuoLQ', '2020-08-28', '6', '8EGgNVMk8P', 'Hoyt@turpis.edu', 355, 'A'),
  (369, 'Riley', 'ZfuZrGSxxM', '2020-08-26', '1', 'jsoXsPXk6t', 'Lester@at.edu', 841, 'B'),
  (370, 'Destiny', 'hx4B56s2wi', '2020-08-27', '0', 'U8VzMZNs5E', 'Wade@Vestibulum.com', 82, 'B'),
  (371, 'Austin', '1 Z6BOjBNh', '2020-08-25', '7', 'VRZbq0VcvL', 'Nelle@libero.org', 611, 'B'),
  (372, 'Francis', '0Wa5h9p48x', '2020-08-23', '0', 'bf40i37WKJ', 'Sawyer@libero.gov', 984, 'B'),
  (373, 'Zeus', 'JVzZaCueIq', '2020-08-23', '3', 'OArSO8FS5G', 'Myles@Nullam.org', 704, 'B'),
  (374, 'Frances', 'uqz5UxfiCQ', '2020-08-27', '10', 'iZnMAvYwdc', 'Arthur@porta.us', 719, 'A'),
  (375, 'Cassandra', 'dGj6tTS9 5', '2020-08-25', '1', 'qdRmwARSlh', 'Margaret@eleifend.org', 733, 'B'),
  (376, 'Alfreda', 'fqmI6yGTyF', '2020-08-22', '4', 'VKKlG6pezr', 'Hilda@aptent.com', 258, 'A'),
  (377, 'Celeste', 'Qq1qVw2RmG', '2020-08-25', '5', '4v9g2KUIdK', 'Ora@mollis.org', 593, 'B'),
  (378, 'Tashya', 'cSQuCyXI w', '2020-08-28', '5', 'YjFCQfxtsh', 'Idola@Nulla.net', 956, 'A'),
  (379, 'Darryl', 'z2etAltlq0', '2020-08-22', '9', '3XlNAisjrO', 'Cain@hymenaeos.edu', 435, 'A'),
  (380, 'Reuben', '18hLLHFqxV', '2020-08-25', '7', '5KE4Nb5oVx', 'Nina@litora.us', 410, 'B'),
  (381, 'Denise', 'Nnhj1vY7Sh', '2020-08-23', '2', 'gJDQX6cKvs', 'Kuame@dapibus.us', 152, 'B'),
  (382, 'Driscoll', 'NN0UN0BUHZ', '2020-08-24', '1', '1JjtqKK4Ea', 'Yardley@venenatis.gov', 765, 'A'),
  (383, 'Ignatius', 'CG KHNqFSU', '2020-08-25', '0', 'XgpxDGHfj9', 'Marcia@justo.gov', 534, 'A'),
  (384, 'Kevin', 'moOd1gBha7', '2020-08-22', '9', 'CwCT4Pgi2g', 'Leonard@sagittis.edu', 831, 'B'),
  (385, 'Aaron', 'oCpFUCEfqA', '2020-08-28', '1', 'tyu5G6SmpP', 'Carlos@Proin.us', 331, 'A'),
  (386, 'Rowan', '4obKEtjGES', '2020-08-27', '0', 'DqXk2YfZrx', 'Hiram@lacus.com', 620, 'A'),
  (387, 'Connor', 'zjjniz hK4', '2020-08-24', '1', 'AKTPybtTow', 'Dora@netus.org', 266, 'A'),
  (388, 'Guinevere', 'cpG8OROQWa', '2020-08-27', '8', 'TUF6P9kAE7', 'India@aptent.us', 156, 'A'),
  (389, 'Nelle', 'OhfpWivp9y', '2020-08-24', '9', '46z3cmIwAS', 'Gannon@Curae.org', 206, 'A'),
  (390, 'Ishmael', 'YL 1Q7Pzgv', '2020-08-25', '5', '5qeU23CHL1', 'Orson@velit.org', 711, 'B'),
  (391, 'Yuri', 'hdDs4 lAM5', '2020-08-27', '2', 'VQjEVJnwcS', 'Charles@pulvinar.com', 878, 'A'),
  (392, 'Kiona', 'RySezHo7lv', '2020-08-23', '8', 'T3ovAjiesm', 'Kenyon@faucibus.us', 741, 'A'),
  (393, 'Marny', '2h3NnZhzHE', '2020-08-28', '2', 'wCNLkjEAy8', 'Leslie@consectetuer.org', 294, 'B'),
  (394, 'Alexa', 'yO2qH96UQu', '2020-08-28', '4', 'F8SPVmOFgL', 'Carla@penatibus.net', 991, 'A'),
  (395, 'Francis', '3SSKwucjqz', '2020-08-24', '10', 'tpY13L3vT1', 'Palmer@volutpat.org', 780, 'B'),
  (396, 'Anjolie', '4PmNEyUf2m', '2020-08-25', '4', 'q9vwMwMqhI', 'Cadman@Ut.gov', 812, 'B'),
  (397, 'Jeremy', 'vMMsEoR i0', '2020-08-23', '0', 'A0H8jXFh0p', 'Keefe@mattis.net', 464, 'A'),
  (398, 'Bree', 'UBUmVvpM48', '2020-08-25', '1', 'E4sVbMQJqT', 'Indigo@ut.net', 369, 'A'),
  (399, 'James', 'llnbVkZPRJ', '2020-08-25', '9', 'y6F7hoQtM8', 'Alexa@lectus.org', 190, 'B'),
  (400, 'Steven', '2psiVrRy9P', '2020-08-24', '8', 'Nb9A6AxOYG', 'Alma@conubia.net', 608, 'A'),
  (401, 'Hector', 'Rr9AxWbJXl', '2020-08-25', '1', 'dMGQhDIEEY', 'Aretha@Donec.us', 856, 'A'),
  (402, 'Imelda', 'UuPws8J0Td', '2020-08-27', '4', 'qhpwhlmcAs', 'Kaye@nascetur.com', 67, 'B'),
  (403, 'Nigel', 'ozQLIJ3d0R', '2020-08-24', '1', '8Ncf4zaKD2', 'Allistair@semper.org', 139, 'A'),
  (404, 'Gary', '1T7OVx4Qc3', '2020-08-23', '9', '6cq0ShSroy', 'Ira@aptent.com', 222, 'B'),
  (405, 'Geoffrey', 'GvNaet9dKS', '2020-08-25', '3', 'EUdu5pem3B', 'Ian@purus.com', 814, 'A'),
  (406, 'Flynn', '5Ve4ItB0Jk', '2020-08-28', '6', 'dFgiDKJRtj', 'Yen@elementum.edu', 551, 'B'),
  (407, 'Kieran', 'pQbe5WS2JG', '2020-08-28', '8', 't1uBUmHTlP', 'Daria@massa.us', 306, 'A'),
  (408, 'Isaac', 'W55xPNN0Ch', '2020-08-26', '2', 'KRsxQsR5V9', 'MacKensie@facilisis.us', 192, 'B'),
  (409, 'Mark', 'ttcVw1u1pc', '2020-08-23', '1', 'yWRJgko3hO', 'Jana@ultrices.net', 372, 'B'),
  (410, 'Kellie', 'Qrq9k0UBsA', '2020-08-25', '5', '4y8Xl0qHC7', 'Zelda@malesuada.net', 315, 'B'),
  (411, 'Griffin', 'NAlLp2OuqG', '2020-08-25', '0', 'qpSBHU8ayG', 'Raven@tortor.org', 999, 'A'),
  (412, 'Linda', '5RdHjX Icf', '2020-08-28', '1', '6hReQbxUpu', 'Lamar@in.net', 764, 'A'),
  (413, 'Sharon', 'ppq2nQcpaD', '2020-08-28', '2', 'xAf4x1V7o0', 'Curran@dignissim.org', 242, 'B'),
  (414, 'Palmer', 'nKX Pwz7q4', '2020-08-28', '9', 'rPqeIRlVeV', 'Stuart@vel.us', 869, 'A'),
  (415, 'Griffith', 'x68yQ0mvd0', '2020-08-22', '7', 'acSfIVK0SI', 'Hedda@dui.gov', 867, 'A'),
  (416, 'Erich', '3rlhkKAMal', '2020-08-23', '4', 'NYswNb1jph', 'Kai@vel.gov', 112, 'A'),
  (417, 'Karen', 'YIE9NxhxM9', '2020-08-27', '0', 'AcuhSiSnsR', 'Nola@luctus.edu', 435, 'A'),
  (418, 'Abbot', 'm4kRNysHwN', '2020-08-28', '7', '11GcLev04l', 'Amir@Pellentesque.net', 435, 'A'),
  (419, 'Echo', '1WrRHanYuy', '2020-08-25', '8', 'iOVXwA11g4', 'Inez@ullamcorper.us', 567, 'A'),
  (420, 'Inga', 'T8Bkg9bbQt', '2020-08-27', '9', '8gUwl9exbB', 'Colton@sem.edu', 823, 'A'),
  (421, 'Kane', '2CzfPYYYEE', '2020-08-26', '10', 'WSLr4MkRDo', 'Zorita@Aliquam.gov', 990, 'B'),
  (422, 'Catherine', '8Wk6UNj36z', '2020-08-24', '6', 'BoMiINeUZE', 'Natalie@venenatis.us', 421, 'A'),
  (423, 'Trevor', '5Jaaj8tx6N', '2020-08-24', '10', 'ut6YbI28RI', 'Buckminster@metus.edu', 989, 'A'),
  (424, 'Carter', 'sFbvXPhUYK', '2020-08-23', '1', 'zsXemouL6g', 'Benedict@rhoncus.edu', 188, 'A'),
  (425, 'Kai', 'nptuejgwzU', '2020-08-23', '6', 'uubOTP3sUB', 'Heather@suscipit.us', 376, 'A'),
  (426, 'Dale', 'o5fpF4O15c', '2020-08-28', '7', 'sr4eUbLKWq', 'Kato@parturient.com', 736, 'B'),
  (427, 'Upton', 'jSBJ4KfxCl', '2020-08-25', '10', 'ppSqXVI6cM', 'Rachel@Maecenas.com', 609, 'A'),
  (428, 'Jonah', 'zpzbwhMaGT', '2020-08-25', '3', 'OqJ0Fzu6Dd', 'Yael@magna.com', 856, 'A'),
  (429, 'Zoe', 'tw0GsMGtGY', '2020-08-23', '6', 'AyzJXpmXTU', 'Cameron@egestas.net', 918, 'A'),
  (430, 'Dante', 'bkAAErDEc ', '2020-08-26', '5', 'nY7ZyoZTtG', 'Herrod@facilisi.net', 850, 'A'),
  (431, 'Caesar', 'uaXeDBY8ny', '2020-08-26', '0', 'd1aL2MqZWc', 'Eaton@In.us', 955, 'B'),
  (432, 'Kiona', '4wQddFyTXq', '2020-08-27', '2', 'GQnzCqhneA', 'Vincent@Cum.org', 182, 'A'),
  (433, 'Abra', 'ugtS9xb4nl', '2020-08-24', '3', 'bDCBt2y3f8', 'Ulysses@Class.us', 525, 'B'),
  (434, 'Reuben', 'mXRXKA0IFe', '2020-08-27', '10', 'xDvff963JE', 'Jakeem@Donec.edu', 869, 'A'),
  (435, 'Cassady', 'j45XSHRvAc', '2020-08-25', '5', 'EB87gphZLY', 'Yoshio@purus.net', 123, 'B'),
  (436, 'Nasim', 'PxmVbtqoo3', '2020-08-23', '0', 'RmCPBAvNoZ', 'Brynn@lorem.edu', 691, 'B'),
  (437, 'Lev', 'z8N dmWTGl', '2020-08-27', '3', 'FQImUgvWVY', 'Andrew@dictum.gov', 127, 'A'),
  (438, 'Giselle', 'laPrE5A8d3', '2020-08-26', '6', '6fcRD8uNPV', 'Barry@cursus.us', 418, 'A'),
  (439, 'Valentine', 'Z1AhWN4zhs', '2020-08-24', '2', 'jsp06E1gkN', 'Clare@velit.net', 672, 'A'),
  (440, 'Amelia', 'af2sZIzRvo', '2020-08-24', '3', 'KwV5fqloqt', 'Quintessa@commodo.com', 218, 'A'),
  (441, 'Basil', '9QjsjHf3XW', '2020-08-26', '1', 'uJYyF00tkW', 'Minerva@adipiscing.us', 127, 'B'),
  (442, 'Ali', 'bn8UXpVyuC', '2020-08-22', '0', 'C9mA68aDB4', 'Charles@ut.org', 865, 'B'),
  (443, 'Alea', 'upxUzVc8Gh', '2020-08-25', '7', '2jccSUgQtI', 'Allen@leo.gov', 100, 'B'),
  (444, 'Chloe', 'dyQnJd jWC', '2020-08-24', '8', 'ARDvO9HPL8', 'Zelenia@leo.us', 62, 'B'),
  (445, 'Erica', 'dXzkAR8cTN', '2020-08-27', '5', 'tNgOEW2PBe', 'Maile@Curabitur.com', 586, 'A'),
  (446, 'Shaeleigh', 'GtMPxSKXKp', '2020-08-24', '4', 'GlXEfsb1mV', 'Whoopi@Praesent.net', 876, 'B'),
  (447, 'Dieter', '6WvMAY8F9b', '2020-08-27', '10', '1eNROWFfc5', 'Reece@ornare.edu', 651, 'B'),
  (448, 'Berk', 'rik e0A4iS', '2020-08-23', '0', 'LNEn2XrWye', 'Lynn@nulla.net', 925, 'B'),
  (449, 'Iona', 'AVYXrL7piQ', '2020-08-24', '4', 'aLDE36dQuc', 'Amethyst@eros.edu', 757, 'B'),
  (450, 'Mohammad', 'HcvQhonWIQ', '2020-08-27', '3', 'D6JeQn8w53', 'Harrison@id.org', 198, 'B'),
  (451, 'Montana', 'HyyTLxKXbt', '2020-08-23', '2', 'YOTNGgFV6e', 'Hayfa@ullamcorper.com', 814, 'A'),
  (452, 'Blake', 'y1U9CUBxkC', '2020-08-27', '1', 'VqWflStKR4', 'Amelia@risus.edu', 841, 'A'),
  (453, 'Serena', 'wY9LMUVjgT', '2020-08-28', '0', 'peWj6T8QrI', 'Alec@fringilla.edu', 723, 'A'),
  (454, 'Trevor', 'AR CRMtD6g', '2020-08-23', '7', 'ZH2QFXueVM', 'Beverly@blandit.edu', 340, 'A'),
  (455, 'Henry', 'UXF4En9qIY', '2020-08-28', '0', 'Nd9qxFjlfy', 'Xanthus@consequat.us', 174, 'A'),
  (456, 'Kasimir', 'm2M3eAloJ7', '2020-08-27', '7', 'uo8AWl8xJj', 'Libby@natoque.us', 281, 'A'),
  (457, 'Florence', 'TUHG5sOlZE', '2020-08-27', '6', 'e4cxM9P44w', 'Cade@Class.com', 817, 'A'),
  (458, 'Kirestin', 'iXPNmYvhtW', '2020-08-24', '10', 'yUS84g4ixo', 'Otto@varius.gov', 573, 'A'),
  (459, 'Stacey', 'OfgfhMwViK', '2020-08-24', '8', 'bqgCgmkMGg', 'Tanisha@natoque.edu', 853, 'B'),
  (460, 'Ruth', 'QTW avqHGl', '2020-08-23', '8', 'jeXNZJPeTv', 'Lana@eu.org', 789, 'B'),
  (461, 'Joan', 'ikdumOVU32', '2020-08-27', '6', 'RjZKW2KuAh', 'Aiko@dis.gov', 373, 'A'),
  (462, 'Xaviera', 'sWBTpbrJrR', '2020-08-23', '4', 'HHwIPkZLcm', 'Daniel@ligula.net', 556, 'B'),
  (463, 'Glenna', 'ghTRdk6mLu', '2020-08-22', '0', 'oe2bpe7t3a', 'Uta@eleifend.us', 658, 'B'),
  (464, 'Carly', 'dXENrxMcMI', '2020-08-28', '10', 'o5MwG4WAa5', 'Riley@mattis.org', 881, 'A'),
  (465, 'Hoyt', 'Lo0qh9YUsd', '2020-08-28', '0', 'dQfEFiHWzk', 'Brady@Vestibulum.edu', 911, 'A'),
  (466, 'Mallory', 'gwvmpVryDm', '2020-08-24', '5', 'if9vJnXQDp', 'Troy@ullamcorper.net', 263, 'B'),
  (467, 'Daniel', 'uPZZRSJCJF', '2020-08-25', '3', '35sJrbV01l', 'Mason@hymenaeos.com', 173, 'B'),
  (468, 'Malik', 'fH0YSviuba', '2020-08-26', '6', 'b2iD4W4MxB', 'Idola@mus.us', 746, 'A'),
  (469, 'Byron', '3SpjKpSoQy', '2020-08-27', '4', '1z6yFybbEH', 'Ivan@mus.us', 485, 'A'),
  (470, 'Gage', 'F0F3LLkVlb', '2020-08-27', '1', 'ZtZiP5V53K', 'Harriet@sed.edu', 143, 'B'),
  (471, 'Barclay', 'E88CanFQRc', '2020-08-27', '5', 'fyD8y24KX8', 'Rana@nisi.gov', 893, 'A'),
  (472, 'Olga', 'nE5uvBzm0h', '2020-08-23', '5', 'Zsk07folwj', 'Kameko@eleifend.org', 261, 'B'),
  (473, 'Kyra', 'cGGkODWRXQ', '2020-08-26', '9', 'vsgalSO7e3', 'Aladdin@vel.net', 670, 'A'),
  (474, 'Latifah', 'W19dAD3 O4', '2020-08-26', '8', 'lH7XOjc4jz', 'Keegan@In.us', 648, 'B'),
  (475, 'Emerald', '3PuupnUJNs', '2020-08-28', '9', 'K83rDdfJpA', 'Kitra@elit.gov', 97, 'A'),
  (476, 'Rinah', 'F3QdejyRH4', '2020-08-22', '6', 't16WRAHjs1', 'Adria@nec.gov', 985, 'B'),
  (477, 'Ray', 'tg47jhurNe', '2020-08-25', '10', 'LopVQXu0sJ', 'Abbot@Donec.gov', 988, 'B'),
  (478, 'Avram', 'I48k0V4gTi', '2020-08-27', '7', 'q64VpdM4u2', 'Illana@vulputate.com', 775, 'A'),
  (479, 'Jin', 'nf5dD8qhTJ', '2020-08-24', '1', 'PSOuuzqweQ', 'Violet@porta.edu', 524, 'A'),
  (480, 'Kylan', '6NxmUDDLsR', '2020-08-26', '5', 'PaHDgbvYQ7', 'Celeste@tellus.org', 443, 'B'),
  (481, 'Lucas', 'PbAhJXAZTn', '2020-08-23', '9', 'zK0i5xSuyX', 'Quon@mattis.edu', 341, 'A'),
  (482, 'Yoshio', 'tedDo4hAOv', '2020-08-28', '5', 'JdDzXC4uWo', 'Upton@vel.org', 302, 'A'),
  (483, 'Sawyer', ' RwFGKCP81', '2020-08-28', '10', 'oRvoybq5j1', 'Victoria@nisl.us', 3, 'B'),
  (484, 'Macy', '0mGuX4t0Zn', '2020-08-27', '6', 'c3RjgjqoKh', 'Lysandra@Curabitur.gov', 266, 'A'),
  (485, 'Nigel', 'C0xdhOniY2', '2020-08-25', '1', 'csuo4a82vd', 'Aiko@ipsum.edu', 107, 'B'),
  (486, 'Sage', 'mQhscpkrP ', '2020-08-28', '2', 'cNEfOEjZIZ', 'Hedwig@sapien.org', 163, 'B'),
  (487, 'Cally', '3u2gwDrByk', '2020-08-22', '10', 'ptY6ynxODH', 'Cole@nonummy.net', 796, 'B'),
  (488, 'Isaiah', 'RcCRLsTk8Y', '2020-08-28', '10', 'KXmP7PayGq', 'Irene@scelerisque.gov', 743, 'B'),
  (489, 'Tanek', 'gHuhF6JJdD', '2020-08-24', '2', 'Xwv8YHIZm8', 'Nissim@ac.us', 959, 'A'),
  (490, 'Shannon', 'rk9zObR2iv', '2020-08-23', '7', 'yPVM8Snuv8', 'Cleo@sit.org', 314, 'A'),
  (491, 'Jamalia', 'UTpuum8ZaO', '2020-08-25', '10', 'M74HMVWI3m', 'Abra@feugiat.net', 843, 'A'),
  (492, 'Ivana', 'm4b4yGClLP', '2020-08-23', '3', 'xyJwivCXIB', 'MacKenzie@magna.edu', 80, 'A'),
  (493, 'Carl', 'Dr1MnvMoWD', '2020-08-28', '6', 'hxmE9uZS6t', 'Lionel@natoque.us', 680, 'B'),
  (494, 'Halee', '0LzlOF6uaY', '2020-08-25', '2', 'QShObpJ4xb', 'Kasimir@Nunc.org', 41, 'A'),
  (495, 'Ryder', 'a1E56vtoSb', '2020-08-27', '10', 'iQz0NLyWAm', 'Kalia@eros.us', 331, 'A'),
  (496, 'Sybill', 'mmQZKg06nh', '2020-08-26', '2', 'HQMAEDzM8K', 'Walker@pellentesque.gov', 680, 'A'),
  (497, 'Colin', 'pkpPovIEZ6', '2020-08-27', '5', 'awpuqhbKD7', 'Zachary@risus.gov', 534, 'B'),
  (498, 'Theodore', 'LpILXZop2y', '2020-08-22', '6', 'Ei3Xf9c7zu', 'Quyn@quam.org', 937, 'B'),
  (499, 'Melvin', '9TG7iGWhTD', '2020-08-22', '5', '0tjzc6dnec', 'Robert@eros.com', 484, 'A'),
  (500, 'Vladimir', 'sAWk3jzRvR', '2020-08-22', '2', 'WhoaywyuK0', 'Simon@Ut.us', 259, 'B');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `usuario`
  --


  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `usuario`
  --


  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

  INSERT INTO `identificacion` (`id_identificacion`, `nombre_identificacion`, `estado`) VALUES
  (1, 'DPI', 'A'),
  (2, 'Cadula', 'A'),
  (3, 'Licencia', 'A'),
  (4, 'CarnetUniversitario', 'A'),
  (5, 'CarnetTrabajo', 'A'),
  (6, 'DPI', 'B'),
  (7, 'Cadula', 'B'),
  (8, 'Licencia', 'B'),
  (9, 'CarnetUniversitario', 'B'),
  (10, 'CarnetTrabajo', 'B');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `identificacion`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `identificacion`
  --
  ;

  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

  INSERT INTO `curso` (`id_curso`, `nombre_curso`, `observacion`, `estado`, `fecha_creacion`) VALUES
  (1, 'Hogar', 'Muy dificil', 'B', '2020-08-29 02:18:35'),
  (2, 'Mate', 'Es muy dificil', 'A', '2020-08-29 01:15:40'),
  (3, 'Idioma', 'Es muy dificil', 'B', '2020-08-29 01:17:37'),
  (4, 'Deporte', 'Es muy facil', 'A', '2020-08-29 01:17:37'),
  (5, 'Sociales', 'Medio Medio', 'B', '2020-08-29 01:17:37'),
  (6, 'Ciencias', 'Muy dificil', 'A', '2020-08-29 01:17:37');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `curso`
  --
    
    
  INSERT INTO `grado` (`id_grado`, `nombre_grado`, `estado`) VALUES
  (1, 'Prekinder1', 'A'),
  (2, 'Prekinder2', 'A'),
  (3, 'Kinder', 'A'),
  (4, 'Preparatoria', 'A'),
  (5, 'Primero Primaria', 'A'),
  (6, 'Segundo Primaria', 'A'),
  (7, 'Tercero Primaria', 'A'),
  (8, 'Cuarto Primaria', 'A'),
  (9, 'Quinto Primaria', 'A'),
  (10, 'Sexto Primaria', 'A'),
  (11, 'Primero Básico', 'A'),
  (12, 'Segundo Básico', 'A'),
  (13, 'Tercero Básico', 'A'),
  (14, 'Cuarto Bachillerato', 'A'),
  (15, 'Quinto Bachillerato', 'A');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `grado`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `grado`
  --


  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `curso`


  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




  -- Dumping data for table `maestro`
  --

  INSERT INTO `maestro` (`id_maestro`, `id_identificacion`, `codigo_identificacion`, `direccion`, `correo`, `celular`, `estado`) VALUES
  (1, 7, 'DC407888-B044-465A-97EB-59B4A4CC4F4C', '4293 North Bay City Ln.', 'Dolan@aliquet.edu', 756, 'A'),
  (2, 6, '8B2ED107-B05C-4BB9-A7A7-53CAD3E08D02', '71155 West Malawi Way', 'Alexa@molestie.us', 754, 'A'),
  (3, 4, '1C256326-F87B-4450-A037-4752F670DB5E', '80817  Argentina Ln.', 'Jonah@justo.us', 441, 'B'),
  (4, 10, '137020AD-DAB1-4CAF-B355-CD94A4136A14', '97002 East Mount Vernon Way', 'Angela@ante.edu', 187, 'A'),
  (5, 9, '59BBFF18-A0FF-4E72-953D-4CE438D71AA4', '58468 West Czech Republic Ct.', 'Macon@et.com', 361, 'A'),
  (6, 4, 'C834856C-F413-4EF8-B000-43C584344245', '46249 South Cook Islands St.', 'Derek@Praesent.org', 194, 'B'),
  (7, 9, 'D62173A4-854B-4274-80A5-BAE3D02D96D4', '47107 North Taiwan, Province of China Blvd.', 'Odessa@Fusce.com', 513, 'A'),
  (8, 6, '0ED26EA3-AFF9-47D2-A4C3-61AE7433FFA9', '4005 North Albania Ave.', 'Alden@Proin.us', 911, 'A'),
  (9, 9, '542B335B-4578-4BD9-B433-3FEB025211FC', '70972 West Canada St.', 'Amos@hymenaeos.edu', 211, 'A'),
  (10, 3, 'FD333B08-FC14-4E6D-9627-9454E384BF24', '9223 South Virgin Islands, U.S. Ln.', 'Dolan@fringilla.edu', 570, 'B'),
  (11, 1, '12896CA1-853B-4CAC-AC5E-6B9E148030D7', '25188 East Estonia St.', 'Bo@Suspendisse.gov', 165, 'B'),
  (12, 9, '6844BA91-987D-4127-B8B9-9328C07B1C97', '71997 North Cayman Islands Blvd.', 'Derek@Suspendisse.net', 250, 'A'),
  (13, 7, '706CD0FE-E47B-4A7E-899C-E08470C41311', '75197 West Bosnia and Herzegovina Ave.', 'Alvin@nec.org', 588, 'B'),
  (14, 3, 'DEFF3DF5-2DEB-47BF-B213-21DB491E6AB9', '17513  Solomon Islands Way', 'Clinton@at.gov', 67, 'A'),
  (15, 6, 'FC3DC785-D0F2-4609-AAE2-591DC7965CF3', '72199 South Grand Forks St.', 'Lynn@molestie.us', 341, 'B'),
  (16, 4, '7F871B59-24BE-4423-9DAE-FCA40597D969', '97694 South Nigeria Ct.', 'Colt@blandit.net', 990, 'B'),
  (17, 6, '7685003E-0DCF-4A61-A1C7-5B7FBF048A3E', '55565 South French Guiana Ave.', 'Justin@nulla.edu', 547, 'A'),
  (18, 3, '756A49F6-2457-443A-91C9-3C25ACBF4775', '7749 East Somalia Ln.', 'Deirdre@eget.com', 809, 'A'),
  (19, 2, 'EDA39260-9FC2-4046-A0F2-E60544BC99D9', '44198 North Central African Republic St.', 'Ulric@id.us', 407, 'B'),
  (20, 5, 'B41F91AC-6B07-4669-8935-C9526FDFD0D6', '63992 North Puerto Rico Ave.', 'Alisa@pretium.gov', 341, 'A'),
  (21, 9, 'B31E1FBA-74A7-458D-9ACD-3946E2243CD2', '67176 North Argentina Ln.', 'Delilah@mauris.net', 648, 'B'),
  (22, 5, '7DE4D903-24E9-432A-9673-D073737543A5', '75572  Nepal Way', 'Tad@viverra.us', 423, 'A'),
  (23, 1, '31876E1A-382F-4353-8A9E-691609E26ED7', '13987 South Argentina Ct.', 'Yuli@luctus.edu', 255, 'A'),
  (24, 9, '19F1A6BD-47FF-4BDB-97C1-2A62A9C73BF3', '25946 North Luxembourg Ct.', 'Ivory@Integer.edu', 93, 'A'),
  (25, 7, '13E9F160-C9D9-451D-BE79-BF54DD085480', '16880 West Guam St.', 'Richard@non.com', 842, 'A'),
  (26, 9, 'CD442C37-FD92-42F2-B536-9366AD30CC34', '71294 South Delta Junction Ct.', 'Autumn@pulvinar.edu', 834, 'B'),
  (27, 2, '205A5B36-BB5B-4C71-8FC1-F3B5FD8C2802', '12680 North Burundi Ave.', 'Lane@Phasellus.net', 370, 'A'),
  (28, 4, '735C8E12-247D-4E16-89B2-1FDCA39DB862', '45488 North Reunion St.', 'Serina@scelerisque.org', 884, 'B'),
  (29, 8, '10938606-2265-4CE0-86E6-CF489B9251C8', '16580 South Costa Rica Ct.', 'Lynn@molestie.com', 671, 'A'),
  (30, 10, 'DCB2A8E0-10A2-4567-A464-C79254D4351B', '30133 East Laughlin Ave.', 'Fulton@semper.edu', 685, 'B'),
  (31, 2, '60BA4799-FCBD-44E8-84F2-5BAB6AE27698', '47938 South India Ln.', 'Jerry@tristique.net', 572, 'B'),
  (32, 3, '9E9E289F-68EF-4D30-AAC6-FF561FFCDD48', '74196  Japan Blvd.', 'Lawrence@faucibus.org', 342, 'A'),
  (33, 3, '9102E4DA-0E13-4674-8DFE-FD6F76EC636D', '66929 North Bahrain Way', 'Aileen@ut.us', 405, 'A'),
  (34, 2, '938B5F6A-1891-4595-A02B-7E46D55483C6', '53243 North Sweden Ave.', 'Orlando@sed.us', 980, 'A'),
  (35, 10, '89CAE30D-C84F-457A-B069-AD31015B1E29', '77031  DuBois Way', 'Steven@feugiat.net', 995, 'B'),
  (36, 6, '6B17872B-2AF9-4900-89DE-DD2B9FC1D348', '46580 East Bolivia Way', 'Piper@Donec.net', 846, 'B'),
  (37, 5, '3298AE62-002E-4E8A-A119-98DA91B2064E', '40065 South Cayman Islands Ct.', 'Yoshi@sed.org', 119, 'A'),
  (38, 3, '010A1FE0-0EE2-42EC-A113-A592AB2FBE32', '3732 East Marshall Ave.', 'Stuart@luctus.us', 679, 'A'),
  (39, 5, 'D1F5DC6C-CFCE-4F68-8AC6-BEB6609D9AED', '80277 South Del Rio Ave.', 'Justine@metus.org', 188, 'A'),
  (40, 8, 'BAFB3604-1FF8-474A-9513-6F75A341BC62', '5583 East Virgin Islands, British Blvd.', 'Moses@Duis.edu', 992, 'B'),
  (41, 9, 'CCB31532-BB8F-4D09-A56B-6780C7BC484C', '8411 South Bowie Way', 'Branden@rutrum.net', 66, 'A'),
  (42, 9, 'CF0E8D64-E5E1-4E47-9FA2-D1300F19BE29', '43424 West Botswana Ct.', 'Tanner@conubia.net', 998, 'A'),
  (43, 7, 'A7A9E42F-9F44-4957-A612-AF4C7917D7DD', '83908 South Egg Harbor Ct.', 'Veda@mollis.com', 285, 'A'),
  (44, 9, 'B2A1F36D-8143-4E4C-B214-EB14C07FBD7A', '13840 South Hong Kong Blvd.', 'Cedric@lectus.gov', 437, 'A'),
  (45, 7, '8BA4CCD6-BE73-443D-A34F-5C6AC9B11605', '39178 South Fajardo Ct.', 'Elaine@ultrices.gov', 585, 'B'),
  (46, 6, '04391B19-6048-4367-9B03-949862B9E728', '77395 South Barbados Blvd.', 'Camden@vitae.net', 918, 'B'),
  (47, 4, 'F0B6DC80-5ACC-45EC-AF80-4ECD6417FB88', '22807 East Cyprus Blvd.', 'Thomas@Vestibulum.edu', 612, 'A'),
  (48, 10, 'A0E084E7-A012-4A76-B694-C3FB8266018A', '89739 South Compton Ln.', 'Alexandra@dignissim.us', 118, 'B'),
  (49, 10, 'C7EFEEA2-6276-4FE8-8132-582713210CEC', '38124  Slovenia Ct.', 'Felicia@dignissim.org', 177, 'A'),
  (50, 2, 'DDD683E1-F7B4-477D-AE90-78634B7F15AA', '4715 South Independence Blvd.', 'Madeline@bibendum.us', 447, 'B'),
  (51, 1, 'A57FB824-9E49-47F0-9F35-0B3A45B7F1A8', '60684 North Anchorage Ln.', 'Leila@netus.net', 621, 'B'),
  (52, 4, '194A430F-5D56-4C4F-8A31-B653F20905EC', '91060 North South Africa Ct.', 'Amy@est.org', 896, 'B'),
  (53, 5, 'DEFEB279-DB0A-4226-8BB1-C7C55059A6F2', '99945 North Norway Ln.', 'Yoshio@cubilia.com', 238, 'B'),
  (54, 9, '6230873A-CF3A-49AB-9325-BA59F108840E', '96137 West Holy See (Vatican City State) Ln.', 'Joseph@nonummy.gov', 449, 'A'),
  (55, 1, 'F7AD0D06-0A92-45E3-A023-10416155147F', '87569 West Botswana Blvd.', 'Nerea@tempus.gov', 2, 'A'),
  (56, 9, '28240692-2C4E-46FF-9EB6-D76F3E977CEA', '54162 South Austin Blvd.', 'Josephine@velit.com', 792, 'A'),
  (57, 7, '93658F8B-E6B0-4645-9B02-CD27FD78AC12', '42532  Ghana St.', 'Thane@justo.us', 522, 'A'),
  (58, 5, '17EE9760-4F99-458F-A917-F176F5948D01', '23114 South Saint Vincent and The Grenadines Ln.', 'Boris@nibh.us', 599, 'B'),
  (59, 6, '01627EE2-2BB8-4579-B562-42864FCC049E', '19368 North Boston Ave.', 'Rajah@Curae.org', 516, 'A'),
  (60, 5, '0506E9AD-4626-49F6-B38F-A9EEE048C58C', '18384  Hartland St.', 'Marah@tempus.com', 589, 'B'),
  (61, 1, 'D0D10393-0D60-4FC1-9F5C-5A81FF686C3F', '26692 East Brooklyn Park St.', 'Jayme@dictum.com', 653, 'A'),
  (62, 8, 'B72B52F8-2CD0-4F4B-B541-1BE215D92C1A', '1233  Hong Kong Ln.', 'Wendy@dis.gov', 491, 'A'),
  (63, 4, '4F8F3536-28C0-44A9-BB41-44DEA61A9F0F', '47386 South Samoa Way', 'Hedda@luctus.edu', 292, 'B'),
  (64, 9, 'C52649F9-59B6-49BF-957D-B7B81DCE4B61', '25896 West Kingston Ave.', 'Zephania@imperdiet.gov', 455, 'A'),
  (65, 6, '9FD8D4D9-28AA-468A-ABD7-065DACD467C2', '41167  Bosnia and Herzegovina Ct.', 'Glenna@neque.net', 355, 'B'),
  (66, 6, 'C6A3281D-5979-4931-9D4C-7E9024F10274', '80100 West Barbados St.', 'Garth@arcu.edu', 906, 'B'),
  (67, 3, '17A674D5-FE57-4CFE-86F9-8412E3D5670B', '3734 North Malaysia Way', 'Mercedes@adipiscing.us', 560, 'A'),
  (68, 10, '2B0B38EC-7D7B-4B4E-A966-50B3B79D0066', '97810 East Cape Verde Ln.', 'Chadwick@leo.com', 66, 'B'),
  (69, 4, '582F3EA2-EE22-47D4-857E-AB4B8701B583', '77049 North Afghanistan Ave.', 'Cade@per.org', 341, 'A'),
  (70, 2, 'C078BC0F-D7E1-41BF-A05B-7FFC4ECBB3D0', '41206 East British Indian Ocean Territory Blvd.', 'Hilel@nulla.edu', 886, 'B'),
  (71, 4, 'AF4B9987-E757-4A5B-BF77-615AE186477C', '8776 North Azusa Way', 'Ayanna@auctor.org', 613, 'B'),
  (72, 9, '1596B388-568C-48C5-A038-3487AC7529EF', '96119 South Cook Islands St.', 'Noah@commodo.edu', 616, 'A'),
  (73, 4, '5D4F00C9-4A95-4AFE-A1D1-B219ABCC3781', '89344 East Dubuque Blvd.', 'Garth@metus.com', 925, 'A'),
  (74, 2, '501C59D1-76F7-4CA8-B2E6-06CA173FDC6A', '54472 North Cayman Islands Ln.', 'Kasper@vestibulum.gov', 494, 'B'),
  (75, 7, '2B12AB2C-948D-417F-92E9-91AA0287411C', '8443 South Bahrain Ln.', 'Brielle@ridiculus.edu', 136, 'A'),
  (76, 10, 'D10E90CE-4F7F-4218-B381-79EFB0F39E7F', '97971 North Andorra St.', 'Alec@lorem.edu', 416, 'B'),
  (77, 6, 'F3286D73-FBAC-450B-8B7B-4963B49731BF', '18469 North Bouvet Island Ln.', 'Aimee@arcu.gov', 581, 'B'),
  (78, 8, '29168C82-72C5-4D13-8ABB-B6F45FEEED62', '69536 West Fremont Ct.', 'Amanda@quam.gov', 731, 'B'),
  (79, 10, '03CF29EF-F57A-4E3B-85B1-1BBB62778905', '47230 West Chino Ln.', 'Simon@vulputate.edu', 718, 'B'),
  (80, 2, '340E09A5-C7E2-405C-AFAC-B16BDE00AB94', '96967  Macedonia Ln.', 'Cameron@sed.gov', 985, 'B'),
  (81, 4, '88EA2FB8-C6A1-45C6-B684-E64625358FCE', '61173 South Bulgaria Blvd.', 'Kermit@gravida.com', 345, 'A'),
  (82, 6, 'F1B99CEB-8B1D-44FC-85B0-4CF906A0A79B', '55223 East Bolivia Ln.', 'Hector@pede.net', 57, 'B'),
  (83, 8, 'E9ADD849-FB71-4B51-8E69-AFF85B140C64', '94169 West Costa Rica Ln.', 'Nita@Morbi.us', 807, 'B'),
  (84, 9, 'DCBF09D6-F355-418A-A8B6-059E62C0D0DE', '95949 East Forrest City Ln.', 'Claudia@Morbi.net', 5, 'A'),
  (85, 4, 'C72009DA-0817-48F1-BBBD-D566A2EAD6C2', '94757 South Albania Way', 'Germaine@in.edu', 735, 'B'),
  (86, 3, 'BCEF639F-3198-4F48-8A49-4ADBA18F0F9C', '80528 West Moldova Ln.', 'MacKensie@adipiscing.net', 374, 'A'),
  (87, 10, '25A07B74-0104-423E-BAD1-310A97950D60', '31773 South Oman Ave.', 'Nigel@tincidunt.edu', 660, 'B'),
  (88, 4, '62B25FFA-C1E3-49B9-B341-7DB635D48D12', '75735 North Guinea Ln.', 'Kasper@dis.org', 866, 'B'),
  (89, 2, '69747967-CA3B-4DF4-B0E3-555D272A5AD1', '45214  Eritrea Way', 'Freya@natoque.com', 447, 'A'),
  (90, 6, 'C4071D3B-7E64-42D2-8741-0DA92AA22736', '80482  Derby Way', 'Hyatt@vel.us', 775, 'B'),
  (91, 2, 'BADA77B4-8087-4A29-BE83-95E3BA12294D', '88190 North Dothan Ln.', 'Felicia@fermentum.us', 903, 'A'),
  (92, 5, '829D8652-843C-4FFC-9D1F-37CB4C8698A4', '21159 South Belarus Ave.', 'Chandler@at.gov', 49, 'B'),
  (93, 10, 'E9E72C7B-5FF7-41C8-BD29-535381FBB48F', '81315 South Eugene Way', 'Dexter@hendrerit.com', 674, 'B'),
  (94, 3, '7F641FD7-AEA1-41D3-B531-014FF48CB15A', '19396 East Hilo Blvd.', 'Yvonne@ridiculus.gov', 970, 'B'),
  (95, 8, 'FEA57016-E937-4841-B608-9C944773002A', '15000  Czech Republic Ct.', 'Alden@Vestibulum.gov', 621, 'B'),
  (96, 4, '357BEDBB-A7A1-474C-B10D-69CEECFB894D', '46690 North Areceibo Ln.', 'Burton@porttitor.com', 58, 'A'),
  (97, 2, 'F434583D-C389-4D4B-8030-4AD0B38F0FE2', '70944  Norfolk Island Blvd.', 'TaShya@natoque.com', 29, 'A'),
  (98, 9, '30010FE1-5A69-4A0B-A036-5019F89FA8C4', '84018 West Newark Blvd.', 'Alden@scelerisque.edu', 141, 'A'),
  (99, 2, '9C71AC8F-D95E-43EA-B8E3-132252B48AF2', '34873 East Costa Rica Way', 'Rudyard@iaculis.gov', 319, 'A'),
  (100, 8, '35F951ED-C8EC-4FF1-B5B0-25B10EF484A8', '23562 South Norway Ave.', 'Honorato@Etiam.com', 791, 'B'),
  (101, 4, '59B0CB89-BEE3-4368-A1A4-99020B9C7B1F', '90868 North Afghanistan Ln.', 'Jena@habitant.gov', 620, 'B'),
  (102, 9, 'F9F1C3FE-7452-4834-9540-38A76B5418FE', '34980 South Mayotte Way', 'Amy@netus.gov', 505, 'B'),
  (103, 7, 'A8F403E4-32A4-4D86-AE02-06844871DB40', '27999  Comoros Ln.', 'Mohammad@vestibulum.com', 723, 'B'),
  (104, 5, 'C870B19C-FF10-4308-A8E1-0FC608936D82', '64831  Afghanistan St.', 'Signe@nascetur.gov', 100, 'B'),
  (105, 10, '9EDBD170-A28F-415D-B2D2-D3B384714BC2', '95586  Columbus Way', 'Ingrid@hymenaeos.net', 662, 'B'),
  (106, 9, '1DC6BD39-B67E-426E-AC18-4417EEC3CA14', '65982 East Austria Ln.', 'Graham@fermentum.us', 592, 'A'),
  (107, 8, '7CD113F1-FB4A-4383-B507-B2E51FDC598E', '31150  Viet Nam St.', 'Kuame@primis.us', 117, 'A'),
  (108, 8, '82A8629D-0959-4A6B-8092-07494C0DE487', '92877 West Huntsville Blvd.', 'Hayley@volutpat.edu', 256, 'B'),
  (109, 3, 'F54AD7E3-1CCF-41EB-A4BF-06386296EE17', '9152 South Bhutan Ct.', 'Velma@vestibulum.gov', 864, 'A'),
  (110, 1, 'EFE5DF0A-6B3C-411B-8579-275D12802D2E', '42711  Cape Girardeau Ct.', 'Hyatt@posuere.net', 657, 'B'),
  (111, 10, 'F392B72C-6098-482E-86B8-3AEBA7B04205', '87798 North Czech Republic Blvd.', 'Zelenia@scelerisque.gov', 252, 'A'),
  (112, 6, 'DCFB532B-C22E-436E-8B70-0933E00671F8', '16514 West Mozambique Ave.', 'Hayes@magna.org', 521, 'A'),
  (113, 9, 'ADC3C30A-ADAF-41FC-9039-EE807598B6D9', '25708  Uzbekistan Ct.', 'Raymond@ullamcorper.org', 395, 'B'),
  (114, 6, '6CA66C57-6D84-407B-9816-7544ADF39864', '13341 West Gambia Ct.', 'Julie@dolor.us', 347, 'A'),
  (115, 3, 'EA2B8A32-670B-46BD-BCF2-093453432A16', '81863 South Brazil Ave.', 'Peter@mattis.com', 22, 'B'),
  (116, 10, '23676E5A-8A01-4D68-89E5-79C733E8903E', '14724 West Armenia Ln.', 'Kylie@nisl.org', 939, 'B'),
  (117, 9, '3227CC1C-DD67-40B3-82CC-8FE315C7211D', '91095  British Indian Ocean Territory St.', 'Yasir@eleifend.gov', 500, 'B'),
  (118, 3, 'A3A3A13E-7BF5-4234-B153-2314EBF72F22', '51022 South Casper St.', 'Nicole@fermentum.net', 958, 'B'),
  (119, 5, 'AB520AEC-4F94-4B84-AB71-C25D9AA584A2', '93098 South Macao St.', 'Lionel@Class.com', 153, 'A'),
  (120, 7, '02B0641A-9AD2-4A2A-9E48-1CD41408D4B0', '6724 West Antarctica Way', 'Ignacia@montes.com', 247, 'B'),
  (121, 4, 'B369BE18-756A-4D77-9D18-9115B2088293', '31367 East Armenia Way', 'Stuart@commodo.com', 876, 'B'),
  (122, 6, '6FFCC8B8-B4B7-4AB7-AEB9-DBD59DC01F60', '72450  Cayman Islands Ave.', 'Olivia@porttitor.org', 442, 'A'),
  (123, 9, 'EFA20204-F989-4AA2-92B0-AC9B5980606D', '83777  Bulgaria St.', 'Gay@cursus.gov', 237, 'A'),
  (124, 5, 'ABFAEB00-1D5D-486A-97B6-045AFA795796', '80657 East Angola Ct.', 'Venus@Quisque.us', 402, 'A'),
  (125, 4, 'CEB51679-75D0-472E-9944-8F4102808CE5', '56149 North Allentown Ln.', 'Ramona@et.com', 902, 'B'),
  (126, 8, 'F70EBAA2-13ED-456C-9185-1C7F565F3043', '52897 East Bulgaria Ave.', 'Carissa@vulputate.us', 189, 'A'),
  (127, 4, 'BF5C3C43-BE4A-4F9B-8AF4-5D9B6D3832DD', '69635 North New York Blvd.', 'Callum@varius.net', 139, 'B'),
  (128, 4, '4C0BC4E9-A2C1-4A4F-B6E5-1D52E9A0C2AE', '62239 East Cameroon St.', 'Thane@aliquam.us', 666, 'A'),
  (129, 9, 'EE6CC894-2127-4AE1-9875-DF0DDEF41333', '35606 East Evansville St.', 'Deacon@sociosqu.org', 922, 'A'),
  (130, 2, '67FFD3CE-1E8B-41EF-A9EF-DA80C17C1D19', '87795 North Bhutan Blvd.', 'Indira@aliquet.edu', 339, 'B'),
  (131, 4, 'FA30EC7A-5485-47C6-8901-D7CF7188E578', '72285 East Maldives Ct.', 'MacKenzie@Cum.edu', 110, 'B'),
  (132, 3, '56912AE8-9E9E-4992-AA47-76C3B8CE9E12', '66836 South Belgium Blvd.', 'Baker@litora.com', 577, 'A'),
  (133, 4, '3CE493BC-7CE7-4C47-A60C-FFE74E467194', '48335  Madagascar Way', 'Evan@sit.us', 846, 'A'),
  (134, 5, '728851E8-479D-40DF-AA29-8C851B7B4E92', '38106 West Singapore Ln.', 'Dorian@primis.com', 730, 'A'),
  (135, 10, '94902C57-2C2C-447E-8E30-C79871D32874', '8425  Bahamas St.', 'Chaim@consequat.org', 926, 'A'),
  (136, 10, '1D994EEE-61C7-4738-BBA0-42D202843A56', '54978 East Agat St.', 'Alice@consequat.edu', 466, 'A'),
  (137, 8, 'BCBED705-2A66-4B5E-AD25-91D71FAAF26C', '98238 West France Way', 'Audra@Cras.com', 774, 'B'),
  (138, 4, 'DF3C3151-C0FF-48FA-B502-8836A76EAC38', '46287  Cayman Islands Way', 'John@Nam.org', 581, 'B'),
  (139, 8, '6C46BB63-6F47-4617-9637-215ACCF21484', '13095 West Germany Ln.', 'Brittany@Suspendisse.com', 291, 'B'),
  (140, 5, '940C3468-608B-4567-A5E0-A3BA731D6EE4', '32486 South Senegal Ln.', 'Hannah@Fusce.us', 646, 'A'),
  (141, 10, 'C6CCDEA7-7234-40EF-93AD-519559F225CE', '23115 South Hazleton Ave.', 'Jane@nostra.us', 745, 'A'),
  (142, 7, 'F36E7A13-4C0B-46DE-B9C0-AF4D70D81169', '7828 North Namibia Ct.', 'Norman@massa.us', 355, 'B'),
  (143, 10, '7D0B58C8-ACE2-4459-AD78-BF391F63C0D4', '31542 South Maldives Way', 'Yael@libero.gov', 445, 'B'),
  (144, 1, '0FA0D548-B0A4-4CDA-A27A-1339092174B0', '28909  Cleveland Ln.', 'Ashely@fames.org', 405, 'A'),
  (145, 2, '7876B938-9E0D-41FD-B358-6AD3726B8351', '67724 South Comoros Blvd.', 'Kane@hendrerit.com', 159, 'B'),
  (146, 3, '8A7BC784-4B97-456B-A6EF-2264A78DDA64', '65190 East Florence Ln.', 'Dorothy@viverra.org', 102, 'B'),
  (147, 10, 'B966AD4E-562D-4CD7-9191-8BACCB76A94A', '27146  Trinidad and Tobago Ave.', 'Burke@justo.edu', 287, 'A'),
  (148, 5, '8E3F9548-82EB-4D38-A2FA-C3FCC8209B2E', '2837 East Anguilla Blvd.', 'Macon@Aliquam.us', 396, 'B'),
  (149, 10, '8C934EE8-F6F8-4032-A27A-74493F58F396', '77854  Bhutan Ave.', 'Alice@consectetuer.gov', 150, 'A'),
  (150, 2, '7586DD14-FEB1-447D-A74E-134BAC432175', '65500 North Comoros Ave.', 'Sybil@Nunc.net', 280, 'A'),
  (151, 6, '622A27F3-2448-486F-A579-06E387D2D9DB', '88946 North Chickasha Ct.', 'Octavia@dis.org', 412, 'B'),
  (152, 5, '565AD308-3E3E-4147-8658-B691269B4468', '99217 West Western Sahara Blvd.', 'Micah@urna.net', 759, 'B'),
  (153, 8, '49A0DBDB-A920-4A9E-A664-1FC8B5754603', '165 South Sierra Leone Ln.', 'Joseph@orci.edu', 809, 'A'),
  (154, 2, '8D0A2FA2-9B1A-481F-B656-400AB4837E92', '48590 South Bartlesville Ave.', 'Ronan@adipiscing.net', 989, 'A'),
  (155, 5, '09DCE788-CC4F-4DC4-9675-2F6623CB0509', '15642 East Bermuda Way', 'Kirk@feugiat.edu', 68, 'B'),
  (156, 6, '7A5709CF-D465-46C6-AC63-6B463E164C59', '49978  Chile St.', 'Hakeem@sem.gov', 12, 'A'),
  (157, 6, 'D1D42A83-0FA9-4389-8ACE-099B7965EE89', '33849 West Uzbekistan St.', 'Sophia@interdum.org', 219, 'A'),
  (158, 1, '8100B383-3523-4427-A8EF-D068DCEFDB35', '4709 South Antarctica Blvd.', 'Bradley@consequat.com', 974, 'A'),
  (159, 1, '6FC1DAED-C4C5-4849-ABED-181A974FAD59', '24735 North Colombia Ln.', 'Rhiannon@Suspendisse.com', 393, 'B'),
  (160, 3, 'B2049E61-C38F-48E8-8010-3019A89271A7', '55321 West Mankato Ln.', 'Mufutau@in.gov', 421, 'A'),
  (161, 4, 'B09E52FE-7ADB-40E9-BF10-0A9B812D773B', '21091 East Viet Nam Blvd.', 'Odessa@dignissim.edu', 717, 'A'),
  (162, 3, '49E11D5D-DD74-4E0B-9A21-FC048898D7D8', '15897 North Hastings Ln.', 'Alexa@commodo.com', 522, 'A'),
  (163, 10, '4F263E3A-1FF9-4940-98B3-38B4E802721A', '40169 West Bahamas St.', 'Aristotle@Aliquam.net', 209, 'A'),
  (164, 1, '53CF93E9-71B5-4D6C-8118-8AF62C686C06', '55934 South Greenland Ct.', 'Zena@rhoncus.net', 796, 'B'),
  (165, 10, 'E855C8E1-BFBF-4332-9453-A5950D9C759E', '76860 West Cameroon Blvd.', 'Hoyt@Maecenas.org', 1, 'A'),
  (166, 1, 'C63A2F82-43E9-4390-8649-4365EFC9F24E', '23840 South Moorhead Ct.', 'Perry@eleifend.edu', 804, 'B'),
  (167, 8, '8E9ECBF2-9EC1-4EA5-AC83-9FD6D4B694E0', '43443  Agoura Hills Ln.', 'Allen@bibendum.gov', 476, 'A'),
  (168, 1, '60DC94B9-FCAF-4A56-B2E7-9F24ED2573AF', '75351 East Covington Ave.', 'Merritt@Sed.us', 295, 'B'),
  (169, 5, '53F84934-39A9-4250-A2AD-C16907BABC6F', '27261  Grass Valley St.', 'Matthew@purus.net', 660, 'B'),
  (170, 5, 'E518D89B-9759-41E7-B1D1-D109E0D694A7', '22207 South Laughlin Ave.', 'Jana@quam.org', 16, 'A'),
  (171, 6, 'DF8F1C8E-65C9-433E-8554-09B904802FCE', '95304 East Cyprus Ave.', 'Ethan@vulputate.us', 787, 'A'),
  (172, 1, 'CEB5141E-D682-4310-AF5B-D63CD1C1EAC7', '63377 South Belarus Blvd.', 'Adara@ridiculus.org', 521, 'B'),
  (173, 10, 'A386CDC9-73DA-4FFC-B146-3046DF502C64', '93549 South American Samoa Way', 'Wynter@lacinia.edu', 568, 'A'),
  (174, 3, '373D0112-1217-47FD-9CB8-B2A7A0066396', '74003 South Guinea-bissau Ln.', 'Jordan@faucibus.gov', 358, 'A'),
  (175, 3, 'B0DCD616-EE8D-47A4-88C5-D8A39B2016FC', '48515 South Brazil Blvd.', 'Hermione@primis.gov', 571, 'B'),
  (176, 10, '32A26540-6F26-413E-A37D-E3FD54EB6753', '79397 East Afghanistan Ave.', 'Travis@malesuada.gov', 165, 'B'),
  (177, 2, 'F02B0ADA-B9E8-4A0B-B367-578A5DA9259B', '30140  Garden Grove Ave.', 'Yvette@iaculis.us', 31, 'B'),
  (178, 6, 'F457B686-5C62-404A-8E5D-22C8BC4B19AA', '82941 South Austria Ct.', 'Rae@quam.org', 180, 'A'),
  (179, 6, '2D48B197-AE64-4ED5-897F-8D2D3B3D817D', '80560 North South Georgia and The South Sandwich Islands Way', 'William@Curabitur.org', 40, 'B'),
  (180, 4, '41F0EF23-14D6-410A-8558-F315B2A508A7', '99039 North Fairfax Way', 'Ahmed@nibh.us', 613, 'A'),
  (181, 1, '64E74AB4-0E38-405B-94A8-25F592E20D2A', '27757 East Maldives Blvd.', 'Jesse@nostra.com', 106, 'B'),
  (182, 4, '44D90D22-F147-49DB-8AD5-55E1095AFD50', '34949 North France Ave.', 'Tamekah@et.org', 464, 'B'),
  (183, 3, '790C65BA-7B04-4F49-87FA-274E4AD20A78', '35623 East Beacon Way', 'Destiny@velit.net', 658, 'A'),
  (184, 5, '996E5CAE-D50A-4351-BECF-D4174AFC1094', '59442 West Marshall Islands Ln.', 'Ginger@Nulla.net', 254, 'A'),
  (185, 9, '4A14BC8C-90DA-48B5-B715-CCB9B3A7D257', '91722 South Biddeford Ct.', 'Alvin@nunc.org', 868, 'B'),
  (186, 2, '33A719EF-9ABF-4B62-8606-C54A8F44FA72', '77490 North Barrow Ave.', 'Drake@dolor.gov', 382, 'A'),
  (187, 4, 'AEB9624D-DA7A-445D-9535-958C8B05AEEE', '16010 South Austria Way', 'Kylee@elit.us', 292, 'A'),
  (188, 10, 'FB2388CD-FCA1-4A15-8CEF-06FA08BA21ED', '59686 South Guánica Ave.', 'Matthew@posuere.us', 803, 'B'),
  (189, 10, 'EB2D4436-5150-4D6B-A703-D6201C359939', '36777 West Poland St.', 'Bevis@aliquet.com', 246, 'A'),
  (190, 4, '2193BD36-AF87-4B99-8669-3FCEE7997273', '51757 East Azerbaijan Ave.', 'Heidi@mi.us', 835, 'B'),
  (191, 8, 'BEEF3692-8481-4AA0-A8C1-620579640044', '27459  Cambodia Ave.', 'Tanya@quam.com', 341, 'A'),
  (192, 4, '8112CB1C-2A6C-4DEE-B2BF-2161F4B99AEA', '43306 East Jamaica Blvd.', 'Kuame@Class.net', 41, 'B'),
  (193, 9, '8A01CD68-E0F6-417C-BD13-BB86CC504DCC', '93330 North Baton Rouge Ave.', 'Alfonso@consectetuer.org', 651, 'A'),
  (194, 4, '09B3AF9C-5B09-49C3-ABE8-E67C8CC1C9EB', '69642 East Turks and Caicos Islands Way', 'Rama@leo.gov', 699, 'B'),
  (195, 7, '29C90A26-6CCE-4AC5-B7EE-3AD5057CD209', '29718 East Israel Blvd.', 'Caleb@ac.com', 127, 'B'),
  (196, 6, '0AAB60AA-003D-4E53-8849-1B121A2109F3', '63203 South Portugal Way', 'MacKensie@Duis.us', 325, 'B'),
  (197, 10, 'A603538D-DA62-48CB-9FC2-15F4011ED212', '12959 South Antarctica Ave.', 'Herrod@sodales.com', 975, 'B'),
  (198, 1, '1E9A4F20-9A00-47DC-9DE1-0E917993ED94', '37109 South Hampton Blvd.', 'Kathleen@Phasellus.net', 790, 'A'),
  (199, 3, '73C8F61C-B50A-4917-AB8F-40A2BCDC970E', '64672 West Bahrain Ct.', 'Ryder@bibendum.net', 711, 'B'),
  (200, 2, '1934E590-A12D-473D-954B-BD99B1BD6D4F', '53370 West Alpharetta Ln.', 'Melodie@nascetur.edu', 86, 'A'),
  (201, 2, 'B8426EEB-192E-4488-922F-38035C53763D', '65469 South Madagascar Ave.', 'Olga@Vivamus.net', 426, 'A'),
  (202, 6, '35AA42E7-BDB2-4D6B-9D85-AF9687C357AA', '28185 South Afghanistan Ct.', 'Roth@fermentum.com', 957, 'A'),
  (203, 4, 'CE6EC908-3B50-4D9A-AF14-A17CF528198A', '45855 East Charleston St.', 'Winifred@cubilia.net', 597, 'B'),
  (204, 8, '05E0EDB4-485C-422A-A678-6C5FF2F35A8D', '2437  Champaign Blvd.', 'Chancellor@rutrum.us', 182, 'B'),
  (205, 5, 'AE5F808F-A619-442B-8E11-B60CC1065AFF', '48741 East Yemen Ave.', 'Melinda@ridiculus.net', 827, 'B'),
  (206, 10, 'BF3A809E-4A30-4035-9603-C28F2CF4DB57', '41494  Columbus Way', 'Christian@litora.org', 815, 'A'),
  (207, 1, 'D21C1ADC-9540-45F2-AA0C-36F7561EA7DE', '63759  Benin Ct.', 'Eric@dignissim.com', 386, 'B'),
  (208, 7, '32DF7D9D-CDE0-4265-8375-345F5F6CFE45', '98098  Equatorial Guinea Ln.', 'Raya@enim.us', 458, 'B'),
  (209, 6, 'D5D46BF0-CBB8-4124-9B53-5880D721A148', '58940  Botswana St.', 'Sylvia@egestas.us', 54, 'B'),
  (210, 7, '91A39E11-8B74-4538-90A4-DFC1E15F7C52', '92170  Belgium St.', 'Glenna@penatibus.us', 44, 'A'),
  (211, 3, '793DA333-689F-4D96-93CC-1DD12627CB54', '40305 West Yemen Ave.', 'Amal@venenatis.gov', 57, 'A'),
  (212, 10, '07985EBA-3D28-4859-8E88-F5F019C6B83D', '82696 East Comoros Blvd.', 'Yoshi@ante.com', 925, 'B'),
  (213, 5, '4A7A9724-3985-45B7-8F2B-E9525E6DF43F', '26831 South Atlantic City Ln.', 'Cecilia@urna.net', 582, 'A'),
  (214, 4, 'C4BC7AF9-8FD5-41EC-BDCF-7098301B5371', '17707 North Belgium Way', 'Myra@posuere.us', 479, 'A'),
  (215, 7, 'E25C0813-0447-4FE2-9562-412546973C57', '40452  Belize St.', 'Wanda@scelerisque.net', 257, 'B'),
  (216, 1, '994BDFCC-8A55-426E-A5A0-BEBA8D24F130', '51087 South Australia St.', 'Gemma@Praesent.net', 741, 'B'),
  (217, 4, '56293453-5AEB-44AF-A81C-507D0DCFA7B7', '34014 North Belize Ave.', 'Blaze@dictum.edu', 285, 'A'),
  (218, 6, 'FEB52401-40F4-4B97-A252-AE4F762417BE', '76429 East Alexandria Ln.', 'Maryam@nostra.org', 873, 'B'),
  (219, 4, 'AD41C653-EF55-4881-82EF-FE3F97ADDF97', '63115 East Eritrea Ave.', 'Elmo@molestie.com', 611, 'B'),
  (220, 1, 'CBCBA558-7C3B-47BA-8633-6CE055BABBEB', '21072 South Greenland Ave.', 'Wallace@justo.net', 564, 'B'),
  (221, 7, '5551A3A2-E78F-45EA-BE2F-D894DDD78B7C', '69579 South Milwaukee Ct.', 'Martena@et.edu', 135, 'A'),
  (222, 9, '45477259-C64C-43D8-8A49-0CEEFBAF57CB', '15580 North China Ln.', 'Ray@gravida.gov', 505, 'B'),
  (223, 8, 'C22AE93F-6649-453D-9B5E-EDB16C35C0D0', '84644 South Russian Federation St.', 'Ryan@sodales.net', 517, 'B'),
  (224, 9, '61D91B61-76E7-4C46-8A55-AEEC1D8D3E09', '87394 East Gallup Ct.', 'Nita@massa.gov', 15, 'B'),
  (225, 2, '506AC54C-8540-45B5-8A23-4CAB90D7B307', '34925 East Turks and Caicos Islands Way', 'Charde@Nulla.gov', 373, 'B'),
  (226, 10, 'F58E901A-C424-410A-B463-1F1324144144', '13545 North New Rochelle Ave.', 'Xanthus@porttitor.com', 370, 'A'),
  (227, 4, '89B205C6-5C00-4498-A558-BFDF27A484B0', '98660 West Mauritius Way', 'Dana@nec.net', 407, 'A'),
  (228, 1, '9EF9477B-122B-4FA5-B00C-B451420DBBB7', '10844 North Belize Blvd.', 'Wesley@egestas.org', 860, 'B'),
  (229, 2, '9502B3B6-E696-46AA-806B-333C358200AC', '8103 West Chad Blvd.', 'Bert@quis.us', 603, 'B'),
  (230, 10, '09E04415-0B53-4CA3-AD12-72158EA8B3F0', '38209 West Antarctica Ave.', 'Jayme@Curabitur.net', 782, 'A'),
  (231, 6, '95E7D894-9E75-4267-B8DC-ED041CC2B876', '7138 North Bahrain Blvd.', 'Reagan@montes.edu', 428, 'A'),
  (232, 10, '2CE460F0-6B8D-4D63-AFCF-F2AD006C8AAE', '73811 East Iran, Islamic Republic of St.', 'Neve@dignissim.com', 281, 'B'),
  (233, 3, '60C64303-6CE0-4AEF-964C-21133C2D6E78', '22796 South Kiribati St.', 'Jonas@urna.net', 396, 'A'),
  (234, 2, '10D4E149-DCDC-4415-9C9E-FAF5831E20D7', '47290 North American Samoa Ln.', 'Leo@nostra.us', 307, 'B'),
  (235, 9, '6FC8FC33-5D61-4737-9BBF-689D88FB4E7A', '60651 South Cary Blvd.', 'Cassandra@netus.us', 947, 'A'),
  (236, 4, 'F34EC2D2-3C88-494A-B8F7-DF2524BBBC03', '8365 West Bahamas Blvd.', 'Kelsie@faucibus.org', 196, 'B'),
  (237, 2, '382C8DE9-6648-458B-83FE-5D7CAC4EA7B2', '2968 South Cocos (Keeling) Islands St.', 'Louis@mauris.gov', 788, 'B'),
  (238, 4, 'F74A7160-602B-4385-836C-9D887BBCDF6E', '10383 South Armenia St.', 'Belle@aliquam.net', 713, 'B'),
  (239, 9, 'C248B745-2797-421D-B0E2-537136B4412C', '12856 West Guadeloupe Blvd.', 'Renee@litora.edu', 351, 'B'),
  (240, 1, 'A08687C5-9A87-4E3C-B593-C05D896A7E3E', '76647 East Papua New Guinea Blvd.', 'Anthony@justo.com', 417, 'A'),
  (241, 7, '24B636DA-6141-4FFB-83EB-F2102DC49B61', '38740 South Brazil Ave.', 'Mira@tellus.org', 532, 'A'),
  (242, 5, 'A540B989-EECA-4636-8DA8-0E93373CB723', '4138 North Nauru Blvd.', 'Deirdre@per.edu', 671, 'B'),
  (243, 7, '6956D6F8-A54D-421D-BAC0-F5BA50FE744E', '94317 East Bhutan Way', 'Madeline@Fusce.com', 954, 'A'),
  (244, 8, 'D00DEE8F-220C-4AE8-A0F2-F2BCE4D4FFB4', '28155 East Cuba Blvd.', 'Wesley@dui.gov', 186, 'A'),
  (245, 9, 'D83E47EC-98C2-498A-AF71-F5B82AAD267B', '81400 West Bahamas Blvd.', 'Chanda@Nam.edu', 781, 'A'),
  (246, 5, 'DF6BF60E-A444-4DA0-A023-9984769FBE73', '78317  Equatorial Guinea Ct.', 'Ora@primis.com', 705, 'A'),
  (247, 10, '3298EA5E-775F-4DF1-B785-BAE054C1CBF0', '49212 South Goose Creek Blvd.', 'Laith@suscipit.com', 542, 'A'),
  (248, 2, '6F9C30FA-128A-4FBF-9DC9-C1926669392C', '66823  Cayman Islands St.', 'Brenna@et.org', 47, 'B'),
  (249, 10, '8029F8F7-CCFA-4FA2-B022-28E4864E8D84', '89167 South Norfolk Island Ln.', 'Conan@Aliquam.org', 19, 'B'),
  (250, 5, '2DBF9535-1CD5-4871-90A7-9BAC8B9A1F7D', '55244 East Bolivia Way', 'Cailin@ornare.com', 837, 'A'),
  (251, 1, '57E15E68-0CD9-4D47-90F0-F0A6B634FC96', '80947 West Melrose Blvd.', 'Nell@ipsum.gov', 242, 'B'),
  (252, 2, 'FD5FCDD4-F1E9-4A73-8CC3-28B30469427B', '61219  Bermuda Ln.', 'Rhea@a.org', 937, 'B'),
  (253, 6, '8D2EFBD8-F332-4C24-A2A1-09DA07FC7B70', '48088 South Cook Islands St.', 'Maryam@cursus.gov', 913, 'B'),
  (254, 2, 'C85306C8-8899-4221-8147-A6C6064DCD8F', '20378 South Ireland St.', 'Randall@porttitor.org', 43, 'B'),
  (255, 3, '37C515EB-CE4A-4F1C-B4B1-A3D2DB334046', '51162 West Slovenia Ct.', 'Hall@pharetra.us', 769, 'B'),
  (256, 7, 'B7BB6EAD-5A26-40D3-9097-06235F503902', '20844 North Cayman Islands Ave.', 'Cedric@orci.edu', 929, 'B'),
  (257, 8, 'AA8B400C-22A4-4103-A628-7DA2495EE789', '83478 West Madagascar Ct.', 'Gannon@ullamcorper.edu', 899, 'B'),
  (258, 2, 'E7FCB058-782E-4510-AE2E-D46AF6E4941F', '1039 North Broken Arrow Way', 'Josiah@enim.net', 409, 'B'),
  (259, 2, 'C3778E11-FD62-48A5-BA39-DF496A01AEE0', '6659 East Belize Ave.', 'Charles@tempor.us', 183, 'B'),
  (260, 6, 'F0A45FC8-CA5E-4452-BA16-5A3EF106713D', '8841 North Compton Ave.', 'Igor@leo.edu', 906, 'A'),
  (261, 10, 'DBAB9CBE-914F-4BE2-9807-5129F5CAAB41', '92601  France Ln.', 'Vanna@auctor.us', 359, 'B'),
  (262, 3, 'A137F85C-6D25-4339-8E28-38AAE22685DB', '18731 East South Georgia and The South Sandwich Islands Ave.', 'Keegan@blandit.gov', 141, 'A'),
  (263, 7, 'A3A22661-6A5E-4D93-9CE6-B0A68DC5A406', '37389  Clovis Blvd.', 'Stella@montes.edu', 838, 'A'),
  (264, 3, 'FADB14B4-457C-47A7-8477-64488F0B3E23', '81036 West Cayman Islands Ln.', 'Ashton@bibendum.net', 683, 'A'),
  (265, 4, '2E9688AC-4181-45CE-A59E-05D146D49769', '51650  Colombia Ct.', 'Adam@inceptos.gov', 128, 'B'),
  (266, 7, '96BC1A26-41D3-4CA0-AB6A-3BC3BB248C87', '502 West Mobile Blvd.', 'Nelle@Maecenas.edu', 236, 'B'),
  (267, 10, '4DB9DDF2-9B2F-4FCA-A0C8-3E7D60DB228B', '78009  Niger Ct.', 'Janna@interdum.edu', 304, 'B'),
  (268, 7, 'D6426CA6-4526-46A3-99CE-20290130169C', '79740 West Fort Dodge St.', 'Indira@placerat.net', 256, 'B'),
  (269, 4, 'CB268822-82EE-4376-8087-AF8F5E8BF1D2', '28290  Panama Ave.', 'Francis@Vestibulum.gov', 779, 'B'),
  (270, 3, '45811223-86DB-42C9-BAD0-BE9CBB266CBE', '16137 East Guayanilla Ct.', 'Aphrodite@eget.gov', 993, 'B'),
  (271, 2, '1546F166-22E7-41BB-AA2A-BEE2462CA226', '29399 South Peabody Ct.', 'Venus@hymenaeos.net', 686, 'B'),
  (272, 5, 'B4851E60-B1F3-4DEE-834E-69383F7F3DCA', '88406  Anguilla Blvd.', 'Jameson@blandit.org', 978, 'B'),
  (273, 2, 'BDF7F43B-842D-4757-951B-2C1682FF6517', '25240  Fitchburg Ln.', 'Emerald@pede.net', 367, 'A'),
  (274, 4, 'ACFF5C70-6D8B-4241-9086-D524241FC721', '11915 East Guyana St.', 'Keefe@dui.net', 44, 'A'),
  (275, 10, '651DFBDF-D867-4C4F-917C-6C31B6C0418C', '13657  Burundi Ave.', 'Axel@tortor.us', 543, 'B'),
  (276, 8, 'E43E7A58-04A8-4670-93B1-3859869B02E1', '73971  Benin Ct.', 'Asher@laoreet.gov', 92, 'B'),
  (277, 4, '63EAFADD-9AF4-49C3-AF65-8BBDCE011D19', '34945 North Bahrain Ln.', 'Amanda@mattis.gov', 211, 'A'),
  (278, 7, '75D9EA3F-AD47-40FF-8FEB-6561F50B7513', '2939 East Antarctica Ln.', 'Madison@mollis.edu', 92, 'B'),
  (279, 3, 'C01205C2-94D2-4FB0-A5C6-B099697B5CDE', '13787 East Cayman Islands Ln.', 'Paki@sollicitudin.gov', 218, 'B'),
  (280, 2, '7B50E005-8BC1-4163-BA0F-9D279E03C139', '21242 North Clearwater Blvd.', 'Indira@vehicula.net', 416, 'B'),
  (281, 10, 'CA57647C-DB49-4FAE-B041-38356AD92B97', '32823 West New Zealand Ln.', 'Georgia@Proin.com', 834, 'A'),
  (282, 6, '916FEFB3-EA45-4931-AB47-A9B1EA3C43C3', '90839 East Micronesia Ln.', 'Callum@Lorem.edu', 349, 'A'),
  (283, 4, '0D99B8CA-8192-4C04-9D07-9DDEB1CE7342', '75987 South Cedar City Blvd.', 'Wyatt@Class.com', 626, 'A'),
  (284, 4, 'CDD769A6-7DCA-477B-B17C-C9018A6D47DC', '95074  Azerbaijan Way', 'Lesley@mattis.edu', 579, 'A'),
  (285, 1, '8191293D-AFDD-4562-A852-3E50804F911C', '50820  Oshkosh Ave.', 'Amber@eget.org', 746, 'A'),
  (286, 10, '2D24BEE8-E322-497B-A672-6A4711D8DF35', '13046 West Cocos (Keeling) Islands Ave.', 'Adria@lobortis.org', 905, 'A'),
  (287, 9, '8B99E439-D8C3-4C7D-B565-170A792BC16B', '97357 North Puerto Rico Ave.', 'Damon@eu.net', 250, 'B'),
  (288, 2, '0A348AEC-D223-4235-BE38-2E442D57A908', '10942 East Kenya Ct.', 'Phillip@luctus.org', 988, 'B'),
  (289, 4, '1899D604-6B69-49E2-98CA-F4BD8E4C375D', '1670 East Malawi Way', 'Murphy@ullamcorper.us', 562, 'A'),
  (290, 4, '7D811721-11E3-4544-B472-106AABD2BDDD', '99450 West Chile Way', 'Geoffrey@Cras.edu', 285, 'B'),
  (291, 3, 'AA518C05-D06C-4DB8-8D31-CB75616D0C3F', '73100 South Aruba Way', 'Ryder@sollicitudin.com', 117, 'A'),
  (292, 2, '9F96C5F9-1C65-4E34-A7B8-9982B16F166A', '69038 North Central African Republic Blvd.', 'Alan@ullamcorper.edu', 856, 'A'),
  (293, 9, '332532AE-F5B6-41A6-BD7E-B75E0BC8EE0E', '54782 South China Way', 'Rose@lacinia.gov', 302, 'B'),
  (294, 4, '030F375E-56C7-48AA-942C-176E697FD5BC', '4903 East Saint Helena St.', 'Lucius@Sed.gov', 855, 'A'),
  (295, 5, '51B17658-772D-4D0D-A4B9-DDD41E1A7984', '1913 East Brookfield St.', 'Vaughan@Proin.gov', 273, 'B'),
  (296, 4, '537DF7D0-159B-468D-8B3F-33840D34CA8D', '20745 North Batavia Ave.', 'Aimee@hendrerit.com', 866, 'B'),
  (297, 10, 'E469526E-CFB3-4700-9FAD-8E9D7F3EFFFE', '92456 South Bessemer Ave.', 'Barrett@Etiam.gov', 23, 'B'),
  (298, 5, '7DA7C44A-C80D-4F3A-8C44-27CD772F6392', '31197 North Bristol Ave.', 'Alvin@egestas.gov', 349, 'B'),
  (299, 6, 'E741EC48-9C25-4705-86DE-AB61561B43EF', '61928  Blacksburg Way', 'Uta@pellentesque.edu', 473, 'A'),
  (300, 4, 'C65B5BEC-3FF5-4626-AB11-3B1E54DB8C1E', '34447  Christmas Island Way', 'Sydnee@tempor.org', 247, 'B'),
  (301, 5, '32F6C109-CE51-4F26-ABFB-7E1F3F705C4B', '77968 West Mozambique Way', 'Morgan@dolor.us', 734, 'B'),
  (302, 8, '2C791ECF-DDB8-4DDD-A3C4-F23517A6B21A', '77643 West Equatorial Guinea St.', 'Keith@egestas.gov', 905, 'B'),
  (303, 8, 'AAE8D87A-5773-440A-BEE1-E8E073AD8600', '29233 North Nepal Way', 'Yoko@nisl.gov', 25, 'B'),
  (304, 10, 'D3E71882-CDB0-4620-A039-8913931A831D', '67232  Saint Vincent and The Grenadines Ln.', 'Porter@Integer.gov', 291, 'B'),
  (305, 6, '8230761C-775F-4379-8410-A78B6390ACD5', '27502  Sri Lanka Ln.', 'Henry@ullamcorper.com', 776, 'B'),
  (306, 1, '95EB94D1-DE57-4E70-BCC3-12FDDA106CDD', '94301 North Idaho Falls Ln.', 'Camden@vulputate.net', 994, 'A'),
  (307, 4, '1685BD29-9F81-4A57-B314-27A43AA1CE25', '40782 North Heard Island and Mcdonald Islands St.', 'Dane@vitae.com', 362, 'B'),
  (308, 4, 'C17A3563-B856-48E5-84DF-D411458F2A36', '56691 North Iran, Islamic Republic of Way', 'Sydney@fermentum.net', 63, 'A'),
  (309, 3, '0008A2FE-7905-4D57-AFB6-CFA4A3298D06', '32729  Hong Kong Way', 'Zachary@dapibus.com', 763, 'A'),
  (310, 7, 'FD37C0E2-CDF3-4B99-B2FE-9FBB18D5F384', '97629 East Burlington Ct.', 'Fallon@conubia.net', 792, 'B'),
  (311, 1, '647C5910-4B38-44A2-8845-E4300D792BDB', '6307 West Cyprus Ave.', 'Haviva@blandit.edu', 134, 'A'),
  (312, 1, '09FD73D9-A211-40FD-A9DA-468DD6F41A41', '67451  Bulgaria St.', 'Beau@interdum.edu', 942, 'B'),
  (313, 1, '741C2E35-18D9-4415-9F13-5AA2C700FEA5', '22596 East Burundi St.', 'Xenos@orci.com', 296, 'A'),
  (314, 1, 'ACCDF425-AE1E-4B5F-BB5D-A0E49398C716', '56504 West Andorra Ct.', 'Wanda@magnis.org', 916, 'B'),
  (315, 9, 'D3C48C9B-213A-4827-95E2-0856A7D3B9D2', '11510 West International Falls Ln.', 'Patrick@Praesent.edu', 76, 'A'),
  (316, 7, 'A7ABFBE2-C638-409F-96B8-459963BD5479', '64883  Russian Federation Way', 'Quinn@tellus.us', 79, 'A'),
  (317, 4, 'C7D181AE-42B4-49DE-8EA9-38CAC93C3D67', '20420 South Norway Way', 'Christopher@Integer.gov', 789, 'A'),
  (318, 3, 'AB92489B-7E19-430A-B1FA-6C964727BE70', '49230 South Bosnia and Herzegovina Blvd.', 'Quentin@feugiat.gov', 593, 'A'),
  (319, 3, 'A25026EE-A4E5-4C8B-B698-DC58573519B8', '15834 South Netherlands Antilles Ave.', 'Hope@consectetuer.com', 265, 'B'),
  (320, 7, '7DEB8972-AD8F-4033-AA02-F9200F20CA6A', '11888 East Syrian Arab Republic Blvd.', 'Ursa@viverra.org', 357, 'B'),
  (321, 10, '5184E6BD-B9E0-451E-83F3-5CD0816C5878', '53186 South Macedonia Blvd.', 'Yoko@congue.com', 88, 'A'),
  (322, 5, '5FB4CA6C-E4C3-4E14-BA3B-EDED970D7790', '15883 East Council Bluffs Ct.', 'Erich@litora.org', 4, 'A'),
  (323, 4, 'E605B5CB-77D3-4E28-BC89-D220499794CB', '14736 East Grafton Blvd.', 'Autumn@tortor.com', 740, 'B'),
  (324, 4, '969F917D-12D7-41DE-97F8-9125184B38BB', '9238  Iran, Islamic Republic of St.', 'Erich@Cras.com', 629, 'A'),
  (325, 1, '595A7D8C-B73E-49A4-9DFF-91DAE9B73924', '11419 South Duluth Blvd.', 'MacKensie@facilisis.com', 480, 'B'),
  (326, 3, '5AB79A43-7E65-473D-BBE9-4611244E00E1', '95427 West Morocco St.', 'Quamar@risus.edu', 766, 'B'),
  (327, 1, 'FE50DE95-2DEE-4E30-B3F1-0271D254FBA5', '32388  Barbados Ct.', 'Idona@consequat.edu', 339, 'A'),
  (328, 1, 'AB44F295-AF89-4A77-A37B-0461F037E82F', '89198 East Armenia Blvd.', 'Jolie@lacus.gov', 225, 'A'),
  (329, 5, '66BBAE1E-E906-438A-BCA4-46B94EC3B7CD', '90269  Colombia Ave.', 'Micah@pulvinar.us', 471, 'B'),
  (330, 10, 'ADAF1DB8-4B24-4733-98BE-205D56E62B0A', '54735 West Australia Blvd.', 'Cooper@montes.org', 880, 'B'),
  (331, 3, '09D7F7FA-1A99-4EC3-BBC7-912F3804F42E', '36317 East Canada Ct.', 'Candice@ornare.us', 276, 'A'),
  (332, 5, '197DDC55-F682-47C0-8DBE-0DF8DF5003E3', '79705 North Falkland Islands (Malvinas) Blvd.', 'Philip@hymenaeos.net', 691, 'B'),
  (333, 5, '873E7F8C-DF0E-4F81-ABC9-841CB806644E', '29616  Bahrain Ct.', 'Nissim@porta.us', 551, 'B'),
  (334, 3, 'FE2D07D4-70B6-49FD-8009-5DC11F6AECB8', '68019  United Kingdom Ave.', 'Chadwick@ac.gov', 271, 'A'),
  (335, 10, '0102B09A-34EF-42D0-91D5-EC4BE8467D1C', '93986 South Western Sahara Ave.', 'Vernon@nisi.com', 296, 'A'),
  (336, 1, 'F4592703-2521-462A-9CA2-C1837DBD664F', '24439 East Belarus St.', 'Jason@mattis.gov', 906, 'A'),
  (337, 2, '638EADF4-9B3A-42CB-9FA4-5679D7572379', '69888  Cypress Ln.', 'Keane@amet.edu', 174, 'A'),
  (338, 1, '090BF3AF-C215-4183-A608-0E1FE818D130', '93992 South Cameroon Blvd.', 'Clarke@bibendum.gov', 273, 'A'),
  (339, 1, 'B82ABD7B-8C41-450D-9EA7-570DC3B4A11E', '55608 West Lawton Ln.', 'Chase@nostra.us', 58, 'B'),
  (340, 7, '8EB93503-836E-408D-8D0F-9DF1BC35AD00', '18156 South Antarctica Ave.', 'Vernon@et.com', 590, 'A'),
  (341, 9, 'A624772D-454A-4CD6-8B40-1F9581CC0E21', '33022 West Cerritos Way', 'Kato@fames.gov', 503, 'A'),
  (342, 6, '7CCCE050-8684-4795-B131-832652BF9E7E', '16715 West Turks and Caicos Islands Ln.', 'Grady@cubilia.us', 17, 'B'),
  (343, 4, 'E23D9076-70B5-4D95-AB52-7F70171FFA4A', '18463 West Burundi Ln.', 'Hyatt@conubia.edu', 311, 'A'),
  (344, 7, '1F7054EA-4019-4620-9B5D-F997F735C861', '51305 South Azerbaijan Way', 'Renee@parturient.us', 347, 'B'),
  (345, 2, 'C641B1FF-3265-41B0-B471-D5542F2CCF0C', '17236  Sweden St.', 'Heidi@penatibus.us', 79, 'B'),
  (346, 2, '434848CB-953E-4F0B-85EC-922E6F9782F0', '11888 East Latrobe Ave.', 'Ocean@eget.net', 419, 'A'),
  (347, 3, '88D988AA-5C01-4464-AE31-613DA8F91879', '71093  Palestinian Territory, Occupied Blvd.', 'Burke@Duis.edu', 232, 'B'),
  (348, 6, '909F6707-599C-4F3B-9239-4DFDEF7EF44F', '86635 East Morocco Ln.', 'Perry@conubia.com', 744, 'A'),
  (349, 6, 'B64F200D-1F06-4327-81FE-3C84EEFA500A', '65853 North Marshall Islands Blvd.', 'Dorothy@Aenean.net', 17, 'B'),
  (350, 9, '8AD60E0D-1493-489A-BADC-123F19251A27', '48778 East Malta Way', 'Keelie@nec.net', 814, 'B'),
  (351, 8, 'A5F81116-3AC4-4D0A-8B72-62BC45C95E38', '10111 North Andorra Blvd.', 'Jason@magnis.net', 98, 'B'),
  (352, 7, '4CEEE2B0-53C7-4B75-A050-95DADFB3E1CC', '69864 North Hawaiian Gardens Blvd.', 'Sydney@magnis.org', 840, 'B'),
  (353, 7, '43862A26-1582-4397-984D-22CD9BA2EEE6', '54655 South Coos Bay Ln.', 'Cheryl@nulla.gov', 930, 'B'),
  (354, 6, '6B69C3D9-0F32-42AE-86A7-599F6D88E9AA', '42419 East Cocos (Keeling) Islands St.', 'Brynne@Nullam.org', 537, 'B'),
  (355, 8, '115E2B42-9734-4B1C-8317-45D800155BEB', '69334 West Haiti Ave.', 'Branden@consequat.edu', 943, 'A'),
  (356, 1, '2327B0F2-B746-4BD0-A8D8-BD9B9A1CB28D', '44111 West Afghanistan Ln.', 'Maya@ornare.us', 278, 'A'),
  (357, 5, '4AFF75C1-DAA9-43F6-AE66-987386854C35', '64418 North Poland Ln.', 'Ronan@sagittis.us', 942, 'A'),
  (358, 5, '1E9FBD80-F73A-4C99-8B25-7234BE0ADA10', '77535 North Fort Wayne St.', 'Iris@urna.gov', 416, 'B'),
  (359, 9, 'CF37A8BF-4BF9-4C24-AD63-2F1D0E2DE9D1', '81897 West Togo Ct.', 'Portia@magna.net', 994, 'A'),
  (360, 7, '57882ACC-A55F-462D-A2DB-B18C6391F258', '1935 South Bangladesh Ln.', 'Gillian@egestas.net', 280, 'B'),
  (361, 9, '8CBF8E29-64AC-4DD3-8353-872999638452', '53820 North Palestinian Territory, Occupied Blvd.', 'Cleo@viverra.us', 360, 'B'),
  (362, 3, 'CB7C6320-7A4B-4889-BEFD-86CFE253E0C5', '76057 East Cairo Way', 'Sage@Vivamus.edu', 987, 'A'),
  (363, 6, '6B38D1CF-7AB1-4C3E-8350-21727C54E6E6', '92713 East Mauritania Ln.', 'Deborah@erat.com', 815, 'B'),
  (364, 3, '4A848D8F-FF7E-4B06-8AD3-80092A113675', '32980 South Venezuela Ct.', 'Price@malesuada.net', 401, 'A'),
  (365, 9, '2DE7B7DF-912D-41BF-80B8-1731CC5CC1BD', '30042 East Grand Island Blvd.', 'Mechelle@Aenean.us', 213, 'B'),
  (366, 2, '7001FA10-18D7-4301-8968-057B4A1B4F53', '42497  Easton Ct.', 'Claudia@cursus.net', 189, 'A'),
  (367, 9, 'E6CB0D6D-6306-43D2-8D9E-9EBD142EDDAD', '65532 East Chicopee Way', 'Charde@diam.com', 270, 'B'),
  (368, 9, '093652BA-A3D1-42AF-8F62-EFE171093C37', '44459 South Kokomo Ln.', 'Ignacia@inceptos.org', 402, 'A'),
  (369, 6, '7C8445CB-B5ED-4800-92EB-72492002AB0B', '91274  Eatontown Way', 'Knox@egestas.gov', 264, 'A'),
  (370, 1, '25331600-EE73-47F1-8EE2-330C0CEB04C3', '76394 West Bahamas Ct.', 'Serena@cubilia.edu', 55, 'A'),
  (371, 2, '5923F0A8-C4DB-4BB7-8EF3-2537C3B45A75', '1956 South Spain Ln.', 'Caesar@tempor.org', 941, 'A'),
  (372, 7, '1ED3364B-7722-43F3-AEF9-73EC57457870', '32198  Charlottesville St.', 'Diana@sit.com', 662, 'B'),
  (373, 7, 'F5881DDD-AA12-44D5-BE32-26BDC82EADE1', '11241  Montserrat Ln.', 'MacKensie@urna.gov', 479, 'A'),
  (374, 1, '0C1C92EA-B6F5-4517-93A0-03239CEF2CB6', '17066  Passaic St.', 'Slade@adipiscing.us', 982, 'B'),
  (375, 4, '81CC3369-E064-4B56-BEBC-B088B37ACF6C', '91137 West Burundi Way', 'Savannah@ornare.com', 247, 'B'),
  (376, 1, '542CE32F-3B14-4A9A-8CA4-5CDC6789929E', '50496 West Cruz Bay Ln.', 'Aidan@semper.us', 979, 'A'),
  (377, 7, '94FFC658-4EC6-4BE2-B9A5-6F4591A0794B', '29160 South Eritrea Ln.', 'Basia@adipiscing.gov', 824, 'A'),
  (378, 1, 'A835920D-4FBE-45BC-8212-D82921DE0857', '60735 West Turkmenistan Way', 'Helen@tempor.com', 207, 'A'),
  (379, 7, '3462A5AD-2BB8-4CEC-9BFA-619993B6C70D', '50891 West Gibraltar Way', 'Freya@quis.edu', 244, 'B'),
  (380, 8, 'CE60B4B3-4B9A-4468-9A17-D7EE80EFF87C', '28337 South Morrison Way', 'Walker@Nunc.gov', 872, 'B'),
  (381, 9, 'DF37729C-6A33-4081-AF5D-D921002935B0', '29688 East Houma St.', 'Demetria@velit.us', 212, 'A'),
  (382, 10, 'EB257E62-4935-4288-BDEA-539B5C053B39', '13096 West Miami Gardens Blvd.', 'Barbara@consequat.net', 717, 'A'),
  (383, 10, '6966DFB3-1396-4923-AF5A-9420DB701AED', '12323  Micronesia St.', 'Buffy@magna.com', 630, 'B'),
  (384, 10, '37662DAE-D003-468D-8490-369094883331', '4724 West Burundi Ave.', 'Warren@nibh.org', 957, 'A'),
  (385, 10, '62BF9647-B595-41AC-8338-736BF16BD160', '28628 South Liberia Way', 'Harrison@consequat.gov', 437, 'B'),
  (386, 8, '978F092B-B237-49CE-BCFE-70CB3CDEA337', '78264  New Caledonia Ln.', 'Kellie@volutpat.edu', 874, 'A'),
  (387, 7, 'FD756E8C-09D4-4776-88DE-B6BCB1F6B0A9', '79196 East Anaconda Ln.', 'Owen@ornare.us', 186, 'A'),
  (388, 9, 'FA8990BA-AB48-44D2-84BA-54FE025792A7', '77058 West Muncie Ln.', 'Steel@placerat.edu', 727, 'A'),
  (389, 10, '6BE64F13-BCAF-4A6E-B3B7-716DB64D92D0', '24356 South Kenya Way', 'Nomlanga@bibendum.org', 493, 'B'),
  (390, 10, 'A02C5B13-4FD0-49B4-9391-EBBBA147CA39', '73865  Saint Vincent and The Grenadines Ct.', 'Asher@dis.gov', 649, 'B'),
  (391, 4, '19CEBE11-16D6-4460-A18C-87EAF0488E53', '92219 West Morocco Ave.', 'Wylie@volutpat.gov', 326, 'A'),
  (392, 8, '29A1A37D-62A3-4C18-AC78-A379E3CAFDCB', '22091  Malaysia Ln.', 'Rahim@ornare.edu', 471, 'A'),
  (393, 7, '67AF8213-899D-45C6-8DB5-F73C3EC9548D', '13100 South Fulton Way', 'Jordan@ligula.us', 397, 'A'),
  (394, 4, '28AF617E-6688-4E33-A26F-C6F89F352D3D', '37065  Boulder City St.', 'Brynn@blandit.us', 795, 'A'),
  (395, 5, '28117ECC-B81C-4653-8830-5811E70D8654', '73020 North Cayman Islands Ct.', 'Tara@dolor.net', 359, 'B'),
  (396, 1, 'C7209DA3-5308-47E2-9B3D-F5692B215D36', '34658 West Rwanda Ave.', 'TaShya@id.edu', 974, 'B'),
  (397, 4, 'AF1AEBA7-B736-4B4D-8A80-8A584CB765D8', '67222 West Cairo Way', 'Amaya@massa.edu', 569, 'A'),
  (398, 2, 'A49A105B-D832-4AA8-B0ED-72F5F1A3DB76', '2799 West Kuwait Way', 'Avye@a.net', 882, 'A'),
  (399, 5, 'B4F29042-C906-4ECA-AC00-9A64CA4A88B1', '11868  Malta Ct.', 'Kyla@varius.org', 912, 'B'),
  (400, 8, 'E2398B1C-9ECA-4059-B6AB-68DC4604E56C', '88623 West Dover Ct.', 'Rose@dolor.us', 36, 'A'),
  (401, 3, 'AEC1345F-C317-40B3-9AF9-82374477D578', '82805 West Merced Way', 'Aidan@velit.com', 818, 'B'),
  (402, 4, '1EA1D022-50CA-4A92-A5C3-090F729A0164', '15467 West Cambodia Ct.', 'Knox@Aenean.gov', 403, 'B'),
  (403, 3, 'F103CB5F-6B8A-4E6B-968B-167A65EC6431', '29133 West Namibia Way', 'Bernard@egestas.net', 479, 'B'),
  (404, 10, 'A9D2EB04-3894-4B6B-BFE0-1C642C971C7B', '87249 West Corpus Christi Ave.', 'Shaine@nunc.org', 249, 'A'),
  (405, 8, '4B1AF038-27AD-43AE-98F9-2FD5BBFF0B8D', '90869 East Uruguay Way', 'Clio@auctor.org', 464, 'B'),
  (406, 8, '52C4F209-1DA2-419F-B228-D446DFAFA150', '38893 West Djibouti Blvd.', 'Tanek@netus.net', 182, 'B'),
  (407, 7, 'D27C43AE-189A-4228-836F-F80195B665AF', '78098 East Antigua and Barbuda Ct.', 'Quemby@neque.org', 699, 'B'),
  (408, 4, '5ED6C1D8-44EA-478D-800F-9B0A41C304AA', '24461 East Cayman Islands Way', 'Dennis@Aenean.gov', 422, 'A'),
  (409, 2, '849B9C92-7F99-403C-BB39-2A9D21ED6005', '4532 North Philippines Ln.', 'Richard@accumsan.us', 585, 'A'),
  (410, 3, '3A8472A1-9869-43AA-AB6F-2974C89CFCE8', '45333 South Guinea-bissau Ave.', 'Thane@sagittis.edu', 774, 'B'),
  (411, 5, '61457837-5FC5-443C-9BFB-55BBA43719CC', '21053 East Croatia Ave.', 'Micah@Quisque.edu', 851, 'A'),
  (412, 9, 'DEC6E8FC-1160-420A-A549-E41545794E17', '46525  Togo Blvd.', 'Aspen@amet.gov', 166, 'B'),
  (413, 10, '58FA1BA9-7C06-4DEC-879D-30DECA871187', '54614  Greensboro Blvd.', 'Jamal@nulla.us', 935, 'A'),
  (414, 4, '54976793-8B93-4C4E-A23F-49D8F28D5642', '88818 East Cocos (Keeling) Islands Ct.', 'MacKensie@posuere.com', 577, 'A'),
  (415, 2, '6B856037-2B7D-48C5-A458-1634C9B9E6F9', '71137  Rwanda Blvd.', 'Cyrus@pellentesque.edu', 142, 'B'),
  (416, 8, '21900E58-365D-4A08-90FD-1A2FB8A81832', '41668 West Guadeloupe Ln.', 'Tatyana@auctor.net', 225, 'B'),
  (417, 2, '7204A5F3-DF07-43A6-899D-C80C65F87E76', '1426 South Australia Blvd.', 'Baker@hymenaeos.net', 233, 'A'),
  (418, 1, '186A7A2A-C0C4-401E-8A2C-4150C7CEEAF1', '18314 West Guatemala St.', 'Eagan@vel.gov', 714, 'B'),
  (419, 4, 'FBFF8303-1BAB-4C0A-8F25-21F961FBC185', '27826 South Lower Burrell Ave.', 'Yoshio@primis.org', 18, 'A'),
  (420, 2, '718A693E-CC94-4B0C-9DD7-B7B9E2D7C461', '47128 West Cedar Falls Blvd.', 'Sylvia@litora.gov', 253, 'B'),
  (421, 3, 'FDDADEFC-1197-4A59-AEC3-B0815CB3B1F5', '48638 West Cape Verde Ct.', 'Althea@metus.gov', 165, 'A'),
  (422, 4, '7ABCC144-B14F-4494-A224-7F1F05ACF62D', '72921 South Belarus Blvd.', 'Meredith@Integer.edu', 291, 'B'),
  (423, 4, '932CA85C-1C68-460F-AB20-F3572654CBD8', '86511 North Sudan Blvd.', 'Ella@tempus.gov', 988, 'B'),
  (424, 3, '3C70C222-BFAB-4E89-A140-26493163776B', '16839  China Ct.', 'Rebecca@quis.gov', 947, 'A'),
  (425, 2, 'E00A437A-A2FA-4E1E-B77D-E1BB6DB238B5', '50493  Central African Republic Way', 'Halee@lectus.us', 718, 'A'),
  (426, 3, '5ECFE0D0-5640-4419-B9AF-AC99E40468EF', '12921 North Turks and Caicos Islands Way', 'Thomas@mauris.gov', 187, 'B'),
  (427, 5, 'F98A73B6-6483-46C3-9ADB-B5C3C6BF0F87', '48714 North Cape Verde Blvd.', 'Avram@fermentum.com', 821, 'A'),
  (428, 4, 'E4D8BF13-35B0-44E0-87B9-06D1AB9D4C3D', '37520 West French Polynesia Blvd.', 'Isaac@ligula.com', 336, 'B'),
  (429, 8, '6EC512E3-85FF-40B6-A5B8-45618C6119AE', '51228 West Maldives Ct.', 'Rajah@Cum.us', 121, 'B'),
  (430, 9, '37618363-3616-44F8-8959-740460D97F45', '35803 South Honduras St.', 'Ulric@nunc.gov', 893, 'A'),
  (431, 5, '1AA06BFC-E71F-472B-B978-44F6AFE2010A', '18409 South Brunei Darussalam St.', 'Kevin@auctor.org', 990, 'B'),
  (432, 7, '76E06ECB-91D4-47F0-963C-46771F6E47D2', '86309 North Burkina Faso Ln.', 'Macaulay@arcu.com', 729, 'A'),
  (433, 7, '239A53AB-86A9-4E70-80C2-320DC575E1FB', '92242 West Great Falls Ave.', 'Brynne@placerat.gov', 296, 'A'),
  (434, 7, '2805B0A9-8FB6-4E61-A1C2-F99566B86302', '35763  Farrell St.', 'Thaddeus@eros.net', 147, 'B'),
  (435, 7, 'A60F65EB-41D7-4426-B239-FE808CE5BFEC', '81798 North Gloucester Ln.', 'Jasmine@purus.net', 317, 'B'),
  (436, 4, '1230E19B-88B8-497A-8AE0-D7C6E0255238', '74753 East Central African Republic Ave.', 'Porter@tortor.org', 461, 'B'),
  (437, 2, 'E4997F08-DC52-4680-A537-0DC9C704CAFA', '4785 West Bouvet Island Ln.', 'Jada@mi.us', 341, 'A'),
  (438, 3, '582C6E2D-5548-408C-BD52-CA105BF74DD9', '44211 South Bangladesh Ct.', 'Kelly@lacinia.com', 380, 'B'),
  (439, 1, '06C8BB8C-9D34-4906-86AB-4C08D904833E', '63836 North Malta Blvd.', 'Audrey@Curabitur.org', 223, 'A'),
  (440, 3, '629F1641-D562-48B2-819D-D09C651F4620', '5830 North Nicaragua Ave.', 'Gil@cubilia.net', 542, 'A'),
  (441, 6, '5B24169D-0D0E-44EF-9952-ED4435F56289', '42877 North Cook Islands Ct.', 'Patrick@tristique.com', 371, 'B'),
  (442, 1, 'DD24ECA7-5B33-4C9B-9C88-71611A46366B', '69345  United States Minor Outlying Islands Ave.', 'Nathan@tortor.com', 978, 'B'),
  (443, 5, 'D8B87CA1-96B4-48F5-84B9-BFF53F6E575B', '79468  British Indian Ocean Territory Ln.', 'Carol@felis.us', 613, 'A'),
  (444, 3, '0608FDD7-1F69-421F-AF2C-A0214FFE6F92', '77446  Austria St.', 'Leonard@Curae.us', 185, 'A'),
  (445, 3, 'C8E8072B-4C5F-46CB-B2B9-5F28B282491A', '99215 East Faroe Islands St.', 'Branden@taciti.com', 410, 'A'),
  (446, 7, '4DF27CCD-B41F-4145-900B-956F035316A4', '63926 South Birmingham Ct.', 'Bertha@posuere.gov', 363, 'A'),
  (447, 10, '020DAEDA-38F2-4B06-9B4B-47E57E145501', '21489 West Carbondale Blvd.', 'Palmer@Phasellus.edu', 585, 'A'),
  (448, 3, '06FB4858-1422-4691-8D81-7CBC9CF0E7C8', '28929  Pakistan Blvd.', 'Guy@iaculis.gov', 719, 'B'),
  (449, 4, 'E24FE43B-E8C1-43B4-B30B-789A6F49F419', '3566 West South Africa St.', 'Carson@neque.com', 670, 'B'),
  (450, 5, 'E4913517-C54F-45A6-84C4-06F3CA203971', '57500  Afghanistan Ct.', 'Warren@Class.net', 147, 'B'),
  (451, 8, '6B376975-DAC9-4660-BE6E-C593085A8B80', '5417  Gilette Ct.', 'Arthur@condimentum.gov', 398, 'B'),
  (452, 3, '801186EA-495F-4E7C-A2EA-3DA920B15062', '81246 West Rwanda Ct.', 'Hedley@diam.us', 645, 'A'),
  (453, 2, 'AB55777C-B18E-42A1-A9C8-F905370FE4A0', '27015  South Georgia and The South Sandwich Islands Way', 'Belle@Nullam.org', 628, 'B'),
  (454, 1, 'CA0023E1-D768-4E2C-8FB8-B59528C1CBE1', '82339 East Fontana Ave.', 'Daria@tempus.com', 118, 'B'),
  (455, 2, '676CF3FE-2FDE-4997-BF0A-D0B708C47937', '40354 West Angola Ct.', 'Kuame@primis.edu', 824, 'B'),
  (456, 5, '815D85D5-EA76-484D-A5D8-23DD01DCAAA4', '44555 South Benin Ct.', 'Eve@lacinia.gov', 724, 'A'),
  (457, 9, '259BCA0B-AC16-4667-9F60-8DD4C56687B9', '87393 West New Zealand Way', 'Hadley@pede.gov', 922, 'B'),
  (458, 9, '73196031-106D-4B59-9D9A-C15F59609666', '54585 East Belize Ln.', 'Barclay@fames.net', 600, 'B'),
  (459, 9, '3262E8F9-6881-4ADF-90D7-4BBB68787FE6', '94861 North Barre Ct.', 'John@vestibulum.com', 438, 'B'),
  (460, 9, '5F2CB588-CC43-464F-BD66-D212EB338C77', '40734 South Oneonta Ave.', 'Darrel@torquent.org', 999, 'B'),
  (461, 5, '1D7C2EE6-AF10-4B5A-A54D-5C2B15811E48', '3619 East Berkeley Ave.', 'Bevis@lorem.com', 395, 'A'),
  (462, 4, 'FA32A7C7-009E-4D7D-86D5-F47BA8DDFB58', '4898 North Algeria Ln.', 'Hayes@primis.org', 269, 'B');
  INSERT INTO `maestro` (`id_maestro`, `id_identificacion`, `codigo_identificacion`, `direccion`, `correo`, `celular`, `estado`) VALUES
  (463, 6, 'E561FDF9-4ED8-4643-B54D-009CA8C22894', '40275 West Lebanon Ave.', 'Illana@conubia.org', 688, 'A'),
  (464, 5, 'E9BB1122-01BB-4A0C-A3F8-3AE5A15B69AF', '64527  Hamilton Way', 'Thaddeus@egestas.gov', 81, 'B'),
  (465, 5, 'EFFC3D64-9349-49BF-935B-217BF51DC92C', '19460 West Compton Way', 'Claire@auctor.com', 97, 'B'),
  (466, 2, 'DD50064B-167F-4EFE-BD36-1F95206DFF60', '99302 North Iran, Islamic Republic of Ln.', 'Wilma@habitant.com', 362, 'A'),
  (467, 4, '1582BC45-C8A0-4E11-9CD4-2634BC7680F4', '57987 North Austria Ln.', 'Aileen@egestas.gov', 583, 'B'),
  (468, 8, '508E2A01-2190-46E3-81F4-3532E54E3933', '29736 North Netherlands Antilles Ave.', 'Xavier@egestas.com', 628, 'B'),
  (469, 8, 'BD5F96A1-0C20-4C66-9A2C-7156138F5AB0', '46530 South Hazleton Ave.', 'Merrill@lacus.com', 456, 'A'),
  (470, 3, '1A47F685-2C42-400A-8DF5-4A6DA6CC85E4', '18168 East Greece St.', 'Uriel@Class.edu', 334, 'A'),
  (471, 2, '2516D1A4-012C-4976-8FEE-46516D88A9DE', '19886 East Areceibo Ave.', 'Keane@pulvinar.org', 335, 'A'),
  (472, 10, 'AF0635DA-5BF9-44CD-9C86-B7D00807D9FC', '12863 East Idabel Ln.', 'Xantha@lectus.com', 622, 'B'),
  (473, 8, '50D1A5D2-8723-4A9E-92B0-4D147A2DBD64', '9503 North Fajardo Ct.', 'Britanney@risus.us', 40, 'A'),
  (474, 6, 'C4BF0685-9283-4568-A2AF-57EFC277B59E', '98412 North Chicopee Way', 'Yasir@parturient.us', 825, 'A'),
  (475, 9, 'C4F4E58C-1DCE-4A41-9B03-376EB84F9CC1', '2315 West Ireland St.', 'Lawrence@nisl.com', 841, 'B'),
  (476, 4, 'E8814BE4-8388-4FC3-8861-E807B4F55F3E', '84330 East French Guiana Way', 'Cecilia@purus.edu', 877, 'A'),
  (477, 8, '05E31DCB-C3CD-4631-B8ED-BF7B88B61FEA', '5287 West Bhutan Way', 'Belle@egestas.gov', 568, 'B'),
  (478, 7, '59F44510-DF41-4F2F-8DA5-518980BADC95', '68336 East Burundi Blvd.', 'Ishmael@tempus.org', 468, 'A'),
  (479, 4, '1DF122A0-BEA7-41B2-9EAB-F7D7BC671695', '11441  Grenada Blvd.', 'Regan@pellentesque.org', 61, 'A'),
  (480, 8, '95EAEB93-65A3-407F-AC05-C3C06E176FDA', '57 West Mayotte Blvd.', 'Destiny@Donec.gov', 356, 'B'),
  (481, 1, '36B03691-A601-41C2-881E-B04F727E38FA', '29901  Swaziland St.', 'Burke@pellentesque.gov', 201, 'A'),
  (482, 6, '6F071DE7-B361-4C36-BE10-1ABFFEBB8BC7', '73334 East Nepal Way', 'Lacey@a.edu', 694, 'B'),
  (483, 6, '0423A871-4CE1-450C-BD07-0208818088D6', '56778 North Bouvet Island Ave.', 'Renee@auctor.net', 177, 'B'),
  (484, 8, 'B82F9442-E8AE-4193-8311-98DFD1937D25', '52940  Chile Way', 'Mara@augue.com', 285, 'A'),
  (485, 7, '135DAF17-0AC9-435B-A703-12E0E684411E', '73605 East Tunisia Ln.', 'Ethan@commodo.net', 503, 'B'),
  (486, 1, '38EF1A8D-AFA7-44FF-A36F-30AA64EE0962', '17421 East Croatia St.', 'Chastity@pulvinar.net', 41, 'A'),
  (487, 1, '455D5336-8902-4BAF-B399-9148A509C5FE', '82232  Central African Republic Ave.', 'Deacon@eu.edu', 932, 'B'),
  (488, 2, 'CF217019-F8C1-4F3D-852E-9DF2B395685A', '7385 East Claremore Ct.', 'Dora@mus.com', 836, 'A'),
  (489, 9, '659F8FB0-99C4-45F1-9015-69A642DE09E8', '9778 East Algeria Way', 'Raja@lacus.edu', 26, 'B'),
  (490, 6, '2D179CFB-459D-4461-BD50-221516C102BF', '97108 North Aruba Ct.', 'Eugenia@Nulla.com', 647, 'A'),
  (491, 10, '16C43C4A-BE96-4502-A960-A141C660F3F7', '85683  Costa Rica Way', 'Chelsea@enim.gov', 451, 'A'),
  (492, 5, 'A4E51F67-1A3A-4EC7-823F-2005DBDED3CD', '75322  Mauritania Ct.', 'Shelby@sodales.org', 955, 'B'),
  (493, 6, 'D40F37FB-A43E-41D5-8224-6348A7A50AC9', '54479 East Afghanistan Way', 'Omar@eget.net', 805, 'A'),
  (494, 4, '8DEB54C8-14D4-42D3-BF14-FE3E694BD7DB', '18303  Central African Republic St.', 'Laith@nostra.org', 614, 'A'),
  (495, 10, '4D66D53F-3F05-4129-9275-EF238442285D', '79403 South Hollywood Ave.', 'Basil@Vivamus.edu', 8, 'B'),
  (496, 6, '7E6B52FE-E826-47F3-A76A-BAA2B5E2C67C', '87729  Niagara Falls Blvd.', 'Kay@eleifend.gov', 94, 'A'),
  (497, 1, 'BCCBCC69-E814-4FFF-8FDE-7F3C2284AC97', '96532 North Fayetteville Ave.', 'Dahlia@nisl.com', 780, 'B'),
  (498, 4, 'F5482A1B-0832-4C65-84A5-A4B1DCEE2047', '22249 South Virgin Islands, British Ln.', 'Kessie@molestie.org', 809, 'B'),
  (499, 2, 'BC9FF55B-62AD-404C-B9BE-7EF6CDCC0B53', '12718  Bangladesh Blvd.', 'Rogan@lorem.gov', 310, 'A'),
  (500, 10, 'AE50D876-B85E-4205-A42E-5FF2C1114D77', '14768 South Fairmont Blvd.', 'Gavin@congue.com', 447, 'A');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `maestro`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `maestro`
  --
  ALTER TABLE `maestro`
    MODIFY `id_maestro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo que identifica al maestro', AUTO_INCREMENT=1001;

  --
  -- Constraints for dumped tables
  --

  --
  -- Constraints for table `maestro`
  --


  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


  INSERT INTO `maestro_curso` (`id_maestro_curso`, `id_maestro`, `id_curso`, `id_grado`, `id_aula`, `descripcion`, `fecha_creacion`, `estado`) VALUES
  (1, 13, 2, 2, 5, 'FNlFuoNWMx', '2020-08-27', 'A'),
  (2, 1, 4, 2, 2, 'nKVUKWgeRA', '2020-08-22', 'A'),
  (3, 16, 5, 2, 1, 'aOtsZJugTB', '2020-08-21', 'A'),
  (4, 23, 5, 4, 2, 'JsqvzDRCnp', '2020-08-26', 'B'),
  (5, 1, 4, 1, 3, 'FCZVUXGdTM', '2020-08-25', 'B'),
  (7, 25, 6, 3, 4, 'Gf SDwhQEl', '2020-08-24', 'B'),
  (8, 1, 6, 4, 1, 'dyoumVkkQt', '2020-08-22', 'A'),
  (9, 8, 6, 3, 3, 'rHSKvbYMnq', '2020-08-24', 'A'),
  (10, 20, 5, 4, 4, 'cUqxRryxCY', '2020-08-24', 'B'),
  (11, 20, 5, 4, 4, 'cUqxRryxCY', '2020-08-24', 'B'),
  (12, 15, 5, 2, 1, 'Unk LWI LC', '2020-08-27', 'B'),
  (13, 1, 4, 2, 2, 'nKVUKWgeRA', '2020-08-22', 'A'),
  (14, 17, 2, 2, 2, 'RSaYxEvjlQ', '2020-08-23', 'A'),
  (15, 7, 4, 3, 4, 'XiRkuJljJa', '2020-08-25', 'B'),
  (16, 11, 2, 3, 4, 'uSAuKxSVZx', '2020-08-23', 'B'),
  (17, 11, 2, 3, 4, 'uSAuKxSVZx', '2020-08-23', 'B'),
  (18, 3, 4, 3, 5, 'eiFaTUvOzW', '2020-08-23', 'A'),
  (19, 28, 1, 3, 3, 'b SyhEXAlS', '2020-08-27', 'A'),
  (20, 29, 5, 4, 1, 'YOwseNfNdL', '2020-08-25', 'B'),
  (21, 17, 4, 3, 4, 'tSxtyrTGqU', '2020-08-23', 'A'),
  (22, 11, 6, 4, 4, 'dKQgJKvxgb', '2020-08-24', 'B'),
  (23, 29, 3, 1, 1, 'Fx XJFbkON', '2020-08-23', 'A'),
  (27, 7, 4, 3, 4, 'XiRkuJljJa', '2020-08-25', 'B'),
  (28, 27, 3, 3, 4, 'OxXPgOGHIV', '2020-08-24', 'A'),
  (29, 29, 5, 4, 1, 'YOwseNfNdL', '2020-08-25', 'B'),
  (30, 13, 2, 2, 4, 'qsoICnXYIO', '2020-08-25', 'A'),
  (31, 20, 5, 4, 4, 'cUqxRryxCY', '2020-08-24', 'B'),
  (32, 11, 2, 3, 4, 'uSAuKxSVZx', '2020-08-23', 'B'),
  (33, 29, 2, 1, 3, 'cDIzHJWPGC', '2020-08-25', 'B'),
  (34, 3, 4, 3, 5, 'eiFaTUvOzW', '2020-08-23', 'A'),
  (35, 6, 1, 2, 1, 'ZTjOuKOvXJ', '2020-08-23', 'B'),
  (36, 3, 4, 3, 5, 'eiFaTUvOzW', '2020-08-23', 'A'),
  (37, 5, 2, 4, 1, 'GIfTaEQ Xf', '2020-08-25', 'A'),
  (38, 29, 3, 1, 1, 'Fx XJFbkON', '2020-08-23', 'A'),
  (39, 20, 1, 4, 2, 'CTalPlpDjU', '2020-08-21', 'B'),
  (40, 23, 4, 3, 4, 'MiFzZJWCJp', '2020-08-26', 'A'),
  (41, 15, 1, 2, 1, 'SeQxJprGHE', '2020-08-23', 'A'),
  (42, 3, 4, 3, 5, 'eiFaTUvOzW', '2020-08-23', 'A'),
  (43, 19, 1, 4, 2, 'GlIBJbGtaL', '2020-08-24', 'B'),
  (44, 13, 2, 2, 5, 'FNlFuoNWMx', '2020-08-27', 'A'),
  (45, 27, 4, 2, 2, 'xOABptNvtc', '2020-08-26', 'A'),
  (46, 9, 5, 4, 1, 'zDPY ekoUf', '2020-08-23', 'B'),
  (47, 28, 2, 3, 4, 'hNODXlOjsf', '2020-08-26', 'A'),
  (48, 27, 4, 2, 2, 'xOABptNvtc', '2020-08-26', 'A'),
  (49, 13, 2, 2, 5, 'FNlFuoNWMx', '2020-08-27', 'A'),
  (50, 3, 3, 3, 1, 'OHbGZMJnjk', '2020-08-24', 'A'),
  (51, 23, 5, 4, 2, 'JsqvzDRCnp', '2020-08-26', 'B');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `maestro_curso`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `maestro_curso`
  --
  ALTER TABLE `maestro_curso`
    MODIFY `id_maestro_curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de asignacion', AUTO_INCREMENT=52;

  --
  -- Constraints for dumped tables
  --

  --
  -- Constraints for table `maestro_curso`
  --


  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

  INSERT INTO `unidad` (`id_unidad`, `nombre_unidad`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
  (1, 'uno', '2020-08-28', '2020-08-28', 'A'),
  (2, 'dos', '2020-08-28', '2020-08-28', 'A'),
  (3, 'tres', '2020-08-28', '2020-08-28', 'A'),
  (4, 'cuatro', '2020-08-28', '2020-08-28', 'A'),
  (5, 'cinco', '2020-08-28', '2020-08-28', 'A'),
  (6, 'seis', '2020-08-28', '2020-08-28', 'A');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `unidad`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `unidad`
  --



  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




  --
  -- Dumping data for table `alumno`
  --

  INSERT INTO `alumno` (`nombre_alumno`, `id_usuario`, `direccion`, `celular`, `correo`, `fecha_creacion`, `id_grado`) VALUES
  ('Lani Shepherd', 0, '17525 North Ireland Ln.', 357, 'Lois@odio.us', '2020-08-24', 3),
  ( 'Chase Frost', 0, '15305 North Cook Islands St.', 935, 'Burton@commodo.com', '2020-08-25', 2),
  ( 'Farrah Stanton', 0, '124 West American Samoa Blvd.', 402, 'Theodore@sapien.org', '2020-08-24', 1),
  ( 'Clark Randall', 0, '51263  Antarctica Blvd.', 199, 'Baxter@torquent.gov', '2020-08-22', 2),
  ( 'Sean Gould', 0, '41060 West La Puente Ave.', 777, 'Griffin@in.org', '2020-08-23', 2),
  ( 'Chaney Benson', 0, '69205 North Frederick Ct.', 46, 'Jordan@vitae.edu', '2020-08-28', 1),
  ( 'Micah Albert', 0, '80202 West Maldives Way', 618, 'Fitzgerald@ad.edu', '2020-08-28', 2),
  ( 'Wing Levy', 0, '79181 West Fulton Ct.', 102, 'Damon@Aenean.net', '2020-08-28', 3),
  ( 'Nathan Glass', 0, '15824  Thailand Ave.', 557, 'Joshua@elit.org', '2020-08-23', 4),
  ( 'Peter Sykes', 0, '74077 East Chandler St.', 266, 'Felicia@fames.net', '2020-08-25', 1),
  ( 'Hannah Pearson', 0, '86412 East Cayman Islands St.', 825, 'Kyra@parturient.edu', '2020-08-27', 2),
  ( 'Martina Velasquez', 0, '29926 West Lufkin St.', 713, 'Randall@laoreet.net', '2020-08-25', 2),
  ( 'Yetta Kinney', 0, '79357 North Kenya Ln.', 910, 'Karyn@bibendum.edu', '2020-08-25', 2),
  ( 'Ross Graves', 0, '94491 East Bulgaria St.', 930, 'Mara@Curabitur.edu', '2020-08-24', 4),
  ( 'Yardley Bowen', 0, '69112 East El Segundo Way', 928, 'Constance@aliquet.com', '2020-08-23', 4),
  ( 'Veronica Crosby', 0, '79114 North Rwanda St.', 151, 'Shay@augue.us', '2020-08-23', 1),
  ( 'Lara Berger', 0, '94964 East Nepal Blvd.', 303, 'Fitzgerald@netus.com', '2020-08-28', 1),
  ( 'Isaac Beard', 0, '63308  Cambodia Ln.', 458, 'Cooper@diam.us', '2020-08-24', 3),
  ( 'Caldwell Cameron', 0, '94255 North Czech Republic Way', 330, 'Nichole@lacus.gov', '2020-08-25', 4),
  ( 'Amethyst Sims', 0, '3512 South Angola Ln.', 589, 'Nina@ultrices.edu', '2020-08-24', 2),
  ( 'Kyle Berry', 0, '56770  Dixon Way', 562, 'Elmo@Vivamus.org', '2020-08-24', 4),
  ( 'Karly Maxwell', 0, '36866 East Bahrain Blvd.', 117, 'Philip@Ut.org', '2020-08-25', 2),
  ( 'Farrah Stewart', 0, '75258  Uzbekistan Ave.', 246, 'James@In.com', '2020-08-26', 2),
  ( 'Alana Russell', 0, '9355 West Lithuania Ave.', 106, 'Noah@Cum.com', '2020-08-27', 2),
  ( 'Zephr Caldwell', 0, '56364 East Calabasas Ln.', 453, 'Idola@volutpat.net', '2020-08-26', 3),
  ( 'Teagan Austin', 0, '57960 West Azerbaijan Ave.', 638, 'Ivan@augue.com', '2020-08-28', 4),
  ( 'Kirk Lindsey', 0, '53946 West Micronesia Ln.', 844, 'Stewart@urna.gov', '2020-08-28', 2),
  ( 'Nigel Lewis', 0, '70375 North China Ln.', 948, 'Carl@vel.net', '2020-08-25', 2),
  ( 'Quinlan Dyer', 0, '67347 West Chile St.', 465, 'Chancellor@risus.us', '2020-08-22', 1),
  ( 'Reagan Barrett', 0, '2350 East Colombia Blvd.', 661, 'Asher@Aliquam.edu', '2020-08-28', 3),
  ( 'Matthew Knapp', 0, '40568  Bhutan Ln.', 387, 'Knox@odio.us', '2020-08-24', 1),
  ( 'Emmanuel Sargent', 0, '57198 West Honduras Way', 202, 'Margaret@dis.us', '2020-08-23', 1),
  ( 'Illiana Bender', 0, '28747  Sri Lanka Way', 597, 'Steven@placerat.gov', '2020-08-27', 4),
  ( 'Sophia Mathis', 0, '56611 North Trinidad and Tobago St.', 822, 'Ira@ridiculus.com', '2020-08-28', 2),
  ( 'Edward Rice', 0, '21482 South Hazleton Ln.', 550, 'Linus@erat.us', '2020-08-27', 3),
  ( 'Isadora Davidson', 0, '72513 West Niger Ct.', 176, 'Oprah@Cum.com', '2020-08-27', 1),
  ( 'Kessie Collins', 0, '64511 South Fond du Lac Ln.', 989, 'Hadassah@eu.org', '2020-08-26', 1),
  ( 'Lydia Meyers', 0, '34473  Azerbaijan Way', 551, 'Irene@Aenean.gov', '2020-08-22', 2),
  ( 'Xavier Adkins', 0, '57688 West Gloversville Ct.', 194, 'Connor@urna.gov', '2020-08-27', 4),
  ( 'Addison Rich', 0, '96393  Malaysia St.', 773, 'Channing@netus.gov', '2020-08-25', 1),
  ( 'Hilda Craig', 0, '61387 North Corinth Ave.', 869, 'Gisela@commodo.gov', '2020-08-28', 1),
  ( 'Wayne Ramsey', 0, '24224 North Nepal Ct.', 978, 'September@Cum.net', '2020-08-27', 1),
  ( 'James Walton', 0, '54476  Macao Ct.', 844, 'Tyrone@semper.edu', '2020-08-26', 3),
  ( 'Basil Pace', 0, '55241 North Cape Verde St.', 245, 'Robert@orci.net', '2020-08-24', 3),
  ( 'Darius Mccray', 0, '59364 South Thailand Ct.', 680, 'Grant@sem.us', '2020-08-26', 3),
  ( 'Norman Madden', 0, '79745  Cocos (Keeling) Islands Ave.', 169, 'Hadley@cubilia.edu', '2020-08-25', 2),
  ( 'Zeph Johnston', 0, '92157 North Afghanistan Blvd.', 569, 'Patricia@hendrerit.edu', '2020-08-27', 2),
  ( 'Ima Banks', 0, '72304 West Duquesne Ln.', 410, 'Katelyn@ligula.org', '2020-08-24', 4),
  ( 'Liberty Mcfadden', 0, '19665 South Iowa City Blvd.', 867, 'Mason@Praesent.edu', '2020-08-28', 4),
  ( 'Tamara Mooney', 0, '93914 East British Indian Ocean Territory Blvd.', 201, 'Jerome@imperdiet.com', '2020-08-22', 3),
  ( 'Hayley Villarreal', 0, '87401  Faroe Islands Blvd.', 722, 'Nicholas@rhoncus.org', '2020-08-23', 3),
  ( 'Halla Whitley', 0, '39719 South Syrian Arab Republic Ave.', 279, 'Lee@ullamcorper.us', '2020-08-25', 4),
  ( 'Mari Blackburn', 0, '46209 South Citrus Heights St.', 587, 'Nigel@lobortis.com', '2020-08-26', 4),
  ( 'Caleb Stokes', 0, '45806 North Canada Ct.', 193, 'Kalia@mi.net', '2020-08-24', 1),
  ( 'Amena Pace', 0, '94179 East United Arab Emirates St.', 281, 'Stephen@ipsum.gov', '2020-08-26', 2),
  ( 'Patrick Lang', 0, '45460 East Hannibal Ave.', 497, 'Cassady@massa.net', '2020-08-27', 4),
  ( 'Barry Nichols', 0, '71863 South China St.', 442, 'Roary@gravida.net', '2020-08-28', 1),
  ( 'Kasimir Cabrera', 0, '10005 West Reunion Ln.', 106, 'Miranda@netus.org', '2020-08-25', 2),
  ( 'Kyra Bush', 0, '5625 East Canada St.', 234, 'Carolyn@facilisis.com', '2020-08-23', 3),
  ( 'Nelle Avila', 0, '42980 East Kuwait St.', 646, 'Sylvia@lorem.com', '2020-08-23', 4),
  ( 'Reed Oliver', 0, '10060  Bulgaria Blvd.', 454, 'Jonah@faucibus.edu', '2020-08-28', 2),
  ( 'Patricia Hebert', 0, '51561 South Uzbekistan Blvd.', 507, 'Quin@congue.gov', '2020-08-22', 1),
  ( 'Scarlett Barton', 0, '29382 East Lebanon Blvd.', 338, 'Clinton@placerat.net', '2020-08-27', 2),
  ( 'Victoria Dean', 0, '98387 North Sudan Blvd.', 832, 'Uta@dignissim.com', '2020-08-23', 1),
  ( 'Kenyon Quinn', 0, '34280  China Blvd.', 425, 'Imelda@eros.edu', '2020-08-28', 3),
  ( 'Sage Graham', 0, '13599  Nicaragua Ln.', 956, 'Lionel@faucibus.us', '2020-08-23', 3),
  ( 'Raven Donovan', 0, '64336 East Heard Island and Mcdonald Islands Way', 325, 'Shaeleigh@lacinia.net', '2020-08-25', 4),
  ( 'Daria Campbell', 0, '15911 South Faroe Islands St.', 511, 'Emery@ac.net', '2020-08-22', 1),
  ( 'Daria Lopez', 0, '56236 South Cape Coral Ln.', 355, 'Jasmine@et.gov', '2020-08-26', 3),
  ( 'Ivor Todd', 0, '45980 North Flint Blvd.', 299, 'Arden@nec.us', '2020-08-26', 4),
  ( 'Evangeline Hughes', 0, '36542 North French Guiana Blvd.', 462, 'Jamal@non.net', '2020-08-25', 2),
  ( 'Thor Horton', 0, '44422 North Cook Islands Blvd.', 967, 'Kennedy@adipiscing.gov', '2020-08-28', 2),
  ( 'Cain Livingston', 0, '93958 South Western Sahara Way', 323, 'Kuame@pharetra.net', '2020-08-26', 2),
  ( 'Brenna Barrera', 0, '52879 East Albania Ln.', 683, 'Wyoming@litora.us', '2020-08-28', 2),
  ( 'Daniel Tyler', 0, '87213 West Sierra Leone Ln.', 700, 'Amity@quis.edu', '2020-08-24', 3),
  ( 'Germaine Mitchell', 0, '73746 North Papua New Guinea Ave.', 389, 'Illana@blandit.com', '2020-08-28', 2),
  ( 'Kamal Newman', 0, '95814 West Elizabeth City Ave.', 214, 'Jacob@leo.gov', '2020-08-26', 1),
  ( 'Leah Kirk', 0, '85311  Fontana Ct.', 693, 'Arthur@risus.net', '2020-08-28', 3),
  ( 'Mohammad Guy', 0, '24925 South Arvada St.', 475, 'Faith@tellus.edu', '2020-08-22', 1),
  ( 'Caesar Leonard', 0, '17478 South Brownsville Ct.', 455, 'Mari@Maecenas.com', '2020-08-23', 1),
  ( 'Aristotle Simon', 0, '95495 West Burundi Blvd.', 831, 'Dawn@imperdiet.com', '2020-08-22', 2),
  ( 'Galvin Swanson', 0, '3188 West Albania Ln.', 799, 'Igor@fringilla.us', '2020-08-26', 2),
  ( 'Elvis Dawson', 0, '34194 South Angola Ct.', 831, 'Jarrod@ullamcorper.gov', '2020-08-25', 3),
  ( 'Belle Calhoun', 0, '43802 West Bulgaria Ave.', 509, 'Walker@Quisque.us', '2020-08-28', 2),
  ( 'Rooney Higgins', 0, '62878  Georgia Ct.', 283, 'Berk@placerat.gov', '2020-08-23', 3),
  ( 'Petra Hull', 0, '94903 South Mexico Ln.', 977, 'Slade@pharetra.com', '2020-08-28', 2),
  ( 'Robert Peters', 0, '38209  Cocos (Keeling) Islands Ln.', 68, 'Omar@faucibus.us', '2020-08-25', 3),
  ( 'Ferdinand Sherman', 0, '39173 North Antigua and Barbuda Blvd.', 184, 'Cullen@sed.edu', '2020-08-22', 4),
  ( 'Cameron Ochoa', 0, '20815 South Everett Ln.', 0, 'Steel@vulputate.gov', '2020-08-27', 4),
  ( 'Berk Cantrell', 0, '74562 North Aberdeen Ct.', 35, 'Zoe@rhoncus.com', '2020-08-25', 3),
  ( 'Dane Payne', 0, '61831 North Austria Blvd.', 481, 'Justina@interdum.edu', '2020-08-23', 3),
  ( 'Lacey Ballard', 0, '69787  Claremore Ln.', 150, 'Illana@nisi.edu', '2020-08-25', 4),
  ( 'Kasimir Atkins', 0, '13153 East Turks and Caicos Islands Way', 640, 'Ferris@quam.gov', '2020-08-27', 3),
  ( 'Xantha Gentry', 0, '83603 East Honduras Blvd.', 497, 'Rebecca@Cras.gov', '2020-08-26', 4),
  ( 'Brooke Johns', 0, '85858 East Dover St.', 632, 'Adam@amet.us', '2020-08-22', 1),
  ( 'Blake Little', 0, '98401 East Los Angeles Ave.', 531, 'Stuart@eleifend.edu', '2020-08-27', 4),
  ( 'Maryam Kirkland', 0, '31553  Gallup Ave.', 677, 'Graham@gravida.net', '2020-08-28', 3),
  ( 'Francesca Hernandez', 0, '1328  United Arab Emirates Blvd.', 930, 'Xander@magna.edu', '2020-08-26', 1),
  ( 'Logan Monroe', 0, '47132 East Swaziland Ln.', 311, 'Rigel@euismod.org', '2020-08-28', 1),
  ( 'Sybil Gonzalez', 0, '6852  Kuwait Blvd.', 723, 'Dean@ultricies.net', '2020-08-25', 1),
  ( 'Hunter Hines', 0, '70599 South United Arab Emirates Ln.', 582, 'Melodie@magna.us', '2020-08-24', 4),
  ( 'Velma Gill', 0, '50444  Central African Republic Ct.', 229, 'Reese@volutpat.gov', '2020-08-25', 1),
  ( 'Mari Meyer', 0, '80541 East Turks and Caicos Islands Ln.', 642, 'Dale@Quisque.gov', '2020-08-25', 2),
  ( 'Micah Stanley', 0, '41015 West Monrovia Ave.', 505, 'Kennan@eros.us', '2020-08-28', 4),
  ( 'Quintessa Rojas', 0, '98635  Israel St.', 1, 'Justine@bibendum.us', '2020-08-24', 2),
  ( 'Jorden Browning', 0, '63013  Gulfport Way', 989, 'Cheyenne@congue.gov', '2020-08-24', 4),
  ( 'Demetria Fleming', 0, '10977 South Peabody Ln.', 130, 'Urielle@laoreet.com', '2020-08-23', 3),
  ( 'Howard Richardson', 0, '45239 South Belize St.', 757, 'Kylynn@urna.gov', '2020-08-25', 2),
  ( 'Jonah Nichols', 0, '80176 South Auburn Ct.', 681, 'George@aliquam.gov', '2020-08-25', 4),
  ( 'Abigail Graham', 0, '53907 North Laramie St.', 658, 'Hilda@facilisis.us', '2020-08-27', 1),
  ( 'Dai Campbell', 0, '61986 North Lebanon Blvd.', 8, 'Roary@dictum.gov', '2020-08-24', 3),
  ( 'Gareth Richard', 0, '4538 South Chickasha St.', 618, 'Xantha@Class.gov', '2020-08-22', 4),
  ( 'Whitney Rowland', 0, '748 North Charlotte Ct.', 364, 'Nehru@fringilla.org', '2020-08-24', 3),
  ( 'Maisie Rojas', 0, '43105 East Botswana Way', 930, 'Katelyn@ac.us', '2020-08-22', 3),
  ( 'Grant Russell', 0, '27287 East Ireland Ave.', 997, 'Tatum@nisi.org', '2020-08-27', 3),
  ( 'Owen Barr', 0, '31765 West Uzbekistan Ct.', 802, 'Jada@Cras.net', '2020-08-24', 3),
  ( 'Vanna Key', 0, '93789 South Antigua and Barbuda Ct.', 626, 'Piper@cursus.edu', '2020-08-23', 2),
  ( 'Elizabeth Richards', 0, '66435 East Cayman Islands St.', 877, 'Jasmine@molestie.org', '2020-08-26', 3),
  ( 'Stacey Mckenzie', 0, '94012 West Bhutan St.', 755, 'Lyle@Phasellus.com', '2020-08-26', 3),
  ( 'Keiko Peterson', 0, '80041  Gabon Way', 532, 'Guinevere@aptent.org', '2020-08-27', 1),
  ( 'Damon Phillips', 0, '84227 East Australia St.', 461, 'Fallon@nulla.edu', '2020-08-25', 1),
  ( 'Xandra Jenkins', 0, '25507 North Anderson Way', 602, 'Thor@eget.net', '2020-08-27', 4),
  ( 'Xavier Rodgers', 0, '22957  Andorra St.', 121, 'Cain@at.edu', '2020-08-27', 2),
  ( 'Perry Fleming', 0, '31266  Central African Republic St.', 412, 'Mark@lacinia.net', '2020-08-24', 1),
  ( 'Britanni Hays', 0, '2324 West Cameroon Ln.', 787, 'Kennan@euismod.org', '2020-08-28', 4),
  ( 'Finn Boone', 0, '24895 East Madagascar Way', 722, 'Moses@id.us', '2020-08-23', 3),
  ( 'Cassidy Mcfarland', 0, '32899  Brunei Darussalam Ln.', 672, 'Chandler@nibh.edu', '2020-08-22', 2),
  ( 'Austin Ortiz', 0, '65785 West United Kingdom Ave.', 129, 'Brian@penatibus.edu', '2020-08-25', 4),
  ( 'Akeem Price', 0, '78777 West Reunion Way', 680, 'Halee@Phasellus.com', '2020-08-27', 3),
  ( 'Zane Bradshaw', 0, '88916 East Anguilla St.', 225, 'Colton@facilisi.edu', '2020-08-23', 3),
  ( 'Britanni Wise', 0, '73728 West College Station Ln.', 151, 'Conan@aliquet.edu', '2020-08-22', 1),
  ( 'Melvin Hurst', 0, '83084 West Cerritos Ln.', 849, 'Nadine@sollicitudin.gov', '2020-08-25', 1),
  ( 'Malcolm Peck', 0, '81441 East Burlington Ct.', 73, 'Laith@pretium.net', '2020-08-25', 1),
  ( 'Aladdin Morrison', 0, '86160  Norway St.', 589, 'Alfonso@venenatis.net', '2020-08-28', 4),
  ( 'Aristotle Guerrero', 0, '9947  Singapore Ave.', 945, 'Marsden@facilisi.org', '2020-08-22', 4),
  ( 'Noelani Fry', 0, '58887  Japan Ct.', 348, 'Irene@Quisque.edu', '2020-08-23', 2),
  ( 'Hector Livingston', 0, '86106 East Eau Claire St.', 388, 'Zachery@Integer.edu', '2020-08-27', 3),
  ( 'Deborah Whitley', 0, '67485 North Carson City Ln.', 452, 'Damian@id.org', '2020-08-25', 1),
  ( 'Farrah Carr', 0, '48936 West Pembroke Pines Ave.', 907, 'Clare@Nulla.net', '2020-08-25', 1),
  ( 'Fallon Landry', 0, '80397 North Tajikistan Way', 840, 'Lucas@blandit.net', '2020-08-27', 3),
  ( 'Herman Riddle', 0, '7913 North Aruba Ave.', 587, 'Colorado@eros.com', '2020-08-22', 4),
  ( 'Lacey May', 0, '38498 East Serbia and Montenegro Ln.', 252, 'Mira@sed.com', '2020-08-27', 3),
  ('Frances Howell', 0, '87115 East Albania Way', 56, 'Tanisha@nisl.net', '2020-08-23', 2),
  ('Wesley Rios', 0, '96407 North Jeannette Way', 223, 'Josiah@Vestibulum.us', '2020-08-26', 2),
  ('MacKenzie Potter', 0, '49857  Chad Ave.', 114, 'Sasha@porttitor.net', '2020-08-23', 2),
  ('Mohammad Sloan', 0, '80724 South Ireland Ct.', 413, 'Quinlan@Vestibulum.us', '2020-08-25', 4),
  ('Troy Summers', 0, '20988 North Bulgaria Blvd.', 94, 'Phelan@viverra.org', '2020-08-24', 4),
  ('Kadeem Bradshaw', 0, '21846 East Lithuania Ln.', 364, 'Sierra@facilisis.org', '2020-08-27', 4),
  ('Abra Martinez', 0, '72464  Viet Nam Blvd.', 539, 'Hashim@senectus.net', '2020-08-25', 3),
  ('Karly Wilder', 0, '65773 South Kiribati St.', 403, 'Theodore@vel.org', '2020-08-23', 2),
  ('Garth Stokes', 0, '22764 North Gardena Way', 601, 'Skyler@Praesent.edu', '2020-08-23', 3),
  ('Gavin Stout', 0, '52912 East Atlanta St.', 248, 'Damian@ut.gov', '2020-08-27', 3),
  ('Armand Armstrong', 0, '11603 West Fall River Way', 738, 'Martha@magnis.gov', '2020-08-22', 2),
  ('Josephine Haynes', 0, '94640 West Comoros Ct.', 424, 'Joan@enim.edu', '2020-08-28', 4),
  ('Vernon Green', 0, '39661 West Saudi Arabia Ln.', 134, 'Jesse@ut.us', '2020-08-27', 3),
  ('Melissa Ellison', 0, '78746 South Greenville Way', 27, 'Hop@congue.com', '2020-08-26', 4),
  ('Fay Hahn', 0, '82517 North Angola Way', 814, 'Karen@mattis.us', '2020-08-24', 3),
  ('Nolan Palmer', 0, '22363 West Kazakhstan Blvd.', 801, 'Orson@arcu.com', '2020-08-26', 4),
  ('Carson Zimmerman', 0, '91856  Costa Rica Way', 611, 'Connor@metus.com', '2020-08-28', 1),
  ('Maggy Warren', 0, '41282  Gettysburg Ave.', 182, 'Jasper@eros.org', '2020-08-28', 1),
  ('Brett Roberson', 0, '21696 East Hopkinsville Way', 659, 'Nora@metus.gov', '2020-08-26', 1),
  ('Aidan Hughes', 0, '1761 West Portugal Blvd.', 445, 'Jason@metus.edu', '2020-08-25', 1),
  ('Andrew Sexton', 0, '42956 East Azerbaijan Ln.', 995, 'Nerea@eu.net', '2020-08-25', 3),
  ('Jamalia Franco', 0, '14662 West Lake Charles Way', 23, 'Mercedes@In.gov', '2020-08-24', 4),
  ('Vincent Hewitt', 0, '4430 South Western Sahara St.', 775, 'Lewis@risus.net', '2020-08-27', 3),
  ('Hall Padilla', 0, '87452  Guadeloupe Way', 932, 'Elliott@rhoncus.edu', '2020-08-27', 3),
  ('Kuame Mooney', 0, '41173 West Faroe Islands Ave.', 410, 'Yeo@ullamcorper.edu', '2020-08-27', 3),
  ('Hedy Collier', 0, '81838  Bellingham Ave.', 33, 'Cooper@parturient.us', '2020-08-26', 4),
  ('Yolanda Wilson', 0, '92402 West Bosnia and Herzegovina Ct.', 68, 'Chandler@penatibus.com', '2020-08-26', 4),
  ('Forrest Fulton', 0, '1870 West Colombia Blvd.', 671, 'Zelda@libero.com', '2020-08-27', 1),
  ('Kai Terrell', 0, '73206 South Bermuda Ln.', 179, 'Xantha@pellentesque.gov', '2020-08-28', 2),
  ('August Mayo', 0, '56223 South Heard Island and Mcdonald Islands Blvd.', 351, 'Kennan@imperdiet.edu', '2020-08-23', 3),
  ('Macon Bush', 0, '24316 East Slovakia Ave.', 557, 'Vance@Nullam.org', '2020-08-22', 2),
  ('Lyle Hatfield', 0, '83822 North Kuwait Blvd.', 411, 'Gil@tristique.net', '2020-08-26', 4),
  ('Herman Pennington', 0, '86470 East Cyprus Ave.', 360, 'Rhona@Class.edu', '2020-08-24', 3),
  ('Nora Griffith', 0, '75646 West Chula Vista Ln.', 861, 'Ronan@fringilla.gov', '2020-08-27', 1),
  ('Lester Kirk', 0, '52544 North Chile Ave.', 206, 'Keely@id.us', '2020-08-28', 3),
  ('Colt Gentry', 0, '27817 West Saint Vincent and The Grenadines Ave.', 101, 'Kane@egestas.us', '2020-08-27', 3),
  ('Gwendolyn Guerra', 0, '33384 West Hanahan Ct.', 848, 'Josephine@est.gov', '2020-08-26', 4),
  ('Rana Goff', 0, '6503  Albania Ave.', 476, 'Idola@tellus.org', '2020-08-23', 2),
  ('Cara May', 0, '83144 East Chad Ct.', 285, 'Hakeem@ligula.edu', '2020-08-22', 3),
  ('Benedict Morrison', 0, '44425 East Klamath Falls Ave.', 96, 'Azalia@montes.org', '2020-08-24', 3),
  ('Cody Rush', 0, '26625 North Manchester St.', 194, 'Marny@scelerisque.us', '2020-08-25', 1),
  ('Chaim Howard', 0, '88421 West Mauritania Blvd.', 343, 'Quinlan@Lorem.edu', '2020-08-24', 1),
  ('Abraham Murray', 0, '38009 West Cerritos St.', 617, 'Jameson@rhoncus.net', '2020-08-26', 2),
  ('Gray Peters', 0, '3119 South Serbia and Montenegro Way', 657, 'Nola@sem.org', '2020-08-24', 4),
  ('Ross Whitaker', 0, '16892 East Henderson Blvd.', 128, 'Fuller@pretium.edu', '2020-08-24', 4),
  ('Britanney Leon', 0, '99102 East Suriname Way', 562, 'Harper@condimentum.org', '2020-08-28', 3),
  ('Hannah Beck', 0, '19413 West Catskill Blvd.', 694, 'Olympia@est.org', '2020-08-27', 3),
  ('Addison Dunlap', 0, '31525 South Singapore Ln.', 365, 'Adena@Praesent.gov', '2020-08-22', 2),
  ('Imogene Hansen', 0, '82642 South Tokelau Ln.', 145, 'Destiny@arcu.edu', '2020-08-26', 4),
  ('Drake Lopez', 0, '39170 East Luxembourg Ln.', 609, 'Otto@habitant.org', '2020-08-22', 3),
  ('Maile Leach', 0, '61133 North Bahrain Way', 265, 'Vera@tempus.edu', '2020-08-26', 4),
  ('Walter Dyer', 0, '83112 North Artesia Ln.', 747, 'Bryar@sollicitudin.com', '2020-08-26', 2),
  ('Drake Prince', 0, '43550 West Ethiopia Ave.', 197, 'Finn@pulvinar.com', '2020-08-22', 4),
  ('Alec Joyner', 0, '78986 East Hackensack Way', 472, 'Clio@litora.us', '2020-08-23', 1),
  ('Camille Rodriquez', 0, '31298  Arvada Ave.', 202, 'Desiree@senectus.net', '2020-08-25', 4),
  ('Juliet Mcguire', 0, '17826 South Cohoes Blvd.', 411, 'Daphne@torquent.us', '2020-08-24', 3),
  ('Cleo Woods', 0, '31941 East Auburn Hills Ct.', 392, 'Xanthus@Curabitur.edu', '2020-08-26', 3),
  ('Giacomo Baker', 0, '69794 North Elsmere Way', 621, 'Cameran@vulputate.net', '2020-08-27', 1),
  ('Rinah Reilly', 0, '77756 West Libyan Arab Jamahiriya Ln.', 447, 'Byron@euismod.us', '2020-08-24', 2),
  ('Carolyn Heath', 0, '55470 South Cleveland Ct.', 689, 'Shea@fringilla.gov', '2020-08-22', 4),
  ('Ulric Jenkins', 0, '18209 North Canada Way', 306, 'Jenette@elementum.edu', '2020-08-28', 3),
  ('Dennis Kelly', 0, '74381 North Myanmar Blvd.', 896, 'Kieran@molestie.net', '2020-08-25', 2),
  ('Timon Duke', 0, '90736  Namibia Ct.', 864, 'Christopher@magnis.us', '2020-08-28', 3),
  ('Rudyard Colon', 0, '7226 North New Kensington Way', 546, 'Xander@natoque.edu', '2020-08-24', 3),
  ('Brenda Avila', 0, '22404  Botswana Ave.', 55, 'Aurora@facilisis.us', '2020-08-22', 4),
  ('Germane Wall', 0, '24192 East Lincoln St.', 586, 'Mikayla@natoque.com', '2020-08-24', 2),
  ('Melissa Franks', 0, '12030 West Bolivia Blvd.', 565, 'Vanna@massa.net', '2020-08-26', 2),
  ('Jolie Alvarado', 0, '29128 West Chad Blvd.', 482, 'Whilemina@primis.com', '2020-08-24', 4),
  ('Rama Bender', 0, '65221 North United Kingdom Way', 699, 'Rhona@Suspendisse.edu', '2020-08-24', 1),
  ('Lucas Tate', 0, '93752 South Port Huron Ln.', 766, 'Astra@Quisque.org', '2020-08-22', 4),
  ('Cora Carr', 0, '17241  Monaco St.', 4, 'Samson@elit.org', '2020-08-23', 2),
  ('Haley Mcclain', 0, '4348 North Hutchinson Ave.', 177, 'Fiona@malesuada.edu', '2020-08-28', 1),
  ('Judah Wolfe', 0, '72381  Anguilla Ave.', 962, 'Harding@molestie.net', '2020-08-28', 1),
  ('Dylan Harding', 0, '29948 North Congo Blvd.', 173, 'Sonia@lobortis.gov', '2020-08-28', 1),
  ('Harper Callahan', 0, '55482  Bartlesville Ave.', 490, 'Lacota@lacinia.net', '2020-08-27', 1),
  ('Ivy Harper', 0, '98036 East Antarctica Ct.', 338, 'Glenna@eget.com', '2020-08-25', 1),
  ('Kasimir Gaines', 0, '14906 East Bulgaria Way', 481, 'Kiayada@euismod.edu', '2020-08-22', 2),
  ('Colt Delaney', 0, '91570  Bangladesh Ct.', 970, 'Brett@porta.edu', '2020-08-27', 4),
  ('Tobias Nicholson', 0, '78932 West Cocos (Keeling) Islands Ct.', 145, 'Garrett@volutpat.gov', '2020-08-28', 2),
  ('Tyler Oneal', 0, '35984 East Angola Ave.', 208, 'Isaiah@a.us', '2020-08-22', 3),
  ('Hayes Crane', 0, '56803 South Belarus Ave.', 698, 'Abdul@feugiat.gov', '2020-08-27', 3),
  ('Jeremy Mccall', 0, '12593 West Gambia Ct.', 703, 'Kaitlin@Cras.us', '2020-08-25', 2),
  ('Bree Saunders', 0, '23354 West United Arab Emirates Ct.', 620, 'Gage@diam.net', '2020-08-23', 4),
  ('Mechelle Solomon', 0, '24842 West Anchorage Ave.', 409, 'Branden@dis.org', '2020-08-26', 4),
  ('Yeo Kane', 0, '6786  Bend St.', 135, 'Lysandra@dignissim.us', '2020-08-24', 4),
  ('Samuel Griffin', 0, '24914 West Fayetteville St.', 178, 'Jasmine@Lorem.edu', '2020-08-26', 4),
  ('Iliana Spencer', 0, '11324 West Algeria Blvd.', 345, 'Talon@per.edu', '2020-08-26', 3),
  ('Hakeem Tate', 0, '34358 North Congo Ave.', 742, 'George@cubilia.edu', '2020-08-27', 2),
  ('Alexander Sims', 0, '77912 North Chile Ave.', 954, 'Kyla@dapibus.us', '2020-08-26', 1),
  ('Jermaine Travis', 0, '55715 South Falkland Islands (Malvinas) Way', 162, 'Mason@eu.net', '2020-08-22', 3),
  ('Cassady Cantu', 0, '31879  Ecuador Ct.', 8, 'Noelle@mauris.us', '2020-08-28', 1),
  ('Barrett Daniels', 0, '23917 South Oswego Ave.', 492, 'Rudyard@Proin.net', '2020-08-23', 4),
  ('Maggy Sweet', 0, '61294 West Guadeloupe Ln.', 875, 'Xenos@faucibus.com', '2020-08-25', 1),
  ('Debra Gross', 0, '50887 East Falkland Islands (Malvinas) St.', 764, 'Mercedes@laoreet.org', '2020-08-25', 2),
  ( 'Serina Haney', 0, '35897 North Aurora Ct.', 713, 'Haley@eu.com', '2020-08-24', 1),
  ( 'Brynn Conner', 0, '33571 South Northern Mariana Islands Ct.', 968, 'Lillian@aliquam.us', '2020-08-27', 3),
  ( 'Alika Parrish', 0, '2156 East Christmas Island Blvd.', 353, 'Kim@imperdiet.us', '2020-08-28', 1),
  ( 'Glenna Kirby', 0, '6847 South Jordan Ave.', 302, 'Ori@mi.us', '2020-08-28', 4),
  ( 'Berk Forbes', 0, '73475 South North Adams Ave.', 929, 'Chaney@dictum.us', '2020-08-25', 2),
  ( 'Lani Gonzalez', 0, '99635  Little Falls Ave.', 514, 'Lani@sodales.net', '2020-08-25', 2),
  ( 'Jordan Patterson', 0, '2849 East Ghana Ave.', 532, 'Adria@nunc.us', '2020-08-23', 4),
  ( 'Natalie Finch', 0, '14185 East Brunei Darussalam Ave.', 662, 'Neil@nisi.net', '2020-08-25', 2),
  ( 'Callie Moss', 0, '33068 East Boulder Junction Way', 674, 'Megan@velit.edu', '2020-08-28', 4),
  ( 'Hollee Floyd', 0, '26630  Cuba Ave.', 295, 'Bianca@feugiat.gov', '2020-08-25', 2),
  ( 'Isaac Logan', 0, '56630  Asheville Ave.', 940, 'Kimberley@litora.gov', '2020-08-25', 4),
  ( 'Rosalyn Fuentes', 0, '92672 West Bahamas Ln.', 388, 'Rhonda@tempus.edu', '2020-08-24', 3),
  ( 'Keely Stein', 0, '62145  United States Minor Outlying Islands Blvd.', 573, 'Nicole@montes.edu', '2020-08-22', 2),
  ( 'Dolan Barron', 0, '80176 South Chad Way', 650, 'Erich@nec.gov', '2020-08-22', 3),
  ( 'Alden Vinson', 0, '24601  Costa Rica Way', 933, 'Cyrus@placerat.com', '2020-08-26', 1),
  ( 'Lane Diaz', 0, '40811 South Dominican Republic Blvd.', 520, 'Owen@ut.com', '2020-08-26', 2),
  ( 'Dana Johnston', 0, '29058  Champaign Blvd.', 998, 'Emmanuel@magnis.edu', '2020-08-25', 4),
  ( 'Brett Stevens', 0, '51789  Mozambique St.', 602, 'Stone@ullamcorper.edu', '2020-08-28', 1),
  ( 'Donovan Walls', 0, '55071  La Palma Ln.', 696, 'Donna@Pellentesque.edu', '2020-08-23', 4),
  ( 'Melvin Wheeler', 0, '97729 South Butler Blvd.', 557, 'Hamish@commodo.com', '2020-08-23', 2),
  ( 'Lawrence Joseph', 0, '74089 North Virgin Islands, British Way', 323, 'Chloe@sodales.org', '2020-08-27', 4),
  ( 'Zachary Kidd', 0, '42673 North Mali Ln.', 345, 'Alyssa@orci.edu', '2020-08-28', 4),
  ( 'Joseph Winters', 0, '18208 North Chile Ct.', 501, 'Bradley@velit.gov', '2020-08-24', 3),
  ( 'Rinah Hartman', 0, '54197 East Bahamas Blvd.', 336, 'Fitzgerald@ante.net', '2020-08-23', 1),
  ( 'Rooney Weeks', 0, '46133  Sao Tome and Principe Ave.', 255, 'Naida@Aliquam.edu', '2020-08-23', 4),
  ( 'Buffy Becker', 0, '8443 South Tanzania, United Republic of St.', 361, 'Anthony@magna.us', '2020-08-28', 1),
  ( 'Dillon Perry', 0, '60981 South American Samoa Way', 860, 'Salvador@ligula.edu', '2020-08-24', 1),
  ( 'Kylan Preston', 0, '42584 East Nicaragua St.', 761, 'Ria@magna.net', '2020-08-25', 1),
  ( 'Rooney Curtis', 0, '87399 West Marshall Islands Blvd.', 722, 'Guy@cubilia.com', '2020-08-22', 2),
  ( 'Hillary Acevedo', 0, '76995 South Aruba Ln.', 129, 'Hyacinth@gravida.edu', '2020-08-26', 1),
  ( 'Brendan Wilcox', 0, '50640 East Bermuda St.', 402, 'Lana@fermentum.us', '2020-08-25', 4),
  ( 'Geraldine Ortiz', 0, '69721  Lithuania St.', 767, 'Fritz@nisl.org', '2020-08-25', 3),
  ( 'Raja Hutchinson', 0, '75376 East French Southern Territories St.', 400, 'Zephania@ullamcorper.gov', '2020-08-26', 3),
  ( 'Jescie Daniel', 0, '30942  Samoa Blvd.', 56, 'Wade@urna.gov', '2020-08-27', 4),
  ( 'Savannah Vincent', 0, '86160 East Mequon Ct.', 526, 'Palmer@auctor.gov', '2020-08-28', 3),
  ( 'Bernard English', 0, '14811 East Bermuda Way', 916, 'Blythe@adipiscing.gov', '2020-08-22', 1),
  ( 'Zane Burke', 0, '52599 West Antigua and Barbuda Ln.', 267, 'Karly@euismod.gov', '2020-08-25', 1),
  ( 'Tyrone Colon', 0, '17606  Brockton Ct.', 188, 'Quyn@dapibus.edu', '2020-08-27', 1),
  ( 'Athena Rhodes', 0, '56974  Maldives St.', 179, 'Patience@Aliquam.org', '2020-08-27', 3),
  ( 'Finn Cooper', 0, '5285 East Mozambique Way', 381, 'Aileen@pulvinar.gov', '2020-08-26', 2),
  ( 'Xaviera Harmon', 0, '69802 East Bahamas Ct.', 693, 'Joseph@nisi.org', '2020-08-25', 1),
  ( 'Rosalyn Love', 0, '44841 East South Africa Blvd.', 854, 'Kyla@fermentum.com', '2020-08-27', 1),
  ( 'Arthur Hampton', 0, '60893 East Brunei Darussalam Ct.', 101, 'Susan@non.us', '2020-08-24', 4),
  ( 'Jessica Ross', 0, '41583 East Belgium Ave.', 248, 'Montana@Nullam.net', '2020-08-28', 1),
  ( 'Vielka Walsh', 0, '26402  Oneonta Blvd.', 600, 'Heather@volutpat.org', '2020-08-25', 4),
  ( 'Velma Ruiz', 0, '82173 South Boulder City Way', 798, 'Mona@inceptos.gov', '2020-08-28', 3),
  ( 'Reece Mcmahon', 0, '11349 West Jamaica Ln.', 710, 'Ulla@vestibulum.net', '2020-08-23', 1),
  ('Wendy Herrera', 0, '38921 East Japan Blvd.', 926, 'Kylie@tincidunt.net', '2020-08-22', 2),
  ('Omar Acosta', 0, '91218 North Bulgaria Ln.', 896, 'Janna@a.gov', '2020-08-26', 4),
  ('Tiger Leach', 0, '65784 West Charleston Blvd.', 973, 'Kristen@ligula.us', '2020-08-22', 4),
  ('Hall Ball', 0, '6957 East Blythe Ln.', 320, 'Yael@morbi.gov', '2020-08-24', 1),
  ('Blake Bridges', 0, '13222  Hungary Ln.', 408, 'Bethany@Curae.org', '2020-08-27', 3),
  ('Lavinia Jefferson', 0, '11328 West Baltimore Way', 82, 'Jenette@erat.org', '2020-08-24', 3),
  ('Kameko Potter', 0, '69546 South Turkmenistan Ln.', 864, 'Nero@consequat.us', '2020-08-22', 3),
  ('Francis Gallagher', 0, '83586 East Hartford Ct.', 710, 'Jakeem@vulputate.gov', '2020-08-25', 4),
  ('Kiara Hewitt', 0, '43339 East Congo Ln.', 825, 'Raya@ipsum.com', '2020-08-24', 3),
  ('Boris Mcknight', 0, '99407 South Bangladesh Ln.', 351, 'Camille@penatibus.net', '2020-08-28', 4),
  ('Amanda Acevedo', 0, '17299 East Bandera Blvd.', 637, 'Sharon@facilisis.net', '2020-08-28', 4),
  ('Carter Sims', 0, '85413 North Poland Ln.', 66, 'Tanisha@est.net', '2020-08-26', 3),
  ('Hammett Bates', 0, '26672  Boston Ave.', 235, 'Amanda@suscipit.net', '2020-08-23', 4),
  ('Brenda Butler', 0, '10622 East Alexandria Ln.', 94, 'Upton@eleifend.gov', '2020-08-22', 2),
  ('Yoshi Salas', 0, '91933 South Greece Blvd.', 760, 'Harding@primis.net', '2020-08-22', 2),
  ('Brian Dodson', 0, '6391 West Fountain Valley Ave.', 519, 'Kitra@sagittis.org', '2020-08-23', 3),
  ('Jonas Hodge', 0, '59475 West Chile Ct.', 604, 'Lavinia@egestas.com', '2020-08-28', 3),
  ('Sheila Orr', 0, '76593 West Guyana Ln.', 351, 'Karly@amet.net', '2020-08-28', 4),
  ('Abdul Decker', 0, '72120  Parker Ct.', 852, 'Jasmine@orci.us', '2020-08-25', 3),
  ('Hanna Villarreal', 0, '67993 South Tunisia Ln.', 901, 'Armando@varius.gov', '2020-08-26', 4),
  ('Tamara Blevins', 0, '32301 North Grenada Blvd.', 45, 'Arden@sagittis.com', '2020-08-23', 3),
  ('Martena Gibson', 0, '49143 South Cameroon Ln.', 914, 'Austin@ultrices.net', '2020-08-27', 4),
  ('Jemima Huber', 0, '4012 North Aruba Ct.', 566, 'Odysseus@Proin.edu', '2020-08-22', 2),
  ('Chelsea Scott', 0, '18023  Wallis and Futuna Ln.', 75, 'Yardley@Proin.org', '2020-08-27', 3),
  ('Regan Barnett', 0, '94243 West Calumet City Ct.', 740, 'Odette@neque.net', '2020-08-28', 2),
  ('Leo Trujillo', 0, '82995 East Fernley Way', 417, 'Martina@vel.us', '2020-08-22', 2),
  ('Cain Poole', 0, '82986 South Pitcairn Way', 190, 'Anastasia@Morbi.net', '2020-08-24', 2),
  ('Ariana Neal', 0, '48746 South Covina Ln.', 347, 'Xavier@libero.net', '2020-08-22', 3),
  ('Justin Stein', 0, '82491 South Faroe Islands St.', 691, 'Tamara@est.edu', '2020-08-23', 4),
  ('Alec Petersen', 0, '66620  British Indian Ocean Territory Ave.', 950, 'Carly@vehicula.gov', '2020-08-25', 4),
  ('Fallon Roberts', 0, '36724 South Japan Ln.', 308, 'Ulric@auctor.us', '2020-08-25', 3),
  ('Joel Carney', 0, '27306  Tajikistan Ave.', 304, 'Raja@mauris.com', '2020-08-23', 4),
  ('Burton Buckley', 0, '30041 South Botswana Ct.', 968, 'Keaton@vel.gov', '2020-08-24', 1),
  ('Britanney Strong', 0, '9747 East French Guiana Ave.', 835, 'Lois@litora.net', '2020-08-26', 2),
  ('Meghan Blair', 0, '22459 West Bouvet Island Blvd.', 685, 'Cade@Proin.org', '2020-08-22', 3),
  ('Keaton Barnett', 0, '53753 West Virgin Islands, British Ln.', 411, 'Slade@tellus.com', '2020-08-26', 1),
  ('Phyllis Saunders', 0, '78154 East Brooklyn Park Ave.', 126, 'Maisie@urna.net', '2020-08-23', 3),
  ('Tanek Ford', 0, '403 East Cocos (Keeling) Islands St.', 982, 'Carter@ultrices.gov', '2020-08-24', 2),
  ('Lester Melendez', 0, '58634 East Blythe Way', 839, 'Uma@morbi.gov', '2020-08-22', 1),
  ('Audra Strong', 0, '44225 West American Samoa Ave.', 483, 'Hall@Lorem.edu', '2020-08-26', 2),
  ('Heidi Gilliam', 0, '7564 West Hermitage St.', 361, 'Garrett@hymenaeos.us', '2020-08-22', 3),
  ('Anthony Adams', 0, '74423 North Flint Ave.', 100, 'Colton@laoreet.net', '2020-08-26', 4),
  ('Gage Lester', 0, '78782 South Bosnia and Herzegovina Blvd.', 650, 'Kennan@turpis.com', '2020-08-28', 4),
  ('Dexter Haley', 0, '60984 East Fairfield Ave.', 980, 'Britanni@auctor.us', '2020-08-23', 4),
  ('Chancellor Nichols', 0, '4433 North Passaic Ct.', 510, 'Susan@nascetur.net', '2020-08-23', 4),
  ('Carol Hahn', 0, '62280 North Nicaragua Ct.', 383, 'Merrill@ultricies.gov', '2020-08-26', 3),
  ('Luke Greene', 0, '66670 North Ardmore St.', 51, 'Warren@augue.org', '2020-08-27', 1),
  ('Ray Mcclure', 0, '12248 East Cocos (Keeling) Islands St.', 94, 'Jeanette@dis.org', '2020-08-25', 1),
  ('Aristotle Joseph', 0, '60521 West Costa Rica St.', 198, 'Amal@leo.org', '2020-08-26', 3),
  ('Zeus Walton', 0, '55834 North Frankfort Ln.', 77, 'Mary@parturient.com', '2020-08-23', 1),
  ('Dalton Christensen', 0, '1773 West Azerbaijan Way', 930, 'Amelia@Duis.net', '2020-08-28', 2),
  ('Colby Ortega', 0, '2633  Bhutan St.', 945, 'Simon@faucibus.com', '2020-08-24', 1),
  ('Holly Hodge', 0, '97781 South New Zealand Ln.', 311, 'Kelly@ridiculus.net', '2020-08-26', 1),
  ('Gage Whitaker', 0, '56833 East Christmas Island St.', 1, 'Alea@scelerisque.gov', '2020-08-24', 2),
  ('Trevor Kerr', 0, '45260 East Kahului Ave.', 603, 'Desirae@nonummy.edu', '2020-08-23', 3),
  ('Darius Langley', 0, '65403 North Great Falls Ave.', 170, 'Bevis@hymenaeos.com', '2020-08-27', 3),
  ('Desiree Simpson', 0, '34358 North Israel Way', 313, 'Zia@urna.com', '2020-08-27', 4),
  ('Dale Hurley', 0, '33923 East Croatia Ct.', 912, 'Lester@magnis.gov', '2020-08-25', 4),
  ('William Ballard', 0, '22145 North Canada Blvd.', 299, 'Jonas@lectus.us', '2020-08-28', 4),
  ('Arsenio French', 0, '60704  Comoros St.', 212, 'Dai@eros.us', '2020-08-23', 1),
  ('Shelby Spencer', 0, '61894 West Latvia Ct.', 614, 'Wang@vitae.net', '2020-08-22', 1),
  ('April Stokes', 0, '83704 East Bangladesh St.', 849, 'Joshua@per.com', '2020-08-26', 1),
  ('Macey Williams', 0, '47326 South Belgium Ct.', 898, 'Giacomo@varius.net', '2020-08-24', 2),
  ('Chiquita Herrera', 0, '12799 South Seychelles Way', 3, 'Sasha@commodo.net', '2020-08-25', 1),
  ('Ocean Weaver', 0, '3911  Fulton Ln.', 91, 'Ignatius@Quisque.org', '2020-08-25', 2),
  ('Magee Shannon', 0, '93195 North Taiwan, Province of China St.', 544, 'Emmanuel@Etiam.us', '2020-08-27', 4),
  ('Reese Terry', 0, '84297 West Lesotho Blvd.', 883, 'Ivy@pede.org', '2020-08-27', 4),
  ('Halee Farley', 0, '89037 North Turkmenistan Ct.', 49, 'Ryder@urna.us', '2020-08-27', 4),
  ('Brent Byers', 0, '86724  Angola Ln.', 287, 'April@dapibus.gov', '2020-08-27', 1),
  ('Daryl Hughes', 0, '95264  Boston Ave.', 35, 'Jena@rhoncus.gov', '2020-08-23', 4),
  ('Chadwick Valenzuela', 0, '33667 East Anguilla Ave.', 577, 'Elizabeth@dui.gov', '2020-08-24', 1),
  ('Kelsie Cleveland', 0, '21860  Chad Ln.', 736, 'Xander@orci.gov', '2020-08-27', 4),
  ('Victoria Leonard', 0, '88865 West Mauritania Ave.', 806, 'Palmer@augue.org', '2020-08-22', 4),
  ('Leigh White', 0, '19380 South Russian Federation Ave.', 769, 'Breanna@Lorem.gov', '2020-08-24', 1),
  ('Meredith Durham', 0, '49988 North Turks and Caicos Islands St.', 853, 'Benedict@inceptos.net', '2020-08-25', 1),
  ('Lareina Burke', 0, '13403 West Saint Kitts and Nevis Blvd.', 235, 'Tyrone@ad.edu', '2020-08-22', 1),
  ('Kibo Jackson', 0, '13344 East Spain Ave.', 336, 'Josephine@Nullam.net', '2020-08-28', 3),
  ('Tamekah Wilson', 0, '16398 West Kiribati Ave.', 211, 'Paloma@fermentum.org', '2020-08-27', 1),
  ('Chaim Sandoval', 0, '27263 West United States Minor Outlying Islands Ct.', 275, 'Ella@Proin.org', '2020-08-28', 1),
  ('Asher Maxwell', 0, '40968 North Afghanistan Ln.', 112, 'Valentine@dui.net', '2020-08-27', 1),
  ('Sheila Talley', 0, '2418 North Guyana Blvd.', 805, 'Marsden@est.org', '2020-08-25', 4),
  ('Darius Swanson', 0, '67111 West Klamath Falls Ct.', 421, 'Julian@hymenaeos.com', '2020-08-23', 4),
  ('Iola Norton', 0, '7059 North Chickasha St.', 30, 'Nell@dapibus.edu', '2020-08-28', 1),
  ('Ima Macdonald', 0, '77072 East Hawthorne Ln.', 92, 'Irene@Suspendisse.org', '2020-08-22', 4),
  ('James Diaz', 0, '51250 South Uruguay St.', 343, 'Nayda@fringilla.net', '2020-08-28', 4),
  ('Mufutau Sherman', 0, '9147 North Anaconda Way', 71, 'Joseph@Lorem.gov', '2020-08-23', 4),
  ('Quinlan Mckee', 0, '39717  Cayman Islands Ct.', 303, 'Hamish@consectetuer.edu', '2020-08-24', 1),
  ('Kane Stein', 0, '53089 East Central African Republic Ct.', 528, 'Imelda@Phasellus.org', '2020-08-24', 2),
  ('Aimee Frye', 0, '22429 North Malaysia Way', 615, 'Hedda@dapibus.org', '2020-08-24', 2),
  ('Leila Powell', 0, '19889 East Nenana Blvd.', 669, 'Tasha@Donec.edu', '2020-08-28', 1),
  ('Iola Riggs', 0, '26317 West United States Minor Outlying Islands St.', 667, 'Gemma@magna.com', '2020-08-27', 4),
  ('Maggy Mack', 0, '19331 South Colombia Ln.', 652, 'Burton@mus.net', '2020-08-24', 3),
  ('Martina Petersen', 0, '63439 South Cayman Islands Blvd.', 341, 'Harding@feugiat.us', '2020-08-22', 1),
  ('Elizabeth Campbell', 0, '5714 East Grafton Ct.', 75, 'Brett@libero.us', '2020-08-23', 1),
  ('Jerry Brennan', 0, '44024 East China Way', 26, 'Jakeem@sapien.us', '2020-08-24', 4),
  ('Alvin Mcclure', 0, '89151 North Albania Way', 921, 'Baker@eu.edu', '2020-08-28', 4),
  ('Cecilia Cash', 0, '63565 East Somalia St.', 677, 'Rae@sit.us', '2020-08-26', 2),
  ('Akeem Carroll', 0, '18807 West Gabon Ct.', 151, 'Joan@fringilla.gov', '2020-08-25', 4),
  ('Dennis Skinner', 0, '91701 South Cary Way', 274, 'Jenna@venenatis.us', '2020-08-27', 3),
  ('Nicholas Copeland', 0, '48484 North Jordan Blvd.', 39, 'Noelani@id.us', '2020-08-25', 4),
  ('Ava Rutledge', 0, '68395 South Pocatello Blvd.', 543, 'Myra@urna.net', '2020-08-22', 1),
  ('Kuame Coffey', 0, '12556 North Bahrain Blvd.', 783, 'Amanda@blandit.edu', '2020-08-25', 4),
  ('Xenos Kirby', 0, '30961 North Guinea Blvd.', 825, 'Kato@Class.edu', '2020-08-28', 1),
  ('Cooper Snider', 0, '66664 North Aruba St.', 453, 'Reed@ultricies.edu', '2020-08-26', 4),
  ('Skyler Franklin', 0, '22090 South Cayman Islands Ave.', 295, 'Uriel@porta.org', '2020-08-26', 3),
  ('Burke Bentley', 0, '4058  Burkina Faso Ln.', 179, 'Jillian@mattis.net', '2020-08-22', 3),
  ('Kiara Fleming', 0, '63111 North Germany Way', 173, 'Vance@neque.org', '2020-08-23', 2),
  ('Rhea Estes', 0, '32084  Dominican Republic Ln.', 456, 'Iona@Aenean.net', '2020-08-25', 1),
  ('Fay Jefferson', 0, '61442 South Bangladesh Blvd.', 914, 'Branden@senectus.edu', '2020-08-24', 3),
  ('Iola Preston', 0, '34872 East Blacksburg Ln.', 558, 'Maite@in.us', '2020-08-22', 2),
  ('Bree Dudley', 0, '79039 South Easton Blvd.', 596, 'Germaine@erat.org', '2020-08-24', 3),
  ('Reece Pickett', 0, '6339 East Guyana Ct.', 386, 'Flynn@neque.org', '2020-08-24', 2),
  ('Emma Ewing', 0, '56511 North Ardmore Way', 379, 'Debra@ante.org', '2020-08-24', 1),
  ('Duncan Burns', 0, '50813 South Malawi Ln.', 67, 'Wyoming@Maecenas.edu', '2020-08-25', 1),
  ('Eve Fulton', 0, '45204 South American Samoa Way', 254, 'Elizabeth@parturient.us', '2020-08-24', 1),
  ('Evan Vasquez', 0, '83443 South Branson Ct.', 21, 'Calista@montes.org', '2020-08-26', 4),
  ('Hadassah Gordon', 0, '5000  Catskill Way', 321, 'Alexis@Lorem.com', '2020-08-27', 1),
  ('Ryder Nelson', 0, '46577 South Belarus St.', 447, 'Brett@cubilia.org', '2020-08-23', 2),
  ('Tamekah Moss', 0, '47777  Burundi Ave.', 447, 'Hamish@amet.edu', '2020-08-24', 1),
  ('Avram Mcclure', 0, '14047 North Christmas Island St.', 649, 'Thor@cursus.us', '2020-08-27', 4),
  ('Branden Greer', 0, '63485 West French Southern Territories St.', 271, 'Iola@malesuada.com', '2020-08-25', 4),
  ('Hedley Santana', 0, '51749 East Congo Way', 822, 'Quamar@Pellentesque.org', '2020-08-24', 1),
  ('Pearl Banks', 0, '27506 East Kenya Way', 837, 'Linda@Nam.gov', '2020-08-24', 4),
  ('Brianna Garrison', 0, '3036 West Boulder City Ave.', 186, 'Carissa@imperdiet.net', '2020-08-28', 2),
  ('Rogan Murphy', 0, '27537 East Aberdeen Ct.', 797, 'Jin@nostra.edu', '2020-08-23', 1),
  ('Hammett Jones', 0, '16501  Denmark Ln.', 59, 'Jemima@condimentum.us', '2020-08-24', 3),
  ('Emmanuel Summers', 0, '50793 South Lithuania Ln.', 795, 'Rebecca@habitant.net', '2020-08-25', 1),
  ('Skyler Estrada', 0, '88144 North Suriname Ave.', 96, 'Coby@blandit.gov', '2020-08-23', 1),
  ('Paloma Slater', 0, '58893 North Comoros Blvd.', 725, 'Jayme@felis.net', '2020-08-25', 4),
  ('Hoyt Moreno', 0, '10615 West Costa Rica St.', 146, 'Raphael@malesuada.net', '2020-08-25', 4),
  ('Mason Walter', 0, '83560 West Trinidad and Tobago Ln.', 728, 'Miriam@taciti.edu', '2020-08-24', 2),
  ('Chanda Velez', 0, '14805 East Nauru Blvd.', 721, 'Zoe@ad.gov', '2020-08-23', 2),
  ('Palmer Mcdaniel', 0, '86939 South Central African Republic Blvd.', 368, 'Slade@sodales.gov', '2020-08-23', 4),
  ('Libby Simon', 0, '81898 East Cape Verde Ln.', 90, 'Olga@mauris.us', '2020-08-23', 4),
  ('Marshall Mueller', 0, '50854 South Colombia Ln.', 828, 'Madaline@Morbi.edu', '2020-08-24', 3),
  ('Jade Kennedy', 0, '44318 North Singapore Ln.', 151, 'Amery@pede.gov', '2020-08-26', 3),
  ('Hamish Sanchez', 0, '27942 West Togo Way', 402, 'Moses@consectetuer.com', '2020-08-22', 1),
  ('Arthur Woods', 0, '38786 East Bolivia St.', 868, 'Lars@tempus.edu', '2020-08-22', 2),
  ('Myles Tate', 0, '20215  Holy See (Vatican City State) St.', 926, 'Lynn@luctus.org', '2020-08-23', 2),
  ('Dahlia Morrison', 0, '593 East Jamaica Ct.', 851, 'Henry@lectus.gov', '2020-08-27', 3),
  ('Fatima Gay', 0, '34557 South Corry Way', 247, 'Hoyt@vulputate.us', '2020-08-22', 2),
  ('Alexander Mccoy', 0, '26395 East Edmond St.', 293, 'Otto@Nulla.org', '2020-08-25', 3),
  ('Sandra Freeman', 0, '89668  Lawrence Blvd.', 803, 'Suki@ultrices.net', '2020-08-23', 3),
  ('Patrick Talley', 0, '56448 South Algeria Ln.', 687, 'Chadwick@sagittis.edu', '2020-08-24', 1),
  ('Aiko Jimenez', 0, '86945  Bermuda Ct.', 853, 'Zachery@mus.us', '2020-08-25', 3),
  ('Laura Underwood', 0, '41285 West Helena Ln.', 74, 'Karly@Pellentesque.us', '2020-08-25', 2),
  ('Alexis Weeks', 0, '95951 East Mongolia Blvd.', 135, 'Britanni@senectus.edu', '2020-08-23', 3),
  ('Eliana Horne', 0, '21228  Cortland Ln.', 201, 'Candace@nunc.edu', '2020-08-22', 1),
  ('Phoebe Sloan', 0, '87707 East Puerto Rico Ct.', 602, 'Kyla@congue.com', '2020-08-24', 2),
  ('Colorado Evans', 0, '97619 West Pascagoula Way', 459, 'Celeste@nibh.com', '2020-08-25', 4),
  ('Len Wolfe', 0, '77655  Clovis Ct.', 341, 'Rhoda@orci.gov', '2020-08-24', 2),
  ('Catherine Wilson', 0, '69995 North Armenia Ave.', 620, 'Barbara@aptent.edu', '2020-08-26', 1),
  ('Keaton Pierce', 0, '53965 North Italy Ave.', 698, 'Irene@cursus.net', '2020-08-25', 4),
  ('Gil Bolton', 0, '9589 East Sri Lanka Ln.', 947, 'Tyrone@Proin.gov', '2020-08-24', 3),
  ('Melyssa Pennington', 0, '49036  Benin Ct.', 416, 'Kevin@ultricies.us', '2020-08-24', 2),
  ('Aladdin Barrett', 0, '9175  Deadwood Blvd.', 495, 'Addison@senectus.net', '2020-08-24', 4),
  ('Illiana Huber', 0, '41892 West American Samoa Way', 567, 'Ivory@dis.us', '2020-08-27', 1),
  ('Avram Hyde', 0, '35470 North Norway Ln.', 124, 'Colleen@Vivamus.us', '2020-08-27', 1),
  ('Ivy Bryan', 0, '17924 South Madagascar Way', 767, 'Caryn@nascetur.net', '2020-08-23', 1),
  ('Conan Hutchinson', 0, '13008 East Switzerland Blvd.', 522, 'Harriet@convallis.org', '2020-08-27', 4),
  ('Lacy Douglas', 0, '35817 North Belize Ave.', 967, 'Beau@per.com', '2020-08-24', 2),
  ('Shaeleigh Rose', 0, '76195 West Tanzania, United Republic of Way', 244, 'Emery@interdum.gov', '2020-08-25', 2),
  ('Randall Everett', 0, '39490 South Cayman Islands Ave.', 475, 'Beverly@pellentesque.net', '2020-08-23', 3),
  ('George Cantrell', 0, '85369 East Kyrgyzstan St.', 2, 'Petra@venenatis.edu', '2020-08-23', 4),
  ('Karyn Stark', 0, '76775 West Chesapeake Ln.', 632, 'Ethan@Nulla.us', '2020-08-26', 1),
  ('Imani Frazier', 0, '64610 North Bermuda Blvd.', 551, 'Venus@Nam.us', '2020-08-23', 2),
  ('Mark Haley', 0, '32686 East Argentina Ave.', 996, 'Christine@eget.net', '2020-08-26', 4),
  ('Uta Ferrell', 0, '65039 West South Georgia and The South Sandwich Islands Ave.', 766, 'Arthur@convallis.org', '2020-08-25', 4),
  ('Elmo Mcmillan', 0, '24589 East Slovenia Ave.', 829, 'Eagan@Donec.org', '2020-08-27', 1),
  ('Keegan Carpenter', 0, '80731 East Bhutan Ln.', 675, 'Angela@litora.org', '2020-08-27', 1),
  ('Hasad Fields', 0, '6629  Decatur St.', 521, 'Hunter@placerat.org', '2020-08-28', 1),
  ('Blaze Greene', 0, '52438 North Christiansted St.', 965, 'Tanner@sagittis.gov', '2020-08-26', 3),
  ('Selma Armstrong', 0, '85400 East Malaysia Ct.', 886, 'James@Cum.net', '2020-08-24', 3),
  ('Tad Graham', 0, '82361 South Kingsport Ave.', 281, 'Darryl@euismod.edu', '2020-08-24', 3),
  ('Hadley Goodwin', 0, '86933  Zambia Blvd.', 266, 'Chase@vitae.gov', '2020-08-27', 1),
  ('Leonard Whitehead', 0, '19449 North Barbados Blvd.', 802, 'Keane@Morbi.us', '2020-08-28', 3),
  ('Seth Johnston', 0, '23738 West Greece Way', 754, 'Hu@Donec.gov', '2020-08-22', 1),
  ('Daryl Lewis', 0, '12192 South French Guiana Ln.', 192, 'Kiayada@ultricies.gov', '2020-08-27', 3),
  ('Aidan Reid', 0, '28881 North Bangladesh Ct.', 893, 'Malachi@Nullam.org', '2020-08-26', 4),
  ('Madaline Robles', 0, '81036 South Belize Ave.', 803, 'Nero@montes.com', '2020-08-27', 1),
  ('Violet Graves', 0, '26633 West Fort Smith St.', 194, 'Kennan@sem.edu', '2020-08-24', 3),
  ('Phelan Maynard', 0, '50908 West Costa Rica Blvd.', 401, 'Arsenio@dictum.edu', '2020-08-25', 1),
  ('Nina Copeland', 0, '95929 North Appleton St.', 429, 'Noel@tellus.com', '2020-08-26', 2),
  ('Gareth Adams', 0, '68211 West Lebanon Way', 168, 'Ivan@Maecenas.net', '2020-08-26', 3),
  ('Jolie Nelson', 0, '49698 South Botswana Way', 315, 'Kyra@non.us', '2020-08-23', 2),
  ('Tatyana Dickson', 0, '71367  Oman Ct.', 591, 'Zenaida@elit.gov', '2020-08-22', 2),
  ('Macaulay Moody', 0, '969 South Costa Rica Blvd.', 162, 'Patience@hendrerit.com', '2020-08-28', 1),
  ('Abbot Daniel', 0, '91784 North Marshall Islands Way', 621, 'Justine@mattis.com', '2020-08-24', 3),
  ('Valentine Hudson', 0, '74545  Algeria St.', 625, 'Thane@nibh.edu', '2020-08-24', 4),
  ('Burton Cohen', 0, '85416 West Estonia Ave.', 993, 'Moana@rutrum.com', '2020-08-25', 2),
  ('Daryl Blanchard', 0, '9549 East Cayman Islands Ct.', 367, 'Susan@amet.us', '2020-08-28', 3),
  ('Price Kemp', 0, '27359  Burbank Ct.', 101, 'Ramona@mi.org', '2020-08-22', 2),
  ('Shay Hernandez', 0, '84771 West Azerbaijan St.', 229, 'Coby@commodo.net', '2020-08-23', 2),
  ('Curran Day', 0, '15211  Edmond Way', 31, 'Gregory@vitae.net', '2020-08-28', 3),
  ('Elton Blevins', 0, '29395 West Trinidad and Tobago Ln.', 152, 'Gay@in.org', '2020-08-23', 3),
  ('Madeline Fox', 0, '32514 East Somalia Way', 79, 'Clarke@convallis.org', '2020-08-23', 2),
  ('Maxwell Fitzgerald', 0, '57383 North Malta Way', 112, 'Vivien@nisl.us', '2020-08-26', 1),
  ('Zelda Compton', 0, '79126 East Fullerton St.', 73, 'Keelie@sodales.edu', '2020-08-26', 2),
  ('Rowan Cabrera', 0, '23165 North Miami Blvd.', 613, 'Raya@sociis.net', '2020-08-24', 1),
  ('Mannix Gross', 0, '32245 North Portugal Blvd.', 317, 'Neville@erat.net', '2020-08-24', 4),
  ('Zahir Reese', 0, '25748 West Fairbanks Blvd.', 664, 'Angela@mattis.org', '2020-08-22', 1),
  ('Lucas Carey', 0, '17511 South Eritrea Way', 904, 'Leila@magnis.org', '2020-08-24', 3),
  ('Marny Hutchinson', 0, '86943 West United Arab Emirates Way', 190, 'Mercedes@Quisque.gov', '2020-08-24', 1),
  ('Rigel Joseph', 0, '15244 North Cameroon Ln.', 970, 'Clark@commodo.gov', '2020-08-23', 3),
  ('Chanda Best', 0, '33106 East Djibouti Ave.', 380, 'Alexa@litora.com', '2020-08-25', 2),
  ('Shelby Collins', 0, '26392 West Cape Verde Ct.', 482, 'Naida@Maecenas.net', '2020-08-27', 1),
  ('Nerea Mercado', 0, '51298 East Germany Blvd.', 713, 'Elliott@Aliquam.net', '2020-08-23', 2),
  ('Whoopi Cross', 0, '95175 East Barbados Ln.', 452, 'Deirdre@sed.edu', '2020-08-25', 3),
  ('Lucas Maddox', 0, '79120 East Cook Islands Blvd.', 267, 'Preston@lacinia.net', '2020-08-22', 1),
  ('Mollie Grimes', 0, '85888 South Botswana Blvd.', 64, 'Kirsten@amet.gov', '2020-08-22', 3),
  ('Shay Mcmahon', 0, '55277 East Lawton Ave.', 171, 'Yetta@commodo.net', '2020-08-24', 3),
  ('India Bradford', 0, '63154  Antigua and Barbuda St.', 358, 'Leila@aliquet.us', '2020-08-26', 3),
  ('Regina Wall', 0, '90325 North New Caledonia Ct.', 113, 'Ruby@imperdiet.us', '2020-08-28', 1),
  ('Solomon Page', 0, '78276 East Saint Vincent and The Grenadines St.', 678, 'Ezra@mi.edu', '2020-08-23', 2),
  ('Shelley Gonzalez', 0, '50543 East Dominican Republic Ave.', 998, 'Tate@netus.gov', '2020-08-27', 3),
  ('Charlotte Harrell', 0, '99890 South Bouvet Island St.', 461, 'Courtney@hymenaeos.net', '2020-08-25', 4),
  ('Keiko Hanson', 0, '51313 North Highland Park Way', 27, 'Tyrone@porttitor.org', '2020-08-22', 3);

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `alumno`
  --

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `alumno`
  --

  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (1,'Ciudad de Guatemala','2017/09/28','F','Guatemalteco(a)',0.91,89.18,'Mormón','2020/01/24','O-','359-105-1434','Garrett Cantu','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (2,'Ciudad de Guatemala','2017/03/22','F','Guatemalteco(a)',0.86,25.51,'Católico','2020/03/5','O-','379-173-2160','Tallulah Edwards','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (3,'Ciudad de Guatemala','2017/04/19','M','Guatemalteco(a)',0.72,95.53,'Católico','2020/09/25','AB','079-627-0882','Marshall Stewart','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (4,'Ciudad de Guatemala','2017/04/30','M','Guatemalteco(a)',0.91,34.61,'Católico','2020/02/9','-','763-115-9902','Dara Roman','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (5,'Ciudad de Guatemala','2017/08/7','F','Guatemalteco(a)',0.93,60.27,'Mormón','2020/06/14','A-','987-754-1296','Tobias Lester','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (6,'Ciudad de Guatemala','2017/11/20','M','Guatemalteco(a)',0.85,81.50,'Ninguna','2020/08/21','A+','916-428-2572','Pearl Mendez','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (7,'Ciudad de Guatemala','2017/08/13','M','Guatemalteco(a)',0.90,3.87,'Evangélico','2020/07/11','O-','149-038-1595','Myra Cunningham','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (8,'Ciudad de Guatemala','2017/02/12','F','Guatemalteco(a)',0.71,1.95,'Mormón','2020/01/16','A-','996-464-3034','Shannon Stevens','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (9,'Ciudad de Guatemala','2017/11/29','M','Guatemalteco(a)',0.71,22.66,'Mormón','2020/07/5','O-','896-981-1708','Jordan Wall','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (10,'Ciudad de Guatemala','2017/08/26','M','Guatemalteco(a)',0.73,95.36,'Evangélico','2020/07/6','O+','870-187-6985','Martha Spence','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (11,'Ciudad de Guatemala','2017/05/17','M','Guatemalteco(a)',0.81,9.76,'Ninguna','2020/05/29','A-','175-923-6011','Paki Sears','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (12,'Ciudad de Guatemala','2017/06/10','F','Guatemalteco(a)',0.80,7.34,'Mormón','2020/10/1','A-','575-009-8494','Hamish Pollard','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (13,'Ciudad de Guatemala','2017/07/27','F','Guatemalteco(a)',0.84,85.35,'Católico','2020/02/13','-','228-841-4072','Griffin Sykes','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (14,'Ciudad de Guatemala','2017/06/28','F','Guatemalteco(a)',0.86,19.13,'Católico','2020/05/5','A-','660-126-1105','Malcolm Holt','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (15,'Ciudad de Guatemala','2017/06/5','M','Guatemalteco(a)',0.72,54.79,'Mormón','2020/03/28','O-','453-114-9638','Grace Herrera','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (16,'Ciudad de Guatemala','2017/08/29','F','Guatemalteco(a)',0.74,9.77,'Mormón','2020/07/2','-','500-897-9479','Carl Hickman','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (17,'Ciudad de Guatemala','2017/09/23','M','Guatemalteco(a)',0.79,65.73,'Ninguna','2020/02/7','A+','178-933-8086','Keely Oconnor','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (18,'Ciudad de Guatemala','2017/04/16','F','Guatemalteco(a)',0.90,59.94,'Evangélico','2020/07/2','A-','226-456-6831','Naomi Lee','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (19,'Ciudad de Guatemala','2017/11/4','M','Guatemalteco(a)',0.95,16.66,'Mormón','2020/03/18','-','315-811-8985','Jackson Graham','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (20,'Ciudad de Guatemala','2017/09/16','F','Guatemalteco(a)',0.79,64.24,'Católico','2020/05/7','-','878-424-9706','Debra Merrill','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (21,'Ciudad de Guatemala','2017/03/19','M','Guatemalteco(a)',0.82,55.12,'Evangélico','2020/08/4','O+','102-440-4471','Olivia Levine','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (22,'Ciudad de Guatemala','2017/12/6','F','Guatemalteco(a)',0.99,63.98,'Mormón','2020/07/5','O-','383-978-0569','Nevada Chen','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (23,'Ciudad de Guatemala','2017/08/31','F','Guatemalteco(a)',0.86,90.55,'Católico','2020/06/5','O-','238-358-2479','Blake Hart','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (24,'Ciudad de Guatemala','2017/02/13','F','Guatemalteco(a)',0.93,78.37,'Ninguna','2020/08/23','AB','821-578-8521','Brielle Delgado','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (25,'Ciudad de Guatemala','2017/10/22','F','Guatemalteco(a)',0.99,4.88,'Evangélico','2020/07/9','-','666-742-7056','Iola Newton','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (26,'Ciudad de Guatemala','2017/01/5','F','Guatemalteco(a)',0.89,86.15,'Católico','2020/02/28','O-','203-107-5083','Jada Murray','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (27,'Ciudad de Guatemala','2017/02/26','F','Guatemalteco(a)',0.85,74.65,'Mormón','2020/06/18','AB','366-986-0530','Eagan Becker','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (28,'Ciudad de Guatemala','2017/10/24','M','Guatemalteco(a)',0.75,53.47,'Ninguna','2020/01/15','O+','049-114-3059','Roth Hobbs','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (29,'Ciudad de Guatemala','2017/11/7','F','Guatemalteco(a)',0.75,80.04,'Mormón','2020/10/10','AB','281-984-4432','Zachery Reilly','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (30,'Ciudad de Guatemala','2017/07/29','F','Guatemalteco(a)',0.72,18.67,'Católico','2020/06/19','AB','288-541-1859','Kylan Dorsey','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (31,'Ciudad de Guatemala','20316/08/316','F','Guatemalteco(a)',31.04,58.317,'Ninguna','2020/04/6','O-','578-049-6384','Signe Hickman','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (32,'Ciudad de Guatemala','32016/10/17','F','Guatemalteco(a)',1.01,81.41,'Mormón','320320/01/326','AB','795-033-7469','Isabella Dickerson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (33,'Ciudad de Guatemala','2016/06/11','F','Guatemalteco(a)',1.08,42.16,'Ninguna','2020/01/16','AB','8633-719-9575','Colorado Conley','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (34,'Ciudad de Guatemala','2016/09/11','M','Guatemalteco(a)',1.06,10.16,'Mormón','2020/01/5','-','3429-2348-5392','Julian Pearson','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (35,'Ciudad de Guatemala','2016/06/11','F','Guatemalteco(a)',1.06,1.34,'Evangélico','2020/03/20','-','168-3580-35480','Britanney Guerrero','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (36,'Ciudad de Guatemala','20136/07/3','M','Guatemalteco(a)',1.036,90.42,'Ninguna','2020/02/11','O-','732-520-0759','Reece Browning','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (37,'Ciudad de Guatemala','2016/10/26','M','Guatemalteco(a)',1.02,44.35,'Ninguna','2020/01/1','O+','862-3763-9230','Clare Walters','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (38,'Ciudad de Guatemala','2016/06/10','M','Guatemalteco(a)',1.06,20.27,'Católico','2020/03/7','AB','114-159-21338','Illiana Miller','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (39,'Ciudad de Guatemala','2016/04/15','F','Guatemalteco(a)',1.01,36.539,'Ninguna','2020/08/8','A+','3967-564-3024','Alexander Cannon','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (40,'Ciudad de Guatemala','2016/07/23','F','Guatemalteco(a)',1.05,22.30,'Evangélico','2020/09/21','AB','963-564-8005','Jin Berg','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (41,'Ciudad de Guatemala','2016/41/30','M','Guatemalteco(a)',1.01,83.26,'Ninguna','2020/03/5','AB','432-853-5932','Molly Pitts','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (42,'Ciudad de Guatemala','2016/04/26','M','Guatemalteco(a)',1.06,56.75,'Mormón','2020/02/2','O-','034-178-3298','Driscoll Harrison','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (43,'Ciudad de Guatemala','2016/01/17','M','Guatemalteco(a)',1.06,86.47,'Mormón','2020/05/6','O+','423-661-4309','Brielle Guthrie','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (44,'Ciudad de Guatemala','2016/05/28','F','Guatemalteco(a)',1.08,67.91,'Evangélico','2020/09/2','AB','228-797-5452','Renee Chan','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (45,'Ciudad de Guatemala','2016/05/20','F','Guatemalteco(a)',1.02,8.53,'Ninguna','2020/07/25','A+','180-324-2306','Jana Strickland','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (46,'Ciudad de Guatemala','2046/12/20','M','Guatemalteco(a)',1.04,86.01,'Ninguna','2020/03/29','AB','467-962-8062','Petra Boone','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (47,'Ciudad de Guatemala','2016/05/18','M','Guatemalteco(a)',1.01,33.91,'Ninguna','2020/04/18','A+','472-297-2386','Drew Curtis','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (48,'Ciudad de Guatemala','2016/01/23','M','Guatemalteco(a)',1.05,47.62,'Evangélico','2020/05/30','A-','480-298-8167','Quemby Willis','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (49,'Ciudad de Guatemala','2016/05/6','M','Guatemalteco(a)',1.07,40.75,'Mormón','2020/04/4','A-','406-329-3226','Sebastian Dotson','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (50,'Ciudad de Guatemala','5016/11/15','M','Guatemalteco(a)',1.09,71.31,'Mormón','5050/07/2','A-','167-623-6904','Katelyn Arnold','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (51,'Ciudad de Guatemala','2016/03/2','F','Guatemalteco(a)',1.07,67.61,'Católico','2020/08/3','A-','200-148-8176','Irene Alvarado','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (52,'Ciudad de Guatemala','2016/07/25','M','Guatemalteco(a)',1.01,40.27,'Mormón','2020/03/7','A-','897-359-5845','Ramona Clements','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (53,'Ciudad de Guatemala','2016/02/13','M','Guatemalteco(a)',1.03,67.44,'Evangélico','2020/09/12','O+','871-356-7670','Ruby Joyner','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (54,'Ciudad de Guatemala','2016/02/26','F','Guatemalteco(a)',1.08,9.54,'Católico','2020/08/16','AB','931-106-8699','Lana French','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (55,'Ciudad de Guatemala','2016/12/16','F','Guatemalteco(a)',1.04,63.97,'Evangélico','2020/02/13','-','353-493-9301','Aretha Zamora','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (56,'Ciudad de Guatemala','2016/07/28','M','Guatemalteco(a)',1.05,27.61,'Católico','2020/07/29','O+','055-936-1429','Sarah Sweet','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (57,'Ciudad de Guatemala','2016/05/21','F','Guatemalteco(a)',1.09,90.63,'Mormón','2020/04/2','-','097-573-9039','Sasha Griffith','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (58,'Ciudad de Guatemala','2016/09/8','M','Guatemalteco(a)',1.00,35.06,'Católico','2020/03/23','AB','293-595-0120','Madeson Bishop','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (59,'Ciudad de Guatemala','2016/04/24','M','Guatemalteco(a)',1.06,30.00,'Ninguna','2020/02/11','O-','517-455-6699','Kyla Herrera','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (60,'Ciudad de Guatemala','2016/07/6','M','Guatemalteco(a)',1.02,88.31,'Evangélico','2020/07/9','O+','943-798-5894','Finn Shannon','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (61,'Ciudad de Guatemala','20615/08/619','F','Guatemalteco(a)',61.6161,54.85,'Evangélico','2020/06/618','A+','928-4619-4528','Amity Macdonald','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (62,'Ciudad de Guatemala','62015/04/9','F','Guatemalteco(a)',1.162,47.81,'Evangélico','620620/062/17','AB','070-883-7378','Clark Farrell','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (63,'Ciudad de Guatemala','2015/11/26','F','Guatemalteco(a)',1.11,40.90,'Ninguna','2020/07/9','-','989-495-2521','Callie Parsons','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (64,'Ciudad de Guatemala','2015/01/9','M','Guatemalteco(a)',1.12,99.67,'Mormón','2020/07/1','-','3640-1647-2873','Raphael Collier','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (65,'Ciudad de Guatemala','20165/06/22','F','Guatemalteco(a)',1.11,80.09,'Evangélico','2020/065/19','AB','787-0658-3480','Joan Jordan','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (66,'Ciudad de Guatemala','2015/04/30','M','Guatemalteco(a)',1.10,23.75,'Católico','2020/07/3','O+','3466-543-4098','Cally Hamilton','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (67,'Ciudad de Guatemala','2015/11/12','M','Guatemalteco(a)',1.10,676.83,'Mormón','2020/02/13','AB','939-36767-8294','Griffin Clayton','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (68,'Ciudad de Guatemala','2015/07/12','F','Guatemalteco(a)',1.12,40.54,'Católico','2020/10/68','A-','553-6879-0100','Beau Burris','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (69,'Ciudad de Guatemala','2015/069/169','M','Guatemalteco(a)',1.11,18.40,'Católico','2020/07/16','-','1695-565-69651','Steven Baird','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (70,'Ciudad de Guatemala','2015/06/11','F','Guatemalteco(a)',1.12,51.77,'Evangélico','2020/02/4','-','541-616-2036','Ruth Casey','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (71,'Ciudad de Guatemala','2015/07/2','F','Guatemalteco(a)',1.71,21.04,'Mormón','2020/05/15','A+','644-471-8833','Brock Duran','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (72,'Ciudad de Guatemala','2015/01/25','M','Guatemalteco(a)',1.11,45.08,'Católico','2020/03/13','AB','185-013-3501','Whilemina Daniels','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (73,'Ciudad de Guatemala','2015/04/4','M','Guatemalteco(a)',1.12,17.52,'Católico','2020/07/7','A-','698-816-5477','Howard Richard','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (74,'Ciudad de Guatemala','2015/08/28','M','Guatemalteco(a)',1.11,57.74,'Evangélico','2020/07/29','A+','740-208-1379','Hadassah Osborne','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (75,'Ciudad de Guatemala','2075/11/26','F','Guatemalteco(a)',1.10,77.62,'Mormón','2020/07/21','A-','967-324-0974','Wanda Potter','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (76,'Ciudad de Guatemala','2015/12/2','M','Guatemalteco(a)',1.11,14.42,'Católico','2020/01/6','O+','204-090-8337','Ayanna Whitaker','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (77,'Ciudad de Guatemala','2015/10/23','M','Guatemalteco(a)',1.11,67.74,'Ninguna','2020/09/6','AB','739-530-5742','Aline Britt','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (78,'Ciudad de Guatemala','2015/06/24','M','Guatemalteco(a)',1.10,25.63,'Evangélico','2020/08/30','O-','949-274-6513','Tanya Sykes','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (79,'Ciudad de Guatemala','2015/02/8','M','Guatemalteco(a)',1.10,10.35,'Ninguna','2020/04/7','A-','880-113-5107','Kiayada Dillon','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (80,'Ciudad de Guatemala','8015/02/9','M','Guatemalteco(a)',1.12,62.90,'Católico','8080/01/10','AB','780-288-3771','Abigail Harrell','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (81,'Ciudad de Guatemala','2015/11/22','M','Guatemalteco(a)',1.12,18.30,'Mormón','2020/05/18','O-','929-027-0445','Deirdre Vasquez','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (82,'Ciudad de Guatemala','2015/01/10','M','Guatemalteco(a)',1.12,75.35,'Ninguna','2020/09/18','A+','507-025-7047','Jason Velasquez','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (83,'Ciudad de Guatemala','2015/09/30','M','Guatemalteco(a)',1.11,55.99,'Católico','2020/07/20','O+','838-067-2848','Zelda Camacho','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (84,'Ciudad de Guatemala','2015/11/22','F','Guatemalteco(a)',1.11,49.12,'Católico','2020/03/11','A-','378-761-8405','Amethyst Deleon','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (85,'Ciudad de Guatemala','2015/09/7','F','Guatemalteco(a)',1.12,86.05,'Ninguna','2020/08/15','A-','541-314-1421','Bevis Collier','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (86,'Ciudad de Guatemala','2015/07/23','M','Guatemalteco(a)',1.10,72.17,'Mormón','2020/08/25','AB','028-962-8697','Clinton Mcfadden','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (87,'Ciudad de Guatemala','2015/09/30','F','Guatemalteco(a)',1.10,91.08,'Católico','2020/07/20','A-','191-220-5552','Indigo Cummings','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (88,'Ciudad de Guatemala','2015/10/18','F','Guatemalteco(a)',1.10,2.51,'Evangélico','2020/07/4','A-','913-162-7595','Alma Austin','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (89,'Ciudad de Guatemala','2015/12/9','F','Guatemalteco(a)',1.10,95.63,'Ninguna','2020/10/2','-','906-624-6513','Owen Dodson','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (90,'Ciudad de Guatemala','2015/07/16','M','Guatemalteco(a)',1.12,35.46,'Ninguna','2020/06/19','A-','908-534-5284','Hasad Weiss','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (91,'Ciudad de Guatemala','20914/091/30','F','Guatemalteco(a)',91.913,45.914,'Mormón','2020/08/29','O-','623-9190-7828','Leroy Everett','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (92,'Ciudad de Guatemala','92014/06/928','M','Guatemalteco(a)',1.192,94.36,'Evangélico','920920/06/8','A+','391-999-9144','Armando Bullock','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (93,'Ciudad de Guatemala','2014/04/17','F','Guatemalteco(a)',1.12,69.493,'Católico','2020/08/93','O-','051-9362-8742','Amery Olson','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (94,'Ciudad de Guatemala','20194/12/26','M','Guatemalteco(a)',1.12,82.76,'Mormón','2020/05/7','-','395-676-5533','Heidi Hudson','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (95,'Ciudad de Guatemala','2014/03/7','F','Guatemalteco(a)',1.13,30.87,'Católico','2020/06/16','O+','261-846-4917','Fatima Whitehead','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (96,'Ciudad de Guatemala','2014/03/30','M','Guatemalteco(a)',1.11,5.35,'Ninguna','2020/03/14','A-','758-4965-5799','Abel Villarreal','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (97,'Ciudad de Guatemala','2014/01/297','M','Guatemalteco(a)',1.11,970.29,'Evangélico','2020/09/18','O+','838-9897-8645','Melvin Barton','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (98,'Ciudad de Guatemala','2014/06/5','F','Guatemalteco(a)',1.12,94.14,'Evangélico','2020/07/20','O-','910-375-0497','Tarik Mclean','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (99,'Ciudad de Guatemala','2014/05/23','F','Guatemalteco(a)',1.12,48.04,'Evangélico','2020/07/16','O+','424-708-99465','Adria Valenzuela','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (100,'Ciudad de Guatemala','2014/100/26','F','Guatemalteco(a)',1.11,20.29,'Mormón','2020/06/20','A+','896-543-6498','Amena Holland','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (101,'Ciudad de Guatemala','2014/04/5','F','Guatemalteco(a)',1.12,0.84,'Católico','2020/01/1','O-','514-874-3624','Leigh Wilkinson','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (102,'Ciudad de Guatemala','2014/11/21','M','Guatemalteco(a)',1.11,17.31,'Mormón','2020/08/8','O+','948-811-4807','Amanda Rios','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (103,'Ciudad de Guatemala','2014/03/27','M','Guatemalteco(a)',1.103,62.83,'Evangélico','2020/04/12','AB','933-354-4500','Jesse Sears','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (104,'Ciudad de Guatemala','20104/05/27','M','Guatemalteco(a)',1.12,82.39,'Evangélico','2020/04/20','A+','318-886-3334','Kelsie Rodriquez','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (105,'Ciudad de Guatemala','2014/12/21','F','Guatemalteco(a)',1.12,8.40,'Evangélico','2020/03/1','O+','203-469-5130','Ifeoma King','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (106,'Ciudad de Guatemala','2014/01/8','M','Guatemalteco(a)',1.12,71.86,'Evangélico','2020/02/21','O-','669-297-1705','Kyle Sloan','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (107,'Ciudad de Guatemala','2014/11/3','F','Guatemalteco(a)',1.12,92.30,'Evangélico','2020/04/30','A-','814-727-2837','Tamekah Mueller','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (108,'Ciudad de Guatemala','2014/01/28','F','Guatemalteco(a)',1.12,33.00,'Católico','2020/06/3','AB','832-672-1993','Caryn Page','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (109,'Ciudad de Guatemala','2014/04/13','M','Guatemalteco(a)',1.11,42.92,'Mormón','2020/01/17','-','1099-958-4827','Orli Lowe','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (110,'Ciudad de Guatemala','11014/02/10','M','Guatemalteco(a)',1.12,32.25,'Ninguna','110110/09/30','A-','993-037-8472','Melyssa Russo','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (111,'Ciudad de Guatemala','2014/11/12','M','Guatemalteco(a)',1.12,91.67,'Ninguna','2020/07/27','-','756-714-1011','Ira Ingram','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (112,'Ciudad de Guatemala','2014/08/8','M','Guatemalteco(a)',1.13,88.49,'Ninguna','2020/03/19','A+','821-814-0196','Callum Dominguez','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (113,'Ciudad de Guatemala','2014/04/18','F','Guatemalteco(a)',1.12,68.19,'Ninguna','2020/04/6','A+','307-900-3588','Lois Cannon','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (114,'Ciudad de Guatemala','2014/11/21','F','Guatemalteco(a)',1.12,6.55,'Evangélico','2020/09/20','AB','185-492-7035','Mariam Hudson','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (115,'Ciudad de Guatemala','2014/06/17','M','Guatemalteco(a)',1.11,36.28,'Católico','2020/07/11','O+','293-976-7866','Ina Aguilar','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (116,'Ciudad de Guatemala','2014/05/5','F','Guatemalteco(a)',1.12,66.116,'Católico','2020/09/12','O-','814-646-21167','Latifah Doyle','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (117,'Ciudad de Guatemala','2014/10/15','F','Guatemalteco(a)',1.12,65.08,'Mormón','2020/03/29','A+','107-552-3536','Preston Roberson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (118,'Ciudad de Guatemala','2014/02/27','F','Guatemalteco(a)',1.13,41.86,'Mormón','2020/09/23','A+','319-223-0740','Basia Holden','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (119,'Ciudad de Guatemala','2014/07/12','F','Guatemalteco(a)',1.12,4.45,'Católico','2020/01/14','O-','1119-762-8743','Herrod Buck','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (120,'Ciudad de Guatemala','2014/01/16','M','Guatemalteco(a)',1.12,14.04,'Evangélico','2020/09/19','A-','180-451-6006','Hanae Lynch','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (121,'Ciudad de Guatemala','201213/06/20','M','Guatemalteco(a)',121.1212,20.78,'Evangélico','2020/03/1214','O+','946-923-4235','Alfonso Gray','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (122,'Ciudad de Guatemala','122013/08/19','M','Guatemalteco(a)',1.1122,3122.51,'Mormón','12201220/08/122122','A-','657-886-581227','Ross Holmes','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (123,'Ciudad de Guatemala','201123/05/2','M','Guatemalteco(a)',1.12,67.22,'Mormón','2020/05/17','A+','995-084-6691','Shelly Vargas','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (124,'Ciudad de Guatemala','2013/02/21','M','Guatemalteco(a)',1.11,1243.0124,'Católico','2020/05/8','-','393-178-6799','Fallon Williamson','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (125,'Ciudad de Guatemala','2013/01/9','F','Guatemalteco(a)',1.11,10.1251,'Evangélico','2020/07/3','O+','608-88125-4961','Camilla Horne','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (126,'Ciudad de Guatemala','2013/08/4','F','Guatemalteco(a)',1.12,41.22,'Evangélico','2020/03/22','A-','472-701-2931','Castor Dalton','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (127,'Ciudad de Guatemala','2013/06/23','M','Guatemalteco(a)',1.12,21.86,'Ninguna','2020/05/14','-','501-868-112715','Brianna Sellers','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (128,'Ciudad de Guatemala','2013/12/23','M','Guatemalteco(a)',1.12,25.7128,'Ninguna','2020/02/3','O-','51282-075-1772','Angelica Owen','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (129,'Ciudad de Guatemala','2013/08/17','M','Guatemalteco(a)',1.11,36.17,'Mormón','2020/05/15','O-','700-500-129336','Quintessa Blackburn','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (130,'Ciudad de Guatemala','2013/11/2','M','Guatemalteco(a)',1.12,29.81,'Mormón','2020/05/9','O+','066-099-6495','Martha Oneal','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (131,'Ciudad de Guatemala','2013/131/4','F','Guatemalteco(a)',1.12,41.74,'Evangélico','2020/08/22','A-','450-141-7265','Harriet Blackburn','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (132,'Ciudad de Guatemala','2013/01/1','M','Guatemalteco(a)',1.13,78.92,'Católico','2020/01/24','A+','172-036-9008','Burton Nielsen','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (133,'Ciudad de Guatemala','20133/11/20','M','Guatemalteco(a)',1.12,39.85,'Evangélico','2020/09/19','-','094-456-0914','Cheryl Lloyd','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (134,'Ciudad de Guatemala','2013/03/16','F','Guatemalteco(a)',1.12,69.61,'Católico','2020/02/134','-','209-252-8457','Aidan England','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (135,'Ciudad de Guatemala','2013/12/29','M','Guatemalteco(a)',1.11,67.01,'Evangélico','2020/08/9','AB','556-256-6374','Gareth Reeves','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (136,'Ciudad de Guatemala','2013/09/10','F','Guatemalteco(a)',1.12,5.36,'Católico','2020/06/12','O+','773-201-3189','Elizabeth Brewer','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (137,'Ciudad de Guatemala','2013/04/18','M','Guatemalteco(a)',1.12,62.51,'Ninguna','2020/04/10','-','079-934-2876','Catherine Barron','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (138,'Ciudad de Guatemala','2013/03/17','M','Guatemalteco(a)',1.11,12.29,'Mormón','2020/07/22','-','833-990-0277','Kylan Valentine','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (139,'Ciudad de Guatemala','2013/10/25','M','Guatemalteco(a)',1.12,64.79,'Evangélico','2020/03/28','AB','510-169-0298','Daquan Patrick','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (140,'Ciudad de Guatemala','14013/08/22','M','Guatemalteco(a)',1.12,76.77,'Católico','140140/06/27','O+','269-097-2996','Dorothy England','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (141,'Ciudad de Guatemala','2013/03/7','F','Guatemalteco(a)',1.13,38.14,'Ninguna','2020/02/22','O+','824-707-4907','Steel Fisher','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (142,'Ciudad de Guatemala','2013/08/18','F','Guatemalteco(a)',1.11,71.26,'Evangélico','2020/07/21','-','909-591-5663','Rashad Flores','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (143,'Ciudad de Guatemala','2013/02/1','F','Guatemalteco(a)',1.13,58.30,'Católico','2020/01/26','-','755-607-0926','India Parrish','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (144,'Ciudad de Guatemala','2013/06/144','F','Guatemalteco(a)',1.12,57.144,'Católico','2020/01/9','O+','520-958-3817','Christen Walton','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (145,'Ciudad de Guatemala','2013/03/30','M','Guatemalteco(a)',1.12,7.55,'Evangélico','2020/07/18','AB','809-329-3471','Stewart Hardy','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (146,'Ciudad de Guatemala','2013/08/1','M','Guatemalteco(a)',1.13,52.70,'Mormón','2020/06/29','O+','975-843-9208','Gavin Aguilar','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (147,'Ciudad de Guatemala','2013/02/14','M','Guatemalteco(a)',1.13,44.50,'Evangélico','2020/06/22','AB','401-829-5855','Dane Yang','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (148,'Ciudad de Guatemala','2013/08/15','M','Guatemalteco(a)',1.11,85.87,'Ninguna','2020/08/3','A-','029-817-3179','Lee Warren','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (149,'Ciudad de Guatemala','2013/05/15','M','Guatemalteco(a)',1.13,37.99,'Ninguna','2020/03/21','-','1492-782-8560','Otto Wade','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (150,'Ciudad de Guatemala','2013/07/150','F','Guatemalteco(a)',1.12,82.52,'Ninguna','2020/08/8','O-','148-1500-6591','Courtney Malone','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (151,'Ciudad de Guatemala','201512/07/23','M','Guatemalteco(a)',151.151151,74.8151,'Ninguna','2020/07/25','A-','15129-277-326151','Sierra Cain','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (152,'Ciudad de Guatemala','15201152/10/5','M','Guatemalteco(a)',1.11,43.1529,'Mormón','15201520/01/7','-','386-616-7406','Kamal Hendrix','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (153,'Ciudad de Guatemala','2012/0153/7','M','Guatemalteco(a)',1.1153,12.89,'Evangélico','2020/01/5','A+','099-81536-0576','Ria Griffin','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (154,'Ciudad de Guatemala','2012/11/30','M','Guatemalteco(a)',1.13,19.1548,'Evangélico','2020/08/2154','A+','303-154154154-1082','Yasir Vincent','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (155,'Ciudad de Guatemala','2012/0155/31','M','Guatemalteco(a)',1.13,31.7155,'Evangélico','2020/0155/19','A+','897-666-4906','Constance Curtis','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (156,'Ciudad de Guatemala','2012/08/14','M','Guatemalteco(a)',1.12,39.28,'Evangélico','2020/0156/10','O-','702-15619-971563','Dustin Buckley','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (157,'Ciudad de Guatemala','2012/11/6','F','Guatemalteco(a)',1.12,84.34,'Mormón','2020/06/14','AB','21576-406-6656','Destiny Lawson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (158,'Ciudad de Guatemala','2012/10/14','M','Guatemalteco(a)',1.12,31.158158,'Católico','2020/09/27','A+','61583-406-0209','Ursula England','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (159,'Ciudad de Guatemala','2012/10/27','M','Guatemalteco(a)',1.12,33.44,'Evangélico','2020/06/20','O-','064-15913-1064','Lana Haynes','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (160,'Ciudad de Guatemala','2012/03/19','F','Guatemalteco(a)',1.11,68.57,'Ninguna','2020/08/23','A+','737-969-9440','Alice Burns','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (161,'Ciudad de Guatemala','2012/09/27','M','Guatemalteco(a)',1.161,68.86,'Mormón','2020/08/16','O+','287-334-6603','Joshua Ryan','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (162,'Ciudad de Guatemala','20162/07/2','M','Guatemalteco(a)',1.13,16.86,'Mormón','2020/08/22','A-','142-653-8789','Ivy Roberts','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (163,'Ciudad de Guatemala','2012/04/21','M','Guatemalteco(a)',1.12,55.54,'Ninguna','2020/09/2','AB','744-935-8382','Otto Jefferson','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (164,'Ciudad de Guatemala','2012/04/26','F','Guatemalteco(a)',1.12,65.55,'Ninguna','2020/02/22','O-','362-632-8616','Simone Whitehead','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (165,'Ciudad de Guatemala','2012/08/8','F','Guatemalteco(a)',1.13,91.89,'Católico','2020/06/1','-','191-273-6849','Isadora Gay','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (166,'Ciudad de Guatemala','2012/01/18','F','Guatemalteco(a)',1.11,38.88,'Católico','2020/02/4','-','661-740-0723','Myra Velez','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (167,'Ciudad de Guatemala','2012/07/15','M','Guatemalteco(a)',1.11,94.89,'Mormón','2020/06/9','AB','335-278-7547','Michael Grant','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (168,'Ciudad de Guatemala','2012/04/29','F','Guatemalteco(a)',1.13,97.44,'Evangélico','2020/05/15','O+','739-304-8591','Fallon Salas','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (169,'Ciudad de Guatemala','2012/04/22','M','Guatemalteco(a)',1.11,59.66,'Mormón','2020/04/15','-','318-162-2652','Amity Wall','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (170,'Ciudad de Guatemala','17012/06/24','F','Guatemalteco(a)',1.13,27.66,'Evangélico','170170/02/7','A-','531-845-8314','Bernard Munoz','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (171,'Ciudad de Guatemala','2012/08/31','F','Guatemalteco(a)',1.12,56.19,'Evangélico','2020/10/2','O-','719-762-4342','Risa Juarez','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (172,'Ciudad de Guatemala','2012/04/8','M','Guatemalteco(a)',1.13,54.44,'Mormón','2020/01/27','A+','309-375-3632','Kyra Ellison','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (173,'Ciudad de Guatemala','2012/06/11','F','Guatemalteco(a)',1.11,94.37,'Ninguna','2020/06/24','O+','017-473-9506','Hayes Phillips','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (174,'Ciudad de Guatemala','2012/05/5','M','Guatemalteco(a)',1.12,27.66,'Ninguna','2020/10/2','A+','699-830-7075','Finn Pratt','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (175,'Ciudad de Guatemala','2012/07/3','F','Guatemalteco(a)',1.12,6.14,'Mormón','2020/08/24','A+','594-268-5883','Castor Marshall','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (176,'Ciudad de Guatemala','2012/02/176','M','Guatemalteco(a)',1.13,17.52,'Católico','2020/06/12','-','962-655-9391','Buckminster Mckinney','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (177,'Ciudad de Guatemala','2012/06/22','M','Guatemalteco(a)',1.12,61.11,'Ninguna','2020/04/15','O-','205-894-3265','Kessie Rodgers','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (178,'Ciudad de Guatemala','2012/06/22','M','Guatemalteco(a)',1.12,57.41,'Mormón','2020/09/178','O+','886-138-5929','Shannon Trevino','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (179,'Ciudad de Guatemala','2012/02/27','F','Guatemalteco(a)',1.12,72.63,'Evangélico','2020/02/26','-','802-990-1133','Reed Bean','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (180,'Ciudad de Guatemala','2012/12/16','M','Guatemalteco(a)',1.12,8.180,'Ninguna','2020/02/28','AB','251-344-5159','Tatum Duke','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (181,'Ciudad de Guatemala','20181181/1812/2181','F','Guatemalteco(a)',181.1813,1817.89,'Ninguna','2020/03/28','A-','52181-853-294181','Paki Shepherd','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (182,'Ciudad de Guatemala','182011/10/1820','F','Guatemalteco(a)',1.14,1.89,'Ninguna','18201820/03/10','O+','6182182-711-4180','Jonas Kinney','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (183,'Ciudad de Guatemala','2011/10/1','M','Guatemalteco(a)',1.15,1832.42,'Evangélico','2020/01/4','A+','150-159-147183','Mason Sears','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (184,'Ciudad de Guatemala','2011/11/7','F','Guatemalteco(a)',1.1184,1848.66,'Ninguna','2020/01/1184','-','01846-11846-2828','May Dejesus','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (185,'Ciudad de Guatemala','2011/11/16','M','Guatemalteco(a)',1.13,26.37,'Ninguna','2020/02/18','AB','18592-666-231856','Astra Shannon','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (186,'Ciudad de Guatemala','2011/03/30','M','Guatemalteco(a)',1.14,45.44,'Evangélico','2020/09/15','O-','21864-497-3398','Hammett Mclean','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (187,'Ciudad de Guatemala','2011/03/23','M','Guatemalteco(a)',1.15,91.09,'Católico','2020/05/1187','-','082-141-118758','Hillary Love','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (188,'Ciudad de Guatemala','2011/0188/9','F','Guatemalteco(a)',1.13,1188.74,'Mormón','2020/04/4','A-','447-939-6996','Nola Poole','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (189,'Ciudad de Guatemala','2011/11/8','F','Guatemalteco(a)',1.12,10.52,'Mormón','2020/07/17','-','077-172-1660','Cassady Lynn','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (190,'Ciudad de Guatemala','2011/07/25','M','Guatemalteco(a)',1.14,27.00,'Evangélico','2020/01/6','AB','229-477-1526','Byron Gregory','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (191,'Ciudad de Guatemala','20191/08/1','M','Guatemalteco(a)',1.13,36.21,'Católico','2020/08/18','AB','219-313-8425','Buckminster Santos','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (192,'Ciudad de Guatemala','2011/07/6','F','Guatemalteco(a)',1.13,11.22,'Católico','2020/06/24','A-','688-102-8815','Wayne Frye','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (193,'Ciudad de Guatemala','2011/12/28','M','Guatemalteco(a)',1.12,38.98,'Ninguna','2020/01/3','AB','070-395-3319','Owen Lancaster','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (194,'Ciudad de Guatemala','2011/11/18','F','Guatemalteco(a)',1.15,39.81,'Mormón','2020/04/28','AB','025-369-4816','Russell Becker','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (195,'Ciudad de Guatemala','2011/12/3','F','Guatemalteco(a)',1.13,1.51,'Católico','2020/04/24','O+','056-402-2845','Tatum Goodman','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (196,'Ciudad de Guatemala','2011/06/27','F','Guatemalteco(a)',1.15,36.34,'Mormón','2020/07/9','A+','194-552-9837','Justin Santiago','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (197,'Ciudad de Guatemala','2011/07/6','M','Guatemalteco(a)',1.12,39.14,'Mormón','2020/01/4','-','489-815-1369','Galena Barker','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (198,'Ciudad de Guatemala','2011/06/8','M','Guatemalteco(a)',1.14,93.38,'Mormón','2020/02/22','-','390-304-2355','Lewis Graham','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (199,'Ciudad de Guatemala','2011/10/26','M','Guatemalteco(a)',1.15,3.59,'Ninguna','2020/09/4','AB','422-1990-2621','Rahim Little','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (200,'Ciudad de Guatemala','20011/04/7','M','Guatemalteco(a)',1.14,87.49,'Mormón','200200/02/5','AB','812-552-4396','Uriel Ferguson','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (201,'Ciudad de Guatemala','2011/11/25','M','Guatemalteco(a)',1.13,56.39,'Católico','2020/08/10','AB','237-491-0578','Ross Buckner','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (202,'Ciudad de Guatemala','2011/11/1','F','Guatemalteco(a)',1.15,57.69,'Católico','2020/08/5','A-','107-532-7469','Wade Gutierrez','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (203,'Ciudad de Guatemala','2011/06/13','M','Guatemalteco(a)',1.12,50.88,'Mormón','2020/04/11','AB','388-173-5474','Raphael Pugh','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (204,'Ciudad de Guatemala','2011/10/13','F','Guatemalteco(a)',1.13,92.90,'Ninguna','2020/06/21','-','426-553-6385','Luke Guzman','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (205,'Ciudad de Guatemala','2011/06/20','M','Guatemalteco(a)',1.15,36.80,'Mormón','2020/09/2','AB','180-118-9510','Constance Coleman','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (206,'Ciudad de Guatemala','2011/04/3','F','Guatemalteco(a)',1.13,39.81,'Ninguna','2020/04/4','-','366-795-3987','Clio Mcintyre','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (207,'Ciudad de Guatemala','2011/02/17','M','Guatemalteco(a)',1.13,84.31,'Evangélico','2020/07/28','O+','260-412-3674','Levi Cox','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (208,'Ciudad de Guatemala','2011/06/16','F','Guatemalteco(a)',1.15,33.46,'Católico','2020/10/14','O+','399-546-20842','Emerson Acosta','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (209,'Ciudad de Guatemala','2011/09/26','F','Guatemalteco(a)',1.13,1.23,'Ninguna','2020/06/19','O-','707-602-6934','Donna Leon','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (210,'Ciudad de Guatemala','2011/01/6','F','Guatemalteco(a)',1.13,91.27,'Evangélico','2020/05/28','A-','901-710-0475','Steel Thompson','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (211,'Ciudad de Guatemala','2009/2112/22','M','Guatemalteco(a)',211.2114,5.89,'Ninguna','2020/2110/211211','AB','32112-093-5403','Remedios Elliott','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (212,'Ciudad de Guatemala','212009/1212/2124','F','Guatemalteco(a)',1.15,31.00,'Mormón','21202120/03/4','AB','21243-111-1567','Jillian Frye','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (213,'Ciudad de Guatemala','2009/05/2','M','Guatemalteco(a)',1.15,47.05,'Evangélico','2020/08/20','AB','945-615-421364','Jamal Blackwell','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (214,'Ciudad de Guatemala','2009/07/8','M','Guatemalteco(a)',1.15,98.91,'Mormón','2020/07/20','O+','271-783-3866','Sheila Sharpe','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (215,'Ciudad de Guatemala','2009/06/215','M','Guatemalteco(a)',1.1215,28.87,'Ninguna','2020/0215/21','AB','271-42150-2291','Ulysses Lindsey','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (216,'Ciudad de Guatemala','2009/11/22','M','Guatemalteco(a)',1.1216,3216.43,'Católico','2020/02/24','-','351-087-221624','Bernard Watkins','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (217,'Ciudad de Guatemala','2009/01/31','F','Guatemalteco(a)',1.15,16.1217,'Católico','2020/01/10','A+','340-622-9996','Miranda Dunn','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (218,'Ciudad de Guatemala','2009/01/7','F','Guatemalteco(a)',1.15,7218.97,'Mormón','2020/09/24','O-','040-759-136218','Odysseus Nguyen','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (219,'Ciudad de Guatemala','200219/06/10','M','Guatemalteco(a)',1.15,53.48,'Mormón','2020/04/219','O-','21938-41219-8627','Dylan Potter','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (220,'Ciudad de Guatemala','2009/05/31','M','Guatemalteco(a)',1.15,28.27,'Evangélico','2020/09/16','O-','348-349-5523','Harrison Collins','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (221,'Ciudad de Guatemala','2009/06/2','F','Guatemalteco(a)',1.15,98.02,'Evangélico','2020/02/23','O-','619-012-22176','Damon Solis','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (222,'Ciudad de Guatemala','2009/222/18','F','Guatemalteco(a)',1.15,19.61,'Ninguna','2020/08/21','AB','104-535-9624','Yoshi Hansen','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (223,'Ciudad de Guatemala','2009/05/30','M','Guatemalteco(a)',1.16,89.83,'Católico','2020/01/8','O+','308-184-8810','Elliott Floyd','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (224,'Ciudad de Guatemala','2009/07/16','M','Guatemalteco(a)',1.15,69.94,'Mormón','2020/09/30','-','892-242-1352','Omar Johnson','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (225,'Ciudad de Guatemala','2009/08/7','F','Guatemalteco(a)',1.225,94.46,'Ninguna','2020/06/26','O+','614-653-8266','Tyrone Woodard','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (226,'Ciudad de Guatemala','2009/12/11','F','Guatemalteco(a)',1.226,81.09,'Ninguna','2020/06/18','A+','762-133-9525','Zorita Mcgowan','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (227,'Ciudad de Guatemala','2009/07/26','F','Guatemalteco(a)',1.15,22.92,'Católico','2020/07/9','O+','872-580-7878','Isabelle Reeves','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (228,'Ciudad de Guatemala','2009/07/21','M','Guatemalteco(a)',1.14,228.09,'Ninguna','2020/06/26','O-','367-289-5530','Jolene Erickson','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (229,'Ciudad de Guatemala','2009/12/15','F','Guatemalteco(a)',1.16,57.96,'Evangélico','2020/06/21','O+','581-998-3273','Fletcher Hoover','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (230,'Ciudad de Guatemala','23009/07/9','M','Guatemalteco(a)',1.15,14.41,'Evangélico','230230/08/21','A-','970-561-8412','Risa Hutchinson','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (231,'Ciudad de Guatemala','2009/03/13','M','Guatemalteco(a)',1.14,99.91,'Mormón','2020/02/6','O+','940-150-5170','Mira Cummings','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (232,'Ciudad de Guatemala','2009/01/11','M','Guatemalteco(a)',1.16,45.03,'Mormón','2020/08/5','A-','2322-061-1463','Hashim Doyle','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (233,'Ciudad de Guatemala','2009/07/6','F','Guatemalteco(a)',1.15,82.22,'Ninguna','2020/09/1','A-','411-837-3148','Xandra Johns','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (234,'Ciudad de Guatemala','2009/05/26','F','Guatemalteco(a)',1.16,45.76,'Evangélico','2020/09/6','O-','970-221-3176','Giselle Campbell','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (235,'Ciudad de Guatemala','2009/07/18','M','Guatemalteco(a)',1.15,66.62,'Ninguna','2020/06/16','AB','928-021-3065','Oscar Erickson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (236,'Ciudad de Guatemala','2009/05/27','M','Guatemalteco(a)',1.16,97.78,'Evangélico','2020/06/17','A-','828-228-7290','Vincent Carver','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (237,'Ciudad de Guatemala','2009/08/12','F','Guatemalteco(a)',1.16,77.22,'Evangélico','2020/05/2','A+','676-529-7977','Gray Compton','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (238,'Ciudad de Guatemala','2009/07/18','M','Guatemalteco(a)',1.15,77.46,'Ninguna','2020/04/26','O-','351-059-0849','Indigo Webster','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (239,'Ciudad de Guatemala','2009/09/14','F','Guatemalteco(a)',1.15,92.45,'Evangélico','2020/10/3','-','852-867-7611','Asher Sosa','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (240,'Ciudad de Guatemala','2009/12/12','F','Guatemalteco(a)',1.16,60.06,'Mormón','2020/01/21','A-','807-588-8780','Guy Palmer','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (241,'Ciudad de Guatemala','2008/2412/241241','M','Guatemalteco(a)',241.2415,24103.68,'Evangélico','2020/08/2417','O-','479-449-234241','Alfreda Dyer','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (242,'Ciudad de Guatemala','242008/11/10','F','Guatemalteco(a)',1.16,88.00,'Católico','24202420/06/18','A-','046-969-9039','Kamal Lamb','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (243,'Ciudad de Guatemala','2008/10/6','M','Guatemalteco(a)',1.15,108.27,'Ninguna','2020/09/18','AB','858-789-243190','Eleanor Fulton','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (244,'Ciudad de Guatemala','2008/06/13','M','Guatemalteco(a)',1.16,108.2244,'Evangélico','2020/03/22','-','24402-11244-6518','Bruno Oconnor','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (245,'Ciudad de Guatemala','2008/01/18','M','Guatemalteco(a)',1.16,98.91,'Mormón','2020/08/23','O+','770-8245245-1381','Fredericka Wallace','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (246,'Ciudad de Guatemala','2008/08/246','F','Guatemalteco(a)',1.18,87.83,'Mormón','2020/05/2246','-','517-92468-0437','Virginia Torres','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (247,'Ciudad de Guatemala','2008/0247/2247','M','Guatemalteco(a)',1.16,88.30,'Mormón','2020/09/12','A+','093-12470-0623','Amy Kane','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (248,'Ciudad de Guatemala','200248/12/23','M','Guatemalteco(a)',1.16,104.99,'Católico','2020/0248/19','AB','567-72487-6465','Jeremy Harrell','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (249,'Ciudad de Guatemala','2008/04/6','F','Guatemalteco(a)',1.15,2493.15,'Mormón','2020/04/28','O-','532-222-249017','Ryder Holmes','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (250,'Ciudad de Guatemala','2008/01/28','M','Guatemalteco(a)',1.17,2505.13,'Ninguna','2020/06/12','AB','2507-830-5278','Montana Shields','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (251,'Ciudad de Guatemala','2008/02/26','F','Guatemalteco(a)',1.16,108.24,'Mormón','2020/08/16','O-','250-297-5255','Rosalyn Serrano','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (252,'Ciudad de Guatemala','2008/252/21','M','Guatemalteco(a)',1.16,90.42,'Católico','2020/07/21','AB','780-319-4004','Rhiannon Duke','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (253,'Ciudad de Guatemala','2008/04/2','M','Guatemalteco(a)',1.17,94.33,'Católico','2020/01/3','O+','965-111-3094','Madonna Green','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (254,'Ciudad de Guatemala','2008/04/8','M','Guatemalteco(a)',1.18,108.72,'Católico','2020/05/10','-','153-324-5059','Melinda Conley','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (255,'Ciudad de Guatemala','2008/09/13','F','Guatemalteco(a)',1.16,85.24,'Evangélico','2020/02/3','AB','868-824-9684','Brenden Buchanan','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (256,'Ciudad de Guatemala','2008/08/13','F','Guatemalteco(a)',1.17,90.86,'Ninguna','2020/04/20','-','036-560-6362','Remedios Maynard','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (257,'Ciudad de Guatemala','2008/01/13','M','Guatemalteco(a)',1.18,100.08,'Mormón','2020/04/4','-','726-275-0664','Beverly Conner','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (258,'Ciudad de Guatemala','2008/08/13','F','Guatemalteco(a)',1.16,105.41,'Ninguna','2020/07/22','-','685-504-5254','Henry Casey','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (259,'Ciudad de Guatemala','2008/08/14','F','Guatemalteco(a)',1.16,108.89,'Evangélico','2020/07/10','O-','572-769-7351','Zeus Cross','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (260,'Ciudad de Guatemala','26008/12/9','M','Guatemalteco(a)',1.16,87.85,'Evangélico','260260/06/28','A+','494-361-5735','Carissa Nielsen','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (261,'Ciudad de Guatemala','2008/06/5','F','Guatemalteco(a)',1.17,98.17,'Mormón','2020/05/29','O+','829-358-2318','Tashya Hendricks','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (262,'Ciudad de Guatemala','2008/11/9','F','Guatemalteco(a)',1.18,88.11,'Mormón','2020/03/11','-','559-139-0774','Oscar Sims','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (263,'Ciudad de Guatemala','2008/06/3','M','Guatemalteco(a)',1.18,83.87,'Ninguna','2020/04/11','A+','374-430-2515','Hu Hewitt','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (264,'Ciudad de Guatemala','2008/11/30','M','Guatemalteco(a)',1.17,90.86,'Evangélico','2020/05/26','A+','2643-330-7513','Hilel Mendez','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (265,'Ciudad de Guatemala','2008/10/10','M','Guatemalteco(a)',1.17,106.28,'Ninguna','2020/04/21','-','031-019-7422','Quinn Russo','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (266,'Ciudad de Guatemala','2008/12/16','F','Guatemalteco(a)',1.17,100.77,'Mormón','2020/01/4','A+','787-543-0455','Alana Berry','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (267,'Ciudad de Guatemala','2008/05/14','M','Guatemalteco(a)',1.16,109.80,'Ninguna','2020/02/5','A+','119-969-5902','Erich Miller','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (268,'Ciudad de Guatemala','2008/10/24','M','Guatemalteco(a)',1.17,81.83,'Ninguna','2020/01/6','-','794-830-2553','Karly Frost','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (269,'Ciudad de Guatemala','2008/05/18','M','Guatemalteco(a)',1.18,104.46,'Mormón','2020/10/9','-','940-742-3843','Oprah Riddle','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (270,'Ciudad de Guatemala','2008/08/5','F','Guatemalteco(a)',1.15,95.89,'Mormón','2020/09/8','O+','387-088-4083','Lucas Oneill','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (271,'Ciudad de Guatemala','2007/2712/271271','M','Guatemalteco(a)',271.2719,93.82,'Católico','2020/2710/2712','A-','2712719-732-227170','Rose Wooten','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (272,'Ciudad de Guatemala','272007/0272/13','M','Guatemalteco(a)',1.19,100.93,'Ninguna','27202720/08/5','AB','460-34272-9975','Lacey Whitfield','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (273,'Ciudad de Guatemala','2007/05/12','M','Guatemalteco(a)',1.20,111.55,'Católico','2020/10/10','O-','402-766-7688','Uriel Gardner','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (274,'Ciudad de Guatemala','2007/12/274','M','Guatemalteco(a)',1.19,98.77,'Mormón','2020/09/17','AB','92747-652-9826','Malcolm Olson','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (275,'Ciudad de Guatemala','2007/07/11','M','Guatemalteco(a)',1.20,96.03,'Católico','2020/01/13','-','2752750-468-275894','Cody Cummings','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (276,'Ciudad de Guatemala','2007/09/15','F','Guatemalteco(a)',1.19,10276.88,'Católico','2020/08/22','O-','345-057-52764276','Harper Rosa','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (277,'Ciudad de Guatemala','200277/11/20','M','Guatemalteco(a)',1.19,92.63,'Ninguna','2020/09/9','O-','990-939-6549','Deirdre Rodgers','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (278,'Ciudad de Guatemala','2007/03/6','F','Guatemalteco(a)',1.20,107.2278,'Católico','2020/04/17','-','362-001-961278','Kenneth Bray','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (279,'Ciudad de Guatemala','2007/02/10','F','Guatemalteco(a)',1.1279,2793.82,'Católico','2020/0279/4','O+','684-556-4051','Dominique White','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (280,'Ciudad de Guatemala','2007/04/17','M','Guatemalteco(a)',1.19,2800.86,'Mormón','2020/08/30','A+','562-148-8047','Wing Carrillo','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (281,'Ciudad de Guatemala','2007/12/10','F','Guatemalteco(a)',1.19,2812.33,'Evangélico','2020/02/23','O-','237-601-8704','Kareem Parks','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (282,'Ciudad de Guatemala','2007/08/22','F','Guatemalteco(a)',1.20,114.23,'Católico','2020/01/2','O+','264-740-1624','Carlos Mcknight','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (283,'Ciudad de Guatemala','2007/09/1','F','Guatemalteco(a)',1.20,104.11,'Ninguna','2020/06/29','-','758-943-4468','Ray Jimenez','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (284,'Ciudad de Guatemala','2007/05/15','M','Guatemalteco(a)',1.19,92.47,'Católico','2020/08/17','O-','954-209-9307','Deborah Hampton','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (285,'Ciudad de Guatemala','2007/09/28','M','Guatemalteco(a)',1.19,99.81,'Ninguna','2020/02/7','-','260-857-6422','Hyatt Dotson','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (286,'Ciudad de Guatemala','2007/01/3','F','Guatemalteco(a)',1.19,105.72,'Católico','2020/02/29','O+','719-265-0065','Octavius Underwood','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (287,'Ciudad de Guatemala','2007/03/9','M','Guatemalteco(a)',1.20,104.33,'Católico','2020/07/15','-','578-770-7293','Heidi Solomon','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (288,'Ciudad de Guatemala','2007/06/28','M','Guatemalteco(a)',1.288,106.82,'Mormón','2020/04/15','O-','265-2883-3505','Ray Dunlap','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (289,'Ciudad de Guatemala','2007/06/16','M','Guatemalteco(a)',1.20,92.09,'Ninguna','2020/09/289','A+','888-259-4032','Clio Nolan','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (290,'Ciudad de Guatemala','29007/10/19','M','Guatemalteco(a)',1.19,96.60,'Ninguna','290290/03/4','-','802-678-0270','Murphy Ashley','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (291,'Ciudad de Guatemala','2007/06/23','F','Guatemalteco(a)',1.20,104.43,'Católico','2020/01/23','O-','509-410-5368','Abbot Hahn','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (292,'Ciudad de Guatemala','2007/06/6','F','Guatemalteco(a)',1.19,92.60,'Católico','2020/10/13','-','004-320-7850','Eugenia Leach','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (293,'Ciudad de Guatemala','2007/01/22','M','Guatemalteco(a)',1.20,102.76,'Evangélico','2020/03/30','A+','126-944-9062','Ima Cooke','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (294,'Ciudad de Guatemala','2007/02/7','F','Guatemalteco(a)',1.18,100.38,'Evangélico','2020/06/294','-','489-722-2184','Barry Whitley','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (295,'Ciudad de Guatemala','2007/07/13','F','Guatemalteco(a)',1.19,91.36,'Evangélico','2020/03/9','A-','155-172-7516','Hilda Franklin','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (296,'Ciudad de Guatemala','2007/10/21','F','Guatemalteco(a)',1.20,102.89,'Mormón','2020/01/10','AB','352-567-7965','Naida Hewitt','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (297,'Ciudad de Guatemala','2007/01/30','M','Guatemalteco(a)',1.19,101.51,'Ninguna','2020/05/22','-','440-573-0748','Gwendolyn Kirkland','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (298,'Ciudad de Guatemala','2007/03/16','F','Guatemalteco(a)',1.19,106.25,'Mormón','2020/06/2','-','055-298-6678','Aladdin Johns','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (299,'Ciudad de Guatemala','2007/11/9','M','Guatemalteco(a)',1.19,99.82,'Evangélico','2020/09/20','A+','391-060-1510','Tallulah Mccall','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (300,'Ciudad de Guatemala','2007/07/1','F','Guatemalteco(a)',1.20,112.11,'Católico','2020/10/5','A-','352-487-1975','Gemma Fischer','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (301,'Ciudad de Guatemala','2006/3010/3015','M','Guatemalteco(a)',301.2301,30100.2301,'Evangélico','2020/08/3018','A-','03018-23017-2259','Clementine Harrell','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (302,'Ciudad de Guatemala','302006/01/1','F','Guatemalteco(a)',1.3023,110.75,'Evangélico','30203020/07/3','O+','697-441-3579','Jordan Valencia','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (303,'Ciudad de Guatemala','2006/08/25','M','Guatemalteco(a)',1.25,92.92,'Católico','2020/07/5','AB','204-879-493035','Len Juarez','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (304,'Ciudad de Guatemala','2006/02/19','F','Guatemalteco(a)',1.25,93.63,'Evangélico','2020/07/27','O-','211-212-833040','Kyle Roth','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (305,'Ciudad de Guatemala','2006/03/24','F','Guatemalteco(a)',1.22,99.24,'Mormón','2020/02/2305','O-','042-821-3918','Lionel Whitley','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (306,'Ciudad de Guatemala','200306/10/30','M','Guatemalteco(a)',1.21,10306.3060,'Mormón','2020/08/30','O+','734-804-445306','Mufutau Hunt','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (307,'Ciudad de Guatemala','2006/01/2','M','Guatemalteco(a)',1.21,114.62,'Mormón','2020/03/10','-','30723-631-1521','Tanya Lopez','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (308,'Ciudad de Guatemala','2006/09/16','M','Guatemalteco(a)',1.21,9308.36,'Ninguna','2020/06/16','O+','616-960-308064','Howard Meyer','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (309,'Ciudad de Guatemala','2006/12/30','M','Guatemalteco(a)',1.24,106.38,'Católico','2020/0309/13','O+','573-83095-453090','Michelle Kent','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (310,'Ciudad de Guatemala','2006/04/24','F','Guatemalteco(a)',1.23,99.44,'Ninguna','2020/01/17','AB','225-562-4659','Chelsea Prince','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (311,'Ciudad de Guatemala','2006/01/29','F','Guatemalteco(a)',1.21,3112.89,'Mormón','2020/06/27','AB','683-893-4253','Evelyn Mendoza','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (312,'Ciudad de Guatemala','2006/07/1','F','Guatemalteco(a)',1.22,102.18,'Mormón','2020/04/11','AB','281-847-1742','Anika Hudson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (313,'Ciudad de Guatemala','2006/02/11','M','Guatemalteco(a)',1.21,100.48,'Católico','2020/10/11','A-','929-685-0410','Stewart Duncan','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (314,'Ciudad de Guatemala','2006/06/25','F','Guatemalteco(a)',1.22,95.01,'Católico','2020/02/8','-','751-546-6522','Drake King','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (315,'Ciudad de Guatemala','2006/06/18','M','Guatemalteco(a)',1.24,97.28,'Evangélico','2020/05/20','O-','429-530-0264','April Bray','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (316,'Ciudad de Guatemala','2006/02/18','M','Guatemalteco(a)',1.23,94.01,'Mormón','2020/01/31','AB','365-283-7304','Halee Meyers','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (317,'Ciudad de Guatemala','2006/01/30','F','Guatemalteco(a)',1.22,100.25,'Ninguna','2020/04/10','AB','053-093-0849','Gage Potts','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (318,'Ciudad de Guatemala','2006/07/7','M','Guatemalteco(a)',1.23,95.67,'Católico','2020/07/13','O+','278-591-0643','Tasha Warren','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (319,'Ciudad de Guatemala','2006/08/319','F','Guatemalteco(a)',1.25,93.64,'Evangélico','2020/07/20','A-','050-676-2464','Gail Gordon','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (320,'Ciudad de Guatemala','32006/06/22','F','Guatemalteco(a)',1.22,93.55,'Ninguna','320320/04/28','AB','666-797-0175','Azalia Dickerson','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (321,'Ciudad de Guatemala','2006/09/11','F','Guatemalteco(a)',1.22,105.18,'Evangélico','2020/04/4','O+','709-699-3856','Leila Glass','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (322,'Ciudad de Guatemala','2006/09/12','F','Guatemalteco(a)',1.23,98.46,'Católico','2020/03/19','O+','344-010-3647','Josephine Koch','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (323,'Ciudad de Guatemala','2006/09/7','M','Guatemalteco(a)',1.21,105.95,'Católico','2020/03/8','AB','701-119-5062','Giselle Mcgee','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (324,'Ciudad de Guatemala','2006/07/30','M','Guatemalteco(a)',1.21,111.06,'Católico','2020/09/27','AB','111-348-8928','Alden Lindsay','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (325,'Ciudad de Guatemala','2006/10/31','M','Guatemalteco(a)',1.24,107.57,'Mormón','2020/07/26','A+','990-186-9057','Emily Banks','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (326,'Ciudad de Guatemala','2006/08/15','M','Guatemalteco(a)',1.21,114.97,'Católico','2020/07/15','A-','872-331-6857','Sacha Franks','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (327,'Ciudad de Guatemala','2006/05/2','M','Guatemalteco(a)',1.23,114.71,'Católico','2020/05/23','-','018-834-9386','Neil Sanders','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (328,'Ciudad de Guatemala','2006/04/2','M','Guatemalteco(a)',1.24,96.24,'Ninguna','2020/09/26','O+','881-038-7582','Berk Luna','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (329,'Ciudad de Guatemala','2006/12/5','M','Guatemalteco(a)',1.21,100.96,'Mormón','2020/01/25','-','755-417-0499','Dahlia Banks','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (330,'Ciudad de Guatemala','2006/08/20','M','Guatemalteco(a)',1.21,111.46,'Ninguna','2020/03/18','A-','226-967-0591','Hayden Sanders','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (331,'Ciudad de Guatemala','2005/09/3312','F','Guatemalteco(a)',331.26,99.3310,'Ninguna','2020/06/22','-','3313318-997-5074','Theodore Goff','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (332,'Ciudad de Guatemala','332005/04/3320','M','Guatemalteco(a)',1.3323,114.43,'Católico','33203320/0332/3327','-','33294-011-5043','Baxter Morrow','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (333,'Ciudad de Guatemala','2005/08/21','M','Guatemalteco(a)',1.2333,104.29,'Ninguna','2020/01/3330','A-','711-08333-7490','Justine Castro','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (334,'Ciudad de Guatemala','2005/08/30','F','Guatemalteco(a)',1.22,116.02,'Evangélico','2020/08/1334','O+','21334-3343345-6598','Beck Wilder','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (335,'Ciudad de Guatemala','200335/02/23','M','Guatemalteco(a)',1.23,114.09,'Mormón','2020/03/9','AB','740-294-143335','Brock Griffin','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (336,'Ciudad de Guatemala','2005/02/13','F','Guatemalteco(a)',1.22,113.3360,'Evangélico','2020/0336/1','A+','895-382-9029','Hiroko Alvarez','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (337,'Ciudad de Guatemala','2005/11/1337','M','Guatemalteco(a)',1.23,115.93,'Ninguna','2020/04/10','A+','035-698-33733718','Aurora Leon','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (338,'Ciudad de Guatemala','2005/11/1338','M','Guatemalteco(a)',1.22,104.40,'Evangélico','2020/05/17','O+','25338-00338-33853387','Serena Dunlap','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (339,'Ciudad de Guatemala','2005/01/1339','M','Guatemalteco(a)',1.21,111.3393,'Mormón','2020/08/31','-','117-877-113396','Charity Bond','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (340,'Ciudad de Guatemala','2005/05/23','F','Guatemalteco(a)',1.23,96.71,'Mormón','2020/340/11','AB','175-392-9533','Stewart Shelton','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (341,'Ciudad de Guatemala','2005/05/1','F','Guatemalteco(a)',1.23,107.29,'Católico','2020/02/2','-','912-591-2403','Natalie Vazquez','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (342,'Ciudad de Guatemala','2005/09/17','M','Guatemalteco(a)',1.23,104.44,'Evangélico','2020/10/6','O+','740-627-9402','Donovan Booth','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (343,'Ciudad de Guatemala','2005/04/18','F','Guatemalteco(a)',1.24,1343.73,'Católico','2020/05/26','A+','329-591-7440','Lillian Howell','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (344,'Ciudad de Guatemala','2005/08/26','F','Guatemalteco(a)',1.20,105.17,'Católico','2020/02/1','AB','523-602-9499','Faith Reeves','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (345,'Ciudad de Guatemala','2005/07/12','F','Guatemalteco(a)',1.22,95.13,'Católico','2020/05/22','A-','095-577-4958','Galvin Erickson','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (346,'Ciudad de Guatemala','2005/05/7','M','Guatemalteco(a)',1.27,101.68,'Mormón','2020/06/23','AB','049-830-63467','Willow Knox','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (347,'Ciudad de Guatemala','2005/12/21','F','Guatemalteco(a)',1.23,103.98,'Evangélico','2020/09/23','A+','691-909-5442','Lionel Lindsay','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (348,'Ciudad de Guatemala','2005/12/11','M','Guatemalteco(a)',1.24,117.19,'Evangélico','2020/03/16','O+','051-296-3685','Rhoda Snow','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (349,'Ciudad de Guatemala','2005/01/5','M','Guatemalteco(a)',1.24,96.30,'Mormón','2020/03/15','O-','505-881-6350','Baxter Nunez','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (350,'Ciudad de Guatemala','35005/05/3','F','Guatemalteco(a)',1.21,115.03,'Mormón','350350/03/2','A-','250-446-7117','Jaden Payne','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (351,'Ciudad de Guatemala','2005/06/13','F','Guatemalteco(a)',1.26,116.12,'Mormón','2020/02/17','AB','692-062-9680','Vernon Guerra','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (352,'Ciudad de Guatemala','2005/11/17','M','Guatemalteco(a)',1.26,113.65,'Mormón','2020/05/12','O-','100-808-8925','Scarlet Burch','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (353,'Ciudad de Guatemala','2005/11/30','F','Guatemalteco(a)',1.353,114.59,'Mormón','2020/05/9','-','109-303-6738','Salvador Newton','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (354,'Ciudad de Guatemala','2005/12/11','M','Guatemalteco(a)',1.22,103.354,'Católico','2020/04/354','-','630-780-9906','Sean Allen','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (355,'Ciudad de Guatemala','2005/03/4','F','Guatemalteco(a)',1.21,109.92,'Ninguna','2020/01/3','O+','332-243-6119','Debra Colon','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (356,'Ciudad de Guatemala','2005/03/20','M','Guatemalteco(a)',1.21,107.56,'Ninguna','2020/07/10','AB','789-593-6880','Brittany Harper','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (357,'Ciudad de Guatemala','2005/10/17','F','Guatemalteco(a)',1.26,115.48,'Católico','2020/03/23','-','040-951-5259','Chadwick Ortega','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (358,'Ciudad de Guatemala','2005/05/13','F','Guatemalteco(a)',1.24,97.358,'Evangélico','2020/01/7','-','330-604-8331','Charissa Fields','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (359,'Ciudad de Guatemala','2005/05/16','M','Guatemalteco(a)',1.26,110.31,'Católico','2020/07/12','A+','340-224-8896','Xandra Gardner','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (360,'Ciudad de Guatemala','2005/03/31','F','Guatemalteco(a)',1.21,106.38,'Evangélico','2020/04/7','A+','797-581-9583','Denton Baker','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (361,'Ciudad de Guatemala','2004/3612/2361','F','Guatemalteco(a)',361.28,36108.35,'Evangélico','2020/04/30','O+','526-488-2389','Sawyer Dorsey','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (362,'Ciudad de Guatemala','362004/03/3623','F','Guatemalteco(a)',1.3627,117.3629,'Católico','36203620/03/6','A+','614-355-513626','Jasmine Craig','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (363,'Ciudad de Guatemala','2004/12/2363','M','Guatemalteco(a)',1.27,106.68,'Evangélico','2020/04/7','O+','622-83634-8058','Serena Bennett','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (364,'Ciudad de Guatemala','200364/06/27','F','Guatemalteco(a)',1.29,119.93,'Ninguna','2020/01/364','A+','13649-888-6326','Kuame Williamson','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (365,'Ciudad de Guatemala','2004/01/27','F','Guatemalteco(a)',1.28,111.86,'Ninguna','2020/10/2','-','343-3650365-6019','Ahmed Tyler','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (366,'Ciudad de Guatemala','2004/09/11','F','Guatemalteco(a)',1.2366,105.39,'Evangélico','2020/04/30','AB','55366-53660-36674366','Carla Dillard','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (367,'Ciudad de Guatemala','2004/05/5','F','Guatemalteco(a)',1.28,10367.19,'Católico','2020/04/1367','O+','003-186-13367367','Joan Barr','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (368,'Ciudad de Guatemala','2004/12/26','F','Guatemalteco(a)',1.29,101.3368,'Ninguna','2020/06/24','O-','012-27368-368346','Derek Parks','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (369,'Ciudad de Guatemala','2004/11/25','M','Guatemalteco(a)',1.27,117.3369,'Católico','2020/07/18','A+','00369-617-5684','Axel Barnett','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (370,'Ciudad de Guatemala','2004/370/28','M','Guatemalteco(a)',1.26,113.80,'Mormón','2020/06/21','AB','964-538-5624','Henry Leon','Moho');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (371,'Ciudad de Guatemala','2004/06/28','M','Guatemalteco(a)',1.27,3713.50,'Mormón','2020/04/27','O-','610-807-53717','Chandler Tucker','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (372,'Ciudad de Guatemala','2004/06/15','M','Guatemalteco(a)',1.29,105.68,'Católico','2020/09/21','A+','576-495-3434','Porter Mclaughlin','Polen');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (373,'Ciudad de Guatemala','2004/09/11','F','Guatemalteco(a)',1.28,109.31,'Ninguna','2020/03/5','AB','788-403-13735','Francis Bradshaw','Perfumes');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (374,'Ciudad de Guatemala','2004/05/9','M','Guatemalteco(a)',1.27,116.25,'Ninguna','2020/09/10','O-','423-500-1899','Murphy Stein','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (375,'Ciudad de Guatemala','2004/10/26','M','Guatemalteco(a)',1.28,1375.75,'Evangélico','2020/02/12','-','535-116-8143','Brynne Sheppard','Látex');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (376,'Ciudad de Guatemala','2004/12/22','M','Guatemalteco(a)',1.28,108.92,'Católico','2020/09/29','O-','546-723-2875','Zia Maldonado','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (377,'Ciudad de Guatemala','2004/08/19','F','Guatemalteco(a)',1.28,111.66,'Ninguna','2020/05/31','AB','148-393-4906','Jameson Harrington','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (378,'Ciudad de Guatemala','2004/02/26','F','Guatemalteco(a)',1.27,101.37,'Ninguna','2020/06/13','-','3785-993-7036','Raphael Whitney','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (379,'Ciudad de Guatemala','2004/05/21','F','Guatemalteco(a)',1.27,115.81,'Mormón','2020/02/2','A-','577-609-7135','Idona Guthrie','Alergias alimentarias');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (380,'Ciudad de Guatemala','38004/03/14','F','Guatemalteco(a)',1.28,105.87,'Ninguna','380380/02/2','-','595-321-6322','Yeo Anthony','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (381,'Ciudad de Guatemala','2004/12/5','M','Guatemalteco(a)',1.26,110.381,'Evangélico','2020/01/16','AB','975-440-1292','Claudia Solis','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (382,'Ciudad de Guatemala','2004/08/4','M','Guatemalteco(a)',1.29,107.42,'Evangélico','2020/08/8','A+','125-672-1350','Bevis Kinney','-');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (383,'Ciudad de Guatemala','2004/01/18','F','Guatemalteco(a)',1.28,115.76,'Ninguna','2020/08/29','-','843-503-3044','Timothy Tanner','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (384,'Ciudad de Guatemala','2004/03/6','M','Guatemalteco(a)',1.25,115.14,'Evangélico','2020/03/1','O+','582-796-3673','Yoko Langley','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (385,'Ciudad de Guatemala','2004/09/11','M','Guatemalteco(a)',1.26,117.06,'Católico','2020/03/19','O+','9385-444-8351','Sasha Wells','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (386,'Ciudad de Guatemala','2004/02/24','F','Guatemalteco(a)',1.25,101.28,'Evangélico','2020/04/20','A-','845-809-9370','Dale Wall','Animales');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (387,'Ciudad de Guatemala','2004/05/18','F','Guatemalteco(a)',1.26,108.54,'Mormón','2020/09/19','A+','167-194-8456','Kalia Hart','Ácaros de polvo');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (388,'Ciudad de Guatemala','2004/04/9','F','Guatemalteco(a)',1.27,112.30,'Ninguna','2020/02/388','AB','573-351-8484','Sade Carver','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (389,'Ciudad de Guatemala','2004/09/30','F','Guatemalteco(a)',1.26,119.48,'Evangélico','2020/08/30','A-','610-692-9774','Galvin Donovan','Alergias a medicamentos');
INSERT INTO detalle_alumno (`id_alumno`,`lugar_nacimiento`,`fecha_nacimiento`,`genero`,`nacionalidad`,`estatura`,`peso`,`religion`,`fecha_ingreso`,`tipo_sangre`,`celular_emergencia`,`padre_emergencia`,`alergias`) VALUES (390,'Ciudad de Guatemala','2004/05/27','F','Guatemalteco(a)',1.27,116.64,'Ninguna','2020/09/17','A-','451-317-4045','Regan Sharpe','Moho');

  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (1);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (2);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (3);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (4);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (5);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (6);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (7);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (8);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (9);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (10);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (11);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (12);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (13);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (14);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (15);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (16);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (17);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (18);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (19);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (20);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (21);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (22);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (23);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (24);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (25);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (26);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (27);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (28);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (29);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (30);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (31);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (32);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (33);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (34);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (35);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (36);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (37);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (38);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (39);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (40);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (41);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (42);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (43);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (44);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (45);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (46);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (47);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (48);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (49);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (50);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (51);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (52);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (53);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (54);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (55);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (56);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (57);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (58);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (59);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (60);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (61);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (62);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (63);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (64);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (65);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (66);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (67);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (68);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (69);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (70);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (71);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (72);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (73);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (74);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (75);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (76);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (77);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (78);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (79);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (80);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (81);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (82);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (83);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (84);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (85);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (86);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (87);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (88);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (89);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (90);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (91);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (92);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (93);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (94);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (95);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (96);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (97);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (98);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (99);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (100);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (101);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (102);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (103);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (104);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (105);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (106);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (107);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (108);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (109);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (110);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (111);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (112);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (113);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (114);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (115);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (116);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (117);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (118);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (119);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (120);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (121);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (122);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (123);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (124);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (125);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (126);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (127);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (128);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (129);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (130);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (131);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (132);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (133);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (134);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (135);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (136);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (137);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (138);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (139);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (140);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (141);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (142);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (143);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (144);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (145);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (146);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (147);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (148);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (149);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (150);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (151);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (152);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (153);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (154);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (155);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (156);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (157);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (158);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (159);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (160);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (161);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (162);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (163);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (164);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (165);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (166);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (167);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (168);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (169);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (170);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (171);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (172);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (173);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (174);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (175);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (176);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (177);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (178);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (179);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (180);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (181);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (182);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (183);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (184);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (185);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (186);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (187);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (188);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (189);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (190);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (191);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (192);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (193);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (194);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (195);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (196);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (197);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (198);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (199);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (200);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (201);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (202);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (203);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (204);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (205);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (206);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (207);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (208);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (209);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (210);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (211);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (212);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (213);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (214);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (215);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (216);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (217);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (218);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (219);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (220);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (221);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (222);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (223);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (224);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (225);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (226);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (227);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (228);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (229);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (230);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (231);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (232);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (233);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (234);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (235);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (236);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (237);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (238);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (239);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (240);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (241);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (242);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (243);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (244);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (245);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (246);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (247);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (248);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (249);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (250);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (251);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (252);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (253);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (254);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (255);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (256);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (257);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (258);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (259);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (260);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (261);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (262);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (263);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (264);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (265);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (266);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (267);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (268);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (269);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (270);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (271);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (272);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (273);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (274);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (275);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (276);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (277);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (278);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (279);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (280);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (281);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (282);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (283);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (284);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (285);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (286);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (287);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (288);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (289);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (290);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (291);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (292);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (293);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (294);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (295);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (296);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (297);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (298);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (299);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (300);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (301);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (302);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (303);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (304);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (305);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (306);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (307);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (308);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (309);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (310);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (311);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (312);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (313);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (314);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (315);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (316);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (317);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (318);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (319);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (320);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (321);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (322);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (323);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (324);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (325);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (326);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (327);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (328);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (329);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (330);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (331);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (332);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (333);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (334);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (335);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (336);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (337);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (338);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (339);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (340);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (341);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (342);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (343);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (344);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (345);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (346);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (347);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (348);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (349);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (350);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (351);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (352);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (353);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (354);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (355);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (356);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (357);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (358);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (359);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (360);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (361);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (362);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (363);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (364);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (365);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (366);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (367);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (368);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (369);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (370);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (371);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (372);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (373);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (374);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (375);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (376);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (377);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (378);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (379);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (380);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (381);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (382);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (383);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (384);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (385);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (386);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (387);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (388);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (389);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (390);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (391);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (392);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (393);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (394);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (395);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (396);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (397);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (398);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (399);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (400);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (401);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (402);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (403);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (404);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (405);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (406);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (407);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (408);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (409);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (410);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (411);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (412);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (413);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (414);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (415);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (416);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (417);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (418);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (419);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (420);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (421);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (422);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (423);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (424);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (425);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (426);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (427);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (428);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (429);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (430);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (431);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (432);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (433);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (434);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (435);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (436);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (437);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (438);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (439);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (440);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (441);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (442);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (443);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (444);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (445);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (446);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (447);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (448);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (449);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (450);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (451);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (452);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (453);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (454);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (455);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (456);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (457);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (458);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (459);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (460);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (461);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (462);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (463);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (464);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (465);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (466);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (467);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (468);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (469);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (470);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (471);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (472);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (473);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (474);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (475);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (476);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (477);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (478);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (479);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (480);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (481);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (482);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (483);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (484);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (485);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (486);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (487);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (488);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (489);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (490);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (491);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (492);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (493);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (494);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (495);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (496);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (497);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (498);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (499);
  INSERT INTO papeleria_alumno (`id_alumno`) VALUES (500);

CREATE VIEW maestros_activos AS
SELECT * FROM maestro where estado = "A";