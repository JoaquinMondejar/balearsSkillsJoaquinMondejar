-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: bbddsrv17.dondominio.com
-- Tiempo de generación: 26-11-2018 a las 13:58:25
-- Versión del servidor: 10.1.26-MariaDB-0+deb9u1
-- Versión de PHP: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ddb118666`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ALLOTJAMENT`
--

CREATE TABLE `ALLOTJAMENT` (
  `num_registre` int(4) NOT NULL,
  `dni_propietari` varchar(9) NOT NULL,
  `id_serveis` int(4) NOT NULL,
  `id_tipusAllot` int(4) NOT NULL,
  `id_tipusVac` int(4) NOT NULL,
  `id_idioma` int(4) NOT NULL,
  `categoria` varchar(24) NOT NULL,
  `habitacions` int(2) DEFAULT NULL,
  `num_persones` int(2) DEFAULT NULL,
  `nom_comercial` varchar(32) NOT NULL,
  `municipi` varchar(32) DEFAULT NULL,
  `adressa` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FOTO`
--

CREATE TABLE `FOTO` (
  `id` int(4) NOT NULL,
  `num_registre` int(4) NOT NULL,
  `foto` varchar(42) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IDIOMA`
--

CREATE TABLE `IDIOMA` (
  `id` int(4) NOT NULL,
  `idioma` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROPIETARI`
--

CREATE TABLE `PROPIETARI` (
  `dni` varchar(9) NOT NULL,
  `id_idioma` int(4) NOT NULL,
  `nom` varchar(24) DEFAULT NULL,
  `llinatge` varchar(42) DEFAULT NULL,
  `telefon` int(9) NOT NULL,
  `contrasenya` varchar(124) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RESERVA`
--

CREATE TABLE `RESERVA` (
  `id_reserva` int(4) NOT NULL,
  `id_usuario` int(4) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_sortida` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERVEI`
--

CREATE TABLE `SERVEI` (
  `id` int(4) NOT NULL,
  `id_idioma` int(4) NOT NULL,
  `servei` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SERVEI_ALLOT`
--

CREATE TABLE `SERVEI_ALLOT` (
  `num_registre` int(4) NOT NULL,
  `id_servei` int(4) NOT NULL,
  `id_idioma` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPUS_ALLOTJAMENT`
--

CREATE TABLE `TIPUS_ALLOTJAMENT` (
  `id` int(4) NOT NULL,
  `id_idioma` int(4) NOT NULL,
  `tipus_allotjament` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPUS_VACANCES`
--

CREATE TABLE `TIPUS_VACANCES` (
  `id` int(4) NOT NULL,
  `id_idioma` int(4) NOT NULL,
  `tipus_Vacances` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARI`
--

CREATE TABLE `USUARI` (
  `id` int(4) NOT NULL,
  `nom` varchar(24) DEFAULT NULL,
  `email` varchar(42) NOT NULL,
  `contrasenya` varchar(42) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARI_COMENTA`
--

CREATE TABLE `USUARI_COMENTA` (
  `id_usuari` int(4) NOT NULL,
  `num_registre` int(4) NOT NULL,
  `dia` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARI_VALORA`
--

CREATE TABLE `USUARI_VALORA` (
  `id_usuari` int(4) NOT NULL,
  `num_registre` int(4) NOT NULL,
  `puntuacio` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ALLOTJAMENT`
--
ALTER TABLE `ALLOTJAMENT`
  ADD PRIMARY KEY (`num_registre`),
  ADD KEY `dni_propietari` (`dni_propietari`),
  ADD KEY `id_serveis` (`id_serveis`),
  ADD KEY `id_tipusAllot` (`id_tipusAllot`),
  ADD KEY `id_tipusVac` (`id_tipusVac`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `FOTO`
--
ALTER TABLE `FOTO`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_registre` (`num_registre`);

--
-- Indices de la tabla `IDIOMA`
--
ALTER TABLE `IDIOMA`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `PROPIETARI`
--
ALTER TABLE `PROPIETARI`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `RESERVA`
--
ALTER TABLE `RESERVA`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `SERVEI`
--
ALTER TABLE `SERVEI`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `SERVEI_ALLOT`
--
ALTER TABLE `SERVEI_ALLOT`
  ADD PRIMARY KEY (`num_registre`,`id_servei`),
  ADD KEY `id_servei` (`id_servei`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `TIPUS_ALLOTJAMENT`
--
ALTER TABLE `TIPUS_ALLOTJAMENT`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `TIPUS_VACANCES`
--
ALTER TABLE `TIPUS_VACANCES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idioma` (`id_idioma`);

--
-- Indices de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `USUARI_COMENTA`
--
ALTER TABLE `USUARI_COMENTA`
  ADD PRIMARY KEY (`id_usuari`,`num_registre`),
  ADD KEY `num_registre` (`num_registre`);

--
-- Indices de la tabla `USUARI_VALORA`
--
ALTER TABLE `USUARI_VALORA`
  ADD PRIMARY KEY (`id_usuari`,`num_registre`),
  ADD KEY `num_registre` (`num_registre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ALLOTJAMENT`
--
ALTER TABLE `ALLOTJAMENT`
  MODIFY `num_registre` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `FOTO`
--
ALTER TABLE `FOTO`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `IDIOMA`
--
ALTER TABLE `IDIOMA`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RESERVA`
--
ALTER TABLE `RESERVA`
  MODIFY `id_reserva` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SERVEI`
--
ALTER TABLE `SERVEI`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TIPUS_ALLOTJAMENT`
--
ALTER TABLE `TIPUS_ALLOTJAMENT`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TIPUS_VACANCES`
--
ALTER TABLE `TIPUS_VACANCES`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARI`
--
ALTER TABLE `USUARI`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
