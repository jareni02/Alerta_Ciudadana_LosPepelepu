<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'

// ─────────────────────────────────────────────────────────────
// TIPOS
type FilterKey = 'incidentes' | 'callesPeligrosas' | 'callesCerradas' | 'eventos'

// ─────────────────────────────────────────────────────────────
// ROUTER
const router = useRouter()

// ─────────────────────────────────────────────────────────────
// Estado del menú lateral
const sidebarOpen = ref(false)

// Estado de filtros
const selectedFilters = reactive<Record<FilterKey, boolean>>({
  incidentes: true,
  callesPeligrosas: true,
  callesCerradas: true,
  eventos: true
})

// Datos simulados de incidentes
const incidents = ref([
  {
    id: 1,
    type: 'Robo',
    location: 'Av. Juárez y 5 de Mayo',
    coordinates: [19.9789, -97.9564],
    date: '2025-01-15',
    status: 'Activo',
    severity: 'Alto'
  },
  {
    id: 2,
    type: 'Accidente',
    location: 'Calle Hidalgo 123',
    coordinates: [19.9792, -97.9568],
    date: '2025-01-14',
    status: 'Resuelto',
    severity: 'Medio'
  },
  {
    id: 3,
    type: 'Vandalismo',
    location: 'Plaza Principal',
    coordinates: [19.9785, -97.9560],
    date: '2025-01-13',
    status: 'En proceso',
    severity: 'Bajo'
  }
])

// Calles peligrosas
const dangerousStreets = ref([
  {
    id: 1,
    name: 'Av. Revolución (Tramo Centro)',
    reason: 'Múltiples robos reportados',
    level: 'Alto',
    coordinates: [19.9788, -97.9562]
  },
  {
    id: 2,
    name: 'Calle Morelos (Noche)',
    reason: 'Poca iluminación',
    level: 'Medio',
    coordinates: [19.9790, -97.9565]
  }
])

// Calles cerradas y eventos
const closedStreets = ref([
  {
    id: 1,
    name: 'Av. Juárez (Centro)',
    reason: 'Desfile Patrio',
    startDate: '2025-09-16',
    endDate: '2025-09-16',
    startTime: '09:00',
    endTime: '14:00',
    coordinates: [19.9789, -97.9564]
  },
  {
    id: 2,
    name: 'Plaza Principal',
    reason: 'Festival de la Flor',
    startDate: '2025-03-15',
    endDate: '2025-03-17',
    startTime: '08:00',
    endTime: '22:00',
    coordinates: [19.9785, -97.9560]
  }
])

// Eventos próximos
const upcomingEvents = ref([
  {
    id: 1,
    title: 'Desfile de Independencia',
    date: '2025-09-16',
    time: '09:00 - 14:00',
    location: 'Av. Juárez',
    type: 'Desfile',
    daysUntil: 238
  },
  {
    id: 2,
    title: 'Festival de la Flor',
    date: '2025-03-15',
    time: '08:00 - 22:00',
    location: 'Plaza Principal',
    type: 'Festival',
    daysUntil: 54
  }
])

// ─────────────────────────────────────────────────────────────
// Funciones de UI
const toggleSidebar = () => { sidebarOpen.value = !sidebarOpen.value }
const closeSidebar = () => { sidebarOpen.value = false }
const toggleFilter = (filter: FilterKey) => { selectedFilters[filter] = !selectedFilters[filter] }

// Formato y estilos
const formatDate = (date: string) =>
  new Date(date).toLocaleDateString('es-MX', { day: 'numeric', month: 'long', year: 'numeric' })

const getSeverityColor = (severity: string) => {
  switch (severity) {
    case 'Alto':  return 'bg-rose-50 text-rose-700 border-rose-200'
    case 'Medio': return 'bg-amber-50 text-amber-700 border-amber-200'
    case 'Bajo':  return 'bg-emerald-50 text-emerald-700 border-emerald-200'
    default:      return 'bg-slate-50 text-slate-700 border-slate-200'
  }
}

const getStatusColor = (status: string) => {
  switch (status) {
    case 'Activo':     return 'bg-rose-50 text-rose-700 border-rose-200'
    case 'En proceso': return 'bg-sky-50 text-sky-700 border-sky-200'
    case 'Resuelto':   return 'bg-emerald-50 text-emerald-700 border-emerald-200'
    default:           return 'bg-slate-50 text-slate-700 border-slate-200'
  }
}


// Navegación
const navigateTo = (routeName: string) => {
  router.push({ name: routeName })
  closeSidebar()
}

const logout = () => {
  localStorage.removeItem('token')
  router.push('/login')
}

