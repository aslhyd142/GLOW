-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2026 a las 06:49:08
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `glow_girl`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_servicios`
--

CREATE TABLE `categorias_servicios` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_servicios`
--

INSERT INTO `categorias_servicios` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Peluquería', 'Cortes, tintes, cepillados y tratamientos capilares'),
(2, 'Nails', 'Manicure, pedicure, uñas acrílicas y semipermanentes'),
(3, 'Lashista', 'Extensiones de pestañas pelo a pelo y lifting'),
(4, 'Skincare', 'Limpiezas faciales profundas e hidratación'),
(5, 'Makeup', 'Maquillaje profesional para eventos y sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_peluqueria` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_profesional` int(11) NOT NULL,
  `fecha_hora_cita` datetime NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `calificacion` int(11) DEFAULT NULL,
  `comentario_calificacion` text DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_cliente`, `id_peluqueria`, `id_servicio`, `id_profesional`, `fecha_hora_cita`, `estado`, `calificacion`, `comentario_calificacion`, `fecha_creacion`) VALUES
(1, 1, 1, 1, 1, '2026-08-01 10:15:00', 'Finalizada', 5, 'Excelente atención en Luxury Hair', '2026-11-17 00:31:51'),
(2, 2, 2, 3, 3, '2026-08-03 14:30:00', 'Finalizada', 4, 'Hermosas uñas en Studio Élite', '2026-11-17 00:31:51'),
(3, 1, 1, 9, 2, '2026-08-10 09:00:00', 'Finalizada', 5, 'Muy buen resultado', '2026-11-17 00:31:51'),
(4, 3, 3, 5, 4, '2026-08-15 16:45:00', 'Finalizada', 5, 'Las pestañas quedaron perfectas', '2026-11-17 00:31:51'),
(5, 4, 1, 2, 1, '2026-08-20 11:20:00', 'Cancelada', NULL, NULL, '2026-11-17 00:31:51'),
(6, 5, 4, 6, 5, '2026-09-02 08:10:00', 'Pendiente', NULL, NULL, '2026-11-17 00:31:51'),
(7, 6, 3, 7, 4, '2026-09-05 19:00:00', 'Finalizada', 4, 'Excelente maquillaje social', '2026-11-17 00:31:51'),
(8, 2, 5, 8, 6, '2026-09-12 12:00:00', 'Confirmada', NULL, NULL, '2026-11-17 00:31:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `tipo_documento` varchar(5) NOT NULL DEFAULT 'CC',
  `numero_documento` varchar(20) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ciudad_residencia` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `tipo_documento`, `numero_documento`, `nombres`, `apellidos`, `email`, `telefono`, `ciudad_residencia`, `fecha_registro`) VALUES
