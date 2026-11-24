-- =====================================================================
-- DML - LENGUAJE DE MANIPULACIÓN DE DATOS (MODELO RELACIONAL GLOW GIRL)
-- =====================================================================

USE glow_girl;

-- 1. Ciudad
INSERT INTO Ciudad (ciudad) VALUES
('Bogota'),
('Medellin'),
('Cali'),
('Barranquilla'),
('Pereira');

-- 2. Fotospe
INSERT INTO Fotospe (fotos) VALUES
('salon_luxury_1.jpg'),
('salon_elite_1.jpg'),
('salon_sensacion_1.jpg'),
('salon_caribe_1.jpg'),
('salon_encanto_1.jpg');

-- 3. Peluqueria
INSERT INTO Peluqueria (horapeluque, direccion, nombre, Ciudadid_ciudad, Fotospeid_fotospe) VALUES
('08:00-20:00', 'Calle 93 # 15-42', 'Luxury Hair', 1, 1),
('09:00-19:00', 'Cra. 43A # 10-21', 'Studio Elite', 2, 2),
('08:30-19:30', 'Calle 5 # 38-10', 'Sensacion Cali', 3, 3),
('09:00-18:00', 'Calle 72 # 54-21', 'Caribe Lash', 4, 4),
('08:00-19:00', 'Cra. 7 # 22-14', 'Encanto Estetica', 5, 5);

-- 4. Trabajador
INSERT INTO Trabajador (nom_tra, ape_tra, Peluqueriaid_peluqueria) VALUES
('Camila', 'Rojas Soto', 1),
('Andrea', 'Perez Gomez', 1),
('Julian', 'Mejia Marin', 2),
('Sofia', 'Castillo Ruiz', 3),
('Marcela', 'Henao Restrepo', 4),
('Diana', 'Torres Melo', 5);

-- 5. Horario
INSERT INTO Horario (dia_sem, hora_ini, horafin, estado, Trabajadorid_trab) VALUES
(2, '08:00', '17:00', 'Disponible', 1),
(3, '09:00', '18:00', 'Disponible', 2),
(4, '09:00', '19:00', 'Disponible', 3),
(5, '10:00', '19:00', 'Disponible', 4),
(6, '08:00', '16:00', 'Disponible', 5);

-- 6. Categoria
INSERT INTO Categoria (categoria) VALUES
('Peluqueria'),
('Nails'),
('Lashista'),
('Skincare'),
('Makeup');

-- 7. Fotosser
INSERT INTO Fotosser (fotosser) VALUES
('corte_blower.jpg'),
('balayage.jpg'),
('manicure_semi.jpg'),
('unas_acrilicas.jpg'),
('pestanas_pelo.jpg'),
('limpieza_facial.jpg');

-- 8. Servicio (descripci es INT(10) según el diagrama)
INSERT INTO Servicio (servicio, precio_ser, durac_ser, descripci, id_categ, id_fotosser) VALUES
('Corte Moderno', 50.000, 50, 101, 1, 1),
('Balayage Premium', 250.000, 180, 102, 1, 2),
('Manicure Semi', 35.000, 60, 103, 2, 3),
('Unas Acrilicas', 95.000, 120, 104, 2, 4),
('Pestanas Pelo a Pelo', 90.000, 90, 105, 3, 5),
('Limpieza Facial', 120.000, 75, 106, 4, 6);

-- 9. Trabajador_Servicio
INSERT INTO Trabajador_Servicio (Trabajadorid_trab, Servicioid_servicio, estado) VALUES
(1, 1, 'Activo'),
(1, 2, 'Activo'),
(2, 1, 'Activo'),
(3, 3, 'Activo'),
(3, 4, 'Activo'),
(4, 5, 'Activo'),
(5, 6, 'Activo');

-- 10. Tipodocumento (tdoc es TINYINT(3) según el diagrama)
INSERT INTO Tipodocumento (tdoc) VALUES
(1),
(2),
(3);

-- 11. Cliente
INSERT INTO Cliente (nom_clien, ape_clie, numdoc, tlf, correo, Tipodocumentoid_tdoc) VALUES
('Ana Maria', 'Gomez Ruiz', '1001001001', '3001112233', 'ana@correo.com', 1),
('Carlos', 'Perez Diaz', '1002002002', '3002223344', 'carlos@correo.com', 1),
('Luisa', 'Martinez Rios', '1003003003', '3023334455', 'luisa@correo.com', 1),
('Juan David', 'Restrepo', '1004004004', '3034445566', 'juan@correo.com', 2),
('Valentina', 'Herrera', '1005005005', '3045556677', 'val@correo.com', 3);

