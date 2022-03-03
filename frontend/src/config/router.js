import * as VueRouter from 'vue-router';

import Index from '@/pages/index.vue';
import CraftBeersNew from '@/pages/craft_beers/new.vue';
import CraftBeersIndex from '@/pages/craft_beers/index.vue';
import NotFound from '@/pages/404.vue';
import Unauthorized from '@/pages/401.vue';
import ServerError from '@/pages/500.vue';
import UsersLogin from '@/pages/users/login.vue';
import UsersRegistration from '@/pages/users/registration.vue';
import UsersDashboard from '@/pages/users/dashboard.vue';
import Cart from '@/pages/cart.vue';

import { useAuth } from '@/composables/useAuth';

const publicRoutes = [
  { path: '/', component: Index },
  { path: '/craft_beers', component: CraftBeersIndex },
  { path: '/users/login', component: UsersLogin, meta: { redirectIfLoggedIn: true } },
  { path: '/users/registration', component: UsersRegistration, meta: { redirectIfLoggedIn: true } },
  { path: '/cart', component: Cart },
  { path: '/401', component: Unauthorized },
  { path: '/404', component: NotFound },
  { path: '/500', component: ServerError },
];

const userRoutes = [
  { path: '/dashboard', component: UsersDashboard },
];

const brewerRoutes = [
  { path: '/craft_beers/new', component: CraftBeersNew },
];

const customerRoutes = [

];

const adminRoutes = [

];

const router = VueRouter.createRouter({
  history: VueRouter.createWebHistory(),
  routes: [
    ...publicRoutes,
    ...userRoutes,
    ...brewerRoutes,
    ...customerRoutes,
    ...adminRoutes,
  ],
});

const isPublicRouteTo = (to) => (publicRoutes.map((route) => route.path)).includes(to.fullPath);

const isBrewerRouteTo = (to) => (brewerRoutes.map((route) => route.path)).includes(to.fullPath);

const isCustomerRouteTo = (to) => (customerRoutes.map((route) => route.path)).includes(to.fullPath);

const isAdminRouteTo = (to) => (adminRoutes.map((route) => route.path)).includes(to.fullPath);

const isUserRouteTo = (to) => (userRoutes.map((route) => route.path)).includes(to.fullPath);

const visitorCanAccess = (user, loggedIn, to) => {
  if (isPublicRouteTo(to)) return true;
  if (!loggedIn.value) return false;

  if (loggedIn.value && isUserRouteTo(to)) return true;

  switch (user.value.account_type) {
    case 'Brewery':
      return isBrewerRouteTo(to);
    case 'Customer':
      return isCustomerRouteTo(to);
    case 'Admin':
      return isAdminRouteTo(to);
    default:
      // TODO: Send an exception
      return false;
  }
};

router.beforeEach(async (to) => {
  const {
    validateToken, authenticating, user, loggedIn,
  } = useAuth();

  if (authenticating.value === false && loggedIn.value) {
    const canAccess = visitorCanAccess(user, loggedIn, to);

    if (!canAccess) return '/users/login';
    return true;
  }

  return validateToken().then(() => {
    if (authenticating.value === false && to.meta.redirectIfLoggedIn && loggedIn.value) {
      return '/dashboard';
    }

    const canAccess = visitorCanAccess(user, loggedIn, to);

    if (!canAccess) return '/users/login';
    return true;
  }).catch(() => '/500');
});

export {
  router,
};