<template>
  <!-- Contenido principal del reporte SIN el layout duplicado -->
  <div class="max-w-4xl mx-auto">
    <!-- Formulario de Reporte -->
    <div class="bg-white rounded-2xl p-8 border border-slate-200 shadow-sm">
      <h2 class="text-2xl font-bold text-slate-900 mb-2">Reportar Incidente</h2>
      <p class="text-slate-600 mb-6">Ayuda a mantener Xicotepec seguro reportando incidentes</p>

      <form @submit.prevent="submitReport" class="space-y-8">
        <!-- Tipo de Incidente -->
        <div>
          <label class="block text-lg font-semibold text-slate-900 mb-4">Tipo de Incidente</label>
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <button
              v-for="type in incidentTypes"
              :key="type.id"
              type="button"
              @click="selectedType = type.id"
              :class="[
                'p-4 rounded-xl border-2 transition-all text-center',
                selectedType === type.id
                  ? 'border-cyan-500 bg-cyan-50 text-cyan-700'
                  : 'border-slate-200 bg-white text-slate-600 hover:border-cyan-300 hover:bg-cyan-50'
              ]"
            >
              <div class="text-2xl mb-2">{{ type.icon }}</div>
              <div class="font-medium">{{ type.name }}</div>
            </button>
          </div>
        </div>

        <!-- Descripción -->
        <div>
          <label for="description" class="block text-lg font-semibold text-slate-900 mb-4">
            Descripción del Incidente
          </label>
          <textarea
            id="description"
            v-model="description"
            rows="4"
            required
            maxlength="500"
            class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-transparent transition-all resize-none"
            placeholder="Describe detalladamente lo que estás viendo o lo que ocurrió..."
          ></textarea>
          <p class="mt-2 text-sm text-slate-500">{{ description.length }}/500 caracteres</p>
        </div>

        <!-- Fecha y Hora -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label for="date" class="block text-lg font-semibold text-slate-900 mb-4">Fecha</label>
            <input
              id="date"
              v-model="selectedDate"
              type="date"
              :max="today"
              required
              class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-transparent transition-all"
            >
          </div>
          <div>
            <label for="time" class="block text-lg font-semibold text-slate-900 mb-4">Hora</label>
            <input
              id="time"
              v-model="selectedTime"
              type="time"
              required
              class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-transparent transition-all"
            >
          </div>
        </div>

        <!-- Ubicación -->
        <div>
          <label class="block text-lg font-semibold text-slate-900 mb-4">Ubicación</label>
          <div class="space-y-4">
            <div class="flex items-center space-x-4">
              <button
                type="button"
                @click="getCurrentLocation"
                :disabled="gettingLocation"
                class="flex items-center space-x-2 px-4 py-3 rounded-xl bg-gradient-to-r from-sky-500 to-cyan-500 text-white font-medium hover:from-sky-600 hover:to-cyan-600 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-all disabled:opacity-50"
              >
                <svg v-if="!gettingLocation" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                </svg>
                <svg v-else class="w-5 h-5 animate-spin" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                <span>{{ gettingLocation ? 'Obteniendo ubicación...' : 'Usar mi ubicación actual' }}</span>
              </button>
            </div>
            <input
              v-model="location"
              type="text"
              placeholder="O escribe la dirección manualmente..."
              class="w-full px-4 py-3 rounded-xl bg-white border border-slate-300 text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:border-transparent transition-all"
            >
          </div>
        </div>

        <!-- Foto -->
        <div>
          <label class="block text-lg font-semibold text-slate-900 mb-4">Evidencia Fotográfica (Opcional)</label>
          <div class="border-2 border-dashed border-slate-300 rounded-xl p-8 text-center hover:border-sky-400 transition-all bg-white">
            <input
              ref="fileInput"
              type="file"
              accept="image/*"
              capture="environment"
              @change="handleFileUpload"
              class="hidden"
            >
            <div v-if="!selectedFile" @click="fileInput?.click()" class="cursor-pointer">
              <svg class="w-12 h-12 mx-auto mb-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"></path>
              </svg>
              <p class="text-slate-700 font-medium mb-2">Toca para tomar una foto</p>
              <p class="text-slate-500 text-sm">O selecciona una imagen de tu galería</p>
            </div>
            <div v-else class="space-y-4">
              <img :src="filePreview" alt="Preview" class="max-w-xs mx-auto rounded-xl">
              <div class="flex items-center justify-center space-x-4">
                <button
                  type="button"
                  @click="fileInput?.click()
                  "
                  class="px-4 py-2 rounded-xl bg-cyan-50 text-cyan-700 border border-cyan-200 hover:bg-cyan-100 transition-all"
                >
                  Cambiar foto
                </button>
                <button
                  type="button"
                  @click="removeFile"
                  class="px-4 py-2 rounded-xl bg-rose-50 text-rose-700 border border-rose-200 hover:bg-rose-100 transition-all"
                >
                  Eliminar
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Botones de acción -->
        <div class="flex items-center justify-between pt-6 border-t border-slate-200">
          <button
            type="button"
            @click="saveDraft"
            class="px-6 py-3 rounded-xl bg-slate-100 text-slate-700 border border-slate-300 hover:bg-slate-200 transition-all"
          >
            Guardar Borrador
          </button>
          <div class="flex items-center space-x-4">
            <button
              type="button"
              @click="goBack"
              class="px-6 py-3 rounded-xl bg-slate-100 text-slate-700 border border-slate-300 hover:bg-slate-200 transition-all"
            >
              Cancelar
            </button>
            <button
              type="submit"
              :disabled="!isFormValid || isSubmitting"
              class="px-8 py-3 rounded-xl bg-gradient-to-r from-sky-500 to-cyan-500 text-white font-semibold hover:from-sky-600 hover:to-cyan-600 focus:outline-none focus:ring-2 focus:ring-sky-500 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <span v-if="!isSubmitting">Enviar Reporte</span>
              <span v-else class="flex items-center">
                <svg class="animate-spin -ml-1 mr-3 h-5 w-5" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Enviando...
              </span>
            </button>
          </div>
        </div>
      </form>
    </div>

    <!-- Modal de confirmación -->
    <div v-if="showConfirmation" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
      <div class="bg-white rounded-2xl p-8 border border-slate-200 shadow-xl max-w-md mx-4">
        <div class="text-center">
          <div class="w-16 h-16 mx-auto mb-4 rounded-full bg-gradient-to-r from-emerald-500 to-emerald-400 flex items-center justify-center">
            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
            </svg>
          </div>
          <h3 class="text-xl font-bold text-slate-900 mb-2">¡Reporte Enviado!</h3>
          <p class="text-slate-600 mb-6">Tu reporte ha sido enviado exitosamente. Las autoridades han sido notificadas.</p>
          <button
            @click="closeConfirmation"
            class="w-full py-3 px-4 rounded-xl bg-gradient-to-r from-sky-500 to-indigo-500 text-white font-semibold hover:from-sky-600 hover:to-indigo-600 transition-all"
          >
            Continuar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>



