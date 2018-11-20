-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2017 a las 03:19:03
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `in3501`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--
CREATE DATABASE IF NOT EXISTS `in3501` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `in3501`;

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `semestres_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `Anho` date NOT NULL,
  `Horario` varchar(32) NOT NULL,
  `Nombre` varchar(64) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `UD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `semestres_id`, `departamento_id`, `Anho`, `Horario`, `Nombre`, `codigo`, `UD`) VALUES
(1, 1, 1, '2009-03-01', '1.3 5.3 5.5', 'Tecnologias de Informacion y Comunicacion', 'IN3501', '10'),
(2, 2, 1, '2009-07-26', '1.3 5.3 5.5', 'Tecnologias de Informacion y Comunicacion', 'IN3501', '10'),
(3, 2, 1, '2009-07-26', '1.1 3.1 3.6', 'Microeconomia', 'IN3202', '10'),
(4, 2, 1, '2008-07-27', '3.1 3.2 1.4', 'Taller de Ingenieria Industrial I', 'IN3001', '10'),
(5, 2, 2, '2009-07-26', '2.1 4.1', 'Desarrollo de Aplicaciones Web', 'CC51T', '10'),
(6, 1, 2, '2009-03-01', '2.2 4.2 4.5', 'Algoritmos y Estructuras de Datos', 'CC3001', '10'),
(7, 2, 2, '2008-07-27', '1.1 3.2 5.1', 'Computacion 1', 'CC1001', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(64) NOT NULL,
  `sitioweb` varchar(45) DEFAULT NULL,
  `Jefe_depto_id` int(11) NOT NULL,
  `Codigo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `Nombre`, `sitioweb`, `Jefe_depto_id`, `Codigo`) VALUES
(1, 'Departamento de Ingenieria Industrial', 'www,dii.uchile.cl', 2, 'IN'),
(2, 'Departamento de Ciencias de la Computacion', 'www.dcc.uchile.cl', 8, 'CC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario_curso`
--

CREATE TABLE `rol_usuario_curso` (
  `id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_usuario_curso`
--

INSERT INTO `rol_usuario_curso` (`id`, `tipo_usuario_id`, `cursos_id`, `usuarios_id`) VALUES
(1, 3, 1, 2),
(2, 3, 2, 5),
(3, 3, 5, 7),
(4, 4, 2, 3),
(5, 4, 2, 4),
(6, 5, 2, 6),
(7, 6, 5, 6),
(8, 6, 1, 6),
(9, 6, 6, 6),
(10, 6, 2, 10),
(11, 6, 3, 10),
(12, 6, 6, 10),
(13, 6, 4, 10),
(14, 6, 7, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestres`
--

CREATE TABLE `semestres` (
  `id` int(11) NOT NULL,
  `Nombre_Semestre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `semestres`
--

INSERT INTO `semestres` (`id`, `Nombre_Semestre`) VALUES
(1, 'Otoño'),
(2, 'Primavera'),
(3, 'Verano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `Nombre`) VALUES
(1, 'Administrador'),
(2, 'Secretaria'),
(3, 'Profesor'),
(4, 'Auxiliar'),
(5, 'Ayudante'),
(6, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(64) NOT NULL,
  `Apellido` varchar(64) NOT NULL,
  `Direccion` varchar(128) NOT NULL,
  `RUT` varchar(32) NOT NULL,
  `Puntaje_PSU` double NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Nombre`, `Apellido`, `Direccion`, `RUT`, `Puntaje_PSU`, `username`, `password`, `email`) VALUES
(1, 'Angel', 'Jimenez', 'Rancagua', '11.111.111-1', 850, 'admin', 'pass', ''),
(2, 'Maximiliano', 'Rojas', 'República 701', '22.222.222-2', 578, 'vrebolle', 'pass', ''),
(3, 'Giorgio', 'Parra', 'Beaucheff 850', '33.333.333-3', 240, 'giorgio', 'pass', ''),
(4, 'Felipe', 'Maldonado', 'Singapour 100', '44.444.444-4', 770, 'gustolo', 'pass', ''),
(5, 'Juan', 'Velasquez', 'Beaucheff 851', '55.555.555-5', 800, 'jvelasqu', 'pass', ''),
(6, 'Nicolas', 'Malbran', 'Beaucheff 850', '66.666.666-6', 800, 'nmalbran', 'pass', ''),
(7, 'Anibal', 'Urzua', 'Beaucheff 850', '77.777.777-7', 850, 'jurzua', 'pass', ''),
(8, 'Nancy', 'Hitschfeld', 'Beaucheff 850', '88.888.888-8', 850, 'nancy', 'pass', ''),
(9, 'Margarita', 'Borbarán', 'Américo Vespucio #345', '99.999.999-9', 850, 'margarit', 'pass', ''),
(10, 'Elsa', 'Pallo', 'Pelotillehue', '10.100.100-0', 750, 'alum', 'pass', ''),
(11, 'Ignacio', 'Vargas', 'Beauchef 851', '1-k', 720, 'nacho', '12345', 'ignacio.vargas@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tipo_usuario`
--

CREATE TABLE `usuario_tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_tipo_usuario`
--

INSERT INTO `usuario_tipo_usuario` (`id`, `tipo_usuario_id`, `usuarios_id`) VALUES
(1, 1, 1),
(3, 4, 1),
(4, 4, 4),
(5, 4, 3),
(6, 3, 5),
(7, 3, 2),
(8, 6, 10),
(9, 5, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos_semestres` (`semestres_id`),
  ADD KEY `fk_cursos_departamento1` (`departamento_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento_usuarios1` (`Jefe_depto_id`);

--
-- Indices de la tabla `rol_usuario_curso`
--
ALTER TABLE `rol_usuario_curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rol_usuario_curso_tipo_usuario1` (`tipo_usuario_id`),
  ADD KEY `fk_rol_usuario_curso_cursos1` (`cursos_id`),
  ADD KEY `fk_rol_usuario_curso_usuarios1` (`usuarios_id`);

--
-- Indices de la tabla `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_tipo_usuario`
--
ALTER TABLE `usuario_tipo_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipo_usuario_tipo_usuario1` (`tipo_usuario_id`),
  ADD KEY `fk_usuario_tipo_usuario_usuarios1` (`usuarios_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rol_usuario_curso`
--
ALTER TABLE `rol_usuario_curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `semestres`
--
ALTER TABLE `semestres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `usuario_tipo_usuario`
--
ALTER TABLE `usuario_tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_departamento1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cursos_semestres` FOREIGN KEY (`semestres_id`) REFERENCES `semestres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_departamento_usuarios1` FOREIGN KEY (`Jefe_depto_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_usuario_curso`
--
ALTER TABLE `rol_usuario_curso`
  ADD CONSTRAINT `fk_rol_usuario_curso_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_usuario_curso_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_usuario_curso_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_tipo_usuario`
--
ALTER TABLE `usuario_tipo_usuario`
  ADD CONSTRAINT `fk_usuario_tipo_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipo_usuario_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
