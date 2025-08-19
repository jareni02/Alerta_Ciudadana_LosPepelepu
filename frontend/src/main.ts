import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/main.css' // tu CSS (Tailwind, etc.) si aplica

const app = createApp(App)
app.use(router)
app.mount('#app')
