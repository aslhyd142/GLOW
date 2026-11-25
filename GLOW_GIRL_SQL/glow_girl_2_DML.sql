-- =====================================================================
-- DML - LENGUAJE DE MANIPULACIÓN DE DATOS (CON CRUD COMPLETO)
-- MODELO RELACIONAL GLOW GIRL
-- =====================================================================

USE glow_girl;


-- ---------------------------------------------------------------------
-- A. INSERTAR DATOS DE PRUEBA (CRUD - C = CREATE)
-- ---------------------------------------------------------------------

-- 1. Categoria
INSERT INTO Categoria (categoria) VALUES
('Peluqueria'),
('Nails'),
('Lashista'),
('Skincare'),
('Makeup');


-- 2. Fotosser
INSERT INTO Fotosser (fotosser) VALUES
('corte_blower.jpg'),
('balayage.jpg'),
('manicure_semi.jpg'),
('unas_acrilicas.jpg'),
('pestanas_pelo.jpg'),
('limpieza_facial.jpg'),
('maquillaje_social.jpg');


-- 3. Servicio
INSERT INTO Servicio
(servicio, precio_ser, durac_ser, descripci, id_categ, id_fotosser)
VALUES
('Corte Moderno', 50000.00, 50, 'Corte de cabello y blower', 1, 1),
('Balayage Premium', 250000.00, 180, 'Iluminacion y coloracion', 1, 2),
('Manicure Semi', 35000.00, 60, 'Esmaltado semipermanente', 2, 3),
('Unas Acrilicas', 95000.00, 120, 'Aplicacion de unas acrilicas', 2, 4),
('Pestanas Pelo a Pelo', 90000.00, 90, 'Extension pelo a pelo', 3, 5),
('Limpieza Facial', 120000.00, 75, 'Limpieza e hidratacion facial', 4, 6),
('Maquillaje Social', 80000.00, 60, 'Maquillaje para eventos', 5, 7);


-- 4. Fotospe
INSERT INTO Fotospe (fotos) VALUES
('salon_luxury_1.jpg'),
('salon_elite_1.jpg'),
('salon_sensacion_1.jpg'),
('salon_caribe_1.jpg'),
('salon_encanto_1.jpg');


-- 5. Peluqueria
INSERT INTO Peluqueria
(horapeluque, direccion, nombre, ciudad, Fotospeid_fotospe)
VALUES
('08:00-20:00', 'Calle 93 # 15-42', 'Luxury Hair', 'Bogota', 1),
('09:00-19:00', 'Cra. 43A # 10-21', 'Studio Elite', 'Medellin', 2),
('08:30-19:30', 'Calle 5 # 38-10', 'Sensacion Cali', 'Cali', 3),
('09:00-18:00', 'Calle 72 # 54-21', 'Caribe Lash', 'Barranquilla', 4),
('08:00-19:00', 'Cra. 7 # 22-14', 'Encanto Estetica', 'Pereira', 5);


-- 6. Solicitudafi
INSERT INTO Solicitudafi (Solicitud) VALUES
('Afiliacion Luxury Hair'),
('Afiliacion Studio Elite'),
('Afiliacion Sensacion Cali'),
('Afiliacion Caribe Lash'),
('Afiliacion Encanto Estetica');


-- 7. Trabajador
INSERT INTO Trabajador
(nom_tra, ape_tra, Peluqueriaid_peluqueria, estado, id_solicitud)
VALUES
('Camila', 'Rojas Soto', 1, 'Activo', 1),
('Andrea', 'Perez Gomez', 1, 'Activo', 1),
('Julian', 'Mejia Marin', 2, 'Activo', 2),
('Sofia', 'Castillo Ruiz', 3, 'Activo', 3),
('Marcela', 'Henao Restrepo', 4, 'Activo', 4),
('Diana', 'Torres Melo', 5, 'Activo', 5);


-- 8. Horario
INSERT INTO Horario
(dia_sem, hora_ini, horafin, estado, Trabajadorid_trab)
VALUES
(2, '08:00:00', '17:00:00', 'Disponible', 1),
(3, '09:00:00', '18:00:00', 'Disponible', 2),
(4, '09:00:00', '19:00:00', 'Disponible', 3),
(5, '10:00:00', '19:00:00', 'Disponible', 4),
(6, '08:00:00', '16:00:00', 'Disponible', 5);


