-- Esquema DW
CREATE SCHEMA IF NOT EXISTS alerta_dw;
USE alerta_dw;

CREATE TABLE IF NOT EXISTS DimTiempo (
  sk_tiempo INT PRIMARY KEY AUTO_INCREMENT,
  fecha_calendario DATE NOT NULL,
  anio SMALLINT NOT NULL,
  trimestre TINYINT NOT NULL,
  mes TINYINT NOT NULL,
  dia TINYINT NOT NULL,
  dia_semana TINYINT NOT NULL,
  nombre_mes VARCHAR(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS DimCategoria (
  sk_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nk_categoria INT NOT NULL,
  nombre_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS DimUbicacion (
  sk_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
  latitud FLOAT NOT NULL,
  longitud FLOAT NOT NULL,
  municipio VARCHAR(100),
  colonia VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS DimEstadoIncidente (
  sk_estado INT PRIMARY KEY AUTO_INCREMENT,
  estado VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS DimUsuario (
  sk_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nk_usuario INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  rol VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS HechoIncidente (
  sk_incidente BIGINT PRIMARY KEY AUTO_INCREMENT,
  nk_incidente INT NOT NULL,
  sk_tiempo INT NOT NULL,
  sk_categoria INT NOT NULL,
  sk_ubicacion INT NOT NULL,
  sk_estado INT NOT NULL,
  sk_usuario INT NOT NULL,
  num_comentarios INT NOT NULL DEFAULT 0,
  has_imagen TINYINT NOT NULL DEFAULT 0
);
