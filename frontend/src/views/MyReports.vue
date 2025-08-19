<template>
  <!-- Contenido principal SIN el layout duplicado -->
  <div>
    <!-- User Stats -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
      <!-- Total Reportes -->
      <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
        <div class="flex items-center justify-between mb-4">
          <div class="p-3 rounded-xl bg-gradient-to-r from-sky-500 to-indigo-500">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
          </div>
          <span class="text-2xl font-bold text-slate-900">{{ myReports.length }}</span>
        </div>
        <h3 class="text-slate-600 font-medium mb-1">Total Reportes</h3>
        <p class="text-cyan-600 text-sm">Desde enero 2025</p>
      </div>

      <!-- Resueltos -->
      <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
        <div class="flex items-center justify-between mb-4">
          <div class="p-3 rounded-xl bg-gradient-to-r from-emerald-500 to-emerald-400">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
          </div>
          <span class="text-2xl font-bold text-slate-900">{{ resolvedCount }}</span>
        </div>
        <h3 class="text-slate-600 font-medium mb-1">Resueltos</h3>
        <p class="text-emerald-600 text-sm">{{ effectiveness }}% de efectividad</p>
      </div>

      <!-- Pendientes -->
      <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
        <div class="flex items-center justify-between mb-4">
          <div class="p-3 rounded-xl bg-gradient-to-r from-amber-400 to-orange-400">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
          </div>
          <span class="text-2xl font-bold text-slate-900">{{ pendingCount }}</span>
        </div>
        <h3 class="text-slate-600 font-medium mb-1">Pendientes</h3>
        <p class="text-amber-600 text-sm">En proceso</p>
      </div>

      <!-- Más Reportado -->
      <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
        <div class="flex items-center justify-between mb-4">
          <div class="p-3 rounded-xl bg-gradient-to-r from-rose-500 to-orange-400">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"/>
            </svg>
          </div>
          <span class="text-2xl font-bold text-slate-900">{{ mostReported }}</span>
        </div>
        <h3 class="text-slate-600 font-medium mb-1">Más Reportado</h3>
        <p class="text-rose-600 text-sm">{{ mostReportedCount }} reportes</p>
      </div>
    </div>

    <!-- Reports Table -->
    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
      <div class="p-6 border-b border-slate-200">
        <div class="flex items-center justify-between">
          <h3 class="text-xl font-bold text-slate-900">Historial de Reportes</h3>
          <div class="flex items-center space-x-4">
            <select
              v-model="selectedFilter"
              class="px-4 py-2 rounded-xl bg-white border border-slate-300 text-slate-800 text-sm focus:outline-none focus:ring-2 focus:ring-sky-500"
            >
              <option value="all">Todos</option>
              <option value="pending">Pendientes</option>
              <option value="resolved">Resueltos</option>
              <option value="in-progress">En progreso</option>
            </select>
            <input
              v-model="searchQuery"
              type="text"
              placeholder="Buscar reportes..."
              class="px-4 py-2 rounded-xl bg-white border border-slate-300 text-slate-800 placeholder-slate-400 text-sm focus:outline-none focus:ring-2 focus:ring-sky-500"
            >
          </div>
        </div>
      </div>

      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-slate-50">
            <tr>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Tipo</th>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Descripción</th>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Ubicación</th>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Fecha</th>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Estado</th>
              <th class="px-6 py-4 text-left text-xs font-medium text-slate-500 uppercase tracking-wider">Acciones</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-slate-200">
            <tr
              v-for="report in filteredReports"
              :key="report.id"
              class="hover:bg-slate-50 transition-colors"
            >
              <td class="px-6 py-4 whitespace-nowrap">
                <span :class="[
                  'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border',
                  report.type === 'Atropellamiento' ? 'bg-rose-50 text-rose-700 border-rose-200' :
                  report.type === 'Robo' ? 'bg-cyan-50 text-cyan-700 border-cyan-200' :
                  report.type === 'Accidente' ? 'bg-amber-50 text-amber-700 border-amber-200' :
                  'bg-indigo-50 text-indigo-700 border-indigo-200'
                ]">
                  {{ report.type }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="text-sm text-slate-900 max-w-xs truncate">{{ report.description }}</div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">{{ report.location }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-600">
                <div>{{ report.date }}</div>
                <div class="text-xs text-slate-400">{{ report.time }}</div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span :class="[
                  'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border',
                  report.status === 'Resuelto' ? 'bg-emerald-50 text-emerald-700 border-emerald-200' :
                  report.status === 'Pendiente' ? 'bg-amber-50 text-amber-700 border-amber-200' :
                  'bg-sky-50 text-sky-700 border-sky-200'
                ]">
                  {{ report.status }}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <button
                  @click="viewReport(report.id)"
                  class="text-cyan-600 hover:text-cyan-700 mr-3 transition-colors"
                >
                  Ver
                </button>
                <button
                  v-if="report.status === 'Pendiente'"
                  @click="editReport(report.id)"
                  class="text-indigo-600 hover:text-indigo-700 transition-colors"
                >
                  Editar
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>


<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// ── Tipos ─────────────────────────────────────────────────────────
type ReportStatus = 'Resuelto' | 'Pendiente' | 'En progreso'
type ReportType = 'Atropellamiento' | 'Robo' | 'Accidente' | 'Vandalismo'

interface Report {
  id: number
  type: ReportType
  description: string
  location: string
  date: string
  time: string
  status: ReportStatus
}

type FilterOption = 'all' | 'pending' | 'resolved' | 'in-progress'

