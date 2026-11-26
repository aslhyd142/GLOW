/* =====================================================================
   SEGURIDAD EN BASE DE DATOS - GLOW GIRL (HASH + SALT SHA2)
   ===================================================================== */

USE glow_girl;

-- 1. Tabla de credenciales ligada a Cliente (no altera las 12 tablas base)
CREATE TABLE IF NOT EXISTS Cuenta_Acceso (
    id_cuenta INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NULL,
    usuario_login VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    password_hash CHAR(64) NOT NULL,
    salt CHAR(32) NOT NULL,
    rol VARCHAR(20) NOT NULL DEFAULT 'CLIENTE',
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    intentos_fallidos INT NOT NULL DEFAULT 0,
    bloqueado BOOLEAN NOT NULL DEFAULT FALSE,
    ultimo_acceso DATETIME NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_cuenta_acceso PRIMARY KEY (id_cuenta),
    CONSTRAINT uq_cuenta_usuario UNIQUE (usuario_login),
    CONSTRAINT uq_cuenta_correo UNIQUE (correo),
    CONSTRAINT ck_cuenta_rol CHECK (rol IN ('ADMIN', 'SALON', 'CLIENTE')),
    CONSTRAINT fk_cuenta_cliente FOREIGN KEY (id_cliente)
        REFERENCES Cliente (id_cliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 2. Tabla de auditoría de eventos de seguridad (nunca guarda clave)
CREATE TABLE IF NOT EXISTS Auditoria_Seguridad (
    id_auditoria INT NOT NULL AUTO_INCREMENT,
    id_cuenta INT NOT NULL,
    accion VARCHAR(30) NOT NULL,
    detalle VARCHAR(255) NULL,
    usuario_bd VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_auditoria_seguridad PRIMARY KEY (id_auditoria),
    CONSTRAINT fk_auditoria_cuenta FOREIGN KEY (id_cuenta)
        REFERENCES Cuenta_Acceso (id_cuenta)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 3. Limpiar procedimientos y trigger previos si existen
DROP PROCEDURE IF EXISTS sp_registrar_cuenta_glow;
DROP PROCEDURE IF EXISTS sp_login_glow;
DROP PROCEDURE IF EXISTS sp_cambiar_clave_glow;
DROP TRIGGER IF EXISTS trg_cuenta_acceso_auditoria;

DELIMITER //

-- 4. Registrar cuenta con política de contraseña + SALT + SHA2(256)
CREATE PROCEDURE sp_registrar_cuenta_glow(
    IN p_usuario_login VARCHAR(50),
    IN p_correo VARCHAR(100),
    IN p_password VARCHAR(100),
    IN p_rol VARCHAR(20),
    IN p_id_cliente INT
)
BEGIN
    DECLARE v_salt CHAR(32);

    IF CHAR_LENGTH(p_password) < 8
       OR CAST(p_password AS BINARY) = CAST(LOWER(p_password) AS BINARY)
       OR p_password NOT REGEXP '[0-9]' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La contraseña debe tener mínimo 8 caracteres, una mayúscula y un número';
    END IF;

    SET v_salt = LEFT(SHA2(CONCAT(UUID(), RAND(), NOW(6)), 256), 32);

    INSERT INTO Cuenta_Acceso (
        id_cliente,
        usuario_login,
        correo,
        password_hash,
        salt,
        rol
    )
    VALUES (
        p_id_cliente,
        p_usuario_login,
        p_correo,
        SHA2(CONCAT(v_salt, p_password), 256),
        v_salt,
        p_rol
    );
END //

-- 5. Validar inicio de sesión con bloqueo tras 3 intentos fallidos
CREATE PROCEDURE sp_login_glow(
    IN p_usuario_login VARCHAR(50),
    IN p_password VARCHAR(100),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_id INT DEFAULT NULL;
    DECLARE v_hash CHAR(64);
    DECLARE v_salt CHAR(32);
    DECLARE v_bloqueado BOOLEAN DEFAULT FALSE;
    DECLARE v_intentos INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_id = NULL;

    SELECT
        id_cuenta,
        password_hash,
        salt,
        bloqueado,
        intentos_fallidos
    INTO
        v_id,
        v_hash,
        v_salt,
        v_bloqueado,
        v_intentos
    FROM Cuenta_Acceso
    WHERE usuario_login = p_usuario_login
      AND activo = TRUE;

    IF v_id IS NULL THEN
        SET p_resultado = 'Usuario o contraseña incorrectos';
    ELSEIF v_bloqueado THEN
        SET p_resultado = 'Cuenta bloqueada. Contacte al administrador';
    ELSEIF v_hash = SHA2(CONCAT(v_salt, p_password), 256) THEN
        UPDATE Cuenta_Acceso
        SET intentos_fallidos = 0,
            ultimo_acceso = NOW()
        WHERE id_cuenta = v_id;
        SET p_resultado = 'Acceso concedido';
    ELSE
        UPDATE Cuenta_Acceso
        SET intentos_fallidos = COALESCE(v_intentos, 0) + 1,
            bloqueado = (COALESCE(v_intentos, 0) + 1 >= 3)
        WHERE id_cuenta = v_id;
        SET p_resultado = 'Usuario o contraseña incorrectos';
    END IF;
END //

-- 6. Cambiar contraseña generando un nuevo SALT
CREATE PROCEDURE sp_cambiar_clave_glow(
    IN p_usuario_login VARCHAR(50),
    IN p_password_actual VARCHAR(100),
    IN p_password_nueva VARCHAR(100),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_salt_nuevo CHAR(32);

    IF NOT EXISTS (
        SELECT 1
        FROM Cuenta_Acceso
        WHERE usuario_login = p_usuario_login
          AND password_hash = SHA2(CONCAT(salt, p_password_actual), 256)
    ) THEN
        SET p_resultado = 'La contraseña actual no es correcta';
    ELSEIF CHAR_LENGTH(p_password_nueva) < 8
       OR CAST(p_password_nueva AS BINARY) = CAST(LOWER(p_password_nueva) AS BINARY)
       OR p_password_nueva NOT REGEXP '[0-9]' THEN
        SET p_resultado = 'La nueva contraseña no cumple con la política';
    ELSE
        SET v_salt_nuevo = LEFT(SHA2(CONCAT(UUID(), RAND(), NOW(6)), 256), 32);

        UPDATE Cuenta_Acceso
        SET salt = v_salt_nuevo,
            password_hash = SHA2(CONCAT(v_salt_nuevo, p_password_nueva), 256)
        WHERE usuario_login = p_usuario_login;

        SET p_resultado = 'Contraseña actualizada correctamente';
    END IF;
END //

-- 7. Trigger de auditoría al cambiar contraseña o bloquear cuenta
CREATE TRIGGER trg_cuenta_acceso_auditoria
AFTER UPDATE ON Cuenta_Acceso
FOR EACH ROW
BEGIN
    IF NOT (NEW.password_hash <=> OLD.password_hash) THEN
        INSERT INTO Auditoria_Seguridad (id_cuenta, accion, detalle, usuario_bd)
        VALUES (NEW.id_cuenta, 'CAMBIO_PASSWORD', 'Se actualizó el hash de contraseña', CURRENT_USER());
    END IF;

    IF NEW.bloqueado = TRUE AND OLD.bloqueado = FALSE THEN
        INSERT INTO Auditoria_Seguridad (id_cuenta, accion, detalle, usuario_bd)
        VALUES (NEW.id_cuenta, 'BLOQUEO', 'Bloqueada tras 3 intentos fallidos', CURRENT_USER());
    END IF;
END //

DELIMITER ;

-- 8. Pruebas de demostración
CALL sp_registrar_cuenta_glow('ana_gomez', 'ana@correo.com', 'GlowGirl2026', 'CLIENTE', 1);
CALL sp_registrar_cuenta_glow('carlos_p', 'carlos@correo.com', 'Salon2026!', 'CLIENTE', 2);

SELECT id_cuenta, usuario_login, rol, salt, password_hash FROM Cuenta_Acceso;

CALL sp_login_glow('ana_gomez', 'GlowGirl2026', @res_login);
SELECT @res_login AS resultado_login;

CALL sp_cambiar_clave_glow('ana_gomez', 'GlowGirl2026', 'NuevaGlow2026', @res_cambio);
SELECT @res_cambio AS resultado_cambio;

SELECT * FROM Auditoria_Seguridad;