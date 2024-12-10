CREATE TABLE `blog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(35) DEFAULT NULL,
  `descripcion1` varchar(35) DEFAULT NULL,
  `contenido1` varchar(800) DEFAULT NULL,
  `descripcion2` varchar(30) DEFAULT NULL,
  `contenido2` varchar(550) DEFAULT NULL,
  `descripcion3` varchar(40) DEFAULT NULL,
  `contenido3` varchar(700) DEFAULT NULL,
  `descripcion4` varchar(30) DEFAULT NULL,
  `contenido4` varchar(750) DEFAULT NULL,
  `descripcion5` varchar(45) DEFAULT NULL,
  `contenido5` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table blog
#

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Volando Alto en la EducaciÃ³n','Compromiso con la Excelencia','En nuestro centro educativo particular, nos enorgullece comprometernos con la excelencia acadÃ©mica. Contamos con un equipo de educadores altamente calificados que se esfuerzan por nutrir la mente y el corazÃ³n de cada estudiante. Creemos que la educaciÃ³n va mÃ¡s allÃ¡ de los libros de texto y se extiende al desarrollo integral de habilidades crÃ­ticas y valores Ã©ticos sÃ³lidos.\r\n\r\nEn \"Las Aguilas del Saber\", adoptamos un enfoque pedagÃ³gico innovador que integra la tecnologÃ­a, el arte y la cultura en el aula. Buscamos proporcionar a nuestros estudiantes las herramientas necesarias para enfrentar los desafÃ­os del siglo XXI. Creemos en la importancia de fomentar la creatividad y la curiosidad para preparar a nuestros estudiantes para un futuro en constante evoluciÃ³n.','Diversidad y ColaboraciÃ³n','Valoramos la diversidad en todas sus formas. Creemos que la riqueza de experiencias y perspectivas enriquece el proceso educativo. Fomentamos un espÃ­ritu colaborativo donde los estudiantes aprenden unos de otros, desarrollando habilidades sociales fundamentales para la vida. MÃ¡s allÃ¡ de la educaciÃ³n acadÃ©mica, en \"Las Aguilas del Saber\" nos preocupamos por el desarrollo integral de cada individuo. Buscamos formar no solo mentes agudas, sino tambiÃ©n individuos Ã©ticos, responsables y conscientes de su papel en la sociedad.','Programas Educativos Personalizados','En \"Las Aguilas del Saber\", reconocemos que cada estudiante es Ãºnico. Por eso, ofrecemos programas educativos personalizados que se adaptan a las necesidades y habilidades individuales. Nuestro enfoque centrado en el estudiante permite un aprendizaje mÃ¡s efectivo y significativo.\r\n\r\nEntendemos que el aprendizaje no solo ocurre dentro del aula. Nuestra instituciÃ³n ofrece una variedad de actividades extracurriculares, desde clubes acadÃ©micos hasta programas deportivos y artÃ­sticos. Estas actividades complementan la educaciÃ³n formal y brindan a los estudiantes la oportunidad de explorar sus intereses y talentos mÃ¡s allÃ¡ del plan de estudios estÃ¡ndar.','MentorÃ­a y OrientaciÃ³n','En \"Las Aguilas del Saber\", valoramos el papel fundamental de la mentorÃ­a y la orientaciÃ³n en el desarrollo de nuestros estudiantes. Contamos con un sÃ³lido sistema de apoyo que incluye mentorÃ­a individualizada para ayudar a los estudiantes a establecer metas acadÃ©micas y personales, asÃ­ como a superar desafÃ­os.\r\n\r\nCreemos en el poder transformador de la mentorÃ­a personalizada. Cada estudiante en \"Las Aguilas del Saber\" tiene la oportunidad de ser emparejado con un mentor dedicado. Estos mentores, expertos en sus campos, trabajan en estrecha colaboraciÃ³n con los estudiantes para establecer metas claras, identificar fortalezas y Ã¡reas de mejora, y proporcionar orientaciÃ³n especÃ­fica para su crecimiento acadÃ©mico y personal.','Instalaciones Modernas y TecnolÃ³gicas','Nuestras instalaciones estÃ¡n equipadas con tecnologÃ­a de Ãºltima generaciÃ³n para enriquecer la experiencia de aprendizaje. Las aulas inteligentes, laboratorios especializados y recursos multimedia crean un entorno propicio para la exploraciÃ³n y la investigaciÃ³n.\r\n\r\nFomentamos un sentido de comunidad en \"Las Aguilas del Saber\" a travÃ©s de eventos y celebraciones que reÃºnen a estudiantes, padres y personal educativo. Estas ocasiones no solo fortalecen los lazos entre la comunidad escolar, sino que tambiÃ©n ofrecen oportunidades para el aprendizaje experiencial y la diversiÃ³n.');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table comunicados
#

DROP TABLE IF EXISTS `comunicados`;
CREATE TABLE `comunicados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table comunicados
#

