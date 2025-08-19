# 🗄️ Propuesta de Data Warehouse — Alerta Ciudadana

Este módulo documenta el **esquema estrella** propuesto para análisis de incidentes, con tablas de **hechos** y **dimensiones**, su mapeo desde el sistema transaccional y los procedimientos de carga (ETL).

## 🎯 Objetivos
- Análisis histórico por **categoría**, **estado**, **tiempo** y **ubicación**.
- Medición de **volumen** y **actividad ciudadana** (comentarios).
- Base para **dashboards ejecutivos** y reportes operativos.

## 🏗️ Componentes
- **HechoIncidente**: medida principal (conteo de incidentes, nº de comentarios).
- **DimTiempo**, **DimCategoria**, **DimUbicacion**, **DimEstadoIncidente**, **DimUsuario**.

## 📂 Contenidos
- `etl_mapping.md`: mapeo **origen → destino**.
- `data_dictionary.md`: definición de campos y claves.
- `data_quality_checks.md`: reglas de calidad.
- `kpis.md`: métricas y definiciones.
- `sql/model_star_schema.sql`: DDL del esquema estrella.
- `sql/dim_time_seed.sql`: script para poblar **DimTiempo**.
- `sql/load_facts_from_oltp.sql`: script para poblar el hecho desde OLTP.
- `sql/sample_analytics.sql`: consultas de ejemplo.
- `diagrams/star_schema.mmd`: diagrama Mermaid del modelo.

## 🚦 Flujo de carga (resumen)
1. Extraer desde `usuarios`, `categorias`, `incidentes`, `comentarios`.
2. Transformar (limpieza, normalización, claves sustitutas).
3. Cargar dimensiones → poblar `HechoIncidente`.
