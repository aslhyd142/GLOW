-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 22:21:47
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
  `id_categ` int(10) NOT NULL,
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
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(10) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `ciudad`) VALUES
(1, 'Bogota'),
(2, 'Medellin'),
(3, 'Cali'),
(4, 'Barranquilla'),
(5, 'Pereira');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL,
  `nom_clien` varchar(50) NOT NULL,
  `ape_clie` varchar(50) NOT NULL,
  `numdoc` varchar(11) NOT NULL,
  `tlf` varchar(11) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `Tipodocumentoid_tdoc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_clien`, `ape_clie`, `numdoc`, `tlf`, `correo`, `Tipodocumentoid_tdoc`) VALUES
(1, 'Ana Maria', 'Gomez Ruiz', '1001001001', '3001112233', 'ana@correo.com', 1),
(2, 'Carlos', 'Perez Diaz', '1002002002', '3002223344', 'carlos@correo.com', 1),
(3, 'Luisa', 'Martinez Rios', '1003003003', '3023334455', 'luisa@correo.com', 1),
(4, 'Juan David', 'Restrepo', '1004004004', '3034445566', 'juan@correo.com', 2),
(5, 'Valentina', 'Herrera', '1005005005', '3045556677', 'val@correo.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocita`
--

CREATE TABLE `estadocita` (
  `id_escita` int(10) NOT NULL,
  `escita` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estadocita`
--

INSERT INTO `estadocita` (`id_escita`, `escita`) VALUES
(1, 'Pendiente'),
(2, 'Confirmada'),
(3, 'Finalizada'),
(4, 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotospe`
--

CREATE TABLE `fotospe` (
  `id_fotospe` int(10) NOT NULL,
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
  `id_fotosser` int(10) NOT NULL,
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
(6, 'limpieza_facial.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_hor` int(10) NOT NULL,
  `dia_sem` int(10) NOT NULL,
  `hora_ini` varchar(20) NOT NULL,
  `horafin` varchar(20) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `Trabajadorid_trab` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_hor`, `dia_sem`, `hora_ini`, `horafin`, `estado`, `Trabajadorid_trab`) VALUES
(1, 2, '08:00', '17:00', 'Disponible', 1),
(2, 3, '09:00', '18:00', 'Disponible', 2),
(3, 4, '09:00', '19:00', 'Disponible', 3),
(4, 5, '10:00', '19:00', 'Disponible', 4),
(5, 6, '08:00', '16:00', 'Disponible', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `id_User` int(10) NOT NULL,
  `pass` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `user`, `id_User`, `pass`) VALUES
(1, 'ana_gomez', 1, '26acfc07'),
(2, 'carlos_p', 2, '56a68448'),
(3, 'luisa_m', 3, '5d74399d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluqueria`
--

CREATE TABLE `peluqueria` (
  `id_peluqueria` int(10) NOT NULL,
  `horapeluque` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `Ciudadid_ciudad` int(10) NOT NULL,
  `Fotospeid_fotospe` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `peluqueria`
--

INSERT INTO `peluqueria` (`id_peluqueria`, `horapeluque`, `direccion`, `nombre`, `Ciudadid_ciudad`, `Fotospeid_fotospe`) VALUES
(1, '08:00-20:00', 'Calle 93 # 15-42', 'Luxury Hair', 1, 1),
(2, '09:00-19:00', 'Cra. 43A # 10-21', 'Studio Elite', 2, 2),
(3, '08:30-19:30', 'Calle 5 # 38-10', 'Sensacion Cali', 3, 3),
(4, '09:00-18:00', 'Calle 72 # 54-21', 'Caribe Lash', 4, 4),
(5, '08:00-19:00', 'Cra. 7 # 22-14', 'Encanto Estetica', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(10) NOT NULL,
  `fechor_cita` varchar(20) NOT NULL,
  `Estadocitaid_escita` varchar(60) NOT NULL,
  `Clienteid_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `fechor_cita`, `Estadocitaid_escita`, `Clienteid_cliente`) VALUES
(1, '2026-11-25 10:00', '3', 1),
(2, '2026-11-26 14:30', '2', 2),
(3, '2026-11-27 09:00', '1', 3),
(4, '2026-11-28 16:00', '4', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicio`
--

CREATE TABLE `reserva_servicio` (
  `Reservaid_reserva` int(10) NOT NULL,
  `Servicioid_servicio` int(10) NOT NULL,
  `id_trab` int(10) NOT NULL,
  `hora_inicio` varchar(10) NOT NULL,
  `hora_fin` varchar(10) NOT NULL,
  `Valor` varchar(25) NOT NULL,
  `id_escita` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reserva_servicio`
--

INSERT INTO `reserva_servicio` (`Reservaid_reserva`, `Servicioid_servicio`, `id_trab`, `hora_inicio`, `hora_fin`, `Valor`, `id_escita`) VALUES
(1, 1, 1, '10:00', '10:50', '50000', 3),
(2, 3, 3, '14:30', '15:30', '35000', 2),
(3, 5, 4, '09:00', '10:30', '90000', 1),
(4, 2, 1, '16:00', '19:00', '250000', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(10) NOT NULL,
  `servicio` varchar(30) NOT NULL,
  `precio_ser` decimal(10,3) NOT NULL,
  `durac_ser` int(3) NOT NULL,
  `descripci` int(10) NOT NULL,
  `id_categ` int(10) NOT NULL,
  `id_fotosser` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `servicio`, `precio_ser`, `durac_ser`, `descripci`, `id_categ`, `id_fotosser`) VALUES
(1, 'Corte Moderno', 50.000, 50, 101, 1, 1),
(2, 'Balayage Premium', 250.000, 180, 102, 1, 2),
(3, 'Manicure Semi', 35.000, 60, 103, 2, 3),
(4, 'Unas Acrilicas', 95.000, 120, 104, 2, 4),
(5, 'Pestanas Pelo a Pelo', 90.000, 90, 105, 3, 5),
(6, 'Limpieza Facial', 120.000, 75, 106, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudafi`
--

CREATE TABLE `solicitudafi` (
  `id_solicitud` int(10) NOT NULL,
  `nom_prop` varchar(50) NOT NULL,
  `docu_prop` varchar(11) NOT NULL,
  `tlf` varchar(11) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `fecha_sol` varchar(20) NOT NULL,
  `nom_peluq` varchar(50) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `ciudad` varchar(10) NOT NULL,
  `fotos_peluq` varchar(255) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudafi`
--

INSERT INTO `solicitudafi` (`id_solicitud`, `nom_prop`, `docu_prop`, `tlf`, `correo`, `estado`, `fecha_sol`, `nom_peluq`, `direccion`, `ciudad`, `fotos_peluq`, `descripcion`) VALUES
(1, 'Laura Sofia', '1099887766', '3112223344', 'laura@salon.com', 'Pendiente', '2026-11-20', 'Glow Studio', 'Calle 80 # 12-5', 'Bogota', 'glow1.jpg', 'Salon de nails y lashes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `id_tdoc` int(10) NOT NULL,
  `tdoc` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`id_tdoc`, `tdoc`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trab` int(10) NOT NULL,
  `nom_tra` varchar(50) NOT NULL,
  `ape_tra` varchar(50) NOT NULL,
  `Peluqueriaid_peluqueria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id_trab`, `nom_tra`, `ape_tra`, `Peluqueriaid_peluqueria`) VALUES
(1, 'Camila', 'Rojas Soto', 1),
(2, 'Andrea', 'Perez Gomez', 1),
(3, 'Julian', 'Mejia Marin', 2),
(4, 'Sofia', 'Castillo Ruiz', 3),
(5, 'Marcela', 'Henao Restrepo', 4),
(6, 'Diana', 'Torres Melo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_servicio`
--

CREATE TABLE `trabajador_servicio` (
  `Trabajadorid_trab` int(10) NOT NULL,
  `Servicioid_servicio` int(10) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajador_servicio`
--

INSERT INTO `trabajador_servicio` (`Trabajadorid_trab`, `Servicioid_servicio`, `estado`) VALUES
(1, 1, 'Activo'),
(1, 2, 'Activo'),
(2, 1, 'Activo'),
(3, 3, 'Activo'),
(3, 4, 'Activo'),
(4, 5, 'Activo'),
(5, 6, 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categ`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uq_cliente_numdoc` (`numdoc`),
  ADD UNIQUE KEY `uq_cliente_tlf` (`tlf`),
  ADD UNIQUE KEY `uq_cliente_correo` (`correo`),
  ADD KEY `fk_cliente_tipodocumento` (`Tipodocumentoid_tdoc`);

--
-- Indices de la tabla `estadocita`
--
ALTER TABLE `estadocita`
  ADD PRIMARY KEY (`id_escita`);

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
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_login_cliente` (`id_User`);

--
-- Indices de la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD PRIMARY KEY (`id_peluqueria`),
  ADD KEY `fk_peluqueria_ciudad` (`Ciudadid_ciudad`),
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
  ADD KEY `fk_rs_trabajador` (`id_trab`),
  ADD KEY `fk_rs_estadocita` (`id_escita`);

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
  ADD PRIMARY KEY (`id_solicitud`),
  ADD UNIQUE KEY `uq_solicitudafi_docu` (`docu_prop`),
  ADD UNIQUE KEY `uq_solicitudafi_tlf` (`tlf`),
  ADD UNIQUE KEY `uq_solicitudafi_correo` (`correo`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`id_tdoc`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trab`),
  ADD KEY `fk_trabajador_peluqueria` (`Peluqueriaid_peluqueria`);

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
  MODIFY `id_categ` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estadocita`
--
ALTER TABLE `estadocita`
  MODIFY `id_escita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fotospe`
--
ALTER TABLE `fotospe`
  MODIFY `id_fotospe` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fotosser`
--
ALTER TABLE `fotosser`
  MODIFY `id_fotosser` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_hor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  MODIFY `id_peluqueria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `solicitudafi`
--
ALTER TABLE `solicitudafi`
  MODIFY `id_solicitud` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `id_tdoc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id_trab` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_tipodocumento` FOREIGN KEY (`Tipodocumentoid_tdoc`) REFERENCES `tipodocumento` (`id_tdoc`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_trabajador` FOREIGN KEY (`Trabajadorid_trab`) REFERENCES `trabajador` (`id_trab`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_cliente` FOREIGN KEY (`id_User`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD CONSTRAINT `fk_peluqueria_ciudad` FOREIGN KEY (`Ciudadid_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `fk_rs_estadocita` FOREIGN KEY (`id_escita`) REFERENCES `estadocita` (`id_escita`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `fk_trabajador_peluqueria` FOREIGN KEY (`Peluqueriaid_peluqueria`) REFERENCES `peluqueria` (`id_peluqueria`) ON UPDATE CASCADE;

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
