# 🚀 Proceso ETL (Extracción, Transformación y Carga)

Este documento describe el flujo seguido en la fase ETL del proyecto **Alerta Ciudadana**, donde se preparan los datos para análisis posteriores de Machine Learning y visualización.

---

## 📦 1. Importación de Librerías
Se cargaron las librerías necesarias para la manipulación, análisis y visualización de los datos:
- **pandas**, **numpy** → manejo y transformación de datos.  
- **matplotlib**, **seaborn** → visualización de información.  
- **sqlalchemy**, **pymysql** → conexión a base de datos MySQL.  

---

## 📥 2. Carga de Datos
Los datos fueron obtenidos desde la base de datos **bd_alertaciudadana** (tablas de incidentes, usuarios, categorías y comentarios).  
También se habilitó la lectura desde archivos de respaldo `.sql` en caso de no contar con conexión directa.

---

## 🗂️ 3. Creación del DataFrame
Se construyeron **DataFrames en pandas** a partir de los registros extraídos, asegurando un formato tabular limpio para el análisis.  
Esto permitió unificar información de múltiples tablas en una sola estructura procesable.

---

## 🔎 4. Análisis Exploratorio de los Datos (EDA)
Se aplicaron métricas descriptivas y visualizaciones iniciales para conocer el comportamiento de los datos:  
- Conteo de incidentes por categoría.  
- Distribución de incidentes por estado (pendiente, en revisión, atendido, descartado).  
- Tendencias temporales en los reportes.  

---

## 🧹 5. Limpieza de Datos
Las acciones principales fueron:  
- Eliminación de duplicados.  
- Tratamiento de valores nulos en coordenadas, descripciones y categorías.  
- Normalización de formatos de fecha.  
- Codificación de variables categóricas.  

---

## 📊 6. Visualización de Datos
Se generaron entre **2 y 5 gráficas** representativas, entre ellas:  
- Distribución de incidentes por categoría.  
- Evolución de incidentes a lo largo del tiempo.  
- Mapas de calor con ubicación geográfica (latitud y longitud).  

Estas visualizaciones ayudaron a detectar patrones y zonas críticas.

---

## ✅ 7. Conclusión de esta Fase
El proceso ETL permitió obtener un **dataset limpio, transformado y listo para análisis avanzados**.  
Con ello se sientan las bases para aplicar algoritmos de Machine Learning (supervisado y no supervisado), así como para construir dashboards de visualización y reportes automáticos.  

---
📌 *Este README corresponde al notebook `ETL_alertaCiudadana.ipynb`.*  
