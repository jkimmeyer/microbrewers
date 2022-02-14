import { createApp } from 'vue'
import App from '../app.vue'
import * as VueRouter from 'vue-router'
import Index from '../pages/index.vue'
import About from '../pages/about.vue'

const routes = [
  { path: '/', component: Index },
  { path: '/about', component: About }
]

const router = VueRouter.createRouter({
  history: VueRouter.createWebHashHistory(),
  routes,
})


document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(App)
  app.use(router)
  app.mount('#app')
})
