-- =====================================================================
-- DDL - PROYECTO GLOW GIRL
-- Lenguaje de Definición de Datos para la plataforma de belleza y citas
-- =====================================================================

DROP DATABASE IF EXISTS glow_girl;

CREATE DATABASE glow_girl 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE glow_girl;

-- ---------------------------------------------------------------------
-- 1. TABLA CATEGORÍAS DE SERVICIOS
-- ---------------------------------------------------------------------
CREATE TABLE categorias_servicios (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL, -- Peluquería, Nails, Lashista, Skincare, Makeup
    descripcion VARCHAR(255) NULL,
    CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 2. TABLA PELUQUERÍAS (Establecimientos independientes afiliados al sistema)
-- ---------------------------------------------------------------------
CREATE TABLE peluquerias (
    id_peluqueria INT NOT NULL AUTO_INCREMENT,
    nit VARCHAR(20) NOT NULL,
    nombre_salon VARCHAR(100) NOT NULL, -- Nombres propios (ej. Luxury Salon, Estética Bella, etc.)
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,        -- Ciudad de ubicación en Colombia
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente', -- Pendiente, Activa, Inactiva, Suspendida
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_peluquerias PRIMARY KEY (id_peluqueria),
    CONSTRAINT uq_peluquerias_nit UNIQUE (nit),
    CONSTRAINT uq_peluquerias_email UNIQUE (email),
    CONSTRAINT ck_peluquerias_estado CHECK (estado IN ('Pendiente','Activa','Inactiva','Suspendida'))
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 3. TABLA SERVICIOS 
-- ---------------------------------------------------------------------
CREATE TABLE servicios (
    id_servicio INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    id_peluqueria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    precio DECIMAL(12,2) NOT NULL,
    duracion_minutos INT NOT NULL, 
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_servicios PRIMARY KEY (id_servicio),
    CONSTRAINT ck_servicios_precio CHECK (precio > 0 AND precio <= 50000000),
    CONSTRAINT ck_servicios_duracion CHECK (duracion_minutos > 0),
    CONSTRAINT fk_servicios_categorias FOREIGN KEY (id_categoria)
        REFERENCES categorias_servicios (id_categoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_servicios_peluquerias FOREIGN KEY (id_peluqueria)
        REFERENCES peluquerias (id_peluqueria)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 4. TABLA PROFESIONALES 
-- ---------------------------------------------------------------------
CREATE TABLE profesionales (
    id_profesional INT NOT NULL AUTO_INCREMENT,
    id_peluqueria INT NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_profesionales PRIMARY KEY (id_profesional),
    CONSTRAINT fk_profesionales_peluquerias FOREIGN KEY (id_peluqueria)
        REFERENCES peluquerias (id_peluqueria)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 5. TABLA CLIENTES 
-- ---------------------------------------------------------------------
CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    tipo_documento VARCHAR(5) NOT NULL DEFAULT 'CC',
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    ciudad_residencia VARCHAR(50) NOT NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente),
    CONSTRAINT uq_clientes_documento UNIQUE (numero_documento),
    CONSTRAINT uq_clientes_email UNIQUE (email),
    CONSTRAINT ck_clientes_tipo_doc CHECK (tipo_documento IN ('CC','TI','CE','PASS'))
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 6. TABLA CITAS 
-- ---------------------------------------------------------------------
CREATE TABLE citas (
    id_cita INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_peluqueria INT NOT NULL,
    id_servicio INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_hora_cita DATETIME NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente', 
    calificacion INT NULL, 
    comentario_calificacion TEXT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_citas PRIMARY KEY (id_cita),
    CONSTRAINT ck_citas_estado CHECK (estado IN ('Pendiente','Confirmada','Finalizada','Cancelada')),
    CONSTRAINT ck_citas_calificacion CHECK (calificacion BETWEEN 1 AND 5),
    CONSTRAINT fk_citas_clientes FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_citas_peluquerias FOREIGN KEY (id_peluqueria)
        REFERENCES peluquerias (id_peluqueria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_citas_servicios FOREIGN KEY (id_servicio)
        REFERENCES servicios (id_servicio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_citas_profesionales FOREIGN KEY (id_profesional)
        REFERENCES profesionales (id_profesional)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- 7. TABLA USUARIOS 
-- ---------------------------------------------------------------------
CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash CHAR(64) NOT NULL, 
    salt CHAR(32) NOT NULL,
    rol VARCHAR(30) NOT NULL DEFAULT 'CLIENTE',
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    intentos_fallidos INT NOT NULL DEFAULT 0,
    bloqueado BOOLEAN NOT NULL DEFAULT FALSE,
    ultimo_acceso DATETIME NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuarios_nombre UNIQUE (nombre_usuario),
    CONSTRAINT uq_usuarios_email UNIQUE (email),
    CONSTRAINT ck_usuarios_rol CHECK (rol IN ('CLIENTE','ADMIN_GENERAL','ADMIN_PELUQUERIA','PROFESIONAL')),
    CONSTRAINT fk_usuarios_clientes FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE = InnoDB;
------------------------------------------------------------------------------------
-- 8. Tabla para registrar el historial de notificaciones y recordatorios automáticos}
-- ---------------------------------------------------------------------------------
CREATE TABLE notificaciones (
    id_notificacion INT NOT NULL AUTO_INCREMENT,
    id_cita INT NOT NULL,
    tipo_mensaje VARCHAR(50) NOT NULL DEFAULT 'RECORDATORIO_24H', -- Ej: Confirmacion, Recordatorio_24h, Cancelacion
    canal VARCHAR(20) NOT NULL DEFAULT 'EMAIL',                  -- EMAIL o WHATSAPP
    estado_envio VARCHAR(20) NOT NULL DEFAULT 'Enviado',         -- Pendiente, Enviado, Fallido
    fecha_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_notificaciones PRIMARY KEY (id_notificacion),
    CONSTRAINT fk_notificaciones_citas FOREIGN KEY (id_cita)
        REFERENCES citas (id_cita)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;