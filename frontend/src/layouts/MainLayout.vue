<script setup lang="ts">
import { RouterView } from 'vue-router';
import Sidebar from '../components/Sidebar.vue';
import { ref } from 'vue';

const sidebarOpen = ref(false);
</script>

<template>
  <!-- Fondo global blanco -->
  <div class="min-h-screen bg-white">
    <!-- Sidebar -->
    <Sidebar v-model:open="sidebarOpen" />

    <!-- Main Content -->
    <main class="p-6">
      <!-- Header Banner (paleta nueva) -->
      <div class="bg-gradient-to-r from-sky-500 via-cyan-500 to-indigo-500 rounded-2xl p-6 mb-8 relative overflow-hidden">
        <div class="absolute inset-0 bg-gradient-to-r from-cyan-400/20 to-transparent"></div>
        <div class="relative flex items-center justify-between">
          <div class="flex items-center space-x-4">
            <button
              @click="sidebarOpen = true"
              class="p-2 rounded-xl bg-white/10 backdrop-blur-sm text-white hover:bg-white/20 transition-all"
            >
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
              </svg>
            </button>
            <div class="flex items-center space-x-3">
              <div class="w-12 h-12 rounded-full bg-gradient-to-r from-sky-500 to-cyan-400 flex items-center justify-center text-white font-bold text-lg">
                G
              </div>
              <div>
                <h1 class="text-2xl font-bold text-white">¡Bienvenid@ Griselda Cabrera Franco!</h1>
                <p class="text-sky-100">Gracias por contribuir a hacer de Xicotepec un lugar más seguro</p>
              </div>
            </div>
          </div>
          <div class="flex items-center space-x-3 bg-white/10 backdrop-blur-sm rounded-xl px-4 py-2">
            <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Logo-N5NgJJ9kcwMeVSd6Gof1EzbuAkkl4L.jpeg" alt="Alerta Ciudadana" class="w-8 h-8 rounded-lg">
            <div class="text-right">
              <p class="text-white font-semibold">Alerta_ciudadana</p>
              <p class="text-sky-100 text-sm">Sistema de Alertas</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Aquí se renderizarán las vistas hijas -->
      <RouterView />
    </main>
  </div>
</template>
