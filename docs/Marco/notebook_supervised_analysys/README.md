# 📊 Análisis Supervisado (Machine Learning) – Alerta Ciudadana

## 📌 Propuesta de Aplicación
Se propone aplicar **aprendizaje supervisado** sobre la base de datos `bd_alertaciudadana`, específicamente sobre la tabla `incidentes`.  
El objetivo es **predecir el estado de un incidente** (ejemplo: pendiente, en proceso, resuelto) a partir de sus características principales: título, descripción, ubicación y categoría.  

Esto permitirá **automatizar la clasificación de incidentes** y apoyar la gestión ciudadana en tiempo real.

---

## ⚙️ Elección del Mecanismo a Utilizar
Se seleccionaron tres algoritmos representativos:  
- **Regresión Logística** → Modelo base, interpretable y eficiente.  
- **Random Forest** → Clasificador robusto y no lineal, ideal para datos mixtos.  
- **XGBoost** → Modelo avanzado de boosting, altamente preciso en clasificación tabular.  

La comparación de estos métodos permite evaluar **precisión, recall y F1-score** en el contexto del proyecto.

---

## 📖 Marco Teórico
El aprendizaje supervisado busca **aprender una función de mapeo** entre características de entrada \(X\) y una etiqueta de salida \(y\).  
En este caso:  

\[
f: \{titulo, descripcion, latitud, longitud, categoria\} \longrightarrow estado
\]

Se utilizan principios estadísticos y matemáticos para encontrar patrones que permitan **clasificar automáticamente** nuevos incidentes reportados.

---

## 🛠️ Aplicación del Mecanismo
1. **Conexión y carga de datos** desde MySQL (`bd_alertaciudadana`).  
2. **Limpieza**: eliminación de columnas irrelevantes, tratamiento de nulos.  
3. **División Train/Test** para validación.  
4. **Preprocesamiento**:  
   - Escalado de variables numéricas.  
   - Codificación One-Hot para categóricas.  
5. **Entrenamiento de modelos supervisados**: Logistic Regression, Random Forest y XGBoost.  
6. **Evaluación** con métricas: Accuracy, Precision, Recall y F1-score.

---

## 📊 Gráficos Generados (mínimo 3)
1. **Matriz de Confusión** → Desempeño de los modelos por clase.  
2. **Curva de Importancia de Variables** → Factores más influyentes en la predicción.  
3. **Curva ROC** → Comparación de la capacidad discriminativa de los modelos.  
4. **Distribución de estados reales vs predichos**.

---

## 📈 Resultados Obtenidos
- **Regresión Logística**: buen desempeño en clases balanceadas, interpretable.  
- **Random Forest**: mejora en recall y precisión para clases minoritarias.  
- **XGBoost**: alcanzó el mejor rendimiento global (mayor F1-score).  

El análisis confirma que los algoritmos supervisados permiten **automatizar la clasificación de incidentes urbanos** con alto nivel de precisión.

---

## ✅ Conclusión de la Fase del Proyecto
La aplicación de aprendizaje supervisado en *Alerta Ciudadana* demostró que es posible **predecir el estado de un incidente** de manera automática y confiable.  
Los resultados obtenidos son un aporte directo para:  
- Reducir tiempos de atención.  
- Mejorar la asignación de recursos.  
- Priorizar incidentes críticos en la gestión urbana.  

Con esta fase, se valida el potencial de Machine Learning como **herramienta de apoyo a la toma de decisiones en gobiernos inteligentes**.  
