<template>
  <nav
    id="navigation"
    class="flex items-center justify-between mx-16"
  >
    <h1 class="font-serif text-3xl">
      {{ $t('microbrewers') }}
    </h1>
    <ul class="flex items-center space-x-8">
      <NavigationItem
        :navigation-text="$t('navigation.shop')"
        navigation-link="/shop"
      />
      <NavigationItem
        :navigation-text="$t('navigation.brewers')"
        navigation-link="/brewers"
      />
      <template v-if="loggedIn">
        <NavigationItem
          :navigation-text="$t('navigation.profile')"
          navigation-link="/users/profile"
        />
        <NavigationItem
          :navigation-text="$t('navigation.logout')"
          @click="userLogout()"
        />
      </template>
      <template v-else>
        <NavigationItem
          :navigation-text="$t('navigation.login')"
          navigation-link="/users/login"
        />
        <NavigationItem
          :navigation-text="$t('navigation.registration')"
          navigation-link="/users/registration"
        />
      </template>
    </ul>
  </nav>
</template>

<script>
import NavigationItem from '@/components/NavigationItem.vue';
import { useAuth } from '@/composables/useAuth';
import { useRouter } from 'vue-router';

export default {
  components: {
    NavigationItem,
  },
  setup() {
    const { logout, user, loggedIn } = useAuth();
    const router = useRouter();

    const userLogout = () => {
      logout();
      router.push('/users/login');
    };
    return {
      userLogout,
      user,
      loggedIn,
    };
  },
};
</script>
