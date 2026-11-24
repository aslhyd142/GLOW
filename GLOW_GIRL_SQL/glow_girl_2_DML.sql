-- =====================================================================
-- DML - LENGUAJE DE MANIPULACIÓN DE DATOS (GLOW GIRL)
-- =====================================================================

USE glow_girl;

-- ---------------------------------------------------------------------
-- A. INSERTAR PELUQUERÍAS AFILIADAS (Con sus nombres propios y ciudades)
-- ---------------------------------------------------------------------
INSERT INTO peluquerias (nit, nombre_salon, direccion, ciudad, telefono, email, estado) VALUES
('900123456-1', 'Luxury Hair & Spa', 'Calle 93 # 15-42', 'Bogota', '3101112233', 'contacto@luxuryhair.com', 'Activa'),
('900654321-2', 'Studio Élite Nails & Makeup', 'Cra. 43A # 10-21', 'Medellin', '3202223344', 'info@elite-studio.com', 'Activa'),
('900987654-3', 'Peluquería Sensación Cali', 'Calle 5 # 38-10', 'Cali', '3153334455', 'citas@sensacioncali.com', 'Activa'),
('900112233-4', 'Caribe Lash & Skincare', 'Calle 72 # 54-21', 'Barranquilla', '3004445566', 'caribeskincare@correo.com', 'Pendiente'),
('900445566-5', 'Encanto Estética Integral', 'Cra. 7 # 22-14', 'Pereira', '3125556677', 'encanto@estetica.com', 'Activa');

-- ---------------------------------------------------------------------
-- B. INSERTAR CATEGORÍAS DE SERVICIOS
-- ---------------------------------------------------------------------
INSERT INTO categorias_servicios (nombre, descripcion) VALUES
('Peluquería', 'Cortes, tintes, cepillados y tratamientos capilares'),
('Nails', 'Manicure, pedicure, uñas acrílicas y semipermanentes'),
('Lashista', 'Extensiones de pestañas pelo a pelo y lifting'),
('Skincare', 'Limpiezas faciales profundas e hidratación'),
('Makeup', 'Maquillaje profesional para eventos y sociales');

-- ---------------------------------------------------------------------
-- C. INSERTAR SERVICIOS (Asociados a cada peluquería independiente)
-- ---------------------------------------------------------------------
INSERT INTO servicios (id_categoria, id_peluqueria, nombre, descripcion, precio, duracion_minutos, activo) VALUES
(1, 1, 'Corte Moderno y Blower', 'Corte con asesoría de imagen y cepillado', 50000.00, 50, TRUE),
(1, 1, 'Balayage Premium', 'Técnica de coloración en tendencia', 250000.00, 180, TRUE),
(2, 2, 'Manicure Semipermanente', 'Esmaltado de larga duración', 35000.00, 60, TRUE),
(2, 2, 'Uñas Acrílicas Esculpidas', 'Extensiones en acrílico con diseño', 95000.00, 120, TRUE),
(3, 3, 'Extensiones Pelo a Pelo', 'Efecto rímel natural', 90000.00, 90, TRUE),
(4, 4, 'Limpieza Facial Profunda', 'Incluye alta frecuencia y vapor', 120000.00, 75, TRUE),
(5, 3, 'Maquillaje Social y Glam', 'Maquillaje profesional de alta duración', 110000.00, 60, TRUE),
(1, 5, 'Tratamiento de Keratina', 'Alisado e hidratación profunda', 160000.00, 120, TRUE),
(3, 1, 'Lifting de Pestañas', 'Curvatura orgánica con nutrición', 75000.00, 45, TRUE),
(2, 5, 'Pedicure Spa Relax', 'Exfoliación, mascarilla y esmalte', 45000.00, 50, TRUE);

-- ---------------------------------------------------------------------
-- D. INSERTAR PROFESIONALES DE CADA SALÓN
-- ---------------------------------------------------------------------
INSERT INTO profesionales (id_peluqueria, nombres, apellidos, especialidad, activo) VALUES
(1, 'Camila', 'Rojas Soto', 'Master Colorista', TRUE),
(1, 'Andrea', 'Pérez Gómez', 'Especialista Capilar', TRUE),
(2, 'Julian', 'Mejía Marín', 'Nail Artist', TRUE),
(3, 'Sofia', 'Castillo Ruiz', 'Lashista Profesional', TRUE),
(4, 'Marcela', 'Henao Restrepo', 'Cosmetóloga', TRUE),
(5, 'Diana', 'Torres Melo', 'Estilista Integral', TRUE);

-- ---------------------------------------------------------------------
-- E. INSERTAR CLIENTES
-- ---------------------------------------------------------------------
INSERT INTO clientes (tipo_documento, numero_documento, nombres, apellidos, email, telefono, ciudad_residencia) VALUES
('CC', '1001001001', 'Ana Maria', 'Gomez Ruiz', 'ana.gomez@correo.com', '3001112233', 'Bogota'),
('CC', '1002002002', 'Carlos Andres', 'Perez Diaz', 'carlos.perez@correo.com', '3002223344', 'Medellin'),
('CC', '1003003003', 'Luisa Fernanda', 'Martinez Rios', 'luisa.martinez@correo.com', '3023334455', 'Cali'),
('TI', '1004004004', 'Juan David', 'Restrepo Toro', 'juan.restrepo@correo.com', '3034445566', 'Bogota'),
('CE', '1005005005', 'Valentina', 'Herrera Lopez', 'valentina.herrera@correo.com', '3045556677', 'Barranquilla'),
('CC', '1006006006', 'Santiago', 'Ramirez Castro', 'santiago.ramirez@correo.com', '3056667788', 'Medellin'),
('CC', '1007007007', 'Daniela', 'Ospina Vargas', 'daniela.ospina@correo.com', '3066677888', 'Pereira');

