import Index from '@/pages/index.vue';
import CraftBeersNew from '@/pages/craft_beers/new.vue';
import CraftBeersIndex from '@/pages/craft_beers/index.vue';
import NotFound from '@/pages/404.vue';
import Unauthorized from '@/pages/401.vue';
import ServerError from '@/pages/500.vue';

export const routes = [
  { path: '/', component: Index },
  { path: '/craft_beers/new/', component: CraftBeersNew },
  { path: '/craft_beers', component: CraftBeersIndex },
  { path: '/401', component: Unauthorized },
  { path: '/404', component: NotFound },
  { path: '/500', component: ServerError },
];
