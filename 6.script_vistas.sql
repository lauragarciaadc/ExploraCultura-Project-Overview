-- Script Vistas
CREATE OR REPLACE VIEW VistaRanking AS
SELECT 
    Lugar.id AS lugarId,
    Lugar.nombre AS nombreLugar,
    Lugar.categoria AS categoria,
    ObtenerPuntuacionMedia(Lugar.id) AS promedioPuntuacion,
    COUNT(Resena.id) AS totalResenas
FROM 
    Lugar
LEFT JOIN 
    Resena ON Lugar.id = Resena.lugarId
GROUP BY 
    Lugar.id, Lugar.nombre, Lugar.categoria
ORDER BY 
    promedioPuntuacion DESC, totalResenas DESC;


-- Vista lugar y su total de visitas
CREATE OR REPLACE VIEW VistaTotalVisitas AS
SELECT 
    Lugar.id AS lugarId,
    Lugar.nombre AS NombreLugar,
    COUNT(HistorialVisitas.lugarId) AS TotalVisitas
FROM 
    Lugar
LEFT JOIN 
    HistorialVisitas ON Lugar.id = HistorialVisitas.lugarId
GROUP BY 
    Lugar.id, Lugar.nombre;



-- Vista lugares reseña y nombre del turista
CREATE OR REPLACE VIEW vistaLugaresResenaNombreTurista AS
SELECT 
    Lugar.nombre AS nombreLugar,
    Resena.contenido AS contenidoResena,
    Turista.nombre AS nombreTurista
FROM 
    Lugar
INNER JOIN 
    Resena ON Lugar.id = Resena.lugarId
INNER JOIN
    Turista ON Resena.turistaId = Turista.id
ORDER BY
    Lugar.nombre, Resena.fecha DESC;

