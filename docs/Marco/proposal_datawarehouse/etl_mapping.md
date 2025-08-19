# Mapeo ETL — Origen → Destino (Star Schema)

## Grano del Hecho
**Un registro por incidente reportado.**

## Dimensiones

### DimTiempo
- sk_tiempo (PK, surrogate) ← generado
- fecha_calendario ← incidentes.fecha_reporte
- Atributos derivados: día, mes, trimestre, año, día_semana

### DimCategoria
- sk_categoria (PK) ← surrogate
- nk_categoria ← categorias.id
- nombre_categoria ← categorias.nombre

### DimUbicacion
- sk_ubicacion (PK) ← surrogate
- latitud, longitud ← incidentes.latitud, incidentes.longitud

### DimEstadoIncidente
- sk_estado (PK)
- estado ← incidentes.estado

### DimUsuario
- sk_usuario (PK)
- nk_usuario ← usuarios.id
- nombre, rol ← usuarios.nombre, usuarios.rol

## HechoIncidente
- sk_incidente (PK)
- nk_incidente ← incidentes.id
- sk_tiempo, sk_categoria, sk_ubicacion, sk_estado, sk_usuario
- num_comentarios ← COUNT(comentarios.id) BY incidente_id
- has_imagen ← CASE WHEN imagen IS NULL THEN 0 ELSE 1 END
