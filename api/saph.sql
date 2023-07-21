-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2023 a las 22:53:30
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `saph`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`identificacion`, `nombre`, `correo`, `apellido`, `contrasena`, `rol`, `genero`) VALUES
('0923742', 'lourdes', 'lour123@unibarranquilla.edu.co', 'avilla', '123', 'administrador', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `Id_calificacion` varchar(20) NOT NULL,
  `Id_trabajador` varchar(20) NOT NULL,
  `Estrella` varchar(20) NOT NULL,
  `Id_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`Id_calificacion`, `Id_trabajador`, `Estrella`, `Id_usuario`) VALUES
('1', '1145361883', '5', '1239293');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `Id_trabajador` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Edad` varchar(20) NOT NULL,
  `Profesion` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`Id_trabajador`, `Nombre`, `Apellido`, `Edad`, `Profesion`, `Telefono`) VALUES
('1145361883', 'ruben', 'lopez', '23', 'ingeniero','3116268382');
INSERT INTO `trabajador` (`Id_trabajador`, `Nombre`, `Apellido`, `Edad`, `Profesion`, `Telefono`) VALUES
('11453623213', 'brian', 'tapias', '19', 'ingeniero','30012412');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Edad` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `Nombre`, `Apellido`, `Edad`, `Telefono`) VALUES
('1239293', 'luis', 'lopez', '18', '3123435355');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`, `rol`, `genero`) VALUES
(1, 'ruben', 'rub@unibarranquilla.edu.co', '123', 'administrador', ''),
(2, 'brian', 'briat@unibarranquilla.edu.co', '123', 'administrador', ''),
(3, 'lourdes', 'lordesa@unibarranquilla.edu.co', '123', 'asesor', ''),
(4, 'Lourdes', 'ldesr@unibarranquilla.edu.co', '12345', 'administrador', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_trabajador`
--

CREATE TABLE `usuario_trabajador` (
  `Id_ut` varchar(20) NOT NULL,
  `id_usuario` varchar(20) NOT NULL,
  `id_trabajador` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_trabajador`
--

INSERT INTO `usuario_trabajador` (`Id_ut`, `id_usuario`, `id_trabajador`) VALUES
('1', '1239293', '1145361883'),
('2', '1239293', '11453623213');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`Id_calificacion`),
  ADD UNIQUE KEY `Id_trabajador` (`Id_trabajador`,`Id_usuario`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`Id_trabajador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_trabajador`
--
ALTER TABLE `usuario_trabajador`
  ADD PRIMARY KEY (`Id_ut`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_trabajador`),
  ADD KEY `usuario_trabajador_ibfk_1` (`id_trabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2902;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`Id_trabajador`) REFERENCES `trabajador` (`Id_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_trabajador`
--
ALTER TABLE `usuario_trabajador`
  ADD CONSTRAINT `usuario_trabajador_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`Id_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_trabajador_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
