-- Crear la tabla `estudiante`
CREATE TABLE IF NOT EXISTS `estudiante` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `lugar_nacimiento` varchar(255) DEFAULT NULL,
  `residencia` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `foto` blob DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `codigo_unico` varchar(20) NOT NULL,
  `condicion` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `discapacidad`
CREATE TABLE IF NOT EXISTS `discapacidad` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `carnet` varchar(50) NOT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ID_estudiante` (`id_estudiante`),
  CONSTRAINT `discapacidad_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `grado`
CREATE TABLE IF NOT EXISTS `grado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grado` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla `paralelo`
CREATE TABLE IF NOT EXISTS `paralelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grados` int(11) NOT NULL,
  `paralelo` char(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_grados` (`id_grados`),
  CONSTRAINT `paralelo_ibfk_1` FOREIGN KEY (`id_grados`) REFERENCES `grado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `periodo`
CREATE TABLE IF NOT EXISTS `periodo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `periodo` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `matricula`
CREATE TABLE IF NOT EXISTS `matricula` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_paralelo` int(11) DEFAULT NULL,
  `numero` int(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `id_grado` (`id_grado`),
  KEY `id_periodo` (`id_periodo`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_paralelo` (`id_paralelo`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`Id`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`id_paralelo`) REFERENCES `paralelo` (`id`),
  CONSTRAINT `matricula_ibfk_4` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `persona`
CREATE TABLE IF NOT EXISTS `persona` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `apellidos_nombres` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `foto` blob DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `reportes`
CREATE TABLE IF NOT EXISTS `reportes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `rector` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `reportes`
INSERT INTO `reportes` (`id`, `titulo`, `rector`, `genero`, `correo`, `celular`) VALUES
(1, 'Lcda', 'JANINA SALINAS SALINAS', 'directora', 'aguilas@gmail.com', '+593 969998547');

-- Crear la tabla `responsables`
CREATE TABLE IF NOT EXISTS `responsables` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `parentesco` varchar(50) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `foto` blob DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ID_estudiante` (`id_estudiante`),
  CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `rol`
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `traslado`
CREATE TABLE IF NOT EXISTS `traslado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `traslado` varchar(50) NOT NULL,
  `transporte` varchar(50) NOT NULL,
  `conductor` varchar(255) DEFAULT NULL,
  `telefono_conductor` varchar(15) DEFAULT NULL,
  `id_estudiante` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Crear la tabla `usuarios`
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `idx_usuarios_contrasena` (`contrasena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcado de datos para la tabla `usuarios`
INSERT INTO `usuarios` (`Id`, `usuario`, `contrasena`, `rol`, `estado`) VALUES
(1, 'administrador', 'lasaguilasdelsaber', 'admin', 1);