LOCK TABLES `comunicados` WRITE;
/*!40000 ALTER TABLE `comunicados` DISABLE KEYS */;
INSERT INTO `comunicados` VALUES (1,'1864223453.ee');
INSERT INTO `comunicados` VALUES (8,'1754086929.comunica');
INSERT INTO `comunicados` VALUES (9,'358571424.DiseÃ±o sin tÃ­tulo (3)');
INSERT INTO `comunicados` VALUES (10,'65157108.tt');
/*!40000 ALTER TABLE `comunicados` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table contacto
#

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE `contacto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion1` varchar(300) DEFAULT NULL,
  `horarios` varchar(25) DEFAULT NULL,
  `horas` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table contacto
#

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'En \"Las Aguilas del Saber\", valoramos la comunicaciÃ³n abierta y estamos aquÃ­ para responder a tus preguntas, recibir comentarios y ayudarte en todo lo que necesites. No dudes en ponerte en contacto con nosotros. AquÃ­ tienes toda la informaciÃ³n necesaria para conectarte','Lunes - Viernes:','08:00 AM - 05:00 PM');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table galeria
#

DROP TABLE IF EXISTS `galeria`;
CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table galeria
#

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
INSERT INTO `galeria` VALUES (1,'564574524.gal1');
INSERT INTO `galeria` VALUES (2,'1836447431.gal2');
INSERT INTO `galeria` VALUES (3,'1779545733.gal3');
INSERT INTO `galeria` VALUES (4,'1365521099.gal4');
INSERT INTO `galeria` VALUES (5,'1993076180.gal5');
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table general
#

DROP TABLE IF EXISTS `general`;
CREATE TABLE `general` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) DEFAULT NULL,
  `seccion1` varchar(45) DEFAULT NULL,
  `seccion2` varchar(50) DEFAULT NULL,
  `descripcion1` varchar(20) DEFAULT NULL,
  `contenido1` varchar(200) DEFAULT NULL,
  `descripcion2` varchar(20) DEFAULT NULL,
  `contenido2` varchar(200) DEFAULT NULL,
  `descripcion3` varchar(30) DEFAULT NULL,
  `contenido3` varchar(180) DEFAULT NULL,
  `descripcion4` varchar(20) DEFAULT NULL,
  `contenido4` varchar(170) DEFAULT NULL,
  `descripcion5` varchar(25) DEFAULT NULL,
  `contenido5` varchar(120) DEFAULT NULL,
  `descripcion6` varchar(30) DEFAULT NULL,
  `contenido6` varchar(180) DEFAULT NULL,
  `titulonosotros` varchar(40) DEFAULT NULL,
  `contenidonosotros` varchar(400) DEFAULT NULL,
  `d1` varchar(60) DEFAULT NULL,
  `d2` varchar(60) DEFAULT NULL,
  `proyectos` varchar(100) DEFAULT NULL,
  `mision` varchar(10) DEFAULT NULL,
  `contenido8` varchar(550) DEFAULT NULL,
  `vision` varchar(10) DEFAULT NULL,
  `contenido9` varchar(400) DEFAULT NULL,
  `ideario` varchar(10) DEFAULT NULL,
  `contenido10` varchar(550) DEFAULT NULL,
  `detalle1` varchar(30) DEFAULT NULL,
  `contenido11` varchar(200) DEFAULT NULL,
  `detalle2` varchar(30) DEFAULT NULL,
  `contenido12` varchar(170) DEFAULT NULL,
  `detalle3` varchar(30) DEFAULT NULL,
  `contenido13` varchar(150) DEFAULT NULL,
  `footer1` varchar(30) DEFAULT NULL,
  `contenido14` varchar(320) DEFAULT NULL,
  `facebook` varchar(60) DEFAULT NULL,
  `instagram` varchar(60) DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table general
#

LOCK TABLES `general` WRITE;
/*!40000 ALTER TABLE `general` DISABLE KEYS */;
INSERT INTO `general` VALUES (1,'Las Aguilas del Saber','Centro De Educacion Inicial Particular','Nuevo enfoque para la educaciÃ³n infantil',' Patio de Juegos','Patio de juegos es un espacio seguro y divertido donde los estudiantes pueden desarrollar habilidades motoras, aprender a socializar y disfrutar de actividades recreativas.','Musica y Baila','La mÃºsica y el baile son partes integrales de nuestro enfoque educativo. Ofrecemos clases que van desde apreciaciÃ³n musical hasta participaciÃ³n activa en la creaciÃ³n.','Artes y Manualidades','Fomentamos la creatividad a travÃ©s de actividades de arte y manualidades. Nuestros estudiantes exploran su lado artÃ­stico, desarrollan habilidades prÃ¡cticas.','Ambiente Sano','Mantenemos instalaciones limpias y seguras, promoviendo un ambiente propicio para el aprendizaje y el bienestar de nuestros estudiantes.','Comida Sana','En \"Las Ãguilas del Saber\", nos comprometemos a proporcionar opciones de comida saludable y equilibrada.','Educacion de Primera','Nuestro enfoque pedagÃ³gico se basa en mÃ©todos innovadores y programas acadÃ©micos sÃ³lidos que desafÃ­an a nuestros estudiantes a alcanzar su mÃ¡ximo potencial.','La mejor Escuela para tus NiÃ±os','En \"Las Ãguilas del Saber\", nos enorgullece ser la piedra angular de la educaciÃ³n integral y de calidad. Con una visiÃ³n clara y un compromiso inquebrantable, hemos cultivado un entorno educativo en el que la excelencia florece. Nuestra dedicaciÃ³n a la formaciÃ³n acadÃ©mica y personal de cada estudiante se refleja en la experiencia educativa Ãºnica que ofrecemos.',' Ambiente amigable',' Desarrollo de Habilidades','Nuestros Proyectos','MISIÃ“N','Somos una escuela mixta, laica e intercultural, que estÃ¡ al servicio de los niÃ±os/niÃ±as del sector urbano de esa noble ciudad, formando seres responsables con su entorno, basado en el respeto, honestidad solidaridad, a travÃ©s de la metodologÃ­a juego-trabajo. Que propone brindar una educaciÃ³n que desarrolla las capacidades individuales la autoestima de nuestros estudiantes, el amor al trabajo, para que continÃºe con el proceso bÃ¡sico de aprendizaje, articulÃ¡ndose sus estudios a la educaciÃ³n general bÃ¡sica.','VISIÃ“N','Ser una Escuela lider y reconocida a nivel cantonal, como una de las mejores instituciones por su calidad y excelencia educativa, que a travÃ©s de nuevos enfoques pedagÃ³gicos seremos una instituciÃ³n amplia y funcional, confortable que invita al aprendizaje de desarrollo de destrezas y habilidades, orientada a mejorar la calidad de vida de los estudiantes de manera integral','IDEARIO','El ideario de la Escuela de EducaciÃ³n BÃ¡sica Particular \"Las Ãguilas del Saber\" se desarrolla en concordancia a la Ley OrgÃ¡nica de EducaciÃ³n Intercultural que sustenta los principios y valores los cuales definen y orientan el accionar educativo en la instituciÃ³n orientado a:\r\n\r\nFomentar el desarrollo de valores humanos como instrumento esencial en el convivir democrÃ¡tico y social.\r\n\r\nRespetar y hacer respetar el interÃ©s superior del niÃ±o, niÃ±a orientada a garantizar el ejercicio efectivo de sus derechos.','Compromiso con la Excelencia','Contamos con un equipo de educadores altamente calificados que se esfuerzan por nutrir la mente y el corazÃ³n de cada estudiante. Creemos que la educaciÃ³n va mÃ¡s allÃ¡ de los libros de texto....','Diversidad y ColaboraciÃ³n','Fomentamos un espÃ­ritu colaborativo donde los estudiantes aprenden unos de otros, desarrollando habilidades sociales fundamentales para la vida...','MentorÃ­a y OrientaciÃ³n','En \" Las Aguilas del Saber\", valoramos el papel fundamental de la mentorÃ­a y la orientaciÃ³n en el desarrollo de nuestros estudiantes....','Las Aguilas del Saber','Las Aguilas del Saber es un destacado centro educativo particular comprometido con la excelencia acadÃ©mica y el desarrollo integral de sus estudiantes. Nuestra instituciÃ³n se enorgullece de ofrecer un entorno educativo estimulante y enriquecedor, donde cada estudiante es inspirado a alcanzar su mÃ¡ximo potencial.','https://www.facebook.com/Lasaguilasdelsaber','https://www.instagram.com/ebp_lasaguilasdelsaber/','Calle Eloy Alfaro, Celica','las_aguilas_del_Saber@hotmail.com','0979430945');
/*!40000 ALTER TABLE `general` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table historia
#

DROP TABLE IF EXISTS `historia`;
CREATE TABLE `historia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) DEFAULT NULL,
  `identidad` varchar(30) DEFAULT NULL,
  `contenido1` varchar(900) DEFAULT NULL,
  `titulohistoria` varchar(25) DEFAULT NULL,
  `descripcion` varchar(65) DEFAULT NULL,
  `d1` varchar(25) DEFAULT NULL,
  `contenido2` varchar(1250) DEFAULT NULL,
  `d2` varchar(30) DEFAULT NULL,
  `contenido3` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table historia
#

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
INSERT INTO `historia` VALUES (1,'Sobre Nosotros','Identidad Institucional','La Escuela de EducaciÃ³n BÃ¡sica Particular Las Ãguilas del Saber, desde sus inicios, ubica al estudiante como protagonista principal del aprendizaje con predominio de las vÃ­as metodolÃ³gicas constructivistas. construyendo conocimientos en un ambiente de calidez y con excelentes maestros que aÃºnan esfuerzos a esta labor, para ello es importante cumplir con los procedimientos legales que el MINEDUC seÃ±ala, el cual convertido en la fortaleza para dar los cambios necesarios para que nuestra instituciÃ³n siga en los altos sitiales en los que siempre se ha encontrado, y con la participaciÃ³n activa de toda la comunidad educativa ha logrado plasmar el presente documento sobre las dimensiones de los estÃ¡ndares de gestiÃ³n escolar: DimensiÃ³n de convivencia, participaciÃ³n Escolar y CooperaciÃ³n, GestiÃ³n PedagÃ³gica, Seguridad Escolar, GestiÃ³n administrativa.','Historia del Plantel','Conoce nuestra trayectoria y cÃ³mo hemos llegado hasta aquÃ­.','El primer paso..','El Centro educativo obtiene su permiso de funcionamiento mediante RESOLUCIÃ“N DEO-DPE-109-2009, el 04 de marzo del 2009, jornada matutina, ubicado en la Parroquia El Cambio, Ciudadela Mario Minuche, calle Eloy Alfaro y Tercera Sur, inicia la jornada escolar el mes de abril del aÃ±o lectivo 2009-2010.\r\n\r\nEl 10 de julio del 2014, mediante RESOLUCIÃ“N 863-14 se obtiene la autorizaciÃ³n de creaciÃ³n y funcionamiento del centro de educaciÃ³n inicial \"Las Ãguilas del Saber\" En el aÃ±o 2018 mediante RESOLUCIÃ“N N\" MINEDUC-CZ7-2018-00175-R de fecha 03 de abril del 2018, se autoriza la creaciÃ³n y funcionamiento del subnivel de preparatoria que corresponde a primer grado de educaciÃ³n general bÃ¡sica, en la Escuela de EducaciÃ³n BÃ¡sica Particular \"Las Ãguila del Saber\". En el aÃ±o 2018 el Centro de EducaciÃ³n Inicial a travÃ©s de la RESOLUCIÃ“N NÂ° MINEDUC-CZ7-2018-00175-R de fecha 03 de abril del 2018, recibe la denominaciÃ³n de Escuela de EducaciÃ³n BÃ¡sica Particular \"Las Ãguila del Saber.\r\n\r\nEn el aÃ±o 2018 el Centro de EducaciÃ³n Inicial a travÃ©s de la RESOLUCIÃ“N NÂ° MINEDUC-CZ7-2018-00175-R de fecha 03 de abril del 2018, recibe la denominaciÃ³n de Escuela de EducaciÃ³n BÃ¡sica Particular \"Las Ãguila del Saber.','La historia continua..','Janina e IvÃ¡n Salinas Salinas Licenciados en ciencias de la educaciÃ³n por vocaciÃ³n, amor, servicio a su comunidad y la convicciÃ³n que las bases sÃ³lidas para una buena formaciÃ³n humana y profesional se inicia desde los primeros aÃ±os de vida en el ser humano, gestionan y llevan a la prÃ¡ctica el proyecto de creaciÃ³n del Centro de EducaciÃ³n Inicial \"Las Ãguilas del Saber\".\r\n\r\nSu Primer Director fue el Lic. JosÃ© CedeÃ±o Hidalgo, las maestras Prof. Rosario CÃ¡rdenas y la Prof. Janina Salinas. Durante los aÃ±os lectivos 2011-2012 hasta 2017-2018 va creciendo como Centro de EducaciÃ³n Inicial, ofertando el servicio educativo en educaciÃ³n inicial en el subnivel 2, para infantes de tres y cuatro aÃ±os de edad.\r\n\r\nEn el aÃ±o 2017-2019 asume la direcciÃ³n del plantel el Lic. IvÃ¡n Salinas Salinas, ofertando el servicio en educaciÃ³n inicial subnivel 2, educaciÃ³n general bÃ¡sica con el subnivel de Preparatoria; proyectÃ¡ndose al 2020 con la creaciÃ³n del subnivel de BÃ¡sica Elemental.\r\n\r\nEn el periodo lectivo 2020-2021, asume la direcciÃ³n del plantel Mgs, Janina Marisel Salinas Salinas: quien enfrenta el reto de continuar ofertando el servicio educativo de manera virtual a estudiantes de 3 a 5 aÃ±os; debido a la pandemia del covid-19 el gobierno ecuatoriano declara la emergencia sanitaria y dispone que el servicio educativo en cada instituciÃ³n continÃºe. En concordancia a lo expuesto la escuela mantiene una educaciÃ³n cÃ­clica, proyectos permanentes como el ajedrez, aprendiendo de la naturaleza; siendo su eje principal la metodologÃ­a Montessori, por el contacto con materiales concretos en especial de la naturaleza. En la actualidad continua Mgs. Janina Marisel Salinas Salinas');
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table imagenes
#

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  `img4` varchar(255) DEFAULT NULL,
  `img5` varchar(255) DEFAULT NULL,
  `img6` varchar(255) DEFAULT NULL,
  `img7` varchar(255) DEFAULT NULL,
  `img8` varchar(255) DEFAULT NULL,
  `img9` varchar(255) DEFAULT NULL,
  `img10` varchar(255) DEFAULT NULL,
  `img11` varchar(255) DEFAULT NULL,
  `img12` varchar(255) DEFAULT NULL,
  `img13` varchar(255) DEFAULT NULL,
  `img14` varchar(255) DEFAULT NULL,
  `img15` varchar(255) DEFAULT NULL,
  `img16` varchar(255) DEFAULT NULL,
  `img17` varchar(255) DEFAULT NULL,
  `img18` varchar(255) DEFAULT NULL,
  `img19` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table imagenes
#

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,'../web2/img/logo23.png','../web2/img/pp.png','../web2/img/img4.jpg','../web2/img/blog3.jpg','../web2/img/img5.jpg','../web2/img/img6.jpg','../web2/img/img8.jpg','../web2/img/img1.jpg','../web2/img/blog2.jpg','../web2/img/img2.jpg','../web2/img/imghistoria.jpg','../web2/img/imghistoria2.jpg','../web2/img/blog4.jpg','../web2/img/img3.jpg','../web2/img/blog1.jpg','../web2/img/qq.jpg','../web2/img/blog6.jpg','../web2/img/blog7.jpg','../web2/img/blog9.jpg');
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table padres
#

DROP TABLE IF EXISTS `padres`;
CREATE TABLE `padres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parentesco` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `foto` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table padres
#

LOCK TABLES `padres` WRITE;
/*!40000 ALTER TABLE `padres` DISABLE KEYS */;
INSERT INTO `padres` VALUES (25,'Madre de Familia','Lorena Villacis','Mi hijo esta aprendiendo mucho en esta escuela por los conocimientos que he visto en la casa.','1273757109.png');
INSERT INTO `padres` VALUES (26,'Tio Paterno','Juan','Mis sobrinos estan apreniendo mucho en esta escuela.','316234469.PNG');
INSERT INTO `padres` VALUES (27,'Abuela','awsdfsdf','sdfsfsdfsdfsdfdsfds','1696998312.jpg');
INSERT INTO `padres` VALUES (33,'Madre de Familia','luan','hvhgfghfhghjghj','1891557951.jpg');
/*!40000 ALTER TABLE `padres` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table profesores
#

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE `profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# Dumping data for table profesores
#

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Lic. Janina Salinas. Mgs','Directora','1410541389.jpeg');
INSERT INTO `profesores` VALUES (2,'Lic. IvÃ¡n Salinas. Mgs','Profesor','2043611628.jpeg');
INSERT INTO `profesores` VALUES (3,'Psicologa. Sahian RamÃ³n','Profesora','299311140.jpeg');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
