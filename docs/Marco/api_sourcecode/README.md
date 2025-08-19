# Alerta Ciudadana — API ⚙️

API del proyecto **Alerta Ciudadana**, que permite registrar, consultar y gestionar incidentes urbanos reportados por la ciudadanía. Expone endpoints REST (y algunos de ML) para el consumo del **Frontend Web/Móvil**.

- 🌐 Frontend: https://github.com/PpGrillo1511/Alerta_Ciudadana_LosPepelepu_Frontend  
- 📚 Documentación: https://github.com/PpGrillo1511/Alerta_Ciudadana_LosPepelepu_Documentacion

---

## Tabla de Contenidos

- [Arquitectura & Stack](#arquitectura--stack)
- [Estructura del Repo](#estructura-del-repo)
- [Requisitos Previos](#requisitos-previos)
- [Variables de Entorno](#variables-de-entorno)
- [Instalación (local)](#instalación-local)
- [Ejecución con Docker](#ejecución-con-docker)
- [Scripts de Base de Datos](#scripts-de-base-de-datos)
- [Operaciones CRUD Básicas](#operaciones-crud-básicas)
- [Listado de EndPoints de las Entidades](#listado-de-endpoints-de-las-entidades)
- [Endpoints que utilizan ML (Machine Learning)](#endpoints-que-utilizan-ml-machine-learning)
- [Listado de EndPoints que consumen ML](#listado-de-endpoints-que-consumen-ml)
- [Autenticación & Seguridad](#autenticación--seguridad)
- [Convenciones de Respuesta y Errores](#convenciones-de-respuesta-y-errores)
- [Screenshots (Capturas de Pantalla)](#screenshots-capturas-de-pantalla)
- [Contribución](#contribución)
- [Licencia](#licencia)

---

## Arquitectura & Stack

- **Runtime:** Node.js (Express/Nest)  
- **BD:** MySQL 8 (respaldos incluidos en `/db_backup_*.sql`)  
- **ORM (si aplica):** Sequelize / Prisma (ajústalo a lo real de tu repo)  
- **Autenticación:** JWT (Bearer)  
- **Contenedores:** Docker + Docker Compose  
- **CI/CD:** GitHub Actions (opcional)  

> Nota: si tu API usa otro framework (por ejemplo NestJS), solo ajusta las menciones “Express/Nest” por el framework real. La estructura de README y endpoints no cambia.

---

## Estructura del Repo

```
NOMBRE_PROYECTO_TI/
├─ api_sourcecode/            # Código fuente de la API
├─ seeder_sourcecode/         # Seeders / carga de datos
├─ notebook_*                 # Notebooks (supervisado / no supervisado)
├─ db_backup_onlystructure.sql
├─ db_backup_withdata.sql
├─ docker-compose.yml         # (opcional)
└─ README.md
```

---

## Requisitos Previos

- Node.js 18+  
- MySQL 8 (o Docker Desktop)  
- npm o pnpm/yarn  
- Git

---

## Variables de Entorno

Crea un archivo `.env` en la raíz de la API:

```ini
# Servidor
PORT=3000
NODE_ENV=development
CORS_ORIGIN=http://localhost:5173

# Base de datos
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASS=root
DB_NAME=bd_alertaciudadana

# JWT
JWT_SECRET=super_secreto_123
JWT_EXPIRES=7d

# (Opcional) Almacenamiento de imágenes
CLOUD_PROVIDER=local            # local|cloudinary|s3
CLOUD_FOLDER=incidentes
CLOUDINARY_URL=                 # si usas Cloudinary
S3_BUCKET=                      # si usas S3
S3_REGION=
S3_ACCESS_KEY_ID=
S3_SECRET_ACCESS_KEY=
```

---

## Instalación (local)

```bash
# 1) Clona el repo
git clone https://github.com/PpGrillo1511/Alerta_Ciudadana_LosPepelepu_API.git
cd Alerta_Ciudadana_LosPepelepu_API

# 2) Instala dependencias
npm install
# o pnpm i / yarn

# 3) Configura .env (ver sección anterior)

# 4) Prepara la BD (estructura o respaldo con datos)
#    ver sección "Scripts de Base de Datos"

# 5) Levanta la API
npm run dev
# La API quedará en: http://localhost:3000
```

---

## Ejecución con Docker

```bash
# Asegúrate de tener docker-compose.yml configurado
docker compose up -d --build

# Servicios típicos:
# - mysql:8.0 (puerto 3306 o 3307 mapeado)
# - api_node: 3000
```

> Si ya tienes MySQL local en 3306, mapea el contenedor a 3307: `- "3307:3306"` y en `.env` usa `DB_PORT=3307`.

---

## Scripts de Base de Datos

- **Estructura:** `db_backup_onlystructure.sql`  
- **Estructura + Datos:** `db_backup_withdata.sql`

Restauración rápida:

```bash
# Crea BD si no existe
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS bd_alertaciudadana;"

# Carga estructura + datos
mysql -u root -p bd_alertaciudadana < db_backup_withdata.sql
```

Seeders (si usas scripts en `seeder_sourcecode/`):

```bash
# ejemplo
npm run seed
```

---

## Operaciones CRUD Básicas

Las operaciones base siguen el patrón:

- **GET**    `/entidad` → lista paginada  
- **GET**    `/entidad/:id` → detalle  
- **POST**   `/entidad` → crear  
- **PUT**    `/entidad/:id` → actualizar (completo)  
- **PATCH**  `/entidad/:id` → actualizar (parcial)  
- **DELETE** `/entidad/:id` → eliminar (lógico o físico, según aplique)

Ejemplo (crear incidente):

```bash
curl -X POST http://localhost:3000/incidentes   -H "Content-Type: application/json"   -H "Authorization: Bearer <TOKEN>"   -d '{
    "titulo": "Semáforo caído",
    "descripcion": "El poste cayó por viento",
    "categoriaId": 2,
    "lat": 20.27981,
    "lng": -97.96012,
    "imagenes": []
  }'
```

---

## Listado de EndPoints de las Entidades

> Ajusta/añade columnas según tu implementación real.

### 🔐 Autenticación & Usuarios

| Método | Endpoint              | Descripción                                  | Auth |
|-------:|-----------------------|----------------------------------------------|:----:|
| POST   | `/auth/login`         | Inicia sesión, devuelve JWT                   | ❌   |
| POST   | `/auth/register`      | Registra usuario                             | ❌   |
| GET    | `/auth/profile`       | Perfil del usuario (por token)               | ✅   |
| GET    | `/usuarios`           | Lista usuarios (paginada, filtros)           | ✅   |
| GET    | `/usuarios/:id`       | Detalle usuario                              | ✅   |
| POST   | `/usuarios`           | Crear usuario                                | ✅   |
| PUT    | `/usuarios/:id`       | Actualizar usuario                            | ✅   |
| DELETE | `/usuarios/:id`       | Borrado lógico/físico                         | ✅   |

### 🚨 Incidentes (Reportes)

| Método | Endpoint                    | Descripción                                        | Auth |
|-------:|-----------------------------|----------------------------------------------------|:----:|
| GET    | `/incidentes`               | Listado (paginación, `estado`, `categoriaId`)      | ✅   |
| GET    | `/incidentes/:id`           | Detalle                                            | ✅   |
| POST   | `/incidentes`               | Crear (geo + fotos)                                | ✅   |
| PUT    | `/incidentes/:id`           | Actualizar                                         | ✅   |
| PATCH  | `/incidentes/:id/estado`    | Cambiar estado (`abierto`, `en_proceso`, `cerrado`) | ✅   |
| DELETE | `/incidentes/:id`           | Eliminar                                           | ✅   |

### 🏷️ Categorías

| Método | Endpoint          | Descripción                 | Auth |
|-------:|-------------------|-----------------------------|:----:|
| GET    | `/categorias`     | Listado                     | ✅   |
| POST   | `/categorias`     | Crear                        | ✅   |
| PUT    | `/categorias/:id` | Actualizar                   | ✅   |
| DELETE | `/categorias/:id` | Eliminar                     | ✅   |

### 🖼️ Evidencias (Imágenes)

| Método | Endpoint                      | Descripción                       | Auth |
|-------:|-------------------------------|-----------------------------------|:----:|
| POST   | `/incidentes/:id/evidencias`  | Subir imágenes al incidente       | ✅   |
| DELETE | `/evidencias/:id`             | Eliminar evidencia                 | ✅   |

### 💬 Comentarios

| Método | Endpoint                     | Descripción                       | Auth |
|-------:|------------------------------|-----------------------------------|:----:|
| GET    | `/incidentes/:id/comentarios`| Listar comentarios                 | ✅   |
| POST   | `/incidentes/:id/comentarios`| Crear comentario                   | ✅   |
| DELETE | `/comentarios/:id`           | Eliminar comentario                | ✅   |

---

## Endpoints que utilizan ML (Machine Learning)

> Estos endpoints exponen resultados de análisis (clustering, hotspots, priorización). Conéctalos a tus notebooks/servicios.

| Método | Endpoint           | Descripción                                                         | Auth |
|-------:|--------------------|---------------------------------------------------------------------|:----:|
| GET    | `/ml/hotspots`     | Zonas críticas por densidad/cluster de incidentes (geojson/series) | ✅   |
| POST   | `/ml/predict`      | Predicción de categoría/severidad a partir del texto y ubicación   | ✅   |
| GET    | `/ml/metrics`      | Métricas del modelo (versión, silhouette, etc.)                    | ✅   |

### Ejemplo `predict`

```bash
curl -X POST http://localhost:3000/ml/predict   -H "Content-Type: application/json" -H "Authorization: Bearer <TOKEN>"   -d '{
    "titulo": "Fuga de agua en la calle 5",
    "descripcion": "Hay agua saliendo desde una tapa rota",
    "lat": 20.28, "lng": -97.96
  }'
```

---

## Listado de EndPoints que consumen ML

Estos endpoints internos/derivados usan resultados de ML para enriquecer la API:

| Método | Endpoint                      | Descripción                                               | Fuente ML      |
|-------:|-------------------------------|-----------------------------------------------------------|----------------|
| GET    | `/incidentes/recomendados`    | Incidentes sugeridos por cercanía/impacto                 | `/ml/hotspots` |
| GET    | `/incidentes/priotizados`     | Ordenados por severidad/criticidad                        | `/ml/predict`  |

> Si aún no tienes la integración, deja estos endpoints como **stubs** que devuelvan un JSON fijo. Luego conecta al servicio de ML cuando esté listo.

---

## Autenticación & Seguridad

- **Bearer JWT** en `Authorization: Bearer <token>`.  
- **Roles** sugeridos: `admin`, `operador`, `ciudadano`.  
- **CORS** controlado por `CORS_ORIGIN`.  
- **Subida de archivos**: valida tamaño/formatos (JPEG/PNG) y usa carpeta/servicio configurado en `.env`.

---

## Convenciones de Respuesta y Errores

Formato estándar:

```json
{
  "ok": true,
  "data": {},
  "message": "Detalle opcional"
}
```

Errores:

```json
{
  "ok": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Campo 'titulo' es requerido",
    "details": { "titulo": "required" }
  }
}
```

- **Paginación:** `?page=1&limit=20` → responde con `{ data, page, limit, total }`.
- **Filtros:** usar query params (`estado`, `categoriaId`, `desde`, `hasta`).

---

## Screenshots (Capturas de Pantalla)

> Inserta aquí imágenes del Swagger/Insomnia/Postman y de las vistas clave del Front consumiendo la API.

- Swagger – Lista de endpoints  
- Crear incidente – 201 Created  
- ML Hotspots – 200 OK (GeoJSON/Series)

---

## Contribución

1. Crea rama desde `main`: `feat/nueva-funcionalidad`  
2. Commits descriptivos (Convencional Commits):  
   `feat(api): crea endpoint de hotspots`  
3. Pull Request hacia `main` con descripción y screenshots.

---

## Licencia

Este proyecto se distribuye con fines educativos. Ajusta o agrega una licencia formal si lo requieres.

---

### Notas finales

- Si tu API usa **NestJS**, agrega la sección *“Comandos Nest”* (`npm run start:dev`, `npm run build`, etc.).  
- Si usas **Prisma**, agrega `npx prisma migrate dev` y `npx prisma studio`.  
- Si tu ML corre en un **microservicio** aparte, documenta la URL y el contrato entre servicios.