onMounted(() => {
  console.log('[v0] Mapa de incidentes inicializado para Xicotepec de Juárez, Puebla')
})
</script>
<template>
  <div class="min-h-screen bg-white">
    <!-- Sidebar (igual) -->
    <div
      :class="[
        'fixed top-0 right-0 h-full w-80 bg-white border-l border-slate-200 shadow-xl transform transition-transform duration-300 ease-in-out z-50',
        sidebarOpen ? 'translate-x-0' : 'translate-x-full'
      ]"
    >
      <!-- ...sidebar sin cambios... -->
    </div>

    <!-- Overlay -->
    <div v-if="sidebarOpen" @click="closeSidebar" class="fixed inset-0 bg-black/50 backdrop-blur-sm z-40"></div>

    <!-- Main Content -->
    <div class="p-6">
      <!-- Header -->
      <div class="mb-8">
        <div class="flex items-center justify-between">
          <div>
            <h1 class="text-2xl font-bold text-slate-900">Mapa de Incidentes</h1>
            <p class="text-slate-500">Xicotepec de Juárez, Puebla - Monitoreo en tiempo real</p>
          </div>
          <button
            @click="toggleSidebar"
            class="p-2 rounded-xl bg-slate-100 text-slate-700 hover:bg-slate-200 transition-all lg:hidden"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
            </svg>
          </button>
        </div>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
        <!-- Filters -->
        <div class="lg:col-span-1 space-y-6">
          <!-- Filtros del mapa -->
          <div class="bg-sky-50 rounded-2xl p-6 border border-sky-200 shadow-sm">
            <h3 class="text-lg font-bold text-slate-900 mb-4">Filtros del Mapa</h3>
            <div class="space-y-4">
              <label class="flex items-center space-x-3 cursor-pointer">
                <input type="checkbox" v-model="selectedFilters.incidentes"
                  class="w-4 h-4 rounded border-slate-300 bg-white text-sky-600 focus:ring-2 focus:ring-sky-500" />
                <span class="text-slate-700">Incidentes Reportados</span>
              </label>
              <label class="flex items-center space-x-3 cursor-pointer">
                <input type="checkbox" v-model="selectedFilters.callesPeligrosas"
                  class="w-4 h-4 rounded border-slate-300 bg-white text-amber-500 focus:ring-2 focus:ring-amber-500" />
                <span class="text-slate-700">Calles Peligrosas</span>
              </label>
              <label class="flex items-center space-x-3 cursor-pointer">
                <input type="checkbox" v-model="selectedFilters.callesCerradas"
                  class="w-4 h-4 rounded border-slate-300 bg-white text-rose-600 focus:ring-2 focus:ring-rose-500" />
                <span class="text-slate-700">Calles Cerradas</span>
              </label>
              <label class="flex items-center space-x-3 cursor-pointer">
                <input type="checkbox" v-model="selectedFilters.eventos"
                  class="w-4 h-4 rounded border-slate-300 bg-white text-indigo-600 focus:ring-2 focus:ring-indigo-500" />
                <span class="text-slate-700">Eventos Próximos</span>
              </label>
            </div>
          </div>

          <!-- Eventos Próximos -->
          <div class="bg-indigo-50 rounded-2xl p-6 border border-indigo-200 shadow-sm">
            <h3 class="text-lg font-bold text-slate-900 mb-4">Eventos Próximos</h3>
            <div class="space-y-3">
              <div
                v-for="event in upcomingEvents"
                :key="event.id"
                class="p-4 bg-white rounded-xl border border-indigo-200"
              >
                <div class="flex items-start justify-between">
                  <div class="flex-1">
                    <h4 class="font-semibold text-indigo-700">{{ event.title }}</h4>
                    <p class="text-sm text-slate-600 mt-1">{{ formatDate(event.date) }}</p>
                    <p class="text-sm text-slate-600">{{ event.time }}</p>
                    <p class="text-sm text-slate-600">📍 {{ event.location }}</p>
                  </div>
                  <span class="text-xs bg-indigo-100 text-indigo-700 px-2 py-1 rounded-full border border-indigo-200">
                    {{ event.daysUntil }} días
                  </span>
                </div>
              </div>
            </div>
          </div>

          <!-- Estadísticas -->
          <div class="bg-cyan-50 rounded-2xl p-6 border border-cyan-200 shadow-sm">
            <h3 class="text-lg font-bold text-slate-900 mb-4">Estadísticas</h3>
            <div class="space-y-4">
              <div class="flex items-center justify-between">
                <span class="text-slate-600">Incidentes Activos</span>
                <span class="font-semibold text-rose-600">{{ incidents.filter(i => i.status === 'Activo').length }}</span>
              </div>
              <div class="flex items-center justify-between">
                <span class="text-slate-600">Calles Peligrosas</span>
                <span class="font-semibold text-amber-600">{{ dangerousStreets.length }}</span>
              </div>
              <div class="flex items-center justify-between">
                <span class="text-slate-600">Calles Cerradas</span>
                <span class="font-semibold text-rose-600">{{ closedStreets.length }}</span>
              </div>
              <div class="flex items-center justify-between">
                <span class="text-slate-600">Eventos Próximos</span>
                <span class="font-semibold text-indigo-600">{{ upcomingEvents.length }}</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Main Map -->
        <div class="lg:col-span-3">
          <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
            <!-- Map Header con tinte -->
            <div class="p-6 bg-sky-50 border-b border-sky-200">
              <div class="flex items-center justify-between">
                <h3 class="text-xl font-bold text-slate-900">Mapa Interactivo</h3>
                <div class="flex items-center space-x-2">
                  <span class="text-sm text-slate-600">Última actualización:</span>
                  <span class="text-sm font-medium text-sky-600">{{ new Date().toLocaleTimeString('es-MX') }}</span>
                </div>
              </div>
            </div>

            <!-- Map Area -->
            <div class="relative h-96 bg-slate-100">
              <!-- ...contenido del mapa sin cambios... -->
              <div class="absolute top-4 left-4 space-y-2">
                <div class="flex items-center space-x-2 bg-white/90 backdrop-blur-sm rounded-xl px-3 py-2 border border-slate-200 shadow-sm">
                  <div class="w-3 h-3 bg-rose-500 rounded-full"></div>
                  <span class="text-sm text-slate-700">Incidentes</span>
                </div>
                <div class="flex items-center space-x-2 bg-white/90 backdrop-blur-sm rounded-xl px-3 py-2 border border-slate-200 shadow-sm">
                  <div class="w-3 h-3 bg-amber-400 rounded-full"></div>
                  <span class="text-sm text-slate-700">Calles Peligrosas</span>
                </div>
                <div class="flex items-center space-x-2 bg-white/90 backdrop-blur-sm rounded-xl px-3 py-2 border border-slate-200 shadow-sm">
                  <div class="w-3 h-3 bg-rose-600 rounded-full"></div>
                  <span class="text-sm text-slate-700">Calles Cerradas</span>
                </div>
                <div class="flex items-center space-x-2 bg-white/90 backdrop-blur-sm rounded-xl px-3 py-2 border border-slate-200 shadow-sm">
                  <div class="w-3 h-3 bg-indigo-500 rounded-full"></div>
                  <span class="text-sm text-slate-700">Eventos</span>
                </div>
              </div>
            </div>

            <!-- Incidentes recientes (igual) -->
            <div class="p-6 border-t border-slate-200">
              <h4 class="font-bold text-slate-900 mb-4">Incidentes Recientes</h4>
              <div class="space-y-3 max-h-40 overflow-y-auto">
                <div
                  v-for="incident in incidents"
                  :key="incident.id"
                  class="flex items-center justify-between p-4 bg-slate-50 rounded-xl border border-slate-200"
                >
                  <div class="flex-1">
                    <div class="flex items-center space-x-2">
                      <span class="font-medium text-slate-900">{{ incident.type }}</span>
                      <span :class="['text-xs px-2 py-1 rounded-full border', getSeverityColor(incident.severity)]">
                        {{ incident.severity }}
                      </span>
                    </div>
                    <p class="text-sm text-slate-600 mt-1">📍 {{ incident.location }}</p>
                    <p class="text-xs text-slate-400">{{ formatDate(incident.date) }}</p>
                  </div>
                  <span :class="['text-xs px-2 py-1 rounded-full border', getStatusColor(incident.status)]">
                    {{ incident.status }}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Alertas de Calles Cerradas -->
      <div class="mt-8 bg-rose-50 rounded-2xl p-6 border border-rose-200 shadow-sm">
        <h3 class="text-xl font-bold text-slate-900 mb-6">🚧 Alertas de Calles Cerradas</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div v-for="street in closedStreets" :key="street.id" class="p-4 bg-white rounded-xl border border-rose-200">
            <div class="flex items-start justify-between">
              <div class="flex-1">
                <h4 class="font-semibold text-rose-700">{{ street.name }}</h4>
                <p class="text-sm text-slate-600 mt-1">{{ street.reason }}</p>
                <div class="mt-3 space-y-1">
                  <p class="text-sm text-slate-600">
                    📅 {{ formatDate(street.startDate) }}
                    {{ street.startDate !== street.endDate ? ` - ${formatDate(street.endDate)}` : '' }}
                  </p>
                  <p class="text-sm text-slate-600">🕐 {{ street.startTime }} - {{ street.endTime }}</p>
                </div>
              </div>
              <span class="text-xs bg-rose-100 text-rose-700 px-2 py-1 rounded-full border border-rose-200">
                Cerrada
              </span>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="text-center py-6 mt-8">
        <p class="text-slate-400">alerta_ciudadana para un Xicotepec más seguro 2025</p>
      </footer>
    </div>
  </div>
</template>