-- 9. Trabajador_Servicio
INSERT INTO Trabajador_Servicio
(Trabajadorid_trab, Servicioid_servicio)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 7),
(3, 3),
(3, 4),
(4, 5),
(5, 6);


-- 10. Cliente
INSERT INTO Cliente
(nom_clien, ape_clie, numdoc, tlf, correo, tipodoc)
VALUES
('Ana Maria', 'Gomez Ruiz', '1001001001',
 '3001112233', 'ana@correo.com', 'CC'),

('Carlos', 'Perez Diaz', '1002002002',
 '3002223344', 'carlos@correo.com', 'CC'),

('Luisa', 'Martinez Rios', '1003003003',
 '3023334455', 'luisa@correo.com', 'CC'),

('Juan David', 'Restrepo', '1004004004',
 '3034445566', 'juan@correo.com', 'TI'),

('Valentina', 'Herrera', '1005005005',
 '3045556677', 'val@correo.com', 'CE');


-- 11. Reserva
INSERT INTO Reserva
(fechor_cita, Estadocitaid_escita, Clienteid_cliente)
VALUES
('2026-11-25 10:00:00', 'Finalizada', 1),
('2026-11-26 14:30:00', 'Confirmada', 2),
('2026-11-27 09:00:00', 'Pendiente', 3),
('2026-11-28 16:00:00', 'Cancelada', 4);


-- 12. Reserva_Servicio
INSERT INTO Reserva_Servicio
(Reservaid_reserva, Servicioid_servicio, id_trab, hora_inicio, hora_fin, valor, estado)
VALUES
(1, 1, 1, '10:00:00', '10:50:00', '50000.00', 'Finalizada'),
(2, 3, 3, '14:30:00', '15:30:00', '35000.00', 'Confirmada'),
(3, 5, 4, '09:00:00', '10:30:00', '90000.00', 'Pendiente'),
(4, 2, 1, '16:00:00', '19:00:00', '250000.00', 'Cancelada');


-- ---------------------------------------------------------------------
-- B. CONSULTAS BASICAS, FILTROS, ORDEN, LIMITES Y CASE
-- (CRUD - R = READ)
-- ---------------------------------------------------------------------

-- 1. Alias, BETWEEN, ORDER BY y LIMIT
SELECT
    servicio AS nombre_servicio,
    precio_ser AS precio,
    durac_ser AS duracion_min
FROM Servicio
WHERE precio_ser BETWEEN 40000 AND 150000
ORDER BY precio_ser DESC
LIMIT 3;


-- 2. IN, LIKE y CASE
SELECT
    CONCAT(nom_clien, ' ', ape_clie) AS cliente_completo,
    tipodoc,
    CASE
        WHEN tipodoc = 'CC' THEN 'Cedula de ciudadania'
        WHEN tipodoc = 'TI' THEN 'Tarjeta de identidad'
        ELSE 'Documento de extranjeria'
    END AS descripcion_documento
FROM Cliente
WHERE ape_clie LIKE '%R%'
AND tipodoc IN ('CC', 'TI', 'CE');


-- ---------------------------------------------------------------------
-- C. JOINS, AGRUPACIONES Y SUBCONSULTAS
-- (CRUD - R = READ AVANZADO)
-- ---------------------------------------------------------------------

-- 3. INNER JOIN MULTIPLE:
-- Reservas con cliente, peluqueria, servicio y trabajador
SELECT
    r.id_reserva,
    CONCAT(cl.nom_clien, ' ', cl.ape_clie) AS cliente,
    pe.nombre AS peluqueria,
    pe.ciudad,
    s.servicio,
    CONCAT(t.nom_tra, ' ', t.ape_tra) AS trabajador,
    rs.hora_inicio,
    rs.hora_fin,
    r.Estadocitaid_escita AS estado_reserva
FROM Reserva r
INNER JOIN Cliente cl
    ON r.Clienteid_cliente = cl.id_cliente
INNER JOIN Reserva_Servicio rs
    ON r.id_reserva = rs.Reservaid_reserva
INNER JOIN Servicio s
    ON rs.Servicioid_servicio = s.id_servicio
INNER JOIN Trabajador t
    ON rs.id_trab = t.id_trab
