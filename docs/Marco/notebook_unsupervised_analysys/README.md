# 🤖 Análisis No Supervisado (Machine Learning)

## 📌 Propuesta de Aplicación
Se propone aplicar **aprendizaje no supervisado** sobre los reportes de la base de datos `bd_alertaciudadana`, que contiene incidentes urbanos, categorías y usuarios asociados.  
El objetivo es **agrupar patrones de incidentes** y detectar comportamientos similares que permitan mejorar la toma de decisiones en gestión urbana y atención ciudadana.

---

## ⚙️ Elección del Mecanismo a Utilizar
El algoritmo seleccionado es **K-Means Clustering**, debido a que:  
- Permite **agrupar observaciones por similitud**.  
- Es un método eficiente y ampliamente utilizado.  
- Sus resultados son fáciles de interpretar y visualizar.  

---

## 📖 Marco Teórico
El algoritmo **K-Means** particiona un conjunto de datos en \(k\) clústeres, minimizando la suma de distancias cuadráticas entre los puntos y sus centroides:

\[
J = \sum_{i=1}^{k} \sum_{x_j \in C_i} \| x_j - \mu_i \|^2
\]

donde:  
- \(C_i\) es el clúster \(i\).  
- \(\mu_i\) es el centroide del clúster.  

Este mecanismo es especialmente útil en la **detección de patrones y segmentación de datos**.

---

## 🛠️ Aplicación del Mecanismo
1. **Carga y limpieza de datos** desde MySQL (`bd_alertaciudadana`).  
2. **Generación de variables temporales**: año, mes, día de la semana, hora.  
3. **Preprocesamiento**:  
   - Escalado de variables numéricas.  
   - Codificación One-Hot de variables categóricas.  
4. **Entrenamiento de K-Means** probando diferentes valores de \(k\).  
5. Selección del número óptimo de clústeres con:  
   - Método del **Codo**.  
   - **Silhouette Score**.

---

## 📊 Gráficos Generados
Se generaron al menos **3 visualizaciones principales**:

1. **Método del Codo (Inercia vs k)** → Identificación del punto de inflexión.  
2. **Silhouette Score vs k** → Evaluación de la calidad de los clústeres.  
3. **Mapa de Clústeres por Ubicación** (latitud vs longitud).  
4. **Reducción PCA (2D)** → Visualización simplificada de clústeres.  
5. **Categorías por Clúster** (gráfico de barras apiladas).  

---

## 📈 Resultados Obtenidos
- Se determinó un valor óptimo de **k** mediante Silhouette Score.  
- Los clústeres muestran **agrupamientos consistentes de incidentes** según ubicación, categoría y temporalidad.  
- El modelo permite diferenciar patrones de reporte útiles para **optimizar la gestión urbana** y priorizar recursos.

---

## ✅ Conclusión de la Fase del Proyecto
El análisis no supervisado con **K-Means** permitió descubrir **patrones ocultos en los incidentes urbanos** de la base de datos.  
Los resultados obtenidos son relevantes para la **toma de decisiones estratégicas** en seguridad, servicios y mantenimiento urbano.  

Esta fase demuestra que el uso de Machine Learning puede **apoyar la participación ciudadana y la eficiencia institucional** en proyectos como *Alerta Ciudadana*.  
