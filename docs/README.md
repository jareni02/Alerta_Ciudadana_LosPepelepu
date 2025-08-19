# ALERTA CIUDADANA

<HR>

## Introducción
Alerta Ciudadana es una propuesta tecnológica diseñada para enfrentar el reto de la **falta de canales efectivos para reportar incidentes urbanos** y la **respuesta tardía** ante emergencias. En muchas comunidades, la ausencia de herramientas accesibles impide que la ciudadanía informe de manera oportuna sucesos como accidentes, vandalismo o fallas de infraestructura, lo que incrementa el riesgo y la sensación de inseguridad.
Este proyecto combina una **aplicación móvil** para reportes en tiempo real con una **plataforma web interactiva** que presenta la información de forma clara, gráfica y fácil de interpretar. Gracias a su diseño intuitivo, Alerta Ciudadana permite a cualquier usuario —sin necesidad de conocimientos técnicos— **reportar con geolocalización, adjuntar evidencia** y dar seguimiento al estado de cada incidente.
A diferencia de soluciones improvisadas o no centralizadas, Alerta Ciudadana destaca por su **enfoque colaborativo**, facilidad de uso y **capacidad de análisis**, fomentando una red entre la población y las instituciones de seguridad. Con ello, busca no solo agilizar la atención, sino también impulsar acciones de **prevención** y una **mejor toma de decisiones** basada en datos.

<BR>

## 🖌 Identidad Gráfica

| Logo del Producto | Logo de la Marca |
|-------------------|------------------|
| ![Logo Producto](/img/Logo-Proyecto.jpeg)  | ![Logo Marca](/img/Logo-Empresa.png) |

<BR>

## Descripción
Alerta Ciudadana es un sistema integral para **reporte y gestión de incidentes urbanos**. Está compuesto por dos elementos principales:
**Aplicación móvil:** permite al ciudadano **crear reportes** con foto, descripción y **ubicación geolocalizada**, así como consultar incidentes cercanos.
**Dashboard web:** plataforma en línea que muestra de manera visual los incidentes en **mapa y listados**, permite **clasificar, priorizar y dar seguimiento** a cada caso, además de generar **estadísticas** para la toma de decisiones.
El sistema es **accesible y adaptable** para su implementación en barrios, colonias, escuelas o instituciones. Su arquitectura combina el registro en tiempo real con el análisis histórico para detectar **patrones, zonas de alta incidencia** y **tiempos de respuesta**.
Con un enfoque en la **simplicidad y colaboración**, Alerta Ciudadana busca que cualquier persona pueda **reportar y consultar** información relevante, fortaleciendo la **seguridad** y el **bienestar** de la comunidad.

<BR>

## Planteamiento del problema
En múltiples ciudades, la población se enfrenta a robos, accidentes, vandalismo, fugas o incendios que **no siempre se reportan de manera oportuna o efectiva**. La falta de un canal único, accesible y confiable provoca **demoras en la atención** y dificulta priorizar recursos. Además, la inexistencia de una **plataforma centralizada** limita la generación de **estadísticas** para prevenir eventos futuros.
Ante este contexto, se requiere una solución tecnológica que **centralice los reportes** con evidencia y ubicación en tiempo real, y que permita a autoridades y comunidad **visualizar, clasificar y dar seguimiento** para mejorar la respuesta y la prevención.

<BR>

## Propuesta de solución
Alerta Ciudadana plantea un **sistema integrado** (app móvil + plataforma web) que trabaja de forma conjunta para **registrar, analizar y presentar** incidentes en tiempo real.
La **aplicación móvil** permite crear reportes con **categoría, descripción, foto y geolocalización**. La **plataforma web** procesa y muestra los datos en **mapas y gráficos**, ofreciendo **filtros por tipo, estado o fecha** y un **historial** para auditoría.
El sistema incorpora **alertas y priorización** de incidentes, además de **reportes automáticos** que ayudan a identificar **zonas críticas** y **patrones de incidencia**. Con esto se facilita la **asignación de recursos** y la **toma de decisiones** informadas.
El proyecto prioriza la **facilidad de uso**, el **bajo costo de adopción** y la **escalabilidad**, asegurando que cualquier comunidad puede implementarlo y beneficiarse de sus ventajas.

<BR>


## Objetivo General
Diseñar e implementar una **aplicación móvil** y una **plataforma web** que permitan a los ciudadanos **reportar incidentes urbanos** con datos **geolocalizados**, para su **análisis y priorización** por parte de autoridades y comunidades locales, mejorando la **respuesta** y la **prevención**.

<BR>

## Objetivos Específicos
1. Desarrollar una **app móvil** con interfaz amigable para **reportar** incidentes con **ubicación y fotografía**. 
2. Crear una **plataforma web** para **visualizar y analizar** los reportes en tiempo real. 
3. Implementar una **base de datos** para **almacenar y categorizar** los incidentes reportados. 
4. Generar **reportes automáticos** que permitan identificar **patrones** o **zonas de alta incidencia**. 
5. Validar el sistema mediante **pruebas controladas** en una comunidad simulada. 

<BR>

## Organigrama de Trabajo
Este organigrama representa la estructura organizativa del equipo, mostrando roles y responsabilidades para asegurar coordinación y eficiencia.
<div align="center">
  <img src="/img/Organigrama.jpeg" width="500"/>
</div>

<BR>

---

## 👥 Equipo de Desarrollo – *Los Pepelepú*

| Nombre Completo | Rol en el Proyecto | GitHub |
|-----------------|--------------------|--------|
| José Daniel Loza Marín | Desarrollador Frontend / Desarrollador Movil / Lider de Proyecto| [PpGrillo1511](https://github.com/PpGrillo1511) |
| Jareni Gómez Juan | Documentación y Diseño | [jareni02](https://github.com/jareni02) |
| Griselda Cabrera Franco | Desarrollador Frontend y Diseño | [gris12eldaa](https://github.com/gris12eldaa) |
| Luis Abdiel Rivera Gayosso | Desarrollador Backend | [LuisAbdielRivera](https://github.com/LuisAbdielRivera) |
| Esaú Vargas Álvarez | Desarrollador Frontend | [Giggs007](https://github.com/Giggs007) |

---


## Diagrama de Gant
<div align="center">
  <img src="/img/Diagrama de Gantt.jpeg" width="500"/>
</div>

<BR>

## Lista de Técnologías
#### 🧰 Tecnologías utilizadas en el Backend 

| Tecnología       | Descripción                                      |
|------------------|--------------------------------------------------|
| 🐍 Python (FastAPI/Flask) | Framework web para la API REST             |
| 🗄️ MySQL             | Almacenamiento de reportes e historial         |
| 🔐 JWT / Bearer Token| Autenticación y protección de endpoints        |
| 📄 Swagger / OpenAPI | Documentación automática de la API             |


#### 🧰 Tecnologías utilizadas en el Frontend

| Tecnología     | Descripción                                       |
|----------------|---------------------------------------------------|
| 🖼️ Vue 3 + Vite + TS | Interfaz web rápida y modular                   |
| 🎨 TailwindCSS  | Estilos modernos y responsivos                    |
| 🗺️ Mapas / Charts| Visualización de incidentes y estadísticas       |
| 📱 Kotlin (App) | Cliente móvil nativo para crear y consultar reportes |

<BR>
