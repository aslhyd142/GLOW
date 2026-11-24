-- =====================================================================
-- DDL - MODELO RELACIONAL GLOW GIRL (según diagrama)
-- =====================================================================

DROP DATABASE IF EXISTS glow_girl;

CREATE DATABASE glow_girl
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE glow_girl;

-- 1. Ciudad
CREATE TABLE Ciudad (
    id_ciudad INT(10) NOT NULL AUTO_INCREMENT,
    ciudad VARCHAR(50) NOT NULL,
    CONSTRAINT pk_ciudad PRIMARY KEY (id_ciudad)
) ENGINE = InnoDB;

-- 2. Fotospe
CREATE TABLE Fotospe (
    id_fotospe INT(10) NOT NULL AUTO_INCREMENT,
    fotos VARCHAR(255) NOT NULL,
    CONSTRAINT pk_fotospe PRIMARY KEY (id_fotospe)
) ENGINE = InnoDB;

-- 3. Peluqueria
CREATE TABLE Peluqueria (
    id_peluqueria INT(10) NOT NULL AUTO_INCREMENT,
    horapeluque VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    Ciudadid_ciudad INT(10) NOT NULL,
    Fotospeid_fotospe INT(10) NOT NULL,
    CONSTRAINT pk_peluqueria PRIMARY KEY (id_peluqueria),
    CONSTRAINT fk_peluqueria_ciudad FOREIGN KEY (Ciudadid_ciudad)
        REFERENCES Ciudad (id_ciudad)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_peluqueria_fotospe FOREIGN KEY (Fotospeid_fotospe)
        REFERENCES Fotospe (id_fotospe)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 4. Trabajador
CREATE TABLE Trabajador (
    id_trab INT(10) NOT NULL AUTO_INCREMENT,
    nom_tra VARCHAR(50) NOT NULL,
    ape_tra VARCHAR(50) NOT NULL,
    Peluqueriaid_peluqueria INT(10) NOT NULL,
    CONSTRAINT pk_trabajador PRIMARY KEY (id_trab),
    CONSTRAINT fk_trabajador_peluqueria FOREIGN KEY (Peluqueriaid_peluqueria)
        REFERENCES Peluqueria (id_peluqueria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 5. Horario
CREATE TABLE Horario (
    id_hor INT(10) NOT NULL AUTO_INCREMENT,
    dia_sem INT(10) NOT NULL,
    hora_ini VARCHAR(20) NOT NULL,
    horafin VARCHAR(20) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    Trabajadorid_trab INT(10) NOT NULL,
    CONSTRAINT pk_horario PRIMARY KEY (id_hor),
    CONSTRAINT fk_horario_trabajador FOREIGN KEY (Trabajadorid_trab)
        REFERENCES Trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 6. Categoria
CREATE TABLE Categoria (
    id_categ INT(10) NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(20) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categ)
) ENGINE = InnoDB;

-- 7. Fotosser
CREATE TABLE Fotosser (
    id_fotosser INT(10) NOT NULL AUTO_INCREMENT,
    fotosser VARCHAR(255) NOT NULL,
    CONSTRAINT pk_fotosser PRIMARY KEY (id_fotosser)
) ENGINE = InnoDB;

-- 8. Servicio
CREATE TABLE Servicio (
    id_servicio INT(10) NOT NULL AUTO_INCREMENT,
    servicio VARCHAR(30) NOT NULL,
    precio_ser DECIMAL(10,3) NOT NULL,
    durac_ser INT(3) NOT NULL,
    descripci INT(10) NOT NULL,
    id_categ INT(10) NOT NULL,
    id_fotosser INT(10) NOT NULL,
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

-- 9. Trabajador_Servicio
CREATE TABLE Trabajador_Servicio (
    Trabajadorid_trab INT(10) NOT NULL,
    Servicioid_servicio INT(10) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    CONSTRAINT pk_trabajador_servicio PRIMARY KEY (Trabajadorid_trab, Servicioid_servicio),
    CONSTRAINT fk_ts_trabajador FOREIGN KEY (Trabajadorid_trab)
        REFERENCES Trabajador (id_trab)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_ts_servicio FOREIGN KEY (Servicioid_servicio)
        REFERENCES Servicio (id_servicio)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 10. Tipodocumento
CREATE TABLE Tipodocumento (
    id_tdoc INT(10) NOT NULL AUTO_INCREMENT,
    tdoc TINYINT(3) NOT NULL,
    CONSTRAINT pk_tipodocumento PRIMARY KEY (id_tdoc)
) ENGINE = InnoDB;

-- 11. Cliente
CREATE TABLE Cliente (
    id_cliente INT(10) NOT NULL AUTO_INCREMENT,
    nom_clien VARCHAR(50) NOT NULL,
    ape_clie VARCHAR(50) NOT NULL,
    numdoc VARCHAR(11) NOT NULL,
    tlf VARCHAR(11) NOT NULL,
    correo VARCHAR(20) NOT NULL,
    Tipodocumentoid_tdoc INT(10) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_numdoc UNIQUE (numdoc),
    CONSTRAINT uq_cliente_tlf UNIQUE (tlf),
    CONSTRAINT uq_cliente_correo UNIQUE (correo),
    CONSTRAINT fk_cliente_tipodocumento FOREIGN KEY (Tipodocumentoid_tdoc)
        REFERENCES Tipodocumento (id_tdoc)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 12. login
CREATE TABLE `login` (
    id INT(10) NOT NULL AUTO_INCREMENT,
    `user` VARCHAR(20) NOT NULL,
    id_User INT(10) NOT NULL,
    pass VARCHAR(8) NOT NULL,
    CONSTRAINT pk_login PRIMARY KEY (id),
    CONSTRAINT fk_login_cliente FOREIGN KEY (id_User)
        REFERENCES Cliente (id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 13. Estadocita
CREATE TABLE Estadocita (
    id_escita INT(10) NOT NULL AUTO_INCREMENT,
    escita VARCHAR(25) NOT NULL,
    CONSTRAINT pk_estadocita PRIMARY KEY (id_escita)
) ENGINE = InnoDB;

-- 14. Reserva
CREATE TABLE Reserva (
    id_reserva INT(10) NOT NULL AUTO_INCREMENT,
    fechor_cita VARCHAR(20) NOT NULL,
    Estadocitaid_escita VARCHAR(60) NOT NULL,
    Clienteid_cliente INT(10) NOT NULL,
    CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (Clienteid_cliente)
        REFERENCES Cliente (id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 15. Reserva_Servicio
CREATE TABLE Reserva_Servicio (
    Reservaid_reserva INT(10) NOT NULL,
    Servicioid_servicio INT(10) NOT NULL,
    id_trab INT(10) NOT NULL,
    hora_inicio VARCHAR(10) NOT NULL,
    hora_fin VARCHAR(10) NOT NULL,
    Valor VARCHAR(25) NOT NULL,
    id_escita INT(10) NOT NULL,
    CONSTRAINT pk_reserva_servicio PRIMARY KEY (Reservaid_reserva, Servicioid_servicio),
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
        ON UPDATE CASCADE,
    CONSTRAINT fk_rs_estadocita FOREIGN KEY (id_escita)
        REFERENCES Estadocita (id_escita)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 16. Solicitudafi
CREATE TABLE Solicitudafi (
    id_solicitud INT(10) NOT NULL AUTO_INCREMENT,
    nom_prop VARCHAR(50) NOT NULL,
    docu_prop VARCHAR(11) NOT NULL,
    tlf VARCHAR(11) NOT NULL,
    correo VARCHAR(20) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    fecha_sol VARCHAR(20) NOT NULL,
    nom_peluq VARCHAR(50) NOT NULL,
    direccion VARCHAR(25) NOT NULL,
    ciudad VARCHAR(10) NOT NULL,
    fotos_peluq VARCHAR(255) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT pk_solicitudafi PRIMARY KEY (id_solicitud),
    CONSTRAINT uq_solicitudafi_docu UNIQUE (docu_prop),
    CONSTRAINT uq_solicitudafi_tlf UNIQUE (tlf),
    CONSTRAINT uq_solicitudafi_correo UNIQUE (correo)
) ENGINE = InnoDB;
