USE alerta_dw;

INSERT INTO DimCategoria (nk_categoria, nombre_categoria)
SELECT id, nombre FROM bd_alertaciudadana.categorias;

INSERT INTO DimUsuario (nk_usuario, nombre, rol)
SELECT id, nombre, rol FROM bd_alertaciudadana.usuarios;

INSERT INTO DimEstadoIncidente (estado)
SELECT DISTINCT estado FROM bd_alertaciudadana.incidentes;

INSERT INTO DimUbicacion (latitud, longitud)
SELECT DISTINCT latitud, longitud FROM bd_alertaciudadana.incidentes;

INSERT INTO HechoIncidente (nk_incidente, sk_tiempo, sk_categoria, sk_ubicacion, sk_estado, sk_usuario, num_comentarios, has_imagen)
SELECT 
    i.id,
    t.sk_tiempo,
    c.sk_categoria,
    u.sk_ubicacion,
    e.sk_estado,
    usr.sk_usuario,
    (SELECT COUNT(*) FROM bd_alertaciudadana.comentarios cm WHERE cm.incidente_id = i.id),
    CASE WHEN i.imagen IS NULL THEN 0 ELSE 1 END
FROM bd_alertaciudadana.incidentes i
JOIN DimTiempo t ON t.fecha_calendario = DATE(i.fecha_reporte)
JOIN DimCategoria c ON c.nk_categoria = i.categoria_id
JOIN DimUbicacion u ON u.latitud = i.latitud AND u.longitud = i.longitud
JOIN DimEstadoIncidente e ON e.estado = i.estado
JOIN DimUsuario usr ON usr.nk_usuario = i.usuario_id;
