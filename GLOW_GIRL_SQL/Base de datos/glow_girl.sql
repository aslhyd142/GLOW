-- Glow Girl - exportacion base de datos
-- Modelo relacional actualizado

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `glow_girl`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `glow_girl`;

CREATE TABLE `categoria` (
  `id_categ` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categ`),
  UNIQUE KEY `uq_categoria_nombre` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `peluqueria` (
  `id_peluqueria` int(11) NOT NULL AUTO_INCREMENT,
  `horario` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_peluqueria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `fotoscope` (
  `id_fotoscop` int(11) NOT NULL AUTO_INCREMENT,
  `id_peluqueria` int(11) NOT NULL,
  `fotos` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fotoscop`),
  KEY `fk_fotoscope_peluqueria` (`id_peluqueria`),
  CONSTRAINT `fk_fotoscope_peluqueria` FOREIGN KEY (`id_peluqueria`)
    REFERENCES `peluqueria` (`id_peluqueria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `solicitud` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `Solicitud` varchar(255) NOT NULL,
  PRIMARY KEY (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trabajador` (
  `id_trab` int(11) NOT NULL AUTO_INCREMENT,
  `nom_trab` varchar(50) NOT NULL,
  `ape_trab` varchar(50) NOT NULL,
  `id_peluqueria` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL DEFAULT 'Activo',
  `id_solicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trab`),
  KEY `fk_trabajador_peluqueria` (`id_peluqueria`),
  KEY `fk_trabajador_solicitud` (`id_solicitud`),
  CONSTRAINT `fk_trabajador_peluqueria` FOREIGN KEY (`id_peluqueria`)
    REFERENCES `peluqueria` (`id_peluqueria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_trabajador_solicitud` FOREIGN KEY (`id_solicitud`)
    REFERENCES `solicitud` (`id_solicitud`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `horario` (
  `id_hor` int(11) NOT NULL AUTO_INCREMENT,
  `dia_sem` varchar(20) NOT NULL,
  `hora_ini` varchar(20) NOT NULL,
  `hora_fin` varchar(20) NOT NULL,
  `estado` varchar(50) NOT NULL DEFAULT 'Disponible',
  `id_trab` int(11) NOT NULL,
  PRIMARY KEY (`id_hor`),
  KEY `fk_horario_trabajador` (`id_trab`),
  CONSTRAINT `fk_horario_trabajador` FOREIGN KEY (`id_trab`)
    REFERENCES `trabajador` (`id_trab`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_categ` int(11) NOT NULL,
  `id_peluqueria` int(11) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `dure_ser` int(11) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicio_categoria` (`id_categ`),
  KEY `fk_servicio_peluqueria` (`id_peluqueria`),
  CONSTRAINT `fk_servicio_categoria` FOREIGN KEY (`id_categ`)
    REFERENCES `categoria` (`id_categ`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_servicio_peluqueria` FOREIGN KEY (`id_peluqueria`)
    REFERENCES `peluqueria` (`id_peluqueria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trabajador_servicio` (
  `id_trab` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_trab`,`id_servicio`),
  KEY `fk_ts_servicio` (`id_servicio`),
  CONSTRAINT `fk_ts_trabajador` FOREIGN KEY (`id_trab`)
    REFERENCES `trabajador` (`id_trab`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ts_servicio` FOREIGN KEY (`id_servicio`)
    REFERENCES `servicio` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nom_clen` varchar(50) NOT NULL,
  `ape_clie` varchar(50) NOT NULL,
  `numdoc` varchar(20) NOT NULL,
  `tlf` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `tipodoc` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_cliente_documento` (`numdoc`),
  UNIQUE KEY `uq_cliente_correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `estado_cita` varchar(20) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`id_reserva`),
  KEY `fk_reserva_cliente` (`id_cliente`),
  CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`id_cliente`)
    REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reserva_servicio` (
  `id_reserva` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_trab` int(11) NOT NULL,
  `hora_inicio` varchar(20) NOT NULL,
  `hora_fin` varchar(20) NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_reserva`,`id_servicio`,`id_trab`),
  KEY `fk_rs_servicio` (`id_servicio`),
  KEY `fk_rs_trabajador` (`id_trab`),
  CONSTRAINT `fk_rs_reserva` FOREIGN KEY (`id_reserva`)
    REFERENCES `reserva` (`id_reserva`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rs_servicio` FOREIGN KEY (`id_servicio`)
    REFERENCES `servicio` (`id_servicio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rs_trabajador` FOREIGN KEY (`id_trab`)
    REFERENCES `trabajador` (`id_trab`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
