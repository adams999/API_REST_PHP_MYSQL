-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2021 a las 06:49:57
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trans_all_api`
--

CREATE TABLE `trans_all_api` (
  `trans_id` int(11) NOT NULL,
  `trans_body` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `trans_resp` text COLLATE utf8_spanish_ci NOT NULL,
  `trans_ip` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `trans_func` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `trans_uri` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `trans_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `trans_all_api`
--
ALTER TABLE `trans_all_api`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_func` (`trans_func`),
  ADD KEY `trans_date` (`trans_date`);

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
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trans_all_api`
--
ALTER TABLE `trans_all_api`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trans_errors`
--
ALTER TABLE `trans_errors`
  MODIFY `trans_err_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
