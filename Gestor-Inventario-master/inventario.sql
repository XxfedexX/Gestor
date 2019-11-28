-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2019 a las 19:51:59
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabecerafactura`
--

CREATE TABLE `cabecerafactura` (
  `cod_factura` int(50) NOT NULL,
  `CodigoCliente` int(50) NOT NULL,
  `NombreEmpleado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cabecerafactura`
--

INSERT INTO `cabecerafactura` (`cod_factura`, `CodigoCliente`, `NombreEmpleado`, `Fecha`) VALUES
(111, 6, 'Damian', '16/11/19'),
(222, 5, 'Marcos', '15/11/19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `documento`, `nombre`, `apellido`, `correo`) VALUES
(4, 39491568, 'Pablo', 'Limon', 'pablin@hotmail.com'),
(5, 39556884, 'Sofia', 'Uva', 'Sofi@hotmail.com'),
(6, 38461564, 'Martin', 'Misterio', 'miste@hotmail.com'),
(7, 38475512, 'Dante', 'Naranjo', 'Dan@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `cod_producto` int(50) NOT NULL,
  `Nom_producto` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `total` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`cod_factura`, `cod_producto`, `Nom_producto`, `cantidad`, `precio`, `total`) VALUES
(111, 29, 'Red dead redemption 2', 1, 3758, 3758),
(222, 29, 'Red dead redemption 2', 1, 3758, 3758);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `apellido` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_comercial` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `apellido`, `nombre_comercial`, `telefono`) VALUES
(1, 'Lucia', 'Limon', 'NvidiaGames', 1544365521),
(2, 'Carla', 'Pastel', 'HDgames', 1544389658);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `id_juegos` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `plataforma` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `genero` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`id_juegos`, `nombre`, `precio_venta`, `plataforma`, `stock`, `genero`, `id_proveedor`) VALUES
(27, 'Sekiro', 650, 'Multi', 250, 'Aventura', 1),
(28, 'Borderlands 3', 1600, 'Multi', 150, 'Accion', 1),
(29, 'Red dead redemption 2', 3758, 'Multi', 500, 'Open world', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cabecerafactura`
--
ALTER TABLE `cabecerafactura`
  ADD PRIMARY KEY (`cod_factura`),
  ADD KEY `CodigoCliente` (`CodigoCliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `documento` (`documento`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD KEY `nomproducto` (`cod_producto`),
  ADD KEY `total` (`total`),
  ADD KEY `cod_factura` (`cod_factura`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `nombre_comercial` (`nombre_comercial`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`id_juegos`),
  ADD KEY `stock` (`stock`),
  ADD KEY `nombre` (`nombre`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `id_juegos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cabecerafactura`
--
ALTER TABLE `cabecerafactura`
  ADD CONSTRAINT `cabecerafactura_ibfk_1` FOREIGN KEY (`CodigoCliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `videojuegos` (`id_juegos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`cod_factura`) REFERENCES `cabecerafactura` (`cod_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
