
-- =====================================================================
<<<<<<< HEAD
-- DDL - LENGUAJE DE DEFINICIÓN DE DATOS
-- MODELO RELACIONAL GLOW GIRL
=======
-- DDL - PROYECTO GLOW GIRL
-- Modelo relacional: peluquerias, trabajadores, servicios y reservas
>>>>>>> main
-- =====================================================================

-- Eliminar base de datos si existe
DROP DATABASE IF EXISTS glow_girl;

<<<<<<< HEAD
-- Crear base de datos
=======
>>>>>>> main
CREATE DATABASE glow_girl
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE glow_girl;

<<<<<<< HEAD

-- =====================================================================
-- 1. CATEGORIA
-- =====================================================================

CREATE TABLE Categoria (
    id_categ INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(20) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categ)
) ENGINE = InnoDB;


-- =====================================================================
-- 2. FOTOS DE SERVICIOS
-- =====================================================================

CREATE TABLE Fotosser (
    id_fotosser INT NOT NULL AUTO_INCREMENT,
    fotosser VARCHAR(255) NOT NULL,
    CONSTRAINT pk_fotosser PRIMARY KEY (id_fotosser)
) ENGINE = InnoDB;


-- =====================================================================
-- 3. SERVICIO
-- =====================================================================

CREATE TABLE Servicio (
    id_servicio INT NOT NULL AUTO_INCREMENT,
    servicio VARCHAR(30) NOT NULL,
    precio_ser DECIMAL(10,3) NOT NULL,
    durac_ser INT NOT NULL,
    descripci VARCHAR(30) NOT NULL,
    id_categ INT NOT NULL,
    id_fotosser INT NOT NULL,

    CONSTRAINT pk_servicio PRIMARY KEY (id_servicio),

    CONSTRAINT fk_servicio_categoria FOREIGN KEY (id_categ)
        REFERENCES Categoria (id_categ)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_servicio_fotosser FOREIGN KEY (id_fotosser)
        REFERENCES Fotosser (id_fotosser)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 4. FOTOS DE PELUQUERIA
-- =====================================================================

CREATE TABLE Fotospe (
    id_fotospe INT NOT NULL AUTO_INCREMENT,
    fotos VARCHAR(255) NOT NULL,
    CONSTRAINT pk_fotospe PRIMARY KEY (id_fotospe)
) ENGINE = InnoDB;


-- =====================================================================
-- 5. PELUQUERIA
-- =====================================================================

CREATE TABLE Peluqueria (
    id_peluqueria INT NOT NULL AUTO_INCREMENT,
    horapeluque VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    Fotospeid_fotospe INT NOT NULL,

    CONSTRAINT pk_peluqueria PRIMARY KEY (id_peluqueria),

    CONSTRAINT fk_peluqueria_fotospe FOREIGN KEY (Fotospeid_fotospe)
        REFERENCES Fotospe (id_fotospe)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 6. SOLICITUD DE AFILIACION
-- =====================================================================

CREATE TABLE Solicitudafi (
    id_solicitud INT NOT NULL AUTO_INCREMENT,
    Solicitud VARCHAR(255) NOT NULL,
    CONSTRAINT pk_solicitudafi PRIMARY KEY (id_solicitud)
) ENGINE = InnoDB;


-- =====================================================================
-- 7. TRABAJADOR
-- =====================================================================

CREATE TABLE Trabajador (
    id_trab INT NOT NULL AUTO_INCREMENT,
    nom_tra VARCHAR(50) NOT NULL,
    ape_tra VARCHAR(50) NOT NULL,
    Peluqueriaid_peluqueria INT NOT NULL,
    estado VARCHAR(25) NOT NULL,
    id_solicitud INT NOT NULL,

    CONSTRAINT pk_trabajador PRIMARY KEY (id_trab),

    CONSTRAINT fk_trabajador_peluqueria FOREIGN KEY (Peluqueriaid_peluqueria)
        REFERENCES Peluqueria (id_peluqueria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_trabajador_solicitudafi FOREIGN KEY (id_solicitud)
        REFERENCES Solicitudafi (id_solicitud)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 8. HORARIO
-- =====================================================================

CREATE TABLE Horario (
    id_hor INT NOT NULL AUTO_INCREMENT,
    dia_sem INT NOT NULL,
    hora_ini VARCHAR(10) NOT NULL,
    horafin VARCHAR(10) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    Trabajadorid_trab INT NOT NULL,

    CONSTRAINT pk_horario PRIMARY KEY (id_hor),

    CONSTRAINT fk_horario_trabajador FOREIGN KEY (Trabajadorid_trab)
        REFERENCES Trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 9. RELACION TRABAJADOR - SERVICIO
-- =====================================================================

CREATE TABLE Trabajador_Servicio (
    Trabajadorid_trab INT NOT NULL,
    Servicioid_servicio INT NOT NULL,

    CONSTRAINT pk_trabajador_servicio
        PRIMARY KEY (Trabajadorid_trab, Servicioid_servicio),

    CONSTRAINT fk_ts_trabajador FOREIGN KEY (Trabajadorid_trab)
        REFERENCES Trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_ts_servicio FOREIGN KEY (Servicioid_servicio)
        REFERENCES Servicio (id_servicio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 10. CLIENTE
-- =====================================================================

CREATE TABLE Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nom_clien VARCHAR(50) NOT NULL,
    ape_clie VARCHAR(50) NOT NULL,
    numdoc VARCHAR(11) NOT NULL,
    tlf VARCHAR(11) NOT NULL,
    correo VARCHAR(20) NOT NULL,
    tipodoc VARCHAR(12) NOT NULL,

    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),

    CONSTRAINT uq_cliente_numdoc UNIQUE (numdoc),
    CONSTRAINT uq_cliente_tlf UNIQUE (tlf),
    CONSTRAINT uq_cliente_correo UNIQUE (correo)
) ENGINE = InnoDB;


-- =====================================================================
-- 11. RESERVA
-- =====================================================================

CREATE TABLE Reserva (
    id_reserva INT NOT NULL AUTO_INCREMENT,
    fechor_cita VARCHAR (20) NOT NULL,
    Estadocitaid_escita VARCHAR(60) NOT NULL,
    Clienteid_cliente INT NOT NULL,

    CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),

    CONSTRAINT fk_reserva_cliente FOREIGN KEY (Clienteid_cliente)
        REFERENCES Cliente (id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- 12. DETALLE RESERVA - SERVICIO
-- =====================================================================

CREATE TABLE Reserva_Servicio (
    Reservaid_reserva INT NOT NULL,
    Servicioid_servicio INT NOT NULL,
    id_trab INT NOT NULL,
    hora_inicio VARCHAR(10) NOT NULL,
    hora_fin VARCHAR(10) NOT NULL,
    valor VARCHAR(25) NOT NULL,
     estado VARCHAR(30) NOT NULL,

    CONSTRAINT pk_reserva_servicio
        PRIMARY KEY (Reservaid_reserva, Servicioid_servicio),

    CONSTRAINT fk_rs_reserva FOREIGN KEY (Reservaid_reserva)
        REFERENCES Reserva (id_reserva)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_rs_servicio FOREIGN KEY (Servicioid_servicio)
        REFERENCES Servicio (id_servicio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_rs_trabajador FOREIGN KEY (id_trab)
        REFERENCES Trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;


-- =====================================================================
-- INDICES PARA CONSULTAS FRECUENTES
-- =====================================================================

CREATE INDEX idx_peluqueria_ciudad
ON Peluqueria (ciudad);

CREATE INDEX idx_servicio_nombre
ON Servicio (servicio);

CREATE INDEX idx_cliente_apellido
ON Cliente (ape_clie, nom_clien);

CREATE INDEX idx_reserva_fecha
ON Reserva (fechor_cita);


-- =====================================================================
-- COMANDOS DE VERIFICACION Y DICCIONARIO DE DATOS
-- =====================================================================

-- Mostrar todas las tablas
SHOW TABLES;

-- Consultar estructura de Servicio
DESCRIBE Servicio;

-- Consultar estructura de Reserva_Servicio
SHOW CREATE TABLE Reserva_Servicio;

-- Consultar indices de Cliente
SHOW INDEX FROM Cliente;

-- Consultar restricciones de la base de datos
SELECT
    table_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'glow_girl'
ORDER BY table_name, constraint_type;

=======
CREATE TABLE categoria (
    id_categ INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(30) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categ),
    CONSTRAINT uq_categoria_nombre UNIQUE (categoria)
) ENGINE = InnoDB;

CREATE TABLE peluqueria (
    id_peluqueria INT NOT NULL AUTO_INCREMENT,
    horario VARCHAR(20) NULL,
    direccion VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    CONSTRAINT pk_peluqueria PRIMARY KEY (id_peluqueria)
) ENGINE = InnoDB;

CREATE TABLE fotoscope (
    id_fotoscop INT NOT NULL AUTO_INCREMENT,
    id_peluqueria INT NOT NULL,
    fotos VARCHAR(255) NOT NULL,
    CONSTRAINT pk_fotoscope PRIMARY KEY (id_fotoscop),
    CONSTRAINT fk_fotoscope_peluqueria FOREIGN KEY (id_peluqueria)
        REFERENCES peluqueria (id_peluqueria)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE solicitud (
    id_solicitud INT NOT NULL AUTO_INCREMENT,
    Solicitud VARCHAR(255) NOT NULL,
    CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud)
) ENGINE = InnoDB;

CREATE TABLE trabajador (
    id_trab INT NOT NULL AUTO_INCREMENT,
    nom_trab VARCHAR(50) NOT NULL,
    ape_trab VARCHAR(50) NOT NULL,
    id_peluqueria INT NOT NULL,
    estado VARCHAR(25) NOT NULL DEFAULT 'Activo',
    id_solicitud INT NULL,
    CONSTRAINT pk_trabajador PRIMARY KEY (id_trab),
    CONSTRAINT fk_trabajador_peluqueria FOREIGN KEY (id_peluqueria)
        REFERENCES peluqueria (id_peluqueria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_trabajador_solicitud FOREIGN KEY (id_solicitud)
        REFERENCES solicitud (id_solicitud)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE horario (
    id_hor INT NOT NULL AUTO_INCREMENT,
    dia_sem VARCHAR(20) NOT NULL,
    hora_ini VARCHAR(20) NOT NULL,
    hora_fin VARCHAR(20) NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'Disponible',
    id_trab INT NOT NULL,
    CONSTRAINT pk_horario PRIMARY KEY (id_hor),
    CONSTRAINT fk_horario_trabajador FOREIGN KEY (id_trab)
        REFERENCES trabajador (id_trab)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE servicio (
    id_servicio INT NOT NULL AUTO_INCREMENT,
    id_categ INT NOT NULL,
    id_peluqueria INT NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    dure_ser INT NOT NULL,
    descr VARCHAR(255) NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_servicio PRIMARY KEY (id_servicio),
    CONSTRAINT ck_servicio_precio CHECK (precio > 0),
    CONSTRAINT ck_servicio_duracion CHECK (dure_ser > 0),
    CONSTRAINT fk_servicio_categoria FOREIGN KEY (id_categ)
        REFERENCES categoria (id_categ)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_servicio_peluqueria FOREIGN KEY (id_peluqueria)
        REFERENCES peluqueria (id_peluqueria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE trabajador_servicio (
    id_trab INT NOT NULL,
    id_servicio INT NOT NULL,
    CONSTRAINT pk_trabajador_servicio PRIMARY KEY (id_trab, id_servicio),
    CONSTRAINT fk_ts_trabajador FOREIGN KEY (id_trab)
        REFERENCES trabajador (id_trab)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ts_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nom_clen VARCHAR(50) NOT NULL,
    ape_clie VARCHAR(50) NOT NULL,
    numdoc VARCHAR(20) NOT NULL,
    tlf VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    tipodoc VARCHAR(20) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_documento UNIQUE (numdoc),
    CONSTRAINT uq_cliente_correo UNIQUE (correo)
) ENGINE = InnoDB;

CREATE TABLE reserva (
    id_reserva INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_cita DATETIME NOT NULL,
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),
    CONSTRAINT ck_reserva_estado CHECK (estado_cita IN ('Pendiente','Confirmada','Finalizada','Cancelada')),
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE reserva_servicio (
    id_reserva INT NOT NULL,
    id_servicio INT NOT NULL,
    id_trab INT NOT NULL,
    hora_inicio VARCHAR(20) NOT NULL,
    hora_fin VARCHAR(20) NOT NULL,
    valor DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_reserva_servicio PRIMARY KEY (id_reserva, id_servicio, id_trab),
    CONSTRAINT ck_rs_valor CHECK (valor > 0),
    CONSTRAINT fk_rs_reserva FOREIGN KEY (id_reserva)
        REFERENCES reserva (id_reserva)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_rs_servicio FOREIGN KEY (id_servicio)
        REFERENCES servicio (id_servicio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_rs_trabajador FOREIGN KEY (id_trab)
        REFERENCES trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;
>>>>>>> main
