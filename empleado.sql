-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2019 a las 01:37:15
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `codigoemp` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fechanacimiento` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `dui` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(17) COLLATE utf8_spanish_ci NOT NULL,
  `nseguro` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nafp` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `fechacontrato` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` int(11) NOT NULL,
  `sueldo` double NOT NULL,
  `usuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `contra` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `codigoemp`, `nombre`, `sexo`, `fechanacimiento`, `direccion`, `dui`, `nit`, `nseguro`, `nafp`, `telefono`, `fechacontrato`, `cargo`, `sueldo`, `usuario`, `contra`) VALUES
(3, 'BEIjf', 'juan sad', 'MASCULINO', '2000-12-15', 'sad', '23333333-3', '3332-333333-333-3', '2333333333', '233333333333', '23', '2019-01-18', 1, 220, 'BEIjf', 'W3TRS'),
(4, 'wDKTG', 'asd', 'FEMENINO', '2000-12-08', 'asd', '32423423-4', '2342-342352-346-3', '3425223452', '324534252345', '232342342', '2019-01-25', 2, 435, 'wDKTG', 'U4=Wg'),
(5, '9RRnp', 'wqe', 'MASCULINO', '2000-12-14', 'sdfdsfdf', '21321312-3', '3243-243333-333-3', '2342353453', '787675643552', '312312312', '2019-01-15', 4, 324, '9RRnp', '/XzJq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
