-- R.F 01 Registro de turista 
-- Procedimiento de registro de turista
DELIMITER //
CREATE OR REPLACE PROCEDURE registrarTurista(
    correoTurista VARCHAR(320),  
    telefonoTurista VARCHAR(20),     
    contrasenaTurista VARCHAR(64),   
    nombreTurista VARCHAR(100),      
    esVerificado BOOLEAN,            
    geolocalizacionActiva BOOLEAN    
)
BEGIN
  DECLARE existeTurista INT DEFAULT 0;

  SELECT COUNT(*)
  INTO existeTurista
  FROM Turista
  WHERE correo = correoTurista OR telefono = telefonoTurista;

IF existeTurista > 0 THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'El turista ya está registrado.';
ELSE
  INSERT INTO Turista (correo, telefono, contrasena, nombre, fechaRegistro, verificado, geolocalizacionActiva)
    VALUES (correoTurista, telefonoTurista, contrasenaTurista, nombreTurista, SYSDATE(), esVerificado, geolocalizacionActiva);
  END IF;
END //
DELIMITER ;


-- RF 02 : función que devuelve la puntuación media de un lugar
DELIMITER //
CREATE OR REPLACE FUNCTION ObtenerPuntuacionMedia(p_lugarId INT)
RETURNS DECIMAL(3, 2)
DETERMINISTIC
BEGIN
    DECLARE promedioPuntuacion DECIMAL(3, 2);

    -- Calcular la puntuación media del lugar
    SELECT AVG(puntuacion)
    INTO promedioPuntuacion
    FROM Resena
    WHERE lugarId = p_lugarId;

    -- Retornar el promedio calculado
    RETURN IFNULL(promedioPuntuacion, 0.00); -- Retorna 0.00 si no hay reseñas
END //
DELIMITER ;

-- RF 04 : Los turistas podrán dejar reseñas
DELIMITER //
CREATE OR REPLACE PROCEDURE NuevaReseña(
    p_turistaId INT,
    p_lugarId INT,
    p_puntuacion DECIMAL(2,1),
    p_contenido TEXT,
    p_estaFiltrado BOOL
)
BEGIN
    -- Verificar que el turista existe
    IF NOT EXISTS (SELECT 1 FROM Turista WHERE id = p_turistaId) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El turista especificado no existe.';
    END IF;

    -- Verificar que el lugar exista
    IF NOT EXISTS (SELECT 1 FROM Lugar WHERE id = p_lugarId) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El lugar especificado no existe.';
    END IF;

-- Verificar que la puntuación está en el rango permitido, aunque ya esté en el constraint, para mensaje de error especifico
    IF p_puntuacion < 1 OR p_puntuacion > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La puntuación debe estar entre 1 y 5.';
    END IF;
    -- Verificar que el contenido tiene al menos 10 caracteres
    IF CHAR_LENGTH(p_contenido) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El contenido de la reseña debe tener al menos 10 caracteres.';
    END IF;
    -- Insertar la nueva reseña con estado pendiente
    INSERT INTO Resena (turistaId, lugarId, puntuacion, contenido,estaFiltrado)
    VALUES (p_turistaId, p_lugarId, p_puntuacion, p_contenido,p_estaFiltrado);
END //
DELIMITER ;

-- R.F.06. Registro de nuevas visitas
DELIMITER //
CREATE OR REPLACE PROCEDURE RegistrarVisitas (
   p_turistaId INT,
   p_lugarId INT,
	P_fechaVisita DATETIME)
BEGIN
  IF P_fechaVisita IS NULL THEN
        SET P_fechaVisita = CURDATE();
    END IF;
    -- Verificar que el turista existe
    IF NOT EXISTS (SELECT 1 FROM Turista WHERE id = p_turistaId) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El turista especificado no existe';
    END IF;
    -- Verificar que el lugar existe
    IF NOT EXISTS (SELECT 1 FROM Lugar WHERE id = p_lugarId) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El lugar especificado no existe';
    END IF;
    -- Insertar la visita en el historial
    INSERT INTO HistorialVisitas (turistaId, lugarId, fechaVisita)
    VALUES (p_turistaId, p_lugarId, p_fechaVisita);

END //
DELIMITER ;