<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// Datos del formulario
const selectedType = ref('')
const description = ref('')
const selectedDate = ref('')
const selectedTime = ref('')
const location = ref('')

// Archivos
const fileInput = ref<HTMLInputElement | null>(null)
const selectedFile = ref<File | null>(null)
const filePreview = ref('')

// Estados
const gettingLocation = ref(false)
const isSubmitting = ref(false)
const showConfirmation = ref(false)

// Tipos de incidente
const incidentTypes = [
  { id: 'atropellamiento', name: 'Atropellamiento', icon: '🚗' },
  { id: 'robo', name: 'Robo', icon: '💰' },
  { id: 'accidente', name: 'Accidente', icon: '⚠️' },
  { id: 'vandalismo', name: 'Vandalismo', icon: '🔨' },
  { id: 'violencia', name: 'Violencia', icon: '👊' },
  { id: 'drogas', name: 'Drogas', icon: '💊' },
  { id: 'incendio', name: 'Incendio', icon: '🔥' },
  { id: 'otro', name: 'Otro', icon: '❓' }
]

// Fecha actual
const today = new Date().toISOString().split('T')[0]

// Validación del formulario
const isFormValid = computed(() => {
  return (
    selectedType.value &&
    description.value.trim() &&
    selectedDate.value &&
    selectedTime.value &&
    location.value.trim()
  )
})

// Inicializar fecha y hora
onMounted(() => {
  const now = new Date()
  selectedDate.value = now.toISOString().split('T')[0]
  selectedTime.value = now.toTimeString().slice(0, 5)
})

// Obtener ubicación actual
const getCurrentLocation = () => {
  if (!navigator.geolocation) {
    alert('Geolocalización no soportada en tu navegador')
    return
  }

  gettingLocation.value = true
  navigator.geolocation.getCurrentPosition(
    (position) => {
      const { latitude, longitude } = position.coords
      location.value = `Lat: ${latitude.toFixed(6)}, Long: ${longitude.toFixed(6)}`
      gettingLocation.value = false
    },
    (error) => {
      console.error('Error obteniendo ubicación:', error)
      alert('No se pudo obtener la ubicación. Por favor ingrésala manualmente.')
      gettingLocation.value = false
    }
  )
}

// Manejar subida de archivo
const handleFileUpload = (event: Event) => {
  const input = event.target as HTMLInputElement
  if (!input.files?.length) return

  const file = input.files[0]
  selectedFile.value = file

  const reader = new FileReader()
  reader.onload = (e) => {
    filePreview.value = e.target?.result as string
  }
  reader.readAsDataURL(file)
}

// Eliminar archivo
const removeFile = () => {
  selectedFile.value = null
  filePreview.value = ''
  if (fileInput.value) fileInput.value.value = ''
}

// Guardar borrador
const saveDraft = () => {
  const draft = {
    type: selectedType.value,
    description: description.value,
    date: selectedDate.value,
    time: selectedTime.value,
    location: location.value,
    file: filePreview.value
  }
  localStorage.setItem('incidentDraft', JSON.stringify(draft))
  alert('Borrador guardado exitosamente')
}

// Enviar reporte
const submitReport = async () => {
  if (!isFormValid.value) return

  isSubmitting.value = true

  // Simular envío a API
  await new Promise(resolve => setTimeout(resolve, 1500))

  // Resetear formulario
  selectedType.value = ''
  description.value = ''
  location.value = ''
  removeFile()

  // Mostrar confirmación
  showConfirmation.value = true
  isSubmitting.value = false
}

// Cerrar modal de confirmación
const closeConfirmation = () => {
  showConfirmation.value = false
  router.push({ name: 'dashboard' })
}

// Volver al dashboard
const goBack = () => {
  router.push({ name: 'dashboard' })
}
</script>
