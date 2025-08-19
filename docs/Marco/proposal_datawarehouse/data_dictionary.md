# Diccionario de Datos — DW

## HechoIncidente
- sk_incidente (INT, PK) — Clave sustituta del hecho
- nk_incidente (INT) — Id natural del incidente (OLTP)
- sk_tiempo, sk_categoria, sk_ubicacion, sk_estado, sk_usuario (FKs)
- num_comentarios (INT) — Total de comentarios
- has_imagen (TINYINT) — 1 si trae imagen

## DimTiempo
- sk_tiempo (INT, PK)
- fecha_calendario (DATE)
- anio, trimestre, mes, dia, dia_semana, nombre_mes

## DimCategoria
- sk_categoria (INT, PK)
- nk_categoria (INT)
- nombre_categoria (VARCHAR)

## DimUbicacion
- sk_ubicacion (INT, PK)
- latitud, longitud (FLOAT)
- municipio, colonia (VARCHAR, opcional)

## DimEstadoIncidente
- sk_estado (INT, PK)
- estado (VARCHAR)

## DimUsuario
- sk_usuario (INT, PK)
- nk_usuario (INT)
- nombre (VARCHAR)
- rol (VARCHAR)
