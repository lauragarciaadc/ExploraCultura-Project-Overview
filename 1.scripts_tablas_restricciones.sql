DROP DATABASE IF EXISTS exploracultura1;
DROP DATABASE IF EXISTS exploracultura;
CREATE DATABASE exploracultura;
USE exploracultura;

-- Eliminar tablas existentes para reiniciar
DROP TABLE IF EXISTS Turista;
DROP TABLE IF EXISTS Resena;
DROP TABLE IF EXISTS Lugar;
DROP TABLE IF EXISTS HistorialVisitas;
DROP TABLE IF EXISTS comercioLocal;
DROP TABLE IF EXISTS Ranking;
DROP TABLE IF EXISTS Evento;

-- Tabla de Turistas
CREATE TABLE Turista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(320) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    contrasena VARCHAR(64) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    verificado BOOLEAN DEFAULT FALSE,
    geolocalizacionActiva BOOLEAN DEFAULT FALSE,
   CONSTRAINT c_contraseña CHECK (CHAR_LENGTH(contrasena) >= 8)
);

-- Tabla de Lugares
CREATE TABLE Lugar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    categoria ENUM(
        'Histórico',
        'Cultural',
        'Gastronómico',
        'Aventura',
        'Naturaleza',
        'Religioso',
        'Entretenimiento',
        'Compras',
        'Playa',
        'Otro'
    ),
    rangoEdad VARCHAR(50),
    multimedia JSON, -- Fotos o videos del lugar
    estaFiltrado BOOLEAN DEFAULT FALSE,
   CONSTRAINT unico_nombre_direccion UNIQUE (id, nombre, direccion) 
);

-- Tabla de Comercios Locales
CREATE TABLE comercioLocal (
    id INT PRIMARY KEY, -- Foreign Key de Lugar
    horario VARCHAR(50) NOT NULL,
    enlaceWeb VARCHAR(255),
    FOREIGN KEY (id) REFERENCES Lugar(id) ON DELETE CASCADE
);

-- Tabla de Reseñas
CREATE TABLE Resena (
    id INT AUTO_INCREMENT PRIMARY KEY,
    turistaId INT NOT NULL,
    lugarId INT NOT NULL,
    puntuacion DECIMAL(2, 1) NOT NULL,
    contenido TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    multimedia JSON, -- Fotos o videos en formato JSON
    estaFiltrado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (turistaId) REFERENCES Turista(id) ON DELETE CASCADE,
    FOREIGN KEY (lugarId) REFERENCES Lugar(id) ON DELETE CASCADE,
    CONSTRAINT c_puntuacion CHECK (puntuacion BETWEEN 1 AND 5),
    CONSTRAINT c_contenido CHECK (CHAR_LENGTH(contenido) >= 10)
);

-- Tabla de Historial de Visitas
CREATE TABLE HistorialVisitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    turistaId INT NOT NULL,
    lugarId INT NOT NULL,
    fechaVisita DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (turistaId) REFERENCES Turista(id) ON DELETE CASCADE,
    FOREIGN KEY (lugarId) REFERENCES Lugar(id) ON DELETE CASCADE,
    CONSTRAINT unico_usuario_lugar UNIQUE (turistaId, lugarId)
);



-- Tabla de Ranking
CREATE TABLE Ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lugarId INT NOT NULL,
    puntuacionPromedio DECIMAL(2, 1) NOT NULL,
    resenasRecientes INT NOT NULL, -- Número de reseñas de los últimos 6 meses
    fechaActualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lugarId) REFERENCES Lugar(id) ON DELETE CASCADE,
    CONSTRAINT c_puntuacion_promedio CHECK (puntuacionPromedio BETWEEN 0 AND 5)
    
);

-- Tabla de Eventos
CREATE TABLE Evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lugarId INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fechaInicio DATETIME NOT NULL,
    fechaFin DATETIME NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (lugarId) REFERENCES Lugar(id) ON DELETE CASCADE,
    CONSTRAINT unico_evento_fecha UNIQUE (nombre, fechaInicio) 
);

