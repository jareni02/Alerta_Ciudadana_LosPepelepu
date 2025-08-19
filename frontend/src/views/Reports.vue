<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900">
    <!-- Sidebar -->
    <div
      :class="[
        'fixed top-0 right-0 h-full w-80 bg-gradient-to-b from-slate-800/95 to-purple-900/95 backdrop-blur-xl border-l border-purple-500/20 transform transition-transform duration-300 ease-in-out z-50',
        sidebarOpen ? 'translate-x-0' : 'translate-x-full'
      ]"
    >
      <div class="p-6">
        <div class="flex items-center justify-between mb-8">
          <h2 class="text-xl font-bold text-white">Menú de Navegación</h2>
          <button @click="sidebarOpen = false" class="text-gray-400 hover:text-white">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
          </button>
        </div>

        <nav class="space-y-2">
          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl text-gray-300 hover:bg-purple-800/50 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"/>
            </svg>
            <span class="font-medium">Dashboard</span>
          </a>

          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl text-gray-300 hover:bg-purple-800/50 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <span class="font-medium">Reportar Incidente</span>
          </a>

          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl text-gray-300 hover:bg-purple-800/50 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            <span class="font-medium">Mis Reportes</span>
          </a>

          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl bg-gradient-to-r from-purple-600 to-blue-600 text-white">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
            </svg>
            <span class="font-medium">Reportes (Admin)</span>
          </a>

          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl text-gray-300 hover:bg-purple-800/50 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
            </svg>
            <span class="font-medium">Mapa de Incidentes</span>
          </a>

          <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-xl text-gray-300 hover:bg-purple-800/50 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
            <span class="font-medium">Mi Perfil</span>
          </a>
        </nav>

        <div class="mt-8 pt-6 border-t border-purple-500/20">
          <button class="flex items-center space-x-3 px-4 py-3 rounded-xl text-red-400 hover:bg-red-900/20 hover:text-red-300 transition-all w-full">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
            </svg>
            <span class="font-medium">Cerrar Sesión</span>
          </button>
        </div>
      </div>
    </div>

    <!-- Overlay -->
    <div v-if="sidebarOpen" @click="sidebarOpen = false" class="fixed inset-0 bg-black/50 backdrop-blur-sm z-40"></div>

    <!-- Main -->
    <div class="p-6">
      <!-- Header -->
      <div class="bg-gradient-to-r from-purple-600 via-blue-600 to-purple-700 rounded-2xl p-6 mb-8 relative overflow-hidden">
        <div class="absolute inset-0 bg-gradient-to-r from-purple-600/20 to-transparent"></div>
        <div class="relative flex items-center justify-between">
          <div class="flex items-center space-x-4">
            <button @click="sidebarOpen = true" class="p-2 rounded-xl bg-white/10 backdrop-blur-sm text-white hover:bg-white/20 transition-all">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
              </svg>
            </button>
            <div>
              <h1 class="text-2xl font-bold text-white">Dashboard de Reportes</h1>
              <p class="text-purple-100">Panel administrativo - Solo administradores</p>
            </div>
          </div>
          <div class="flex items-center space-x-3 bg-white/10 backdrop-blur-sm rounded-xl px-4 py-2">
            <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Logo-N5NgJJ9kcwMeVSd6Gof1EzbuAkkl4L.jpeg" alt="Alerta Ciudadana" class="w-8 h-8 rounded-lg">
            <div class="text-right">
              <p class="text-white font-semibold">Alerta_ciudadana</p>
              <p class="text-purple-100 text-sm">Sistema de Alertas</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Tabla -->
      <div class="bg-gradient-to-br from-slate-800/50 to-purple-900/30 backdrop-blur-xl rounded-2xl border border-purple-500/20 overflow-hidden">
        <div class="p-6 border-b border-purple-500/20">
          <div class="flex items-center justify-between">
            <h3 class="text-xl font-bold text-white">Reportes Recientes</h3>
            <div class="flex items-center space-x-4">
              <select v-model="selectedFilter" class="px-4 py-2 rounded-xl bg-slate-700/50 border border-purple-500/30 text-white text-sm focus:outline-none focus:ring-2 focus:ring-purple-500">
                <option value="all">Todos los reportes</option>
                <option value="pending">Pendientes</option>
                <option value="resolved">Resueltos</option>
                <option value="in-progress">En progreso</option>
              </select>
              <input
                v-model="searchQuery"
                type="text"
                placeholder="Buscar reportes..."
                class="px-4 py-2 rounded-xl bg-slate-700/50 border border-purple-500/30 text-white placeholder-gray-400 text-sm focus:outline-none focus:ring-2 focus:ring-purple-500"
              >
            </div>
          </div>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full">
            <thead class="bg-slate-800/50">
              <tr>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Usuario</th>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Tipo</th>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Ubicación</th>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Fecha/Hora</th>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Estado</th>
                <th class="px-6 py-4 text-left text-xs font-medium text-gray-300 uppercase tracking-wider">Acciones</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-purple-500/20">
              <tr v-for="report in filteredReports" :key="report.id" class="hover:bg-slate-800/30 transition-colors">
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="flex items-center">
                    <div class="w-10 h-10 rounded-full bg-gradient-to-r from-purple-600 to-blue-600 flex items-center justify-center text-white font-semibold text-sm">
                      {{ report.user.charAt(0) }}
                    </div>
                    <div class="ml-3">
                      <div class="text-sm font-medium text-white">{{ report.user }}</div>
                      <div class="text-sm text-gray-400">{{ report.email }}</div>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span :class="[
                    'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium',
                    report.type === 'Atropellamiento' ? 'bg-red-900/50 text-red-300 border border-red-500/30' :
                    report.type === 'Robo' ? 'bg-orange-900/50 text-orange-300 border border-orange-500/30' :
                    report.type === 'Accidente' ? 'bg-yellow-900/50 text-yellow-300 border border-yellow-500/30' :
                    'bg-purple-900/50 text-purple-300 border border-purple-500/30'
                  ]">
                    {{ report.type }}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">{{ report.location }}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">
                  <div>{{ report.date }}</div>
                  <div class="text-xs text-gray-500">{{ report.time }}</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <span :class="[
                    'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium',
                    report.status === 'Resuelto' ? 'bg-green-900/50 text-green-300 border border-green-500/30' :
                    report.status === 'Pendiente' ? 'bg-yellow-900/50 text-yellow-300 border border-yellow-500/30' :
                    'bg-blue-900/50 text-blue-300 border border-blue-500/30'
                  ]">
                    {{ report.status }}
                  </span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                  <button class="text-purple-400 hover:text-purple-300 mr-3 transition-colors">Ver</button>
                  <button class="text-blue-400 hover:text-blue-300 transition-colors">Editar</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <footer class="text-center py-6 mt-8">
        <p class="text-gray-400">alerta_cuidadana para un Xicotepec más seguro 2025</p>
      </footer>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, type Ref } from 'vue'

