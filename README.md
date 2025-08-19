# Alerta Ciudadana – Monorepo

Plataforma (web + API) para **reportar incidentes urbanos geolocalizados**, visualizar su evolución en tiempo real y apoyar la toma de decisiones de autoridades y comunidad.

> Este repo consolida: **API** (`/api`), **Frontend** (`/frontend`) y **Documentación** (`/docs`) en un monorepo único.

## 🌟 Objetivo

Permitir que la ciudadanía reporte incidentes (accidentes, vandalismo, baches, fugas, etc.) con **ubicación** e **imagen**, y que dichos reportes puedan **verse, filtrarse y analizarse** desde una plataforma web en tiempo real.

## 📁 Estructura

```
Alerta_Ciudadana_LosPepelepu/
├─ api/           # Backend (Python)
├─ frontend/      # Web (Vue 3 + Vite + TS)
├─ docs/          # Documentación (PDFs, notas, readmes)
├─ .gitignore
└─ README.md
```

- El **frontend** usa **Vue 3 + Vite** y trae scripts `npm install`, `npm run dev`, `npm run build` en su propio README y `package.json`.
- La **API** está escrita en **Python**.

---

## 🚀 Puesta en marcha (local)

### 1) Requisitos

- **Node.js** 18+ y **npm** (o pnpm/yarn) para el frontend.
- **Python** 3.10+ para la API (virtualenv recomendado).

> Opcional: **Git** (obvio para clonar y trabajar), **Docker** si después quieres contenerizar.

---

### 2) Frontend (`/frontend`)

```bash
cd frontend
npm install
npm run dev
```

- Abre el puerto que te indique Vite (típicamente `http://localhost:5173`).  
- Scripts disponibles:  
  - `npm run dev` – desarrollo  
  - `npm run build` – producción  
  - `npm run lint` – linting  

---

### 3) API (`/api`)

> La API es Python. A continuación un arranque **genérico**; revisa `requirements.txt` y `main.py` por el comando exacto.

```bash
cd api
# Crear entorno
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
# source .venv/bin/activate

# Instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt
```

**Ejecutar en desarrollo (elige según el framework usado en `main.py`):**

- **Si es FastAPI**:
  ```bash
  uvicorn main:app --reload --host 0.0.0.0 --port 8000
  ```
  Visita: `http://localhost:8000` y la documentación interactiva en `http://localhost:8000/docs`.

- **Si es Flask**:
  ```bash
  set FLASK_APP=main.py     # (Windows)  |  export FLASK_APP=main.py (macOS/Linux)
  set FLASK_ENV=development # (Windows)  |  export FLASK_ENV=development
  flask run --host=0.0.0.0 --port=8000
  ```

---

## 🔗 Rutas y conexión Frontend ↔ API

- Configura en el frontend la **URL base** de la API (variable de entorno Vite, p. ej. `VITE_API_URL=http://localhost:8000` en un `.env` del frontend).  
- Reinicia `npm run dev` si cambiaste `.env`.

---

## 🧩 Variables de entorno (ejemplos)

Crea archivos `.env` **no versionados** (añádelos a `.gitignore`):

**Frontend (`/frontend/.env`)**
```
VITE_API_URL=http://localhost:8000
```

**API (`/api/.env`)**
```
# Ejemplos, ajusta a tu stack real
DB_URL=mysql+pymysql://user:pass@localhost:3306/alerta
JWT_SECRET=supersecreto
ENV=development
```

---

## 🧪 Calidad y scripts útiles

**Frontend**
```bash
cd frontend
npm run lint
npm run build
```

**API**
```bash
cd api
# añade aquí tus comandos de pruebas si existen, por ejemplo:
pytest -q
```

---

## 🐙 Flujo de trabajo con Git

Este monorepo se formó uniendo repos previos (API, Frontend y Docs).  
Para **sincronizar** con los repos originales:

```bash
# Traer cambios nuevos desde API origen -> /api
git fetch api
git subtree pull --prefix=api api main --squash -m "chore(api): sync from source"

# Enviar cambios de /api hacia el repo API original
git subtree push --prefix=api api main
```

(Análogo para `frontend` y `docs`).

---

## 🧱 Convenciones de ramas y commits

- Ramas de feature: `feat/<modulo>`  
- Fixes: `fix/<modulo>`  
- Commits tipo Conventional: `feat:`, `fix:`, `chore:`, `docs:`, etc.  
- PRs pequeños, con descripción clara y capturas si es UI.

---

## 📦 Build de producción

**Frontend**
```bash
cd frontend
npm run build
# genera /dist
```

**API**  
Usa WSGI/ASGI apropiado según tu framework (por ejemplo, `uvicorn`/`gunicorn` para FastAPI/Flask). Define variables de entorno de DB/seguridad y crea tu servicio (systemd/Docker).

---

## 🧭 Roadmap corto

- [ ] Autenticación y roles consolidados  
- [ ] Mapa y heatmap de incidentes  
- [ ] Panel con KPIs y filtros avanzados  
- [ ] Notificaciones / estados de atención del incidente  
- [ ] Pruebas E2E básicas

---

## 👥 Equipo

Proyecto académico colaborativo (IDGS). Ver integrantes y material en `/docs`.

---

## 📚 Repos fuente

- API (Python): repositorio original integrado como `/api`.  
- Frontend (Vue 3 + Vite): repositorio original integrado como `/frontend`.  
- Documentación: integrado como `/docs`.

---

## 📝 Licencia

Uso académico.
