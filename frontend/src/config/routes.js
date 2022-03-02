import Index from '@/pages/index.vue';
import CraftBeersNew from '@/pages/craft_beers/new.vue';
import CraftBeersIndex from '@/pages/craft_beers/index.vue';
import NotFound from '@/pages/404.vue';
import Unauthorized from '@/pages/401.vue';
import ServerError from '@/pages/500.vue';
import UsersLogin from '@/pages/users/login.vue';
import UsersRegistration from '@/pages/users/registration.vue';
import UsersDashboard from '@/pages/users/dashboard.vue';

export const routes = [
  { path: '/', component: Index },
  { path: '/craft_beers/new/', component: CraftBeersNew },
  { path: '/craft_beers', component: CraftBeersIndex },
  { path: '/users/login', component: UsersLogin },
  { path: '/users/registration', component: UsersRegistration },
  { path: '/dashboard', component: UsersDashboard },
  { path: '/401', component: Unauthorized },
  { path: '/404', component: NotFound },
  { path: '/500', component: ServerError },
];