type UiFilter = 'all' | 'pending' | 'resolved' | 'in-progress'

const sidebarOpen = ref(false)
const selectedFilter: Ref<UiFilter> = ref('all')
const searchQuery = ref('')

type Report = {
  id: number
  user: string
  email: string
  type: 'Atropellamiento' | 'Robo' | 'Accidente' | 'Vandalismo' | 'Otro'
  location: string
  date: string
  time: string
  status: 'Pendiente' | 'En progreso' | 'Resuelto'
}

const reports = ref<Report[]>([
  { id: 1, user: 'María González',  email: 'maria@email.com',  type: 'Atropellamiento', location: 'Av. Juárez #123',     date: '15/08/2025', time: '14:30', status: 'Pendiente' },
  { id: 2, user: 'Carlos Ruiz',     email: 'carlos@email.com', type: 'Robo',            location: 'Centro Histórico',    date: '15/08/2025', time: '09:15', status: 'En progreso' },
  { id: 3, user: 'Ana Martínez',    email: 'ana@email.com',    type: 'Accidente',       location: 'Calle Hidalgo',       date: '14/08/2025', time: '16:45', status: 'Resuelto' },
  { id: 4, user: 'Luis Hernández',  email: 'luis@email.com',   type: 'Vandalismo',      location: 'Parque Central',      date: '14/08/2025', time: '20:30', status: 'Resuelto' },
  { id: 5, user: 'Sofia López',     email: 'sofia@email.com',  type: 'Robo',            location: 'Mercado Municipal',   date: '13/08/2025', time: '11:20', status: 'Pendiente' }
])

const filteredReports = computed(() => {
  let filtered = reports.value

  if (selectedFilter.value !== 'all') {
    const statusMap: Record<Exclude<UiFilter, 'all'>, Report['status']> = {
      'pending': 'Pendiente',
      'resolved': 'Resuelto',
      'in-progress': 'En progreso'
    }
    const wanted = statusMap[selectedFilter.value as Exclude<UiFilter, 'all'>]
    filtered = filtered.filter(report => report.status === wanted)
  }

  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(report =>
      report.user.toLowerCase().includes(query) ||
      report.type.toLowerCase().includes(query) ||
      report.location.toLowerCase().includes(query)
    )
  }

  return filtered
})
</script>
