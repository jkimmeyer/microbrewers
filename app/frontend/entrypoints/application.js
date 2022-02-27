import { createApp } from 'vue';
import * as VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import { createI18n } from 'vue-i18n';
import { messages } from '@/locales/de';

import App from '@/App.vue';
import Index from '@/pages/index.vue';
import CraftBeersNew from '@/pages/craft_beers/new.vue';
import CraftBeersIndex from '@/pages/craft_beers/index.vue';
import UsersLogin from '@/pages/users/login.vue';
import UsersRegistration from '@/pages/users/registration.vue';

import '@/assets/index.css';

const routes = [
  { path: '/', component: Index },
  { path: '/craft_beers/new/', component: CraftBeersNew },
  { path: '/craft_beers', component: CraftBeersIndex },
  { path: '/users/login', component: UsersLogin },
  { path: '/users/registration', component: UsersRegistration },
];

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
