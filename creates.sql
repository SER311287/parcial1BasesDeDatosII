  DROP DATABASE IF EXISTS la_escuelita_de_pancho;
  CREATE DATABASE la_escuelita_de_pancho;

  USE la_escuelita_de_pancho;

  DROP TABLE IF EXISTS `actividad`;
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

  LOCK TABLES `actividad` WRITE;
  UNLOCK TABLES;

  DROP TABLE IF EXISTS `alumno`;
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

  LOCK TABLES `alumno` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `asignacion`;
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

  LOCK TABLES `asignacion` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `aula`;
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

  LOCK TABLES `aula` WRITE;
  UNLOCK TABLES;

  DROP TABLE IF EXISTS `grado`;
  CREATE TABLE `grado` (
    `id_grado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo que identifica al grado',
    `nombre_grado` varchar(45) NOT NULL COMMENT 'describe el nombre del grado',
    `estado` enum('A','B') NOT NULL COMMENT 'Se evalua si esta activo o de baja los grados del colegio',
    PRIMARY KEY (`id_grado`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla contiene los grados del nivel primario';

  LOCK TABLES `grado` WRITE;
  UNLOCK TABLES;


DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
    `id_curso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de curso',
    `nombre_curso` varchar(150) NOT NULL COMMENT 'nombre de curso a impartir',
    `observacion` varchar(155) NOT NULL COMMENT 'algun comentario del curso',
    `estado` enum('A','B') NOT NULL COMMENT 'indica si esta de Alta o Baja ',
    `fecha_creacion` date NOT NULL COMMENT 'indicador de la fecha que se creo ',
    `id_grado` int(11) NOT NULL COMMENT 'llave que apunta al grado',
    PRIMARY KEY (`id_curso`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla que contendra todos los cursos en general\n';

  LOCK TABLES `curso` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `detalle_alumno`;
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

  LOCK TABLES `detalle_alumno` WRITE;
  UNLOCK TABLES;



  DROP TABLE IF EXISTS `horario`;
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


  LOCK TABLES `horario` WRITE;
  UNLOCK TABLES;

  DROP TABLE IF EXISTS `identificacion`;
  CREATE TABLE `identificacion` (
    `id_identificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de identificacion ',
    `nombre_identificacion` varchar(45) NOT NULL COMMENT 'nombre de la identificacion',
    `estado` enum('A','B') NOT NULL COMMENT 'Indica si esta de Alta o de Baja el aula\n',
    PRIMARY KEY (`id_identificacion`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='nos indica el tipo de documento que puede utizar ';

  LOCK TABLES `identificacion` WRITE;
  UNLOCK TABLES;

  DROP TABLE IF EXISTS `maestro`;
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

  LOCK TABLES `maestro` WRITE;
  UNLOCK TABLES;

  DROP TABLE IF EXISTS `maestro_curso`;
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

  LOCK TABLES `maestro_curso` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `papeleria_alumno`;
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


  LOCK TABLES `papeleria_alumno` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `periodo_dia`;
  CREATE TABLE `periodo_dia` (
    `id_periodo_dia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo para definir el periodo en el que esta',
    `nombre_periodo` varchar(45) NOT NULL COMMENT 'descripcion o titulo para el periodo',
    `observacion` varchar(145) NOT NULL COMMENT 'algun comentario para la definicion del periodo',
    `dia_horario` varchar(45) DEFAULT NULL COMMENT 'dia para el periodo\n',
    `hora_horario` datetime NOT NULL COMMENT 'la hora del horario para el periodo',
    `estado` enum('A','B') NOT NULL,
    PRIMARY KEY (`id_periodo_dia`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='grupo por dias de horario';


  LOCK TABLES `periodo_dia` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `respuesta_actividad`;
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
  
  LOCK TABLES `respuesta_actividad` WRITE;
  UNLOCK TABLES;

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

  LOCK TABLES `unidad` WRITE;
  UNLOCK TABLES;


  DROP TABLE IF EXISTS `usuario`;
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

  LOCK TABLES `usuario` WRITE;
  UNLOCK TABLES;
