-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2022 a las 18:34:59
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gpabd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `Categoria` varchar(250) NOT NULL,
  `Estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Empresa` varchar(250) NOT NULL,
  `Nombre` varchar(250) DEFAULT NULL,
  `Apellidos` varchar(250) DEFAULT NULL,
  `NombreFiscal` varchar(250) DEFAULT NULL,
  `Nif` varchar(30) DEFAULT NULL,
  `Mail` varchar(250) DEFAULT NULL,
  `Movil` varchar(200) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL,
  `RutaImagen` varchar(250) DEFAULT NULL,
  `TipoEmpresa` varchar(250) DEFAULT NULL,
  `Estado` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `Parametro` varchar(250) NOT NULL,
  `Valor` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `IdDocumento` int(20) NOT NULL,
  `NumeroDocumento` int(20) NOT NULL,
  `SerieDocumento` varchar(20) DEFAULT NULL,
  `FechaRegistro` date DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdProyecto` int(11) DEFAULT NULL,
  `TipoDocumento` varchar(250) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `IdEtiqueta` int(11) NOT NULL,
  `Etiqueta` varchar(250) NOT NULL,
  `Estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasdocumentos`
--

CREATE TABLE `lineasdocumentos` (
  `IdLinea` int(20) NOT NULL,
  `IdDocumento` int(20) NOT NULL,
  `IdSerie` int(20) NOT NULL,
  `IdCliente` int(20) NOT NULL,
  `IdProyecto` int(20) NOT NULL,
  `TipoDocumento` varchar(250) NOT NULL,
  `IdProducto` int(20) NOT NULL,
  `NombreProducto` varchar(250) NOT NULL,
  `Cantidad` float NOT NULL,
  `PrecioUnitario` float NOT NULL,
  `Descuento` float NOT NULL,
  `Iva` int(20) NOT NULL,
  `Pendiente` float NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(20) NOT NULL,
  `Producto` varchar(250) NOT NULL,
  `Precio` float NOT NULL,
  `RutaImagen` varchar(250) NOT NULL,
  `Iva` varchar(250) NOT NULL,
  `CodigoBarras` varchar(250) NOT NULL,
  `CodigoQR` varchar(250) NOT NULL,
  `Referencia` varchar(250) NOT NULL,
  `Tiempo` float NOT NULL,
  `Estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Producto`, `Precio`, `RutaImagen`, `Iva`, `CodigoBarras`, `CodigoQR`, `Referencia`, `Tiempo`, `Estado`) VALUES
(0, 'menuvueltoacambiar', 0, 'string', 'string', 'string', 'string', 'string', 0, 'string'),
(1, 'cocacola', 2, 'tal', '10', '213214', '1234421', '12314', 0, 'Activo'),
(2, 'Fanta', 3, 'taltal', '10', '1232134', '45235423', '54325', 0, 'Activo'),
(3, 'Fanta', 3, 'taltal', '10', '1232134', '45235423', '54325', 0, 'Activo'),
(4, 'Herbes Moya', 0, 'string', 'string', 'string', 'string', 'string', 0, 'string');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoscategorias`
--

CREATE TABLE `productoscategorias` (
  `IdProducto` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `Orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosetiquetas`
--

CREATE TABLE `productosetiquetas` (
  `IdProducto` int(11) NOT NULL,
  `IdEtiqueta` int(11) NOT NULL,
  `Orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `IdProyecto` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL DEFAULT 0,
  `NombreProyecto` varchar(250) DEFAULT NULL,
  `Descripcion` varchar(2500) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Empresa` varchar(250) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Apellidos` varchar(250) DEFAULT NULL,
  `NombreFiscal` varchar(250) DEFAULT NULL,
  `Token` varchar(250) NOT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Imagen` varchar(150) DEFAULT NULL,
  `Perfil` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`IdDocumento`),
  ADD KEY `FK_documentos_clientes` (`IdCliente`),
  ADD KEY `FK_documentos_proyectos` (`IdProyecto`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`IdEtiqueta`);

--
-- Indices de la tabla `lineasdocumentos`
--
ALTER TABLE `lineasdocumentos`
  ADD PRIMARY KEY (`IdLinea`,`IdDocumento`,`IdSerie`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `productoscategorias`
--
ALTER TABLE `productoscategorias`
  ADD KEY `FK_productoscategorias_productos` (`IdProducto`),
  ADD KEY `FK_productoscategorias_categorias` (`IdCategoria`);

--
-- Indices de la tabla `productosetiquetas`
--
ALTER TABLE `productosetiquetas`
  ADD KEY `FK_productosetiquetas_productos` (`IdProducto`),
  ADD KEY `FK_productosetiquetas_etiquetas` (`IdEtiqueta`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`IdProyecto`),
  ADD KEY `FK_proyectos_clientes` (`IdCliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `FK_documentos_clientes` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  ADD CONSTRAINT `FK_documentos_proyectos` FOREIGN KEY (`IdProyecto`) REFERENCES `proyectos` (`IdProyecto`);

--
-- Filtros para la tabla `productoscategorias`
--
ALTER TABLE `productoscategorias`
  ADD CONSTRAINT `FK_productoscategorias_categorias` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`),
  ADD CONSTRAINT `FK_productoscategorias_productos` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `productosetiquetas`
--
ALTER TABLE `productosetiquetas`
  ADD CONSTRAINT `FK_productosetiquetas_etiquetas` FOREIGN KEY (`IdEtiqueta`) REFERENCES `etiquetas` (`IdEtiqueta`),
  ADD CONSTRAINT `FK_productosetiquetas_productos` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `FK_proyectos_clientes` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