// ── Estado UI ─────────────────────────────────────────────────────
const selectedFilter = ref<FilterOption>('all')
const searchQuery = ref('')

// ── Datos (mock) ──────────────────────────────────────────────────
const myReports = ref<Report[]>([
  { id: 1,  type: 'Atropellamiento', description: 'Vehículo atropelló a peatón en crucero principal, conductor se dio a la fuga', location: 'Av. Juárez #123', date: '15/08/2025', time: '14:30', status: 'Resuelto' },
  { id: 2,  type: 'Robo',            description: 'Asalto a mano armada en tienda de conveniencia, dos sujetos encapuchados',   location: 'Centro Histórico',  date: '12/08/2025', time: '21:15', status: 'Resuelto' },
  { id: 3,  type: 'Accidente',       description: 'Choque entre dos vehículos, daños materiales, no hay heridos',               location: 'Calle Hidalgo',     date: '10/08/2025', time: '16:45', status: 'Resuelto' },
  { id: 4,  type: 'Atropellamiento', description: 'Motociclista atropelló a niño en zona escolar, heridas leves',               location: 'Escuela Primaria',  date: '08/08/2025', time: '13:20', status: 'Resuelto' },
  { id: 5,  type: 'Vandalismo',      description: 'Grafitis en paredes del parque central, daños a mobiliario urbano',          location: 'Parque Central',    date: '05/08/2025', time: '02:30', status: 'Pendiente' },
  { id: 6,  type: 'Robo',            description: 'Robo de celular a estudiante universitaria, agresor huyó en motocicleta',    location: 'Universidad',       date: '03/08/2025', time: '19:45', status: 'En progreso' },
  { id: 7,  type: 'Atropellamiento', description: 'Camión de carga atropelló ciclista, heridas graves, trasladado al hospital', location: 'Carretera Principal', date: '01/08/2025', time: '07:15', status: 'Resuelto' },
  { id: 8,  type: 'Accidente',       description: 'Volcadura de vehículo en curva peligrosa, conductor bajo influencia del alcohol', location: 'Curva del Mirador', date: '28/07/2025', time: '23:30', status: 'Resuelto' },
  { id: 9,  type: 'Robo',            description: 'Asalto a comerciante en mercado municipal, sustrajeron dinero de ventas',     location: 'Mercado Municipal', date: '25/07/2025', time: '18:20', status: 'Resuelto' },
  { id: 10, type: 'Atropellamiento', description: 'Taxi atropelló a adulto mayor en paso peatonal, heridas moderadas',          location: 'Plaza Principal',   date: '22/07/2025', time: '11:10', status: 'Resuelto' },
  { id: 11, type: 'Vandalismo',      description: 'Destrucción de señalamientos viales, postes de luz dañados',                  location: 'Av. Independencia', date: '20/07/2025', time: '03:45', status: 'Pendiente' },
  { id: 12, type: 'Atropellamiento', description: 'Autobús urbano atropelló a vendedor ambulante, heridas leves',                location: 'Terminal de Autobuses', date: '18/07/2025', time: '15:30', status: 'Resuelto' },
  { id: 13, type: 'Robo',            description: 'Robo a casa habitación, sustrajeron electrodomésticos y dinero',              location: 'Colonia Reforma',   date: '15/07/2025', time: '14:00', status: 'En progreso' },
  { id: 14, type: 'Accidente',       description: 'Colisión múltiple en intersección, tres vehículos involucrados',              location: 'Crucero 5 de Mayo', date: '12/07/2025', time: '17:20', status: 'Resuelto' },
  { id: 15, type: 'Atropellamiento', description: 'Vehículo particular atropelló a joven en bicicleta, heridas graves',          location: 'Ciclovía Principal', date: '10/07/2025', time: '06:45', status: 'Resuelto' }
])

// ── Derivados / métricas ─────────────────────────────────────────
const resolvedCount = computed(() => myReports.value.filter(r => r.status === 'Resuelto').length)
const pendingCount = computed(() => myReports.value.filter(r => r.status === 'Pendiente').length)
const effectiveness = computed(() => myReports.value.length ? Math.round((resolvedCount.value / myReports.value.length) * 100) : 0)

const mostReported = computed(() => {
  const freq: Record<ReportType, number> = { Atropellamiento: 0, Robo: 0, Accidente: 0, Vandalismo: 0 }
  for (const r of myReports.value) freq[r.type]++
  return (Object.entries(freq).sort((a,b) => b[1] - a[1])[0]?.[0] ?? 'Atropellamiento') as ReportType
})

const mostReportedCount = computed(() => myReports.value.filter(r => r.type === mostReported.value).length)

// ── Filtro + búsqueda ────────────────────────────────────────────
const filteredReports = computed<Report[]>(() => {
  let filtered = myReports.value.slice()

  if (selectedFilter.value !== 'all') {
    const statusMap: Record<Exclude<FilterOption, 'all'>, ReportStatus> = {
      'pending': 'Pendiente',
      'resolved': 'Resuelto',
      'in-progress': 'En progreso'
    }
    filtered = filtered.filter(report => report.status === statusMap[selectedFilter.value as Exclude<FilterOption, 'all'>])
  }

  if (searchQuery.value.trim()) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(report =>
      report.type.toLowerCase().includes(query) ||
      report.description.toLowerCase().includes(query) ||
      report.location.toLowerCase().includes(query)
    )
  }

  return filtered
})

// ── Acciones ─────────────────────────────────────────────────────
const viewReport = (id: number) => {
  router.push({ name: 'report-detail', params: { id } })
}

const editReport = (id: number) => {
  router.push({ name: 'edit-report', params: { id } })
}
</script>
