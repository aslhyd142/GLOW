-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 21:53:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categ` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categ`, `categoria`) VALUES
(1, 'Peluqueria'),
(2, 'Nails'),
(3, 'Lashista'),
(4, 'Skincare'),
(5, 'Makeup');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_clien` varchar(50) NOT NULL,
  `ape_clie` varchar(50) NOT NULL,
  `numdoc` varchar(11) NOT NULL,
  `tlf` varchar(11) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `tipodoc` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_clien`, `ape_clie`, `numdoc`, `tlf`, `correo`, `tipodoc`) VALUES
(1, 'Ana Maria', 'Gomez Ruiz', '1001001001', '3001112233', 'ana@correo.com', 'CC'),
(2, 'Carlos', 'Perez Diaz', '1002002002', '3002223344', 'carlos@correo.com', 'CC'),
(3, 'Luisa', 'Martinez Rios', '1003003003', '3023334455', 'luisa@correo.com', 'CC'),
(4, 'Juan David', 'Restrepo', '1004004004', '3034445566', 'juan@correo.com', 'TI'),
(5, 'Valentina', 'Herrera', '1005005005', '3045556677', 'val@correo.com', 'CE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotospe`
--

CREATE TABLE `fotospe` (
  `id_fotospe` int(11) NOT NULL,
  `fotos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fotospe`
--

INSERT INTO `fotospe` (`id_fotospe`, `fotos`) VALUES
(1, 'salon_luxury_1.jpg'),
(2, 'salon_elite_1.jpg'),
(3, 'salon_sensacion_1.jpg'),
(4, 'salon_caribe_1.jpg'),
(5, 'salon_encanto_1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotosser`
--

CREATE TABLE `fotosser` (
  `id_fotosser` int(11) NOT NULL,
  `fotosser` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fotosser`
--

INSERT INTO `fotosser` (`id_fotosser`, `fotosser`) VALUES
(1, 'corte_blower.jpg'),
(2, 'balayage.jpg'),
(3, 'manicure_semi.jpg'),
(4, 'unas_acrilicas.jpg'),
(5, 'pestanas_pelo.jpg'),
(6, 'limpieza_facial.jpg'),
(7, 'maquillaje_social.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_hor` int(11) NOT NULL,
  `dia_sem` int(11) NOT NULL,
  `hora_ini` varchar(10) NOT NULL,
  `horafin` varchar(10) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `Trabajadorid_trab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_hor`, `dia_sem`, `hora_ini`, `horafin`, `estado`, `Trabajadorid_trab`) VALUES
(1, 2, '08:00:00', '17:00:00', 'Disponible', 1),
(2, 3, '09:00:00', '18:00:00', 'Disponible', 2),
(3, 4, '09:00:00', '19:00:00', 'Disponible', 3),
(4, 5, '10:00:00', '19:00:00', 'Disponible', 4),
(5, 6, '08:00:00', '16:00:00', 'Disponible', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluqueria`
--

CREATE TABLE `peluqueria` (
  `id_peluqueria` int(11) NOT NULL,
  `horapeluque` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `Fotospeid_fotospe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `peluqueria`
--

INSERT INTO `peluqueria` (`id_peluqueria`, `horapeluque`, `direccion`, `nombre`, `ciudad`, `Fotospeid_fotospe`) VALUES
(1, '08:00-20:00', 'Calle 93 # 15-42', 'Luxury Hair', 'Bogota', 1),
(2, '09:00-19:00', 'Cra. 43A # 10-21', 'Studio Elite', 'Medellin', 2),
(3, '08:30-19:30', 'Calle 5 # 38-10', 'Sensacion Cali', 'Cali', 3),
(4, '09:00-18:00', 'Calle 72 # 54-21', 'Caribe Lash', 'Barranquilla', 4),
(5, '08:00-19:00', 'Cra. 7 # 22-14', 'Encanto Estetica', 'Pereira', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `fechor_cita` varchar(20) NOT NULL,
  `Estadocitaid_escita` varchar(60) NOT NULL,
  `Clienteid_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `fechor_cita`, `Estadocitaid_escita`, `Clienteid_cliente`) VALUES
(1, '2026-11-25 10:00:00', 'Finalizada', 1),
(2, '2026-11-26 14:30:00', 'Confirmada', 2),
(3, '2026-11-27 09:00:00', 'Pendiente', 3),
(4, '2026-11-28 16:00:00', 'Cancelada', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicio`
--

CREATE TABLE `reserva_servicio` (
  `Reservaid_reserva` int(11) NOT NULL,
  `Servicioid_servicio` int(11) NOT NULL,
  `id_trab` int(11) NOT NULL,
  `hora_inicio` varchar(10) NOT NULL,
  `hora_fin` varchar(10) NOT NULL,
  `valor` varchar(25) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reserva_servicio`
--

INSERT INTO `reserva_servicio` (`Reservaid_reserva`, `Servicioid_servicio`, `id_trab`, `hora_inicio`, `hora_fin`, `valor`, `estado`) VALUES
(1, 1, 1, '10:00:00', '10:50:00', '50000.00', 'Finalizada'),
(2, 3, 3, '14:30:00', '15:30:00', '35000.00', 'Confirmada'),
(3, 5, 4, '09:00:00', '10:30:00', '90000.00', 'Pendiente'),
(4, 2, 1, '16:00:00', '19:00:00', '250000.00', 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `servicio` varchar(30) NOT NULL,
  `precio_ser` decimal(10,3) NOT NULL,
  `durac_ser` int(11) NOT NULL,
  `descripci` varchar(30) NOT NULL,
  `id_categ` int(11) NOT NULL,
  `id_fotosser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `servicio`, `precio_ser`, `durac_ser`, `descripci`, `id_categ`, `id_fotosser`) VALUES
(1, 'Corte Moderno', 50000.000, 50, 'Corte de cabello y blower', 1, 1),
(2, 'Balayage Premium', 250000.000, 180, 'Iluminacion y coloracion', 1, 2),
(3, 'Manicure Semi', 35000.000, 60, 'Esmaltado semipermanente', 2, 3),
(4, 'Unas Acrilicas', 95000.000, 120, 'Aplicacion de unas acrilicas', 2, 4),
(5, 'Pestanas Pelo a Pelo', 90000.000, 90, 'Extension pelo a pelo', 3, 5),
(6, 'Limpieza Facial', 120000.000, 75, 'Limpieza e hidratacion facial', 4, 6),
(7, 'Maquillaje Social', 80000.000, 60, 'Maquillaje para eventos', 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudafi`
--

CREATE TABLE `solicitudafi` (
  `id_solicitud` int(11) NOT NULL,
  `Solicitud` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudafi`
--

INSERT INTO `solicitudafi` (`id_solicitud`, `Solicitud`) VALUES
(1, 'Afiliacion Luxury Hair'),
(2, 'Afiliacion Studio Elite'),
(3, 'Afiliacion Sensacion Cali'),
(4, 'Afiliacion Caribe Lash'),
(5, 'Afiliacion Encanto Estetica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trab` int(11) NOT NULL,
  `nom_tra` varchar(50) NOT NULL,
  `ape_tra` varchar(50) NOT NULL,
  `Peluqueriaid_peluqueria` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id_trab`, `nom_tra`, `ape_tra`, `Peluqueriaid_peluqueria`, `estado`, `id_solicitud`) VALUES
(1, 'Camila', 'Rojas Soto', 1, 'Activo', 1),
(2, 'Andrea', 'Perez Gomez', 1, 'Activo', 1),
(3, 'Julian', 'Mejia Marin', 2, 'Activo', 2),
(4, 'Sofia', 'Castillo Ruiz', 3, 'Activo', 3),
(5, 'Marcela', 'Henao Restrepo', 4, 'Activo', 4),
(6, 'Diana', 'Torres Melo', 5, 'Activo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_servicio`
--

CREATE TABLE `trabajador_servicio` (
  `Trabajadorid_trab` int(11) NOT NULL,
  `Servicioid_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajador_servicio`
--

INSERT INTO `trabajador_servicio` (`Trabajadorid_trab`, `Servicioid_servicio`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 7),
(3, 3),
(3, 4),
(4, 5),
(5, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categ`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uq_cliente_numdoc` (`numdoc`),
  ADD UNIQUE KEY `uq_cliente_tlf` (`tlf`),
  ADD UNIQUE KEY `uq_cliente_correo` (`correo`);

--
-- Indices de la tabla `fotospe`
--
ALTER TABLE `fotospe`
  ADD PRIMARY KEY (`id_fotospe`);

--
-- Indices de la tabla `fotosser`
--
ALTER TABLE `fotosser`
  ADD PRIMARY KEY (`id_fotosser`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_hor`),
  ADD KEY `fk_horario_trabajador` (`Trabajadorid_trab`);

--
-- Indices de la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD PRIMARY KEY (`id_peluqueria`),
  ADD KEY `fk_peluqueria_fotospe` (`Fotospeid_fotospe`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `fk_reserva_cliente` (`Clienteid_cliente`);

--
-- Indices de la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD PRIMARY KEY (`Reservaid_reserva`,`Servicioid_servicio`),
  ADD KEY `fk_rs_servicio` (`Servicioid_servicio`),
  ADD KEY `fk_rs_trabajador` (`id_trab`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_servicio_categoria` (`id_categ`),
  ADD KEY `fk_servicio_fotosser` (`id_fotosser`);

--
-- Indices de la tabla `solicitudafi`
--
ALTER TABLE `solicitudafi`
  ADD PRIMARY KEY (`id_solicitud`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trab`),
  ADD KEY `fk_trabajador_peluqueria` (`Peluqueriaid_peluqueria`),
  ADD KEY `fk_trabajador_solicitudafi` (`id_solicitud`);

--
-- Indices de la tabla `trabajador_servicio`
--
ALTER TABLE `trabajador_servicio`
  ADD PRIMARY KEY (`Trabajadorid_trab`,`Servicioid_servicio`),
  ADD KEY `fk_ts_servicio` (`Servicioid_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fotospe`
--
ALTER TABLE `fotospe`
  MODIFY `id_fotospe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fotosser`
--
ALTER TABLE `fotosser`
  MODIFY `id_fotosser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_hor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  MODIFY `id_peluqueria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `solicitudafi`
--
ALTER TABLE `solicitudafi`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id_trab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_trabajador` FOREIGN KEY (`Trabajadorid_trab`) REFERENCES `trabajador` (`id_trab`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD CONSTRAINT `fk_peluqueria_fotospe` FOREIGN KEY (`Fotospeid_fotospe`) REFERENCES `fotospe` (`id_fotospe`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`Clienteid_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD CONSTRAINT `fk_rs_reserva` FOREIGN KEY (`Reservaid_reserva`) REFERENCES `reserva` (`id_reserva`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rs_servicio` FOREIGN KEY (`Servicioid_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rs_trabajador` FOREIGN KEY (`id_trab`) REFERENCES `trabajador` (`id_trab`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_categoria` FOREIGN KEY (`id_categ`) REFERENCES `categoria` (`id_categ`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicio_fotosser` FOREIGN KEY (`id_fotosser`) REFERENCES `fotosser` (`id_fotosser`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_trabajador_peluqueria` FOREIGN KEY (`Peluqueriaid_peluqueria`) REFERENCES `peluqueria` (`id_peluqueria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trabajador_solicitudafi` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudafi` (`id_solicitud`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trabajador_servicio`
--
ALTER TABLE `trabajador_servicio`
  ADD CONSTRAINT `fk_ts_servicio` FOREIGN KEY (`Servicioid_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ts_trabajador` FOREIGN KEY (`Trabajadorid_trab`) REFERENCES `trabajador` (`id_trab`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
