USE alerta_dw;

-- Incidentes por categoría
SELECT c.nombre_categoria, COUNT(*) AS total
FROM HechoIncidente h
JOIN DimCategoria c ON c.sk_categoria = h.sk_categoria
GROUP BY c.nombre_categoria
ORDER BY total DESC;

-- Incidentes por estado y mes
SELECT e.estado, t.anio, t.mes, COUNT(*) AS total
FROM HechoIncidente h
JOIN DimEstadoIncidente e ON e.sk_estado = h.sk_estado
JOIN DimTiempo t ON t.sk_tiempo = h.sk_tiempo
GROUP BY e.estado, t.anio, t.mes
ORDER BY t.anio, t.mes, e.estado;
