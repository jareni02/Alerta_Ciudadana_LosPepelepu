<template>
  <div class="min-h-screen bg-gradient-to-b from-sky-50 via-white to-indigo-50 flex items-center justify-center p-6">
    <div class="w-full max-w-md">
      <!-- Logo and Title -->
      <div class="text-center mb-8">
        <div class="mx-auto w-20 h-20 mb-4 rounded-2xl bg-gradient-to-r from-sky-500 via-cyan-500 to-indigo-500 flex items-center justify-center">
          <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Logo-N5NgJJ9kcwMeVSd6Gof1EzbuAkkl4L.jpeg" alt="Alerta Ciudadana" class="w-16 h-16 rounded-xl">
        </div>
        <h1 class="text-3xl font-bold text-slate-900 mb-2">Únete a Alerta Ciudadana</h1>
        <p class="text-slate-600">Crea tu cuenta y ayuda a hacer Xicotepec más seguro</p>
      </div>

      <!-- Register Form -->
      <div class="rounded-2xl p-8 shadow-xl bg-gradient-to-r from-sky-500 via-cyan-500 to-indigo-500 border border-white/20">
        <form @submit.prevent="handleRegister" class="space-y-6">
          <!-- Name Fields -->
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label for="firstName" class="block text-sm font-medium text-white/90 mb-2">Nombre</label>
              <input
                id="firstName"
                v-model="firstName"
                type="text"
                required
                class="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
                placeholder="Griselda"
              >
            </div>
            <div>
              <label for="lastName" class="block text-sm font-medium text-white/90 mb-2">Apellidos</label>
              <input
                id="lastName"
                v-model="lastName"
                type="text"
                required
                class="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
                placeholder="Cabrera Franco"
              >
            </div>
          </div>

          <!-- Email Field -->
          <div>
            <label for="email" class="block text-sm font-medium text-white/90 mb-2">Correo Electrónico</label>
            <input
              id="email"
              v-model="email"
              type="email"
              required
              class="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
              placeholder="griselda@email.com"
            >
            <p v-if="emailError" class="mt-1 text-sm text-rose-200">{{ emailError }}</p>
          </div>

          <!-- Phone Field -->
          <div>
            <label for="phone" class="block text-sm font-medium text-white/90 mb-2">Teléfono</label>
            <input
              id="phone"
              v-model="phone"
              type="tel"
              required
              class="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
              placeholder="764 123 4567"
            >
          </div>

          <!-- Password Field -->
          <div>
            <label for="password" class="block text-sm font-medium text-white/90 mb-2">Contraseña</label>
            <div class="relative">
              <input
                id="password"
                v-model="password"
                :type="showPassword ? 'text' : 'password'"
                required
                class="w-full px-4 py-3 pr-12 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
                placeholder="••••••••"
              >
              <button
                type="button"
                @click="showPassword = !showPassword"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-white/80 hover:text-white transition-colors"
              >
                <svg v-if="showPassword" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                </svg>
                <svg v-else class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"></path>
                </svg>
              </button>
            </div>
            <div class="mt-2 space-y-1">
              <div class="flex items-center space-x-2">
                <div :class="['w-2 h-2 rounded-full', password.length >= 8 ? 'bg-emerald-300' : 'bg-white/40']"></div>
                <span class="text-xs text-white/80">Mínimo 8 caracteres</span>
              </div>
            </div>
          </div>

          <!-- Confirm Password Field -->
          <div>
            <label for="confirmPassword" class="block text-sm font-medium text-white/90 mb-2">Confirmar Contraseña</label>
            <input
              id="confirmPassword"
              v-model="confirmPassword"
              type="password"
              required
              class="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-white/50"
              placeholder="••••••••"
            >
            <p v-if="passwordError" class="mt-1 text-sm text-rose-200">{{ passwordError }}</p>
          </div>

          <!-- Terms and Conditions -->
          <div class="flex items-start space-x-3">
            <input
              id="terms"
              v-model="acceptTerms"
              type="checkbox"
              required
              class="w-4 h-4 mt-1 rounded border-white/30 bg-white/10 text-white focus:ring-white/40 focus:ring-2"
            >
            <label for="terms" class="text-sm text-white/90">
              Acepto los
              <a href="#" class="text-white hover:underline">términos y condiciones</a>
              y la
              <a href="#" class="text-white hover:underline">política de privacidad</a>
              de Alerta Ciudadana
            </label>
          </div>

          <!-- Register Button -->
          <button
            type="submit"
            :disabled="isLoading || !isFormValid"
            class="w-full py-3 px-4 rounded-xl bg-white text-slate-900 font-semibold hover:bg-slate-50 focus:outline-none focus:ring-2 focus:ring-white/50 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <span v-if="!isLoading">Crear Cuenta</span>
            <span v-else class="flex items-center justify-center">
              <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-slate-900" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Creando cuenta...
            </span>
          </button>
        </form>

        <!-- Login Link -->
        <div class="mt-6 text-center">
          <p class="text-white/90">
            ¿Ya tienes cuenta?
            <a href="#" class="text-white hover:underline font-medium">Inicia sesión aquí</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>


<script setup lang="ts">
import { ref, computed } from 'vue'

const firstName = ref('')
const lastName = ref('')
const email = ref('')
const phone = ref('')
const password = ref('')
const confirmPassword = ref('')
const acceptTerms = ref(false)
const showPassword = ref(false)
const isLoading = ref(false)

const emailError = computed(() => {
  if (email.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
    return 'Ingresa un email válido'
  }
  return ''
})

const passwordError = computed(() => {
  if (confirmPassword.value && password.value !== confirmPassword.value) {
    return 'Las contraseñas no coinciden'
  }
  return ''
})

const isFormValid = computed(() => {
  return firstName.value &&
         lastName.value &&
         email.value &&
         phone.value &&
         password.value.length >= 8 &&
         password.value === confirmPassword.value &&
         acceptTerms.value &&
         !emailError.value
})

const handleRegister = async () => {
  if (!isFormValid.value) return

  isLoading.value = true

  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 2000))

    // Redirect to dashboard
    window.location.href = '/dashboard'
  } catch (error) {
    console.error('Register error:', error)
  } finally {
    isLoading.value = false
  }
}
</script>