INNER JOIN Peluqueria pe
    ON t.Peluqueriaid_peluqueria = pe.id_peluqueria;


-- 4. LEFT JOIN + GROUP BY + COUNT + AVG + HAVING
-- Consultar servicios y precio promedio por categoria
SELECT
    c.categoria,
    COUNT(s.id_servicio) AS total_servicios,
    AVG(s.precio_ser) AS precio_promedio
FROM Categoria c
LEFT JOIN Servicio s
    ON c.id_categ = s.id_categ
GROUP BY c.id_categ, c.categoria
HAVING COUNT(s.id_servicio) >= 1;


-- 5. SUBCONSULTA ESCALAR:
-- Servicios cuyo precio supera el promedio general
SELECT
    servicio,
    precio_ser
FROM Servicio
WHERE precio_ser > (
    SELECT AVG(precio_ser)
    FROM Servicio
);


-- 6. SUBCONSULTA CON NOT EXISTS:
-- Categorias sin servicios registrados
SELECT
    c.categoria
FROM Categoria c
WHERE NOT EXISTS (
    SELECT 1
    FROM Servicio s
    WHERE s.id_categ = c.id_categ
);


-- ---------------------------------------------------------------------
-- D. CICLO CRUD COMPLETO EN VIVO (C -> R -> U -> D)
-- ---------------------------------------------------------------------

-- C (Create): Registrar un cliente de prueba
INSERT INTO Cliente
(nom_clien, ape_clie, numdoc, tlf, correo, tipodoc)
VALUES
('Sofia', 'Cardona Mejia', '1009009009',
 '3109990000', 'sofia@correo.com', 'CC');

-- R (Read): Consultar el cliente recien creado
SELECT *
FROM Cliente
WHERE numdoc = '1009009009';

-- U (Update): Actualizar telefono y correo del cliente
UPDATE Cliente
SET tlf = '3201234567',
    correo = 'sofia.c@correo.com'
WHERE numdoc = '1009009009';

-- R (Read): Verificar la actualizacion
SELECT *
FROM Cliente
WHERE numdoc = '1009009009';

-- D (Delete): Eliminar el cliente de prueba
DELETE FROM Cliente
WHERE numdoc = '1009009009';

-- R (Read): Confirmar que ya fue eliminado
SELECT *
FROM Cliente
WHERE numdoc = '1009009009';


-- ---------------------------------------------------------------------
-- E. ACTUALIZACIONES, ELIMINACIONES Y TRANSACCIONES
-- (CRUD - U = UPDATE / D = DELETE)
-- ---------------------------------------------------------------------

-- 7. UPDATE: Cambiar disponibilidad de un horario
UPDATE Horario
SET estado = 'Ocupado'
WHERE id_hor = 1;


-- 8. DELETE:
-- Eliminar primero el detalle y luego la reserva cancelada
DELETE FROM Reserva_Servicio
WHERE Reservaid_reserva = 4;

DELETE FROM Reserva
WHERE id_reserva = 4
AND Estadocitaid_escita = 'Cancelada';


-- 9. TRANSACCION CON ROLLBACK:
-- Realizar un cambio y despues revertirlo
START TRANSACTION;

UPDATE Horario
SET estado = 'No disponible'
WHERE id_hor = 2;

SELECT id_hor, estado
FROM Horario
WHERE id_hor = 2;

ROLLBACK;

SELECT id_hor, estado
FROM Horario
WHERE id_hor = 2;


-- 10. TRANSACCION CON COMMIT:
-- Confirmar un cambio de forma permanente
START TRANSACTION;

UPDATE Peluqueria
SET horapeluque = '08:00-21:00'
WHERE id_peluqueria = 1;

COMMIT;

SELECT
    id_peluqueria,
    nombre,
    horapeluque
FROM Peluqueria
WHERE id_peluqueria = 1;


-- ---------------------------------------------------------------------
-- F. DEMOSTRACION DE SEGURIDAD:
-- HASH (SHA2) + SALT
-- ---------------------------------------------------------------------

SELECT
    SHA2(CONCAT('salt_usuario_1', 'Clave123*'), 256)
    AS hash_usuario_1,

    SHA2(CONCAT('salt_usuario_2', 'Clave123*'), 256)
    AS hash_usuario_2;





