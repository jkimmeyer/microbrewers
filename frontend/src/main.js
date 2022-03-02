import { createApp } from 'vue';
import * as VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import { createI18n } from 'vue-i18n';
import { messages } from '@/locales/de';
import { routes } from '@/config/routes';

import App from '@/App.vue';

import '@/assets/index.css';

const router = VueRouter.createRouter({
  history: VueRouter.createWebHashHistory(),
  routes,
});

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(App);
  const i18n = createI18n({
    locale: 'de',
    fallbackLocale: 'de',
    messages,
  });

  app.use(i18n);
  app.use(router);
  app.use(VueAxios, axios);
  app.mount('#app');
});
