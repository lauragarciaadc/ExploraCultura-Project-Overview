-- Datos de poblado de tabla. Datos base: 
INSERT INTO Turista (correo, telefono, contrasena, nombre, fechaRegistro, verificado, geolocalizacionActiva)
VALUES
('ana@ejemplo.com', '324 743 023', 'ana2013perez', 'Ana Pérez', '2024-10-20', TRUE, TRUE),
('lucia@ejemplo.com', '354 912 240', '1234soylucia', 'Lucía Ruiz', '2023-10-30', TRUE, TRUE),
('maria@ejemplo.com', '111222333', 'mariaPass123', 'María Sánchez', '2024-01-15', TRUE, TRUE),
('pedro@ejemplo.com', '444555666', 'pedro12345', 'Pedro Martínez', '2024-01-16', TRUE, TRUE),
('sofia@ejemplo.com', '777888999', 'sofiaPass9', 'Sofía López', '2024-02-01', TRUE, TRUE), 
('juan@ejemplo.com', '555444333', 'juan2024Pass', 'Juan Fernández', '2024-02-10', TRUE, TRUE),
('laura@ejemplo.com', '111333555', 'lauraSecure12', 'Laura Gómez', '2024-02-12', TRUE, TRUE);

INSERT INTO Lugar (nombre, descripcion, direccion, categoria, rangoEdad, multimedia, estaFiltrado)
VALUES
('La Giralda', 'Icono de Sevilla, La Giralda es la torre campanario de la catedral de Santa María de la Sede.', 'Av. de la Constitución, Casco Antiguo, Sevilla', 'Cultural', 'Todos', '{"fotos":["giralda1.jpg","giralda2.jpg"]}', TRUE),
('Plaza de España', 'Un lugar majestuoso con historia y arquitectura.', 'Av de Isabel la Católica, Sevilla', 'Cultural', 'Todos', '{"fotos":["plaza1.jpg"]}', TRUE),
('Parque María Luisa', 'Parque público con jardines hermosos.', 'Avenida de María Luisa, Sevilla', 'Aventura', 'Todos', '{"fotos":["parque.jpg"]}', TRUE),
('Café del Arte', 'Cafetería acogedora con temática artística.', 'Calle Pintor Rosales 15, Madrid', 'Gastronómico', 'Todos', '{"fotos":["cafe.jpg"]}', TRUE),
('Guía Turística Sevilla', 'Ofrecemos rutas guiadas personalizadas por Sevilla.', 'Sevilla', 'Cultural', 'Todos', '{"fotos":["guia.jpg"]}', TRUE),
('Mercado Central', 'Un mercado lleno de productos frescos y locales.', 'Calle Mayor, Sevilla', 'Compras', 'Todos', '{"fotos":["mercado.jpg"]}', TRUE),
('Museo del Flamenco', 'Un museo dedicado al arte del flamenco.', 'Calle Flamenco 12, Sevilla', 'Cultural', 'Todos', '{"fotos":["flamenco.jpg"]}', TRUE);
INSERT INTO comercioLocal (id, horario, enlaceWeb)
VALUES
(4, '9:00 - 21:00', 'http://cafedelarte.com'),
(5, 'Bajo reserva', 'http://guiasevillana.com'),
(6, '7:00 - 15:00', 'http://mercadocentral.com'),
(7, '10:00 - 18:00', 'http://museoflamenco.com');

INSERT INTO resena(turistaId, lugarId, puntuacion, contenido, fecha, multimedia, estaFiltrado)
VALUES
(1, 3, 3, 'Un lugar ideal para relajarte con tus cercanos y disfrutar de un ambiente tranquilo y agradable.', '2024-11-20', '{"fotos":["reseña1.jpg"]}', TRUE),
(2, 3, 3, 'Un poco decepcionante, pero aun así cumple lo que promete en muchos aspectos.', '2024-11-20', NULL, TRUE),
(1, 1, 5, 'Perfecto, nada más que añadir. Experiencia excelente.', '2024-11-20', '{"fotos":["reseña3.jpg"]}', TRUE),
(2, 4, 4, 'Excelente café con un ambiente acogedor.', '2024-11-22', '{"fotos":["reseña_cafe.jpg"]}', TRUE),
(3, 5, 5, 'Una experiencia turística única, muy recomendable.', '2024-11-23', '{"fotos":["reseña_guia.jpg"]}', TRUE),
(4, 6, 4, 'Un mercado vibrante con mucha variedad de productos frescos.', '2024-11-24', '{"fotos":["reseña_mercado.jpg"]}', TRUE),
(5, 7, 5, 'Una exhibición maravillosa del arte flamenco. Vale la pena visitar.', '2024-11-25', '{"fotos":["reseña_flamenco.jpg"]}', TRUE);

