import { createApp } from 'vue';
import * as VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';

import App from '../App.vue';
import Index from '../pages/index.vue';
import CraftBeersNew from '../pages/craft_beers/new.vue';

const routes = [
  { path: '/', component: Index },
  { path: '/craft_beers/new/', component: CraftBeersNew },
];

const router = VueRouter.createRouter({
  history: VueRouter.createWebHashHistory(),
  routes,
});

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(App);
  app.use(router);
  app.use(VueAxios, axios);
  app.mount('#app');
});
