-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2021 a las 02:50:40
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_php_mysql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cat_obs` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `cat_est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cat_id`, `cat_nom`, `cat_obs`, `cat_est`) VALUES
(1, 'televisor', 'televisores dev', 0),
(2, 'dev', 'Ramirez Contreras', 1),
(3, 'carros', 'carros dev', 0),
(4, 'lavadoras', 'lavadoras dev', 1),
(5, 'Adams', 'Developer', 1),
(6, 'Omaira', 'Ramirez', 1),
(7, 'Juhantonny', 'Ramirez Contreras', 1),
(8, 'julian', 'contreras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trans_errors`
--

CREATE TABLE `trans_errors` (
  `trans_err_id` int(11) NOT NULL,
  `trans_err_code` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `trans_err_desc_eng` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `trans_err_desc_spa` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trans_errors`
--

INSERT INTO `trans_errors` (`trans_err_id`, `trans_err_code`, `trans_err_desc_eng`, `trans_err_desc_spa`) VALUES
(1, '0001', 'Id_Empty', 'Id_Vacio'),
(2, '0002', 'Name_Empty', 'Nombre_Vacio'),
(3, '0003', 'Description_Empty', 'Descripcion_Vacia'),
(4, '0004', 'Not_Data', 'Sin_Registros'),
(5, '0005', 'Method_Not_Soported', 'Metodo_No_Soportado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `trans_errors`
--
ALTER TABLE `trans_errors`
  ADD PRIMARY KEY (`trans_err_id`),
  ADD UNIQUE KEY `trans_err_code` (`trans_err_code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `trans_errors`
--
ALTER TABLE `trans_errors`
  MODIFY `trans_err_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