INSERT INTO Evento (lugarId, nombre, fechaInicio, fechaFin, descripcion)
VALUES
(1, 'Festival Cultural de Sevilla', '2024-12-01', '2024-12-10', 'Un evento cultural con actividades para todas las edades.'),
(3, 'Exposición de Arte Local', '2024-12-15', '2024-12-20', 'Exposición de arte contemporáneo en el parque.'),
(4, 'Cata de Café', '2024-12-12', '2024-12-12', 'Disfruta de una cata especial de cafés locales.'),
(5, 'Ruta Histórica', '2024-12-05', '2024-12-10', 'Descubre la historia de Sevilla con guías locales.'),
(6, 'Feria del Mercado', '2024-12-01', '2024-12-03', 'Venta especial de productos locales.'),
(7, 'Espectáculo Flamenco', '2024-12-10', '2024-12-15', 'Actuaciones diarias de flamenco en el museo.');


 -- CASOS DE PRUEBA

-- 1: Registro de Turistas
-- registro exitoso
CALL registrarTurista('mario@example.com', '324743004', 'password123', 'Mario López', TRUE, TRUE);
-- correo duplicado: 'el turista ya está registrado'
CALL registrarTurista('ana@ejemplo.com', '123456789', 'securePass123', 'Ana Pérez', TRUE, TRUE);
-- telefono duplicado
CALL registrarTurista('unique.email@mail.com', '354912240', 'uniquePass123', 'Turista Único', TRUE, TRUE);
-- contraseña invalida
CALL registrarTurista('jose@example.com', '987654321', 'short', 'José Martínez', TRUE, TRUE);
-- no verificado
CALL registrarTurista('unverified@example.com', '987654322', 'unverified123', 'Turista No Verificado', FALSE, TRUE);
 -- geolocalización desactivada
CALL registrarTurista('geo.false@example.com', '777888999', 'geoPassTest', 'Geo No Activo', TRUE, FALSE);



-- 2: Nuevas Reseñas
CALL NuevaReseña(1, 2, 4.5, 'Una experiencia fantástica en un lugar hermoso.',TRUE);
CALL NuevaReseña(3, 2, 5, 'Lugar precioso que hay que visitar si se viene a Sevilla.',TRUE); -- inserción exitosa
CALL NuevaReseña(999, 3, 4.5, 'Muy bonito lugar',TRUE); -- 'El turista especificado no existe'
CALL NuevaReseña(1, 999, 3.5, 'Bonito pero necesita mejoras.',TRUE); --'El lugar especificado no existe'
CALL NuevaReseña(1, 3, 6.0, 'Reseña no válida.',TRUE); -- 'La puntuación debe estar entre 1 y 5'
CALL NuevaReseña(1, 6, 4.0, 'Muy bueno.',TRUE); -- 'El contenido de la reseña debe tener al menos 10 caracteres.'


-- 3: Nuevas visitas
CALL RegistrarVisitas(1, 7, NULL);
CALL RegistrarVisitas(2, 6, '2024-03-15'); -- inserción exitosa con fecha específica
CALL RegistrarVisitas(3, 3, '2024-02-20'); -- inserción con fecha específica válida
CALL RegistrarVisitas(999, 1, '2024-03-15'); -- Turista con ID 999 no existe
CALL RegistrarVisitas(1, 999, '2024-03-15'); -- Lugar con ID 999 no existe
-- registro duplicado con fecha específica
CALL RegistrarVisitas(2, 6, '2024-03-15'); -- debería activarse restricción de unicidad
-- inserción con fecha futura (falla por trigger)
CALL RegistrarVisitas(1, 2, '2025-01-01'); -- Fecha futura invalida










