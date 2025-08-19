<script setup lang="ts">
import { useRouter } from 'vue-router';

const router = useRouter();
defineProps({
  open: {
    type: Boolean,
    required: true
  }
});

const emit = defineEmits(['update:open']);

const closeSidebar = () => {
  emit('update:open', false);
};

const navigateTo = (routeName: string) => {
  router.push({ name: routeName });
  closeSidebar();
};

const logout = () => {
  localStorage.removeItem('token');
  router.push({ name: 'login' });
};
</script>
<template>
  <!-- Sidebar -->
  <div
    :class="[
      // mismo gradiente que el banner
      'fixed top-0 right-0 h-full w-80 bg-gradient-to-b from-sky-600 to-cyan-600 shadow-xl border-l border-white/20 transform transition-transform duration-300 ease-in-out z-50',
      open ? 'translate-x-0' : 'translate-x-full'
    ]"
  >
    <div class="p-6 text-white">
      <div class="flex items-center justify-between mb-8">
        <h2 class="text-xl font-bold">Menú de Navegación</h2>
        <button @click="closeSidebar" class="text-white/80 hover:text-white">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
          </svg>
        </button>
      </div>

      <nav class="space-y-2">
        <button
          @click="navigateTo('dashboard')"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-white/90 hover:bg-white/10 hover:text-white transition-all w-full text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 01-2-2z"/>
          </svg>
          <span class="font-medium">Dashboard</span>
        </button>

        <button
          @click="navigateTo('report')"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-white/90 hover:bg-white/10 hover:text-white transition-all w-full text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
          <span class="font-medium">Reportar Incidente</span>
        </button>

        <button
          @click="navigateTo('my-reports')"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-white/90 hover:bg-white/10 hover:text-white transition-all w-full text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
          </svg>
          <span class="font-medium">Mis Reportes</span>
        </button>

        <button
          @click="navigateTo('map')"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-white/90 hover:bg-white/10 hover:text-white transition-all w-full text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
          </svg>
          <span class="font-medium">Mapa de Incidentes</span>
        </button>

        <button
          @click="navigateTo('profile')"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-white/90 hover:bg-white/10 hover:text-white transition-all w-full text-left"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
          </svg>
          <span class="font-medium">Mi Perfil</span>
        </button>
      </nav>

      <div class="mt-8 pt-6 border-t border-white/20">
        <button
          @click="logout"
          class="flex items-center space-x-3 px-4 py-3 rounded-xl text-rose-100 hover:bg-white/10 hover:text-white transition-all w-full"
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
  <div
    v-if="open"
    @click="closeSidebar"
    class="fixed inset-0 bg-black/50 backdrop-blur-sm z-40"
  ></div>
</template>