-- ---------------------------------------------------------------------
-- F. INSERTAR CITAS DE PRUEBA
-- ---------------------------------------------------------------------
INSERT INTO citas (id_cliente, id_peluqueria, id_servicio, id_profesional, fecha_hora_cita, estado, calificacion, comentario_calificacion) VALUES
(1, 1, 1, 1, '2026-08-01 10:15:00', 'Finalizada', 5, 'Excelente atención en Luxury Hair'),
(2, 2, 3, 3, '2026-08-03 14:30:00', 'Finalizada', 4, 'Hermosas uñas en Studio Élite'),
(1, 1, 9, 2, '2026-08-10 09:00:00', 'Finalizada', 5, 'Muy buen resultado'),
(3, 3, 5, 4, '2026-08-15 16:45:00', 'Finalizada', 5, 'Las pestañas quedaron perfectas'),
(4, 1, 2, 1, '2026-08-20 11:20:00', 'Cancelada', NULL, NULL),
(5, 4, 6, 5, '2026-09-02 08:10:00', 'Pendiente', NULL, NULL),
(6, 3, 7, 4, '2026-09-05 19:00:00', 'Finalizada', 4, 'Excelente maquillaje social'),
(2, 5, 8, 6, '2026-09-12 12:00:00', 'Confirmada', NULL, NULL);

-- =====================================================================
-- G.SECCIÓN: INSERTAR USUARIOS DE PRUEBA (Control de Acceso y Seguridad)
-- ¿Qué hace este código?: Inserta los usuarios para el inicio de sesión 
-- en el aplicativo web Glow Girl, asignando roles (CLIENTE, ADMIN) y 
-- asegurando el cifrado de las contraseñas.
-- NOTA: La contraseña en texto plano para iniciar sesión con todos es: "password"
-- =====================================================================
INSERT INTO usuarios (id_cliente, nombre_usuario, email, password_hash, salt, rol, activo, intentos_fallidos, bloqueado) VALUES
-- password_hash: Guarda la contraseña cifrada de forma irreversible con SHA-256 (Texto plano original: "password")
-- salt: Es una cadena aleatoria extra que se le añade a la clave antes de cifrarla por seguridad
(1, 'ana_gomez', 'ana.gomez@correo.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'abc123saltsecure4567890123456789ab', 'CLIENTE', TRUE, 0, FALSE),

-- Usuario 2: Cliente Carlos (Contraseña original en texto plano: "password")
(2, 'carlos_perez', 'carlos.perez@correo.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'xyz789saltsecure1234567890123456xy', 'CLIENTE', TRUE, 0, FALSE),

-- Usuario 3: Administrador general del sistema (Contraseña original en texto plano: "password")
(NULL, 'admin_general', 'admin@glowgirl.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'adminsecuretoken99988877766654321a', 'ADMIN_GENERAL', TRUE, 0, FALSE),

-- Usuario 4: Administrador de una peluquería afiliada (Contraseña original en texto plano: "password")
(NULL, 'admin_luxury', 'contacto@luxuryhair.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'salthelperluxury11122233344455566', 'ADMIN_PELUQUERIA', TRUE, 0, FALSE);
----------------------------------------------------------------------------
-- H. Insertar registros de prueba en la tabla notificaciones vinculados a las citas existentes
----------------------------------------------------------------------------
INSERT INTO notificaciones (id_cita, tipo_mensaje, canal, estado_envio) VALUES
(1, 'RECORDATORIO_24H', 'EMAIL', 'Enviada'),
(2, 'RECORDATORIO_24H', 'WHATSAPP', 'Enviada'),
(3, 'RECORDATORIO_24H', 'EMAIL', 'Enviada');
-- ---------------------------------------------------------------------
-- I. CONSULTAS CON FILTROS, ORDEN, LÍMITES, JOINS Y AGRUPACIONES
-- ---------------------------------------------------------------------

-- 1. Consulta con JOIN múltiple: Ver citas mostrando el nombre de la peluquería, la ciudad y el servicio
SELECT 
    c.id_cita,
    CONCAT(cl.nombres, ' ', cl.apellidos) AS cliente,
    p.nombre_salon AS peluqueria,
    p.ciudad AS ciudad_salon,
    s.nombre AS servicio,
    c.fecha_hora_cita,
    c.estado
FROM citas c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
INNER JOIN peluquerias p ON c.id_peluqueria = p.id_peluqueria
INNER JOIN servicios s ON c.id_servicio = s.id_servicio;

-- 2. Filtros con WHERE y operadores lógicos (Servicios en rango de precio)
SELECT nombre, precio, duracion_minutos
FROM servicios
WHERE precio BETWEEN 40000 AND 120000
ORDER BY precio ASC;

-- 3. Agrupación (GROUP BY) y Agregación: Conocer cuántos servicios ofrece cada peluquería afiliada
SELECT 
    p.nombre_salon,
    p.ciudad,
    COUNT(s.id_servicio) AS total_servicios_ofrecidos,
    AVG(s.precio) AS precio_promedio
FROM peluquerias p
LEFT JOIN servicios s ON p.id_peluqueria = s.id_peluqueria
GROUP BY p.id_peluqueria, p.nombre_salon, p.ciudad;

-- 4. Subconsulta: Mostrar los servicios cuyo precio supere el promedio general
SELECT nombre, precio
FROM servicios
WHERE precio > (SELECT AVG(precio) FROM servicios);

-- 5. Actualizar (UPDATE) un dato de prueba
UPDATE peluquerias 
SET estado = 'Activa' 
WHERE ciudad = 'Barranquilla';

-- 6. Eliminar (DELETE) una cita de prueba cancelada
DELETE FROM citas 
WHERE estado = 'Cancelado';