-- 12. login (Clave de prueba: 'Clave123*' cifrada con SALT + SHA2(..., 256);
-- si en el DDL `pass` es VARCHAR(8), LEFT(..., 8) evita truncamiento o puedes cambiar `pass` a CHAR(64))
INSERT INTO `login` (`user`, id_User, pass) VALUES
('ana_gomez', 1, LEFT(SHA2(CONCAT('abc123salt1', 'Clave123*'), 256), 8)),
('carlos_p', 2, LEFT(SHA2(CONCAT('xyz789salt2', 'Clave123*'), 256), 8)),
('luisa_m', 3, LEFT(SHA2(CONCAT('qwe456salt3', 'Clave123*'), 256), 8));

-- 13. Estadocita
INSERT INTO Estadocita (escita) VALUES
('Pendiente'),
('Confirmada'),
('Finalizada'),
('Cancelada');

-- 14. Reserva
INSERT INTO Reserva (fechor_cita, Estadocitaid_escita, Clienteid_cliente) VALUES
('2026-11-25 10:00', '3', 1),
('2026-11-26 14:30', '2', 2),
('2026-11-27 09:00', '1', 3),
('2026-11-28 16:00', '4', 4);

-- 15. Reserva_Servicio
INSERT INTO Reserva_Servicio (Reservaid_reserva, Servicioid_servicio, id_trab, hora_inicio, hora_fin, Valor, id_escita) VALUES
(1, 1, 1, '10:00', '10:50', '50000', 3),
(2, 3, 3, '14:30', '15:30', '35000', 2),
(3, 5, 4, '09:00', '10:30', '90000', 1),
(4, 2, 1, '16:00', '19:00', '250000', 4);

-- 16. Solicitudafi
INSERT INTO Solicitudafi (nom_prop, docu_prop, tlf, correo, estado, fecha_sol, nom_peluq, direccion, ciudad, fotos_peluq, descripcion) VALUES
('Laura Sofia', '1099887766', '3112223344', 'laura@salon.com', 'Pendiente', '2026-11-20', 'Glow Studio', 'Calle 80 # 12-5', 'Bogota', 'glow1.jpg', 'Salon de nails y lashes');

-- =====================================================================
-- CONSULTAS DE PRUEBA
-- =====================================================================

-- 1. INNER JOIN: Ver reservas con cliente, servicio y trabajador
SELECT
    r.id_reserva,
    CONCAT(cl.nom_clien, ' ', cl.ape_clie) AS cliente,
    s.servicio,
    CONCAT(t.nom_tra, ' ', t.ape_tra) AS trabajador,
    rs.hora_inicio,
    rs.hora_fin,
    ec.escita AS estado_cita
FROM Reserva r
INNER JOIN Cliente cl ON r.Clienteid_cliente = cl.id_cliente
INNER JOIN Reserva_Servicio rs ON r.id_reserva = rs.Reservaid_reserva
INNER JOIN Servicio s ON rs.Servicioid_servicio = s.id_servicio
INNER JOIN Trabajador t ON rs.id_trab = t.id_trab
INNER JOIN Estadocita ec ON rs.id_escita = ec.id_escita;

-- 2. GROUP BY con COUNT y AVG por categoría de servicio
SELECT
    c.categoria,
    COUNT(s.id_servicio) AS total_servicios,
    AVG(s.precio_ser) AS precio_promedio
FROM Categoria c
LEFT JOIN Servicio s ON c.id_categ = s.id_categ
GROUP BY c.id_categ, c.categoria;

-- 3. Subconsulta: Servicios con precio superior al promedio
SELECT servicio, precio_ser
FROM Servicio
WHERE precio_ser > (SELECT AVG(precio_ser) FROM Servicio);

-- 4. UPDATE: Cambiar estado de un horario
UPDATE Horario
SET estado = 'Ocupado'
WHERE id_hor = 1;

-- 5. DELETE: Eliminar un registro de prueba en Solicitudafi
DELETE FROM Solicitudafi
WHERE id_solicitud = 1;


