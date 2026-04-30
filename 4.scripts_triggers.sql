DELIMITER //
-- R.N.01: Los turistas deben estar verificados
CREATE OR REPLACE TRIGGER t_turista_verificado
BEFORE INSERT ON Turista FOR EACH ROW
BEGIN
  IF NOT NEW.verificado THEN
  SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'Los turistas deben estar verificados';
END IF;
END //
DELIMITER ;

-- R.N.02: Las reseñas y lugares publicados deben estar filtrados
DELIMITER //
CREATE OR REPLACE TRIGGER t_resena_filtrada
BEFORE INSERT ON Resena FOR EACH ROW
BEGIN
  IF NOT NEW.estaFiltrado THEN
  SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'Las reseñas deben estar filtradas';
END IF;
END //
DELIMITER ;
-- Filtrar lugares
DELIMITER //
CREATE OR REPLACE TRIGGER t_lugar_filtrado
BEFORE INSERT ON Lugar FOR EACH ROW
BEGIN
  IF NOT NEW.estaFiltrado THEN
  SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'Los lugares deben estar filtrados';
END IF;
END //
DELIMITER ;

-- R.N.03. Geolocalización Activa para Búsqueda por Proximidad
DELIMITER //
CREATE OR REPLACE TRIGGER t_geolocalizacion
BEFORE INSERT ON Turista
FOR EACH ROW
BEGIN
    IF NEW.geolocalizacionActiva = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La geolocalización debe estar activa para la búsqueda por proximidad';
    END IF;
END //
DELIMITER ;

-- R.N.04. Puntuación Única por Turista y Lugar
DELIMITER //
CREATE OR REPLACE TRIGGER tpuntuacionUnica
BEFORE INSERT ON Resena
FOR EACH ROW
BEGIN
    DECLARE existe INT;

    SELECT COUNT(*) INTO existe
    FROM Resena
    WHERE turistaId = NEW.turistaId AND lugarId = NEW.lugarId;

    IF existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existía una puntuación para este lugar.';
    END IF;
END//
DELIMITER ;


-- R.N.05: Actualización Dinámica de Ranking de Lugares
DELIMITER //

CREATE OR REPLACE TRIGGER tactualizarRanking
AFTER INSERT ON Resena
FOR EACH ROW
BEGIN
    DECLARE nuevoPromedio DECIMAL(3, 2);

    -- Calcular la nueva puntuación promedio usando la función ObtenerPuntuacionMedia
    SET nuevoPromedio = ObtenerPuntuacionMedia(NEW.lugarId);

    -- Verificar si el registro en la tabla Ranking ya existe
    IF EXISTS (SELECT 1 FROM Ranking WHERE lugarId = NEW.lugarId) THEN
        -- Actualizar el registro existente
        UPDATE Ranking
        SET puntuacionPromedio = ROUND(nuevoPromedio, 1),
            fechaActualizacion = CURRENT_TIMESTAMP
        WHERE lugarId = NEW.lugarId;
    ELSE
        -- Insertar un nuevo registro si no existe
        INSERT INTO Ranking (lugarId, puntuacionPromedio, resenasRecientes, fechaActualizacion)
        VALUES (NEW.lugarId, ROUND(nuevoPromedio, 1), 1, CURRENT_TIMESTAMP);
    END IF;

END //
DELIMITER ;




-- R.N.06. Restricciones de Puntuación de Turistas
DELIMITER //
CREATE OR REPLACE TRIGGER trestriccionPuntuacion
BEFORE INSERT ON Resena
FOR EACH ROW
BEGIN
    DECLARE tiempoRegistro DATETIME;
    SELECT fechaRegistro INTO tiempoRegistro 
    FROM Turista 
    WHERE id = NEW.turistaId;
    IF TIMESTAMPDIFF(HOUR, tiempoRegistro, SYSDATE()) < 24 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Deben pasar al menos 24 horas desde el registro para puntuar o reseñar';
    END IF;
END//
DELIMITER ;

-- Regla para reseñas solo después de 24 horas del registro
DELIMITER //
CREATE OR REPLACE TRIGGER check_registro_reseña
BEFORE INSERT ON Resena
FOR EACH ROW
BEGIN
    IF (TIMESTAMPDIFF(HOUR, (SELECT fechaRegistro FROM Turista WHERE id = NEW.id), NOW()) < 24) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El turista debe esperar 24 horas después de registrarse para dejar una reseña.';
    END IF; -- Aquí faltaba el punto y coma
END //
DELIMITER ;


DELIMITER //
CREATE OR REPLACE TRIGGER validar_fecha_visita
BEFORE INSERT ON HistorialVisitas
FOR EACH ROW
BEGIN
    IF NEW.fechaVisita > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de visita no puede ser futura.';
    END IF;
END //
DELIMITER ;
