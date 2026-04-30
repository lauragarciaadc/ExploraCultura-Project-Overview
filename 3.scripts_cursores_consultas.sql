
-- 4: Obtener puntuacion media
SELECT ObtenerPuntuacionMedia(2) AS PuntuacionPromedio; -- promedio calculado CORRECTAMENTE
SELECT ObtenerPuntuacionMedia(10) AS PuntuacionPromedio; -- resultado : 0.00
-- puntuación de lugar con múltiples reseñas
SELECT ObtenerPuntuacionMedia(3) AS PuntuacionPromedio; -- cálculo de múltiples reseñas

-- 5: actualización de Ranking dinámico
CALL NuevaReseña(2, 1, 4.0, 'Nueva reseña para verificar actualización del ranking.',TRUE); -- inserción y trigger
SELECT * FROM Ranking WHERE lugarId = 1; -- Verificar actualización de ranking

-- Consulta que te muestra el Ranking (10 lugares mayor puntuación)
SELECT *
  FROM VistaRanking LIMIT 10 ;

-- Consultar los 5 lugares con más visitas
SELECT *
FROM VistaTotalVisitas
ORDER BY TotalVisitas DESC
LIMIT 5;


-- Consulta que muestra el ranking filtrado por una categoría determinada
SELECT * 
FROM VistaRanking
WHERE categoria = 'Cultural';

-- Consulta que muestra los turistas que han visitado un determinado lugar y su reseña
SELECT nombreLugar, contenidoResena 
  FROM vistaLugaresResenaNombreTurista
  WHERE nombreLugar = 'La Giralda';

-- Consulta cuantas reseñas ha publicado un turista
SELECT nombreTurista, COUNT(*) AS TotalResenas
FROM vistaLugaresResenaNombreTurista
GROUP BY nombreTurista;

-- Consultar los turistas sin reseña
SELECT 
  Turista.nombre AS NombreTurista,
  Turista.correo AS Correo
FROM Turista
LEFT JOIN Resena ON Turista.id = Resena.turistaId
WHERE Resena.id IS NULL;
-- Categorías con un mayor números de lugares que pertenecen a ella
SELECT 
    Lugar.categoria AS Categoria,
    COUNT(Lugar.id) AS TotalLugares
FROM Lugar
GROUP BY Lugar.categoria
ORDER BY TotalLugares DESC;













