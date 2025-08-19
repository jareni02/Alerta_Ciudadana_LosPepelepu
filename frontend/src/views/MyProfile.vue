<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const sidebarOpen = ref(false)
const editingPersonal = ref(false)

const personalInfo = ref({
  firstName: 'Griselda',
  lastName: 'Cabrera Franco',
  email: 'griselda@email.com',
  phone: '764 123 4567',
  address: 'Calle Hidalgo #123, Centro, Xicotepec de Juárez, Puebla'
})

const passwordForm = ref({
  current: '',
  new: '',
  confirm: ''
})

const notifications = ref({
  email: true,
  push: true,
  sms: false
})

const savePersonalInfo = () => {
  // Simulate API call
  editingPersonal.value = false
  alert('Información actualizada exitosamente')
}

const changePassword = () => {
  if (passwordForm.value.new !== passwordForm.value.confirm) {
    alert('Las contraseñas no coinciden')
    return
  }

  // Simulate API call
  passwordForm.value = { current: '', new: '', confirm: '' }
  alert('Contraseña cambiada exitosamente')
}

const navigateTo = (routeName: string) => {
  router.push({ name: routeName })
  sidebarOpen.value = false
}

const logout = () => {
  localStorage.removeItem('token')
  router.push('/login')
}
</script>
<template>
  <div class="min-h-screen bg-white">
    <!-- Sidebar -->
    <div
      :class="[
        'fixed top-0 right-0 h-full w-80 bg-white border-l border-slate-200 shadow-xl transform transition-transform duration-300 ease-in-out z-50',
        sidebarOpen ? 'translate-x-0' : 'translate-x-full'
      ]"
    >
      <div class="p-6">
        <div class="flex items-center justify-between mb-8">
          <h2 class="text-xl font-bold text-slate-900">Menú de Navegación</h2>
          <button @click="sidebarOpen = false" class="text-slate-400 hover:text-slate-700">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
          </button>
        </div>

        <nav class="space-y-2">
          <button
            @click="navigateTo('dashboard')"
            class="flex items-center space-x-3 px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-100 transition-all w-full text-left"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 01-2-2z"/>
            </svg>
            <span class="font-medium">Dashboard</span>
          </button>

          <button
            @click="navigateTo('report')"
            class="flex items-center space-x-3 px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-100 transition-all w-full text-left"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <span class="font-medium">Reportar Incidente</span>
          </button>

          <button
            @click="navigateTo('my-reports')"
            class="flex items-center space-x-3 px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-100 transition-all w-full text-left"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            <span class="font-medium">Mis Reportes</span>
          </button>

          <button
            @click="navigateTo('map')"
            class="flex items-center space-x-3 px-4 py-3 rounded-xl text-slate-700 hover:bg-slate-100 transition-all w-full text-left"
          >
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
            </svg>
            <span class="font-medium">Mapa de Incidentes</span>
          </button>

          <button class="flex items-center space-x-3 px-4 py-3 rounded-xl bg-gradient-to-r from-sky-500 to-cyan-500 text-white">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
            <span class="font-medium">Mi Perfil</span>
          </button>
        </nav>

        <div class="mt-8 pt-6 border-t border-slate-200">
          <button
            @click="logout"
            class="flex items-center space-x-3 px-4 py-3 rounded-xl text-rose-600 hover:bg-rose-50 transition-all w-full"
          >
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

    <!-- Main Content -->
    <div class="p-6">
      <!-- Header -->
      <div class="mb-8">
        <div class="flex items-center justify-between">
          <div>
            <h1 class="text-2xl font-bold text-slate-900">Mi Perfil</h1>
            <p class="text-slate-500">Gestiona tu información personal y configuración</p>
          </div>
          <button
            @click="sidebarOpen = true"
            class="p-2 rounded-xl bg-slate-100 text-slate-700 hover:bg-slate-200 transition-all lg:hidden"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
            </svg>
          </button>
        </div>
      </div>

      <!-- Profile Content -->
      <div class="max-w-4xl mx-auto">
        <!-- Profile Header -->
        <div class="bg-white rounded-2xl p-8 border border-slate-200 shadow-sm mb-8">
          <div class="flex items-center space-x-6">
            <div class="relative">
              <div class="w-24 h-24 rounded-full bg-gradient-to-r from-sky-500 to-cyan-500 flex items-center justify-center text-white text-2xl font-bold">
                G
              </div>
              <button class="absolute bottom-0 right-0 w-8 h-8 rounded-full bg-indigo-600 text-white flex items-center justify-center hover:bg-indigo-700 transition-colors">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"/>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
              </button>
            </div>
            <div>
              <h2 class="text-2xl font-bold text-slate-900 mb-1">Griselda Cabrera Franco</h2>
              <p class="text-indigo-600 mb-2">Ciudadano Activo</p>
              <div class="flex items-center space-x-4 text-sm text-slate-500">
                <span>Miembro desde: Enero 2025</span>
                <span>•</span>
                <span>15 reportes realizados</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Profile Sections -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <!-- Personal Information -->
          <div class="lg:col-span-2">
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm mb-8">
              <div class="flex items-center justify-between mb-6">
                <h3 class="text-xl font-bold text-slate-900">Información Personal</h3>
                <button
                  @click="editingPersonal = !editingPersonal"
                  class="px-4 py-2 rounded-xl bg-sky-50 text-sky-700 border border-sky-200 hover:bg-sky-100 transition-all"
                >
                  {{ editingPersonal ? 'Cancelar' : 'Editar' }}
                </button>
              </div>

              <form @submit.prevent="savePersonalInfo" class="space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label class="block text-sm font-medium text-slate-700 mb-2">Nombre</label>
                    <input
                      v-model="personalInfo.firstName"
                      :disabled="!editingPersonal"
                      type="text"
                      class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                    >
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-slate-700 mb-2">Apellidos</label>
                    <input
                      v-model="personalInfo.lastName"
                      :disabled="!editingPersonal"
                      type="text"
                      class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                    >
                  </div>
                </div>

                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Correo Electrónico</label>
                  <input
                    v-model="personalInfo.email"
                    :disabled="!editingPersonal"
                    type="email"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                  >
                </div>

                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Teléfono</label>
                  <input
                    v-model="personalInfo.phone"
                    :disabled="!editingPersonal"
                    type="tel"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                  >
                </div>

                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Dirección</label>
                  <textarea
                    v-model="personalInfo.address"
                    :disabled="!editingPersonal"
                    rows="3"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 disabled:opacity-50 disabled:cursor-not-allowed transition-all resize-none"
                  ></textarea>
                </div>

                <div v-if="editingPersonal" class="flex justify-end">
                  <button
                    type="submit"
                    class="px-6 py-3 rounded-xl bg-gradient-to-r from-sky-500 to-cyan-500 text-white font-semibold hover:from-sky-600 hover:to-cyan-600 transition-all"
                  >
                    Guardar Cambios
                  </button>
                </div>
              </form>
            </div>

            <!-- Security Section -->
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
              <h3 class="text-xl font-bold text-slate-900 mb-6">Seguridad</h3>

              <form @submit.prevent="changePassword" class="space-y-6">
                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Contraseña Actual</label>
                  <input
                    v-model="passwordForm.current"
                    type="password"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-all"
                    placeholder="••••••••"
                  >
                </div>

                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Nueva Contraseña</label>
                  <input
                    v-model="passwordForm.new"
                    type="password"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-all"
                    placeholder="••••••••"
                  >
                </div>

                <div>
                  <label class="block text-sm font-medium text-slate-700 mb-2">Confirmar Nueva Contraseña</label>
                  <input
                    v-model="passwordForm.confirm"
                    type="password"
                    class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-all"
                    placeholder="••••••••"
                  >
                </div>

                <button
                  type="submit"
                  class="px-6 py-3 rounded-xl bg-gradient-to-r from-sky-500 to-cyan-500 text-white font-semibold hover:from-sky-600 hover:to-cyan-600 transition-all"
                >
                  Cambiar Contraseña
                </button>
              </form>
            </div>
          </div>

          <!-- Right Sidebar -->
          <div class="space-y-6">
            <!-- Activity Stats (tinte indigo) -->
            <div class="bg-indigo-50 rounded-2xl p-6 border border-indigo-200 shadow-sm">
              <h3 class="text-lg font-bold text-slate-900 mb-4">Estadísticas</h3>
              <div class="space-y-4">
                <div class="flex items-center justify-between">
                  <span class="text-slate-600">Reportes Enviados</span>
                  <span class="text-slate-900 font-semibold">15</span>
                </div>
                <div class="flex items-center justify-between">
                  <span class="text-slate-600">Reportes Resueltos</span>
                  <span class="text-emerald-600 font-semibold">12</span>
                </div>
                <div class="flex items-center justify-between">
                  <span class="text-slate-600">Puntos de Confianza</span>
                  <span class="text-indigo-600 font-semibold">850</span>
                </div>
              </div>
            </div>

            <!-- Notifications -->
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-sm">
              <h3 class="text-lg font-bold text-slate-900 mb-4">Notificaciones</h3>
              <div class="space-y-4">
                <div class="flex items-center justify-between">
                  <span class="text-slate-700">Alertas por Email</span>
                  <label class="relative inline-flex items-center cursor-pointer">
                    <input v-model="notifications.email" type="checkbox" class="sr-only peer">
                    <div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-sky-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-sky-600"></div>
                  </label>
                </div>
                <div class="flex items-center justify-between">
                  <span class="text-slate-700">Notificaciones Push</span>
                  <label class="relative inline-flex items-center cursor-pointer">
                    <input v-model="notifications.push" type="checkbox" class="sr-only peer">
                    <div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-sky-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-sky-600"></div>
                  </label>
                </div>
                <div class="flex items-center justify-between">
                  <span class="text-slate-700">SMS de Emergencia</span>
                  <label class="relative inline-flex items-center cursor-pointer">
                    <input v-model="notifications.sms" type="checkbox" class="sr-only peer">
                    <div class="w-11 h-6 bg-slate-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-sky-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-sky-600"></div>
                  </label>
                </div>
              </div>
            </div>

            <!-- Quick Actions (tinte cyan/rose) -->
            <div class="bg-cyan-50 rounded-2xl p-6 border border-cyan-200 shadow-sm">
              <h3 class="text-lg font-bold text-slate-900 mb-4">Acciones Rápidas</h3>
              <div class="space-y-3">
                <button class="w-full px-4 py-3 rounded-xl bg-indigo-50 text-indigo-700 border border-indigo-200 hover:bg-indigo-100 transition-all text-left">
                  Descargar mis datos
                </button>
                <button class="w-full px-4 py-3 rounded-xl bg-sky-50 text-sky-700 border border-sky-200 hover:bg-sky-100 transition-all text-left">
                  Exportar reportes
                </button>
                <button class="w-full px-4 py-3 rounded-xl bg-rose-50 text-rose-700 border border-rose-200 hover:bg-rose-100 transition-all text-left">
                  Eliminar cuenta
                </button>
              </div>
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
