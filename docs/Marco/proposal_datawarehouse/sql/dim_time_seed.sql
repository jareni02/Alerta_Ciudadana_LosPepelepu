USE alerta_dw;
SET @start_date = '2024-01-01';
SET @end_date   = '2026-12-31';

WITH RECURSIVE dim_dates AS (
  SELECT DATE(@start_date) AS d
  UNION ALL
  SELECT DATE_ADD(d, INTERVAL 1 DAY) FROM dim_dates WHERE d < @end_date
)
INSERT INTO DimTiempo (fecha_calendario, anio, trimestre, mes, dia, dia_semana, nombre_mes)
SELECT
  d, YEAR(d), QUARTER(d), MONTH(d), DAY(d), WEEKDAY(d)+1, DATE_FORMAT(d, '%M')
FROM dim_dates;
