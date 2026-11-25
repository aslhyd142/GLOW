-- =====================================================================
-- DML - DATOS DE PRUEBA Y CONSULTAS
-- Modelo relacional GLOW GIRL
-- =====================================================================

USE glow_girl;

INSERT INTO categoria (categoria) VALUES
('Peluqueria'),
('Nails'),
('Lashista'),
('Skincare'),
('Makeup');

INSERT INTO peluqueria (horario, direccion, nombre, ciudad) VALUES
('8:00 - 18:00', 'Calle 93 # 15-42', 'Luxury Hair & Spa', 'Bogota'),
('9:00 - 19:00', 'Cra. 43A # 10-21', 'Studio Elite Nails', 'Medellin'),
('8:00 - 17:00', 'Calle 5 # 38-10', 'Peluqueria Sensacion', 'Cali'),
('8:30 - 18:30', 'Calle 72 # 54-21', 'Caribe Lash & Skin', 'Barranquilla'),
('9:00 - 18:00', 'Cra. 7 # 22-14', 'Encanto Estetica', 'Pereira');

INSERT INTO fotoscope (id_peluqueria, fotos) VALUES
(1, 'luxury-frente.jpg'),
(2, 'studio-elite-frente.jpg'),
(3, 'sensacion-cali-frente.jpg');

INSERT INTO solicitud (Solicitud) VALUES
('Solicitud pendiente de vinculación'),
('Solicitud aprobada'),
('Solicitud rechazada');

INSERT INTO trabajador (nom_trab, ape_trab, id_peluqueria, estado, id_solicitud) VALUES
('Camila', 'Rojas', 1, 'Activo', 2),
('Andrea', 'Perez', 1, 'Activo', 2),
('Julian', 'Mejia', 2, 'Activo', 2),
('Sofia', 'Castillo', 3, 'Activo', 2),
('Marcela', 'Henao', 4, 'Activo', 1),
('Diana', 'Torres', 5, 'Activo', 2);

INSERT INTO horario (dia_sem, hora_ini, hora_fin, estado, id_trab) VALUES
('Lunes', '08:00', '12:00', 'Disponible', 1),
('Martes', '13:00', '18:00', 'Disponible', 1),
('Lunes', '09:00', '17:00', 'Disponible', 2),
('Sabado', '09:00', '14:00', 'Disponible', 3),
('Viernes', '10:00', '18:00', 'Disponible', 4),
('Miercoles', '08:30', '16:30', 'Disponible', 6);

INSERT INTO servicio (id_categ, id_peluqueria, servicio, precio, dure_ser, descr, activo) VALUES
(1, 1, 'Corte Moderno y Blower', 50000.00, 50, 'Corte con cepillado', TRUE),
(1, 1, 'Balayage Premium', 250000.00, 180, 'Coloracion profesional', TRUE),
(2, 2, 'Manicure Semipermanente', 35000.00, 60, 'Esmaltado de larga duracion', TRUE),
(2, 2, 'Unas Acrilicas Esculpidas', 95000.00, 120, 'Extensiones con diseno', TRUE),
(3, 3, 'Extensiones Pelo a Pelo', 90000.00, 90, 'Extension natural', TRUE),
(4, 4, 'Limpieza Facial Profunda', 120000.00, 75, 'Limpieza con vapor', TRUE),
(5, 3, 'Maquillaje Social y Glam', 110000.00, 60, 'Maquillaje para eventos', TRUE),
(1, 5, 'Tratamiento de Keratina', 160000.00, 120, 'Alisado e hidratacion', TRUE),
(3, 1, 'Lifting de Pestanas', 75000.00, 45, 'Curvatura y nutricion', TRUE),
(2, 5, 'Pedicure Spa Relax', 45000.00, 50, 'Exfoliacion y esmalte', TRUE);

INSERT INTO trabajador_servicio (id_trab, id_servicio) VALUES
(1, 1), (1, 2), (1, 9),
(2, 1), (2, 8),
(3, 3), (3, 4),
(4, 5), (4, 7),
(5, 6),
(6, 8), (6, 10);

INSERT INTO cliente (nom_clen, ape_clie, numdoc, tlf, correo, tipodoc) VALUES
('Ana Maria', 'Gomez Ruiz', '1001001001', '3001112233', 'ana.gomez@correo.com', 'CC'),
('Carlos Andres', 'Perez Diaz', '1002002002', '3002223344', 'carlos.perez@correo.com', 'CC'),
('Luisa Fernanda', 'Martinez Rios', '1003003003', '3023334455', 'luisa.martinez@correo.com', 'CC'),
('Juan David', 'Restrepo Toro', '1004004004', '3034445566', 'juan.restrepo@correo.com', 'TI'),
('Valentina', 'Herrera Lopez', '1005005005', '3045556677', 'valentina.herrera@correo.com', 'CE');

INSERT INTO reserva (id_cliente, fecha_cita, estado_cita) VALUES
(1, '2026-12-01 10:15:00', 'Confirmada'),
(2, '2026-12-03 14:30:00', 'Pendiente'),
(1, '2026-12-10 09:00:00', 'Finalizada'),
(3, '2026-12-15 16:45:00', 'Confirmada'),
(4, '2026-12-20 11:20:00', 'Cancelada');

INSERT INTO reserva_servicio (id_reserva, id_servicio, id_trab, hora_inicio, hora_fin, valor) VALUES
(1, 1, 1, '10:15', '11:05', 50000.00),
(2, 3, 3, '14:30', '15:30', 35000.00),
(3, 9, 1, '09:00', '09:45', 75000.00),
(4, 5, 4, '16:45', '18:15', 90000.00),
(5, 2, 1, '11:20', '14:20', 250000.00);

-- Servicios ofrecidos por peluquería
SELECT p.nombre, p.ciudad, COUNT(s.id_servicio) AS total_servicios,
       AVG(s.precio) AS precio_promedio
FROM peluqueria p
LEFT JOIN servicio s ON s.id_peluqueria = p.id_peluqueria
GROUP BY p.id_peluqueria, p.nombre, p.ciudad;

-- Reservas con cliente, trabajador y servicio
SELECT r.id_reserva, r.fecha_cita, r.estado_cita,
       CONCAT(c.nom_clen, ' ', c.ape_clie) AS cliente,
       s.servicio, CONCAT(t.nom_trab, ' ', t.ape_trab) AS trabajador,
       rs.hora_inicio, rs.hora_fin, rs.valor
FROM reserva r
INNER JOIN cliente c ON c.id_cliente = r.id_cliente
INNER JOIN reserva_servicio rs ON rs.id_reserva = r.id_reserva
INNER JOIN servicio s ON s.id_servicio = rs.id_servicio
INNER JOIN trabajador t ON t.id_trab = rs.id_trab;

-- Trabajadores y los servicios que pueden realizar
SELECT CONCAT(t.nom_trab, ' ', t.ape_trab) AS trabajador,
       s.servicio, s.precio
FROM trabajador t
INNER JOIN trabajador_servicio ts ON ts.id_trab = t.id_trab
INNER JOIN servicio s ON s.id_servicio = ts.id_servicio
ORDER BY trabajador, s.servicio;