(1, 'CC', '1001001001', 'Ana Maria', 'Gomez Ruiz', 'ana.gomez@correo.com', '3001112233', 'Bogota', '2026-11-17 00:18:32'),
(2, 'CC', '1002002002', 'Carlos Andres', 'Perez Diaz', 'carlos.perez@correo.com', '3002223344', 'Medellin', '2026-11-17 00:18:32'),
(3, 'CC', '1003003003', 'Luisa Fernanda', 'Martinez Rios', 'luisa.martinez@correo.com', '3023334455', 'Cali', '2026-11-17 00:18:32'),
(4, 'TI', '1004004004', 'Juan David', 'Restrepo Toro', 'juan.restrepo@correo.com', '3034445566', 'Bogota', '2026-11-17 00:18:32'),
(5, 'CE', '1005005005', 'Valentina', 'Herrera Lopez', 'valentina.herrera@correo.com', '3045556677', 'Barranquilla', '2026-11-17 00:18:32'),
(6, 'CC', '1006006006', 'Santiago', 'Ramirez Castro', 'santiago.ramirez@correo.com', '3056667788', 'Medellin', '2026-11-17 00:18:32'),
(7, 'CC', '1007007007', 'Daniela', 'Ospina Vargas', 'daniela.ospina@correo.com', '3066677888', 'Pereira', '2026-11-17 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `tipo_mensaje` varchar(50) NOT NULL DEFAULT 'RECORDATORIO_24H',
  `canal` varchar(20) NOT NULL DEFAULT 'EMAIL',
  `estado_envio` varchar(20) NOT NULL DEFAULT 'Enviado',
  `fecha_envio` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_notificacion`, `id_cita`, `tipo_mensaje`, `canal`, `estado_envio`, `fecha_envio`) VALUES
(1, 1, 'RECORDATORIO_24H', 'EMAIL', 'Enviada', '2026-11-17 00:32:50'),
(2, 2, 'RECORDATORIO_24H', 'WHATSAPP', 'Enviada', '2026-11-17 00:32:50'),
(3, 3, 'RECORDATORIO_24H', 'EMAIL', 'Enviada', '2026-11-17 00:32:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluquerias`
--

CREATE TABLE `peluquerias` (
  `id_peluqueria` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `nombre_salon` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `peluquerias`
--

INSERT INTO `peluquerias` (`id_peluqueria`, `nit`, `nombre_salon`, `direccion`, `ciudad`, `telefono`, `email`, `estado`, `activo`, `fecha_registro`) VALUES
(1, '900123456-1', 'Luxury Hair & Spa', 'Calle 93 # 15-42', 'Bogota', '3101112233', 'contacto@luxuryhair.com', 'Activa', 1, '2026-11-17 00:16:50'),
(2, '900654321-2', 'Studio Élite Nails & Makeup', 'Cra. 43A # 10-21', 'Medellin', '3202223344', 'info@elite-studio.com', 'Activa', 1, '2026-11-17 00:16:50'),
(3, '900987654-3', 'Peluquería Sensación Cali', 'Calle 5 # 38-10', 'Cali', '3153334455', 'citas@sensacioncali.com', 'Activa', 1, '2026-11-17 00:16:50'),
(4, '900112233-4', 'Caribe Lash & Skincare', 'Calle 72 # 54-21', 'Barranquilla', '3004445566', 'caribeskincare@correo.com', 'Pendiente', 1, '2026-11-17 00:16:50'),
(5, '900445566-5', 'Encanto Estética Integral', 'Cra. 7 # 22-14', 'Pereira', '3125556677', 'encanto@estetica.com', 'Activa', 1, '2026-11-17 00:16:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id_profesional` int(11) NOT NULL,
  `id_peluqueria` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesionales`
--

INSERT INTO `profesionales` (`id_profesional`, `id_peluqueria`, `nombres`, `apellidos`, `especialidad`, `activo`) VALUES
(1, 1, 'Camila', 'Rojas Soto', 'Master Colorista', 1),
(2, 1, 'Andrea', 'Pérez Gómez', 'Especialista Capilar', 1),
(3, 2, 'Julian', 'Mejía Marín', 'Nail Artist', 1),
(4, 3, 'Sofia', 'Castillo Ruiz', 'Lashista Profesional', 1),
(5, 4, 'Marcela', 'Henao Restrepo', 'Cosmetóloga', 1),
(6, 5, 'Diana', 'Torres Melo', 'Estilista Integral', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_peluqueria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(12,2) NOT NULL,
  `duracion_minutos` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `id_categoria`, `id_peluqueria`, `nombre`, `descripcion`, `precio`, `duracion_minutos`, `activo`, `fecha_registro`) VALUES
(1, 1, 1, 'Corte Moderno y Blower', 'Corte con asesoría de imagen y cepillado', 50000.00, 50, 1, '2026-11-17 00:17:34'),
(2, 1, 1, 'Balayage Premium', 'Técnica de coloración en tendencia', 250000.00, 180, 1, '2026-11-17 00:17:34'),
(3, 2, 2, 'Manicure Semipermanente', 'Esmaltado de larga duración', 35000.00, 60, 1, '2026-11-17 00:17:34'),
(4, 2, 2, 'Uñas Acrílicas Esculpidas', 'Extensiones en acrílico con diseño', 95000.00, 120, 1, '2026-11-17 00:17:34'),
(5, 3, 3, 'Extensiones Pelo a Pelo', 'Efecto rímel natural', 90000.00, 90, 1, '2026-11-17 00:17:34'),
(6, 4, 4, 'Limpieza Facial Profunda', 'Incluye alta frecuencia y vapor', 120000.00, 75, 1, '2026-11-17 00:17:34'),
(7, 5, 3, 'Maquillaje Social y Glam', 'Maquillaje profesional de alta duración', 110000.00, 60, 1, '2026-11-17 00:17:34'),
(8, 1, 5, 'Tratamiento de Keratina', 'Alisado e hidratación profunda', 160000.00, 120, 1, '2026-11-17 00:17:34'),
(9, 3, 1, 'Lifting de Pestañas', 'Curvatura orgánica con nutrición', 75000.00, 45, 1, '2026-11-17 00:17:34'),
(10, 2, 5, 'Pedicure Spa Relax', 'Exfoliación, mascarilla y esmalte', 45000.00, 50, 1, '2026-11-17 00:17:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `salt` char(32) NOT NULL,
  `rol` varchar(30) NOT NULL DEFAULT 'CLIENTE',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `intentos_fallidos` int(11) NOT NULL DEFAULT 0,
  `bloqueado` tinyint(1) NOT NULL DEFAULT 0,
  `ultimo_acceso` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_cliente`, `nombre_usuario`, `email`, `password_hash`, `salt`, `rol`, `activo`, `intentos_fallidos`, `bloqueado`, `ultimo_acceso`, `fecha_creacion`) VALUES
(1, 1, 'ana_gomez', 'ana.gomez@correo.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'abc123saltsecure4567890123456789', 'CLIENTE', 1, 0, 0, NULL, '2026-11-17 00:43:15'),
(2, 2, 'carlos_perez', 'carlos.perez@correo.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'xyz789saltsecure1234567890123456', 'CLIENTE', 1, 0, 0, NULL, '2026-11-17 00:43:15'),
(3, NULL, 'admin_general', 'admin@glowgirl.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'adminsecuretoken9998887776665432', 'ADMIN_GENERAL', 1, 0, 0, NULL, '2026-11-17 00:43:15'),
(4, NULL, 'admin_luxury', 'contacto@luxuryhair.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'salthelperluxury1112223334445556', 'ADMIN_PELUQUERIA', 1, 0, 0, NULL, '2026-11-17 00:43:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_servicios`
--
ALTER TABLE `categorias_servicios`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `uq_categorias_nombre` (`nombre`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `fk_citas_clientes` (`id_cliente`),
  ADD KEY `fk_citas_peluquerias` (`id_peluqueria`),
  ADD KEY `fk_citas_servicios` (`id_servicio`),
  ADD KEY `fk_citas_profesionales` (`id_profesional`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uq_clientes_documento` (`numero_documento`),
  ADD UNIQUE KEY `uq_clientes_email` (`email`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `fk_notificaciones_citas` (`id_cita`);

--
-- Indices de la tabla `peluquerias`
--
ALTER TABLE `peluquerias`
  ADD PRIMARY KEY (`id_peluqueria`),
  ADD UNIQUE KEY `uq_peluquerias_nit` (`nit`),
  ADD UNIQUE KEY `uq_peluquerias_email` (`email`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id_profesional`),
  ADD KEY `fk_profesionales_peluquerias` (`id_peluqueria`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_servicios_categorias` (`id_categoria`),
  ADD KEY `fk_servicios_peluquerias` (`id_peluqueria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uq_usuarios_nombre` (`nombre_usuario`),
  ADD UNIQUE KEY `uq_usuarios_email` (`email`),
  ADD KEY `fk_usuarios_clientes` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_servicios`
--
ALTER TABLE `categorias_servicios`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `peluquerias`
--
ALTER TABLE `peluquerias`
  MODIFY `id_peluqueria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id_profesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_citas_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_citas_peluquerias` FOREIGN KEY (`id_peluqueria`) REFERENCES `peluquerias` (`id_peluqueria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_citas_profesionales` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_citas_servicios` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_notificaciones_citas` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD CONSTRAINT `fk_profesionales_peluquerias` FOREIGN KEY (`id_peluqueria`) REFERENCES `peluquerias` (`id_peluqueria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_servicios_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_servicios` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_peluquerias` FOREIGN KEY (`id_peluqueria`) REFERENCES `peluquerias` (`id_peluqueria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
